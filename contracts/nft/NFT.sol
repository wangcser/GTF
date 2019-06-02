pragma solidity ^0.5.8;

import "../core/INFT.sol";
import "../core/INFTEnumerable.sol";
import "../utils/SafeMath.sol";

contract NonFungibleToken is INFT, INFTEnumerable {

    using SafeMath for uint256;
    // state in blockchain
    mapping(uint256 => address) internal _tokenToOwner;
    mapping(uint256 => address) internal _approvals;
    uint256 internal _totalSupplyByAmount = 0;
    mapping(address => uint256) internal _balancesByAmount;
    uint256[] internal _totalSupply;

    // read-state methods
    function totalSupplyByAmount() internal view returns (uint256) {
        return _totalSupplyByAmount;
    }

    function balanceOfByAmount(address owner) internal view returns (uint256) {
        return _balancesByAmount[owner];
    }

    function ownerOf(uint256 tid) public view returns (address) {
        return _tokenToOwner[tid];
    }

    function allowance(uint256 tid) public view returns (address) {
        return _approvals[tid];
    }

    function totalSupply() public view returns (uint256[] memory) {
        return _totalSupply;
    }

    function balanceOf(address owner) external view returns (uint256[] memory) {
        uint256 len = balanceOfByAmount(owner);
        uint256[] memory balances = new uint[](len);
        uint index = 0;

        for(uint i = 0; i < _totalSupply.length; i++) {
            if(ownerOf(_totalSupply[i]) == owner) {
                balances[index] = (_totalSupply[i]);
                index++;
            }   
        }
        return balances;
    }

    // write-state methods
    function transfer(address to, uint256 tid) public returns (bool) {
        _transferFrom(msg.sender, to, tid);
        return true;
    }

    function transferFrom(address from, address to, uint256 tid) public returns (bool) {
        require(msg.sender == allowance(tid));
        _transferFrom(from, to, tid);
        return true;
    }

    function approve(address operator, uint256 tid) public returns (bool) {
        require(msg.sender == ownerOf(tid));
        _approvals[tid] = operator;
        emit Approval(msg.sender, operator, tid);
        return true;
    }

    // internal write-state methods
    function _transferFrom(address from, address to, uint256 tid) internal {
        require(to != address(0));
        require(from == ownerOf(tid));

        _clearApproval(tid);

        _tokenToOwner[tid] = to;
        
        _balancesByAmount[from] = _balancesByAmount[from].sub(1);
        _balancesByAmount[to] = _balancesByAmount[to].add(1);

        emit Transfer(from, to, tid);
    }

    function _clearApproval(uint256 tid) private {
        if(_approvals[tid] != address(0)) {
            _approvals[tid] = address(0);
        }
    }
}