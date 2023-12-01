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
	function isSlotAvailable(uint256 _date) public view returns (bool) {
        return appointments[_date].date == 0;
    }

    function bookAppointment(uint256 _date) public {
        require(isSlotAvailable(_date), "This slot is already booked!");

        appointments[_date] = Appointment({
            patient: msg.sender,
            date: _date,
            isConfirmed: false
        });
    }

    function confirmAppointment(uint256 _date) public {
        require(msg.sender == dentist, "Only the dentist can confirm appointments!");
        require(appointments[_date].date != 0, "This slot does not have an appointment!");

        appointments[_date].isConfirmed = true;
    }

}
