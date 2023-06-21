// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// Standard
// https://ethereum.org/en/developers/docs/standards/tokens/erc-20/
// https://eips.ethereum.org/EIPS/eip-20

interface IAzathothERC20 {
    // Functions
    function name() external  view returns (string memory); // Optional
    function symbol() external view returns (string memory); // Optional
    function decimals() external view returns (uint8);  // Optional

    function totalSupply() external view returns (uint256);
    function balanceOf(address _owner) external view returns (uint256 balance);
    function transfer(address _to, uint256 _value) external returns (bool success);
    function transferFrom(address _from, address _to, uint256 _value) external returns (bool success);
    function approve(address _spender, uint256 _value) external returns (bool success);
    function allowance(address _owner, address _spender) external view returns (uint256 remaining);

    //Events
    event Transfer(address indexed from, address indexed to, uint amount);
    event Approve(address indexed owner, address indexed to, uint amount);
}