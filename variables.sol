// reference : https://www.udemy.com/course/blockchain-developer/?referralCode=E8611DF99D7E491DFD96
pragma solidity >=0.4.22 <0.7.0;

contract WorkingWithVariables {
    
uint256 public myUint; //by default int are 0  uint are 256 bit long

function setMyUint(uint _myUint) public { //u can use myUint also but it will cause confusion 
myUint = _myUint;
}

bool public myBool; // deafult value false

function setMyBool(bool _myBool) public {
myBool = _myBool;
}

uint8 public myUint8; //Uint8 ranges from 0 to 255.
//With Solidity you have to be careful about overflows and underflows. There are no warnings!
function incrementUint() public {
myUint8++;
}
function decrementUint() public {
myUint8--;
}

address public myAddress; //default X00...00 (20 byte long)

function setAddress(address _address) public {
myAddress = _address;
}
function getBalanceOfAccount() public view returns(uint) {
return myAddress.balance;
}

string public myString = 'hello world!'; // default string = "" string chars  cant be accessed with indexing .
// strings are expensive in solidity coz to store more data in blockchain , we need to pay for that.
function setMyString(string memory _myString) public {
myString = _myString;
}

}
