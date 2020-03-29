pragma solidity ^0.5.15;

import {DSTest} from 'ds-test/test.sol';
import {DSMath} from 'ds-math/math.sol';

import "./DummyERC20.sol";


contract DummyERC20Test is DSTest, DSMath {
    DummyERC20 public dummyERC20; 
    address public self;
    uint public initialAmount;

    function setUp() public {
        self = address(this);
        initialAmount = 500;

        dummyERC20 = new DummyERC20(self, initialAmount);
    }

    function testFail_basic_sanity() public {
        assertTrue(false);
    }

    function test_basic_sanity() public {
        assertTrue(true);
    }

    function testTransfer() public {
        address receiver = 0x5c222fc7735E1d7C6EFA7fb7e2AaD29865662BbD;
        uint transferAmount = 10;

        dummyERC20.transfer(receiver, transferAmount);
        assertEq(dummyERC20.balanceOf(self), sub(initialAmount, transferAmount));
        assertEq(dummyERC20.balanceOf(receiver), transferAmount);
    }

    function testFailTransferZeroAddress() public {
        dummyERC20.transfer(address(0x0), 30);
    }
}
