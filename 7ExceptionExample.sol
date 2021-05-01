pragma solidity >=0.5.11 <0.7.0;
contract ExceptionExample {
/*
Here we could use asserts to make sure we don’t roll over – in both directions! When withdrawals
happen, we don’t suddenly have more balance available than before and when deposits happen that the
balance after depositing is really higher than before
*/
 mapping(address => uint64) public balanceReceived;

 function receiveMoney() public payable {
 assert(balanceReceived[msg.sender] + uint64(msg.value) >= balanceReceived[msg.sender]);
 balanceReceived[msg.sender] += uint64(msg.value);
 }

 function withdrawMoney(address payable _to, uint _amount) public {
 require(_amount <= balanceReceived[msg.sender], "not enough funds.");
 assert(balanceReceived[msg.sender] >= balanceReceived[msg.sender] - _amount);
 balanceReceived[msg.sender] -= uint64(_amount);
 _to.transfer(_amount);
 }
}
