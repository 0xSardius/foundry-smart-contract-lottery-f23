//SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

/**
 * @title Sample Raffle Contract
 * @author Sardius
 * @notice This contract is for creating a sample raffle
 * @dev Implements Chainlink VRF2
 */

contract Raffle {
    uint256 private entranceFee;

    function enterRaffle() public payable {}

    function pickWinner() public {}
}
