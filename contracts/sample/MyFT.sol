pragma solidity ^ 0.5.8;

import "../ft/FT.sol";

/**
 * @title my simple fungible token
 * @dev 
  */

contract MyFungibleToken is FungibleToken{
    
    string public constant name = "FungibleToken";
    string public constant symbol = "FT";
    uint8 public constant decimals = 1;
    
    uint256 public constant INITIAL_SUPPLY = 100 * (10 ** uint256(decimals));

    /**
    * @dev Constructor that gives msg.sender all of existing tokens.
    */
    constructor() public {
        _mint(msg.sender, INITIAL_SUPPLY);
    }
    
}