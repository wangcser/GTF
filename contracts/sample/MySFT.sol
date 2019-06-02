pragma solidity ^0.5.8;

import "../sft/SFT.sol";
/**
 * @title
 * @dev  contract function test ok
 */

contract MySemiFungibleToken is SemiFungibleToken {
    
    string public constant name = "SemiFungibleToken";
    string public constant symbol = "SFT";
    
    mapping (uint256 => string) private classNames;
    mapping (uint256 => string) private classURIs;

    function mint(address to, uint256 cid, uint256 value) public {
        _mint(to, cid, value);
    }
    
    function setClassName(uint256 cid, string memory className) private {
        classNames[cid] = className;
    }
    
    function setClassURI(uint256 cid, string memory classURI) private {
        classURIs[cid] = classURI;
    }

    function _mint(address to, uint256 cid, uint256 value) internal returns (bool) {
        if(totalSupplyByClass(cid) == 0) {
            _totalClass.push(cid);
        }
        _totalSupplyByClass[cid] = _totalSupplyByClass[cid].add(value);
        
        if(balanceOfByClass(to, cid) == 0) {
            _ownedClassNum[to]++;
        }
        _balancesByClass[to][cid] = _balancesByClass[to][cid].add(value);

        emit Transfer(address(0), to, cid, value);
    }
}