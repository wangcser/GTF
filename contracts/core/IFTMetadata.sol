pragma solidity ^0.5.8;

import "./ITokenMetadata.sol";


interface IFTMetadata is ITokenMetadata {
    // read-state methods for token
    function decimals() external view returns (uint256);
}