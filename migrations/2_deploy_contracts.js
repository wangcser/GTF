const MyFT = artifacts.require("MyFungibleToken");

module.exports = function(deployer) {
  deployer.deploy(MyFT);
};
