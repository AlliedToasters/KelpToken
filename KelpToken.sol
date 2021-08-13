// contracts/GLDToken.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract KelpToken is Ownable, ERC20 {
    
    using SafeMath for uint256;
    uint256 public totalGramsBiomassSequestered;
    uint256 public appreciationParameter;
    
    constructor(uint256 initialGramsBioMassSequestered) ERC20("KelpToken", "KELP") {
        appreciationParameter = 5e12; //higher value means more circulating supply
        totalGramsBiomassSequestered = totalGramsBiomassSequestered.add(initialGramsBioMassSequestered);
        _mint(msg.sender, computeAmountToMint(initialGramsBioMassSequestered));
    }
    
    function computeAmountToMint(uint256 _bioMassGrams) public view returns (uint256) {
        return (_bioMassGrams.mul(1e8)).div(((totalSupply().div(appreciationParameter)).add(1)));
    }
    
    function decimals() public view virtual override returns (uint8) {
      return 8;
    }
    
    function setAppreciationParameter(uint _value) public onlyOwner {
        appreciationParameter = _value;
    }
    
    function mintKelpToken(address _to, uint _gramsBioMassSequestered) public onlyOwner {
        totalGramsBiomassSequestered = totalGramsBiomassSequestered.add(_gramsBioMassSequestered);
        _mint(_to, computeAmountToMint(_gramsBioMassSequestered));
    }
    
}