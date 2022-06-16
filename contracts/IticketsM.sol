// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/utils/Base64.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

interface IticketsM {
    struct CustomData {
        string name;
        string lastName;
        string price;
    }

    function getCustomData (uint256 _tokenId) external view returns (string memory, string memory, string memory) ;

}