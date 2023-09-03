//SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

/**
 * @title Sample Raffle Contract
 * @author Sardius
 * @notice This contract is for creating a sample raffle
 * @dev Implements Chainlink VRF2
 */

contract Raffle {
    // Custom errors are more gas efficient than standard revert
    /**Error naming convention
     * Prefix the error with the name of the contract
     */
    error Raffle__NotEnoughEthSent();
    
    // State Variables
    uint256 private immutable = i_entranceFee;
    // @dev Duration of the lottery in seconds
    uint256 private immutable = i_interval;
    // Payable dynamic array allows us to pay out the winner
    address payable[] private s_players;
    uint256 private s_lastTimeStamp;

    // Events
    event EnteredRaffle(address indexed player, uint256 indexed entranceFee);
    

    constructor(uint256 entranceFee, uint256 interval) {
        i_entranceFee = entranceFee;
        i_interval = interval;
        s_lastTimeStamp = block.timestamp;
    }

    function enterRaffle() external payable {
        // require(msg.value >= i_entranceFee, "Not enough ETH sent");\
        if (msg.value < i_entranceFee) {
            revert NotEnoughEthSent();
        }
        s_players.push(payable(msg.sender));
        emit EnteredRaffle(msg.sender, msg.value);

    }   

    //1. Get a random number
    //2. Use a random number to pick a player
    //3. Be automatically called
    function pickWinner() external {
        // Check to see if enough time has passed
        if ((block.timestamp - lastTimestamp) < i_interval) {
            revert();
        }
    }

    /** Getter Functions */

    function getEntranceFee() public view returns (uint256) {
        return i_entranceFee;
    }
}
