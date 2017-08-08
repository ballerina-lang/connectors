package org.wso2.ballerina.connectors.oauth2;

import ballerina.doc;
import ballerina.lang.jsons;
import ballerina.lang.messages;
import ballerina.net.http;

@doc:Description{ value : "OAuth2 client connector"}
@doc:Param{ value : "baseUrl: The endpoint base url"}
@doc:Param{ value : "accessToken: The access token of the account"}
@doc:Param{ value : "clientId: The client Id of the account"}
@doc:Param{ value : "clientSecret: The client secret of the account"}
@doc:Param{ value : "refreshToken: The refresh token of the account"}
@doc:Param{ value : "refreshTokenEP: The refresh token endpoint url"}
connector ClientConnector<http:ClientConnector httpConnectorEP> (string accessToken, string clientId, string clientSecret,
                                 string refreshToken, string refreshTokenEP) {

    string accessTokenValue;

    @doc:Description{ value : "Post with OAuth2 authentication"}
    @doc:Param{ value : "clientConnector: The oauth2 Connector instance"}
    @doc:Param{ value : "path: The endpoint path"}
    @doc:Param{ value : "request: The request of the method"}
    @doc:Return{ value : "response object"}
    action post (ClientConnector clientConnector, string path, message request) (message) {

        message response;

        accessTokenValue = constructAuthHeader (request, accessTokenValue, accessToken);
        response = http:ClientConnector.post(httpConnectorEP, path, request);

        if ((http:getStatusCode(response) == 401) && (refreshToken != "" || refreshToken != "null")) {
             accessTokenValue = getAccessTokenFromRefreshToken(request, accessToken, clientId, clientSecret, refreshToken,
                                                          refreshTokenEP);
             response = http:ClientConnector.post(httpConnectorEP, path, request);
        }

        return response;
    }

    @doc:Description { value:"The HEAD action implementation of the HTTP Connector."}
    @doc:Param { value:"c: A connector object" }
    @doc:Param { value:"path: Resource path " }
    @doc:Param { value:"m: A message object" }
    @doc:Return { value:"message: The response message object" }
    action head (ClientConnector c, string path, message request) (message) {
        message response;

        accessTokenValue = constructAuthHeader (request, accessTokenValue, accessToken);
        response = http:ClientConnector.patch(httpConnectorEP, path, request);

        if ((http:getStatusCode(response) == 401) && (refreshToken != "" || refreshToken != "null")) {
            accessTokenValue = getAccessTokenFromRefreshToken(request, accessToken, clientId, clientSecret, refreshToken,
                                                              refreshTokenEP);
            response = http:ClientConnector.head(httpConnectorEP, path, request);
        }

        return response;
    }

    @doc:Description{ value : "Put with OAuth2 authentication"}
    @doc:Param{ value : "clientConnector: The oauth2 Connector instance"}
    @doc:Param{ value : "path: The endpoint path"}
    @doc:Param{ value : "request: The request of the method"}
    @doc:Return{ value : "response object"}
    action put (ClientConnector clientConnector, string path, message request) (message) {

        message response;

        accessTokenValue = constructAuthHeader (request, accessTokenValue, accessToken);
        response = http:ClientConnector.put(httpConnectorEP, path, request);

        if ((http:getStatusCode(response) == 401) && (refreshToken != "" || refreshToken != "null")) {
            accessTokenValue = getAccessTokenFromRefreshToken(request, accessToken, clientId, clientSecret, refreshToken,
                                                          refreshTokenEP);
            response = http:ClientConnector.put(httpConnectorEP, path, request);
        }

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

        accessTokenValue = constructAuthHeader (request, accessTokenValue, accessToken);
        response = http:ClientConnector.patch(httpConnectorEP, path, request);

        if ((http:getStatusCode(response) == 401) && (refreshToken != "" || refreshToken != "null")) {
            accessTokenValue = getAccessTokenFromRefreshToken(request, accessToken, clientId, clientSecret, refreshToken,
                                                              refreshTokenEP);
            response = http:ClientConnector.execute(httpConnectorEP, httpVerb, path, request);
        }

        return response;
    }

    @doc:Description{ value : "Patch with OAuth2 authentication"}
    @doc:Param{ value : "clientConnector: The oauth2 Connector instance"}
    @doc:Param{ value : "path: The endpoint path"}
    @doc:Param{ value : "request: The request of the method"}
    @doc:Return{ value : "response object"}
    action patch (ClientConnector clientConnector, string path, message request) (message) {

        message response;

        accessTokenValue = constructAuthHeader (request, accessTokenValue, accessToken);
        response = http:ClientConnector.patch(httpConnectorEP, path, request);

        if ((http:getStatusCode(response) == 401) && (refreshToken != "" || refreshToken != "null")) {
            accessTokenValue = getAccessTokenFromRefreshToken(request, accessToken, clientId, clientSecret, refreshToken,
                                                              refreshTokenEP);
            response = http:ClientConnector.patch(httpConnectorEP, path, request);
        }

        return response;
    }

    @doc:Description{ value : "Delete with OAuth2 authentication"}
    @doc:Param{ value : "clientConnector: The oauth2 Connector instance"}
    @doc:Param{ value : "path: The endpoint path"}
    @doc:Param{ value : "request: The request of the method"}
    @doc:Return{ value : "response object"}
    action delete (ClientConnector clientConnector, string path, message request) (message) {

        message response;

        accessTokenValue = constructAuthHeader (request, accessTokenValue, accessToken);
        response = http:ClientConnector.delete(httpConnectorEP, path, request);

        if ((http:getStatusCode(response) == 401) && (refreshToken != "" || refreshToken != "null")) {
            accessTokenValue = getAccessTokenFromRefreshToken(request, accessToken, clientId, clientSecret, refreshToken,
                                                          refreshTokenEP);
            response = http:ClientConnector.delete(httpConnectorEP, path, request);
        }

        return response;
    }

    @doc:Description{ value : "Get with OAuth2 authentication"}
    @doc:Param{ value : "clientConnector: The oauth2 Connector instance"}
    @doc:Param{ value : "path: The endpoint path"}
    @doc:Param{ value : "request: The request of the method"}
    @doc:Return{ value : "response object"}
    action get (ClientConnector clientConnector, string path, message request) (message) {

        message response;

        accessTokenValue = constructAuthHeader (request, accessTokenValue, accessToken);
        response = http:ClientConnector.get(httpConnectorEP, path, request);

        if ((http:getStatusCode(response) == 401) && (refreshToken != "" || refreshToken != "null")) {
            accessTokenValue = getAccessTokenFromRefreshToken(request, accessToken, clientId, clientSecret, refreshToken,
                                                              refreshTokenEP);
            response = http:ClientConnector.get(httpConnectorEP, path, request);
        }

        return response;
    }
}

