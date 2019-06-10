/**
 * @title A sample of semi-fungible token
 * @author wangcser
 * @dev end user can use this contract for reference
 */


pragma solidity ^0.5.8;

import "../sft/SFT.sol";
import "../core/ISFTMetadata.sol";


contract MySemiFungibleToken is SemiFungibleToken, ISFTMetadata {

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

        if(balanceOfByClass(miner, cid) == 0) {
            _ownedClassNum[miner]++;
        }
        _balancesByClass[miner][cid] = _balancesByClass[miner][cid].add(value);

        emit Transfer(address(0), miner, cid, value);
    }
}