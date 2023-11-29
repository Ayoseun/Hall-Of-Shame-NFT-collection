// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/proxy/Clones.sol";

contract NFTCollectionFactory {
    address public immutable templateContract;

    event CollectionCreated(address indexed newCollectionAddress);

    constructor(address _templateContract) {
        templateContract = _templateContract;
    }

    function createCollection(string memory name, string memory symbol, string memory baseTokenURI) external returns (address) {
        address clone = Clones.clone(templateContract);
        NFTCollection(clone).initialize(name, symbol, baseTokenURI, msg.sender);
        emit CollectionCreated(clone);
        return clone;
    }
}
