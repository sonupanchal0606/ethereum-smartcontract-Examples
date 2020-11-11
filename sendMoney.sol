pragma solidity >=0.4.22 <0.7.0;
contract SendMoneyExample {

 uint public balanceReceived;
 
 //for any function or adress to be able to receive ethers , it has to be payable 
 
 //msg.sender : address of account initiated the transaction
 //msg.value : how much ether were sent alog

 function receiveMoney() public payable {
 balanceReceived += msg.value;
 }

//address(this).balance : gives the balance of the address where smart contract is deployed
 function getBalance() public view returns(uint) {
 return address(this).balance; 
 }

 function withdrawMoney() public {
 address payable to = msg.sender;
 to.transfer(this.getBalance());
 }


 function withdrawMoneyTo(address payable _to) public {
 _to.transfer(this.getBalance());
 }
}
