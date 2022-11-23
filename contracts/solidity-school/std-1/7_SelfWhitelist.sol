// SPDX-License-Identifier: MIT
//https://github.com/Aniket-Engg/solidity-school/tree/master/std-1/7_SelfWhitelist


/*
SelfWhitelist
Problem Statement
Write a contract 'SelfWhitelist' which implements two functions named whitelist & check. It maintains a list of whitelisted addresses. (Use Array)

whitelist() accepts an address as parameter and stores it in the whitelist. Passed address should be of the person calling the method.

check() checks if callee (address calling the method) exists in the whitelist and returns true otherwise false, without consuming gas.

Informational Hint
Special Variables
msg.data (bytes calldata): complete calldata
msg.sender (address payable): sender of the message (current call)
msg.sig (bytes4): first four bytes of the calldata (i.e. function identifier)
msg.value (uint): number of wei sent with the message

*/


pragma solidity >=0.7.0 <0.9.0;

import "hardhat/console.sol";

contract SelfWhitelist{

    address[] private _whitelistedAddresses;

    function whitelist(address _callingAddress) public{
        require(_callingAddress==msg.sender, "Error, the address should be the one of the caller");
        _whitelistedAddresses.push(_callingAddress);
    }

    function check() public view returns (bool){
         for(uint i = 0; i < _whitelistedAddresses.length; i++){
            if(_whitelistedAddresses[i] == msg.sender)
                return true;
        }
        return false;
    }


}
