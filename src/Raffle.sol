//SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

/**
 * @title Sample Raffle Contract
 * @author Sardius
 * @notice This contract is for creating a sample raffle
 * @dev Implements Chainlink VRF2
 */

contract Raffle {
    uint256 private immutable = i_entranceFee;

    constructor(uint256 entranceFee) {
        i_entranceFee = entranceFee;
    }

    function enterRaffle() external payable {
        require(msg.value >= i_entranceFee, "Not enough ETH sent");\
        
        
    }   

    function pickWinner() public {}

    /** Getter Functions */

    function getEntranceFee() public view returns (uint256) {
        return i_entranceFee;
    }
}
