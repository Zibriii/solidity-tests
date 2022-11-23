// SPDX-License-Identifier: MIT
//https://github.com/Aniket-Engg/solidity-school/tree/master/std-1/1_Calculator


pragma solidity >=0.7.0 <0.9.0;

import "hardhat/console.sol";

/*

Problem Statement
Write a function getStage(), which should take no. of months as a parameter and return the user its lifecycle stage. Stages can be:

Infant (<1 year)
Toddler (1-2 years)
Child (3-12 years)
TeenAger (13-19 years)
Adult (20-60 years, just accept it 😬)
Old (>60 years)
Use enum for stage listing.

Informational Hint
Enums
Enums are one way to create a user-defined type in Solidity. They are explicitly convertible to and from all integer types but implicit conversion is not allowed. The explicit conversion from integer checks at runtime that the value lies inside the range of the enum and causes a failing assert otherwise. Enums require at least one member, and its default value when declared is the first member.

The data representation is the same as for enums in C: The options are represented by subsequent unsigned integer values starting from 0.

*/

contract Lifecycle{

    enum Stage{Infant, Toddler, Child, Teen, Adult, Old}


    function getStage(uint _months) public pure returns(Stage){
         if(_months > 0 && _months <= 12)
            return Stage.Infant;
        else if(_months > 12 && _months <= 24)
            return Stage.Toddler;
        else if(_months > 24 && _months <= 155)
            return Stage.Child;
        else if(_months > 156 && _months <= 228)
            return Stage.Teen;
        else if(_months > 228 && _months <= 720)
            return Stage.Adult;
        else
            return Stage.Old;
    }
}