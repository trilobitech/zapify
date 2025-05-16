import { platformNames } from "../utils"

class HomeScreen {
  get title() {
    return $('~Zapify')
  }

  /**
   * @returns {import("webdriverio").ChainablePromiseElement}
   */
  get phoneNumberField() {
    throw Error('Not implemented!')
  }

  /**
   * @returns {import("webdriverio").ChainablePromiseElement}
   */
  get phoneNumberFieldPrefix() {
    throw Error('Not implemented!')
  }

  /**
   * @returns {import("webdriverio").ChainablePromiseElement}
   */
  historicItem(/** @type {Number} */ position) {
    throw Error('Not implemented!')
  }
}

class AndroidHomeScreen extends HomeScreen {
  get phoneNumberField() {
    return $('//android.widget.EditText[@resource-id="PhoneNumberField"]')
  }

  get phoneNumberFieldPrefix() {
    return $('//android.widget.Button[@resource-id="PhoneNumberRegionPicker"]')
  }

  historicItem(/** @type {Number} */ position) {
    return $(`//android.view.View[@resource-id="HistoricList"]/android.view.View/android.view.View/android.view.View[${position}]`)
  }
}

class IosHomeScreen extends HomeScreen { }

/**
 * @param {string} platformName
 *
 * @returns {HomeScreen}
 */
export function homeScreenFactory(platformName) {
  switch (platformName) {
    case platformNames.ANDROID:
      return new AndroidHomeScreen()
    case platformNames.IOS:
      return new IosHomeScreen()
    default:
      throw Error(`Platform ${platformName} not supported!`)
  }
}
