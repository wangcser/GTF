pragma solidity >=0.4.0 <0.6.0;

import "remix_tests.sol"; // this import is automatically injected by Remix.
import "./MyFT.sol";
import "./FakeContract.sol";


contract test_balanceOf {
    
    // declare the test contrac
    MyFungibleToken myft;
    FakeContract fc1;
    FakeContract fc2;
    
    // declare the test address
    address owner; // the owner of the contract
    
    address alice; // user alice
    address bob; // user bob
    address charles; // user charles
    address david; // user david
    
    address coinbase; // the coinbase address: 0x0000
    
    address myCA; // the address of test contract
    address anotherCA1; // another contract address for test
    address anotherCA2; // another contract address for test
    
    // declare the helper value
    uint256 initSupply;
    
    // init the addresses and values before all test
    function beforeAll() public {
        // here should instantiate tested contract
        myft = new MyFungibleToken();
        fc1 = new FakeContract();
        fc2 = new FakeContract();
        
        owner = address(this);
        
        alice = address(0x01);
        bob = address(0x02);
        charles = address(0x03);
        david = address(0x04);
        
        coinbase = address(0x00);
        
        myCA = address(myft);
        anotherCA1 = address(fc1);
        anotherCA2 = address(fc2);
        
        
        initSupply = 1000;
        
    }
    
    // set local state before each test
    function beforeEach() public {
        
    }
    
    function checkMint() public returns (bool) {
        uint256 balanceOfOwner = myft.balanceOf(owner);
        Assert.equal(initSupply, balanceOfOwner, "contract mint error");
    }
    
    function TestBalanceOfDepositEOA() public returns (bool) {
        uint256 expected = 100;
        myft.mint(alice, expected);
        uint256 result = myft.balanceOf(alice);
        
        Assert.equal(expected, result, "valid balanceOf error");
    }
 
    function TestBalanceOfNonDepositEOA() public returns (bool) {
        uint256 expected = 0;
        // myft.mint(alice, expected);
        uint256 result = myft.balanceOf(bob);
        
        Assert.equal(expected, result, "error msg");
    }
    
    function TestBalanceOfDepositCA() public returns (bool) {
        uint256 expected = 100;
        myft.mint(anotherCA1, expected);
        uint256 result = myft.balanceOf(anotherCA1);
        
        Assert.equal(expected, result, "error msg");
    }
    
    function TestBalanceOfNonDepositCA() public returns (bool) {
        uint256 expected = 0;
        // myft.mint(alice, expected);
        uint256 result = myft.balanceOf(anotherCA2);
        
        Assert.equal(expected, result, "error msg");
    }
    
    
}
    
    
// contract testTransfer {
    
//      // declare the test contrac
//     MyFungibleToken myft;
//     FakeContract fc;
    
//     // declare the test address
//     address owner; // the owner of the contract
    
//     address alice; // user alice
//     address bob; // user bob
//     address charles; // user charles
//     address david; // user david
    
//     address coinbase; // the coinbase address: 0x0000
    
//     address contractAddress; // the address of test contract
//     address anotherContractAddress; // another contract address for test
    
//     // declare the helper value
//     uint256 initSupply;
    
//     // init the addresses and values before all test
//     function beforeAll() public {
//         // here should instantiate tested contract
//         myft = new MyFungibleToken();
//         fc = new FakeContract();
        
//         owner = address(this);
        
//         alice = address(0x01);
//         bob = address(0x02);
//         charles = address(0x03);
//         david = address(0x04);
        
//         coinbase = address(0x00);
        
//         contractAddress = address(myft);
//         anotherContractAddress = address(fc);
        
//         initSupply = 1000;
        
//     }
    
//     function TestTransfer() public returns (bool) {
//         myft.transfer(alice, 100);
    
//         Assert.equal(100, myft.balanceOf(alice), "transfer error");
//     }
// }