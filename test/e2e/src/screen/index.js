import { homeScreenFactory } from "./home"
import { regionPickerScreenFactory } from "./region_picker"

export class AppScreens {
  constructor() {
    this.platformName = driver.capabilities.platformName
  }

  get home() {
    return homeScreenFactory(this.platformName)
  }

  get regionPicker() {
    return regionPickerScreenFactory(this.platformName)
  }
}
