// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract SecurityLogBlockchain{
    address owner;
    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Ownable: caller is not the admin");
        _;
    }

    struct LogReport {
        uint256 id; //UUID
        string title; //Log's title
        string content; //Log's data
        string filename; //Log's filename
        uint256 created; //Date/time record added
    }

    function create_time() view public returns (uint256){
        return block.timestamp;
    }

    function generate_UUID() view public returns (uint256){  
        return uint(keccak256(abi.encodePacked(block.difficulty, create_time())));
    }

    mapping (string => LogReport[]) public logsdata;
    event LogAdded(uint256 log_id, string log_title, string log_content, string log_filename, uint256 log_created);
    
    //AddLog ( title, content, filename )
    //Add new log to the blockchain database
    function AddLog(string memory log_account, string memory log_title, string memory log_content, string memory log_filename) public onlyOwner {
        // require the log data not to be empty
        require(bytes(log_title).length > 0, "title is empty!");

        require(bytes(log_content).length > 0, "content is empty!");

        require(bytes(log_filename).length > 0, "filename is empty!");

        // adds the log to the storage.
        LogReport memory newLog = LogReport(generate_UUID(), log_title, log_content, log_filename, create_time());
        logsdata[log_account].push(newLog);

        // emits item added event.
        emit LogAdded(newLog.id, newLog.title, newLog.content, newLog.filename, newLog.created);
    }

    //GetLog ( Id )
    //Get log data filter by Id
    function GetLog (string memory account, uint256 id) view public onlyOwner returns (LogReport memory) {
		LogReport memory data;
        //bool exist = false;
        for (uint256 i = 0; i < logsdata[account].length; i ++) {
            if (logsdata[account][i].id == id == true){
                data = logsdata[account][i];
                break;
            }
            else{
                continue;
            }
        }
        return data; 
	}

    //GetLogs ( userId )
    //Get all logs added by a user/node
    function GetLogs (string memory account) view public onlyOwner returns (LogReport[] memory) {
		return logsdata[account];
	}
}