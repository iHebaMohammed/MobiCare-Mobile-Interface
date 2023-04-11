// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;

contract EHR {
    struct Record {
        string cid;
        string fileName;
        address patientAddress;
        address doctorAddress;
        uint256 timeAdded;
    }

    mapping(string => Record) public patientRecords;
    mapping(address => Record[]) public allRecords;

    // events
    event RecordAdded(
        string cid,
        address patientAddress,
        address doctorAddress
    );

    // modifiers
    modifier senderIsDoctor(address doctorAddress) {
        require(doctorAddress == msg.sender, "Sender is not a doctor");
        _;
    }

    function addRecord(
        string memory cid,
        string memory fileName,
        address patientAddress,
        address doctorAddress
    ) public senderIsDoctor(doctorAddress) {
        require(
            keccak256(abi.encodePacked(patientRecords[cid].cid)) !=
                keccak256(abi.encodePacked(cid)),
            "This Record already exists."
        );

        Record memory record = Record(
            cid,
            fileName,
            patientAddress,
            doctorAddress,
            block.timestamp
        );

        patientRecords[cid] = record;
        allRecords[patientAddress].push(patientRecords[cid]);

        emit RecordAdded(cid, patientAddress, doctorAddress);
    }

    function getRecords(
        address patientAddress
    ) public view returns (Record[] memory) {
        return allRecords[patientAddress];
    }
}

// contract EHR {
//     struct Record {
//         string cid;
//         string fileName;
//         address patientId;
//         address doctorId;
//         uint256 timeAdded;
//     }

//     struct Patient {
//         address id;
//         Record[] records;
//     }

//     struct Doctor {
//         address id;
//     }

//     mapping(address => Patient) public patients;
//     mapping(address => Doctor) public doctors;

//     // events
//     event PatientAdded(address patientId);
//     event DoctorAdded(address doctorId);
//     event RecordAdded(string cid, address patientId, address doctorId);

//     // modifiers
//     modifier senderExists() {
//         require(
//             doctors[msg.sender].id == msg.sender ||
//                 patients[msg.sender].id == msg.sender,
//             "Sender does not exist"
//         );
//         _;
//     }

//     modifier patientExists(address patientId) {
//         require(patients[patientId].id == patientId, "Patient does not exist");
//         _;
//     }

//     modifier senderIsDoctor() {
//         require(doctors[msg.sender].id == msg.sender, "Sender is not a doctor");
//         _;
//     }

//     // Patient Functions
//     function addPatient(address _patientId) public senderIsDoctor {
//         require(
//             patients[_patientId].id != _patientId,
//             "This patient already exists."
//         );
//         patients[_patientId].id = _patientId;

//         emit PatientAdded(_patientId);
//     }

//     function getPatient(
//         address _patientId
//     ) public view returns (Patient memory) {
//         if (patients[_patientId].id != _patientId) revert("Not a patient");

//         return patients[_patientId];
//     }

//     function getPatientExists(
//         address _patientId
//     ) public view senderIsDoctor returns (bool) {
//         return patients[_patientId].id == _patientId;
//     }

//     // Doctor Functions
//     function addDoctor() public {
//         require(
//             doctors[msg.sender].id != msg.sender,
//             "This doctor already exists."
//         );
//         doctors[msg.sender].id = msg.sender;

//         emit DoctorAdded(msg.sender);
//     }

//     function getDoctor(address _doctorId) public view returns (Doctor memory) {
//         if (doctors[_doctorId].id != _doctorId) revert("Not a doctor");

//         return doctors[_doctorId];
//     }

//     // Record Functions
//     function addRecord(
//         string memory _cid,
//         string memory _fileName,
//         address _patientId
//     ) public senderIsDoctor patientExists(_patientId) {
//         Record memory record = Record(
//             _cid,
//             _fileName,
//             _patientId,
//             msg.sender,
//             block.timestamp
//         );
//         patients[_patientId].records.push(record);

//         emit RecordAdded(_cid, _patientId, msg.sender);
//     }

//     function getRecords(
//         address _patientId
//     )
//         public
//         view
//         senderExists
//         patientExists(_patientId)
//         returns (Record[] memory)
//     {
//         return patients[_patientId].records;
//     }

//     // Utils
//     function getSenderRole() public view returns (string memory) {
//         if (doctors[msg.sender].id == msg.sender) {
//             return "doctor";
//         } else if (patients[msg.sender].id == msg.sender) {
//             return "patient";
//         } else {
//             return "unknown";
//         }
//     }
// }
