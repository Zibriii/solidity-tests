// SPDX-License-Identifier: GPL-3.0
//https://github.com/Aniket-Engg/solidity-school/tree/master/std-0/3_Greeter


pragma solidity >=0.7.0 <0.9.0;

import "hardhat/console.sol";

/*Greeter
Problem Statement
Write a contract 'Greeter' which should set a string with value passed by user. User can check the string value anytime without consuming any gas. Also, this string 
should not be accessible to any other contract.

Informational Hint
String
Solidity provides string data type for arbitrary-length string (UTF-8) data. String literals are written with either double or single-quotes ("foo" or 'bar'). They do not imply trailing zeroes as in C; "foo" represents three bytes, not four.

Data Location
Since v0.5.0, explicit data location(memory, storage and calldata) for all variables of struct, array or mapping types is now mandatory. This is also applied to function parameters and return variables. For return variables, data location must be memory.

Visibility Specifier
There are four types of visibilities for functions and state variables.

Functions have to be specified as being external, public, internal or private. For state variables, external is not possible.

-external: External functions are part of the contract interface, which means they can be called from other contracts and via transactions. An external function f cannot be called internally (i.e. f() does not work, but this.f() works). External functions are sometimes more efficient when they receive large arrays of data.
-public: Public functions are part of the contract interface and can be either called internally or via messages. For public state variables, an automatic getter function is generated.
-internal: Those functions and state variables can only be accessed internally (i.e. from within the current contract or contracts deriving from it), without using this.
-private: Private functions and state variables are only visible for the contract they are defined in and not in derived contracts.*/


contract Greeter{

    string private _name ;


    function setName(string memory _nameParameter) public {
        _name=_nameParameter;
    }

    function greetUser() public view returns (string memory) {
        console.log("Hello ",_name);
        return _name;
    }


}