pragma solidity ^0.5.8;

import "../sft/SFT.sol";


contract MySemiFungibleToken is SemiFungibleToken {

    string public constant name = "SemiFungibleToken";
    string public constant symbol = "SFT";
    mapping(uint256 => string) private _classInfos;


    function mint(address miner, uint256 cid, uint256 value) external {
        _mint(miner, cid, value);
    }

    function _mint(address miner, uint256 cid, uint256 value) internal {
        require(miner != address(0), "miner address invalid.");

        if(totalSupplyByClass(cid) == 0) {
            _totalClass.push(cid);
        }
        _totalSupplyByClass[cid] = _totalSupplyByClass[cid].add(value);

        if(balanceOfByClass(to, cid) == 0) {
            _ownedClassNum[to]++;
        }
        _balancesByClass[to][cid] = _balancesByClass[to][cid].add(value);

        emit Transfer(address(0), miner, cid, value);
    }
}