// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.12;

contract mappingContract{
    mapping(uint=>string) public names;

    mapping(uint=>Book) public books;

    mapping(address => mapping(uint=>Book)) public myBooks;

    struct Book{
        string title;
        string author;
    }

    constructor(){
        names[1] = 'a';
        names[2] = 'b';
        names[3] = 'c';
    }

    function addBook(uint _id,string memory _title,string memory _author) public {
        books[_id] = Book(_title,_author);
    }

    function addMyBook(uint _id,string memory _title,string memory _author) public {
        myBooks[msg.sender][_id] = Book(_title,_author);
    }
}