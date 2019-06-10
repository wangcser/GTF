/**
 * @title A defination of non-fungible token interface
 * @author wangcser
 * @notice end user can use this interface for their NFT contract implementation
 * @dev see NFT and GTF docs for more details
 */


pragma solidity ^0.5.8;


interface INFT {
    // events
    event Transfer(address indexed from, address indexed to, uint256 indexed tid);
    event Approval(address indexed owner, address indexed operator, uint256 indexed tid);


    // read-state methods for single user and single NFT
    /**
     * @dev get nft current owner address
     * @param tid nft-id
     * @return address of current owner
     */
    function ownerOf(uint256 tid) external view returns (address);

    /**
     * @dev get nft current operator address
     * @param tid nft-id
     * @return address of current operator
     */
    function allowance(uint256 tid) external view returns (address);


    // write-state methods
    /**
     * @dev transfer nft from owner to recipent
     * @param to address of nft recipent
     * @param tid nft to be transfered
     */
    function transfer(address to, uint256 tid) external;

    /**
     * @dev operator transfer nft from owner to recipent (can be operator or others)
     * @param from address of nft owner
     * @param to address of operator
     * @param tid nft to be tranfered
     */
    function transferFrom(address from, address to, uint256 tid) external;

    /**
     * @dev owner approve operator to spend nft on behalf of owner (in this situation, the owner is the msg.sender)
     * @param operator address of operator
     * @param tid nft to be approved
     */
    function approve(address operator, uint256 tid) external;
}