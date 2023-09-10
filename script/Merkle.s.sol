// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";

import {MerkleTree, MerkleProof} from "../contracts/MerkleTree.sol";

contract MerkleScript is Script {

    event BroadcastProof(address proof, bytes32 root);

    bytes32[] internal LEAVES;
    bytes32 public root;

    function setUp() public {
        LEAVES = new bytes32[](5);
        LEAVES[0] = bytes32(uint256(0));
        LEAVES[1] = bytes32(uint256(1));
        LEAVES[2] = bytes32(uint256(2));
        LEAVES[3] = bytes32(uint256(3));
        LEAVES[4] = bytes32(uint256(4));
        root = MerkleTree.build(LEAVES);
    }

    function run() public {
        vm.broadcast();
        MerkleProof proof = new MerkleProof(root);
        emit BroadcastProof(address(proof), root);
    }
}
