var AMLContract = artifacts.require("AML");

module.exports = function(deployer) {
    deployer.deploy(AMLContract);
}