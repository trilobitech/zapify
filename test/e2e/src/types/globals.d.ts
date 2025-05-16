/// <reference types="webdriverio,mocha" />

declare const driver: WebdriverIO.Browser;
declare const $: typeof driver.$;
declare const $$: typeof driver.$$;

declare namespace Mocha {
  interface TestFunction {
    onlyIf(condition: boolean, title: string, fn: Func | AsyncFunc): Test;
  }

  interface SuiteFunction {
    onlyIf(condition: boolean, title: string, fn: (this: Mocha.Suite) => void): Mocha.Suite | Mocha.PendingSuiteFunction | void;
  }
}
