Description
===========
This is the gmail connector with the following actions. And the action is being invoked in a ballerina main function.

Prerequisites
=============
1. Create a project and create an app for this project by visiting https://console.developers.google.com/
2. Obtain the following parameters
    * Client Id
    * Client Secret
    * Redirect URI
    * Access Token
    * Refresh Token

IMPORTANT: This access token and refresh token can be used to make API requests on your own account's behalf. Do not share your access token, client  secret with anyone.


How to run this connector actions
=================================

Place the gmailConnector into {BALLERINA_HOME}/samples.

To run the actions of the Gmail connector update the main function with the relevant configuration given below with each action and run the command.

NOTE
====

If the template parameter is indicate as optional you must pass null as default value to run this action.

1. getUserProfile

bin$ ./ballerina run ../samples/gmailConnector/gmailConnector.bal <userId:-Required> <accessToken:-Required>

Main Function
=============

connectors:Gmail gmailConnector = new connectors:Gmail(args[0], args[1]);

message userProfileResponse;
json userProfileJSONResponse;
userProfileResponse = connectors:Gmail.getUserProfile(gmailConnector);
userProfileJSONResponse = message:getJsonPayload(userProfileResponse);
system:println(json:toString(userProfileJSONResponse));

2. createDraft

./ballerina run ../samples/gmailConnector/gmailConnector.bal <userId:-Required> <accessToken:-Required> <to:-Optional> <subject:-Optional> <from:-Optional> <"messageBody":-Optional> <cc:-Optional> <bcc:-Optional> <id:-Optional> <threadId:-Optional>

Main Function
=============
connectors:Gmail gmailConnector = new connectors:Gmail(args[0], args[1]);

message createDraftResponse;
json createDraftJSONResponse;
createDraftResponse = connectors:Gmail.createDraft(gmailConnector, args[2], args[3], args[4], args[5], args[6], args[7], args[8], args[9]);
createDraftJSONResponse = message:getJsonPayload(createDraftResponse);
system:println(json:toString(createDraftJSONResponse));

3. updateDraft

./ballerina run ../samples/gmailConnector/gmailConnector.bal <userId:-Required> <accessToken:-Required> <draftId:Required> <to:-Optional> <subject:-Optional> <from:-Optional> <"messageBody":-Optional> <cc:-Optional> <bcc:-Optional> <id:-Optional> <threadId:-Optional>

Main Function
=============
connectors:Gmail gmailConnector = new connectors:Gmail(args[0], args[1]);

message updateDraftResponse;
json updateDraftJSONResponse;
updateDraftResponse = connectors:Gmail.updateDraft(gmailConnector, args[2], args[3], args[4], args[5], args[6], args[7], args[8], args[9], args[10]);
updateDraftJSONResponse = message:getJsonPayload(updateDraftResponse);
system:println(json:toString(updateDraftJSONResponse));

4. readDraft

./ballerina run ../samples/gmailConnector/gmailConnector.bal <userId:-Required> <accessToken:-Required> <draftId:-Required> <format:-Optional but default "null">

Main Function
=============
connectors:Gmail gmailConnector = new connectors:Gmail(args[0], args[1]);

message draftsResponse;
json draftsJSONResponse;
draftsResponse = connectors:Gmail.readDrafts(gmailConnector, args[2], args[3]);
draftsJSONResponse = message:getJsonPayload(draftsResponse);
system:println(json:toString(draftsJSONResponse));

5. listDrafts

./ballerina run ../samples/gmailConnector/gmailConnector.bal <userId:Required> <accessToken:-Required> <includeSpamTrash> <maxResults> <pageToken> <q>

Main Function
=============
connectors:Gmail gmailConnector = new connectors:Gmail(args[0], args[1]);

message listDraftsResponse;
json listDraftsJSONResponse;
listDraftsResponse = connectors:Gmail.listDrafts(gmailConnector, args[2], args[3], args[4], args[5]);
listDraftsJSONResponse = message:getJsonPayload(listDraftsResponse);
system:println(json:toString(listDraftsJSONResponse));

