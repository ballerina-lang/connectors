Description
===========
The Twitter connector allows you to access the Twitter REST API. And the actions are being invoked with a ballerina main function.

Prerequisites
=============
1. Create a twitter app by visiting https://apps.twitter.com/
2. Obtain the following parameters
    * Consumer Key (API Key)
    * Consumer Secret (API Secret)
    * Access Token
    * Access Token Secret

IMPORTANT: This access token can be used to make API requests on your own account's behalf. Do not share your access token secret with anyone.


How to run this sample
======================
- Place the twitterConnector into {BALLERINA_HOME}/samples.
- To run the following commands to execute the relevant action.
  1. tweet:
    bin$ ./ballerina run ../samples/twitterConnector/twitterConnector.bal tweet <consumerKey> <consumerSecret> <accessToken> <accessTokenSecret> <message>

  2. search:
    bin$ ./ballerina run ../samples/twitterConnector/twitterConnector.bal search <consumerKey> <consumerSecret> <accessToken> <accessTokenSecret> <query>

  3. reTweet:
    bin$ ./ballerina run ../samples/twitterConnector/twitterConnector.bal reTweet <consumerKey> <consumerSecret> <accessToken> <accessTokenSecret> <tweetId>

  4. unReTweet:
    bin$ ./ballerina run ../samples/twitterConnector/twitterConnector.bal unReTweet <consumerKey> <consumerSecret> <accessToken> <accessTokenSecret> <tweetId>

  5. showStatus:
    bin$ ./ballerina run ../samples/twitterConnector/twitterConnector.bal showStatus <consumerKey> <consumerSecret> <accessToken> <accessTokenSecret> <tweetId>

  6. destroyStatus:
    bin$ ./ballerina run ../samples/twitterConnector/twitterConnector.bal destroyStatus <consumerKey> <consumerSecret> <accessToken> <accessTokenSecret> <tweetId>

  7. getClosestTrendLocations:
    bin$ ./ballerina run ../samples/twitterConnector/twitterConnector.bal getClosestTrendLocations <consumerKey> <consumerSecret> <accessToken> <accessTokenSecret> <latitude> <longitude>

  7. getTopTrendsByPlace:
    bin$ ./ballerina run ../samples/twitterConnector/twitterConnector.bal getTopTrendsByPlace <consumerKey> <consumerSecret> <accessToken> <accessTokenSecret> <locationId>
