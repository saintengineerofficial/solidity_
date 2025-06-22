// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.12;

contract Counter{

    // public类似类的对外公开
    // 给变量加 public 是为了能自动生成访问函数，方便链外或其他合约读取。
    uint public count = 0;
    // 上面的声明等价于下面的声明，访问函数
    // function getCout() public view returns (uint){
    //     return count;
    // }

    function incrementCount() public {
        count = count+1;
    }
}