6. deleteDraft

./ballerina run ../samples/gmailConnector/gmailConnector.bal <userId:-Required> <accessToken:-Required> <draftId:-Required>

Main Function
=============
connectors:Gmail gmailConnector = new connectors:Gmail(args[0], args[1]);

message deleteDraftsResponse;
json deleteDraftsJSONResponse;
string deleteResponse;
deleteDraftsResponse = connectors:Gmail.deleteDraft(gmailConnector, args[2]);
deleteDraftsJSONResponse = message:getJsonPayload(deleteDraftsResponse);
deleteResponse = json:toString(deleteDraftsJSONResponse);
if(deleteResponse == "null"){
system:println("Draft with id: " + args[2] + " deleted successfully.");
}

7. listHistory

./ballerina run ../samples/gmailConnector/gmailConnector.bal <userId:-Required> <accessToken:-Required> <labelId:-Optional but default "null"> <maxResults:-Optional but default null> <pageToken:-Optional but default null> <startHistoryId:-Required>

Main Function
=============
connectors:Gmail gmailConnector = new connectors:Gmail(args[0], args[1]);

message listHistoryResponse;
json listHistoryJSONResponse;
listHistoryResponse = connectors:Gmail.listHistory(gmailConnector, args[2], args[3], args[4], args[5]);
listHistoryJSONResponse = message:getJsonPayload(listHistoryResponse);
system:println(json:toString(listHistoryJSONResponse));

8. createLabel

./ballerina run ../samples/gmailConnector/gmailConnector.bal <userId:-Required> <accessToken:-Required> <labelName:-Required> <messageListVisibility:-Required> <labelListVisibility:-Required> <types:-Optional but default null> <messagesTotal:-Optional but default null> <messagesUnread:-Optional but default null> <threadsTotal:-Optional but default null> <threadsUnread:-Optional but default null>

Main Function
=============
connectors:Gmail gmailConnector = new connectors:Gmail(args[0], args[1]);

message createLabelResponse;
json createLabelJSONResponse;
createLabelResponse = connectors:Gmail.createLabel(gmailConnector, args[2], args[3], args[4], args[5], args[6], args[7], args[8], args[9]);
createLabelJSONResponse = message:getJsonPayload(createLabelResponse);
system:println(json:toString(createLabelJSONResponse));

9. deleteLabel

./ballerina run ../samples/gmailConnector/gmailConnector.bal <userId:-Required> <accessToken:-Required> <labelId:-Required>

Main Function
=============
connectors:Gmail gmailConnector = new connectors:Gmail(args[0], args[1]);

message deleteLabelResponse;
json deleteLabelJSONResponse;
string deleteLabelResponses;
deleteLabelResponse = connectors:Gmail.deleteLabel(gmailConnector, args[2]);
deleteLabelJSONResponse = message:getJsonPayload(deleteLabelResponse);
deleteLabelResponses = json:toString(deleteLabelJSONResponse);
if(deleteLabelResponses == "null"){
   system:println("Label with id: " + args[2] + " deleted successfully.");
}

10. listLabels

./ballerina run ../samples/gmailConnector/gmailConnector.bal <userId:-Required> <accessToken:-Required>

Main Function
=============
connectors:Gmail gmailConnector = new connectors:Gmail(args[0], args[1]);

message listLabelsResponse;
json listLabelsJSONResponse;
listLabelsResponse = connectors:Gmail.listLabels(gmailConnector);
listLabelsJSONResponse = message:getJsonPayload(listLabelsResponse);
system:println(json:toString(listLabelsJSONResponse));

11. updateLabel

./ballerina run ../samples/gmailConnector/gmailConnector.bal <userId:-Required> <accessToken:-Required> <labelId:-Required> <labelName:-Required> <messageListVisibility:-Required> <labelListVisibility:-Required> <types:-Optional but default null> <messagesTotal:-Optional but default null> <messagesUnread:-Optional but default null> <threadsTotal:-Optional but default null> <threadsUnread:-Optional but default null>

