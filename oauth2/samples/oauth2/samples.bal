import org.wso2.ballerina.connectors.oauth2;

import ballerina.lang.jsons;
import ballerina.lang.messages;
import ballerina.lang.system;
import ballerina.net.http;

function main (string[] args) {

    message request = {};
    message userProfileResponse;
    json userProfileJSONResponse;

    http:ClientConnector clientConnector = create http:ClientConnector(args[1]) with oauth2:ClientConnector(args[2], args[3], args[4], args[5], args[6]);

    if (args[0] == "get"){
        userProfileResponse = http:ClientConnector.get(clientConnector, args[7], request);
        userProfileJSONResponse = messages:getJsonPayload(userProfileResponse);
        system:println(jsons:toString(userProfileJSONResponse));
    }
}
