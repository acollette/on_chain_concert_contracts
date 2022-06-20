const hre = require("hardhat");
const { ethers } = require("hardhat");

async function main(){
    const accounts = await ethers.getSigners()
    const signer = accounts[0]
    const contractAddress = "0x705263fa11938f50D4B18C73d0f8c1F0df1e7dCc";
    const TrueLabsTickets = await hre.ethers.getContractAt("ticketsM", contractAddress, signer);

    
    const tx2 = await TrueLabsTickets.tokenURI(ethers.BigNumber.from(1));
    console.log(tx2);
    const tx3 = await TrueLabsTickets.tokenURI(ethers.BigNumber.from(3));
    console.log(tx3);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });