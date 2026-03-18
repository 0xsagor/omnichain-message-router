# Omnichain Message Router

This repository provides a production-ready template for **Cross-Chain Messaging** using LayerZero V2. It allows a smart contract on a "Source" chain to trigger logic or pass data to a "Destination" chain seamlessly.

## Key Features
* **LayerZero V2 Integration:** Utilizes the latest `OApp` (Omnichain Application) standard.
* **Simplified Messaging:** Single function call to send data across chains.
* **Gas Abstraction:** Pay for the destination chain's execution in the source chain's native gas token.

## How to Use
1. **Setup:** Define the endpoint ID for your target chain (e.g., Arbitrum, Polygon, Avalanche).
2. **Quote:** Call `quote()` to see how much native gas is required for the cross-chain jump.
3. **Send:** Call `send()` to broadcast your message.
4. **Receive:** The `_lzReceive` internal function handles the incoming data on the destination chain.

## Deployment
Each contract must be deployed on both the source and destination chains, and then "wired" together using LayerZero's `setPeer` configuration.
