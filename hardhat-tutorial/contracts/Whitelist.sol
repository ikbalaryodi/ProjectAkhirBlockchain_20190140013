// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Whitelist {
    // Max number of whitelisted addresses allowed
    uint8 public maxWhitrelistedAddresses;

    // Create a mapping of whitelisted addresses
    // If an address is whitelisted, we set it to true and it is to false by default for other addresses
    mapping(address => bool) public whitelistedAddresses;

    // Keep track of all the addresses that has been whitelisted
    uint8 public numAddressesWhitelisted;

    // Setting the max number of whitelisted addresses
    // User will put the value at the time of deployment
    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitrelistedAddresses = _maxWhitelistedAddresses;
    }

    // This function adds the address of the sender to the whitelist
    function addAddressToWhitelist() public {
        // check if the user has already been whitelisted
        require(!whitelistedAddresses[msg.sender], "Sender has already been whitelisted");

        // check if the numAddressesWhitelisted < maxWhitrelistedAddresses else throw an error
        require(numAddressesWhitelisted < maxWhitrelistedAddresses, "Maximum whitelisted addresses reached");

        // Add address which calls this function to the whitelistedAddress mapping
        whitelistedAddresses[msg.sender] = true;

        // Increase the number of whitelisted addresses
        numAddressesWhitelisted += 1;
    }
}