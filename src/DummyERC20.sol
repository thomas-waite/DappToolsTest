pragma solidity ^0.5.15;

import {DSMath} from 'ds-math/math.sol';

contract DummyERC20 is DSMath {
    mapping(address => uint256) public balances;

    constructor (address startingAddress, uint startingBalance) public {
        balances[startingAddress] = startingBalance;
    }

    function transfer(address receiver, uint256 amount) public {
        require(balances[msg.sender] > amount, 'sender balance insufficient');
        require(receiver != address(0x0), 'can not transfer to zero address');
        
        uint remainingBalance = sub(balanceOf(msg.sender), amount);
        balances[msg.sender] = remainingBalance;

        balances[receiver] = amount;
    }

    function balanceOf(address user) public view returns (uint) {
        return balances[user];
    }
}
