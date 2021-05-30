// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0;

/* 
3 ways to send money from one account to another
1)transfer (forwards 2300 gas, throws error )
2)send (calls fallback internally, forwards 2300 gas, return bool )
3)call (calls fallback internally, forwards all gas or set gas, retuen bool )
(call is recommended after dec 2019 to mention the amount of gas required)

*/

contract ReceiveEther{
    
    fallback() payable external  {} // receive ethers 
    
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}

contract SendEther {
    function sendViaTransfer(address payable _to) public payable {
        _to.transfer(msg.value); //throws error if transfer Failed
    }
    
    function sendViaSend(address payable _to) public payable {
        bool sent = _to.send(msg.value); //returns true if transfer was successful esle false
        require(sent, "Failed to send ether");
    }
    
    function sendViaCall(address payable _to) public payable {
        //_to.call.value(msg.value)("");
        //_to.call.gas(1000).value(msg.value)(""); //if you want to specify how much gas to be forwarded 
        //(bool sent , bytes memory data) = _to.call.value(msg.value)(""); //before solidity 0.5.1000
        //bool sent : if transfer was successful
        // data : value returned by fallback function. in this case 0 bytes as function return nothing
        (bool sent , bytes memory data) = _to.call{value: msg.value}("");
        require(sent, "Failed to send ether");
    }
}

