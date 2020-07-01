const SimpleStorage = artifacts.require("SimpleStorage");
contract('SimpleStorage', (accounts) => {
  it('testing of SimpleStorage', async () => {
    const s = await SimpleStorage.deployed();

    var ret = await s.get();

    assert.equal(10, ret.toNumber(), 'Got the default value back');

    await s.set(100);

    ret = await s.get();

    assert.equal(100, ret.toNumber(), 'Got the new value back');
  });
});
