// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NFTCollection is ERC721, ERC721Enumerable, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIdCounter;
    uint256 public constant MAX_SUPPLY = 1000;

    string private _baseTokenURI;

    constructor() ERC721("Template", "TMP") {}

    function initialize(string memory name, string memory symbol, string memory baseTokenURI, address owner) external {
        _name = name;
        _symbol = symbol;
        _baseTokenURI = baseTokenURI;
        transferOwnership(owner);
    }

    function safeMint(address to) public onlyOwner {
        require(_tokenIdCounter.current() < MAX_SUPPLY, "Max supply reached");
        _tokenIdCounter.increment();
        _safeMint(to, _tokenIdCounter.current());
    }

    function _baseURI() internal view override returns (string memory) {
        return _baseTokenURI;
    }

    // Include other necessary functions and overrides...
}
