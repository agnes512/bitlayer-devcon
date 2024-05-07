require("@nomicfoundation/hardhat-toolbox");
require("@nomiclabs/hardhat-ethers");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.24",
  defaultNetwork: "amoy",
  networks: {
    amoy: {
      url: "https://virulent-patient-tab.matic-amoy.quiknode.pro/9617a5e6ac88f5bc939bae19a7b55633bc7a6905/",
      accounts: ["PRIVATE_KEY"],
    },
  },
};
