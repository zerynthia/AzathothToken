// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./AzathothERC20.sol";

contract AzathothToken is AzathothERC20 {
    constructor(address _shop) AzathothERC20("AzathothToken", "AZH", 42, _shop) {}
}