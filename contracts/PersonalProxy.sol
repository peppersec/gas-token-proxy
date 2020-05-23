pragma solidity 0.5.17;
pragma experimental ABIEncoderV2;
import "@openzeppelin/contracts/ownership/Ownable.sol";
import "@openzeppelin/contracts/math/SafeMath.sol";
import "./IGST2.sol";

contract PersonalProxy is Ownable {
    using SafeMath for uint;
    struct Call {
        address target;
        uint256 value;
        bytes callData;
    }

    IGST2 public gasToken;

    constructor(IGST2 _gasToken) public {
        gasToken = _gasToken;
    }

    function() external payable {}

    function execute(Call[] memory calls) public payable onlyOwner returns (bytes[] memory returnData) {
        uint256 gasProvided = gasleft();

        returnData = new bytes[](calls.length);
        for(uint256 i = 0; i < calls.length; i++) {
            (bool success, bytes memory data) = calls[i].target.call.value(calls[i].value)(calls[i].callData);
            require(success, string(data));
            returnData[i] = data;
        }

        burnGasToken(gasProvided.sub(gasleft()));
    }

    function burnGasToken(uint gasSpent) internal {
        uint256 tokens = (gasSpent + 14154) / 41130;
        gasToken.freeUpTo(tokens);
    }

    function claimTokens(address _token, address payable _to, uint _amount) public onlyOwner {
        require(_to != address(0));
        if (_token == address(0)) {
            _amount = _amount == 0 ? address(this).balance : _amount;
            _to.transfer(_amount);
            return;
        }

        IERC20 token = IERC20(_token);
        _amount = _amount == 0 ? token.balanceOf(address(this)) : _amount;
        token.transfer(_to, _amount);
    }
}

contract Test {
    uint public a;
    function callme(uint times) public {
        for(uint i = 0; i < times; i++) {
            a += i;
        }
    }
}