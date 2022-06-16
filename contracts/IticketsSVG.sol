// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;
import "./IticketsM.sol";

interface IticketsSVG {

    function getSvgCode(uint _tokenId) external view returns (string memory);

}