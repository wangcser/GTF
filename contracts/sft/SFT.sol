pragma solidity ^0.5.8;

import "../utils/SafeMath.sol";
import "../core/ISFT.sol";
import "../core/ISFTEnumerable.sol";

/**
 * @title Token Core Interface
 * @dev  
 */

contract SemiFungibleToken is ISFT, ISFTEnumerable {

    using SafeMath for uint256;

    // state in blockchain
    mapping(uint256 => uint256) internal _totalSupplyByClass;
    mapping(address => mapping (uint256 => uint256)) internal _balancesByClass;
    mapping(address => mapping (address => mapping (uint256 => uint256))) internal _approvals;
    uint256[] internal _totalClassSupply;
    mapping(address =>uint256[]) internal _ownedClass;



    // read-state methods
    function totalSupplyByClass(uint256 cid) public view returns (uint256) {
        return _totalSupplyByClass[cid];
    }

    function balanceOfByClass(address owner, uint256 cid) public view returns (uint256) {
        return _balancesByClass[owner][cid];
    }

    function allowance(address owner, address operator, uint256 cid) public view returns (uint256) {
        return _approvals[owner][operator][cid];
    }
    
    function totalClassSupply() public view returns (uint256[] memory) {
        return _totalClassSupply;
    }
    
    function totalSupply() public view returns (uint256[] memory) {
        uint256 len = _totalClassSupply.length;
        uint256[] memory _totalSupply = new uint256[](len);
        for(uint i = 0; i <_totalClassSupply.length; i++) {
            _totalSupply[i] = totalSupplyByClass(_totalClassSupply[i]);
        }
        return _totalSupply;
    }

    function ownedClass(address owner) public view returns (uint256[] memory) {
        return _ownedClass[owner];
    }

    function balanceOf(address owner) external view returns (uint256[] memory) {
        uint256 len = _ownedClass[owner].length;
        uint256[] memory _balances = new uint256[](len);
        for(uint i = 0; i <_totalClassSupply.length; i++) {
            _balances[i] = balanceOfByClass(owner, _ownedClass[owner][i]);
        }
        return _balances;
    }

    // write-state methods
    function transfer(address to, uint256 cid, uint256 value) public {
        require(to != address(0), "to can't be init address.");
        _transferFrom(msg.sender, to, cid, value);
        emit Transfer(msg.sender, to, cid, value);
    }

    function transferFrom(address from, address to, uint256 cid, uint256 value) public {
        require(to != address(0));
        require(_approvals[from][msg.sender][cid] >= value);
        _transferFrom(from, to, cid, value);
        emit Transfer(from, to, cid, value);
    }

    function approve(address operator, uint256 cid, uint256 value) public {
        _approve(msg.sender, operator, cid, value);
        emit Approval(msg.sender, operator, cid, value);
    }

    function _transferFrom(address from, address to, uint256 cid, uint256 value) internal {
        _balancesByClass[from][cid] = _balancesByClass[from][cid].sub(value);
        _balancesByClass[to][cid] = _balancesByClass[to][cid].add(value);
        
    }
    
    function _approve(address owner, address operator, uint256 cid, uint256 value) internal {
        _approvals[owner][operator][cid] = _approvals[owner][operator][cid].add(value);
    }
    
    function _classExist(uint256 cid) internal view returns (bool) {
        for(uint i = 0; i < _totalClassSupply.length; i++) {
            if(_totalClassSupply[i] == cid) {
                return true;
            }
        }
        return false;
    }
    
    function _ownedClassExist(address owner, uint256 cid) internal view returns (bool) {
        for(uint i = 0; i < _ownedClass[owner].length; i++) {
            if(_ownedClass[owner][i] == cid) {
                return true;
            }
        }
        return false;
    }
}