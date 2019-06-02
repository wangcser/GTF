pragma solidity ^0.5.8;

import "../sft/SFT.sol";
/**
 * @title Token Core Interface
 * @dev  see the GTF model docs
 */

  contract MySemiFungibleToken is SemiFungibleToken {
    
    string public constant name = "SemiFungibleToken";
    string public constant symbol = "SFT";
    
    mapping (uint256 => string) public classNames;
    mapping (uint256 => string) public classURIs;

    function mint(address to, uint256 cid, uint256 value) public {
        _mint(to, cid, value);
    }
    
    function setClassName(uint256 cid, string memory className) public {
        classNames[cid] = className;
    }
    
    function setClassURI(uint256 cid, string memory classURI) public {
        classURIs[cid] = classURI;
    }

    function _mint(address to, uint256 cid, uint256 value) internal returns (bool) {
        
        _totalSupplyByClass[cid] = _totalSupplyByClass[cid].add(value);
        _balancesByClass[to][cid] = _balancesByClass[to][cid].add(value);
        
        if(!_classExist(cid)) {
            _totalClassSupply.push(cid);
        }
        
        if(!_ownedClassExist(to, cid)) {
            _ownedClass[to].push(cid);
        }

        emit Transfer(address(0), to, cid, value);
    }
}