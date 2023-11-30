// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;
contract DentalAppointment {
    struct Appointment {
        address patient;
        uint256 date;
        bool isConfirmed;
    }

    mapping(uint256 => Appointment) public appointments;
    address public dentist;

    constructor() {
        dentist = msg.sender;
    }

}