Main Function
=============
connectors:Gmail gmailConnector = new connectors:Gmail(args[0], args[1]);

message updateLabelResponse;
json updateLabelJSONResponse;
updateLabelResponse = connectors:Gmail.updateLabel(gmailConnector, args[2], args[3], args[4], args[5], args[6], args[7], args[8], args[9], args[10]);
updateLabelJSONResponse = message:getJsonPayload(updateLabelResponse);
system:println(json:toString(updateLabelJSONResponse));


12. readLabel

./ballerina run ../samples/gmailConnector/gmailConnector.bal <userId:-Required> <accessToken:-Required> <labelId:-Required>

Main Function
=============
connectors:Gmail gmailConnector = new connectors:Gmail(args[0], args[1]);

message readLabelResponse;
json readLabelJSONResponse;
readLabelResponse = connectors:Gmail.readLabel(gmailConnector, args[2]);
readLabelJSONResponse = message:getJsonPayload(readLabelResponse);
system:println(json:toString(readLabelJSONResponse));

13. readThread

./ballerina run ../samples/gmailConnector/gmailConnector.bal <userId:-Required> <accessToken:-Required> <threadId:-Required> <format> <metaDataHeaders>

Main Function
=============
connectors:Gmail gmailConnector = new connectors:Gmail(args[0], args[1]);

message readThreadResponse;
json readThreadJSONResponse;
readThreadResponse = connectors:Gmail.readThread(gmailConnector, args[2], args[3]);
readThreadJSONResponse = message:getJsonPayload(readThreadResponse);
system:println(json:toString(readThreadJSONResponse));

14. listThreads

./ballerina run ../samples/gmailConnector/gmailConnector.bal <userId:-Required> <accessToken:-Required> <includeSpamTrash> <labelIds> <maxResults> <pageToken> <q>

Main Function
=============
connectors:Gmail gmailConnector = new connectors:Gmail(args[0], args[1]);

message listThreadsResponse;
json listThreadsJSONResponse;
listThreadsResponse = connectors:Gmail.listThreads(gmailConnector, args[2], args[3], args[4], args[5], args[6]);
listThreadsJSONResponse = message:getJsonPayload(listThreadsResponse);
system:println(json:toString(listThreadsJSONResponse));

15. deleteThread

./ballerina run ../samples/gmailConnector/gmailConnector.bal <userId:-Required> <accessToken:-Required> <threadId:-Required>

Main Function
=============
connectors:Gmail gmailConnector = new connectors:Gmail(args[0], args[1]);

message deleteThreadResponse;
json deleteThreadJSONResponse;
string deleteThreadResponses;
deleteThreadResponse = connectors:Gmail.deleteThread(gmailConnector, args[2]);
deleteThreadJSONResponse = message:getJsonPayload(deleteThreadResponse);
deleteThreadResponses = json:toString(deleteThreadJSONResponse);
if(deleteThreadResponses == "null"){
    system:println("Thread with id: " + args[2] + " deleted successfully.");
}

16. trashThread

./ballerina run ../samples/gmailConnector/gmailConnector.bal <userId:-Required> <accessToken:-Required> <threadId:-Required>

Main Function
=============
connectors:Gmail gmailConnector = new connectors:Gmail(args[0], args[1]);

message trashThreadResponse;
json trashThreadJSONResponse;
trashThreadResponse = connectors:Gmail.trashThread(gmailConnector, args[2]);
trashThreadJSONResponse = message:getJsonPayload(trashThreadResponse);
system:println(json:toString(trashThreadJSONResponse));

17. unTrashThread

./ballerina run ../samples/gmailConnector/gmailConnector.bal <userId:-Required> <accessToken:-Required> <threadId:-Required>

Main Function
=============
connectors:Gmail gmailConnector = new connectors:Gmail(args[0], args[1]);

