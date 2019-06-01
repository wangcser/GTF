pragma solidity ^ 0.5.8;

import "../ft/FT.sol";

/**
 * @title my simple fungible token
 * @dev contract function test ok
 */

contract MyFungibleToken is FungibleToken{
    
    string public constant name = "FungibleToken";
    string public constant symbol = "FT";
    uint8 public constant decimals = 1;
    
    uint256 private constant INITIAL_SUPPLY = 100 * (10 ** uint256(decimals));

    /**
    * @dev Constructor that gives msg.sender all of existing tokens.
    */
    constructor() public {
        _mint(msg.sender, INITIAL_SUPPLY);
    }

    function _mint(address miner, uint256 value) internal {
        require(miner != address(0));

        _totalSupply = _totalSupply.add(value);
        _balances[miner] = _balances[miner].add(value);
        
        emit Transfer(address(0), miner, value);
    }
}