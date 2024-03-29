/*
we can also create Owned.sol file and include here with 
import "./Owned.sol";
*/

pragma solidity ^0.5.11;
contract Owned {
 address owner;

 constructor() public {
 owner = msg.sender;
 }

 modifier onlyOwner {
 require(msg.sender == owner, "You are not allowed");
 _;
 }
}

contract InheritanceModifierExample is Owned {

 mapping(address => uint) public tokenBalance;

 //address owner;
 uint tokenPrice = 1 ether;

 constructor() public {
 //owner = msg.sender;
 tokenBalance[owner] = 100;
 }

 function createNewToken() public onlyOwner {
 //require(msg.sender == owner, "You are not allowed");
 tokenBalance[owner]++;
 }
 
 function burnToken() public onlyOwner {
 //require(msg.sender == owner, "You are not allowed");
 tokenBalance[owner]--;
 }

 function purchaseToken() public payable {
 require((tokenBalance[owner] * tokenPrice) / msg.value > 0, "not enough tokens");
 tokenBalance[owner] -= msg.value / tokenPrice;
 tokenBalance[msg.sender] += msg.value / tokenPrice;
 }

 function sendToken(address _to, uint _amount) public {
 require(tokenBalance[msg.sender] >= _amount, "Not enough tokens");
 assert(tokenBalance[_to] + _amount >= tokenBalance[_to]);
 assert(tokenBalance[msg.sender] - _amount <= tokenBalance[msg.sender]);
 tokenBalance[msg.sender] -= _amount;
 tokenBalance[_to] += _amount;
 }

}
