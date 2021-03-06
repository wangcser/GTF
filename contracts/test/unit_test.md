# 单元测试

以太坊智能合约单元测试分为两种：
1. 使用 solidity 进行的内部测试
2. 使用 javascript 进行的外部测试

对于内部测试，需要借助相关的测试库来辅助，比如基于 remix 就需要 remix_test.sol,基于 truffle 就需要 truffle/test/ 下的测试合约代码

另一方面，合约测试中的账号问题解决如下：
- 首先是利用测试库为大家封装好的地址
- 另一种方法是利用好 address 类型，除了利用 this 指针获取本合约地址外，剩余的地址可以自己生成，不需要去复制钱包给的默认合约
- 对于其他的合约地址，在构造函数中多创建几个空合约即可

> 终于解决地址的问题了
> 开始写测试代码，并完成测试用例的设计

## remix + solidity 测试

```javascript
pragma solidity ^0.4.7;
import "remix_tests.sol"; // injected by remix-tests
import "./simple_storage.sol";

contract MyTest {
  SimpleStorage foo;
  uint i = 0;

  function beforeAll() {
    foo = new SimpleStorage();
  }

  function beforeEach() {
    if (i == 1) {
      foo.set(200);
    }
    i += 1;
  }

  function initialValueShouldBe100() public {
    Assert.equal(foo.get(), 100, "initial value is not correct");
  }

  function initialValueShouldBe200() public constant returns {
    return Assert.equal(foo.get(), 200, "initial value is not correct");
  }

}
```

#### Available special functions:

- beforeEach() - runs before each test
- beforeAll() - runs before all tests

#### Assert library

| Available functions  | Supported types |
| ------------- | ------------- |
| `Assert.ok()`  | `bool`  |
| `Assert.equal()`  | `uint`, `int`, `bool`, `address`, `bytes32`, `string`  |
| `Assert.notEqual()` | `uint`, `int`, `bool`, `address`, `bytes32`, `string`  |
| `Assert.greaterThan()` | `uint`, `int` |
| `Assert.lesserThan()` | `uint`, `int` |

#### Use a different sender `msg.sender`

It is quite common that a contract need to be tested in different situation.
Especially being able to set before hand the sender account (`msg.sender`) used for a specific tests suite enable quite a lot a new test use cases.
please checkout https://github.com/ethereum/remix/blob/master/remix-tests/tests/various_sender/sender_test.sol for an example.
note that `TestsAccounts` is filled with all the accounts available in `web3.eth.accounts()`.

### 写法

- 对于每个合约写一个测试合约
- 对于每个接口写一个测试的子合约
- 对于每一个接口的每一个测试用例写一个测试函数
- 丢每一个测试函数设置相应的测试环境

### 注意事项

- 测试用例之间可能会相互干扰
- 每次更新用例代码需要编译再执行测试
- 目前的账户方案如何切换合约的调用者？也就是说调用合约的地址如何指定（也就是如何设置 msg.sender 的问题）
- 对于合约中方法执行异常的行为，因为测试代码也是一个合约，因此抛出异常后并不能够得到处理，可能不能在内部代码的测试中解决这个问题

> 使用 try-catch  方式进行异常处理是不可能的：
>
> <https://learnblockchain.cn/2018/04/07/solidity-errorhandler/>
>
> <https://ethereum.stackexchange.com/questions/15182/solidity-is-there-any-catch-mechanism-for-throw-if-not-switch-into-return-usag>
>
> <https://ethereum.stackexchange.com/questions/54855/obtaining-addresses-for-tests-in-solidity>
>
> <https://ethereum.stackexchange.com/questions/61048/is-there-a-way-to-test-an-onlyowner-function-from-a-truffle-solidity-unit-test?rq=1>

![1560651762980](unit_test.assets/1560651762980.png)

- 因此，这些问题只能使用外部脚本来完成
- 所以，对于测试用例中执行失败的场景不在该测试脚本中测试

