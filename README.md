# GTF
## Introduction

A General Token Framework for tokens in blockchain.

you can develop token contract easily with the help of GTF. 

## Design Propose

With the reference of industry instance such as BNB, cryptoKitties, … , we learn and analysis all token EIPs in ethereum!

In our study, we have proposed a hierarchical token model for tokens in blockchain. And for a better understanding of this model, we have designed this general token framework for going through the mainline and will designed many modules to support the core modules.

## Dev Envs

We choose ethereum blockchain as our first test bed, our tool chain as follows:

- truffle + ganache
- contract with solidity
- test with javascript

## Project Structure

- build: javascript build script, power by truffle

- contracts: my GTF contracts code

  - core: core modules and core interface
  - ft: implement of fungible token 
  - nft: implement of non-fungible token
  - sft: implement of semi-fungible token
  - access: access control 
  - audit: audit interface
  - destroy: destroy strategy
  - freeze: token freeze method
  - issue: token issue method
  - retrieve: token retrieve method
  - role: token role based access control
  - utils: tools, data structure and algorithms
  - test: unit test code in solidity
  - sample: sample token class and object. which can be tested in testnet.

- docs

  - assert: resources of docs
  - uml: interface uml (currently)

- migrations: deploy tools

- test: test code in truffle envs

  

## Version Plan

- [x] 0.0.x: project start-up：design modules and API

- [x] 0.1.x: go though the mainline: 

  1. finish the token core module development

  2. finish the core module unit test

- [x] 0.2.x: go though the branches
  1. finish the branches modules
  2. finish the function test

- [x] 0.3.x: tune the system

  1. system level debug

  2. finish the system test

- [x] 0.4.x: document stage

  1. finish the error handing

  2. finish GTF docs and manuals

## Safety Statement

This project is only used for my general token model implement, it may has many known or unknown bugs, please do aware it and do not use this project directly for your business projects. 
