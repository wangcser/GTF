/**
 * @title A defination of fungible token interface
 * @author wangcser
 * @notice end user can use this interface for their FT contract implementation
 * @dev see FT and GTF docs for more details
 */


pragma solidity ^0.5.8;


interface IFT {
    // events for transaction
    // event for notice end users the transfer result.
    event Transfer(address indexed from, address indexed to, uint256 value);
    // event for notice end users the approval result.
    event Approval(address indexed owner, address indexed operator, uint256 value);
    
    
    // read-state methods for single user
    /**
     * @dev get the ft balance of given address
     * @param owner address of ft owner
     * @return uint256 is the amount of ft in owner account
     */
    function balanceOf(address owner) external view returns (uint256);
    
    /**
     * @dev check the ft allowance from owner to operator
     * @param owner address of ft owner
     * @param operator address of operator
     * @return uint256 is the amount of ft allowed
     */
    function allowance(address owner, address operator) external view returns (uint256);


    // write-state methods for single user
    /**
     * @dev transfer ft from owner to recipent, the msg.sender should have enough amount of fts
     * @param to address of ft recipent
     * @param value amount of ft to be tranfered
     */
    function transfer(address to, uint256 value) external;

    /**
     * @dev operator transfer ft from owner to recipent (can be operator or others)
     * @param from address of ft owner
     * @param to address of operator
     * @param value amount of ft to be tranfered
     */
    function transferFrom(address from, address to, uint256 value) external;

    /**
     * @dev owner approve operator to spend fts on behalf of owner (in this situation, the owner is the msg.sender)
     * @param operator address of operator
     * @param value amount of ft to be approved
     */
    function approve(address operator, uint256 value) external;
}