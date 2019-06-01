pragma solidity ^0.5.8;

import "../utils/SafeMath.sol";
import "../core/ISFT.sol";
import "../core/ISFTEnumerable.sol";

/**
 * @title Token Core Interface
 * @dev  
 */

contract SemiFungibleToken is ISFT, ISFTEumerable {

    using SafeMath for uint256;

    // state in blockchain
    mapping (address => uint256) internal _totalBalances;
    mapping (address => mapping (uint256 => uint256)) internal _balances;
    mapping (address => mapping (address => mapping (uint256 => uint256))) internal _approvals;
    uint256 _totalSupply;
    mapping (uint256 => uint256) _classSupply;


    // read-state methods
    function totalSupplyByClass(uint256 cid) public view returns (uint256) {
        return _totalSupplyByClass[cid];
    }

    function balanceOfByClass(address owner, uint256 cid) public view returns (uint256) {
        require(owner != address(0));
        return _balancesByClass[owner][cid];
    }

    function allowance(address owner, address operator, uint256 cid) public view returns (uint256) {
        return _approvals[owner][oprator][cid];
    }
    
    function totalClassSupply() public view returns (uint256[] memory) {
        _;
    }
    
    function totalSupply() public view returns (uint256) {
        _;
    }

    function ownedClass(address owner) public view returns (uint256[] memory) {
        _;
    }

    function balanceOf(address owner) external view returns (uint256[] memory, uint256[] memory) {
        _;
    }

    // write-state methods
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

    // internal write-state methods
    function _mint(address to, uint256 cid, uint256 value) internal returns (bool) {
        
        _balances[to][cid] = _balances[to][cid].add(value);
        _totalBalances[to] = _totalBalances[to].add(value);
        
        _totalSupply = _totalSupply.add(value);
        _classSupply[cid] = _classSupply[cid].add(value);

        emit Transfer(address(0), to, cid, value);
    }
}