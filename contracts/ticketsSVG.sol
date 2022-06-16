// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;
import "./IticketsM.sol";


contract ticketsSVG {

    IticketsM public immutable ticketsM;

    struct Data {
        string name;
        string lastName;
        string price;
    }

    constructor(address _ticketsMainContract){
        ticketsM = IticketsM(_ticketsMainContract);
    }


    function getSvgCode(
        uint _tokenId
    ) external returns (string memory svgcode) { 

        string memory tokenIdName;
        string memory tokenIdLastName;
        string memory price; 

        (tokenIdName, tokenIdLastName, price) = ticketsM.getCustomData(_tokenId);

        string memory woodstock = string(
            abi.encodePacked(
            '<svg width="480" height="150" xmlns="http://www.w3.org/2000/svg">'
            '<rect x="0" y="0" height="150" width="480" fill="#F0FFF0" />'
            '<circle  cx="336" cy="64" r="44" stroke="" stroke-width="2" fill="red" opacity="0.65"/>'
            '<circle cx="352" cy="64" r="41" fill="#F0FFF0" opacity="" />'
            '<polygon fill="red" points="84,17 99,17 25,109 10,109" opacity="0.65"/>'
            '<polygon fill="red" points="192,45 224,68 160,68 202,57 160,68 215,32 206,50 192,90 172,32" opacity="0.65" />'
            '<text x="5" y="15" fill="black" font-family="Arial Narrow, Helvetica, sans-serif" font-size="10px">Woodstock Music and Art Fair</text>'
            '<text x="141" y="15" fill="black" font-family="Arial Narrow, Helvetica, sans-serif" font-size="10px">Woodstock Music and Art Fair</text>' 
            '<text x="280" y="15" fill="black" font-family="Arial Narrow, Helvetica, sans-serif" font-size="10px">Woodstock Music and Art Fair</text>' 
            '<text x="29.9" y="35" fill="black" font-family="Arial Narrow, Helvetica, sans-serif" font-size="15px">F R I  D  A  Y</text>'
            '<text x="150" y="35" fill="black" font-family="Arial Narrow, Helvetica, sans-serif" font-size="15px">S A T U R D A Y</text>'
            '<text x="300" y="35" fill="black" font-family="Arial Narrow, Helvetica, sans-serif" font-size="15px">S U N D A Y</text>'
            '<text x="15" y="55" fill="black" font-family="Arial Narrow, Helvetica, sans-serif" font-size="13px" font-weight="bold">August 15, 1969</text>'
            '<text x="151" y="55" fill="black" font-family="Arial Narrow, Helvetica, sans-serif" font-size="13px" font-weight="bold">August 16, 1969</text>'
            '<text x="293" y="55" fill="black" font-family="Arial Narrow, Helvetica, sans-serif" font-size="13px" font-weight="bold">August 17, 1969</text>'  
            '<text x="36" y="72" fill="black" font-family="Arial Narrow, Helvetica, sans-serif" font-size="13px" font-weight="bold">10 A. M.</text>'
            '<text x="174" y="72" fill="black" font-family="Arial Narrow, Helvetica, sans-serif" font-size="13px" font-weight="bold">10 A. M.</text>'
            '<text x="315" y="72" fill="black" font-family="Arial Narrow, Helvetica, sans-serif" font-size="13px" font-weight="bold">10 A. M.</text>'  
            '<text x="36" y="97" fill="black" font-family="Arial Narrow, Helvetica, sans-serif" font-size="20px" font-weight="bold">$8.00</text>' 
            '<text x="174" y="97" fill="black" font-family="Arial Narrow, Helvetica, sans-serif" font-size="20px" font-weight="bold">$8.00</text>' 
            '<text x="315" y="97" fill="black" font-family="Arial Narrow, Helvetica, sans-serif" font-size="20px" font-weight="bold">$8.00</text>' 
            '<text x="4" y="117" fill="black" font-family="Arial Narrow, Helvetica, sans-serif" font-size="10px">Good For One Admission Only</text>' 
            '<text x="139" y="117" fill="black" font-family="Arial Narrow, Helvetica, sans-serif" font-size="10px">Good For One Admission Only</text>' 
            '<text x="278" y="117" fill="black" font-family="Arial Narrow, Helvetica, sans-serif" font-size="10px">Good For One Admission Only</text>'
            '<text x="10" y="140" fill="red" font-family="Arial Narrow, Helvetica, sans-serif" font-size="16px" opacity="0.8">41451</text>'
            '<text x="57" y="135" fill="black" font-family="Arial Narrow, Helvetica, sans-serif" font-size="10px" font-weight="bold">NO REFUNDS</text>'
            '<text x="147" y="140" fill="red" font-family="Arial Narrow, Helvetica, sans-serif" font-size="16px" opacity="0.8">41451</text>'
            '<text x="195" y="135" fill="black" font-family="Arial Narrow, Helvetica, sans-serif" font-size="10px" font-weight="bold">NO REFUNDS</text>'
            '<text x="283" y="140" fill="red" font-family="Arial Narrow, Helvetica, sans-serif" font-size="16px" opacity="0.8">41451</text>'
            '<text x="333" y="135" fill="black" font-family="Arial Narrow, Helvetica, sans-serif" font-size="10px" font-weight="bold">NO REFUNDS</text>'
            '<text x="415" y="17" fill="black" font-family="Arial Narrow, Helvetica, sans-serif" font-size="16px"> THREE </text>'
            '<text x="425" y="34" fill="black" font-family="Arial Narrow, Helvetica, sans-serif" font-size="16px" >DAY</text>'
            '<text x="414" y="51" fill="black" font-family="Arial Narrow, Helvetica, sans-serif" font-size="16px" >TICKET</text>'
            '<text x="402" y="75" fill="black" font-family="Arial Narrow, Helvetica, sans-serif" font-size="12px" font-weight="bold" >Aug. 15, 16, 17</text>'
            '<text x="425" y="92" fill="black" font-family="Arial Narrow, Helvetica, sans-serif" font-size="12px" font-weight="bold" >1969</text>'
            '<text x="411" y="118" fill="black" font-family="Arial Narrow, Helvetica, sans-serif" font-size="20px" font-weight="bold">$24.00</text>  <text x="416" y="140" fill="red" font-family="Arial Narrow, Helvetica, sans-serif" font-size="16px" opacity="0.8">41451</text>'
            '<line x1="128" y1="3" x2="128" y2="150" stroke="black" stroke-dasharray="6" opacity="0.07" />'
            '<line x1="265" y1="3" x2="265" y2="150" stroke="black" stroke-dasharray="6" opacity="0.07" />'
            '<line x1="398" y1="3" x2="398" y2="150" stroke="black" stroke-dasharray="6" opacity="0.07" />'
            '</svg>'
            ));

            string memory beatles = string(
            abi.encodePacked(
                '<svg width="400" height="200" xmlns="http://www.w3.org/2000/svg">'
                '<style>'
                '    text{text-anchor:middle;font-family:Helvetica}'
                '    .lsSm{letter-spacing:1px;}'
                '    .lsLg{letter-spacing:4px;}'
                '    .line{stroke:rgb(56,45,40);stroke-width:1.5}'
                '    .cB{fill:rgb(224,200,154)}'
                '    .fP{fill:rgb(56,45,40)}'
                '    .fS{fill:rgb(177,56,46)}'
                '    .tC{font-weight:bold;fill:rgb(56,45,40)}'
                '    .tR{font-size:20px;font-family:Courier;fill:rgb(177,56,46);letter-spacing:4px;)'
                '</style>'
                '<rect x="0" y="0" width="400" height="200" class="cB"/>'
                '<rect x="117" y="90" width="160" height="23" class="cS"/>'
                '<line x1="40" x2="280" y1="34" y2="34" class="line"/>'
                '<line x1="40" x2="280" y1="66" y2="66" class="line"/>'
                '<line x1="40" x2="280" y1="88" y2="88" class="line"/>'
                '<line x1="40" x2="280" y1="160" y2="160" class="line"/>'
                '<line x1="52" x2="72" y1="20" y2="20" class="line"/>'
                '<line x1="256" x2="272" y1="20" y2="20" class="line"/>'
                '<line x1="32" x2="32" y1="16" y2="184" class="line"/>'
                '<line x1="328" x2="328" y1="16" y2="184" class="line"/>'
                '<line x1="368" x2="368" y1="16" y2="184" class="line"/>'
                '<line x1="115" x2="115" y1="88" y2="155" class="line"/>'
                '<line x1="202" x2="202" y1="116" y2="155" class="line"/>'
                '<text x="160" y="28" class="tC" font-size="20"> THE BEATLES </text>'
                '<text x="160" y="50" class="tC" font-size="16"> CITY PARK STADIUM </text>'
                '<text x="160" y="62" class="tC" font-size="10"> NEW ORLEANS, LA. </text>'
                '<text x="160" y="82" class="tC" font-size="14"> WEDNESDAY EVENING 8:00 P. M. </text>'
                '<text x="74" y="105" class="tC" font-size="12"> SEPT BR </text>'
                '<text x="74" y="139" class="tC" font-size="36"> 16 </text>'
                '<text x="74" y="155" class="tC" font-size="13"> 1964 </text>'
                '<text x="200" y="108" class="cB lsLg" font-size="20"> ADMIT ONE </text>'
                '<text x="120" y="125" class="tC" font-size="8" style="text-anchor:start;font-style:italic"> Name : </text>'
                '<text x="120" y="145" class="tC" font-size="8" style="text-anchor:start;font-style:italic"> Surname : </text>'
                '<text x="245" y="130" class="tC" font-size="13"> TOTAL </text>'
                '<text x="225" y="150" class="tC" font-size="12"> ETH </text>'
                '<text x="165" y="172" class="tC lsSm" font-size="12"> NO REFUNDS FOR ANY REASON </text>'
                '<text x="165" y="185" class="tC lsSm" font-size="12"> EXCEPT CANCELLATION OF SHOW. </text>'
                '<text transform="translate(350, 100) rotate(90)" font-size="15" class="tC lsSm"> THE BEATLES </text>'
                '<text transform="translate(335, 100) rotate(90)" font-size="9" class="tC"> CITY PARK STADIUM - NEW ORLEANS, LA </text>'
                '<text transform="translate(315, 64) rotate(90)" font-size="9" class="tC"> GOOD ONLY </text>'
                '<text transform="translate(305, 64) rotate(90)" font-size="9" class="tC"> WEDNESDAY EVE, </text>'
                '<text transform="translate(293, 64) rotate(90)" font-size="11" class="tC"> SEPTEMBER </text>'
                '<text transform="translate(282, 100) rotate(90)" font-size="8" class="tC"> CLOSE TICKET CO. INC., ATLANTA </text>'
                '<text transform="translate(293, 134) rotate(90)" font-size="40" class="tC"> 16 </text>'
                '<text x="308" y="174" font-size="15" class="tC"> 1964 </text>'
                '<text class="tR" transform="translate(20, 100) rotate(-90)">', '1' ,'</text>',
                '<text class="tC" font-size="7" transform="translate(30, 100) rotate(-90)"> address </text>',
                '<text class="tR" transform="translate(380, 100) rotate(90)">', '1' ,'</text>',
                '<text class="tC" font-size="7" transform="translate(370, 100) rotate(90)"> address </text>',
                '<text x="158" y="135" class="tC" font-size="10">', tokenIdName ,'</text>',
                '<text x="158" y="155" class="tC" font-size="10">', tokenIdLastName ,'</text>',
                '<text x="255" y="150" class="tC" font-size="18">', price ,'</text>',
                '</svg>'
            )
        );
        

        if(_tokenId<=2 && _tokenId > 0){
            return woodstock;
        } else if (_tokenId >= 2 && _tokenId < 5){
            return beatles;
        }

    }

}
