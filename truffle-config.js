module.exports = {
  // Uncommenting the defaults below 
  // provides for an easier quick-start with Ganache.
  // You can also follow this format for other networks;
  // see <http://truffleframework.com/docs/advanced/configuration>
  // for more details on how to specify configuration options!
  
  networks: {
    development: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "*"
    },
    test: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "*"
    }
  },

  // coverage: {
  //   host: 'localhost',
  //   network_id: '*', // eslint-disable-line camelcase
  //   port: 8555,
  //   gas: 0xfffffffffff,
  //   gasPrice: 0x01,
  // },
  
  compilers: {
    solc: {
      version: "0.5.8",
      optimizer: {
        enabled: true,
        runs: 200
      }
    }
  }
};
