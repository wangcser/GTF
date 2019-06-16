pragma solidity >=0.4.0 <0.6.0;

import "remix_tests.sol"; // this import is automatically injected by Remix.
import "./MyNFT.sol";
import "./FakeContract.sol";


contract test_env {
    // declare the test contrac
    MySemiFungibleToken mysft;
    FakeContract fc1;
    FakeContract fc2;
    
    // declare the test address
    address owner = address(msg.sender); // the owner of the contract
    
    address alice = address(0x01); // user alice
    address bob  = address(0x02); // user bob
    address charles = address(0x03); // user charles
    address david = address(0x04); // user david
    
    address coinbase = address(0x00); // the coinbase address: 0x0000
    
    address myCA; // the address of test contract
    address CA1; // another contract address for test
    address CA2; // another contract address for test
    
    // declare the helper value
    uint256[] tokenId;
    uint256 tokenNum = 5;
    
    // init the addresses and values before all test
    function beforeAll() public {
        // here should instantiate tested contract
        mysft = new MyFungibleToken();
        fc1 = new FakeContract();
        fc2 = new FakeContract();

        myCA = address(mysft);
        CA1 = address(fc1);
        CA2 = address(fc2);

        uint tid = 1001;
        for(uint i = 0; i < classNum; ++i) {
            tokenId.push(tid);
            tid++;
        }
    }
    
    // set local state before each test
    function beforeEach() public {
        
    }
}
contract test_balanceOf is test_env {

    function checkMint() private returns (bool) {
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
        myft.mint(CA1, expected);
        uint256 result = myft.balanceOf(CA1);
        
        Assert.equal(expected, result, "error msg");
    }
    
    function TestBalanceOfNonDepositCA() public returns (bool) {
        uint256 expected = 0;
        // myft.mint(alice, expected);
        uint256 result = myft.balanceOf(CA2);
        
        Assert.equal(expected, result, "error msg");
    }
    
    function TestBalanceOfCBA() public returns (bool) {
        uint256 expected = 0;
        uint256 result = myft.balanceOf(coinbase);
        
        Assert.equal(expected, result, "error msg");
    }
}


contract test_allwance is test_env {

    function checkMint() private returns (bool) {
        uint256 balanceOfOwner = myft.balanceOf(owner);
        Assert.equal(initSupply, balanceOfOwner, "contract mint error");
    }
    
    function TestAllowanceOfValidEOAToEOA() public returns (bool) {
        uint256 value = 100;
        myft.approve(alice, value);
        uint256 expected = 100;
        uint256 result = myft.allowance(owner, alice);
        
        myft.approve(alice, 0);
        
        Assert.equal(expected, result, "error msg");
    }
 
    function TestAllowanceOfInvalidEOAToEOA() public returns (bool) {
        uint256 value = 100;
        myft.approve(alice, value);
        uint256 expected = 0;
        uint256 result = myft.allowance(owner, bob);
        
        myft.approve(alice, 0);
        
        Assert.equal(expected, result, "error msg");
    }
    
    function TestAllowanceOfValidEOAToCA() public returns (bool) {
        uint256 value = 100;
        myft.approve(CA1, value);
        uint256 expected = 100;
        uint256 result = myft.allowance(owner, CA1);
        
        myft.approve(CA1, 0);
        
        Assert.equal(expected, result, "error msg");
    }
    
    function TestAllowanceOfInvalidEOAToCA() public returns (bool) {
        uint256 value = 100;
        myft.approve(CA1, value);
        uint256 expected = 0;
        uint256 result = myft.allowance(owner, CA2);
        
        myft.approve(CA1, 0);
        
        Assert.equal(expected, result, "error msg");
    }
    
    function TestAllowanceOfEOASelfQuery() public returns (bool) {
        uint256 value = 100;
        myft.approve(owner, value);
        uint256 expected = 100;
        uint256 result = myft.allowance(owner, owner);
        
        myft.approve(owner, 0);
        
        Assert.equal(expected, result, "error msg");
    }
    
    function TestAllowanceOfEOAToCoinBase() public returns (bool) {
        uint256 expected = 0;
        uint256 result = myft.allowance(owner, coinbase);
        
        Assert.equal(expected, result, "error msg");
    }
}


