const ConvertLib = artifacts.require("ConvertLib");
const MetaCoin = artifacts.require("MetaCoin");
const SafeMath= artifacts.require("SafeMath");
const ITokenCore = artifacts.require("ITokeCore");
const FungibleToken = artifacts.require("FungibleToken");
const MyFT = artifacts.require("MyFungibleToken");

module.exports = function(deployer) {
  deployer.deploy(ConvertLib);
  deployer.link(ConvertLib, MetaCoin);
  deployer.deploy(MetaCoin);

  // deployer.deploy(SafeMath);
  // deployer.deploy(ITokenCore);
  // deployer.link(SafeMath, ITokenCore, FungibleToken);

  // deployer.deploy(FungibleToken);
  // deployer.link(FungibleToken, MyFT);
  // deployer.deploy(MyFT);
};
