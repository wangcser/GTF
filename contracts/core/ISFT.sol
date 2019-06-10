/**
 * @title A defination of semi-fungible token interface
 * @author wangcser
 * @notice end user can use this interface for their SFT contract implementation
 * @dev see SFT and GTF docs for more details
 */


pragma solidity ^0.5.8;


interface ISFT {
    // events
    event Transfer(address indexed from, address indexed to, uint256 indexed cid, uint256 value);
    event Approval(address indexed owner, address indexed operator, uint256 indexed cid, uint256 value);


    // read-state methods
    
    /**
     * @dev get the balances of given owner and sft class
     * @param owner address of owner
     * @param cid sft class id to query
     * @return uint256 for amount of given cid in owner
     */
    // function balanceOfByClass(address owner, uint256 cid) external view returns (uint256);

    /**
     * @dev check the given sft class allowance from owner to operator
     * @param owner address of owner
     * @param operator address of operator
     * @param cid sft class id to query
     * @return uint256 for amount of allowance
     */
    function allowance(address owner, address operator, uint256 cid) external view returns (uint256);


    // write-state methods
    /**
     * @dev transfer given class sft from owner to recipent
     * @param to address of sft recipent
     * @param cid sft class id
     * @param value amount of sft to be tranfered
     */
    function transfer(address to, uint256 cid, uint256 value) external;

    /**
     * @dev operator transfer given class sft from owner to recipent (can be operator or others)
     * @param from address of sft owner
     * @param to address of operator
     * @param cid sft class id
     * @param value amount of sft to be tranfered
     */
    function transferFrom(address from, address to, uint256 cid, uint256 value) external;

    /**
     * @dev owner approve operator to spend sfts on behalf of owner (in this situation, the owner is the msg.sender)
     * @param operator address of operator
     * @param cid sft class id
     * @param value amount of sft to be approved
     */
    function approve(address operator, uint256 cid, uint256 value) external;
}