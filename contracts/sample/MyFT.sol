/**
 * @title A sample of fungible token
 * @author wangcser
 * @dev end user can use this contract for reference
 */


pragma solidity ^ 0.5.8;

import "../ft/FT.sol";
import "../core/IFTMetadata.sol";


contract MyFungibleToken is FungibleToken, IFTMetadata {

    string public constant name = "FungibleToken";
    string public constant symbol = "FT";
    uint8 public constant decimals = 1;

    uint256 private constant INITIAL_SUPPLY = 100 * (10 ** uint256(decimals));


    constructor() public {
        _mint(msg.sender, INITIAL_SUPPLY);
    }

    function mint(address miner, uint256 value) external {
        _mint(miner, value);
    }

    function _mint(address miner, uint256 value) internal {
        require(miner != address(0), "miner address invalid.");

        _totalSupply = _totalSupply.add(value);
        _balances[miner] = _balances[miner].add(value);

        emit Transfer(address(0), miner, value);
    }
}