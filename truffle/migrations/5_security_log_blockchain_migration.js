const SecurityLogBlockchain = artifacts.require("SecurityLogBlockchain");

module.exports = function (deployer) {
  deployer.deploy(SecurityLogBlockchain);
};
