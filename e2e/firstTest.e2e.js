const detox = require("detox")

describe('Example', () => {
  beforeEach(async () => {
    await detox.device.reloadReactNative();
  });

  it("shall pass ", () => {
    expect(detox.element(detox.by.id(`badge1$caption`))).toBeNotVisible();
  });
});
