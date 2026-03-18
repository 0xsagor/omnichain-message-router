// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import { OApp, Origin, MessagingFee } from "@layerzerolabs/lz-evm-oapp-v2/contracts/oapp/OApp.sol";
import { MessagingReceipt } from "@layerzerolabs/lz-evm-oapp-v2/contracts/oapp/OAppSender.sol";

contract Messenger is OApp {
    // The latest message received from another chain
    string public lastMessage;

    constructor(address _endpoint, address _owner) OApp(_endpoint, _owner) {}

    /**
     * @notice Sends a message to a destination chain.
     * @param _dstEid Destination endpoint ID.
     * @param _message The string to send.
     * @param _options Messaging options (e.g., gas limits).
     */
    function send(
        uint32 _dstEid,
        string calldata _message,
        bytes calldata _options
    ) external payable returns (MessagingReceipt memory receipt) {
        bytes memory payload = abi.encode(_message);
        receipt = _lzSend(_dstEid, payload, _options, MessagingFee(msg.value, 0), payable(msg.sender));
    }

    /**
     * @notice Internal function to handle the message on the receiving chain.
     */
    function _lzReceive(
        Origin calldata /*_origin*/,
        bytes32 /*_guid*/,
        bytes calldata payload,
        address /*_executor*/,
        bytes calldata /*_extraData*/
    ) internal override {
        lastMessage = abi.decode(payload, (string));
    }

    /**
     * @notice Fetch the estimated gas cost for the cross-chain message.
     */
    function quote(
        uint32 _dstEid,
        string calldata _message,
        bytes calldata _options,
        bool _payInLzToken
    ) public view returns (MessagingFee memory fee) {
        bytes memory payload = abi.encode(_message);
        fee = _quote(_dstEid, payload, _options, _payInLzToken);
    }

    // Allow the contract to receive ETH for gas payments
    receive() external payable {}
}
