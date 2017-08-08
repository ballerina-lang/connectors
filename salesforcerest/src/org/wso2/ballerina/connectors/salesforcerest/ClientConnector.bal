package org.wso2.ballerina.connectors.salesforcerest;

import ballerina.doc;
import ballerina.lang.messages;
import ballerina.net.uri;
import org.wso2.ballerina.connectors.oauth2;
import ballerina.net.http;

@doc:Description{ value : "Salesforcerest client connector"}
@doc:Param{ value : "accessToken: The accessToken of the salesforce connected app to access the salesforce REST API"}
@doc:Param{ value : "clientId: The clientId of the salesforce connected app to access the salesforce REST API"}
@doc:Param{ value : "clientSecret: The clientSecret of the salesforce connected app to access the salesforce REST API"}
@doc:Param{ value : "refreshToken: The refreshToken of the salesforce connected app to access the salesforce REST API"}
@doc:Param{ value : "apiInstance: The api instance of the organization"}
connector ClientConnector(string accessToken, string clientId, string clientSecret, string refreshToken, string apiInstance, string refreshEndpoint) {

    string baseEndpoint = "https://" + apiInstance + ".salesforce.com";
    http:ClientConnector oauth2Connector = create http:ClientConnector(baseEndpoint) with oauth2:ClientConnector(accessToken, clientId,
     clientSecret, refreshToken, refreshEndpoint);

    @doc:Description{ value : "Lists the available objects and their metadata for your organization’s data"}
    @doc:Param{ value : "sf: The salesforcerest connector instance"}
    @doc:Param{ value : "apiVersion: The api version to send request to"}
    @doc:Return{ value : "response message"}
    action describeGlobal(ClientConnector sf, string apiVersion) (message) {
        string httpMethod;
        string requestURI;
        message requestMsg = {};
        message response = {};
        requestURI = "/services/data/" + apiVersion + "/sobjects";
        response = http:ClientConnector.get(oauth2Connector, requestURI, requestMsg);
        return response;
    }

    @doc:Description{ value : "Completely describes the individual metadata at all levels for the specified object"}
    @doc:Param{ value : "sf: The salesforcerest connector instance"}
    @doc:Param{ value : "apiVersion: The api version to send request to"}
    @doc:Param{ value : "sobjectName: The relevant sobject name"}
    @doc:Return{ value : "response message"}
    action sObjectDescribe(ClientConnector sf, string sobjectName, string apiVersion) (message) {
        string httpMethod;
        string requestURI;
        message requestMsg = {};
        message response = {};
        requestURI = "/services/data/" + apiVersion + "/sobjects/" + sobjectName + "/describe/";
        response = http:ClientConnector.get(oauth2Connector, requestURI, requestMsg);
        return response;
    }

    @doc:Description{ value : "Lists summary information about each REST API version currently available"}
    @doc:Param{ value : "sf: The salesforcerest connector instance"}
    @doc:Return{ value : "response message"}
    action listAvailableApiVersion(ClientConnector sf) (message) {
        string httpMethod;
        string requestURI;
        message requestMsg = {};
        message response = {};
        requestURI = "/services/data";
        response = http:ClientConnector.get(oauth2Connector, requestURI, requestMsg);
        return response;
    }

    @doc:Description{ value : "Lists limits information for your organization"}
    @doc:Param{ value : "sf: The salesforcerest connector instance"}
    @doc:Param{ value : "apiVersion: The api version to send request to"}
    @doc:Return{ value : "response message"}
    action listOrganizationLimits(ClientConnector sf, string apiVersion) (message) {
        string httpMethod;
        string requestURI;
        message requestMsg = {};
        message response = {};
        requestURI = "/services/data/" + apiVersion + "/limits";
        response = http:ClientConnector.get(oauth2Connector, requestURI, requestMsg);
        return response;
    }

    @doc:Description{ value : "Lists the resources available for the specified API version"}
    @doc:Param{ value : "sf: The salesforcerest connector instance"}
    @doc:Param{ value : "requestingApiVersion: The api version to get resources"}
    @doc:Return{ value : "response message"}
    action listResourcesByApiVersion(ClientConnector sf, string requestingApiVersion) (message) {
        string httpMethod;
        string requestURI;
        message requestMsg = {};
        message response = {};
        requestURI = "/services/data/" + requestingApiVersion;
        response = http:ClientConnector.get(oauth2Connector, requestURI, requestMsg);
        return response;
    }

    @doc:Description{ value : "Describes the individual metadata for the specified object"}
    @doc:Param{ value : "sf: The salesforcerest connector instance"}
    @doc:Param{ value : "apiVersion: The api version to send request to"}
    @doc:Param{ value : "sobjectName: The relevant sobject name"}
    @doc:Return{ value : "response message"}
    action sObjectBasicInfo(ClientConnector sf, string sobjectName, string apiVersion) (message) {
        string httpMethod;
        string requestURI;
        message requestMsg = {};
        message response = {};
        requestURI = "/services/data/" + apiVersion + "/sobjects/" + sobjectName;
        response = http:ClientConnector.get(oauth2Connector, requestURI, requestMsg);
        return response;
    }

    @doc:Description{ value : "Retrieves the list of individual records that have been deleted within the given timespan
     for the specified object"}
    @doc:Param{ value : "sf: The salesforcerest connector instance"}
    @doc:Param{ value : "apiVersion: The api version to send request to"}
    @doc:Param{ value : "sobjectName: The relevant sobject name"}
    @doc:Param{ value : "startTime: The start time of the time span"}
    @doc:Param{ value : "endTime: The end time of the time span"}
    @doc:Return{ value : "response message"}
    action sObjectGetDeleted(ClientConnector sf, string apiVersion, string sobjectName, string startTime, string endTime) (message)
     {
        string httpMethod;
        string requestURI;
        message requestMsg = {};
        message response = {};
        requestURI = "/services/data/" + apiVersion + "/sobjects/" + sobjectName + "/deleted/?start=" + uri:encode(startTime)
        + "&end=" + uri:encode(endTime);
        response = http:ClientConnector.get(oauth2Connector, requestURI, requestMsg);
        return response;
    }

    @doc:Description{ value : "Retrieves the list of individual records that have been updated (added or changed)
     within the given timespan for the specified object"}
    @doc:Param{ value : "sf: The salesforcerest connector instance"}
    @doc:Param{ value : "apiVersion: The api version to send request to"}
    @doc:Param{ value : "sobjectName: The relevant sobject name"}
    @doc:Param{ value : "startTime: The start time of the time span"}
    @doc:Param{ value : "endTime: The end time of the time span"}
    @doc:Return{ value : "response message"}
    action sObjectGetUpdated(ClientConnector sf, string apiVersion, string sobjectName, string startTime, string endTime) (message)
     {
        string httpMethod;
        string requestURI;
        message requestMsg = {};
        message response = {};
        requestURI = "/services/data/" + apiVersion + "/sobjects/" + sobjectName + "/updated/?start=" + uri:encode(startTime)
        + "&end=" + uri:encode(endTime);
        response = http:ClientConnector.get(oauth2Connector, requestURI, requestMsg);
        return response;
    }

    @doc:Description{ value : "Query for actions displayed in the UI, given a user, a context, device format, and a record ID"}
    @doc:Param{ value : "sf: The salesforcerest connector instance"}
    @doc:Param{ value : "apiVersion: The api version to send request to"}
    @doc:Return{ value : "response message"}
    action sObjectPlatformAction(ClientConnector sf, string apiVersion) (message) {
        string httpMethod;
        string requestURI;
        message requestMsg = {};
        message response = {};
        requestURI = "/services/data/" + apiVersion + "/sobjects/PlatformAction";
        response = http:ClientConnector.get(oauth2Connector, requestURI, requestMsg);
        return response;
    }

    @doc:Description{ value : "Accesses records based on the specified object ID"}
    @doc:Param{ value : "sf: The salesforcerest connector instance"}
    @doc:Param{ value : "apiVersion: The api version to send request to"}
    @doc:Param{ value : "sobjectName: The relevant sobject name"}
    @doc:Return{ value : "response message"}
    action sObjectRows(ClientConnector sf, string apiVersion, string sobjectName, string rowId) (message) {
        string httpMethod;
        string requestURI;
        message requestMsg = {};
        message response = {};
        requestURI = "/services/data/" + apiVersion + "/sobjects/" + sobjectName + "/" + rowId;
        response = http:ClientConnector.get(oauth2Connector, requestURI, requestMsg);
        return response;
    }

    @doc:Description{ value : "Creates new records or updates existing records (upserts records) based on the value of a
     specified external ID field"}
    @doc:Param{ value : "sf: The salesforcerest connector instance"}
    @doc:Param{ value : "apiVersion: The api version to send request to"}
    @doc:Param{ value : "sobjectName: The relevant sobject name"}
    @doc:Param{ value : "fieldId: The external field id"}
    @doc:Param{ value : "fieldValue: The external field value"}
    @doc:Return{ value : "response message"}
    action sObjectRowsByExternalId(ClientConnector sf, string apiVersion, string sobjectName, string fieldId, string fieldValue) (message)
     {
        string httpMethod;
        string requestURI;
        message requestMsg = {};
        message response = {};
        requestURI = "/services/data/" + apiVersion + "/sobjects/" + sobjectName + "/" + fieldId + "/" + fieldValue;
        response = http:ClientConnector.get(oauth2Connector, requestURI, requestMsg);
        return response;
    }

    @doc:Description{ value : "Get feedback on how Salesforce will execute your list view"}
    @doc:Param{ value : "sf: The salesforcerest connector instance"}
    @doc:Param{ value : "apiVersion: The api version to send request to"}
    @doc:Param{ value : "listViewId: The id of the listview to get the feedback from"}
    @doc:Return{ value : "response message"}
    action listviewQueryPerformanceFeedback(ClientConnector sf, string apiVersion, string listViewId) (message) {
        string httpMethod;
        string requestURI;
        message requestMsg = {};
        message response = {};
        requestURI = "/services/data/" + apiVersion + "/query/?explain=" + listViewId;
        response = http:ClientConnector.get(oauth2Connector, requestURI, requestMsg);
        return response;
    }

    @doc:Description{ value : "Executes the specified SOQL query"}
    @doc:Param{ value : "sf: The salesforcerest connector instance"}
    @doc:Param{ value : "apiVersion: The api version to send request to"}
    @doc:Param{ value : "queryString: The request SOQL query"}
    @doc:Return{ value : "response message"}
    action query(ClientConnector sf, string apiVersion, string queryString) (message) {
        string httpMethod;
        string requestURI;
        message requestMsg = {};
        message response = {};
        requestURI = "/services/data/" + apiVersion + "/query/?q=" + queryString;
        response = http:ClientConnector.get(oauth2Connector, requestURI, requestMsg);
        return response;
    }

    @doc:Description{ value : "QueryAll will return records that have been deleted because of a merge or delete, archived Task
     and Event records"}
    @doc:Param{ value : "sf: The salesforcerest connector instance"}
    @doc:Param{ value : "apiVersion: The api version to send request to"}
    @doc:Param{ value : "queryString: The request SOQL query"}
    @doc:Return{ value : "response message"}
    action queryAll(ClientConnector sf, string apiVersion, string queryString) (message) {
        string httpMethod;
        string requestURI;
        message requestMsg = {};
        message response = {};
        requestURI = "/services/data/" + apiVersion + "/queryAll/?q=" + queryString;
        response = http:ClientConnector.get(oauth2Connector, requestURI, requestMsg);
        return response;
    }
    @doc:Description{ value : "If the queryAll results are too large, retrieve the next batch of results"}
    @doc:Param{ value : "sf: The salesforcerest connector instance"}
    @doc:Param{ value : "apiVersion: The api version to send request to"}
    @doc:Param{ value : "nextRecordsUrl: The url sent with first batch of queryAll results to get the next batch"}
    @doc:Return{ value : "response message"}
    action queryAllMore(ClientConnector sf, string apiVersion, string nextRecordsUrl) (message) {
        string httpMethod;
        string requestURI;
        message requestMsg = {};
        message response = {};
        requestURI = "/services/data/" + apiVersion + "/queryAll/" + nextRecordsUrl;
        response = http:ClientConnector.get(oauth2Connector, requestURI, requestMsg);
        return response;
    }

    @doc:Description{ value : "If the query results are too large, retrieve the next batch of results"}
    @doc:Param{ value : "sf: The salesforcerest connector instance"}
    @doc:Param{ value : "apiVersion: The api version to send request to"}
    @doc:Param{ value : "nextRecordsUrl: The url sent with first batch of query results to get the next batch"}
    @doc:Return{ value : "response message"}
    action queryMore(ClientConnector sf, string apiVersion, string nextRecordsUrl) (message) {
        string httpMethod;
        string requestURI;
        message requestMsg = {};
        message response = {};
        requestURI = "/services/data/" + apiVersion + "/query/" + nextRecordsUrl;
        response = http:ClientConnector.get(oauth2Connector, requestURI, requestMsg);
        return response;
    }

    @doc:Description{ value : "Get feedback on how Salesforce will execute your query"}
    @doc:Param{ value : "sf: The salesforcerest connector instance"}
    @doc:Param{ value : "apiVersion: The api version to send request to"}
    @doc:Param{ value : "queryString: The request SOQL query"}
    @doc:Return{ value : "response message"}
    action queryPerformanceFeedback(ClientConnector sf, string apiVersion, string queryString) (message) {
        string httpMethod;
        string requestURI;
        message requestMsg = {};
        message response = {};
        requestURI = "/services/data/" + apiVersion + "/query/?explain=" + queryString;
        response = http:ClientConnector.get(oauth2Connector, requestURI, requestMsg);
        return response;
    }

    @doc:Description{ value : "Creates new records"}
    @doc:Param{ value : "sf: The salesforcerest connector instance"}
    @doc:Param{ value : "apiVersion: The api version to send request to"}
    @doc:Param{ value : "sobjectName: The relevant sobject name"}
    @doc:Param{ value : "payload: json payload containing record data"}
    @doc:Return{ value : "response message"}
    action createRecord(ClientConnector sf, string apiVersion, string sobjectName, json payload) (message) {
        string httpMethod;
        string requestURI;
        message requestMsg = {};
        message response = {};
        requestURI = "/services/data/" + apiVersion + "/sobjects/" + sobjectName;
	    messages:setJsonPayload(requestMsg, payload);
        response = http:ClientConnector.post(oauth2Connector, requestURI, requestMsg);
        return response;
    }

    @doc:Description{ value : "Create multiple records"}
    @doc:Param{ value : "sf: The salesforcerest connector instance"}
    @doc:Param{ value : "apiVersion: The api version to send request to"}
    @doc:Param{ value : "sobjectName: The relevant sobject name"}
    @doc:Param{ value : "payload: json payload containing record data"}
    @doc:Return{ value : "response message"}
    action createMultipleRecords(ClientConnector sf, string apiVersion, string sobjectName, json payload) (message) {
        string httpMethod;
        string requestURI;
        message requestMsg = {};
        message response = {};
        requestURI = "/services/data/" + apiVersion + "/composite/tree/" + sobjectName;
	    messages:setJsonPayload(requestMsg, payload);
        response = http:ClientConnector.post(oauth2Connector, requestURI, requestMsg);
        return response;
    }

    @doc:Description{ value : "Deletes existing record"}
    @doc:Param{ value : "sf: The salesforcerest connector instance"}
    @doc:Param{ value : "apiVersion: The api version to send request to"}
    @doc:Param{ value : "sobjectName: The relevant sobject name"}
    @doc:Return{ value : "response message"}
    action delete(ClientConnector sf, string apiVersion, string sobjectName, string deleteId) (message) {
        string httpMethod;
        string requestURI;
        message requestMsg = {};
        message response = {};
        requestURI = "/services/data/" + apiVersion + "/sobjects/" + sobjectName + "/" + deleteId;
        response = http:ClientConnector.delete(oauth2Connector, requestURI, requestMsg);
        return response;
    }

    @doc:Description{ value : "Retrieve field values from a record"}
    @doc:Param{ value : "sf: The salesforcerest connector instance"}
    @doc:Param{ value : "apiVersion: The api version to send request to"}
    @doc:Param{ value : "sobjectName: The relevant sobject name"}
    @doc:Param{ value : "rowId: The row ID of the required record"}
    @doc:Param{ value : "fields: The comma separated set of required fields"}
    @doc:Return{ value : "response message"}
    action retrieveFieldValues(ClientConnector sf, string apiVersion, string sobjectName, string rowId, string fields) (message)
     {
        string httpMethod;
        string requestURI;
        message requestMsg = {};
        message response = {};
        requestURI = "/services/data/" + apiVersion + "/sobjects/" + sobjectName + "/" + rowId + "?fields=" + fields;
        response = http:ClientConnector.get(oauth2Connector, requestURI, requestMsg);
        return response;
    }

    @doc:Description{ value : "Retrieve field values from an external record"}
    @doc:Param{ value : "sf: The salesforcerest connector instance"}
    @doc:Param{ value : "apiVersion: The api version to send request to"}
    @doc:Param{ value : "sobjectName: The relevant sobject name"}
    @doc:Param{ value : "rowId: The row ID of the required record"}
    @doc:Param{ value : "fields: The comma separated set of required fields"}
    @doc:Return{ value : "response message"}
    action retrieveFieldValuesFromExternalObject(ClientConnector sf, string apiVersion, string sobjectName, string rowId, string fields)
     (message) {
        string httpMethod;
        string requestURI;
        message requestMsg = {};
        message response = {};
        requestURI = "/services/data/" + apiVersion + "/sobjects/" + sobjectName + "/" + rowId + "?fields=" + fields;
        response = http:ClientConnector.get(oauth2Connector, requestURI, requestMsg);
        return response;
    }

    @doc:Description{ value : "Retrieve field values from an external record with external ID"}
    @doc:Param{ value : "sf: The salesforcerest connector instance"}
    @doc:Param{ value : "apiVersion: The api version to send request to"}
    @doc:Param{ value : "sobjectName: The relevant sobject name"}
    @doc:Param{ value : "externalId: The row ID of the required external record"}
    @doc:Param{ value : "fields: The comma separated set of required fields"}
    @doc:Return{ value : "response message"}
    action retrieveStandardFieldValuesFromExternalObjectWithExternalId(ClientConnector sf, string apiVersion, string sobjectName,
     string externalId, string fields) (message) {
        string httpMethod;
        string requestURI;
        message requestMsg = {};
        message response = {};
        requestURI = "/services/data/" + apiVersion + "/sobjects/" + sobjectName + "/" + externalId + "?fields=" + fields;
        response = http:ClientConnector.get(oauth2Connector, requestURI, requestMsg);
        return response;
    }

    @doc:Description{ value : "Updates an existing record"}
    @doc:Param{ value : "sf: The salesforcerest connector instance"}
    @doc:Param{ value : "apiVersion: The api version to send request to"}
    @doc:Param{ value : "sobjectName: The relevant sobject name"}
    @doc:Param{ value : "payload: json payload containing record data"}
    @doc:Return{ value : "response message"}
    action update(ClientConnector sf, string apiVersion, string sobjectName, string recordId, json payload) (message) {
        string httpMethod;
        string requestURI;
        message requestMsg = {};
        message response = {};
        requestURI = "/services/data/" + apiVersion + "/sobjects/" + sobjectName + "/" + recordId;
	    messages:setJsonPayload(requestMsg, payload);
        response = http:ClientConnector.patch(oauth2Connector, requestURI, requestMsg);
        return response;
    }

    @doc:Description{ value : "If record exists, update it else inserts it"}
    @doc:Param{ value : "sf: The salesforcerest connector instance"}
    @doc:Param{ value : "apiVersion: The api version to send request to"}
    @doc:Param{ value : "sobjectName: The relevant sobject name"}
    @doc:Param{ value : "externalField: The external field id"}
    @doc:Param{ value : "fieldValueId: The external field value"}
    @doc:Param{ value : "payload: json payload containing record data"}
    @doc:Return{ value : "response message"}
    action upsert(ClientConnector sf, string apiVersion, string sobject, string externalField, string fieldValueId, json payload)
     (message) {
        string httpMethod;
        string requestURI;
        message requestMsg = {};
        message response = {};
        requestURI = "/services/data/" + apiVersion + "/sobjects/" + sobject + "/" + externalField + "/" + fieldValueId;
	    messages:setJsonPayload(requestMsg, payload);
        response = http:ClientConnector.patch(oauth2Connector, requestURI, requestMsg);
        return response;
    }
}
