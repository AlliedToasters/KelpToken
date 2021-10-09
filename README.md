# KelpToken

WIP

## Contract Methods

### ERC20 Standard Methods
Built using [OpenZeppelin's ERC20 implementation](https://docs.openzeppelin.com/contracts/2.x/api/token/erc20). Please see their docs for the ERC20 standard methods.

### Custom Methods
The KelpToken contract implements a few new methods on top of ERC20 and overrides a few.

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
