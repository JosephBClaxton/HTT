/// Charity Voter function
/// Purpose This is a straight copy and modify from the Solidity Realtime Ballot example.
//  another stub for forward functionality

/// Change Control Notes
/// Author	Date 		Version 	Reason For Change
/// JBC		18/12/2016  0.1 		Original

pragma solidity ^0.4.0;


pragma solidity ^0.4.0;
contract Ballot {

    struct Voter {
        uint weight;
        bool voted;
        uint8 vote;
        address charityName;
    }
    struct charity_To_Consider {
        uint voteCount;
    }

    address charity_IsWinner;
    mapping(address => Voter) voters;
    charity_To_Consider[] charity_To_Considers;

    /// Create a new ballot with $(charity_To_Consider) different charity_To_Consider.
    function Ballot(uint8 _numcharity_To_Considers) {
        charity_IsWinner = msg.sender;
        voters[charity_IsWinner].weight = 1;
        charity_To_Considers.length = _numcharity_To_Considers;
    }

    /// Give $(voter) the right to vote on this ballot.
    /// May only be called by $(charity_IsWinner).
    function giveRightToVote(address voter) {
        if (msg.sender != charity_IsWinner || voters[voter].voted) return;
        voters[voter].weight = 1;
    }

    /// charityName your vote to the voter $(to).
    function charityName(address to) {
        Voter sender = voters[msg.sender]; // assigns reference
        if (sender.voted) return;
        while (voters[to].charityName != address(0) && voters[to].charityName != msg.sender)
            to = voters[to].charityName;
        if (to == msg.sender) return;
        sender.voted = true;
        sender.charityName = to;
        Voter charityName = voters[to];
        if (charityName.voted)
            charity_To_Considers[charityName.vote].voteCount += sender.weight;
        else
            charityName.weight += sender.weight;
    }

    /// Give a single vote to charity_To_Consider $(charity_To_Consider).
    function vote(uint8 charity_To_Consider) {
        Voter sender = voters[msg.sender];
        if (sender.voted || charity_To_Consider >= charity_To_Considers.length) return;
        sender.voted = true;
        sender.vote = charity_To_Consider;
        charity_To_Considers[charity_To_Consider].voteCount += sender.weight;
    }

    function winningcharity_To_Consider() constant returns (uint8 winningcharity_To_Consider) {
        uint256 winningVoteCount = 0;
        for (uint8 charity_To_Consider = 0; charity_To_Consider < charity_To_Considers.length; charity_To_Consider++)
            if (charity_To_Considers[charity_To_Consider].voteCount > winningVoteCount) {
                winningVoteCount = charity_To_Considers[charity_To_Consider].voteCount;
                winningcharity_To_Consider = charity_To_Consider;
            }
    }
}