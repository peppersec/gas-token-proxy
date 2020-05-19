const PersonalProxy = artifacts.require("PersonalProxy");
const gasToken = {
  kovan: '0x0000000000170CcC93903185bE5A2094C870Df62',
  mainnet: '0x0000000000b3F879cb30FE243b4Dfee438691c04',
  rinkeby: '0x0000000000b3F879cb30FE243b4Dfee438691c04',
  ropsten: '0x0000000000b3F879cb30FE243b4Dfee438691c04',
}

const etherscan = {
  kovan: 'kovan.',
  mainnet: '',
  rinkeby: 'rinkeby.',
  ropsten: 'ropsten.',
}

module.exports = function(deployer) {
  const GST2 = gasToken[deployer.network]
  deployer.deploy(PersonalProxy, GST2);
  console.log(`Don't forget to send GST2 token to the contract
  https://${etherscan[deployer.network]}etherscan.io/address/${GST2}#writeContract`)
};
