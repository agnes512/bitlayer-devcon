// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract AccessControl {
    address public originAdmin;

    /// @dev
    bool public isActive;

    struct AdminRecord {
      address admin;
    }
    
    mapping(address => AdminRecord) public adminData;

    event AdminCreated(
        address indexed adminData
    );

    constructor() {
        originAdmin = msg.sender;
    }

    modifier onlyAdmin(address requetAddress) {
        require(requetAddress == originAdmin, "Only admin can perform this action");
        _;
    }
    modifier onlyOriginAdmin() {
        require(msg.sender == originAdmin, "Only the origin admin can perform this action");
        _;
    }
    /// @dev Modifier that verifies if a given address is an admin
    modifier validEngineAddress(address givenAddress) {
        require(
            adminData[givenAddress].length == 0,
            "Bitlayer: Invalid Admin Address"
        );
        _;
    }

    function addAdmin(address newAdmin) public onlyAdmin(newAdmin) {
        // logic to add new admin
        AdminRecord storage s = adminData[newAdmin];
        emit AdminCreated(newAdmin);
    }

    function removeAdmin(address adminToRemove) public validEngineAddress(adminToRemove) {
        // logic to remove an admin
    }

    function secureFunction() public onlyOriginAdmin {
        // business logic only accessible to admins

        /** include other business logic
         only the deployer can access*/
    }
}