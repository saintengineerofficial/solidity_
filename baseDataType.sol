// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.12;

contract BaseDataType{

    uint public myUint = 1;
    uint256 public  myUint256 = 1;
    // 上面二者是一样的，只能是正整数

    uint8 public myUint8 = 1; // 16进制都可以声明

    int public myInt = 1;//整数

    string public myString = 'helloWrold'; // 字符串
    bytes32 public myBytes32 = 'helloWrold'; // 字节，存储字符串长度？？

    address public myAddress = 0x948611313071356eb9c46B0d598A60b8e1155d99; // 存储账户

    // 类似typescript的interface类型声明，不是变量
    struct MyStruct {
        uint x;
        string y;
    }
    MyStruct public myStruct = MyStruct(1,'hello');

    // 局部作用域，pure类似纯函数，不影响外部变量，returns指定返回类型
    function getValue() public pure returns (uint){
        uint value = 1;
        return value;
    }

}