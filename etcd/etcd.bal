package org.wso2.ballerina.connectors;

import ballerina.lang.array;
import ballerina.lang.json;
import ballerina.lang.message;
import ballerina.lang.string;
import ballerina.lang.system;
import ballerina.net.http;
import ballerina.net.uri;
import ballerina.util;

connector etcd (string etcdURL, string username, string password, string apiVersion) {

    // TODO: pass etcdURL to http:HTTPConnector after fix the limitation
    http:HTTPConnector etcdEP = new http:HTTPConnector("http://127.0.0.1:2379");
    //http:HTTPConnector etcdEP = new http:HTTPConnector(etcdURL);
    string encodedBasicAuthHeaderValue;
    string path;
    message request;
    message response;

    action getValue(etcd t, string key) (message) {

	path = "/" + apiVersion + "/keys/" + key;
        response = http:HTTPConnector.get(etcdEP, path, request);
        return response;
    }

    action setKeyValue(etcd t, string key, string value) (message) {

	if ((string:length(username) > 0) && (string:length(password) > 0) ){
	    encodedBasicAuthHeaderValue = util:base64encode(username + ":" + password);
	    message:setHeader(request, "Authorization", "Basic " + encodedBasicAuthHeaderValue);
	}
	message:setStringPayload(request, "value=" + value);
	message:setHeader(request, "Content-Type", "application/x-www-form-urlencoded");
	path = "/" + apiVersion + "/keys/" + key;
	response = http:HTTPConnector.put(etcdEP, path, request);
	return response;
    }

    action updateValue(etcd t, string key, string value) (message) {

	if ((string:length(username) > 0) && (string:length(password) > 0) ){
	    encodedBasicAuthHeaderValue = util:base64encode(username + ":" + password);
	    message:setHeader(request, "Authorization", "Basic " + encodedBasicAuthHeaderValue);
	}
	message:setStringPayload(request, "value=" + value);
	message:setHeader(request, "Content-Type", "application/x-www-form-urlencoded");
	path = "/" + apiVersion + "/keys/" + key;
	response = http:HTTPConnector.put(etcdEP, path, request);
	return response;
    }

    action deleteKey(etcd t, string key) (message) {

	if ((string:length(username) > 0) && (string:length(password) > 0) ){
	    encodedBasicAuthHeaderValue = util:base64encode(username + ":" + password);
	    message:setHeader(request, "Authorization", "Basic " + encodedBasicAuthHeaderValue);
	}
	path = "/" + apiVersion + "/keys/" + key;
	response = http:HTTPConnector.delete(etcdEP, path, request);
	return response;
     }

    action createDir(etcd t, string dir) (message) {

	if ((string:length(username) > 0) && (string:length(password) > 0) ){
	    encodedBasicAuthHeaderValue = util:base64encode(username + ":" + password);
	    message:setHeader(request, "Authorization", "Basic " + encodedBasicAuthHeaderValue);
	}
	path = "/" + apiVersion + "/keys/" + dir;
	response = http:HTTPConnector.put(etcdEP, path, request);
	return response;
    }

    action listDir(etcd t, string dir, string recursive) (message) {

	if ((string:length(username) > 0) && (string:length(password) > 0) ){
	    encodedBasicAuthHeaderValue = util:base64encode(username + ":" + password);
	    message:setHeader(request, "Authorization", "Basic " + encodedBasicAuthHeaderValue);
	}
	path = "/" + apiVersion + "/keys" + dir + "?" + recursive;
        response = http:HTTPConnector.get(etcdEP, path, request);
	return response;
    }
    
    action deleteDir(etcd t, string dir, string recursive) (message) {

	if ((string:length(username) > 0) && (string:length(password) > 0) ){
	    encodedBasicAuthHeaderValue = util:base64encode(username + ":" + password);
	    message:setHeader(request, "Authorization", "Basic " + encodedBasicAuthHeaderValue);
	}
	path = "/" + apiVersion + "/keys" + dir + "?" + recursive;
        response = http:HTTPConnector.delete(etcdEP, path, request);
	return response;
    }
}

function main (string[] args) {

    connectors:etcd etcdConnector = new connectors:etcd("http://127.0.0.1:2379", "root", "test123", "v2");
    message etcdResponse;

    // add key/value to the etcd
    if (args[0] == "setKeyValue"){
	if (array:length(args) > 2){
    	    etcdResponse = connectors:etcd.setKeyValue(etcdConnector,args[1],args[2]);
    	    system:println(message:getStringPayload(etcdResponse));
	}else{
	    system:println("Usage: setKeyValue <key> <value>");
	}
    }
 
    // get value from the etcd for given key
    if (args[0] == "getValue"){
   	if (array:length(args) > 1){ 
    	    etcdResponse = connectors:etcd.getValue(etcdConnector,args[1]);
    	    system:println(message:getStringPayload(etcdResponse));
	}else{
	    system:println("Usage: getValue <key>");
	}
    }
    
    // update a value for given key
    if (args[0] == "updateValue"){
   	if (array:length(args) > 2){ 
    	    etcdResponse = connectors:etcd.updateValue(etcdConnector,args[1],args[2]);
    	    system:println(message:getStringPayload(etcdResponse));
	}else{
	    system:println("Usage: updateValue <key> <value>");
	}
    }

    // delete a key from etcd
    if (args[0] == "deleteKey"){
   	if (array:length(args) > 1){ 
    	    etcdResponse = connectors:etcd.deleteKey(etcdConnector,args[1]);
    	    system:println(message:getStringPayload(etcdResponse));
	}else{
	    system:println("Usage: deleteKey <key>");
	}
    }

    // create directory
    if (args[0] == "createDir"){
	if (array:length(args) > 1){
    	    etcdResponse = connectors:etcd.createDir(etcdConnector,args[1]);
    	    system:println(message:getStringPayload(etcdResponse));
	}else{
	    system:println("Usage: createDir <dir>");
	}
    }
    
    // list directory
    if (args[0] == "listDir"){
	if (array:length(args) > 1){
	    if (array:length(args) < 3 ){
    	        etcdResponse = connectors:etcd.listDir(etcdConnector,args[1],"recursive=false");
	    }else{
    	        etcdResponse = connectors:etcd.listDir(etcdConnector,args[1],args[2]);
	    }
    	    system:println(message:getStringPayload(etcdResponse));
	}else{
	    system:println("Usage: listDir <dir> [recuresive=true]");
	}
    }
    
    // delete directory
    if (args[0] == "deleteDir"){
 	if (array:length(args) > 1){
	    if (array:length(args) < 3 ){
		etcdResponse = connectors:etcd.deleteDir(etcdConnector,args[1],"recursive=false");
	    }else{
		etcdResponse = connectors:etcd.deleteDir(etcdConnector,args[1],args[2]);
	    }
    	    system:println(message:getStringPayload(etcdResponse));
	}else{
	    system:println("Usage: deleteDir <dir> [recuresive=true]");
	}
    }
}
