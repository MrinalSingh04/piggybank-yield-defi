// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "forge-std/Test.sol";
import "../src/PiggyBankYield.sol";

contract PiggyBankYieldTest is Test {
    PiggyBankYield vault;

    function setUp() public {
        vault = new PiggyBankYield();
    }

    function testDeposit() public {
        vm.deal(address(this), 10 ether);
        vault.deposit{value: 1 ether}();
        assertEq(vault.shares(address(this)), 1 ether);
    }
}
