// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;


contract EtherWallet{
    address private owner;

    constructor(){
        owner=msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender==owner,"Invalid Onwer");
        _;
    }
    
    receive() external payable { }

    function withDraw(uint _amount) onlyOwner payable public {
        payable(msg.sender).transfer(_amount);
    }

    function deposit() onlyOwner public payable {
        payable (address(this)).transfer(msg.value);
    } 

    function getBalance() onlyOwner external view returns(uint256){
        return address(this).balance;
    }

}