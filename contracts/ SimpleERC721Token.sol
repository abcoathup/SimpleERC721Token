pragma solidity ^0.6.0;

import "@openzeppelin/contracts/token/ERC721/ERC721Full.sol";
import "@openzeppelin/contracts/ownership/Ownable.sol";
import "@openzeppelin/contracts/drafts/Strings.sol";

contract SimpleERC721Token is ERC721Full, Ownable {

    constructor () public ERC721Full("Simple ERC721 Token", "SIM") {
        _setBaseURI("https://example.com/tokens/");
    }

    function setBaseURI(string memory baseURI) public onlyOwner {
        _setBaseURI(baseURI);
    }

    function mint(address to) public onlyOwner {
        uint256 tokenId = totalSupply().add(1);
        _mint(to, tokenId);
        _setTokenURI(tokenId, Strings.fromUint256(tokenId));
    }
}