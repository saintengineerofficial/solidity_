// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.12;

// 权限基类
contract Ownable{
    address owner;
    modifier onlyOwner(){
        // 判断调用合约的人
        require(owner == msg.sender,"must be owner");
        _;
    }

    constructor(){
        // 保存当前合约的所有者地址，即部署这个合约的人
        owner = msg.sender;
    }
}

contract SecretVault {

    string secret;

    constructor(string memory _secret)  {
        secret = _secret;
    }

    function getSecret() public view returns (string memory) { 
        return secret;
    }
}

// 继承 Ownable
contract myContract is Ownable {

    SecretVault public secretVault;

    constructor(string memory _secret){
        secretVault = new SecretVault(_secret);
    }

    function getSecret() public view onlyOwner returns (string memory) { 
        
        return secretVault.getSecret();
    }
}