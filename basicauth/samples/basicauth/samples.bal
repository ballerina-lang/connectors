import org.wso2.ballerina.connectors.basicauth;

import ballerina.lang.jsons;
import ballerina.lang.messages;
import ballerina.lang.system;
import ballerina.net.http;

function main (string[] args) {

    message request = {};
    message basicAuthResponse;
    json basicJSONResponse;

    json sampleJsonRequest = `{"ticket_field":{ "type": "text", "title": "SampleTicket"}}`;

    http:ClientConnector basicAuthConnector = create http:ClientConnector(args[1]) with basicauth:ClientConnector(args[2], args[3]);

    if (args[0] == "get"){
        basicAuthResponse = http:ClientConnector.get(basicAuthConnector, args[4], request);
        basicJSONResponse = messages:getJsonPayload(basicAuthResponse);
        system:println(jsons:toString(basicJSONResponse));
    }

    if (args[0] == "post"){
        messages:setHeader(request, "Content-Type", "application/json");
        messages:setJsonPayload(request, sampleJsonRequest);
        basicAuthResponse = http:ClientConnector.post(basicAuthConnector, args[4], request);
        basicJSONResponse = messages:getJsonPayload(basicAuthResponse);
        system:println(jsons:toString(basicJSONResponse));
    }
}