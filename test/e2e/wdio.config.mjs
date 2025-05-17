import { getCapabilities } from './src/capability/index.js'
import { loadEnv } from './src/utils.js'

loadEnv()

const serverUrl = new URL('http://127.0.0.1:4723/wd/hub')

export const config = {
  runner: 'local',

  host: serverUrl.hostname,
  port: parseInt(serverUrl.port),
  path: serverUrl.pathname,

  framework: "mocha",
  mochaOpts: {
    ui: 'bdd',
    timeout: 60_000,
    require: [
      './src/setup/mocha.js',
    ],
  },

  services: [
    [
      'appium',
      {
        args: {
          address: serverUrl.hostname,
          port: serverUrl.port,
          basePath: serverUrl.pathname,
          allowInsecure: 'adb_shell',
        },
      },
    ]
  ],

  maxInstances: 1,

  capabilities: getCapabilities(),

  specs: [
    // './src/specs/prepare.js',
    './src/specs/**/*.spec.js',
  ],

  logLevel: 'warn',
  bail: 0,
  waitforTimeout: 30_000,
  connectionRetryTimeout: 120_000,
  connectionRetryCount: 3,

  reporters: ['spec'],

  before: async () => {
    // await Promise.all(
    //   [
    //     disableGboardHandWritingIfNeeded(),
    //     applyThemeMode(),
    //     enableDemoMode(),
    //   ]
    // )

    // await ensureAppOpened()
  }
}
