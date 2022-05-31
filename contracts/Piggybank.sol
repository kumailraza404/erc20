// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract PiggyBAnk {

    event WithDraw(uint amount);
    event Deposit(uint amount);
    
    address public owner;
    
    constructor(){
        owner = msg.sender;
    }
    receive() external payable {
        emit Deposit(msg.value);
    }

    function withDraw() external payable{
        require(msg.sender == owner, "not owner");
        emit WithDraw(address(this).balance);
        selfdestruct(payable(msg.sender));
    }
}