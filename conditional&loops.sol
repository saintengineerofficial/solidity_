// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.12;


contract conditionalOrLoops{

    uint[] public numbers = [1,5,9,4];

    function countEvenNumber() public view returns(uint) {

        uint count = 0;
        for(uint i =0;i<numbers.length;i++){
            if(isEvenNumber(numbers[i])){
                count++;
            }
        }
        return count;
    }

    function isEvenNumber(uint _number) public pure returns(bool){
       return _number % 2 == 0;
    } 

}