function constructAuthHeader (message request, string accessTokenValue, string accessToken) (string) {

    if (accessTokenValue == "") {
        accessTokenValue = accessToken;
    }

    messages:setHeader(request, "Authorization", "Bearer " + accessTokenValue);

    return accessTokenValue;
}

function getAccessTokenFromRefreshToken (message request, string accessToken, string clientId, string clientSecret,
                                         string refreshToken, string refreshTokenEP) (string) {

    http:ClientConnector refreshTokenHTTPEP = create http:ClientConnector("");
    message refreshTokenRequest = {};
    message refreshTokenResponse;
    string accessTokenFromRefreshTokenReq;
    json accessTokenFromRefreshTokenJSONResponse;

    accessTokenFromRefreshTokenReq = refreshTokenEP + "?refresh_token=" + refreshToken
                                     + "&grant_type=refresh_token&client_secret="
                                     + clientSecret + "&client_id=" + clientId;

    http:setContentLength(refreshTokenRequest, 0);
    refreshTokenResponse = http:ClientConnector.post(refreshTokenHTTPEP, accessTokenFromRefreshTokenReq,
                                                   refreshTokenRequest);
    accessTokenFromRefreshTokenJSONResponse = messages:getJsonPayload(refreshTokenResponse);
    accessToken = jsons:toString(accessTokenFromRefreshTokenJSONResponse.access_token);
    messages:setHeader(request, "Authorization", "Bearer " + accessToken);
    return accessToken;

}
