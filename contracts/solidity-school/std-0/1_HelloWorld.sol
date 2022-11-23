// SPDX-License-Identifier: GPL-3.0
//https://github.com/Aniket-Engg/solidity-school/tree/master/std-0/1_HelloWorld


pragma solidity >=0.7.0 <0.9.0;

import "hardhat/console.sol";


contract HelloWorld{

    //pure function : does not use gas (does not read blockchain data or change state
    //view functions : do not use gas as well (only read blockchain)
    function print() public pure returns (string memory){
        return "Hello World!";
    }

} 
