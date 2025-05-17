import assert from 'node:assert'
import { localizedFaker, dialCodeFromNumber, takeScreenshot, scrollAndFindElement, delay, platformNames } from '../utils'
import { AppScreens } from '../screen'

describe(`App testing ${driver.capabilities['language']}_${driver.capabilities['locale']}`, async () => {

  const faker = localizedFaker()
  const screens = new AppScreens()

  before(async () => {
    await driver.waitUntil(
      async () => screens.home.title.isDisplayed(),
      {
        timeout: 10_000,
        timeoutMsg: 'Zapify not displayed after activity started',
      }
    )
  })

  after(async () => {
    await delay(1_000)
  })

  it(
    `home`,
    async () => {
      await takeScreenshot(`home`)
    },
  )

  it(
    `typing phone number`,
    async () => {
      const { phoneNumberField } = screens.home

      const phoneNumber = driver.capabilities['custom:phoneNumber'] || faker.phone.number({ style: 'international' })
      await typePhoneNumber(screens, phoneNumber)

      await driver.pause(1_000)
      await takeScreenshot(`homeFilled`)

      await phoneNumberField.clearValue()
      if (driver.capabilities.platformName == platformNames.ANDROID) {
        await driver.pressKeyCode(66)
      } else if (driver.capabilities.platformName == platformNames.IOS) {
        //await $('//XCUIElementTypeButton[@name="Done"]').click()
        //screens.home.phoneNumberField.
      }
    },
  )

  it(
    'remove entry',
    async () => {
      const { historicItem } = screens.home
      const selectedHistoricItem = historicItem(2)
      await selectedHistoricItem.waitForDisplayed({ timeout: 3_000 })

      const size = await selectedHistoricItem.getSize() // { width, height }
      const location = await selectedHistoricItem.getLocation() // { x, y }

      const startX = location.x + size.width * 0.75
      const endX = location.x + size.width * 0.5
      const y = location.y + size.height / 2

      await driver.performActions([{
        type: 'pointer',
        id: 'finger1',
        parameters: { pointerType: 'touch' },
        actions: [
          { type: 'pointerMove', duration: 0, x: startX, y },
          { type: 'pointerDown', button: 0 },
          { type: 'pause', duration: 100 },
          { type: 'pointerMove', duration: 500, x: endX, y },
          { type: 'pause', duration: 100 },
        ],
      }])

      // TODO: assert if "remove placeholder" is displayed
      await takeScreenshot('homeRemoveEntry')

      await driver.performActions([{
        type: 'pointer',
        id: 'finger1',
        parameters: { pointerType: 'touch' },
        actions: [
          { type: 'pointerMove', duration: 0, x: endX, y },
          { type: 'pointerUp', button: 0 },
        ],
      }])

      // Always call releaseActions() after using performActions
      await driver.releaseActions()
      await screens.home.phoneNumberField.clearValue()
    },
  )
})

/**
 * @param {AppScreens} screens
 * @param {string} phoneNumber
 */
async function typePhoneNumber(screens, phoneNumber) {
  const { home } = screens

  const dialCode = dialCodeFromNumber(phoneNumber)
  const nationalPhoneNumber = phoneNumber.replace(dialCode, '')

  await home.phoneNumberField.waitForDisplayed({ timeout: 2_000 })
  await home.phoneNumberField.tap()
  await home.phoneNumberFieldPrefix.waitForDisplayed({ timeout: 5_000 })

  const contentDesc = (await screens.home.phoneNumberFieldPrefixLabel).replace(/^[^+]+/, '')
  if (contentDesc != dialCode) {
    await home.phoneNumberFieldPrefix.tap()
    await selectRegionPrefix(screens, dialCode)
    await home.phoneNumberField.waitForDisplayed({ timeout: 1_000 })
    await home.phoneNumberField.tap()
    await driver.pause(3_000)
  }

  await typeText(screens.home.phoneNumberField, nationalPhoneNumber)
}

/**
 * @param {AppScreens} screens
 * @param {string} dialCode
 */
async function selectRegionPrefix(screens, dialCode) {
  const { regionSearchField, regionItem } = screens.regionPicker
  const countryCode = driver.capabilities['locale']

  await regionSearchField.waitForDisplayed({ timeout: 2_000 })
  await regionSearchField.tap()
  await regionSearchField.sendKeys(`${countryCode} ${dialCode}`.split(''))
  if (driver.capabilities.platformName == platformNames.ANDROID) {
    await driver.hideKeyboard()
  }
  const selectedRegionItem = await scrollAndFindElement(
    regionItem(driver.capabilities['locale'], dialCode),
  )
  await selectedRegionItem.tap()
}

/**
 * @param {{ sendKeys: (arg0: string[]) => any; }} element
 * @param {string} text
 */
async function typeText(element, text) {
  for (let index = 0; index < text.length; index++) {
    const char = text[index];
    await element.sendKeys([char])
    await driver.pause(200)
  }
}
