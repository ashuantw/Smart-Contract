// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;
contract Helloworld {
    function hello() view public returns (uint) {
        return block.timestamp;
    }
}