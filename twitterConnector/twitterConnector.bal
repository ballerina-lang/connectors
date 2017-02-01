package org.wso2.ballerina.connectors;

import ballerina.lang.array;
import ballerina.lang.json;
import ballerina.lang.map;
import ballerina.lang.message;
import ballerina.lang.string;
import ballerina.lang.system;
import ballerina.net.http;
import ballerina.net.uri;
import ballerina.util;

connector Twitter (string consumerKey, string consumerSecret, string accessToken, string accessTokenSecret) {

    http:HTTPConnector tweeterEP = new http:HTTPConnector("https://api.twitter.com");

    action tweet(Twitter t, string msg) (message) {

        string tweetPath;
        string serviceEP;
        message request;
        message response;
        map parameters;

        tweetPath = "/1.1/statuses/update.json";
        serviceEP = "https://api.twitter.com" + tweetPath;
        parameters["status"] = msg;
        tweetPath = tweetPath + "?status="+uri:encode(msg);
        constructOAuthHeader(request, "POST", serviceEP, consumerKey, consumerSecret, accessToken, accessTokenSecret, parameters);

        message:setHeader(request, "User-Agent", "Ballerina-1.0");

        response = http:HTTPConnector.post(tweeterEP, tweetPath, request);

        return response;
    }

    action reTweet(Twitter t, string tweetId) (message) {

        string tweetPath;
        string serviceEP;
        message request;
        message response;
        map parameters;

        tweetPath = "/1.1/statuses/retweet/" + tweetId + ".json";
        serviceEP = "https://api.twitter.com" + tweetPath;
        constructOAuthHeader(request, "POST", serviceEP, consumerKey, consumerSecret, accessToken, accessTokenSecret, parameters);

        message:setHeader(request, "User-Agent", "Ballerina-1.0");

        response = http:HTTPConnector.post(tweeterEP, tweetPath, request);

        return response;
    }

    action unReTweet(Twitter t, string tweetId) (message) {

        string tweetPath;
        string serviceEP;
        message request;
        message response;
        map parameters;

        tweetPath = "/1.1/statuses/unretweet/" + tweetId + ".json";
        serviceEP = "https://api.twitter.com" + tweetPath;
        constructOAuthHeader(request, "POST", serviceEP, consumerKey, consumerSecret, accessToken, accessTokenSecret, parameters);

        message:setHeader(request, "User-Agent", "Ballerina-1.0");

        response = http:HTTPConnector.post(tweeterEP, tweetPath, request);

        return response;
    }

    action search(Twitter t, string query) (message) {

        string tweetPath;
        string serviceEP;
        message request;
        message response;
        map parameters;

        tweetPath = "/1.1/search/tweets.json";
        serviceEP = "https://api.twitter.com" + tweetPath;
        parameters["q"] = query;
        tweetPath = tweetPath + "?q=" + uri:encode(query);
        constructOAuthHeader(request, "GET", serviceEP, consumerKey, consumerSecret, accessToken, accessTokenSecret, parameters);

        message:setHeader(request, "User-Agent", "Ballerina-1.0");

        response = http:HTTPConnector.get(tweeterEP, tweetPath, request);

        return response;
    }

    action showStatus(Twitter t, string tweetId) (message) {

        string tweetPath;
        string serviceEP;
        message request;
        message response;
        map parameters;

        tweetPath = "/1.1/statuses/show.json";
        serviceEP = "https://api.twitter.com" + tweetPath;
        parameters["id"] = tweetId;
        tweetPath = tweetPath + "?id=" + tweetId;
        constructOAuthHeader(request, "GET", serviceEP, consumerKey, consumerSecret, accessToken, accessTokenSecret, parameters);

        message:setHeader(request, "User-Agent", "Ballerina-1.0");

        response = http:HTTPConnector.get(tweeterEP, tweetPath, request);

        return response;
    }

    action destroyStatus(Twitter t, string tweetId) (message) {

        string tweetPath;
        string serviceEP;
        message request;
        message response;
        map parameters;

        tweetPath = "/1.1/statuses/destroy/" + tweetId + ".json";
        serviceEP = "https://api.twitter.com" + tweetPath;
        parameters["id"] = tweetId;
        tweetPath = tweetPath + "?id=" + tweetId;
        constructOAuthHeader(request, "POST", serviceEP, consumerKey, consumerSecret, accessToken, accessTokenSecret, parameters);

        message:setHeader(request, "User-Agent", "Ballerina-1.0");

        response = http:HTTPConnector.post(tweeterEP, tweetPath, request);

        return response;
    }

    action getClosestTrendLocations(Twitter t, string lat, string long) (message) {

        string tweetPath;
        string serviceEP;
        message request;
        message response;
        map parameters;

        tweetPath = "/1.1/trends/closest.json";
        serviceEP = "https://api.twitter.com" + tweetPath;
        parameters["lat"] = lat;
        tweetPath = tweetPath + "?lat=" + lat;
        parameters["long"] = long;
        tweetPath = tweetPath + "&long=" + long;
        constructOAuthHeader(request, "GET", serviceEP, consumerKey, consumerSecret, accessToken, accessTokenSecret, parameters);

        message:setHeader(request, "User-Agent", "Ballerina-1.0");

        response = http:HTTPConnector.get(tweeterEP, tweetPath, request);

        return response;
    }

    action getTopTrendsByPlace(Twitter t, string locationId) (message) {

        string tweetPath;
        string serviceEP;
        message request;
        message response;
        map parameters;

        tweetPath = "/1.1/trends/place.json";
        serviceEP = "https://api.twitter.com" + tweetPath;
        parameters["id"] = locationId;
        tweetPath = tweetPath + "?id=" + locationId;
        constructOAuthHeader(request, "GET", serviceEP, consumerKey, consumerSecret, accessToken, accessTokenSecret, parameters);

        message:setHeader(request, "User-Agent", "Ballerina-1.0");

        response = http:HTTPConnector.get(tweeterEP, tweetPath, request);

        return response;
    }
}

