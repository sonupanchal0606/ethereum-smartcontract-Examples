# ethereum-smartcontract-Hello-world

platform needed : remix ide : https://remix.ethereum.org/

How to execute code
-------------------
go to the remix ide.
create a new file <any_name.sol> (MyContract1.sol)
copy paste the above code into the file.
go to deploy and run transaction.

there are 3 environment where we can deploy the contract 
 1) Javascript VM : it used broswer based blockchain and wallet. easy to deploy. but everything is gone when refresh
 2)	Injected web3 : it uses metamask for blockchain and wallet. It makes the development slow coz the transactions are mined evrey time we deploy or interact with                       contract. 
 3) web3 provider : it uses local blockchain stored in your computer by ganache truffle

Javascript VM 
-------------
select the "contract" in the contract tab 
just "Deploy" the contract
go to "Deployed Contracts" section
selct the contract and interact with contract using the buttons 

Injected web3
-------------
to use this we need to install metamask.
buy some test ethers (connect to any test network)
deploy the contract by mmaking traction through metamask.
go to the remix IDE 
go to "Deployed Contracts"
select the contract and interact using fucntion buttons

web3 provider
-------------
to use this we need to install ganache truffle. it has local blockchain in the computer. 
to connect to this local blockchain , copy the rpc adress (HTTP://127.0.0.1:7545) from the ganache and copy it into the remix ide.
when you click on web3provider option in remix ide it will ask for "Web3 Provider Endpoint". copy RPC address here. 
when you click on okay, u can see the corresponding transactions into the ganache blockchain
deploy the coontract and interac it with the help of ganache .




