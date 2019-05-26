pragma solidity ^ 0.5.8;

import "../nft/NFT.sol";

/**
 * @title my simple fungible token
 * @dev 
  */

contract MyNonFungibleToken is NonFungibleToken {
    
    string public constant name = "NonFungibleToken";
    string public constant symbol = "NFT";
    
    mapping (uint256 => string) public tokenURIs;

    function mint(address to, uint256 tid) public {
        _mint(to, tid);
    }
}