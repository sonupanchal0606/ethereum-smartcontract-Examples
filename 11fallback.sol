// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0;

/* 
fallback function
The fallback function has changed in Solidity 0.6. It is no longer a no-name function, it is
now two functions, depending on the use case:

UPDATE Solidity 0.6:
The “fallback” function is called when no other function matches and no money is sent along.
The “receive” function matches when no other function matches and money is sent along.

3 ways to send money from one account to another
1)transfer (forwards 2300 gas, throws error )
2)send (calls fallback internally, forwards 2300 gas, return bool )
3)call (calls fallback internally, forwards all gas or set gas, retuen bool )
(call is recommended after dec 2019 to mention the amount of gas required)

-fallback function is called when no function matches and to Receive Ether
-Receive 2300 gas from transfer and send methods 
-can Receive all gas from call method 
-its not recommended to write much code inside the fallback function as it can receive 
only 2300 gas and not much computation can be done with this gas so the send or tranfer can fail

*/

contract Fallback {
    
    event Log(uint gas);
    
    //fallback() payable external  {
    receive() payable external  {
        //send/tranfer forwards 2300 to this function
        emit Log(gasleft()); // to check how much gas is left after being called by send/transfer/call
    }
    
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}

contract testFallback {
    function sendViaTransfer(address payable _to) public payable {
        _to.transfer(msg.value); //throws error if transfer Failed
    }
    
    function sendViaSend(address payable _to) public payable {
        bool sent = _to.send(msg.value); //returns true if transfer was successful esle false
        require(sent, "Failed to send ether");
    }
    
    function sendViaCall(address payable _to) public payable {
        //(bool sent , bytes memory data) = _to.call{value: msg.value}("");// this also works 
        (bool sent ,) = _to.call{value: msg.value}("");
        require(sent, "Failed to send ether");
    }
}

/*
output after sending 1 ether to Fallback/Receive function gas left

transfer(Fallback)
-----------------
logs	[ { "from": "0x9D7f74d0C41E726EC95884E0e97Fa6129e3b5E99", 
"topic": "0x909c57d5c6ac08245cf2a6de3900e2b868513fa59099b92b27d8db823d92df9c", 
"event": "Log", "args": { "0": "2254", "gas": "2254" } } ] 

transfer(receive)
----------------
logs	[ { "from": "0xcD6a42782d230D7c13A74ddec5dD140e55499Df9", 
"topic": "0x909c57d5c6ac08245cf2a6de3900e2b868513fa59099b92b27d8db823d92df9c", 
"event": "Log", "args": { "0": "2240", "gas": "2240" } } ]
 
send(Fallback)
----------------
logs	[ { "from": "0x9D7f74d0C41E726EC95884E0e97Fa6129e3b5E99", 
"topic": "0x909c57d5c6ac08245cf2a6de3900e2b868513fa59099b92b27d8db823d92df9c", 
"event": "Log", "args": { "0": "2254", "gas": "2254" } } ]

send(receive)
----------------
logs	[ { "from": "0xcD6a42782d230D7c13A74ddec5dD140e55499Df9", 
"topic": "0x909c57d5c6ac08245cf2a6de3900e2b868513fa59099b92b27d8db823d92df9c", 
"event": "Log", "args": { "0": "2240", "gas": "2240" } } ]

call(fallback)
--------------
logs	[ { "from": "0x9D7f74d0C41E726EC95884E0e97Fa6129e3b5E99", 
"topic": "0x909c57d5c6ac08245cf2a6de3900e2b868513fa59099b92b27d8db823d92df9c", 
"event": "Log", "args": { "0": "2929425", "gas": "2929425" } } ]

call(Receive)
-------------
logs	[ { "from": "0xcD6a42782d230D7c13A74ddec5dD140e55499Df9", 
"topic": "0x909c57d5c6ac08245cf2a6de3900e2b868513fa59099b92b27d8db823d92df9c", 
"event": "Log", "args": { "0": "2929411", "gas": "2929411" } } ] 

*/

