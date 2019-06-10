pragma solidity >=0.4.0 <0.6.0;

import "remix_tests.sol"; // this import is automatically injected by Remix.
// import "remix_accounts.sol";
import "./MyFT.sol";


contract test_balanceOf {
    
    MyFungibleToken myft;

    function beforeAll() public {
        // here should instantiate tested contract
        myft = new MyFungibleToken();
        
        address alice = TestAccounts.getAccount(0);
    }

    function checkValidBalancesQuery() public returns (bool) {
        uint256 eb = 10000;
        uint256 tb = myft.balanceOf(alice);

        Assert.equal(eb, tb, "mint error");
    }
}

    // function check2() public view returns (bool) {
    //   // use the return value (true or false) to test the contract
    //   return true;
    // }

// contract test_2 {

//   function beforeAll() public {
//     // here should instantiate tested contract
//     Assert.equal(uint(4), uint(3), "error in before all function");
//   }

//   function check1() public {
//     // use 'Assert' to test the contract
//     Assert.equal(uint(2), uint(1), "error message");
//     Assert.equal(uint(2), uint(2), "error message");
//   }

//   function check2() public view returns (bool) {
//     // use the return value (true or false) to test the contract
//     return true;
//   }
// }