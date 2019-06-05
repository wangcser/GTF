/**
 * @title An implementation of fungible token interface
 * @author wangcser
 * @notice end user can use this contract for their FT model
 * @dev see FT and GTF docs for more details
 */


pragma solidity ^ 0.5.8;

import "../utils/safeMath.sol";
import "../core/IFT.sol";


contract FungibleToken is IFT {
    // using safe math lib to prevent overflow
    using SafeMath for uint256;
    

    // state in blockchain
    mapping(address => uint256) internal _balances;
    mapping(address => mapping(address => uint256)) internal _approvals;
    uint256 internal _totalSupply;


    // read-state methods
    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address owner) public view returns (uint256) {
        return _balances[owner];
    }

    function allowance(address owner, address operator) public view returns (uint256) {
        return _approvals[owner][operator];
    }

    // write-state methods
    function approve(address operator, uint256 value) public {
        _approve(msg.sender, operator, value);
    }

    function transfer(address to, uint256 value) public {
        _transferFrom(msg.sender, to, value);
    }

    function transferFrom(address from, address to, uint256 value) public {
        require(allowance(from, msg.sender) >= value, "insufficient allowance");

        uint newAllowed = _approvals[from][msg.sender].sub(value);
        _approve(from, msg.sender, newAllowed);
        _transferFrom(from, to, value);
    }

    function _transferFrom(address from, address to, uint256 value) private {
        require(to != address(0), "recipent address invalid.");

        _balances[from] = _balances[from].sub(value);
        _balances[to] = _balances[to].add(value);

        emit Transfer(from, to, value);
    }

    function _approve(address owner, address operator, uint256 value) private {
        require(operator != address(0), "operator address invalid.");
        require(owner != address(0), "owner address invalid.");

        _approvals[owner][operator] = value;

        emit Approval(owner, operator, value);
    }
 }