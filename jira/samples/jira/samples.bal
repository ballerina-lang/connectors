import org.wso2.ballerina.connectors.jira;

import ballerina.lang.jsons;
import ballerina.lang.system;
import ballerina.lang.messages;
import ballerina.lang.arrays;
import ballerina.net.http;

function main(string[] args){
    jira:ClientConnector jiraConnector = create jira:ClientConnector(args[1], args[2], args[3]);

    message jiraResponse;
    json jiraJSONResponse;
    int argumentLength = args.length;

    if( args[0] == "getIssueInfo") {
        jiraResponse = jira:ClientConnector.getIssueInfo(jiraConnector, args[4], args[5], args[6]);
        jiraJSONResponse = messages:getJsonPayload(jiraResponse);
        system:println(jsons:toString(jiraJSONResponse));
    }

    if( args[0] == "searchJira"  && argumentLength == 5) {
        json payload = (json) args[4];
        jiraResponse = jira:ClientConnector.searchJira(jiraConnector, payload);
        jiraJSONResponse = messages:getJsonPayload(jiraResponse);
        system:println(jsons:toString(jiraJSONResponse));
    }

    if( args[0] == "postComment") {
        json payload = (json) args[6];
        jiraResponse = jira:ClientConnector.postComment(jiraConnector, args[4], args[5], payload);
        jiraJSONResponse = messages:getJsonPayload(jiraResponse);
        system:println(jsons:toString(jiraJSONResponse));
    }

    if( args[0] == "assignIssueToUser") {
        json payload = (json) args[5];
        jiraResponse = jira:ClientConnector.assignIssueToUser(jiraConnector, args[4], payload);
        system:println("Status code : " + http:getStatusCode(jiraResponse));
    }

    if( args[0] == "createBulkIssue") {
        json payload = (json) args[4];
        jiraResponse = jira:ClientConnector.createBulkIssue(jiraConnector, payload);
        jiraJSONResponse = messages:getJsonPayload(jiraResponse);
        system:println(jsons:toString(jiraJSONResponse));
    }
}
