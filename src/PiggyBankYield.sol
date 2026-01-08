// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract PiggyBankYield {
    mapping(address => uint) public shares;
    uint public totalShares;
    address public admin;

    constructor() {
        admin = msg.sender;
    }

    function deposit() external payable {
        shares[msg.sender] += msg.value;
        totalShares += msg.value;
    }

    function addYield() external payable {
        require(msg.sender == admin, "Not admin");
    }

    function withdraw() external {
        uint userShare = shares[msg.sender];
        require(userShare > 0, "No shares");

        uint amount = (userShare * address(this).balance) / totalShares;

        shares[msg.sender] = 0;
        totalShares -= userShare;

        payable(msg.sender).transfer(amount);
    }
}
