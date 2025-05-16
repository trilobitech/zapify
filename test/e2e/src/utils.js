import * as fakers from '@faker-js/faker'
import { phone } from 'phone'
import path from 'node:path'
import fs from 'node:fs/promises'
import fsSync from 'node:fs'
import _ from 'lodash'
import { execSync } from 'node:child_process'
import dotenv from 'dotenv'

const defaultEnvFilename = '.env.default'

function findProjectRootDirectory() {
  // @ts-ignore
  let currentDir = import.meta.dirname

  while (true) {
    const defaultEnvFile = path.join(currentDir, defaultEnvFilename)
    if (fsSync.existsSync(defaultEnvFile)) {
      return currentDir
    }

    if (currentDir == '/') break;
    currentDir = path.dirname(currentDir)
  }

  throw `File ${defaultEnvFilename} not found!`
}

export const rootDirectory = findProjectRootDirectory()

export const platformNames = {
  ANDROID: 'Android',
  IOS: 'iOS',
}

export function loadEnv() {
  const defaultEnvFile = path.join(rootDirectory, defaultEnvFilename)
  const customEnvFile = path.join(rootDirectory, '.env')

  let envFiles = [defaultEnvFile]

  if (fsSync.existsSync(customEnvFile)) {
    envFiles = [...envFiles, customEnvFile]
  }

  dotenv.config({
    path: envFiles,
  })
}

/**
 * @param {number} ms
 */
export function delay(ms) {
  return new Promise(resolve => setTimeout(resolve, ms))
}

export function localizedFaker() {
  const languageCode = driver.capabilities['language']
  const countryCode = driver.capabilities['locale']
  const locale = `${languageCode}_${countryCode}`

  /** @type {import('@faker-js/faker').Faker} **/
  const faker = fakers[`faker${locale.toUpperCase()}`] || fakers[`faker${countryCode}`]

  return faker
}

/**
 * @param {string} phoneNumber
 */
export function validatePhoneNumber(phoneNumber) {
  return phone(
    phoneNumber,
    {
      country: null,
      validateMobilePrefix: false,
    },
  )
}

/**
 * @param {string} phoneNumber
 */
export function dialCodeFromNumber(phoneNumber) {
  return validatePhoneNumber(phoneNumber).countryCode
}


/**
 * @param {any[]} arrays
 */
export function combineObjects(arrays) {
  return _.reduce(arrays, (acc, curr) => {
    return _.flatMap(acc, a =>
      curr.map((/** @type {any} */ b) => ({ ...a, ...b }))
    );
  }, [{}]);
}


/**
 * @param {import("webdriverio").ChainablePromiseElement} element
 */
export async function scrollAndFindElement(element, maxScrolls = 30) {
  for (let i = 0; i < maxScrolls; i++) {
    if (await element.isExisting() && await element.isDisplayed()) {
      return element
    }

    await swipeUp()
  }

  throw new Error(`Element ${element} found after ${maxScrolls} scrolls`)
}

export async function swipeUp() {
  const { height, width } = await driver.getWindowRect()

  const startX = Math.floor(width / 2)
  const startY = Math.floor(height * 0.9)
  const endY = Math.floor(height * 0.15)

  await driver.performActions([{
    type: 'pointer',
    id: 'finger1',
    parameters: { pointerType: 'touch' },
    actions: [
      { type: 'pointerMove', duration: 0, x: startX, y: startY },
      { type: 'pointerDown', button: 0 },
      { type: 'pause', duration: 150 },
      { type: 'pointerMove', duration: 500, x: startX, y: endY },
      { type: 'pause', duration: 150 },
      { type: 'pointerUp', button: 0 },
    ]
  }])

  // necessary to clear actions after performActions
  await driver.releaseActions()
}

/**
 * @param {string} name
 */
export async function takeScreenshot(name) {
  const platformName = driver.capabilities['platformName'].toLowerCase()
  const languageCode = driver.capabilities['language']
  const countryCode = driver.capabilities['locale']
  const locale = `${languageCode}-${countryCode}`

  const themeMode = driver.capabilities['custom:themeMode']

  const destinationPath = path.join(
    '..',
    '..',
    'screenshots',
    platformName,
    locale,
    themeMode,
    `${name}.png`,
  )

  const dirname = path.dirname(destinationPath)
  await fs.mkdir(dirname, { recursive: true })

  await driver.saveScreenshot(destinationPath)
}

/**
 * Set Android system night mode using `cmd uimode night` command via Appium shell.
 *
 * @param {'light' | 'dark' | 'auto'} mode - Desired theme mode
 */
export async function setThemeMode(mode) {
  const cmdArg = {
    dark: 'yes',
    light: 'no',
    auto: 'auto',
  }[mode]

  if (!cmdArg) {
    throw new Error(`Invalid theme mode "${mode}". Use 'light', 'dark', or 'auto'.`)
  }

  await driver.execute('mobile: shell', {
    command: 'cmd',
    args: ['uimode', 'night', cmdArg],
  })
}

/**
 * Check if Gboard handwriting via stylus is enabled.
 * Returns false if disabled or not set.
 */
export function isGboardHandWritingEnabled() {
  try {
    const output = execSync(
      'adb shell settings get secure stylus_handwriting_enabled',
      { encoding: 'utf8' },
    ).trim()

    return ['null', '1', 'true', ''].includes(output.toLowerCase())
  } catch (error) {
    console.error('Failed to check Gboard handwriting setting:', error)
    return false
  }
}

/**
 * Disable Gboard handwriting via stylus.
 */
export function notifyGboardHandWritingDisabled() {
  try {
    execSync(
      'adb shell settings put secure stylus_handwriting_enabled false',
      { stdio: 'ignore' },
    )
    console.log('✅ Gboard handwriting disabled.')
  } catch (error) {
    console.error('❌ Failed to disable Gboard handwriting:', error)
    throw error
  }
}

/**
 * Attempts to close the current Android activity by sending BACK events
 * until the activity changes or max retries are reached.
 *
 * @param {number} maxTries - Maximum number of back attempts
 * @param {number} delay - Delay between attempts (ms)
 */
export async function closeTopActivity(maxTries = 5, delay = 300) {
  const originalActivity = await driver.getCurrentActivity();

  for (let i = 0; i < maxTries; i++) {
    await driver.back();

    await driver.pause(delay); // wait a bit for the transition

    const currentActivity = await driver.getCurrentActivity();

    if (currentActivity !== originalActivity) {
      console.log(`✔ Activity closed: "${originalActivity}" → "${currentActivity}"`);
      return true;
    }
  }

  console.warn(`⚠ Could not close activity "${originalActivity}" after ${maxTries} attempts`);
  return false;
}

/**
 * @param {boolean} force
 */
export async function ensureAppOpened(force) {
  const appPackage = driver.capabilities['appPackage']
  const appActivity = driver.capabilities['appActivity']

  const currentActivity = await driver.getCurrentActivity()
  const currentPackage = await driver.getCurrentPackage()

  if (force || appPackage != currentPackage || appActivity != currentActivity) {
    await driver.startActivity(
      driver.capabilities['appPackage'],
      driver.capabilities['appActivity'],
    )
  }
}
