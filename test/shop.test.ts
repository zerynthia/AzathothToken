import { expect } from "chai";
import {
  BaseContract,
  Contract,
  ContractTransactionResponse,
} from "ethers/lib.commonjs/ethers";
import type { HardhatEthersSigner } from "@nomicfoundation/hardhat-ethers/signers";
import { ethers } from "hardhat";

import tokenJson from "../artifacts/contracts/token/AzathothToken.sol/AzathothToken.json"

describe("Shop", () => {
  let owner: HardhatEthersSigner;
  let buyer: HardhatEthersSigner;
  let shop: BaseContract & {
    deploymentTransaction(): ContractTransactionResponse;
  } & Omit<Contract, keyof BaseContract>;

  let erc20: Contract

  beforeEach(async () => {
    [owner, buyer] = await ethers.getSigners();

    const Shop = await ethers.getContractFactory("Shop", owner);
    shop = await Shop.deploy();
    
    erc20 = new ethers.Contract(await shop.token(), tokenJson.abi, owner)
  });

  it("should have an owner and a token", async () => {
    expect(await shop.owner()).to.eq(owner.address);
    expect(await shop.token()).to.be.properAddress;
  });

  // it("allow to buy", async () => {
  //   const tokenAmount = 3

  //   console.log(shop.runner.address)

  //   const txData = {
  //     value: tokenAmount,
  //     to: shop.address
  //   }

  //   const tx = await buyer.sendTransaction(txData)
  //   await tx.wait()

  //   expect(await erc20.balanceOf(buyer.address)).to.eq(tokenAmount)
  // });
});
