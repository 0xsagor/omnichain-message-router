const { Options } = require('@layerzerolabs/lz-v2-utilities');

/**
 * Generates execution options for LayerZero V2.
 * @param gasLimit The amount of gas to provide on the destination chain.
 */
function getOptions(gasLimit = 200000) {
  return Options.newOptions().addExecutorLzReceiveOption(gasLimit, 0).toHex();
}

module.exports = { getOptions };
