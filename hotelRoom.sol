// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.12;


contract HotelRoom{

    // 声明一个枚举
    enum Statuses { Vacant,Occupied }
    Statuses public currentStatus;

    // 定义一个事件，当房间被成功租用时触发。
    event Occupy(address _occupant,uint _value);

    // payable 表示这个地址可以接收以太币。
    address payable public owner;

    constructor(){
        owner = payable(msg.sender);
        currentStatus = Statuses.Vacant;
    }

    // modifier 类比成 Web 框架里的中间件：
    // 它是一个可复用的代码块，可以插入到函数执行前/后，用于检查权限、状态、支付金额等
    modifier onlyWhileVacant {
        //满足添加才会执行下面，否则停止执行
        require(currentStatus == Statuses.Vacant,"Currently occupied");
        
        // _ 代表被修饰的函数体内容
        // 把book函数插入到onlyWhileVacant中的 _ 的位置
        _; 
    }

    modifier costs(uint _amount){
        require(msg.value >= _amount,"not enough fund");
        _;
    }

    // 函数体内用到 `msg.value` 不等于 0 | 函数必须加 `payable`
    // 只要期望调用者能给函数转钱，函数必须写 payable
    // 函数需要接收以太币（即调用时会带上 msg.value > 0），就必须标记为 payable。
    function book() payable public onlyWhileVacant costs(2 ether) {

        // require(currentStatus == Statuses.Vacant,"Currently occupied"); //满足添加才会执行下面，否则停止执行
        // require(msg.value >= 2 ether,"not enough fund");
        currentStatus = Statuses.Occupied;

        // owner.transfer(msg.value);
        // 使用 .call{value:msg.value}("") 向 owner 发送以太币，比如transfer更好
        // 最好的括号可以调用目标合约中某个函数
        (bool sent,bytes memory data) = owner.call{value:msg.value}("");
        require(true);

        emit Occupy(msg.sender,msg.value);
    }


}