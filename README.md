# KelpToken

WIP

## Contract Details

### ERC20 Standard Methods and Attributes
Built using [OpenZeppelin's ERC20 implementation](https://docs.openzeppelin.com/contracts/2.x/api/token/erc20). Please see their docs for the ERC20 standard methods.

### Custom Attributes
KelpToken contains two custom attributes: 
```
    uint256 public totalGramsCarbonSequestered;
```

`totalGramsCarbonSequestered` tracks the total amount of carbon sequestered during the lifetime of the contract.

```
    uint256 public liquidityParameter;
```
`liquidityParameter` is a free parameter that controls the rate of change of the issuance rate. A higher liquidity parameter means a higher overall supply of KELP tokens. A lower parameter means the fungible tokens appreciate faster in terms of carbon captured per token.

### Custom Methods
The KelpToken contract implements a few new methods on top of ERC20 and overrides a few.

#### Constructor
The constructor sets the `liquidityParameter` for the contract.
```
    constructor(uint256 _liquidityParameter) ERC20("KelpToken", "KELP") {
        liquidityParameter = _liquidityParameter; //higher value means more circulating supply
    }
```


### Custom Events
`KelpMinted` is the only custom event in the contract. It records important details: how much carbon was sequestered for the preceding period (`_gramsCarbonSequestered`), how many planktons were minted in this minting (`_unitsMinted`), the issuance rate used (`_issuancePlanktonPerGram`), the cumulative sequestered carbon mass at the time of minting (`_cumulativeMassGrams`), the cumulative supply of Kelp (in planktons) at the time of minting (`_cumulativeSupply`), the docHash for the minting, and the beneficiary (``), or the ethereum address to receive the minted kelp (`_beneficiary`).

```
    event KelpMinted(
        uint _gramsCarbonSequestered, 
        uint _unitsMinted, 
        uint _issuancePlanktonPerGram,
        uint _cumulativeMassGrams,
        uint _cumulativeSupply,
        bytes32 _docHash,
        address _beneficiary
        );
```
