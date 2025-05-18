import { disableGboardHandWritingIfNeeded, applyThemeMode, enableDemoMode } from './index.js'
import { ensureAppOpened, platformNames } from '../utils.js'

console.log('Loading global hooks')

export async function mochaGlobalSetup() {
  console.log('running mochaGlobalSetup')

  await deviceSetup()

  await ensureAppOpened(false)
  await driver.pause(1_000)
}

async function deviceSetup() {
  const osDeviceUnderTesting = process.env['APPIUM_OS']
  switch (osDeviceUnderTesting) {
    case platformNames.ANDROID:
      return androidDeviceSetup()
    case platformNames.IOS:
      return iosDeviceSetup()
    default:
      throw `OS of device under test "${osDeviceUnderTesting}" not recognized`
  }
}

async function androidDeviceSetup() {
  await Promise.all(
    [
      disableGboardHandWritingIfNeeded(),
      applyThemeMode(),
      enableDemoMode(),
    ]
  )
}

async function iosDeviceSetup() {
  await Promise.all([
    applyThemeMode(),
    enableDemoMode(),
  ])
}
