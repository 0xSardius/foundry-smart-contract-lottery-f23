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
    uint256 private constant REQUEST_CONFIRMATIONS = 3;
    uint256 private constant NUM_WORDS = 1;

    uint256 private immutable = i_entranceFee;
    // @dev Duration of the lottery in seconds
    uint256 private immutable = i_interval;
    address private immutable = i_vrfCoordinator;
    bytes32 private immutable = i_gasLane;
    uint64 private immutable = i_subscriptionId;
    uint32 private immutable = i_callbackGasLimit;


    // Payable dynamic array allows us to pay out the winner
    address payable[] private s_players;
    uint256 private s_lastTimeStamp;

    // Events
    event EnteredRaffle(address indexed player, uint256 indexed entranceFee);
    

    constructor(uint256 entranceFee, 
    uint256 interval, address vrfCoordinator, bytes32 gasLane, uint64 subscriptionId, uint32 callbackGasLimit, uint8 numWords) {
        i_entranceFee = entranceFee;
        i_interval = interval;
        i_vrfCoordinator = vrfCoordinator;
        i_gasLane = gasLane;
        i_subscriptionId = subscriptionId;
        i_callbackGasLimit = callbackGasLimit;
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
        // 1. Request the RNG
        // 2. Get the random number
        uint256 requestId = i_vrfCoordinator.requestRandomWords(
            keyHash, //gasLane
            s_subscriptionId, //ID you've funded with link
            REQUEST_CONFIRMATIONS,
            callbackGasLimit,
            NUM_WORDS
        );
    }

    /** Getter Functions */

    function getEntranceFee() public view returns (uint256) {
        return i_entranceFee;
    }
}
