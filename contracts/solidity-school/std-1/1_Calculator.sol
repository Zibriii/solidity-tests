// SPDX-License-Identifier: MIT
//https://github.com/Aniket-Engg/solidity-school/tree/master/std-1/1_Calculator


pragma solidity >=0.7.0 <0.9.0;

import "hardhat/console.sol";

/*
Calculator
Problem Statement
Write a contract 'Calculator' to which returns addition, subtraction, multiplication and division of two passed integers without consuming gas. (Ignore various checks on passed parameters for now). Use SPDX License Identifier.

Informational Hint
To define a function which should not consume any gas and return the response immediatly, we should use view or pure function.

Operators
Comparisons: <=, <, ==, !=, >=, > (evaluate to bool)
Bit operators: &, |, ^ (bitwise exclusive or), ~ (bitwise negation)
Arithmetic operators: +, -, unary -, unary +, *, /, % (remainder), ** (exponentiation)
Division by zero and modulus with zero throws an exception.

SPDX License Identifier
Trust in smart contracts can be better established if their source code is available. Since making source code available always touches on legal problems with regards to copyright, the Solidity compiler encourages the use of machine-readable SPDX license identifiers. Every source file should start with a comment indicating its license:

*/

contract Calculator{

    //pure function as does not check any data onchain
        /**
     * @dev adds two passed numbers
     * @param _int1 first number
     * @param _int2 second number
     */
    function add(uint256 _int1, uint256 _int2) public pure returns (uint256){
        return (_int1+_int2);
    }

        /**
     * @dev substracts two passed numbers
     * @param _int1 first number
     * @param _int2 second number
     */    function sub(uint256 _int1, uint256 _int2) public pure returns (uint256){
        return (_int1-_int2);
    }

        /**
     * @dev multiplies two passed numbers
     * @param _int1 first number
     * @param _int2 second number
     */    function mul(uint256 _int1, uint256 _int2) public pure returns (uint256){
        return (_int1*_int2);
    }

        /**
     * @dev divides two passed numbers
     * @param _int1 first number
     * @param _int2 second number
     */    function div(uint256 _int1, uint256 _int2) public pure returns (uint256){
        return (_int1/_int2);
    }



}