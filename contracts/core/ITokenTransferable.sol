/**
 * @title A common defination for transfer operation
 * @author wangcser
 */


pragma solidity ^0.5.8;

interface ITokenTransferable {
    // event
    event Transfer();
    event Approval();

    // read-state
    function balanceOf() external view;
    function allowance() external view;

    // write-state
    function transfer() external;
    function transferFrom() external;
    function approve() external;
}