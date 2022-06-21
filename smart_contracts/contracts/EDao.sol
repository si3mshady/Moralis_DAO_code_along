//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.7;

import "hardhat/console.sol";

interface DAOcontract {
    function balanceOf(address,uint256) external view returns (uint256);
}

contract EDAO {
    
    address public owner;
    uint256 nextProposal;
    uint256[] public validTokens;
    DAOcontract daoContract;

    constructor() {
        owner = msg.sender ;
        nextProposal = 1;
        daoContract = DAOcontract(0x2953399124F0cBB46d2CbACD8A89cF0599974963);
        validTokens = [34885103611559094078416375598166902696017567311370712658413208238551126245396];

        // #you must have an nft from the collection to vote on the dao. Very nice 
        // explained https://youtu.be/sAcEJcwPTOk?t=524 
    } 


    struct proposal{
        uint256 id;
        bool exists;
        string description;
        uint deadline;
        uint256 votesUp;
        uint256 votesDown;
        address[] canVote;
        uint256 maxVotes;
        mapping(address => bool) voteStatus;
        bool countConducted;
        bool passed;
    }


       mapping(uint256 => proposal) public Proposals;


        event proposalCreated(
        uint256 id,
        string description,
        uint256 maxVotes,
        address proposer
    );


    event newVote(
        uint256 votesUp,
        uint256 votesDown,
        address voter,
        uint256 proposal,
        bool votedFor
    );

}
