pragma solidity ^ 0.5.2;

import "../tokenCore/IFT.sol";
import "../safe/safeMath.sol";

/**
 * @title Standard fungible token
 * @dev Implementation of the basic standard fungible token.
 */

contract FungibleToken is IFT {
    
    using SafeMath for uint256;
    
    mapping (address => uint256) private _balances;
    
    mapping (address => mapping (address => uint256)) private _allowed;
    
    uint256 private _totalSupply;


    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address owner) public view returns (uint256) {
        return _balances[owner];
    }

    function allowance(address owner, address oprator) public view returns (uint256) {
        return _allowed[owner][oprator];
    }
    
    /**
     * @dev approve the passed address to spend the specified amount of tokens on behalf pf msg.sender
     * @param oprator address
     * @param value uint256
     * @return bool
     */
    function approve(address oprator, uint256 value) public returns (bool) {
        _approve(msg.sender, oprator, value);
    
     return true;
    }

    function transfer(address to, uint256 value) public returns (bool) {
        _transfer(msg.sender, to, value);
    
       return true;
    }

    function transferFrom(address from, address to, uint256 value) public returns (bool) {
        _transfer(from, to, value);
        _approve(from, msg.sender, _allowed[from][msg.sender].sub(value));
    
     return true;
    }
    
    function _transfer(address from, address to, uint256 value) internal {
        require(to != address(0));
        
        _balances[from] = _balances[from].sub(value);
        _balances[to] = _balances[to].add(value);
        
        emit Transfer(from, to, value);
    }
    
    function _approve(address owner, address spender, uint256 value) internal {
        require(spender != address(0));
        require(owner != address(0));
        
        _allowed[owner][spender] = value;
        
        emit Approval(owner, spender, value);
    }
    
    function _mint(address miner, uint256 value) internal {
        require(miner != address(0));
        
        _totalSupply = _totalSupply.add(value);
        _balances[miner] = _balances[miner].add(value);
        
        emit Transfer(address(0), miner, value);
    }
 }