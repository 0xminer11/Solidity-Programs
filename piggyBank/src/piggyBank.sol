// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.0;


contract piggyBank{
    address private owner;

    constructor(){
        owner = msg.sender;
    }

    // it withdraws the balance from contract after withdraw it will delete the contract
    function withdraw() payable public{
        require(owner == msg.sender,"Invalid Owner");
        payable(msg.sender).transfer(address(this).balance);
        selfdestruct(payable(msg.sender));
    }

    // get the owner address
    function getOwner() view external returns(address){
        return owner;
    }

    // get the balance of this contract
    function getBalance() view external returns(uint){
        return address(this).balance;
    }

    receive() external payable { }


}