package googlespreadsheet;

import ballerina.net.http;
import ballerina.lang.messages;
import ballerina.lang.jsons;
import ballerina.lang.system;
import org.wso2.ballerina.connectors.googlespreadsheet;

@http:BasePath {value:"/googleSpreadSheetService"}
service googleSpreadSheetService {

    @http:POST {}
    @http:Path {value:"/getSheetMetaData"}
    resource createSpreadSheet (message m) {
        json payload = messages:getJsonPayload(m);
        string accessToken = jsons:getString(payload, "$.accessToken");
        string refreshToken = jsons:getString(payload, "$.refreshToken");
        string clientId = jsons:getString(payload, "$.clientId");
        string clientSecret = jsons:getString(payload, "$.clientSecret");
        string spreadSheetId = jsons:getString(payload, "$.spreadSheetId");
        string includeGridInfo = jsons:getString(payload, "$.includeGridInfo");
        string range = jsons:getString(payload, "$.range");
        message googlespreadsheetResponse;
        json googlespreadsheetJSONResponse;
        string fields;

        googlespreadsheet:ClientConnector googlespreadsheetConnector = create googlespreadsheet:ClientConnector(accessToken,refreshToken,clientId,clientSecret);
        googlespreadsheetResponse = googlespreadsheet:ClientConnector.getSheetMetaData(googlespreadsheetConnector,spreadSheetId, includeGridInfo,fields,range);
        googlespreadsheetJSONResponse = messages:getJsonPayload(googlespreadsheetResponse);
        system:println(jsons:toString(googlespreadsheetJSONResponse));
        reply googlespreadsheetResponse;

    }

    @http:POST {}
    @http:Path {value:"/createSpreadSheet"}
    resource createNewSpreadSheet (message m) {
        map detailsFromRequest = {};
        json payload = messages:getJsonPayload(m);
        string accessToken= jsons:getString(payload,"$.accessToken");
        string refreshToken = jsons:getString(payload,"$.refreshToken");
        string clientId = jsons:getString(payload,"$.clientId");
        string clientSecret= jsons:getString(payload,"$.clientSecret");
        json payloadToSend = jsons:getJson(payload,"$.payloadToSend");
        message googlespreadsheetResponse;
        json googlespreadsheetJSONResponse;
        string testPayload = jsons:toString(payload);
        string spreadsheetId;

        system:println(testPayload);
        googlespreadsheet:ClientConnector googlespreadsheetConnector = create googlespreadsheet:ClientConnector(accessToken,refreshToken,clientId,clientSecret);
        googlespreadsheetResponse = googlespreadsheet:ClientConnector.createSpreadsheet(googlespreadsheetConnector,payloadToSend, spreadsheetId);
        googlespreadsheetJSONResponse = messages:getJsonPayload(googlespreadsheetResponse);
        system:println(jsons:toString(googlespreadsheetJSONResponse));
        reply googlespreadsheetResponse;

    }

    @http:POST {}
    @http:Path {value:"/copyTo"}
    resource copySheet (message m) {
        map detailsFromRequest = {};
        json payload = messages:getJsonPayload(m);
        string accessToken= jsons:getString(payload,"$.accessToken");
        string refreshToken = jsons:getString(payload,"$.refreshToken");
        string clientId = jsons:getString(payload,"$.clientId");
        string clientSecret= jsons:getString(payload,"$.clientSecret");
        string sourceSpreadSheetId = jsons:getString(payload, "$.sourceSpreadSheetId");
        string sourceSheetId = jsons:getString(payload, "$.sourceSheetId");
        json payloadToSend = jsons:getJson(payload,"$.payloadToSend");
        message googlespreadsheetResponse;
        json googlespreadsheetJSONResponse;
        string copyField;

        googlespreadsheet:ClientConnector googlespreadsheetConnector = create googlespreadsheet:ClientConnector(accessToken,refreshToken,clientId,clientSecret);
        googlespreadsheetResponse = googlespreadsheet:ClientConnector.copyTo(googlespreadsheetConnector,sourceSpreadSheetId, sourceSheetId, payloadToSend, copyField);
        googlespreadsheetJSONResponse = messages:getJsonPayload(googlespreadsheetResponse);
        system:println(jsons:toString(googlespreadsheetJSONResponse));
        reply googlespreadsheetResponse;

    }

    @http:POST {}
    @http:Path {value:"/getCellData"}
    resource getDataOfCells (message m) {
        map detailsFromRequest = {};
        json payload = messages:getJsonPayload(m);
        string accessToken= jsons:getString(payload,"$.accessToken");
        string refreshToken = jsons:getString(payload,"$.refreshToken");
        string clientId = jsons:getString(payload,"$.clientId");
        string clientSecret= jsons:getString(payload,"$.clientSecret");
        string spreadSheetId = jsons:getString(payload, "$.spreadSheetId");
        string range = jsons:getString(payload, "$.range");
        string dateTimeRenderOption = jsons:getString(payload, "$.dateTimeRenderOption");
        string valueRenderOption = jsons:getString(payload, "$.valueRenderOption");
        string majorDimension = jsons:getString(payload, "$.majorDimension");
        message googlespreadsheetResponse;
        json googlespreadsheetJSONResponse;
        string cellDataField;

        googlespreadsheet:ClientConnector googlespreadsheetConnector = create googlespreadsheet:ClientConnector(accessToken,refreshToken,clientId,clientSecret);
        googlespreadsheetResponse = googlespreadsheet:ClientConnector.getCellData(googlespreadsheetConnector,spreadSheetId, range, dateTimeRenderOption, valueRenderOption, cellDataField, majorDimension);
        googlespreadsheetJSONResponse = messages:getJsonPayload(googlespreadsheetResponse);
        system:println(jsons:toString(googlespreadsheetJSONResponse));
        reply googlespreadsheetResponse;

    }

    @http:POST {}
    @http:Path {value:"/getMultipleCellData"}
    resource getMultipleDataFromCells (message m) {
        map detailsFromRequest = {};
        json payload = messages:getJsonPayload(m);
        string accessToken= jsons:getString(payload,"$.accessToken");
        string refreshToken = jsons:getString(payload,"$.refreshToken");
        string clientId = jsons:getString(payload,"$.clientId");
        string clientSecret= jsons:getString(payload,"$.clientSecret");
        string spreadSheetId = jsons:getString(payload, "$.spreadSheetId");
        string range = jsons:getString(payload, "$.range");
        string dateTimeRenderOption = jsons:getString(payload, "$.dateTimeRenderOption");
        string valueRenderOption = jsons:getString(payload, "$.valueRenderOption");
        string majorDimension = jsons:getString(payload, "$.majorDimension");
        message googlespreadsheetResponse;
        json googlespreadsheetJSONResponse;
        string cellDataField;

        googlespreadsheet:ClientConnector googlespreadsheetConnector = create googlespreadsheet:ClientConnector(accessToken,refreshToken,clientId,clientSecret);
        googlespreadsheetResponse = googlespreadsheet:ClientConnector.getMultipleCellData(googlespreadsheetConnector,spreadSheetId, range, dateTimeRenderOption, valueRenderOption, cellDataField, majorDimension);
        googlespreadsheetJSONResponse = messages:getJsonPayload(googlespreadsheetResponse);
        system:println(jsons:toString(googlespreadsheetJSONResponse));
        reply googlespreadsheetResponse;

    }

    @http:POST {}
    @http:Path {value:"/editCell"}
    resource editingCell (message m) {
        map detailsFromRequest = {};
        json payload = messages:getJsonPayload(m);
        string accessToken= jsons:getString(payload,"$.accessToken");
        string refreshToken = jsons:getString(payload,"$.refreshToken");
        string clientId = jsons:getString(payload,"$.clientId");
        string clientSecret= jsons:getString(payload,"$.clientSecret");
        string spreadSheetId = jsons:getString(payload, "$.spreadSheetId");
        string range = jsons:getString(payload, "$.range");
        string valueInputOption = jsons:getString(payload, "$.valueInputOption");
        json payloadToSend = jsons:getJson(payload,"$.payloadToSend");
        message googlespreadsheetResponse;
        json googlespreadsheetJSONResponse;
        string editCellField;

        googlespreadsheet:ClientConnector googlespreadsheetConnector = create googlespreadsheet:ClientConnector(accessToken,refreshToken,clientId,clientSecret);
        googlespreadsheetResponse = googlespreadsheet:ClientConnector.editCell(googlespreadsheetConnector,spreadSheetId, range, valueInputOption, payloadToSend, editCellField);
        googlespreadsheetJSONResponse = messages:getJsonPayload(googlespreadsheetResponse);
        system:println(jsons:toString(googlespreadsheetJSONResponse));
        reply googlespreadsheetResponse;

    }

    @http:POST {}
    @http:Path {value:"/editMultipleCells"}
    resource editingMultipleCells (message m) {
        map detailsFromRequest = {};
        json payload = messages:getJsonPayload(m);
        string accessToken= jsons:getString(payload,"$.accessToken");
        string refreshToken = jsons:getString(payload,"$.refreshToken");
        string clientId = jsons:getString(payload,"$.clientId");
        string clientSecret= jsons:getString(payload,"$.clientSecret");
        string spreadSheetId = jsons:getString(payload, "$.spreadSheetId");
        json payloadToSend = jsons:getJson(payload,"$.payloadToSend");
        message googlespreadsheetResponse;
        json googlespreadsheetJSONResponse;
        string editMultipleCellField;

        googlespreadsheet:ClientConnector googlespreadsheetConnector = create googlespreadsheet:ClientConnector(accessToken,refreshToken,clientId,clientSecret);
        googlespreadsheetResponse = googlespreadsheet:ClientConnector.editMultipleCell(googlespreadsheetConnector,spreadSheetId, payloadToSend, editMultipleCellField);
        googlespreadsheetJSONResponse = messages:getJsonPayload(googlespreadsheetResponse);
        system:println(jsons:toString(googlespreadsheetJSONResponse));
        reply googlespreadsheetResponse;

    }

    @http:POST {}
    @http:Path {value:"/addSheets"}
    resource addMultipleSheets (message m) {
        map detailsFromRequest = {};
        json payload = messages:getJsonPayload(m);
        string accessToken= jsons:getString(payload,"$.accessToken");
        string refreshToken = jsons:getString(payload,"$.refreshToken");
        string clientId = jsons:getString(payload,"$.clientId");
        string clientSecret= jsons:getString(payload,"$.clientSecret");
        string spreadSheetId = jsons:getString(payload, "$.spreadSheetId");
        json payloadToSend = jsons:getJson(payload,"$.payloadToSend");
        message googlespreadsheetResponse;
        json googlespreadsheetJSONResponse;
        string addSheetField;

        googlespreadsheet:ClientConnector googlespreadsheetConnector = create googlespreadsheet:ClientConnector(accessToken,refreshToken,clientId,clientSecret);
        googlespreadsheetResponse = googlespreadsheet:ClientConnector.addSheetBatchRequest(googlespreadsheetConnector,spreadSheetId, payloadToSend, addSheetField);
        googlespreadsheetJSONResponse = messages:getJsonPayload(googlespreadsheetResponse);
        system:println(jsons:toString(googlespreadsheetJSONResponse));
        reply googlespreadsheetResponse;

    }

    @http:POST {}
    @http:Path {value:"/deleteSheets"}
    resource deleteMultipleSheets (message m) {
        map detailsFromRequest = {};
        json payload = messages:getJsonPayload(m);
        string accessToken= jsons:getString(payload,"$.accessToken");
        string refreshToken = jsons:getString(payload,"$.refreshToken");
        string clientId = jsons:getString(payload,"$.clientId");
        string clientSecret= jsons:getString(payload,"$.clientSecret");
        string spreadSheetId = jsons:getString(payload, "$.spreadSheetId");
        json payloadToSend = jsons:getJson(payload,"$.payloadToSend");
        message googlespreadsheetResponse;
        json googlespreadsheetJSONResponse;
        string deleteSheetField;

        googlespreadsheet:ClientConnector googlespreadsheetConnector = create googlespreadsheet:ClientConnector(accessToken,refreshToken,clientId,clientSecret);
        googlespreadsheetResponse = googlespreadsheet:ClientConnector.addSheetBatchRequest(googlespreadsheetConnector,spreadSheetId, payloadToSend, deleteSheetField);
        googlespreadsheetJSONResponse = messages:getJsonPayload(googlespreadsheetResponse);
        system:println(jsons:toString(googlespreadsheetJSONResponse));
        reply googlespreadsheetResponse;

    }

    @http:POST {}
    @http:Path {value:"/updateSheets"}
    resource updateSheetsBatchRequest (message m) {
        map detailsFromRequest = {};
        json payload = messages:getJsonPayload(m);
        string accessToken= jsons:getString(payload,"$.accessToken");
        string refreshToken = jsons:getString(payload,"$.refreshToken");
        string clientId = jsons:getString(payload,"$.clientId");
        string clientSecret= jsons:getString(payload,"$.clientSecret");
        string spreadSheetId = jsons:getString(payload, "$.spreadSheetId");
        json payloadToSend = jsons:getJson(payload,"$.payloadToSend");
        message googlespreadsheetResponse;
        json googlespreadsheetJSONResponse;
        string updateSheetField;

        googlespreadsheet:ClientConnector googlespreadsheetConnector = create googlespreadsheet:ClientConnector(accessToken,refreshToken,clientId,clientSecret);
        googlespreadsheetResponse = googlespreadsheet:ClientConnector.updateSheetPropertiesBatchRequest(googlespreadsheetConnector,spreadSheetId, payloadToSend, updateSheetField);
        googlespreadsheetJSONResponse = messages:getJsonPayload(googlespreadsheetResponse);
        system:println(jsons:toString(googlespreadsheetJSONResponse));
        reply googlespreadsheetResponse;

    }

    @http:POST {}
    @http:Path {value:"/deleteDimensions"}
    resource deleteDimensionBatchRequest (message m) {
        map detailsFromRequest = {};
        json payload = messages:getJsonPayload(m);
        string accessToken= jsons:getString(payload,"$.accessToken");
        string refreshToken = jsons:getString(payload,"$.refreshToken");
        string clientId = jsons:getString(payload,"$.clientId");
        string clientSecret= jsons:getString(payload,"$.clientSecret");
        string spreadSheetId = jsons:getString(payload, "$.spreadSheetId");
        json payloadToSend = jsons:getJson(payload,"$.payloadToSend");
        message googlespreadsheetResponse;
        json googlespreadsheetJSONResponse;
        string deleteDimensionField;

        googlespreadsheet:ClientConnector googlespreadsheetConnector = create googlespreadsheet:ClientConnector(accessToken,refreshToken,clientId,clientSecret);
        googlespreadsheetResponse = googlespreadsheet:ClientConnector.deleteDimensionBatchRequest(googlespreadsheetConnector,spreadSheetId, payloadToSend, deleteDimensionField);
        googlespreadsheetJSONResponse = messages:getJsonPayload(googlespreadsheetResponse);
        system:println(jsons:toString(googlespreadsheetJSONResponse));
        reply googlespreadsheetResponse;

    }

    @http:POST {}
    @http:Path {value:"/updateCells"}
    resource updateCellsBatchRequest (message m) {
        map detailsFromRequest = {};
        json payload = messages:getJsonPayload(m);
        string accessToken= jsons:getString(payload,"$.accessToken");
        string refreshToken = jsons:getString(payload,"$.refreshToken");
        string clientId = jsons:getString(payload,"$.clientId");
        string clientSecret= jsons:getString(payload,"$.clientSecret");
        string spreadSheetId = jsons:getString(payload, "$.spreadSheetId");
        json payloadToSend = jsons:getJson(payload,"$.payloadToSend");
        message googlespreadsheetResponse;
        json googlespreadsheetJSONResponse;
        string updateCellsField;

        googlespreadsheet:ClientConnector googlespreadsheetConnector = create googlespreadsheet:ClientConnector(accessToken,refreshToken,clientId,clientSecret);
        googlespreadsheetResponse = googlespreadsheet:ClientConnector.updateCellsBatchRequest(googlespreadsheetConnector,spreadSheetId, payloadToSend, updateCellsField);
        googlespreadsheetJSONResponse = messages:getJsonPayload(googlespreadsheetResponse);
        system:println(jsons:toString(googlespreadsheetJSONResponse));
        reply googlespreadsheetResponse;

    }

    @http:POST {}
    @http:Path {value:"/appendDimension"}
    resource appendDimensionBatchRequest (message m) {
        map detailsFromRequest = {};
        json payload = messages:getJsonPayload(m);
        string accessToken= jsons:getString(payload,"$.accessToken");
        string refreshToken = jsons:getString(payload,"$.refreshToken");
        string clientId = jsons:getString(payload,"$.clientId");
        string clientSecret= jsons:getString(payload,"$.clientSecret");
        string spreadSheetId = jsons:getString(payload, "$.spreadSheetId");
        json payloadToSend = jsons:getJson(payload,"$.payloadToSend");
        message googlespreadsheetResponse;
        json googlespreadsheetJSONResponse;
        string appendCellsField;

        googlespreadsheet:ClientConnector googlespreadsheetConnector = create googlespreadsheet:ClientConnector(accessToken,refreshToken,clientId,clientSecret);
        googlespreadsheetResponse = googlespreadsheet:ClientConnector.appendDimensionBatchRequest(googlespreadsheetConnector,spreadSheetId, payloadToSend, appendCellsField);
        googlespreadsheetJSONResponse = messages:getJsonPayload(googlespreadsheetResponse);
        system:println(jsons:toString(googlespreadsheetJSONResponse));
        reply googlespreadsheetResponse;

    }

    @http:POST {}
    @http:Path {value:"/updateBorder"}
    resource updateBorderBatchRequest (message m) {
        map detailsFromRequest = {};
        json payload = messages:getJsonPayload(m);
        string accessToken= jsons:getString(payload,"$.accessToken");
        string refreshToken = jsons:getString(payload,"$.refreshToken");
        string clientId = jsons:getString(payload,"$.clientId");
        string clientSecret= jsons:getString(payload,"$.clientSecret");
        string spreadSheetId = jsons:getString(payload, "$.spreadSheetId");
        json payloadToSend = jsons:getJson(payload,"$.payloadToSend");
        message googlespreadsheetResponse;
        json googlespreadsheetJSONResponse;
        string updateBorderField;

        googlespreadsheet:ClientConnector googlespreadsheetConnector = create googlespreadsheet:ClientConnector(accessToken,refreshToken,clientId,clientSecret);
        googlespreadsheetResponse = googlespreadsheet:ClientConnector.updateBordersBatchRequest(googlespreadsheetConnector,spreadSheetId, payloadToSend, updateBorderField);
        googlespreadsheetJSONResponse = messages:getJsonPayload(googlespreadsheetResponse);
        system:println(jsons:toString(googlespreadsheetJSONResponse));
        reply googlespreadsheetResponse;

    }

    @http:POST {}
    @http:Path {value:"/repeatCells"}
    resource repeatCellsBatchRequest (message m) {
        map detailsFromRequest = {};
        json payload = messages:getJsonPayload(m);
        string accessToken= jsons:getString(payload,"$.accessToken");
        string refreshToken = jsons:getString(payload,"$.refreshToken");
        string clientId = jsons:getString(payload,"$.clientId");
        string clientSecret= jsons:getString(payload,"$.clientSecret");
        string spreadSheetId = jsons:getString(payload, "$.spreadSheetId");
        json payloadToSend = jsons:getJson(payload,"$.payloadToSend");
        message googlespreadsheetResponse;
        json googlespreadsheetJSONResponse;
        string repeatCellsField;

        googlespreadsheet:ClientConnector googlespreadsheetConnector = create googlespreadsheet:ClientConnector(accessToken,refreshToken,clientId,clientSecret);
        googlespreadsheetResponse = googlespreadsheet:ClientConnector.repeatCellsBatchRequest(googlespreadsheetConnector,spreadSheetId, payloadToSend, repeatCellsField);
        googlespreadsheetJSONResponse = messages:getJsonPayload(googlespreadsheetResponse);
        system:println(jsons:toString(googlespreadsheetJSONResponse));
        reply googlespreadsheetResponse;

    }

    @http:POST {}
    @http:Path {value:"/mergeCells"}
    resource mergeCellsBatchRequest (message m) {
        map detailsFromRequest = {};
        json payload = messages:getJsonPayload(m);
        string accessToken= jsons:getString(payload,"$.accessToken");
        string refreshToken = jsons:getString(payload,"$.refreshToken");
        string clientId = jsons:getString(payload,"$.clientId");
        string clientSecret= jsons:getString(payload,"$.clientSecret");
        string spreadSheetId = jsons:getString(payload, "$.spreadSheetId");
        json payloadToSend = jsons:getJson(payload,"$.payloadToSend");
        message googlespreadsheetResponse;
        json googlespreadsheetJSONResponse;
        string mergeCellsField;

        googlespreadsheet:ClientConnector googlespreadsheetConnector = create googlespreadsheet:ClientConnector(accessToken,refreshToken,clientId,clientSecret);
        googlespreadsheetResponse = googlespreadsheet:ClientConnector.mergeCellsBatchRequest(googlespreadsheetConnector,spreadSheetId, payloadToSend, mergeCellsField);
        googlespreadsheetJSONResponse = messages:getJsonPayload(googlespreadsheetResponse);
        system:println(jsons:toString(googlespreadsheetJSONResponse));
        reply googlespreadsheetResponse;

    }

    @http:POST {}
    @http:Path {value:"/setDataValidation"}
    resource setDataValidationBatchRequest (message m) {
        map detailsFromRequest = {};
        json payload = messages:getJsonPayload(m);
        string accessToken= jsons:getString(payload,"$.accessToken");
        string refreshToken = jsons:getString(payload,"$.refreshToken");
        string clientId = jsons:getString(payload,"$.clientId");
        string clientSecret= jsons:getString(payload,"$.clientSecret");
        string spreadSheetId = jsons:getString(payload, "$.spreadSheetId");
        json payloadToSend = jsons:getJson(payload,"$.payloadToSend");
        message googlespreadsheetResponse;
        json googlespreadsheetJSONResponse;
        string setDataValidationField;

        googlespreadsheet:ClientConnector googlespreadsheetConnector = create googlespreadsheet:ClientConnector(accessToken,refreshToken,clientId,clientSecret);
        googlespreadsheetResponse = googlespreadsheet:ClientConnector.setDataValidationBatchRequest(googlespreadsheetConnector,spreadSheetId, payloadToSend, setDataValidationField);
        googlespreadsheetJSONResponse = messages:getJsonPayload(googlespreadsheetResponse);
        system:println(jsons:toString(googlespreadsheetJSONResponse));
        reply googlespreadsheetResponse;

    }

    @http:POST {}
    @http:Path {value:"/copyPaste"}
    resource copyPasteBatchRequest (message m) {
        map detailsFromRequest = {};
        json payload = messages:getJsonPayload(m);
        string accessToken= jsons:getString(payload,"$.accessToken");
        string refreshToken = jsons:getString(payload,"$.refreshToken");
        string clientId = jsons:getString(payload,"$.clientId");
        string clientSecret= jsons:getString(payload,"$.clientSecret");
        string spreadSheetId = jsons:getString(payload, "$.spreadSheetId");
        json payloadToSend = jsons:getJson(payload,"$.payloadToSend");
        message googlespreadsheetResponse;
        json googlespreadsheetJSONResponse;
        string copyPasteField;

        googlespreadsheet:ClientConnector googlespreadsheetConnector = create googlespreadsheet:ClientConnector(accessToken,refreshToken,clientId,clientSecret);
        googlespreadsheetResponse = googlespreadsheet:ClientConnector.copyPasteBatchRequest(googlespreadsheetConnector,spreadSheetId, payloadToSend, copyPasteField);
        googlespreadsheetJSONResponse = messages:getJsonPayload(googlespreadsheetResponse);
        system:println(jsons:toString(googlespreadsheetJSONResponse));
        reply googlespreadsheetResponse;

    }

    @http:POST {}
    @http:Path {value:"/cutPaste"}
    resource cutPasteBatchRequest (message m) {
        map detailsFromRequest = {};
        json payload = messages:getJsonPayload(m);
        string accessToken= jsons:getString(payload,"$.accessToken");
        string refreshToken = jsons:getString(payload,"$.refreshToken");
        string clientId = jsons:getString(payload,"$.clientId");
        string clientSecret= jsons:getString(payload,"$.clientSecret");
        string spreadSheetId = jsons:getString(payload, "$.spreadSheetId");
        json payloadToSend = jsons:getJson(payload,"$.payloadToSend");
        message googlespreadsheetResponse;
        json googlespreadsheetJSONResponse;
        string cutPasteField;

        googlespreadsheet:ClientConnector googlespreadsheetConnector = create googlespreadsheet:ClientConnector(accessToken,refreshToken,clientId,clientSecret);
        googlespreadsheetResponse = googlespreadsheet:ClientConnector.cutPasteBatchRequest(googlespreadsheetConnector,spreadSheetId, payloadToSend, cutPasteField);
        googlespreadsheetJSONResponse = messages:getJsonPayload(googlespreadsheetResponse);
        system:println(jsons:toString(googlespreadsheetJSONResponse));
        reply googlespreadsheetResponse;

    }

    @http:POST {}
    @http:Path {value:"/updateConditionalFormat"}
    resource updateConditionalFormatRuleBatchRequest (message m) {
        map detailsFromRequest = {};
        json payload = messages:getJsonPayload(m);
        string accessToken= jsons:getString(payload,"$.accessToken");
        string refreshToken = jsons:getString(payload,"$.refreshToken");
        string clientId = jsons:getString(payload,"$.clientId");
        string clientSecret= jsons:getString(payload,"$.clientSecret");
        string spreadSheetId = jsons:getString(payload, "$.spreadSheetId");
        json payloadToSend = jsons:getJson(payload,"$.payloadToSend");
        message googlespreadsheetResponse;
        json googlespreadsheetJSONResponse;
        string updateConditionalField;

        googlespreadsheet:ClientConnector googlespreadsheetConnector = create googlespreadsheet:ClientConnector(accessToken,refreshToken,clientId,clientSecret);
        googlespreadsheetResponse = googlespreadsheet:ClientConnector.updateConditionalFormatRuleBatchRequest(googlespreadsheetConnector,spreadSheetId, payloadToSend, updateConditionalField);
        googlespreadsheetJSONResponse = messages:getJsonPayload(googlespreadsheetResponse);
        system:println(jsons:toString(googlespreadsheetJSONResponse));
        reply googlespreadsheetResponse;

    }

    @http:POST {}
    @http:Path {value:"/addConditionalFormat"}
    resource addConditionalFormatRuleBatchRequest (message m) {
        map detailsFromRequest = {};
        json payload = messages:getJsonPayload(m);
        string accessToken= jsons:getString(payload,"$.accessToken");
        string refreshToken = jsons:getString(payload,"$.refreshToken");
        string clientId = jsons:getString(payload,"$.clientId");
        string clientSecret= jsons:getString(payload,"$.clientSecret");
        string spreadSheetId = jsons:getString(payload, "$.spreadSheetId");
        json payloadToSend = jsons:getJson(payload,"$.payloadToSend");
        message googlespreadsheetResponse;
        json googlespreadsheetJSONResponse;
        string addConditionalField;

        googlespreadsheet:ClientConnector googlespreadsheetConnector = create googlespreadsheet:ClientConnector(accessToken,refreshToken,clientId,clientSecret);
        googlespreadsheetResponse = googlespreadsheet:ClientConnector.addConditionalFormatRuleBatchRequest(googlespreadsheetConnector,spreadSheetId, payloadToSend, addConditionalField);
        googlespreadsheetJSONResponse = messages:getJsonPayload(googlespreadsheetResponse);
        system:println(jsons:toString(googlespreadsheetJSONResponse));
        reply googlespreadsheetResponse;

    }

    @http:POST {}
    @http:Path {value:"/deleteConditionalFormat"}
    resource deleteConditionalFormatRuleBatchRequest (message m) {
        map detailsFromRequest = {};
        json payload = messages:getJsonPayload(m);
        string accessToken= jsons:getString(payload,"$.accessToken");
        string refreshToken = jsons:getString(payload,"$.refreshToken");
        string clientId = jsons:getString(payload,"$.clientId");
        string clientSecret= jsons:getString(payload,"$.clientSecret");
        string spreadSheetId = jsons:getString(payload, "$.spreadSheetId");
        json payloadToSend = jsons:getJson(payload,"$.payloadToSend");
        message googlespreadsheetResponse;
        json googlespreadsheetJSONResponse;
        string deleteConditionalField;

        googlespreadsheet:ClientConnector googlespreadsheetConnector = create googlespreadsheet:ClientConnector(accessToken,refreshToken,clientId,clientSecret);
        googlespreadsheetResponse = googlespreadsheet:ClientConnector.deleteConditionalFormatRuleBatchRequest(googlespreadsheetConnector,spreadSheetId, payloadToSend, deleteConditionalField);
        googlespreadsheetJSONResponse = messages:getJsonPayload(googlespreadsheetResponse);
        system:println(jsons:toString(googlespreadsheetJSONResponse));
        reply googlespreadsheetResponse;

    }

    @http:POST {}
    @http:Path {value:"/updateDimensionProperties"}
    resource updateDimensionPropertiesBatchRequest (message m) {
        map detailsFromRequest = {};
        json payload = messages:getJsonPayload(m);
        string accessToken= jsons:getString(payload,"$.accessToken");
        string refreshToken = jsons:getString(payload,"$.refreshToken");
        string clientId = jsons:getString(payload,"$.clientId");
        string clientSecret= jsons:getString(payload,"$.clientSecret");
        string spreadSheetId = jsons:getString(payload, "$.spreadSheetId");
        json payloadToSend = jsons:getJson(payload,"$.payloadToSend");
        message googlespreadsheetResponse;
        json googlespreadsheetJSONResponse;
        string updateDimensionalPropField;

        googlespreadsheet:ClientConnector googlespreadsheetConnector = create googlespreadsheet:ClientConnector(accessToken,refreshToken,clientId,clientSecret);
        googlespreadsheetResponse = googlespreadsheet:ClientConnector.updateDimensionPropertiesBatchRequest(googlespreadsheetConnector,spreadSheetId, payloadToSend, updateDimensionalPropField);
        googlespreadsheetJSONResponse = messages:getJsonPayload(googlespreadsheetResponse);
        system:println(jsons:toString(googlespreadsheetJSONResponse));
        reply googlespreadsheetResponse;

    }

    @http:POST {}
    @http:Path {value:"/autoResize"}
    resource autoResizeDimensionsBatchRequest (message m) {
        map detailsFromRequest = {};
        json payload = messages:getJsonPayload(m);
        string accessToken= jsons:getString(payload,"$.accessToken");
        string refreshToken = jsons:getString(payload,"$.refreshToken");
        string clientId = jsons:getString(payload,"$.clientId");
        string clientSecret= jsons:getString(payload,"$.clientSecret");
        string spreadSheetId = jsons:getString(payload, "$.spreadSheetId");
        json payloadToSend = jsons:getJson(payload,"$.payloadToSend");
        message googlespreadsheetResponse;
        json googlespreadsheetJSONResponse;
        string autoResizeField;

        googlespreadsheet:ClientConnector googlespreadsheetConnector = create googlespreadsheet:ClientConnector(accessToken,refreshToken,clientId,clientSecret);
        googlespreadsheetResponse = googlespreadsheet:ClientConnector.autoResizeDimensionsBatchRequest(googlespreadsheetConnector,spreadSheetId, payloadToSend, autoResizeField);
        googlespreadsheetJSONResponse = messages:getJsonPayload(googlespreadsheetResponse);
        system:println(jsons:toString(googlespreadsheetJSONResponse));
        reply googlespreadsheetResponse;

    }

    @http:POST {}
    @http:Path {value:"/insertDimension"}
    resource insertDimensionBatchRequest (message m) {
        map detailsFromRequest = {};
        json payload = messages:getJsonPayload(m);
        string accessToken= jsons:getString(payload,"$.accessToken");
        string refreshToken = jsons:getString(payload,"$.refreshToken");
        string clientId = jsons:getString(payload,"$.clientId");
        string clientSecret= jsons:getString(payload,"$.clientSecret");
        string spreadSheetId = jsons:getString(payload, "$.spreadSheetId");
        json payloadToSend = jsons:getJson(payload,"$.payloadToSend");
        message googlespreadsheetResponse;
        json googlespreadsheetJSONResponse;
        string insertDimensionField;

        googlespreadsheet:ClientConnector googlespreadsheetConnector = create googlespreadsheet:ClientConnector(accessToken,refreshToken,clientId,clientSecret);
        googlespreadsheetResponse = googlespreadsheet:ClientConnector.insertDimensionBatchRequest(googlespreadsheetConnector,spreadSheetId, payloadToSend, insertDimensionField);
        googlespreadsheetJSONResponse = messages:getJsonPayload(googlespreadsheetResponse);
        system:println(jsons:toString(googlespreadsheetJSONResponse));
        reply googlespreadsheetResponse;

    }

    @http:POST {}
    @http:Path {value:"/moveDimension"}
    resource moveDimensionBatchRequest (message m) {
        map detailsFromRequest = {};
        json payload = messages:getJsonPayload(m);
        string accessToken= jsons:getString(payload,"$.accessToken");
        string refreshToken = jsons:getString(payload,"$.refreshToken");
        string clientId = jsons:getString(payload,"$.clientId");
        string clientSecret= jsons:getString(payload,"$.clientSecret");
        string spreadSheetId = jsons:getString(payload, "$.spreadSheetId");
        json payloadToSend = jsons:getJson(payload,"$.payloadToSend");
        message googlespreadsheetResponse;
        json googlespreadsheetJSONResponse;
        string moveDimensionField;

        googlespreadsheet:ClientConnector googlespreadsheetConnector = create googlespreadsheet:ClientConnector(accessToken,refreshToken,clientId,clientSecret);
        googlespreadsheetResponse = googlespreadsheet:ClientConnector.moveDimensionBatchRequest(googlespreadsheetConnector,spreadSheetId, payloadToSend, moveDimensionField);
        googlespreadsheetJSONResponse = messages:getJsonPayload(googlespreadsheetResponse);
        system:println(jsons:toString(googlespreadsheetJSONResponse));
        reply googlespreadsheetResponse;

    }

    @http:POST {}
    @http:Path {value:"/sortRange"}
    resource sortRangeBatchRequest (message m) {
        map detailsFromRequest = {};
        json payload = messages:getJsonPayload(m);
        string accessToken= jsons:getString(payload,"$.accessToken");
        string refreshToken = jsons:getString(payload,"$.refreshToken");
        string clientId = jsons:getString(payload,"$.clientId");
        string clientSecret= jsons:getString(payload,"$.clientSecret");
        string spreadSheetId = jsons:getString(payload, "$.spreadSheetId");
        json payloadToSend = jsons:getJson(payload,"$.payloadToSend");
        message googlespreadsheetResponse;
        json googlespreadsheetJSONResponse;
        string sortRangeField;

        googlespreadsheet:ClientConnector googlespreadsheetConnector = create googlespreadsheet:ClientConnector(accessToken,refreshToken,clientId,clientSecret);
        googlespreadsheetResponse = googlespreadsheet:ClientConnector.sortRangeBatchRequest(googlespreadsheetConnector,spreadSheetId, payloadToSend, sortRangeField);
        googlespreadsheetJSONResponse = messages:getJsonPayload(googlespreadsheetResponse);
        system:println(jsons:toString(googlespreadsheetJSONResponse));
        reply googlespreadsheetResponse;

    }

    @http:POST {}
    @http:Path {value:"/addRowsColumnsData"}
    resource addRowsColumnsDataRequest (message m) {
        map detailsFromRequest = {};
        json payload = messages:getJsonPayload(m);
        string accessToken= jsons:getString(payload,"$.accessToken");
        string refreshToken = jsons:getString(payload,"$.refreshToken");
        string clientId = jsons:getString(payload,"$.clientId");
        string clientSecret= jsons:getString(payload,"$.clientSecret");
        string spreadSheetId = jsons:getString(payload, "$.spreadSheetId");
        string range = jsons:getString(payload, "$.range");
        string insertDataOption = jsons:getString(payload, "$.insertDataOption");
        //string majorDimension = jsons:getString(payload, "$.majorDimension");
        string valueInputOption = jsons:getString(payload, "$.valueInputOption");
        json payloadToSend = jsons:getJson(payload,"$.payloadToSend");
        message googlespreadsheetResponse;
        json googlespreadsheetJSONResponse;
        string addRowsColumnField;

        googlespreadsheet:ClientConnector googlespreadsheetConnector = create googlespreadsheet:ClientConnector(accessToken,refreshToken,clientId,clientSecret);
        googlespreadsheetResponse = googlespreadsheet:ClientConnector.addRowsColumnsData(googlespreadsheetConnector,spreadSheetId, range, insertDataOption, valueInputOption, addRowsColumnField, payloadToSend);
        googlespreadsheetJSONResponse = messages:getJsonPayload(googlespreadsheetResponse);
        system:println(jsons:toString(googlespreadsheetJSONResponse));
        reply googlespreadsheetResponse;

    }



}
