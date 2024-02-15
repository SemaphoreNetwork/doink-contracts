// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract Doink is ERC721 {
    event Minted(address indexed receiver, uint256 indexed id);

    uint256 private currentTokenId = 1;
    uint256 private immutable MAX_COUNT;
    // Each address will only be able to mint once. Note that the NFT is not soulbound,
    // so accounts can still transfer the item between each other.
    mapping(address minter => bool) private minters;

    address private immutable OPERATOR;

    modifier onlyOperator() {
        require(msg.sender == OPERATOR, "Unauthorized to call this function.");
        _;
    }

    constructor(address operator, uint256 maxCount) ERC721("Doink", "DOINK") {
        if (operator == address(0)) {
            OPERATOR = msg.sender;
        } else {
            OPERATOR = operator;
        }
        MAX_COUNT = maxCount;
    }

    function bark() public view returns (string memory) {
        require(balanceOf(msg.sender) > 0, "You need a doink to bark!");
        return "boink";
    }

    function nextDoink() public view returns (uint256) {
        return currentTokenId;
    }

    function mint(address receiver)
        public
        onlyOperator
        returns (uint256)
    {
        // Get ID of the new NFT token.
        uint256 id = currentTokenId;
        require(id < MAX_COUNT, "Max reached.");
        currentTokenId += 1;

        // Make sure the receiver has not already received an NFT.
        require(!minters[receiver], "Already minted.");
        minters[receiver] = true;

        _safeMint(receiver, id);

        emit Minted(receiver, id);
        return id;
    }
}
