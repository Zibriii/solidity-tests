// SPDX-License-Identifier: MIT
//https://github.com/Aniket-Engg/solidity-school/tree/master/std-2/4_Rent
pragma solidity >=0.7.0 <0.9.0;

import "hardhat/console.sol";

/*Problem Statement
Write a contract named "Rent" which will be deployed by Landlord and all ethers transferred on this contract address will be automatically transferred to landlord's address, So that tenant can use contract address to pay rent. At the time of contract deployment, landlord will provide the information of tenant which will be public. Information of tenant will be name, age & occupation.

Use receive() function wherever required.

Informational Hint
Payable address
An address expected to receive some of the ether should be declared using address payable. An address not already declared payable at run time can be type casted like payable(addressVariable)

Receive Ether Function
A contract can have at most one receive function, declared using receive() external payable { ... }(without the function keyword). This function cannot have arguments, cannot return anything and must have external visibility and payable state mutability. It is executed on a call to the contract with empty calldata. This is the function that is executed on plain Ether transfers (e.g. via .send() or .transfer()).

*/

contract Rent{

    address public landlord;
    string public tenantName;
    uint public tenantAge;
    string public tenantOccupation;


    /**
     * @dev Constructor
     * @param _name Tenant name
     * @param _age Tenant age
     * @param _occupation Tenant occupation
     */
    constructor (string memory _name, uint _age, string memory _occupation) {
        tenantName = _name;
        tenantAge = _age;
        tenantOccupation = _occupation;
        landlord = msg.sender;
    }

    receive() external payable {
        payable(landlord).transfer(msg.value);
    }
}

