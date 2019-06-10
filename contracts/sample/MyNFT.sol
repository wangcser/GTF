/**
 * @title A sample of non-fungible token
 * @author wangcser
 * @dev end user can use this contract for reference
 */


pragma solidity ^ 0.5.8;

import "../nft/NFT.sol";
import "../core/INFTMetadata.sol";


contract MyNonFungibleToken is NonFungibleToken, INFTMetadata {

    string public constant name = "NonFungibleToken";
    string public constant symbol = "NFT";
    mapping (uint256 => string) internal _tokenInfos;


    function mint(address miner, uint256 tid) external {
        _mint(miner, tid);
    }

    function _mint(address miner, uint256 tid) internal {
        require(miner != address(0), "miner address invalid.");
        require(!_exists(tid), "token is existed.");

        _tokenToOwner[tid] = miner;
        _totalSupply.push(tid);
        _totalSupplyByAmount = _totalSupplyByAmount.add(1);
        _balancesByAmount[miner] = _balancesByAmount[miner].add(1);

        // tokenURIs[tid] = "www.GTF.io/NFT/tid";

        emit Transfer(address(0), miner, tid);
    }
}