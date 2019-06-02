pragma solidity ^0.5.8;

import "./ISFT.sol";

contract ISFTEnumerable is ISFT {
    // return the amount of total class
    function totalClassSupply() external view returns (uint256[] memory); 
    // return the amount of SFT
    function totalSupply() external view returns (uint256[] memory);

    // return owned cid list
    function ownedClass(address owner) external view returns (uint256[] memory);
    // return all amount with given cid
    function balanceOf(address owner) external view returns (uint256[] memory);
}