pragma solidity ^0.5.8;

/**
 * @title Token Core Interface
 * @dev  see the GTF model docs
 */

import "../SafeMath.sol"
import "../tokenCore/ISFT.sol"

contract SemiFungibleToken is ISFT {
    using SafeMath for uint256;

    mapping (address => uint256) internal _totalBalances;

    mapping (address => mapping (uint256 => uint256)) internal _balances;

    mapping (address => mapping (address => mapping (uint256 => uint256))) internal _approvals;

    uint256 _totalSupply;
    mapping (uint256 => uint256) _classSupply;


    function transfer(address to, uint256 cid, uint256 value) public returns (bool) {
        
        require(to != address(0), "to can't be init address.");

        address owner = msg.sender;
        
        _balances[owner][cid] = _balances[owner][cid].sub(value);
        _balances[to][cid] = _balances[to][cid].add(value);

        emit Transfer(owner, to, cid, value);

        return true;
    }

    function transferFrom(address from, address to, uint256 cid, uint256 value) public returns (bool) {
        // require(msg.sender == oprator)

        _balances[from][cid] = _balances[from][cid].sub(value);
        _balances[to][cid] = _balances[to][cid].add(value);

        emit Transfer(from, to, cid, value);

        return true;
    }

    function approve(address oprator, uint256 cid, uint256 value) public returns (bool) {

        address owner = msg.sender;
        _approvals[owner][oprator][cid] = _approvals[owner][oprator][cid].add(value);

        emit Approval(owner, oprator, cid, value);
    }

    function totalSupply() public view returns (uint256) {

        return _totalSupply;
    }

    function classSupply(uint256 cid) public view returns (uint256) {
        return _classSupply[cid];
    }

    function balanceOf(address owner) public view returns (uint256) {
        require(owner != address(0));

        return _totalBalances[owner];
    }

    function balanceOfByClass(address owner, uint256 cid) public view returns (uint256) {
        require(owner != address(0));

        return _balances[owner][cid];
    }

    function allowance(address owner, address oprator, uint256 cid) public view returns (uint256) {

        return _approvals[owner][oprator][cid];

    }

    function _mint(address to, uint256 cid, uint256 value) internal returns (bool) {
        
        _balances[to][cid] = _balances[to][cid].add(value);
        _totalBalances[to] = _totalBalances[to].add(value);
        
        _totalSupply = _totalSupply.add(value);
        _classSupply[cid] = _classSupply[cid].add(value);

        emit Transfer(address(0), to, cid, value);
    }
}