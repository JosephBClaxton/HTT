/// HTT Hackerthon Draft FactTile Code (FTC)
/// FTC = SENDER / SELLER and has a contract with the DDWFT such that the DDWFT is the RECEIVER / BUYER
/// In cases where the contract request is rejected a rejection code is noted in the FTC Log.
/// Description
/// FactTiles such as this make up the Decentralised Data Warehouse Fact Table  (DDWFT)
/// living on the public live BlockChain.
/// Individual SME and Corporate Customers will be as coded as private chains / coloured coins
/// including data put in the public domain. Their 'links' will be coded as a DDWFT.
/// 
/// In contract terminology the Factile is the sender or seller. The DDWFT is the buyer or recipient.
/// 
/// The final version may well be architected according to Swarm / Whisper protocols but for the purposes of the hackerthon
/// this FTC is being coded in Solidity
/// 
/// Change Control Notes
/// Author	Date 		Version 	Reason For Change
/// JBC		18/12/2016  0.1 		Original
///
/// Begin
contract FTC_userID {	
	mapping (address => uString) PrChainID;
	function PrChainID {
		iDInform[msg.sender] = true;
	}
	function sendFTC(address receiver, uString amount) returns(bool sufficient) {
		if (idInform[msg.sender] <> true) 
			idInform[msg.sender] FTC_logFalse; /// This is an action
			idInform[receiver]   instruct_OwnerPchain_logFalse; ///Initiate a FactTile / OwnerPrivate Chain Contract - both sender and private owner chain need to concur on what just happened.
														  /// because it the PrivateChain needs to know the status of a send to the public DW
		return false;
	else
			idInform[receiver]   instruct_OwnerPchain_logtrue;  //This is an instruction (both sender and private owner chain need to concur on what just happened.
			idInform[msg.sender] FTC_Bank_1_TokenBit; ///Initiate a FactTile / OwnerPrivate Chain Contract - both sender and private owner chain need to concur on what just happened.
														  /// because it the PrivateChain needs to know the status of a send to the public DW
			idInform[msg.sender] FTC_logFalse; /// This is an action
	
		return true;
	}
}


/// End

