// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract DegenToken is ERC20, Ownable {
    struct StoreItem {
        uint price;
        string name;
        bool tokenRedeemed;
    }

    StoreItem[] private items;

    constructor() ERC20("Degen", "DGN") {
        items.push(StoreItem(100, "Extra Life", false));      // Price: 100 tokens
        items.push(StoreItem(50, "Shield", false));           // Price: 50 tokens
        items.push(StoreItem(200, "Double Damage", false));   // Price: 200 tokens
        items.push(StoreItem(100, "Invisibility", false));    // Price: 100 tokens
        items.push(StoreItem(150, "Health Potion", false));   // Price: 150 tokens
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function decimals() override public pure returns (uint8) {
        return 0;
    }

    function getBalance() external view returns (uint256) {
        return balanceOf(msg.sender);
    }

    function transferTokens(address _receiver, uint256 _value) external {
        require(balanceOf(msg.sender) >= _value, "Degen Tokens Insufficient");
        approve(msg.sender, _value);
        transferFrom(msg.sender, _receiver, _value);
    }

    function burnTokens(uint256 _value) external {
        require(balanceOf(msg.sender) >= _value, "Degen Tokens Insufficient");
        _burn(msg.sender, _value);
    }

    function redeemTokens(uint8 input) external payable returns (string memory) {
        require(input < items.length, "Invalid Item Selection");
        require(!items[input].tokenRedeemed, "Item already redeemed");
        require(balanceOf(msg.sender) >= items[input].price, "Insufficient Degen Tokens");

        approve(msg.sender, items[input].price);
        transferFrom(msg.sender, owner(), items[input].price);
        items[input].tokenRedeemed = true;

        return string(abi.encodePacked("Congratulations! You have redeemed ", items[input].name, "!"));
    }

    function listStoreItems() public view returns (string memory) {
        string memory storeItems = "";

        for (uint i = 0; i < items.length; i++) {
            storeItems = string(abi.encodePacked(storeItems, "   [", Strings.toString(i), "] ", items[i].name, "\n"));
        }

        return storeItems;
    }

}