pragma solidity ^0.5.8;

import "../sft/SFT.sol";
/**
 * @title Token Core Interface
 * @dev  see the GTF model docs
 */

 contract MySemiFungibleToken is SemiFungibleToken {
    
    string public constant name = "SemiFungibleToken";
    string public constant symbol = "SFT";
    
    mapping (uint256 => string) public classNames;
    mapping (uint256 => string) public classURIs;

    function mint(address to, uint256 cid, uint256 value) public {
        _mint(to, cid, value);
    }
}