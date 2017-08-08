# OAuth2 Filter Connector

The OAuth2 filter connector allows you to handle the authentication flow with oauth2 authentication.
This can be used to decorate http client connector which use oauth2 authentication.

## get
The get action allows to decorate http get action with oauth2 authentication flow.

###### Properties
  * path -  The path of the endpoint.
  * request -  The request message.

## post
The post action allows to decorate http post action with oauth2 authentication flow.

###### Properties
  * path -  The path of the endpoint.
  * request -  The request message.

## put
The put action allows to decorate http put action with oauth2 authentication flow.

###### Properties
  * path -  The path of the endpoint.
  * request -  The request message.

## delete
The delete action allows to decorate http delete action with oauth2 authentication flow.

###### Properties
  * path -  The path of the endpoint.
  * request -  The request message.

## patch
The patch action allows to decorate http patch action with oauth2 authentication flow.

###### Properties
* path -  The path of the endpoint.
* request -  The request message.

## How to use

###### Prerequisites
1. Use this OAuth2 client connector instead of http client authenticator in other client connectors.
2. Obtain the following parameters:
    * Access Token
    * Client Id
    * Client Secret
    * Refresh Token
    * Refresh Token Endpoint

**IMPORTANT:** This access token can be used to make API requests on your own account's behalf. Do not share your access token with anyone.

###### Invoke the actions
- copy oauth2/sample/oauth2/samples.bal into `<ballerina_home>`/bin$ folder
- Run the following commands to execute the relevant action.
    1. get:
    `bin$ ./ballerina run samples.bal get <baseUrl> <accessToken> <clientId> <clientSecret> <refreshToken> <refreshTokenEP> <path>`
    2. post:
    `bin$ ./ballerina run samples.bal post <baseUrl> <accessToken> <clientId> <clientSecret> <refreshToken> <refreshTokenEP> <path>`
    3. put:
    `bin$ ./ballerina run samples.bal put <baseUrl> <accessToken> <clientId> <clientSecret> <refreshToken> <refreshTokenEP> <path>`
    4. delete:
    `bin$ ./ballerina run samples.bal delete <baseUrl> <accessToken> <clientId> <clientSecret> <refreshToken> <refreshTokenEP> <path>`
    5. patch:
    `bin$ ./ballerina run samples.bal patch <baseUrl> <accessToken> <clientId> <clientSecret> <refreshToken> <refreshTokenEP> <path>`

Note: If you are not passing refresh token in the request, access token won't be refreshed.
