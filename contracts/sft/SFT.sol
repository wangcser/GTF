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
    uint256[] internal _totalClass; // remove is a rarely operation!
    mapping(uint256 => uint256) internal _totalSupplyByClass;
    
    mapping(address => uint256) internal _ownedClassNum;
    mapping(address => mapping (uint256 => uint256)) internal _balancesByClass;
    
    mapping(address => mapping (address => mapping (uint256 => uint256))) internal _approvals;
    
    // read-state methods
    function totalSupplyByClass(uint256 cid) internal view returns (uint256) {
        return _totalSupplyByClass[cid];
    }
 
    function totalClass() internal view returns (uint256[] memory) {
        return _totalClass;
    }

    function totalSupply() public view returns (uint256[] memory, uint256[] memory) {
        uint256[] memory _totalSupply = new uint256[](_totalClass.length);
        
        for(uint i = 0; i <_totalClass.length; i++) {
            _totalSupply[i] = totalSupplyByClass(_totalClass[i]);
        }
        
        return (_totalClass, _totalSupply);
    }
    
    function balanceOfByClass(address owner, uint256 cid) internal view returns (uint256) {
        return _balancesByClass[owner][cid];
    }
    
    function ownedClass(address owner) internal view returns (uint256[] memory) {
        uint256 len = _ownedClassNum[owner];
        uint256[] memory _ownedClass = new uint256[](len);
        uint256 index = 0;
        
        for(uint i = 0; i < _totalClass.length; i++) {
            if(balanceOfByClass(owner, _totalClass[i]) > 0) {
                _ownedClass[index] = _totalClass[i];
                index++;
            }
        }
        
        return _ownedClass;
    }
    
    function balanceOf(address owner) external view returns (uint256[] memory, uint256[] memory) {
        uint256[] memory _ownedClass = ownedClass(owner);
        uint256[] memory _balances = new uint256[](_ownedClass.length);

        for(uint i = 0; i <_ownedClass.length; i++) {
            _balances[i] = balanceOfByClass(owner, _ownedClass[i]);
        }
        
        return (_ownedClass, _balances);
    }
    
    function allowance(address owner, address operator, uint256 cid) public view returns (uint256) {
        return _approvals[owner][operator][cid];
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
        _approve(from, msg.sender, cid, _approvals[from][msg.sender][cid].sub(value));
        _transferFrom(from, to, cid, value);
        emit Transfer(from, to, cid, value);
    }

    function approve(address operator, uint256 cid, uint256 value) public {
        _approve(msg.sender, operator, cid, value);
        emit Approval(msg.sender, operator, cid, value);
    }

    function _transferFrom(address from, address to, uint256 cid, uint256 value) internal {
        if(_balancesByClass[from][cid] == value) {
            _ownedClassNum[from]--;
        }
        _balancesByClass[from][cid] = _balancesByClass[from][cid].sub(value);
        
        if(_balancesByClass[to][cid] == 0) {
            _ownedClassNum[to]++;
        }
        _balancesByClass[to][cid] = _balancesByClass[to][cid].add(value);
    }
    
    function _approve(address owner, address operator, uint256 cid, uint256 value) internal {
        _approvals[owner][operator][cid] = _approvals[owner][operator][cid].add(value);
    }
    
    function _classExist(uint256 cid) internal view returns (bool) {
        if(_totalSupplyByClass[cid] > 0) {
            return true;
        } else {
            return false;
        }
    }
    
    function _ownedClassExist(address owner, uint256 cid) internal view returns (bool) {
        if(_balancesByClass[owner][cid] > 0) {
            return true;
        } else {
            return false;
        }
    }
}