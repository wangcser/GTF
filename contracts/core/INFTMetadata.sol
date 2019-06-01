pragma solidity ^0.5.8;

import "./INFT.sol";

contract INFTMetadata is INFT {
    function tokenURI(uint256 tid) external view returns (string memory);
}