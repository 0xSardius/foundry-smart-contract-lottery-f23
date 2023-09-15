# Proaveably Random Raffle Contracts

## About

This code is to create a proveably random smart contract lottery.

## What do we want it to do?

1. Users can enter by paying for a ticket
   1. THe ticket fees are going to go to the winner during the draw
2. After X period of time, the lottery will automatically draw a winner
   1. Picking the winner will be done programatically
3. Using Chainlink VRF and Chainklink Automation via Keepers
   1. Chainlink VRF -> Randomness
   2. Chainlink Automation -> Time based trigger

## Tests

1. Write some deploy scripts
2. Write our tests
   - Work on a local chain
   - Forked Testnet
   - Forked Mainnet
