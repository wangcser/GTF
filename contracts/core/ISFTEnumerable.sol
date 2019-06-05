pragma solidity ^0.5.8;


contract ISFTEnumerable {
    // read-state for contract
    function totalClassSupply() external view returns (uint256[] memory);
    function totalSupplyByClass(uint256 cid) external view returns (uint256);
    function totalSupply() external view returns (uint256[] memory, uint256[] memory);
    // read-state for users
    function ownedClass(address owner) external view returns (uint256[] memory);
    function balanceOf(address owner) external view returns (uint256[] memory, uint256[] memory);
}