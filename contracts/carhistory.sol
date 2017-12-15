pragma solidity ^0.4.4;

contract carhistory {

struct CarHistoryStruct {
  uint mileage;
  bytes32 part1;
  bytes32 part2;
  bytes32 part3;
  address sender;
}

mapping (bytes32 => CarHistoryStruct) public carHistoryStructs;

bytes32[] carRegNos;

function getCarRegNoArray() constant returns (bytes32[]) {
  return carRegNos;
}

function setCarHistoryLog (bytes32 carRegNo, uint mileage, bytes32 part1, bytes32 part2, bytes32 part3) returns (bool success) {
  carHistoryStructs[carRegNo].mileage = mileage;
  carHistoryStructs[carRegNo].part1 = part1;
  carHistoryStructs[carRegNo].part2 = part2;
  carHistoryStructs[carRegNo].part3 = part3;
  carHistoryStructs[carRegNo].sender = msg.sender;
  carRegNos.push(carRegNo);
  return true;
}

function getCarHistoryLog(bytes32 carRegNo) public constant returns (uint, bytes32, bytes32, bytes32, address) {
  var mileage = carHistoryStructs[carRegNo].mileage;
  var part1 = carHistoryStructs[carRegNo].part1;
  var part2 = carHistoryStructs[carRegNo].part2;
  var part3 = carHistoryStructs[carRegNo].part3;
  var sender = carHistoryStructs[carRegNo].sender;
  return (mileage, part1, part2, part3, sender);
}

}