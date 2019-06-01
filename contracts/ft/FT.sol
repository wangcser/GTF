pragma solidity ^ 0.5.2;

import "../core/IFT.sol";
import "../utils/safeMath.sol";

/**
 * @title Standard fungible token
 * @dev Implementation of the basic standard fungible token.
 */

contract FungibleToken is IFT {
    // using safe math lib to prevent overflow
    using SafeMath for uint256;
    
    // state in blockchain
    mapping (address => uint256) internal _balances;
    mapping (address => mapping (address => uint256)) internal _allowed;
    uint256 internal _totalSupply;


    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address owner) public view returns (uint256) {
        return _balances[owner];
    }

    function allowance(address owner, address operator) public view returns (uint256) {
        return _allowed[owner][operator];
    }
    
    /**
     * @dev approve the passed address to spend the specified amount of tokens on behalf pf msg.sender
     * @param operator address
     * @param value uint256
     * @return bool
     */
    function approve(address operator, uint256 value) public returns (bool) {
        _approve(msg.sender, operator, value);
        return true;
    }

    function transfer(address to, uint256 value) public returns (bool) {
        _transferFrom(msg.sender, to, value);
       return true;
    }

    function transferFrom(address from, address to, uint256 value) public returns (bool) {
        
        // TODO: owner should use transfer and operator should use this method
        require(allowance(from, msg.sender) >= value);
        uint newAllowed = _allowed[from][msg.sender].sub(value);
        _approve(from, msg.sender, newAllowed);
        _transferFrom(from, to, value);
        return true;
    }
    
    function _transferFrom(address from, address to, uint256 value) private {
        require(to != address(0));
        
        _balances[from] = _balances[from].sub(value);
        _balances[to] = _balances[to].add(value);
        
        emit Transfer(from, to, value);
    }
    
    function _approve(address owner, address operator, uint256 value) private {
        require(operator != address(0));
        require(owner != address(0));
        
        _allowed[owner][operator] = value;
        
        emit Approval(owner, operator, value);
    }
 }