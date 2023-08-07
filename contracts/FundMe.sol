
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract FundMe{

    address public owner;
    mapping(address=>uint256) public senders;
    address[] public sends;

    constructor(){
        owner=msg.sender;
    }

    function fundMe() public payable {

        require(msg.value>=500000,"not enough crypto");
        senders[msg.sender]+=msg.value;
        sends.push(msg.sender);
    }

    function clear() internal {
        for (uint i=0; i<sends.length;i++) 
        {
            senders[sends[i]]=0;
        }
    }

    modifier onlyOwner{

        require(msg.sender==owner,"you are not the owner");
        _;
    }

    function withdraw() public onlyOwner payable {
        payable(msg.sender).transfer(address(this).balance);
        clear();
    }


}