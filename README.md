## MerkeTree Study

** Merkle Tree study and tutorial written with Foundry**

A Merkle tree, sometimes known as a hash tree, is a data structure used in computer science and cryptography. It is a binary tree in which every leaf node is labelled with the cryptographic hash of a data block, and each non-leaf node is labelled with the cryptographic hash of the labels of its child nodes. Here's a breakdown of the Merkle tree:

1. **Purpose**: 
   - Merkle trees are primarily used in distributed systems and blockchains to verify large data sets efficiently. By just comparing the top hash (the root of the Merkle tree), one can confirm whether the underlying data is identical without comparing the data directly.

2. **Hash Function**: 
   - The hashes used in a Merkle tree are usually cryptographic hash functions like SHA-256.

3. **Construction**: 
   - Take a list of transactions/data and hash each item to get a set of hashes.
   - Pair the sequential hashes and hash them together. If there's an odd number of hashes, duplicate the last hash so that it has a pair.
   - Continue the process of pairing and hashing until you're left with a single hash, known as the Merkle root.

4. **Verification**:
   - One of the primary advantages of Merkle trees is the ability to verify whether a specific transaction is included in the set by checking only a small subset of hashes. This is especially useful in blockchain settings, like Bitcoin, where lightweight clients want to confirm transactions without downloading the entire blockchain.
   
5. **Applications**:
   - **Blockchain and Cryptocurrencies**: The most prominent use today is in blockchains. For instance, in Bitcoin, each block's header contains a Merkle root of all the transactions in that block. This allows for efficient data verification.
   - **Distributed Systems**: They can be used in distributed file systems, P2P networks, and other distributed systems to ensure data consistency and integrity.
   - **Certificate Transparency**: Google introduced a framework called Certificate Transparency that employs Merkle trees to detect misissued SSL certificates.

6. **Merkle Proofs**: 
   - Along with the Merkle tree structure, there's a concept of "Merkle proofs" which enables proving the membership of a certain piece of data in the tree without revealing the entire data set.

In summary, Merkle trees provide a way to summarize large sets of data into a single hash value, which can be used to verify data integrity and membership with efficiency and security.

## Documentation

https://ethereum.org/en/developers/tutorials/merkle-proofs-for-offline-data-integrity/

### Quick Start

#### VSCode

`Reopen in Container`

#### Command line

`$ docker build . --rm -t merkle:1`


## Container Command Quick Reference

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Merkle.s.sol:MerkleScript --rpc-url ${RPC_URL} --private-key ${PRIVATE_KEY}
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
