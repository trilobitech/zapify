import { isGboardHandWritingEnabled, notifyGboardHandWritingDisabled, closeTopActivity, delay, setThemeMode } from '../utils.js'
import { execSync } from 'node:child_process'

export async function disableGboardHandWritingIfNeeded() {
  if (!isGboardHandWritingEnabled()) {
    console.log('Gboard hand writing is already disabled')
    return
  }

  console.log('Gboard hand writing is enabled, trying to disable it')
  const elements = {
    settingsScreen: $('//android.widget.ScrollView'),
    stylusOption: $('//android.support.v7.widget.RecyclerView/android.widget.LinearLayout[7]'),
    stylusEnableToogle: $('//android.widget.Switch'),
  }

  await driver.startActivity(
    'com.google.android.inputmethod.latin',
    'com.google.android.apps.inputmethod.latin.preference.SettingsActivity',
  )

  await elements.settingsScreen.waitForDisplayed()
  await elements.stylusOption.click()

  const isChecked = "true" == await elements.stylusEnableToogle.getAttribute('checked')
  if (isChecked) {
    await elements.stylusEnableToogle.tap()
    await driver.pause(1_000)
  }

  notifyGboardHandWritingDisabled()

  await closeTopActivity()
  await delay(1_000)
}

export async function enableDemoMode() {
  execSync('android-demo-mode on 0720 > /dev/null')
}

export async function applyThemeMode() {
  await setThemeMode(driver.capabilities['custom:themeMode'])
}
