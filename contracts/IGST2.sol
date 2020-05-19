pragma solidity 0.5.17;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract IGST2 is IERC20 {

    function freeUpTo(uint256 value) external returns (uint256 freed);

    function freeFromUpTo(address from, uint256 value) external returns (uint256 freed);

    function balanceOf(address who) external view returns (uint256);
}