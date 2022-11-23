// SPDX-License-Identifier: GPL-3.0
//https://github.com/Aniket-Engg/solidity-school/tree/master/std-0/2_Storage


pragma solidity >=0.7.0 <0.9.0;

import "hardhat/console.sol";

//Write a contract to set a hard coded value (e.g: suppose 5) to an integer variable. User can check its value anytime without consuming gas.
contract Storage{

/*
Integer
Solidity has introduced both signed and unsigned integer numbers of various size. For unsigned, uint8 to uint256 and for signed int8 to int256 in steps 
of 8 (unsigned of 8 up to 256 bits). uint and int are aliases for uint256 and int256, respectively.

State Variable
Variables in Ethereum usually refers as 'State Variables'. State variables are values which are permanently stored in contract storage. Think of it as a single slot 
in a database that can be queried and altered by calling functions of the code that manages the database.
*/



    uint8 contractInteger;

    function setIntValue(uint8 _intValue) public {
       contractInteger=_intValue;
    }

    function getIntValue() public view returns (uint8){
        console.log("contractInteger ",contractInteger);
        return contractInteger;
    }

} 