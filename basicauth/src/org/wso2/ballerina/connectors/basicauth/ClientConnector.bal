package org.wso2.ballerina.connectors.basicauth;

import ballerina.doc;
import ballerina.lang.messages;
import ballerina.net.http;
import ballerina.utils;

@doc:Description{ value : "Basic Auth client connector"}
@doc:Param{ value : "baseUrl: The endpoint base url"}
@doc:Param{ value : "userName: The user name of the account"}
@doc:Param{ value : "password: The password of the account"}
connector ClientConnector<http:ClientConnector httpConnectorEP> (string userName, string password) {

    string encodedBasicAuthValue;

    @doc:Description{ value : "Post with basic authentication"}
    @doc:Param{ value : "clientConnector: The basicauth Connector instance"}
    @doc:Param{ value : "path: The endpoint path"}
    @doc:Param{ value : "request: The request of the method"}
    @doc:Return{ value : "response object"}
    action post(ClientConnector clientConnector, string path, message request) (message) {

        message response;

        encodedBasicAuthValue = constructBasicAuthHeader (request, encodedBasicAuthValue, userName, password);
        response = http:ClientConnector.post(httpConnectorEP, path, request);

        return response;
    }

    @doc:Description { value:"The HEAD action implementation of the HTTP Connector."}
    @doc:Param { value:"c: A connector object" }
    @doc:Param { value:"path: Resource path " }
    @doc:Param { value:"m: A message object" }
    @doc:Return { value:"message: The response message object" }
    action head (ClientConnector c, string path, message request) (message) {
        message response;

        encodedBasicAuthValue = constructBasicAuthHeader (request, encodedBasicAuthValue, userName, password);
        response = http:ClientConnector.head(httpConnectorEP, path, request);

        return response;
    }

    @doc:Description{ value : "Put with basic authentication"}
    @doc:Param{ value : "clientConnector: The basicauth Connector instance"}
    @doc:Param{ value : "path: The endpoint path"}
    @doc:Param{ value : "request: The request of the method"}
    @doc:Return{ value : "response object"}
    action put(ClientConnector clientConnector, string path, message request) (message) {

        message response;

        encodedBasicAuthValue = constructBasicAuthHeader (request, encodedBasicAuthValue, userName, password);
        response = http:ClientConnector.put(httpConnectorEP, path, request);

        return response;
    }

    @doc:Description { value:"Invokes an HTTP call with the specified HTTP verb."}
    @doc:Param { value:"c: A connector object" }
    @doc:Param { value:"httpVerb: HTTP verb value" }
    @doc:Param { value:"path: Resource path " }
    @doc:Param { value:"m: A message object" }
    @doc:Return { value:"message: The response message object" }
    action execute (ClientConnector c, string httpVerb, string path, message request) (message) {
        message response;

        encodedBasicAuthValue = constructBasicAuthHeader (request, encodedBasicAuthValue, userName, password);
        response = http:ClientConnector.execute(httpConnectorEP, httpVerb, path, request);

        return response;
    }

    @doc:Description { value:"The PATCH action implementation of the HTTP Connector."}
    @doc:Param { value:"c: A connector object" }
    @doc:Param { value:"path: Resource path " }
    @doc:Param { value:"m: A message object" }
    @doc:Return { value:"message: The response message object" }
    action patch (ClientConnector c, string path, message request) (message) {
        message response;

        encodedBasicAuthValue = constructBasicAuthHeader (request, encodedBasicAuthValue, userName, password);
        response = http:ClientConnector.patch(httpConnectorEP, path, request);

        return response;
    }

    @doc:Description{ value : "Delete with basic authentication"}
    @doc:Param{ value : "clientConnector: The basicauth Connector instance"}
    @doc:Param{ value : "path: The endpoint path"}
    @doc:Param{ value : "request: The request of the method"}
    @doc:Return{ value : "response object"}
    action delete(ClientConnector clientConnector, string path, message request)(message) {

        message response;

        encodedBasicAuthValue = constructBasicAuthHeader (request, encodedBasicAuthValue, userName, password);
        response = http:ClientConnector.delete(httpConnectorEP, path, request);

        return response;
    }

    @doc:Description{ value : "Get with basic authentication"}
    @doc:Param{ value : "clientConnector: The basicauth Connector instance"}
    @doc:Param{ value : "path: The endpoint path"}
    @doc:Param{ value : "request: The request of the method"}
    @doc:Return{ value : "response object"}
    action get(ClientConnector clientConnector, string path, message request) (message) {

        message response;

        encodedBasicAuthValue = constructBasicAuthHeader (request, encodedBasicAuthValue, userName, password);
        response = http:ClientConnector.get(httpConnectorEP, path, request);

        return response;
    }
}

function constructBasicAuthHeader(message request, string encodedBasicAuthValue, string userName, string password) (string) {

    if (encodedBasicAuthValue == "") {
        encodedBasicAuthValue = utils:base64encode(userName + ":" + password);
    }

    messages:setHeader(request, "Authorization", "Basic "+ encodedBasicAuthValue);

    return encodedBasicAuthValue;
}
