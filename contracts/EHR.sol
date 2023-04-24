// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;

contract EHR {
    struct Record {
        string cid;
        uint256 timestamp;
    }

    mapping(address => uint) recordCount;
    mapping(address => Record[]) allRecords;

    // events
    event RecordAdded(string cid, uint256 timestamp, uint number);

    function addRecord(string memory cid, address patientAddress) public {
        allRecords[patientAddress].push(Record(cid, block.timestamp));
        recordCount[patientAddress] < 1 ? recordCount[patientAddress] = 1 : recordCount[patientAddress]++;

        emit RecordAdded(cid, block.timestamp, recordCount[patientAddress]);
    }

    function getRecords(
        address patientAddress
    ) public view returns (Record[] memory) {
        return allRecords[patientAddress];
    }
}


