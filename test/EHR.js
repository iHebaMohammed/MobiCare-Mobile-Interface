var EHR = artifacts.require("./EHR.sol");

contract("EHR", function (accounts) {
  it("should assert true", async function () {
    EHR.deployed()
        .then(() => assert.isTrue(true))
        .catch(() => assert.isTrue(false))
  })

  it("should add record", async function () {
    const EHR_instance = await EHR.deployed()

    await EHR_instance.addRecord(
      "1st",
      accounts[1]
    )

    await EHR_instance.addRecord(
      "2nd",
      accounts[1]
    )

    return assert.isTrue(true)
  })

  it("should retrieve records of a patient", async function () {
    const EHR_instance = await EHR.deployed()

    records = await EHR_instance.getRecords(accounts[1])

    console.log({ records })
    return records
  })
})


/*

pragma solidity ^0.4.2;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/MetaCoin.sol";

contract TestMetacoin {

  function testInitialBalanceUsingDeployedContract() {
    MetaCoin meta = MetaCoin(DeployedAddresses.MetaCoin());

    uint expected = 10000;

    Assert.equal(meta.getBalance(tx.origin), expected, "Owner should have 10000 MetaCoin initially");
  }

  function testInitialBalanceWithNewMetaCoin() {
    MetaCoin meta = new MetaCoin();

    uint expected = 10000;

    Assert.equal(meta.getBalance(tx.origin), expected, "Owner should have 10000 MetaCoin initially");
  }

}


var MetaCoin = artifacts.require("./MetaCoin.sol");

contract('MetaCoin', function (accounts) {
  it("should put 10000 MetaCoin in the first account", function () {
    return MetaCoin.deployed().then(function (instance) {
      return instance.getBalance.call(accounts[0]);
    }).then(function (balance) {
      assert.equal(balance.valueOf(), 10000, "10000 wasn't in the first account");
    });
  });
  it("should call a function that depends on a linked library", function () {
    var meta;
    var metaCoinBalance;
    var metaCoinEthBalance;

    return MetaCoin.deployed().then(function (instance) {
      meta = instance;
      return meta.getBalance.call(accounts[0]);
    }).then(function (outCoinBalance) {
      metaCoinBalance = outCoinBalance.toNumber();
      return meta.getBalanceInEth.call(accounts[0]);
    }).then(function (outCoinBalanceEth) {
      metaCoinEthBalance = outCoinBalanceEth.toNumber();
    }).then(function () {
      assert.equal(metaCoinEthBalance, 2 * metaCoinBalance, "Library function returned unexpeced function, linkage may be broken");
    });
  });

  it("should send coin correctly", function () {
    var meta;

    //    Get initial balances of first and second account.
    var account_one = accounts[0];
    var account_two = accounts[1];

    var account_one_starting_balance;
    var account_two_starting_balance;
    var account_one_ending_balance;
    var account_two_ending_balance;

    var amount = 10;

    return MetaCoin.deployed().then(function (instance) {
      meta = instance;
      return meta.getBalance.call(account_one);
    }).then(function (balance) {
      account_one_starting_balance = balance.toNumber();
      return meta.getBalance.call(account_two);
    }).then(function (balance) {
      account_two_starting_balance = balance.toNumber();
      return meta.sendCoin(account_two, amount, { from: account_one });
    }).then(function () {
      return meta.getBalance.call(account_one);
    }).then(function (balance) {
      account_one_ending_balance = balance.toNumber();
      return meta.getBalance.call(account_two);
    }).then(function (balance) {
      account_two_ending_balance = balance.toNumber();

      assert.equal(account_one_ending_balance, account_one_starting_balance - amount, "Amount wasn't correctly taken from the sender");
      assert.equal(account_two_ending_balance, account_two_starting_balance + amount, "Amount wasn't correctly sent to the receiver");
    });
  });
});

*/