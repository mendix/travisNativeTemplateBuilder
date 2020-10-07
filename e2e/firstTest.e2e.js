const element = require("detox").element

describe('Example', () => {
  beforeEach(async () => {
    await device.reloadReactNative();
  });

  it("shall pass ", () => {
    expect(element(by.id(`badge1$caption`))).toBeVisible();
  });
});
