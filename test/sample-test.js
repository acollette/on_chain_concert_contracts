const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Greeter", function () {

  

  it("Should return the new greeting once it's changed", async function () {

    [owner, alice, bob] = await ethers.getSigners();

    const Tickets = await hre.ethers.getContractFactory("ticketsM");
    const tickets = await Tickets.deploy();
    await tickets.deployed();

    console.log("Tickets deployed to:", tickets.address);

    const TicketsSVG = await hre.ethers.getContractFactory("ticketsSVG");
    const ticketsSVG = await TicketsSVG.deploy(tickets.address);
    await ticketsSVG.deployed()

    console.log("Tickets deployed to:", ticketsSVG.address);

    await tickets.setTicketsSvgContract(ticketsSVG.address)

    let tx = await tickets.connect(alice).mint();
    tx.wait()
    let tx2 = await tickets.connect(alice).mint();
    tx2.wait()
    let tx3 = await tickets.connect(alice).mint()
    tx3.wait()
    console.log(await tickets.tokenURI(3));
    
    let tx4 = await tickets.connect(alice).customizeData(3, "Alice", "Sund", "Dollar");
    tx4.wait();
    console.log(await tickets.tokenURI(3));




  });
});
