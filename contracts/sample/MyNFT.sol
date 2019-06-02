pragma solidity ^ 0.5.8;

import "../nft/NFT.sol";

/**
 * @title my simple fungible token
 * @dev contract function test ok
  */

contract MyNonFungibleToken is NonFungibleToken, utils {
    
    string public constant name = "NonFungibleToken";
    string public constant symbol = "NFT";
    mapping (uint256 => string) internal tokenURIs;

    function mint(address to, uint256 tid) public {
        _mint(to, tid);
    }

    function _mint(address to, uint256 tid) internal {
        require(to != address(0));
        require(!_exists(tid));

        _tokenToOwner[tid] = to;
        tokenURIs[tid] = "www.GTF.io/NFT/tid";
        // tokenURIs[tid] = "www.GTF.io/NFT/1a2def" + string(abi.encodePacked(tid));
        _totalSupply.push(tid);
        _totalSupplyByAmount = _totalSupplyByAmount.add(1);
        _balancesByAmount[to] = _balancesByAmount[to].add(1);

        emit Transfer(address(0), to, tid);
    }

    function _exists(uint256 tid) internal view returns (bool) {
        return _tokenToOwner[tid] != address(0);
    }
}