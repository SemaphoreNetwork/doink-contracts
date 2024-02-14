// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import {Doink} from "../Doink.sol";
import {stdStorage, StdStorage, Test} from "forge-std/Test.sol";
import {VmSafe} from "forge-std/Vm.sol";

contract DoinkTest is Test {
    Doink public doink;

    function setUp() public {
        // Deploy the Doink contract.
        doink = new Doink(50);
    }

    function test_Doink__mint_works() public {
        
    }
}
