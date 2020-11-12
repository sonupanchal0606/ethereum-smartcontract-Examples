pragma solidity >=0.4.22 <0.7.0;
/*
//sendMoney funcion receives the money sent from the address  who called this function with ether as argumment 
//and store it in the contract
contract StartStopUpdateExample {
 function sendMoney() public payable {
 }
 
 //this function transfer the contract mmoney to _to address.
 //problem with below function is that anyone can call this function. 
 //if we want that only owner of the contract should be able to call this function we use require keyword
 function withdrawAllMoney(address payable _to) public {
 _to.transfer(address(this).balance);
 }
}

//constructor is only called once during the contact deployement
*/

contract StartStopUpdateExample {

 address owner;
 bool public paused; // by default bool are false

 constructor() public {
 owner = msg.sender;
 }

 function sendMoney() public payable {
 }a
 
 function withdrawAllMoney(address payable _to) public {
 require(msg.sender == owner, "You cannot withdraw!"); //it makes sure that only owner of the smart contract can call this function
 require(!paused, "Contract Paused currently"); // if pasused ==true , !Paused = false ,ie no one can withdrar money
 _to.transfer(address(this).balance);
 }
 
 function destroySmartContract(address payable _to) public {//selfdestruct destroy Smart Contract
 require(msg.sender == owner, "You are not the owner"); // makes sure only owner can call this function
 selfdestruct(_to); //available funds in Smart Contract are sent to _to address
 }
}
