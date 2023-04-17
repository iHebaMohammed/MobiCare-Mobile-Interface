// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;

contract EHR {
    struct Record {
        string cid;
    }

    mapping(address => Record[]) allRecords;

    // events
    event RecordAdded(string cid);

    function addRecord(string memory cid, address patientAddress) public {
        allRecords[patientAddress].push(Record(cid));
        emit RecordAdded(cid);
    }

    function getRecords(
        address patientAddress
    ) public view returns (Record[] memory) {
        return allRecords[patientAddress];
    }
}


