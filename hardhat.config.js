require("@nomicfoundation/hardhat-toolbox");

module.exports = {
  solidity: "0.8.20",
  networks: {
    base_mainnet: {
      url: "https://mainnet.base.org",
      accounts: [process.env.PRIVATE_KEY || ""],
    },
    arbitrum_mainnet: {
      url: "https://arb1.arbitrum.io/rpc",
      accounts: [process.env.PRIVATE_KEY || ""],
    }
  }
};
