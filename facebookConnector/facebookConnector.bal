package org.wso2.ballerina.connectors;

import ballerina.lang.json;
import ballerina.lang.message;
import ballerina.lang.string;
import ballerina.lang.system;
import ballerina.net.http;
import ballerina.net.uri;

connector Facebook (string token) {
    http:HTTPConnector facebookEP = new http:HTTPConnector("https://graph.facebook.com");

    action createPost(Facebook t, string id, string msg, string link, string place) (message) {

        string facebookPath;
        string uriParams;
        message request;
        message response;

        facebookPath = "/v2.8/" + id + "/feed";
        if(msg != "null"){
            uriParams = uriParams + "&message=" + uri:encode(msg);
        }
        if(link != "null"){
            uriParams = uriParams + "&link=" + uri:encode(link);
        }
        if(place != "null"){
            uriParams = uriParams + "&place=" + uri:encode(place);
        }
        facebookPath = facebookPath + "?" + string:subString(uriParams, 1, string:length(uriParams));

        message:setHeader(request, "Authorization", "Bearer " + token);

        response = http:HTTPConnector.post(facebookEP, facebookPath, request);

        return response;
    }

    action retrievePost(Facebook t, string postId, string fields) (message) {

        string facebookPath;
        message request;
        message response;

        facebookPath = "/v2.8/" + postId;
        if(fields != "null"){
            facebookPath = facebookPath + "?fields=" + fields;
        }

        message:setHeader(request, "Authorization", "Bearer " + token);

        response = http:HTTPConnector.get(facebookEP, facebookPath, request);

        return response;
    }

    action deletePost(Facebook t, string postId) (message) {

        string facebookPath;
        message request;
        message response;

        facebookPath = "/v2.8/" + postId;

        message:setHeader(request, "Authorization", "Bearer " + token);

        response = http:HTTPConnector.delete(facebookEP, facebookPath, request);

        return response;
    }

    action updatePost(Facebook t, string postId, string message, string tags, string privacy) (message) {

        string facebookPath;
        string uriParams;
        message request;
        message response;

        facebookPath = "/v2.8/" + postId;
        if(message != "null"){
            uriParams = uriParams + "&message=" + uri:encode(message);
        }
        if(tags != "null"){
            uriParams = uriParams + "&tags=" + uri:encode(tags);
        }
        if(privacy != "null"){
            uriParams = uriParams + "&privacy=" + uri:encode(privacy);
        }
        facebookPath = facebookPath + "?" + string:subString(uriParams, 1, string:length(uriParams));

        message:setHeader(request, "Authorization", "Bearer " + token);

        response = http:HTTPConnector.post(facebookEP, facebookPath, request);

        return response;
    }

    action addLikes(Facebook t, string objectId) (message) {

        string facebookPath;
        message request;
        message response;

        facebookPath = "/v2.8/" + objectId + "/likes";

        message:setHeader(request, "Authorization", "Bearer " + token);

        response = http:HTTPConnector.post(facebookEP, facebookPath, request);

        return response;
    }

    action getLikesDetails(Facebook t, string objectId, string fields) (message) {

        string facebookPath;
        message request;
        message response;

        facebookPath = "/v2.8/" + objectId + "/likes";
        if(fields != "null"){
            facebookPath = facebookPath + "?fields=" + fields;
        }

        message:setHeader(request, "Authorization", "Bearer " + token);

        response = http:HTTPConnector.get(facebookEP, facebookPath, request);

        return response;
    }

    action deleteLikes(Facebook t, string objectId) (message) {

        string facebookPath;
        message request;
        message response;

        facebookPath = "/v2.8/" + objectId + "/likes";

        message:setHeader(request, "Authorization", "Bearer " + token);

        response = http:HTTPConnector.delete(facebookEP, facebookPath, request);

        return response;
    }

    action addComments(Facebook t, string objectId, string message, string attachmentId, string attachmentUrl) (message) {

        string facebookPath;
        string uriParams;
        message request;
        message response;

        facebookPath = "/v2.8/" + objectId + "/comments";
        if(message != "null"){
            uriParams = uriParams + "&message=" + message;
        }
        if(attachmentId != "null"){
            uriParams = uriParams + "&attachment_id=" + attachmentId;
        }
        if(attachmentUrl != "null"){
            uriParams = uriParams + "&attachment_url=" + attachmentUrl;
        }
        facebookPath = facebookPath + "?" + string:subString(uriParams, 1, string:length(uriParams));
        message:setHeader(request, "Authorization", "Bearer " + token);

        response = http:HTTPConnector.post(facebookEP, facebookPath, request);

        return response;
    }

    action getComments(Facebook t, string objectId) (message) {

        string facebookPath;
        string uriParams;
        message request;
        message response;

        facebookPath = "/v2.8/" + objectId + "/comments";

        message:setHeader(request, "Authorization", "Bearer " + token);

        response = http:HTTPConnector.get(facebookEP, facebookPath, request);

        return response;
    }

}

function main (string[] args) {
    connectors:Facebook facebookConnector = new connectors:Facebook(args[1]);
    message facebookResponse;
    json facebookJSONResponse;
    if (args[0] == "createPost"){

        facebookResponse = connectors:Facebook.createPost(facebookConnector, args[2], args[3], args[4], args[5]);

        facebookJSONResponse = message:getJsonPayload(facebookResponse);
        system:println(json:toString(facebookJSONResponse));
    }

    if (args[0] == "retrievePost"){

        facebookResponse = connectors:Facebook.retrievePost(facebookConnector, args[2], args[3]);

        facebookJSONResponse = message:getJsonPayload(facebookResponse);
        system:println(json:toString(facebookJSONResponse));
    }

    if (args[0] == "deletePost"){

        facebookResponse = connectors:Facebook.deletePost(facebookConnector, args[2]);

        facebookJSONResponse = message:getJsonPayload(facebookResponse);
        system:println(json:toString(facebookJSONResponse));
    }

    if (args[0] == "updatePost"){

        facebookResponse = connectors:Facebook.updatePost(facebookConnector, args[2], args[3], args[4], args[5]);

        facebookJSONResponse = message:getJsonPayload(facebookResponse);
        system:println(json:toString(facebookJSONResponse));
    }

    if (args[0] == "addLikes"){

        facebookResponse = connectors:Facebook.addLikes(facebookConnector, args[2]);

        facebookJSONResponse = message:getJsonPayload(facebookResponse);
        system:println(json:toString(facebookJSONResponse));
    }

    if (args[0] == "getLikesDetails"){

        facebookResponse = connectors:Facebook.getLikesDetails(facebookConnector, args[2], args[3]);

        facebookJSONResponse = message:getJsonPayload(facebookResponse);
        system:println(json:toString(facebookJSONResponse));
    }

    if (args[0] == "deleteLikes"){

        facebookResponse = connectors:Facebook.deleteLikes(facebookConnector, args[2]);

        facebookJSONResponse = message:getJsonPayload(facebookResponse);
        system:println(json:toString(facebookJSONResponse));
    }

    if (args[0] == "addComments"){

        facebookResponse = connectors:Facebook.addComments(facebookConnector, args[2], args[3], args[4], args[5]);

        facebookJSONResponse = message:getJsonPayload(facebookResponse);
        system:println(json:toString(facebookJSONResponse));
    }

    if (args[0] == "getComments"){

        facebookResponse = connectors:Facebook.getComments(facebookConnector, args[2]);

        facebookJSONResponse = message:getJsonPayload(facebookResponse);
        system:println(json:toString(facebookJSONResponse));
    }

}
