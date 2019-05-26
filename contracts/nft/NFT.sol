pragma solidity ^0.5.8;

import "../tokenCore/INFT.sol";
import "../utils/SafeMath.sol";
// import "../utils/Address.sol";
// import "../utils/Counters.sol";
// import "../utils/ERC165.sol";
/**
 */
contract NonFungibleToken is INFT {

    using SafeMath for uint256;

    // Mapping from token ID to owner
    mapping (uint256 => address) private _tokenOwner;

    // Mapping from token ID to approved address
    mapping (uint256 => address) private _tokenApprovals;

    // // Mapping from owner to number of owned token
    // mapping (address => Counters.Counter) private _ownedTokensCount;
    mapping (address => uint256) private _balances;

    uint256 private _totalSupply = 0;

    function totalSupply() public view returns (uint256) {
        require(msg.sender != address(0));

        return _totalSupply;
    }

    function balanceOf(address owner) public view returns (uint256) {
        require(owner != address(0));

        return _balances[owner];
    }

    function ownerOf(uint256 tid) public view returns (address) {
        address owner = _tokenOwner[tid];
        
        return owner;
    }

    function approve(address oprator, uint256 tid) public returns (bool) {
        address owner = ownerOf(tid);
        
        require(msg.sender == owner);
        
        _tokenApprovals[tid] = oprator;
        
        emit Approval(owner, oprator, tid);

        return true;
    }

    function getApproved(uint256 tid) public view returns (address) {
        require(_exists(tid));

        return _tokenApprovals[tid];
    }

    function transfer(address to, uint256 tid) public returns (bool) {

        _transferFrom(msg.sender, to, tid);

        return true;
    }


    function transferFrom(address from, address to, uint256 tid) public returns (bool) {
        address oprator = getApproved(tid);
        
        require(msg.sender == oprator);

        _transferFrom(from, to, tid);

        return true;
    }

    function _mint(address to, uint256 tid) internal {

        require(to != address(0));
        
        require(!_exists(tid));

        _tokenOwner[tid] = to;
        _totalSupply = _totalSupply.add(1);
        _balances[to] = _balances[to].add(1);

        emit Transfer(address(0), to, tid);
    }

    function _transferFrom(address from, address to, uint256 tid) internal {
        require(to != address(0));
        
        address owner = ownerOf(tid);
        
        require(from == owner);

        _clearApproval(tid);

        _tokenOwner[tid] = to;
        
        _balances[from] = _balances[from].sub(1);
        _balances[to] = _balances[to].add(1);

        emit Transfer(from, to, tid);
    }

    function _clearApproval(uint256 tid) private {
        
        if(_tokenApprovals[tid] != address(0)) {
            _tokenApprovals[tid] != address(0);
        }
    }

    function _exists(uint256 tid) private view returns (bool) {
        address owner = _tokenOwner[tid];

        return owner != address(0);
    }

}