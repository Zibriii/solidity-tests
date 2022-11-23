// SPDX-License-Identifier: MIT
//https://github.com/Aniket-Engg/solidity-school/tree/master/std-3/2_AttendanceRegisterExtended
pragma solidity >=0.7.0 <0.9.0;

import "hardhat/console.sol";
import "../std-2/5_AttendanceRegister.sol";

/*

Problem Statement
In this problem we will use Inheritance.

Inherit the AttendanceRegister contract in std-2 and create a new contract with name AttendanceRegisterExtended. This new contract should have a method to get the details of Student using rollnumber.

Informational Hint
Inheritance
Solidity supports multiple inheritance including polymorphism.

It is possible to call functions further up in the inheritance hierarchy internally by explicitly specifying the contract using ContractName.functionName()

Know more: https://docs.soliditylang.org/en/latest/contracts.html#inheritance

*/


contract AttendanceRegisterExtended is AttendanceRegister{


    /// @dev Function returns an object of type Student struct from Attendence Register
    function getStudentByRoll (uint256 _roll) public view returns (Student memory){
        return register[_roll];
    }}


