pragma solidity ^0.6.0;

/*
UPDATE Solidity 0.6: The “fallback” function is called when no other function matches and no money is sent along. 
The “receive” function matches when no other function matches and money is sent along.

If you deploy the smart contract with the new functions, you can retrieve the owner with a custom
getter function and you can convert wei to ether.
Pure functions can not read from state or modify the state in any way
View function can read from state but not modify the state
Both are free, because reading only applies to your local copy of the blockchain. There is no need for
mining.
*/

contract FunctionsExample {
mapping(address => uint) public balanceReceived; //balanceReceived and owner are called storage variables
address payable owner;
constructor() public {
owner = msg.sender;
}

function destroySmartContract() public {
require(msg.sender == owner, "You are not the owner");
selfdestruct(owner);
}

function receiveMoney() public payable {
assert(balanceReceived[msg.sender] + msg.value >= balanceReceived[msg.sender]);
balanceReceived[msg.sender] += msg.value;
}

function withdrawMoney(address payable _to, uint _amount) public {
require(_amount <= balanceReceived[msg.sender], "not enough funds.");
assert(balanceReceived[msg.sender] >= balanceReceived[msg.sender] - _amount);
balanceReceived[msg.sender] -= _amount;
_to.transfer(_amount);
}

function getOwner() public view returns(address) {
return owner;
}

//pure functions cant access the storage variables
function convertWeiToEth(uint _amountInWei) public pure returns(uint) {
return _amountInWei / 1 ether;
}

receive () external payable {
receiveMoney();
}

}
