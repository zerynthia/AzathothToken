// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./token/IAzathothERC20.sol";
import "./token/AzathothToken.sol";

contract Shop {
    IAzathothERC20 public token;
    address payable public owner;

    event Bought(uint _amount, address indexed _buyer);
    event Sold(uint _amount, address indexed _seller);

    constructor() {
        token = new AzathothToken(address(this));
    }
}