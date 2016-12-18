/// Charity Voter function
/// Purpose This is a straight copy and modify from the Solidity Realtime Ballot example.
// another stub for forward functionality

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
    struct Proposal {
        uint voteCount;
    }

    address charity_IsWinner;
    mapping(address => Voter) voters;
    Proposal[] proposals;

    /// Create a new ballot with $(_numProposals) different proposals.
    function Ballot(uint8 _numProposals) {
        charity_IsWinner = msg.sender;
        voters[charity_IsWinner].weight = 1;
        proposals.length = _numProposals;
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
            proposals[charityName.vote].voteCount += sender.weight;
        else
            charityName.weight += sender.weight;
    }

    /// Give a single vote to proposal $(proposal).
    function vote(uint8 proposal) {
        Voter sender = voters[msg.sender];
        if (sender.voted || proposal >= proposals.length) return;
        sender.voted = true;
        sender.vote = proposal;
        proposals[proposal].voteCount += sender.weight;
    }

    function winningProposal() constant returns (uint8 winningProposal) {
        uint256 winningVoteCount = 0;
        for (uint8 proposal = 0; proposal < proposals.length; proposal++)
            if (proposals[proposal].voteCount > winningVoteCount) {
                winningVoteCount = proposals[proposal].voteCount;
                winningProposal = proposal;
            }
    }
}