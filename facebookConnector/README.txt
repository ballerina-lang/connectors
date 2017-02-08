Description
===========
The Facebook connector allows you to access the Facebook REST API. And the actions are being invoked with a ballerina main function.

Prerequisites
=============
1. Get the access_token from https://developers.facebook.com/tools/explorer/


IMPORTANT: This access token can be used to make API requests on your own account's behalf. Do not share your access token with anyone.


How to run this sample
======================
- Place the facebookConnector into {BALLERINA_HOME}/samples.
- Run the actions using relevant commands as mentioned below.
  1. createPost:

    bin$ ./ballerina run ../samples/facebookConnector/facebookConnector.bal createPost <token> <message> <link> <place>

  2. retrievePost:

    bin$ ./ballerina run ../samples/facebookConnector/facebookConnector.bal retrievePost <token> <postId> <fields>

  3. deletePost:

    bin$ ./ballerina run ../samples/facebookConnector/facebookConnector.bal deletePost <token> <postId>

  4. updatePost:

    bin$ ./ballerina run ../samples/facebookConnector/facebookConnector.bal updatePost <token> <postId> <message> <tags> <privacy>

  5. addLikes:

    bin$ ./ballerina run ../samples/facebookConnector/facebookConnector.bal addLikes <token> <objectId>

  6. getLikesDetails:

    bin$ ./ballerina run ../samples/facebookConnector/facebookConnector.bal getLikesDetails <token> <objectId> <fields>

  7. deleteLikes:

    bin$ ./ballerina run ../samples/facebookConnector/facebookConnector.bal deleteLikes <token> <objectId> <fields>