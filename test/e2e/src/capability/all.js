import { combineObjects } from '../utils.js'
import { androidCapabilities } from './android.js'
import { iosCapabilities } from './ios.js'

export const allCapabilities = combineObjects([
  [
    androidCapabilities,
    iosCapabilities,
  ],
  [
    {
      'appium:noReset': false,
    }
  ],
  [
    {
      'custom:themeMode': 'dark',
    },
    {
      'custom:themeMode': 'light',
    },
  ],
  [
    {
      'appium:language': 'pt',
      'appium:locale': 'BR',
      'custom:phoneNumber': '+55 29382124432',
    },
    {
      'appium:language': 'es',
      'appium:locale': 'ES',
      'custom:phoneNumber': '+34 929228430',
    },
    {
      'appium:language': 'en',
      'appium:locale': 'US',
      'custom:phoneNumber': '+1 3742423229',
    },
  ],
])
