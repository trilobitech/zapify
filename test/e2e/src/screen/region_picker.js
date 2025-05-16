import { platformNames } from "../utils"

class RegionPickerScreen {
  /**
  * @returns {import("webdriverio").ChainablePromiseElement}
  */
  get regionSearchField() {
    throw Error('Not implemented!')
  }

  /**
  * @returns {import("webdriverio").ChainablePromiseElement}
  */
  regionItem(/** @type {string} */ countryCode, /** @type {string} */ dialCode) {
    throw Error('Not implemented!')
  }
}

class AndroidRegionPickerScreen extends RegionPickerScreen {
  get regionSearchField() {
    return $('//android.widget.EditText[@resource-id="RegionSearchField"]')
  }

  regionItem(/** @type {string} */ countryCode, /** @type {string} */ dialCode) {
    return $(`//android.widget.Button[@resource-id="${countryCode} ${dialCode}"]`)
  }
}

class IosRegionPickerScreen extends RegionPickerScreen { }

/**
 * @param {string} platformName
 *
 * @returns {RegionPickerScreen}
 */
export function regionPickerScreenFactory(platformName) {
  switch (platformName) {
    case platformNames.ANDROID:
      return new AndroidRegionPickerScreen()
    case platformNames.IOS:
      return new IosRegionPickerScreen()
    default:
      throw Error(`Platform ${platformName} not supported!`)
  }
}
