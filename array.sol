// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.12;

contract Array{

    uint[] public myUintArray =[5,6,7,8];
    string[] public myStringArray=["a","b", "c"];
    uint256[][] public myArray2D = [[1, 3, 4, 9]];
    string[] public values;


    // 声明传入的该参数是临时的，
    // 永久的 storage，临时的、可读写 memory，只读的 calldata
    // 默认无修饰，无view、pure，可以读写状态，调用会消耗 gas。
    function setValues(string memory _value) public {
        values.push(_value);
    }

    // view 只读函数，只能读取区块链状态，不能写入。调用不消耗 gas（只读）。
    function getValuesCount() public view returns (uint){
        return values.length;
    }

    // 和js的数组写法差不多，支持push和pop
}