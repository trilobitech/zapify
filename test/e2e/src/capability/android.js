import path from 'node:path'
import { platformNames, rootDirectory } from '../utils.js'

export const androidCapabilities = {
  platformName: platformNames.ANDROID,
  'appium:deviceName': 'emulator-5554',
  'appium:automationName': 'UiAutomator2',
  'appium:app': path.resolve(rootDirectory, 'build', 'app', 'outputs', 'flutter-apk', 'app-profile.apk'),
  'appium:appPackage': 'com.zapfy.app.dev',
  'appium:appActivity': 'com.trilobitech.zapify.MainActivity',
}
