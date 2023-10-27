// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.15;

import { Test } from "forge-std/Test.sol";
import { MerkleTree, MerkleProof } from "../contracts/MerkleTree.sol";

contract MerkleTreeTest is Test {
    // solhint-disable-next-line var-name-mixedcase
    bytes32[] private LEAVES;
    MerkleProof public proof;

    function setUp() public {
        LEAVES = new bytes32[](5);
        LEAVES[0] = hash(0);
        LEAVES[1] = hash(1);
        LEAVES[2] = hash(2);
        LEAVES[3] = hash(3);
        LEAVES[4] = hash(4);

        bytes32 root = MerkleTree.build(LEAVES);
        proof = new MerkleProof(root);
    }

    function testMerkleProof() public {
        assertTrue(proof.verify(LEAVES, MerkleTree.ZERO_BLOCK));
    }

    function testNonMatching() public {
        bytes32[] memory altProof = new bytes32[](2);
        altProof[0] = hash(0);
        altProof[1] = hash(1);
        assertFalse(proof.verify(altProof, MerkleTree.ZERO_BLOCK));
        LEAVES[3] = hash(5);
        assertFalse(proof.verify(LEAVES, MerkleTree.ZERO_BLOCK));
    }

    function testNewLeaf() public {
        bytes32 zero = hash(64);
        assertFalse(proof.verify(LEAVES, zero));
    }

    function testBuildRainbow() public {
        bytes32[] memory rainbow = buildRainbow();
        bytes32 root = MerkleTree.build(rainbow);
        assertEq(root, hex"e061c06b113aaf012feb52415005890061b9751da9948ac8e38b935bb4dac434");
    }

    function hash(uint256 i) private pure returns (bytes32) {
        return keccak256(abi.encode(i));
    }

    function buildRainbow() private pure returns (bytes32[] memory) {
        string[30] memory rainbow = [
            "scarlet",
            "red",
            "crimson",
            "vermilion",
            "coral",
            "tangerine",
            "orange",
            "apricot",
            "gold",
            "sun yellow",
            "yellow",
            "lemon yellow",
            "pale yellow",
            "chartreuse",
            "lime",
            "light green",
            "green",
            "jade",
            "mint",
            "turquoise",
            "cyan",
            "sky blue",
            "blue",
            "cobalt blue",
            "royal blue",
            "indigo",
            "navy blue",
            "lavender",
            "violet",
            "purple"
        ];
        bytes32[] memory rainbowBytes = new bytes32[](rainbow.length);
        for (uint256 i = 0; i < rainbow.length; i++) {
            rainbowBytes[i] = keccak256(abi.encode(rainbow[i]));
        }
        return rainbowBytes;
    }
}
