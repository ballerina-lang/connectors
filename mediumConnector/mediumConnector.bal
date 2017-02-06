package org.wso2.ballerina.sample;

import ballerina.lang.xml;
import ballerina.lang.json;
import ballerina.lang.message;
import ballerina.lang.string;
import ballerina.lang.system;
import ballerina.net.http;
import ballerina.net.uri;
import ballerina.util;

connector Medium (string accessToken) {

    http:HTTPConnector mediumEP = new http:HTTPConnector("https://api.medium.com");

    action getProfileInfo(Medium t) (message) {

        string oauthHeader;
        string getProfileInfoPath;
        message request;
        message response;
        getProfileInfoPath = "/v1/me";
        message:setHeader(request, "Authorization", "Bearer " + accessToken);
        response = http:HTTPConnector.get(mediumEP, getProfileInfoPath, request);

        return response;
    }

    action getContributors(Medium t, string publication_id) (message) {

        string oauthHeader;
        string getContributorsPath;
        message request;
        message response;

        getContributorsPath = "/v1/publications/" + publication_id + "/contributors";
        message:setHeader(request, "Authorization", "Bearer " + accessToken);
        response = http:HTTPConnector.get(mediumEP, getContributorsPath, request);

        return response;
    }

    action getPublications(Medium t, string user_id) (message) {

        string oauthHeader;
        string getPublicationsPath;
        message request;
        message response;

        getPublicationsPath = "/v1/users/" + user_id + "/publications";
        message:setHeader(request, "Authorization", "Bearer " + accessToken);
        response = http:HTTPConnector.get(mediumEP, getPublicationsPath, request);

        return response;
    }

    action createProfilePost(Medium t, string user_id, json payload) (message) {

        string oauthHeader;
        string createProfilePostPath;
        message request;
        message response;

        createProfilePostPath = "/v1/users/" + user_id + "/posts";
        message:setHeader(request, "Content-Type", "application/json");
        message:setHeader(request, "Authorization", "Bearer " + accessToken);
        message:setJsonPayload(request, payload);
        response = http:HTTPConnector.post(mediumEP, createProfilePostPath, request);

        return response;
    }

    action createPublicationPost(Medium t, string publication_id, json payload) (message) {

        string oauthHeader;
        string createPublicationPostPath;
        message request;
        message response;

        createPublicationPostPath = "/v1/publications/" + publication_id + "/posts";
        message:setHeader(request, "Content-Type", "application/json");
        message:setHeader(request, "Authorization", "Bearer " + accessToken);
        message:setJsonPayload(request, payload);
        response = http:HTTPConnector.post(mediumEP, createPublicationPostPath, request);

        return response;
    }


}


function printJsonResponse(message mediumResponse) (string) {

    json mediumJSONResponse;
    mediumJSONResponse = message:getJsonPayload(mediumResponse);
    system:println(json:toString(mediumJSONResponse));

}

function runGETSamples(Medium mediumConnector, string publication_id, string user_id) (string) {

    message mediumResponse;

    system:println("---------------");
    system:println("  GET actions");
    system:println("---------------");
    system:println(" ");

    system:println(" ");
    system:println("Get Profile Info");
    mediumResponse = sample:Medium.getProfileInfo(mediumConnector);
    printJsonResponse(mediumResponse);
    system:println(" ");

    system:println("Get Contributors of a Publication");
    mediumResponse = sample:Medium.getContributors(mediumConnector, publication_id);
    printJsonResponse(mediumResponse);
    system:println(" ");

    system:println("Get List of Publications");
    mediumResponse = sample:Medium.getPublications(mediumConnector, user_id);
    printJsonResponse(mediumResponse);
    system:println(" ");

}

function runPOSTSamples(Medium mediumConnector, string publication_id, string author_id) (string) {


    message mediumResponse;
    json full_json_payload;

    full_json_payload = `{title: 'Sample Payload',contentFormat: html,content: '<h1>Sample Payload</h1><p>This is a sample payload</p>',canonicalUrl: 'http://wso2.com',tags: [sample, test],publishStatus: public}`;

    system:println(" ");
    system:println("----------------");
    system:println("  POST actions");
    system:println("----------------");
    system:println(" ");

    system:println("Post in Profile");
    mediumResponse = sample:Medium.createProfilePost(mediumConnector, author_id, full_json_payload);
    printJsonResponse(mediumResponse);
    system:println(" ");

    system:println("Post in publication");
    mediumResponse = sample:Medium.createPublicationPost(mediumConnector, publication_id, full_json_payload);
    printJsonResponse(mediumResponse);
    system:println(" ");

}

function main (string[] args) {

    sample:Medium mediumConnector = new sample:Medium(args[0]);
    string user_id;
    string publication_id;
    user_id = args[1];
    publication_id = args[2];

    runGETSamples(mediumConnector, publication_id, user_id);
    runPOSTSamples(mediumConnector, publication_id, user_id);

}
