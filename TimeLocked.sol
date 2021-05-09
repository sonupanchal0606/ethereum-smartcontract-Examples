pragma solidity >=0.7.0 <0.9.0;

contract TimeLocked
{
    mapping(address  => uint) public account;
    
    //working fine but input value must be in wei
    function claim(uint _amount) public payable{
    require(_amount <= account[msg.sender], "owner doesn't own enough money");
    account[msg.sender] -= _amount;
    address payable to = payable(msg.sender);
    to.transfer(_amount);
    }
    
    
    //working fine
    //put check for wrap arround//np need above solidity 8.
    //so this is perfect
    function deposit() public payable { 
        account[msg.sender] += msg.value;
    }
    
}