function constructOAuthHeader(message request, string httpMethod, string serviceEP, string consumerKey,
                            string consumerSecret, string accessToken, string accessTokenSecret, map parameters) {
    int index;
    string paramStr;
    string baseString;
    string keyStr;
    string signature;
    string oauthHeaderString;
    string timeStamp;
    string nonceString;
    string[] parameterKeys;
    string[] sortedParameters;
    string key;
    string value;

    timeStamp = string:valueOf(system:epochTime());
    nonceString =  util:getRandomString();
    parameters["oauth_consumer_key"] = consumerKey;
    parameters["oauth_consumer_key"] = consumerKey;
    parameters["oauth_nonce"] = nonceString;
    parameters["oauth_signature_method"] = "HMAC-SHA1";
    parameters["oauth_timestamp"] = timeStamp;
    parameters["oauth_token"] = accessToken;
    parameters["oauth_version"] = "1.0";

    parameterKeys = map:keys(parameters);
    sortedParameters = array:sort(parameterKeys);
    while (index < array:length(sortedParameters)){
        key =  sortedParameters[index];
        value = parameters[key];
        paramStr = paramStr + key + "=" + value + "&";
        index = index + 1;
    }
    paramStr = string:subString(paramStr, 0, string:length(paramStr)-1);
    baseString = httpMethod + "&" + uri:encode(serviceEP) + "&" + uri:encode(paramStr);
    keyStr = uri:encode(consumerSecret)+"&"+uri:encode(accessTokenSecret);
    signature = util:getHmac(baseString, keyStr, "SHA1");
    oauthHeaderString = "OAuth oauth_consumer_key=\"" + consumerKey +
                "\",oauth_signature_method=\"HMAC-SHA1\",oauth_timestamp=\"" + timeStamp +
                "\",oauth_nonce=\"" + nonceString + "\",oauth_version=\"1.0\",oauth_signature=\"" +
                uri:encode(signature) + "\",oauth_token=\"" + uri:encode(accessToken) + "\"";

    message:setHeader(request, "Authorization", string:unescape(oauthHeaderString));
}

function main (string[] args) {

    connectors:Twitter twitterConnector = new connectors:Twitter(args[0], args[1], args[2], args[3]);

    message tweetResponse;
    json tweetJSONResponse;

    tweetResponse = connectors:Twitter.getTopTrendsByPlace(twitterConnector, args[4]);

    tweetJSONResponse = message:getJsonPayload(tweetResponse);
    system:println(json:toString(tweetJSONResponse));
}
