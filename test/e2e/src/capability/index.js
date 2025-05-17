import { platformNames } from '../utils.js'
import { allCapabilities } from './all.js'

export function getCapabilities() {
  const platformName = process.env['APPIUM_OS'] = process.env['APPIUM_OS'] || platformNames.ANDROID

  const capabilities = allCapabilities
    .filter(opts => opts.platformName == platformName || platformName == 'all')

  if (capabilities.length == 0) {
    throw new Error(`Options for ${platformName} not found!`)
  }

  return capabilities
}
