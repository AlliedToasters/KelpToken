// contracts/GLDToken.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";
import "openzeppelin-solidity/contracts/access/Ownable.sol";
import "openzeppelin-solidity/contracts/utils/math/SafeMath.sol";

contract KelpToken is Ownable, ERC20 {
    
    using SafeMath for uint256;
    uint256 public totalGramsCarbonSequestered;
    uint256 public liquidityParameter;
    
    event KelpMinted(
        uint _gramsCarbonSequestered, 
        uint _unitsMinted, 
        uint _issuancePlanktonPerGram,
        uint _cumulativeMassGrams,
        uint _cumulativeSupply,
        bytes32 _docHash,
        address _beneficiary
        );
    
    constructor(uint256 _liquidityParameter) ERC20("KelpToken", "KELP") {
        liquidityParameter = _liquidityParameter; //higher value means more circulating supply
    }
    
    function computeAmountToMint(uint256 _carbonGrams) public view returns (uint256) {
        return (_carbonGrams.mul(1e8)).div(((totalSupply().div(liquidityParameter)).add(1)));
    }
    
    function decimals() public view virtual override returns (uint8) {
      return 8;
    }
    
    function setliquidityParameter(uint _value) public onlyOwner {
        liquidityParameter = _value;
    }
    
    function mintKelpToken(address _to, uint _gramsCarbonSequestered, bytes32 _docHash) public onlyOwner {
        totalGramsCarbonSequestered = totalGramsCarbonSequestered.add(_gramsCarbonSequestered);
        uint amountToMint = computeAmountToMint(_gramsCarbonSequestered);
        emit KelpMinted(
            _gramsCarbonSequestered, 
            amountToMint, 
            amountToMint.div(_gramsCarbonSequestered),
            totalGramsCarbonSequestered,
            totalSupply().add(amountToMint),
            _docHash,
            _to
            );
        _mint(_to, amountToMint);
    }
    
}