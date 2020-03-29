pragma solidity ^0.5.15;

import "ds-test/test.sol";

import "./Dapphubtest.sol";

contract DapphubtestTest is DSTest {
    Dapphubtest dapphubtest;

    function setUp() public {
        dapphubtest = new Dapphubtest();
    }

    function testFail_basic_sanity() public {
        assertTrue(false);
    }

    function test_basic_sanity() public {
        assertTrue(true);
    }
}
