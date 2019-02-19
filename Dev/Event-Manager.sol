pragma solidity ^0.4.25;

contract eventRegister{
    	//Event Register Variables    
    
	struct wibbevent{
		uint16 id; 
		bytes32 eventName;
		bytes32 eventDescription;  
		address registrator; //the one who publishes the event on the dao
		uint16 secretCode; //random uint number generated when the event is created --> alternatively, how could be solved with a QR approach?
		uint16 positiveVoteStake; // sum of % of WIBBs stake from the positive voters
		uint16 negativeVoteSake; // sum of % of WIBBs stake from the positive voters
		bool votingProcessEnded; //if the validation process for this task has already ended
		bool approved; //if the task has been approved
    	}

	wibbevent[] public registeredEvents;
	uint256 balanceRegistrator;
	event taskOpened;
	event taskClosed;    

	///check if a user is allowed to register the event (only the ones who have more than 100 wibbs are allowed to do it
	function isUserValid public returns(bool success){
		balanceRegistrator=balanceOf(msg.sender);  ***how to make a call for getting the balance of the wibb tokens?
	        if(balance>100){
            return true;
        	}
    	}	

	
    ///function for registering an event
    function eventRegistration(bytes32 _eventName, bytes32 _eventDescription) public {
        require(isUserValid(msg.sender),
        "User registrator is not valid");
	secretCodeOutput= //random number of 6 digits
	 wibbevent({
            id:registeredEvents.length,
            eventName:_eventName,
            eventDescriptionr:_eventDescription,
            registrator:msg.sender,
            secretCode: secretCodeOutput,  
            positiveVoteStake:0,
            negativeVoteStake:0,
	    votingProcessEnded: 0,
            approved: false});
        
        registeredEvents.push(wibbevent);
    }

	

