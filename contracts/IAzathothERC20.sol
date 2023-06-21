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

    function mint(uint _value, address _shop) external; // Additional
    function burn(address _from, uint _value) external; // Additional

    //Events
    event Transfer(address indexed _from, address indexed _to, uint _value);
    event Approve(address indexed _owner, address indexed _to, uint _value);
}