message unTrashThreadResponse;
json unTrashThreadJSONResponse;
unTrashThreadResponse = connectors:Gmail.unTrashThread(gmailConnector, args[2]);
unTrashThreadJSONResponse = message:getJsonPayload(unTrashThreadResponse);
system:println(json:toString(unTrashThreadJSONResponse));

18. listMails

./ballerina run ../samples/gmailConnector/gmailConnector.bal <userId:-Required> <accessToken:-Required> <includeSpamTrash> <labelIds> <maxResults> <pageToken> <q>

Main Function
=============
connectors:Gmail gmailConnector = new connectors:Gmail(args[0], args[1]);

message listMailsResponse;
json listMailsJSONResponse;
listMailsResponse = connectors:Gmail.listMails(gmailConnector, args[2], args[3], args[4], args[5], args[6]);
listMailsJSONResponse = message:getJsonPayload(listMailsResponse);
system:println(json:toString(listMailsJSONResponse));

19. sendMail

./ballerina run ../samples/gmailConnector/gmailConnector.bal <userId:-Required> <accessToken:-Required> <to:-Optional> <subject:-Optional> <from:-Optional> <"messageBody":-Optional> <cc:-Optional> <bcc:-Optional> <id:-Optional> <threadId:-Optional>

Main Function
=============
connectors:Gmail gmailConnector = new connectors:Gmail(args[0], args[1]);

message sendMailResponse;
json sendMailJSONResponse;
sendMailResponse = connectors:Gmail.sendMail(gmailConnector, args[2], args[3], args[4], args[5], args[6], args[7], args[8], args[9]);
sendMailJSONResponse = message:getJsonPayload(sendMailResponse);
system:println(json:toString(sendMailJSONResponse));

20. readMail

./ballerina run ../samples/gmailConnector/gmailConnector.bal <userId:-Required> <accessToken:-Required> <messageId:-Required> <format> <metaDataHeaders>

Main Function
=============
connectors:Gmail gmailConnector = new connectors:Gmail(args[0], args[1]);

message readMailResponse;
json readMailJSONResponse;
readMailResponse = connectors:Gmail.readMail(gmailConnector, args[2], args[3], args[4]);
readMailJSONResponse = message:getJsonPayload(readMailResponse);
system:println(json:toString(readMailJSONResponse));

21. deleteMail

./ballerina run ../samples/gmailConnector/gmailConnector.bal <userId:-Required> <accessToken:-Required> <messageId:-Required>

Main Function
=============
connectors:Gmail gmailConnector = new connectors:Gmail(args[0], args[1]);

message deleteMailResponse;
json deleteMailJSONResponse;
string deleteMailResponses;
deleteMailResponse = connectors:Gmail.deleteMail(gmailConnector, args[2]);
deleteMailJSONResponse = message:getJsonPayload(deleteMailResponse);
deleteMailResponses = json:toString(deleteMailJSONResponse);
if(deleteMailResponses == "null"){
    system:println("Mail with id: " + args[2] + " deleted successfully.");
}

22. trashMail

./ballerina run ../samples/gmailConnector/gmailConnector.bal <userId:-Required> <accessToken:-Required> <messageId:-Required>

Main Function
=============
connectors:Gmail gmailConnector = new connectors:Gmail(args[0], args[1]);

message trashMailResponse;
json trashMailJSONResponse;
trashMailResponse = connectors:Gmail.trashMail(gmailConnector, args[2]);
trashMailJSONResponse = message:getJsonPayload(trashMailResponse);
system:println(json:toString(trashMailJSONResponse));


23. unTrashMail

./ballerina run ../samples/gmailConnector/gmailConnector.bal <userId:-Required> <accessToken:-Required> <messageId:-Required>

Main Function
=============
connectors:Gmail gmailConnector = new connectors:Gmail(args[0], args[1]);

message unTrashMailResponse;
json unTrashMailJSONResponse;
unTrashMailResponse = connectors:Gmail.unTrashMail(gmailConnector, args[2]);
unTrashMailJSONResponse = message:getJsonPayload(unTrashMailResponse);
system:println(json:toString(unTrashMailJSONResponse));