contract test_ownerOf is test_env {

    function checkMint() private returns (bool) {
        mynft.mint(coinbase, tid1);
        
        address expected = alice;
        address result = mynft.ownerOf(tid1);
        Assert.equal(alice, result, "contract mint error");
    }
    
    // function TestApproveForValidEOA() public returns (bool) {
    //     uint256 value = 100;
    //     myft.approve(alice, value);
    //     uint256 expected = 100;
    //     uint256 result = myft.allowance(owner, alice);
        
    //     myft.approve(alice, 0);
        
    //     Assert.equal(expected, result, "error msg");
    // }
    
    // function TestApproveForValidCA() public returns (bool) {
    //     uint256 value = 100;
    //     myft.approve(CA1, value);
    //     uint256 expected = 100;
    //     uint256 result = myft.allowance(owner, CA1);
        
    //     myft.approve(CA1, 0);
        
    //     Assert.equal(expected, result, "error msg");
    // }
}

    
contract test_transfer is test_env {

    function checkMint() private returns (bool) {
        uint256 balanceOfOwner = myft.balanceOf(owner);
        Assert.equal(initSupply, balanceOfOwner, "contract mint error");
    }
    
    function TestTransferValidEOAToEOA() public returns (bool) {
        uint256 value = 100;
        myft.transfer(alice, value);
        uint256 expected = 100;
        uint256 result = myft.balanceOf(alice);
        
        Assert.equal(expected, result, "error msg");
    }
 
    function TestTransferValidEOAToCA() public returns (bool) {
        uint256 value = 100;
        myft.transfer(CA1, value);
        uint256 expected = 100;
        uint256 result = myft.balanceOf(CA1);
        
        Assert.equal(expected, result, "error msg");
    }
}


contract test_transferFrom is test_env {

    function checkMint() private returns (bool) {
        uint256 balanceOfOwner = myft.balanceOf(owner);
        Assert.equal(initSupply, balanceOfOwner, "contract mint error");
    }
    
    function TestTransferFromValidEOAToEOA() public returns (bool) {
        uint256 value = 100;
        myft.approve(owner, value);
        myft.transferFrom(owner, bob, value);
        uint256 expected = 100;
        uint256 result = myft.balanceOf(bob);
        
        Assert.equal(expected, result, "error msg");
    }
    
    function TestTransferFromValidEOAToCA() public returns (bool) {
        uint256 value = 100;
        myft.approve(owner, value);
        myft.transferFrom(owner, CA1, value);
        uint256 expected = 100;
        uint256 result = myft.balanceOf(CA1);
        
        // myft.approve(CA2, 0);
        
        Assert.equal(expected, result, "error msg");
    }
    
    
}


contract test_approve is test_env {

    function checkMint() private returns (bool) {
        uint256 balanceOfOwner = myft.balanceOf(owner);
        Assert.equal(initSupply, balanceOfOwner, "contract mint error");
    }
    
    function TestApproveForValidEOA() public returns (bool) {
        uint256 value = 100;
        myft.approve(alice, value);
        uint256 expected = 100;
        uint256 result = myft.allowance(owner, alice);
        
        myft.approve(alice, 0);
        
        Assert.equal(expected, result, "error msg");
    }
    
    function TestApproveForValidCA() public returns (bool) {
        uint256 value = 100;
        myft.approve(CA1, value);
        uint256 expected = 100;
        uint256 result = myft.allowance(owner, CA1);
        
        myft.approve(CA1, 0);
        
        Assert.equal(expected, result, "error msg");
    }
}