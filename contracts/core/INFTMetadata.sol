pragma solidity ^0.5.8;

import "./ITokenMetadata.sol";


contract INFTMetadata is ITokenMetadata {
    // read-state method
    function tokenInfo(uint256 tid) external view returns (string memory);
}