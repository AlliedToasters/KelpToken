# KelpToken

WIP

## Contract Methods

### ERC20 Standard Methods
Built using [OpenZeppelin's ERC20 implementation](https://docs.openzeppelin.com/contracts/2.x/api/token/erc20). Please see their docs for the ERC20 standard methods.

### Custom Methods
The KelpToken contract implements a few new methods on top of ERC20 and overrides a few.

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
