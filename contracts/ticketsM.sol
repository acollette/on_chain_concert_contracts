// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/utils/Base64.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import './IticketsSVG.sol';


contract ticketsM is ERC721Enumerable, Ownable {

    IticketsSVG private ticketsSVG;

    constructor() ERC721("SVGTokenV1", "SVGTV1") {}
    

    function setTicketsSvgContract (IticketsSVG _ticketsSVG) external onlyOwner {
        ticketsSVG = _ticketsSVG;
    }

    struct CustomData {
        string name;
        string lastName;
        string price;
    }

    mapping(uint256 => CustomData) private _customData;

    function getCustomData (uint256 _tokenId) external view returns (string memory, string memory, string memory) {
        string memory name = _customData[_tokenId].name;
        string memory lastName = _customData[_tokenId].lastName;
        string memory price = _customData[_tokenId].price;

        return (name, lastName, price);
        
    }

    function customizeData(uint256 _tokenId, string memory _name, string memory _lastName, string memory _priceEthOrDollar) external{
        require(_tokenId >= 2 && _tokenId <5);
        require(ownerOf(_tokenId)==msg.sender);

        CustomData storage person = _customData[_tokenId];
        person.name = _name;
        person.lastName= _lastName;

        if(keccak256(bytes(_priceEthOrDollar)) == keccak256(bytes("ETH"))){
            person.price = "0.2ETH";
        }else if(keccak256(bytes(_priceEthOrDollar)) == keccak256(bytes("Dollar"))){
            person.price = "10$";
        }
    }

    function mint() external {
        uint256 supply = totalSupply();
        address to = msg.sender;
        _safeMint(to, supply +1);
    }


    function getJson (uint256 _tokenId, string memory _image) private view returns (string memory) {

        string memory jsonWoodstock = string(
            abi.encodePacked('{"description": "Woodstock 1969 On-Chain Festival Ticket", "image": "', _image, '", "attributes": [ {"trait_type": "year", "value": "1969"}, {"trait_type": "Event", "value": "Woodstock Festival"}]}')
        );

        string memory jsonBeatles = string(
            abi.encodePacked('{"description": "Beatles City Stadium 1964 Concert", "image": "', _image, '", "attributes": [ {"trait_type": "year", "value": "1964"}, {"trait_type": "Event", "value": "City Stadium Concert"}]}')

        );

        if(_tokenId<=2 && _tokenId > 0){
            return jsonWoodstock;
        } else if (_tokenId >= 2 && _tokenId < 5){
            return jsonBeatles;
        }
    }

    function tokenURI(
        uint256 tokenId
    )
        public
        view
        override(ERC721)
        returns (string memory)
    {
        require(_exists(tokenId), "ERC721: nonexistent token");
        
        
        string memory svgcode = ticketsSVG.getSvgCode(tokenId);

        string memory image = string(
            abi.encodePacked(
                "data:image/svg+xml;base64,",
                Base64.encode(bytes(abi.encodePacked(svgcode)))
            )
        );

        string memory json = getJson(tokenId, image);

        return string(
            abi.encodePacked(
                "data:application/json;base64,",
                Base64.encode(bytes(abi.encodePacked(json)))
            )
        );

    }
}