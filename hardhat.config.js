require("@nomiclabs/hardhat-waffle");
require('dotenv').config();
require("@nomiclabs/hardhat-etherscan")
require("hardhat-gas-reporter");
require("@nomiclabs/hardhat-ethers");
require("./tasks/ticketTasks.js");
// This is a sample Hardhat task. To learn how to create your own go to
// https://hardhat.org/guides/create-task.html
task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
});

// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  solidity: "0.8.4",

  networks:{
    rinkeby: {
      url: process.env.ALCHEMY_RINKEBY,
      accounts: [process.env.PRIVATE_KEY, process.env.PRIVATE_KEY_ALICE],
      gas: "auto",
    },
    goerli: {
      url: process.env.ALCHEMY_GOERLI,
      accounts: [process.env.PRIVATE_KEY, process.env.PRIVATE_KEY_ALICE],
      gas: "auto",
    }
  },

  etherscan: {
    apiKey: process.env.ETHERSCAN_API
  },

  gasReporter: {
    enabled: true,
    currency: "ETH",
    coinmarketcap: process.env.COINMARKETCAP_API_KEY,
  }
};
