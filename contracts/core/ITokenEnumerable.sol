/**
 * @title A common defination for enumerable operation
 * @author wangcser
 */


pragma solidity ^0.5.8;


interface ITokenEnumerable {
    // read-state method
    function totalSupply() external view;
} 