const Coin = artifacts.require("Coin");
const truffleAssert = require('truffle-assertions');

contract('Coin', (accounts) => {
  it('testing of Coin', async () => {
    const c = await Coin.deployed();
    await c.mint(accounts[1], 1000);

    var result = await c.send(accounts[2], 200, {from: accounts[1]});
    truffleAssert.eventEmitted(result, 'Sent');

    result = await c.getBalance(accounts[0]);
    assert.equal(0, result.toNumber(), 'Account 0 is broke');

    result = await c.getBalance(accounts[1]);
    assert.equal(800, result.toNumber(), 'Account 1 has 800');

    result = await c.getBalance(accounts[2]);
    assert.equal(200, result.toNumber(), 'Account 2 has 200');
  });
});
