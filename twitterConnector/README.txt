Description
===========
This is a sample Twitter connector. And the actions are being invoked with a ballerina main function.

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
- To run the actions in the Twitter connector update the main function with the relevant configuration given bellow with each action and run the command.
  1. tweet:
    function main (string[] args) {

        sample:Twitter twitterConnector = new sample:Twitter(args[0], args[1], args[2], args[3]);

        message tweetResponse;
        json tweetJSONResponse;

        tweetResponse = sample:Twitter.tweet(twitterConnector, args[4]);

        tweetJSONResponse = message:getJsonPayload(tweetResponse);
        system:println(json:toString(tweetJSONResponse));
    }

    bin$ ./ballerina run ../samples/twitterConnector/twitterConnector.bal <consumerKey> <consumerSecret> <accessToken> <accessTokenSecret> <message>

  2. search:
    function main (string[] args) {

        sample:Twitter twitterConnector = new sample:Twitter(args[0], args[1], args[2], args[3]);

        message tweetResponse;
        json tweetJSONResponse;

        tweetResponse = sample:Twitter.search(twitterConnector, args[4]);

        tweetJSONResponse = message:getJsonPayload(tweetResponse);
        system:println(json:toString(tweetJSONResponse));
    }

    bin$ ./ballerina run ../samples/twitterConnector/twitterConnector.bal <consumerKey> <consumerSecret> <accessToken> <accessTokenSecret> <query>

  3. reTweet:
    function main (string[] args) {

        sample:Twitter twitterConnector = new sample:Twitter(args[0], args[1], args[2], args[3]);

        message tweetResponse;
        json tweetJSONResponse;

        tweetResponse = sample:Twitter.reTweet(twitterConnector, args[4]);

        tweetJSONResponse = message:getJsonPayload(tweetResponse);
        system:println(json:toString(tweetJSONResponse));
    }

    bin$ ./ballerina run ../samples/twitterConnector/twitterConnector.bal <consumerKey> <consumerSecret> <accessToken> <accessTokenSecret> <tweetId>

  4. unReTweet:
    function main (string[] args) {

        sample:Twitter twitterConnector = new sample:Twitter(args[0], args[1], args[2], args[3]);

        message tweetResponse;
        json tweetJSONResponse;

        tweetResponse = sample:Twitter.unReTweet(twitterConnector, args[4]);

        tweetJSONResponse = message:getJsonPayload(tweetResponse);
        system:println(json:toString(tweetJSONResponse));
    }

    bin$ ./ballerina run ../samples/twitterConnector/twitterConnector.bal <consumerKey> <consumerSecret> <accessToken> <accessTokenSecret> <tweetId>

  5. showStatus:
    function main (string[] args) {

         message tweetResponse;
            json tweetJSONResponse;

            tweetResponse = sample:Twitter.showStatus(twitterConnector, args[4]);

            tweetJSONResponse = message:getJsonPayload(tweetResponse);
            system:println(json:toString(tweetJSONResponse));
    }

    bin$ ./ballerina run ../samples/twitterConnector/twitterConnector.bal <consumerKey> <consumerSecret> <accessToken> <accessTokenSecret> <tweetId>

  6. destroyStatus:
    function main (string[] args) {

        sample:Twitter twitterConnector = new sample:Twitter(args[0], args[1], args[2], args[3]);

        message tweetResponse;
        json tweetJSONResponse;

        tweetResponse = sample:Twitter.destroyStatus(twitterConnector, args[4]);

        tweetJSONResponse = message:getJsonPayload(tweetResponse);
        system:println(json:toString(tweetJSONResponse));
    }

    bin$ ./ballerina run ../samples/twitterConnector/twitterConnector.bal <consumerKey> <consumerSecret> <accessToken> <accessTokenSecret> <tweetId>

  7. getClosestTrendLocations:
    function main (string[] args) {

        sample:Twitter twitterConnector = new sample:Twitter(args[0], args[1], args[2], args[3]);

        message tweetResponse;
        json tweetJSONResponse;

        tweetResponse = sample:Twitter.getClosestTrendLocations(twitterConnector, args[4], args[5]);

        tweetJSONResponse = message:getJsonPayload(tweetResponse);
        system:println(json:toString(tweetJSONResponse));
    }

    bin$ ./ballerina run ../samples/twitterConnector/twitterConnector.bal <consumerKey> <consumerSecret> <accessToken> <accessTokenSecret> <latitude> <longitude>

  7. getTopTrendsByPlace:
    function main (string[] args) {

        sample:Twitter twitterConnector = new sample:Twitter(args[0], args[1], args[2], args[3]);

        message tweetResponse;
        json tweetJSONResponse;

        tweetResponse = sample:Twitter.getTopTrendsByPlace(twitterConnector, args[4]);

        tweetJSONResponse = message:getJsonPayload(tweetResponse);
        system:println(json:toString(tweetJSONResponse));
    }

    bin$ ./ballerina run ../samples/twitterConnector/twitterConnector.bal <consumerKey> <consumerSecret> <accessToken> <accessTokenSecret> <locationId>

