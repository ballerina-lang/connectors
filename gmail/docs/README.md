# Gmail Connector

This is the gmail connector for ballerina which helps to access the Gmail REST API with the
following actions. And the actions are being invoked by a ballerina main function. The detailed
explanation of a connector operations can found in the following section.

## getUserProfile
   The getUserProfile action helps to Get the current user's Gmail profile.

###### Properties

###### Related Gmail documentation
   [getUserProfile](https://developers.google.com/gmail/api/v1/reference/users/getProfile)

## createDraft
   The createDraft action helps to Creates a new draft with the DRAFT label.

###### Properties
   * to - Receiver mail ID
   * subject - Subject of the message
   * from - Sender mail ID
   * messageBody- Entire message body
   * cc - To whom sender need to cc the mail
   * bcc - To whom sender need to bcc the mail
   * id - Id of the draft to create
   * threadId - thread Id of the draft to reply

###### Related Gmail documentation
   [createDraft](https://developers.google.com/gmail/api/v1/reference/users/drafts/create)

## updateDraft
   The updateDraft action helps to Replaces a draft's content.

###### Properties
   * draftId - The ID of the draft to update
   * to - Receiver mail ID
   * subject - Subject of the message
   * from - Sender mail ID
   * messageBody- Entire message body
   * cc - To whom sender need to cc the mail
   * bcc - To whom sender need to bcc the mail
   * id - Id of the draft to update
   * threadId - thread Id of the draft to reply

###### Related Gmail documentation
   [updateDraft](https://developers.google.com/gmail/api/v1/reference/users/drafts/update)

## readDraft
   The readDraft action helps to Gets the specified draft.

###### Properties
   * draftId - The ID of the draft to retrieve
   * format - The format to return the draft in

###### Related Gmail documentation
   [readDraft](https://developers.google.com/gmail/api/v1/reference/users/drafts/get)

## listDrafts
   The listDrafts action helps to Lists the drafts in the user's mailbox.

###### Properties
   * includeSpamTrash - Include messages from SPAM and TRASH in the results
   * maxResults - Maximum number of messages to return
   * pageToken - Page token to retrieve a specific page of results in the list
   * q - Only return messages matching the specified query. Supports the same query format as
    the Gmail search box

###### Related Gmail documentation
   [listDrafts](https://developers.google.com/gmail/api/v1/reference/users/drafts/list)

## deleteDraft
   The deleteDraft action helps to Immediately and permanently deletes the specified draft. Does not simply trash it.

###### Properties
   * draftId - The ID of the draft to delete

###### Related Gmail documentation
   [deleteDraft](https://developers.google.com/gmail/api/v1/reference/users/drafts/delete)

## listHistory
   The listHistory action helps Lists the history to of all changes to the given mailbox. History
   results are returned in chronological order (increasing historyId)

###### Properties
   * labelId - Only return messages with a label matching the ID
   * maxResults - The maximum number of history records to return
   * pageToken - Page token to retrieve a specific page of results in the list
   * startHistoryId - Returns history records after the specified startHistoryId

###### Related Gmail documentation
   [listHistory](https://developers.google.com/gmail/api/v1/reference/users/history/list)

## createLabel
   The createLabel action helps to Creates a new label.

###### Properties
   * labelName - The display name of the label
   * messageListVisibility - The visibility of messages with this label in the message list in the
     Gmail web interface
   * labelListVisibility - The visibility of the label in the label list in the Gmail web interface
   * types - The owner type for the label
   * messagesTotal - The total number of messages with the label
   * messagesUnread - The number of unread messages with the label
   * threadsTotal - The total number of threads with the label
   * threadsUnread - The number of unread threads with the label

###### Related Gmail documentation
   [createLabel](https://developers.google.com/gmail/api/v1/reference/users/labels/create)

## deleteLabel
   The deleteLabel action helps to Immediately and permanently deletes the specified label and
   removes it from any messages and threads that it is applied to.

###### Properties
   * labelId - The ID of the label to delete

###### Related Gmail documentation
   [deleteLabel](https://developers.google.com/gmail/api/v1/reference/users/labels/delete)

## listLabels
   The listLabels action helps to Lists all labels in the user's mailbox.

###### Related Gmail documentation
   [listLabels](https://developers.google.com/gmail/api/v1/reference/users/labels/list)

## updateLabel
   The updateLabel action helps to Updates the specified label.

###### Properties
   * labelId - The ID of the label to update
   * labelName - The display name of the label
   * messageListVisibility - The visibility of messages with this label in the message list in the
     Gmail web interface.
   * labelListVisibility - The visibility of the label in the label list in the Gmail web interface.
   * types - The owner type for the label
   * messagesTotal - The total number of messages with the label
   * messagesUnread - The number of unread messages with the label
   * threadsTotal - The total number of threads with the label
   * threadsUnread - The number of unread threads with the label

###### Related Gmail documentation
   [updateLabel](https://developers.google.com/gmail/api/v1/reference/users/labels/update)

## readLabel
   The readLabel action helps to Gets the specified label.

###### Properties
   * labelId - The ID of the label to retrieve

###### Related Gmail documentation
   [readLabel](https://developers.google.com/gmail/api/v1/reference/users/labels/get)

## readThread
   The readThread action helps to Gets the specified thread.

###### Properties
   * threadId - The ID of the thread to retrieve
   * format - The format to return the thread in
   * metaDataHeaders - When given and format is METADATA, only include headers specified

###### Related Gmail documentation
   [readThread](https://developers.google.com/gmail/api/v1/reference/users/threads/get)

## listThreads
   The listThreads action helps to Lists the threads in the user's mailbox.

###### Properties
   * labelIds - Only return messages with labels that match all of the specified label IDs
   * includeSpamTrash - Include messages from SPAM and TRASH in the results
   * maxResults - Maximum number of messages to return
   * pageToken - Page token to retrieve a specific page of results in the list
   * q - Only return messages matching the specified query. Supports the same query format as
    the Gmail search box

###### Related Gmail documentation
   [listThreads](https://developers.google.com/gmail/api/v1/reference/users/threads/list)

## deleteThread
   The deleteThread action helps to Immediately and permanently deletes the specified thread.
   This operation cannot be undone. Prefer threads.trash instead.

###### Properties
   * threadId - The ID of the thread to delete

###### Related Gmail documentation
   [deleteThread](https://developers.google.com/gmail/api/v1/reference/users/threads/delete)

## trashThread
   The trashThread action helps to Moves the specified thread to the trash.

###### Properties
   * threadId - The ID of the thread to Trash

###### Related Gmail documentation
   [trashThread](https://developers.google.com/gmail/api/v1/reference/users/threads/trash)

## unTrashThread
   The unTrashThread action helps to Removes the specified thread from the trash.

###### Properties
   * threadId - The ID of the thread to unTrash

###### Related Gmail documentation
   [unTrashThread](https://developers.google.com/gmail/api/v1/reference/users/threads/untrash)

## listMails
   The listMails action helps to Lists the messages in the user's mailbox.

###### Properties
   * labelIds - Only return messages with labels that match all of the specified label IDs
   * includeSpamTrash - Include messages from SPAM and TRASH in the results
   * maxResults - Maximum number of messages to return
   * pageToken - Page token to retrieve a specific page of results in the list
   * q - Only return messages matching the specified query. Supports the same query format as
    the Gmail search box

###### Related Gmail documentation
   [listMails](https://developers.google.com/gmail/api/v1/reference/users/messages/list)

## sendMail
   The sendMail action helps to Sends the specified message to the recipients.

###### Properties
   * to - Receiver mail ID
   * subject - Subject of the message
   * from - Sender mail ID
   * messageBody- Entire message body
   * cc - To whom sender need to cc the mail
   * bcc - To whom sender need to bcc the mail
   * id - Id of the message to reply
   * threadId - To whom sender need to bcc the mail

###### Related Gmail documentation
   [sendMail](https://developers.google.com/gmail/api/v1/reference/users/messages/send)

## modifyExistingMessage
   The modifyExistingMessage action helps to Modifies the labels on the specified message.

###### Properties
   * messageId - The ID of the message to modifies the labels
   * addLabelIds - A list of IDs of labels to add to this message
   * removeLabelIds - A list IDs of labels to remove from this message

###### Related Gmail documentation
   [modifyExistingMessage](https://developers.google.com/gmail/api/v1/reference/users/messages/modify)

## readMail
   The readMail action helps to Gets the specified message.

###### Properties
   * messageId - The ID of the message to retrieve
   * format - The format to return the message in
   * metaDataHeaders - When given and format is METADATA, only include headers specified.

###### Related Gmail documentation
   [readMail](https://developers.google.com/gmail/api/v1/reference/users/messages/get)

## deleteMail
   The deleteMail action helps to Immediately and permanently deletes the specified message.
   This operation cannot be undone. Prefer messages.trash instead.

###### Properties
   * messageId - The ID of the message to delete

###### Related Gmail documentation
   [deleteMail](https://developers.google.com/gmail/api/v1/reference/users/messages/delete)

## trashMail
   The trashMail action helps to Moves the specified message to the trash.

###### Properties
   * messageId - The ID of the message to trash

###### Related Gmail documentation
   [trashMail](https://developers.google.com/gmail/api/v1/reference/users/messages/trash)

## unTrashMail
   The unTrashMail action helps to Removes the specified message from the trash.

###### Properties
   * messageId - The ID of the message to unTrash

###### Related Gmail documentation
   [unTrashMail](https://developers.google.com/gmail/api/v1/reference/users/messages/untrash)


## How to use

###### Prerequisites

1. Create a project and create an app for this project by visiting [Gmail](https://console.developers.google.com/)
2. Obtain the following parameters
   * Client Id
   * Client Secret
   * Redirect URI
   * Access Token
   * Refresh Token
   
    **IMPORTANT** This access token and refresh token can be used to make API requests on your own
account's behalf. Do not share your access token, client  secret with anyone.


###### Invoke the actions

- Place the gmailConnector into {BALLERINA_HOME}/samples.

- To run the actions of the Gmail connector run the below command for relevant actions.

###### NOTE

If the template parameter is indicate as optional you must pass null as default value to run this
action.
   1. getUserProfile
`bin$ ./ballerina run ../samples/gmail/src/gmailConnector.bal getUserProfile <userId:-Required>
<accessToken:-Required> <refreshToken:-Optional> <clientId:-Optional> <clientSecret:-Optional>`
   2. createDraft
`bin$ ./ballerina run ../samples/gmail/src/gmailConnector.bal createDraft <userId:-Required>
<accessToken:-Required> <refreshToken:-Optional> <clientId:-Optional> <clientSecret:-Optional>
<to:-Optional> <subject:-Optional> <from:-Optional> <"messageBody":-Optional> <cc:-Optional>
<bcc:-Optional> <id:-Optional> <threadId:-Optional>`
   3. updateDraft
`bin$ ./ballerina run ../samples/gmail/src/gmailConnector.bal updateDraft <userId:-Required>
<accessToken:-Required> <refreshToken:-Optional> <clientId:-Optional> <clientSecret:-Optional>
<draftId:Required> <to:-Optional> <subject:-Optional> <from:-Optional> <"messageBody":-Optional>
<cc:-Optional> <bcc:-Optional> <id:-Optional> <threadId:-Optional>`
   4. readDraft
`bin$ ./ballerina run ../samples/gmail/src/gmailConnector.bal readDraft <userId:-Required>
<accessToken:-Required> <refreshToken:-Optional> <clientId:-Optional> <clientSecret:-Optional>
 <draftId:-Required> <format:-Optional>`
   5. listDrafts
`bin$ ./ballerina run ../samples/gmail/src/gmailConnector.bal listDrafts <userId:-Required>
<accessToken:-Required> <refreshToken:-Optional> <clientId:-Optional> <clientSecret:-Optional>
 <includeSpamTrash> <maxResults> <pageToken> <q>`
   6. deleteDraft
`bin$ ./ballerina run ../samples/gmail/src/gmailConnector.bal deleteDraft <userId:-Required>
<accessToken:-Required> <refreshToken:-Optional> <clientId:-Optional> <clientSecret:-Optional>
 <draftId:-Required>`
   7. listHistory
`bin$ ./ballerina run ../samples/gmail/src/gmailConnector.bal listHistory <userId:-Required>
<accessToken:-Required> <refreshToken:-Optional> <clientId:-Optional> <clientSecret:-Optional>
 <labelId:-Optional> <maxResults:-Optional> <pageToken:-Optional>
<startHistoryId:-Required>`
   8. createLabel
`bin$ ./ballerina run ../samples/gmail/src/gmailConnector.bal createLabel <userId:-Required>
<accessToken:-Required> <refreshToken:-Optional> <clientId:-Optional> <clientSecret:-Optional>
<labelName:-Required> <messageListVisibility:-Required> <labelListVisibility:-Required>
<types:-Optional> <messagesTotal:-Optional> <messagesUnread:-Optional>
<threadsTotal:-Optional> <threadsUnread:-Optional>`
   9. deleteLabel
`bin$ ./ballerina run ../samples/gmail/src/gmailConnector.bal deleteLabel <userId:-Required>
<accessToken:-Required> <refreshToken:-Optional> <clientId:-Optional> <clientSecret:-Optional>
<labelId:-Required>`
   10. listLabels
`bin$ ./ballerina run ../samples/gmail/src/gmailConnector.bal listLabels <userId:-Required>
<accessToken:-Required> <refreshToken:-Optional> <clientId:-Optional> <clientSecret:-Optional>`
   11. updateLabel
`bin$ ./ballerina run ../samples/gmail/src/gmailConnector.bal updateLabel <userId:-Required>
<accessToken:-Required> <refreshToken:-Optional> <clientId:-Optional> <clientSecret:-Optional>
<labelId:-Required> <labelName:-Required> <messageListVisibility:-Required>
<labelListVisibility:-Required> <types:-Optional> <messagesTotal:-Optional> <messagesUnread:-Optional>
<threadsTotal:-Optional> <threadsUnread:-Optional>`
   12. readLabel
`bin$ ./ballerina run ../samples/gmail/src/gmailConnector.bal readLabel <userId:-Required>
<accessToken:-Required> <refreshToken:-Optional> <clientId:-Optional> <clientSecret:-Optional>
<labelId:-Required>`
   13. readThread
`bin$ ./ballerina run ../samples/gmail/src/gmailConnector.bal readThread <userId:-Required>
<accessToken:-Required> <refreshToken:-Optional> <clientId:-Optional> <clientSecret:-Optional>
<threadId:-Required> <format> <metaDataHeaders>`
   14. listThreads
`bin$ ./ballerina run ../samples/gmail/src/gmailConnector.bal listThreads <userId:-Required>
<accessToken:-Required> <refreshToken:-Optional> <clientId:-Optional> <clientSecret:-Optional>
<includeSpamTrash> <labelIds> <maxResults> <pageToken> <q>`
   15. deleteThread
`bin$ ./ballerina run ../samples/gmail/src/gmailConnector.bal deleteThread <userId:-Required>
<accessToken:-Required> <refreshToken:-Optional> <clientId:-Optional> <clientSecret:-Optional>
<threadId:-Required>`
   16. trashThread
`bin$ ./ballerina run ../samples/gmail/src/gmailConnector.bal trashThread <userId:-Required>
<accessToken:-Required> <refreshToken:-Optional> <clientId:-Optional> <clientSecret:-Optional>
<threadId:-Required>`
   17. unTrashThread
`bin$ ./ballerina run ../samples/gmail/src/gmailConnector.bal unTrashThread <userId:-Required>
<accessToken:-Required> <refreshToken:-Optional> <clientId:-Optional> <clientSecret:-Optional>
<threadId:-Required>`
   18. listMails
`bin$ ./ballerina run ../samples/gmail/src/gmailConnector.bal listMails <userId:-Required>
<accessToken:-Required> <refreshToken:-Optional> <clientId:-Optional> <clientSecret:-Optional>
<includeSpamTrash> <labelIds> <maxResults> <pageToken> <q>`
   19. sendMail
`bin$ ./ballerina run ../samples/gmail/src/gmailConnector.bal sendMail <userId:-Required>
<accessToken:-Required> <refreshToken:-Optional> <clientId:-Optional> <clientSecret:-Optional>
<to:-Optional> <subject:-Optional> <from:-Optional> <"messageBody":-Optional> <cc:-Optional>
<bcc:-Optional> <id:-Optional> <threadId:-Optional>`
   20. modifyExistingMessage
`bin$ ./ballerina run ../samples/gmail/src/gmailConnector.bal modifyExistingMessage <userId:-Required>
<accessToken:-Required> <refreshToken:-Optional> <clientId:-Optional> <clientSecret:-Optional>
<messageId:-Required> <addLabelIds:-Either addLabelIds or removeLabelIds is required>
<removeLabelIds:- Either addLabelIds or removeLabelIds is required>`
   21. readMail
`bin$ ./ballerina run ../samples/gmail/src/gmailConnector.bal readMail <userId:-Required>
<accessToken:-Required> <refreshToken:-Optional> <clientId:-Optional> <clientSecret:-Optional>
<messageId:-Required> <format> <metaDataHeaders>`
   22. deleteMail
`bin$ ./ballerina run ../samples/gmail/src/gmailConnector.bal deleteMail <userId:-Required>
<accessToken:-Required> <refreshToken:-Optional> <clientId:-Optional> <clientSecret:-Optional>
<messageId:-Required>`
   23. trashMail
`bin$ ./ballerina run ../samples/gmail/src/gmailConnector.bal trashMail <userId:-Required>
<accessToken:-Required> <refreshToken:-Optional> <clientId:-Optional> <clientSecret:-Optional>
<messageId:-Required>`
   24. unTrashMail
`bin$ ./ballerina run ../samples/gmail/src/gmailConnector.bal unTrashMail <userId:-Required>
<accessToken:-Required> <refreshToken:-Optional> <clientId:-Optional> <clientSecret:-Optional>
<messageId:-Required>`