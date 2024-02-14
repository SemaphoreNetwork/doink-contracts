// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract GameItem is ERC721 {
    uint256 private currentTokenId = 1;
    uint256 private immutable MAX_COUNT;

    constructor(uint256 maxCount) public ERC721("Doink", "DOINK") {
        MAX_COUNT = maxCount;
    }

    function mint(address receiver)
        public
        returns (uint256)
    {
        // Get ID of the new NFT token.
        uint256 id = currentTokenId;
        require(id < MAX_COUNT, "Max reached.");
        currentTokenId += 1;

        _safeMint(receiver, id);

        return id;
    }
}
