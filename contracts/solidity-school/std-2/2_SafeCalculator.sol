//https://github.com/Aniket-Engg/solidity-school/tree/master/std-2/2_SafeCalculator
// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

/*

Problem Statement
Extend std-1/1_Calculator/Calculator.sol with UINT type by performing below checks in its methods:

Value Overflow
Value Underflow
Invalid Operation
Use require or assert.

Informational Hint
Error Handling
assert(bool condition): causes an invalid opcode and thus state change reversion if the condition is not met - to be used for internal errors.
require(bool condition): reverts if the condition is not met - to be used for errors in inputs or external components.
require(bool condition, string memory message): reverts if the condition is not met - to be used for errors in inputs or external components. Also provides an error message.
revert(): abort execution and revert state changes
revert(string memory reason):abort execution and revert state changes, providing an explanatory string
See the dedicated section on assert and require for more details on error handling and when to use which function here: https://solidity.readthedocs.io/en/latest/control-structures.html#error-handling-assert-require-revert-and-exceptions

*/

contract Calculator {

    /**
     * @dev Add two passed numbers and check variable overflow
     * @param a first number
     * @param b second number
     */

    function add(uint a, uint b) public pure returns (uint) {
        uint c = a + b;
        require(c >= a, "variable overflow");
        return c;
    }

    /**
     * @dev Subtract two passed numbers and first check second number is greater
     *      than first to avoid variable underflow
     * @param a first number
     * @param b second number
     */

    function sub(uint a, uint b) public pure returns (uint) {
        require(b <= a, "variable underflow");
        uint c = a - b;
        return c;
    }

    /**
     * @dev Multiplies two passed numbers and check variable overflow
     * @param a first number
     * @param b second number
     */

    function mul(uint a, uint b) public pure returns (uint) {
        uint c = a * b;
        require(c/a == b, "variable overflow");
        return c;
    }

    /**
     * @dev Divides two passed numbers and first check that it is not a division by zero
     * @param a first number
     * @param b second number
     */

    function div(uint a, uint b) public pure returns (uint) {
        require(b > 0, "invalid operation");
        uint c = a/b;
        return c;
    }
}