
task("mint","Mints a token and logs the tokenURI")
  .addParam("contract", "The ticket contract")
  .addParam("value", "The tokenId")
  .setAction(async (taskArgs)=>{
    const contractAddr = taskArgs.contract
    const value = taskArgs.value
    const TicketContract = await ethers.getContractFactory("ticketsM")
    const accounts = await ethers.getSigners()
    const signer = accounts[1]
    const ticketContract = await new ethers.Contract(contractAddr, TicketContract.interface, signer)

    let tx = await ticketContract.mint()
    tx.wait(1)
    let tx2 = await ticketContract.tokenURI(ethers.utils.parseUnits(value, 18))
    console.log(tx2);
  })

  task("customize", "customizes the NFT data")
    .addParam("contract", "The ticket contract")
    .addParam("tokenId","The Token Id to Customize")
    .addParam("name", "The Name to Add")
    .addParam("lastName", "The Last Name to Add")
    .addParam("currency", "Priced in ETH or Dollar")
    .setAction(async (taskArgs)=>{
      const contractAddr = taskArgs.contract
      const _tokenId = taskArgs.tokenId
      const _name = taskArgs.name
      const _lastName = taskArgs.lastName
      const _currency = taskArgs.currency
      const TicketContract = await ethers.getContractFactory("ticketsM")
      const accounts = await ethers.getSigners()
      const signer = accounts[1] 
      const ticketContract = await new ethers.Contract(contractAddr, TicketContract.interface, signer)

      let tx = await ticketContract.customizeData(_tokenId, _name, _lastName, _currency)
      tx.wait()
      let tx2 = await ticketContract.tokenURI(value)
      console.log(tx2);



    })

  module.exports = {};



