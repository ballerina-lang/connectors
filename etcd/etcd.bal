package org.wso2.ballerina.connectors;

import ballerina.lang.json;
import ballerina.lang.message;
import ballerina.lang.string;
import ballerina.lang.system;
import ballerina.net.http;
import ballerina.net.uri;
import ballerina.util;

connector etcd (string etcdURL) {

    http:HTTPConnector etcdEP = new http:HTTPConnector("http://127.0.0.1:2379");
    //http:HTTPConnector etcdEP = new http:HTTPConnector(etcdURL);

    // get value from the etcd for a given key
    action getValue(etcd t, string key) (message) {

        string path;
        message request;
        message response;

	path = "/v2/keys/" + key;
        response = http:HTTPConnector.get(etcdEP, path, request);
        return response;
    }

    // add key/value to the etcd
    action setKeyValue(etcd t, string key, string value) (message) {
	
	string path;
	message request;
	message response;

	message:setStringPayload(request, "value=" + value);
	message:setHeader(request, "Content-Type", "application/x-www-form-urlencoded");
	path = "/v2/keys/" + key;
	response = http:HTTPConnector.put(etcdEP, path, request);
	return response;
    }

    // update value for a given key
    action updateValue(etcd t, string key, string value) (message) {

	string path;
	message request;
	message response;

	message:setStringPayload(request, "value=" + value);
	message:setHeader(request, "Content-Type", "application/x-www-form-urlencoded");
	path = "/v2/keys/" + key;
	response = http:HTTPConnector.put(etcdEP, path, request);
	return response;
    }

    // delete a key from etcd
    action deleteKey(etcd t, string key) (message) {

	string path;
	message request;
	message response;

	path = "/v2/keys/" + key;
	response = http:HTTPConnector.delete(etcdEP, path, request);
	return response;
     }

    // create a directory
    action createDir(etcd t, string dir) (message) {

	string path;
	message request;
	message response;

	message:setStringPayload(request, "dir=true");
	message:setHeader(request, "Content-Type", "application/x-www-form-urlencoded");
	path = "/v2/keys/" + dir;
	response = http:HTTPConnector.put(etcdEP, path, request);
	return response;
    }

    // listing a directory
    action listDir(etcd t, string dir) (message) {

	string path;
	message request;
	message response;

	path = "/v2/keys" + dir;
        response = http:HTTPConnector.get(etcdEP, path, request);
	return response;
    }


}

function main (string[] args) {

    connectors:etcd etcdConnector = new connectors:etcd("http://127.0.0.1:2379");
    message etcdResponse;
    json etcdJSONResponse;

    // add key/value to the etcd
    if (args[0] == "setKeyValue"){

    	etcdResponse = connectors:etcd.setKeyValue(etcdConnector,args[1],args[2]);
    	etcdJSONResponse = message:getJsonPayload(etcdResponse);
    	//system:println(json:toString(etcdJSONResponse));
    	system:println(message:getStringPayload(etcdResponse));
    }
 
    // get value from the etcd for given key
    if (args[0] == "getValue"){
    
    	etcdResponse = connectors:etcd.getValue(etcdConnector,args[1]);
    	etcdJSONResponse = message:getJsonPayload(etcdResponse);
    	system:println(json:toString(etcdJSONResponse));
    }
    
    // update a value for given key
    if (args[0] == "updateValue"){
    
    	etcdResponse = connectors:etcd.updateValue(etcdConnector,args[1],args[2]);
    	etcdJSONResponse = message:getJsonPayload(etcdResponse);
    	system:println(json:toString(etcdJSONResponse));
    }

    // delete a key from etcd
    if (args[0] == "deleteKey"){
    
    	etcdResponse = connectors:etcd.deleteKey(etcdConnector,args[1]);
    	etcdJSONResponse = message:getJsonPayload(etcdResponse);
    	system:println(json:toString(etcdJSONResponse));
    }

    // create directory
    if (args[0] == "createDir"){
    
    	etcdResponse = connectors:etcd.createDir(etcdConnector,args[1]);
    	etcdJSONResponse = message:getJsonPayload(etcdResponse);
    	system:println(json:toString(etcdJSONResponse));
    }
    
    if (args[0] == "listDir"){
    
    	etcdResponse = connectors:etcd.listDir(etcdConnector,args[1]);
    	etcdJSONResponse = message:getJsonPayload(etcdResponse);
    	system:println(json:toString(etcdJSONResponse));
    }


}
