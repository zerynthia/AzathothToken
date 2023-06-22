// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./IAzathothERC20.sol";

abstract contract AzathothERC20 is IAzathothERC20 {
    address owner;
    mapping (address => uint) balances;
    mapping(address => mapping(address => uint)) allowances;
    string _name;
    string _symbol;
    uint totalTokens;

    constructor(string memory name_, string memory symbol_, uint _initialSupply, address _shop) {
        _name = name_;
        _symbol = symbol_;
        owner = msg.sender;
        mint(_initialSupply, _shop);
    }

    modifier enoughTokens(address _from, uint _amount) {
        require(balanceOf(_from) >= _amount, "not enough tokens!");
        _;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "not an owner!");
        _;
    }

    function _beforeTokenTransfer(
        address _from,
        address _to,
        uint _value
    ) internal virtual {}


    function name() external view returns(string memory) {
        return _name;
    }

    function symbol() external view returns (string memory) {
        return _symbol;
    }

    function decimals() external pure returns(uint8) {
        return 18; // 1 token = 1 wei
    }

    function totalSupply() external view returns (uint256) {
        return totalTokens;
    }

    function balanceOf(address _owner) public view returns (uint256 balance) {
        return balances[_owner];
    }

    function transfer(address _to, uint256 _value) external enoughTokens(msg.sender, _value) returns (bool success) {
        _beforeTokenTransfer(msg.sender, _to, _value);
        
        balances[msg.sender] -= _value;
        balances[_to] += _value;

        emit Transfer(msg.sender, _to, _value); 

        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public enoughTokens(_from, _value) returns (bool success) {
        _beforeTokenTransfer(_from, _to, _value);

        allowances[_from][_to] -= _value; // error!
        balances[_from] -= _value;
        balances[_to] += _value;

        emit Transfer(_from, _to, _value);

        return true;
    }

    function _approve(address _sender, address _spender, uint256 _value) internal virtual {
        allowances[_sender][_spender] = _value;

        emit Approve(_sender, _spender, _value);
    }

    function approve(address _spender, uint256 _value) external returns (bool success) {
        _approve(msg.sender, _spender, _value);
        
        return true;
    }

    function allowance(address _owner, address _spender) external view returns (uint256 remaining) {
        return allowances[_owner][_spender];
    }

    function mint(uint _value, address _shop) public onlyOwner {
        _beforeTokenTransfer(address(0), _shop, _value);

        balances[_shop] += _value;
        totalTokens += _value;

        emit Transfer(address(0), _shop, _value);
    }

    function burn(address _from, uint _value) public onlyOwner {
        _beforeTokenTransfer(_from, address(0), _value);

        balances[_from] -= _value;
        totalTokens -= _value;
    }
}
