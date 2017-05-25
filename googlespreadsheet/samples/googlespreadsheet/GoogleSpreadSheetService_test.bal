package googlespreadsheet;

import ballerina.test;
import ballerina.lang.messages;
import ballerina.net.http;
import ballerina.lang.jsons;
import ballerina.lang.system;


function testCreateSpreadSheet() {
    string serviceURL = test:startService("googleSpreadSheetService");
    json payload = `{
    "accessToken":"ya29.GltJBKgJM4OcndUH7Tp54A3DqQs5mxaFzslPmlFKo79slBGw4uJM_qaG04wJBcHZe2VvBows5oUNxvRzIIXi4LnYene_xd6sdMXzroC78CnguB_s-fykhy7GWTEd",
   "refreshToken":"1/YLHTjGPr0oTKHg8gpsFUC60PpjivAg7t8R20ZeN9HGQ",
   "clientId":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
   "clientSecret":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
   "payloadToSend":{"spreadsheetId": "p4PJALKcIXLr75rJWXlHhVjOt7z0Nby7AvcKXJGhMN2s","properties":{"title": "TestBal_2"},"sheets":[{"properties": {"title": "sheet_1","sheetId": 789}}], "namedRanges": [{"name": "first", "range":{"sheetId": 789}}]}
}`;

    http:ClientConnector client = create http:ClientConnector(serviceURL);
    message request = {};
    messages:setJsonPayload(request, payload);
    message response = {};
    response = http:ClientConnector.post(client, "/createSpreadSheet", request);
    json responsePayload = messages:getJsonPayload(response);
    string responseSpreadSheetTitle = jsons:getString(responsePayload, "$.properties.title");
    system:println("....................................Executing testCreateSpreadSheet..........................................");
    test:assertEquals(responseSpreadSheetTitle, "TestBal_2");
}


function testGetSheetMetaData () {
    string serviceURL = test:startService("googleSpreadSheetService");
    json payload = `{
     "accessToken":"ya29.GltJBKgJM4OcndUH7Tp54A3DqQs5mxaFzslPmlFKo79slBGw4uJM_qaG04wJBcHZe2VvBows5oUNxvRzIIXi4LnYene_xd6sdMXzroC78CnguB_s-fykhy7GWTEd",
   "refreshToken":"1/YLHTjGPr0oTKHg8gpsFUC60PpjivAg7t8R20ZeN9HGQ",
   "clientId":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
   "clientSecret":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
   "spreadSheetId":"1odTDdMZm955QCiN-uTW7TPnnJE1TiEaG6xWrQPgT3IY",
   "includeGridInfo":"true",
   "range":"sheet_1"
}`;

    http:ClientConnector client = create http:ClientConnector(serviceURL);
    message request = {};
    messages:setJsonPayload(request, payload);
    message response = {};
    response = http:ClientConnector.post(client, "/getSheetMetaData", request);
    json responsePayload = messages:getJsonPayload(response);
    string responseSpreadSheetTitle = jsons:getString(responsePayload, "$.properties.title");
    system:println("....................................Executing testGetSheetMetaData..........................................");
    test:assertEquals(responseSpreadSheetTitle, "TestBal_1");
}


function testCopyTo () {
    string serviceURL = test:startService("googleSpreadSheetService");
    json payload = `{
    "accessToken":"ya29.GltJBKgJM4OcndUH7Tp54A3DqQs5mxaFzslPmlFKo79slBGw4uJM_qaG04wJBcHZe2VvBows5oUNxvRzIIXi4LnYene_xd6sdMXzroC78CnguB_s-fykhy7GWTEd",
   "refreshToken":"1/YLHTjGPr0oTKHg8gpsFUC60PpjivAg7t8R20ZeN9HGQ",
   "clientId":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
   "clientSecret":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
   "sourceSpreadSheetId":"115jhHyi_HN-fwOCdW3ipEctspV7cwpqlJj6JizBz9CQ",
   "sourceSheetId":"789",
   "payloadToSend":{"destinationSpreadsheetId": "16kweqosStZJi4TiWgLVS8qxlRdLdobIJLz0kEyrHXzA"}
}`;

    http:ClientConnector client = create http:ClientConnector(serviceURL);
    message request = {};
    messages:setJsonPayload(request, payload);
    message response = {};
    response = http:ClientConnector.post(client, "/copyTo", request);
    string responseCode = (string)http:getStatusCode(response);
    system:println("....................................Executing testCopyTo..........................................");
    test:assertEquals(responseCode, "200");
}

function testGetCellData () {
    string serviceURL = test:startService("googleSpreadSheetService");
    json payload = `{
    "accessToken":"ya29.GltJBEZq1hc4HCIw3eALtmR-sqEf6rZfLfOLqQQkHslbiGOxAOz-7CptHrLc1mapTGfdB_vZas0DoL8s1Y2BiRfy3dsG2n013I99NryUQB-pE7FnWwSoLqRqDWT9",
   "refreshToken":"1/oqKw0fizCx7qqFFMUZWQTx6gSSt9DnJdeK-oNRwJL_UGrUDVo1u9_c5vkENLQLmx",
   "clientId":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
   "clientSecret":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
   "spreadSheetId":"115jhHyi_HN-fwOCdW3ipEctspV7cwpqlJj6JizBz9CQ",
   "range":"sheet_1",
   "dateTimeRenderOption":"SERIAL_NUMBER",
   "valueRenderOption":"FORMATTED_VALUE",
   "majorDimension":"ROWS"

}`;

    http:ClientConnector client = create http:ClientConnector(serviceURL);
    message request = {};
    messages:setJsonPayload(request, payload);
    message response = {};
    response = http:ClientConnector.post(client, "/getCellData", request);
    string responseCode = (string)http:getStatusCode(response);
    system:println("....................................Executing testGetCellData..........................................");
    test:assertEquals(responseCode, "200");
}

function testGetMultipleCellData () {
    string serviceURL = test:startService("googleSpreadSheetService");
    json payload = `{
    "accessToken":"ya29.GltJBEZq1hc4HCIw3eALtmR-sqEf6rZfLfOLqQQkHslbiGOxAOz-7CptHrLc1mapTGfdB_vZas0DoL8s1Y2BiRfy3dsG2n013I99NryUQB-pE7FnWwSoLqRqDWT9",
   "refreshToken":"1/oqKw0fizCx7qqFFMUZWQTx6gSSt9DnJdeK-oNRwJL_UGrUDVo1u9_c5vkENLQLmx",
   "clientId":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
   "clientSecret":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
   "spreadSheetId":"115jhHyi_HN-fwOCdW3ipEctspV7cwpqlJj6JizBz9CQ",
   "range":"sheet_1",
   "dateTimeRenderOption":"SERIAL_NUMBER",
   "valueRenderOption":"FORMATTED_VALUE",
   "majorDimension":"ROWS"

}`;

    http:ClientConnector client = create http:ClientConnector(serviceURL);
    message request = {};
    messages:setJsonPayload(request, payload);
    message response = {};
    response = http:ClientConnector.post(client, "/getMultipleCellData", request);
    string responseCode = (string)http:getStatusCode(response);
    system:println("....................................Executing testGetMultipleCellData..........................................");
    test:assertEquals(responseCode, "200");
}

function testEditCell () {
    string serviceURL = test:startService("googleSpreadSheetService");
    json payload = `{
    "accessToken":"ya29.GltJBEZq1hc4HCIw3eALtmR-sqEf6rZfLfOLqQQkHslbiGOxAOz-7CptHrLc1mapTGfdB_vZas0DoL8s1Y2BiRfy3dsG2n013I99NryUQB-pE7FnWwSoLqRqDWT9",
   "refreshToken":"1/oqKw0fizCx7qqFFMUZWQTx6gSSt9DnJdeK-oNRwJL_UGrUDVo1u9_c5vkENLQLmx",
   "clientId":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
   "clientSecret":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
   "spreadSheetId":"115jhHyi_HN-fwOCdW3ipEctspV7cwpqlJj6JizBz9CQ",
   "range":"sheet_1",
   "valueInputOption":"RAW",
   "payloadToSend":{"majorDimension": "ROWS"}

}`;

    http:ClientConnector client = create http:ClientConnector(serviceURL);
    message request = {};
    messages:setJsonPayload(request, payload);
    message response = {};
    response = http:ClientConnector.post(client, "/editCell", request);
    string responseCode = (string)http:getStatusCode(response);
    system:println("....................................Executing testEditCell..........................................");
    test:assertEquals(responseCode, "200");
}

function testEditMultipleCells () {
    string serviceURL = test:startService("googleSpreadSheetService");
    json payload = `{
    "accessToken":"ya29.GltJBEZq1hc4HCIw3eALtmR-sqEf6rZfLfOLqQQkHslbiGOxAOz-7CptHrLc1mapTGfdB_vZas0DoL8s1Y2BiRfy3dsG2n013I99NryUQB-pE7FnWwSoLqRqDWT9",
   "refreshToken":"1/oqKw0fizCx7qqFFMUZWQTx6gSSt9DnJdeK-oNRwJL_UGrUDVo1u9_c5vkENLQLmx",
   "clientId":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
   "clientSecret":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
   "spreadSheetId":"16kweqosStZJi4TiWgLVS8qxlRdLdobIJLz0kEyrHXzA",
   "payloadToSend":{
  "responseValueRenderOption": "FORMATTED_VALUE",
  "responseDateTimeRenderOption": "SERIAL_NUMBER",
  "includeValuesInResponse": true,
  "valueInputOption": "RAW",
  "data": [
    {
      "range": "A1:B2",
      "majorDimension": "ROWS",
      "values": [
        [
          1
        ],
        [
          2
        ]
      ]
    }
  ]
}

}`;

    http:ClientConnector client = create http:ClientConnector(serviceURL);
    message request = {};
    messages:setJsonPayload(request, payload);
    message response = {};
    response = http:ClientConnector.post(client, "/editMultipleCells", request);
    string responseCode = (string)http:getStatusCode(response);
    system:println("....................................Executing testEditMultipleCells..........................................");
    test:assertEquals(responseCode, "200");
}

function testAddSheets () {
    string serviceURL = test:startService("googleSpreadSheetService");
    json payload = `{
    "accessToken":"ya29.GltJBClaSyuhgQmqy-MIdkd5IxrT0yBLXU5RqTRarURMtRHpq5jcM2nJAX0ZNB7rEaUOGAepcjx-c7fZBkQloJdLBNMaMS9oyEWM5MurKTdpvd44Cfj9xU0KDN6a",
   "refreshToken":"1/ELCZeJiIM_1P9fg5K3H1JpLky8cvLLz4hMzTvUbVKtw",
   "clientId":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
   "clientSecret":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
   "spreadSheetId":"16kweqosStZJi4TiWgLVS8qxlRdLdobIJLz0kEyrHXzA",
   "payloadToSend":{
  "requests": [
    {
      "addSheet": {
        "properties": {
          "title": "Withdrawls",
          "gridProperties": {
            "rowCount": 20,
            "columnCount": 12
          },
          "tabColor": {
            "red": 1.0,
            "green": 0.3,
            "blue": 0.4
          }
        }
      }
    }
  ]
}

}`;

    http:ClientConnector client = create http:ClientConnector(serviceURL);
    message request = {};
    messages:setJsonPayload(request, payload);
    message response = {};
    response = http:ClientConnector.post(client, "/addSheets", request);
    string responseCode = (string)http:getStatusCode(response);
    system:println("....................................Executing testEAddSheets..........................................");
    test:assertEquals(responseCode, "200");
}

function testDeleteSheets () {
    string serviceURL = test:startService("googleSpreadSheetService");
    json payload = `{
    "accessToken":"ya29.GltJBClaSyuhgQmqy-MIdkd5IxrT0yBLXU5RqTRarURMtRHpq5jcM2nJAX0ZNB7rEaUOGAepcjx-c7fZBkQloJdLBNMaMS9oyEWM5MurKTdpvd44Cfj9xU0KDN6a",
   "refreshToken":"1/ELCZeJiIM_1P9fg5K3H1JpLky8cvLLz4hMzTvUbVKtw",
   "clientId":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
   "clientSecret":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
   "spreadSheetId":"16kweqosStZJi4TiWgLVS8qxlRdLdobIJLz0kEyrHXzA",
   "payloadToSend":{
  "requests": [
    {
      "deleteSheet": {
        "sheetId": 189846807
      }
    }
  ]
}
}`;

    http:ClientConnector client = create http:ClientConnector(serviceURL);
    message request = {};
    messages:setJsonPayload(request, payload);
    message response = {};
    response = http:ClientConnector.post(client, "/deleteSheets", request);
    string responseCode = (string)http:getStatusCode(response);
    system:println("....................................Executing testEAddSheets..........................................");
    test:assertEquals(responseCode, "200");
}

function testUpdateSheetBatchRequest () {
    string serviceURL = test:startService("googleSpreadSheetService");
    json payload = `{
    "accessToken":"ya29.GltJBClaSyuhgQmqy-MIdkd5IxrT0yBLXU5RqTRarURMtRHpq5jcM2nJAX0ZNB7rEaUOGAepcjx-c7fZBkQloJdLBNMaMS9oyEWM5MurKTdpvd44Cfj9xU0KDN6a",
   "refreshToken":"1/ELCZeJiIM_1P9fg5K3H1JpLky8cvLLz4hMzTvUbVKtw",
   "clientId":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
   "clientSecret":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
   "spreadSheetId":"16kweqosStZJi4TiWgLVS8qxlRdLdobIJLz0kEyrHXzA",
   "payloadToSend":{
  "requests": [{
      "updateSpreadsheetProperties": {
          "properties": {"title": "My New Title"},
          "fields": "title"
        }
    }]
}
}`;

    http:ClientConnector client = create http:ClientConnector(serviceURL);
    message request = {};
    messages:setJsonPayload(request, payload);
    message response = {};
    response = http:ClientConnector.post(client, "/updateSheets", request);
    string responseCode = (string)http:getStatusCode(response);
    system:println("....................................Executing updateSheetBatchRequest..........................................");
    test:assertEquals(responseCode, "200");
}

function testDeleteDimensionBatchRequest () {
    string serviceURL = test:startService("googleSpreadSheetService");
    json payload = `{
   "accessToken":"ya29.GltJBClaSyuhgQmqy-MIdkd5IxrT0yBLXU5RqTRarURMtRHpq5jcM2nJAX0ZNB7rEaUOGAepcjx-c7fZBkQloJdLBNMaMS9oyEWM5MurKTdpvd44Cfj9xU0KDN6a",
   "refreshToken":"1/ELCZeJiIM_1P9fg5K3H1JpLky8cvLLz4hMzTvUbVKtw",
   "clientId":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
   "clientSecret":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
   "spreadSheetId":"16kweqosStZJi4TiWgLVS8qxlRdLdobIJLz0kEyrHXzA",
   "payloadToSend":{
      "requests":[
         {
            "deleteDimension":{
               "range":{
                  "sheetId":521331261,
                  "dimension":"ROWS",
                  "startIndex":9,
                  "endIndex":11
               }
            }
         }
      ]
   }
}`;

    http:ClientConnector client = create http:ClientConnector(serviceURL);
    message request = {};
    messages:setJsonPayload(request, payload);
    message response = {};
    response = http:ClientConnector.post(client, "/deleteDimensions", request);
    string responseCode = (string)http:getStatusCode(response);
    system:println("....................................Executing deleteDimensionBatchRequest..........................................");
    test:assertEquals(responseCode, "200");
}

function testUpdateCellsBatchRequest () {
    string serviceURL = test:startService("googleSpreadSheetService");
    json payload = `{
    "accessToken":"ya29.GltJBClaSyuhgQmqy-MIdkd5IxrT0yBLXU5RqTRarURMtRHpq5jcM2nJAX0ZNB7rEaUOGAepcjx-c7fZBkQloJdLBNMaMS9oyEWM5MurKTdpvd44Cfj9xU0KDN6a",
   "refreshToken":"1/ELCZeJiIM_1P9fg5K3H1JpLky8cvLLz4hMzTvUbVKtw",
   "clientId":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
   "clientSecret":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
   "spreadSheetId":"16kweqosStZJi4TiWgLVS8qxlRdLdobIJLz0kEyrHXzA",
   "payloadToSend":{
  "requests": [
    {
      "updateCells": {
        "range": {
          "sheetId": 521331261
        },
        "fields": "*"
      }
    }
  ]
}
}`;

    http:ClientConnector client = create http:ClientConnector(serviceURL);
    message request = {};
    messages:setJsonPayload(request, payload);
    message response = {};
    response = http:ClientConnector.post(client, "/updateCells", request);
    string responseCode = (string)http:getStatusCode(response);
    system:println("....................................Executing updateCellshBatchRequest..........................................");
    test:assertEquals(responseCode, "200");
}

function testAppendCellsBatchRequest () {
    string serviceURL = test:startService("googleSpreadSheetService");
    json payload = `{
    "accessToken":"ya29.GltJBLmNig9AstnV4LBTT3YP6yhcwKOSRnPZ7eahyvcb35_DuAEXBgt0WjTSIhEtJ0Q_rVSiuecqCvAk2AnP25J-dwlbvap8NsKe50xECG892z37kzurA64hF29p",
   "refreshToken":"1/dn02o7wTCVflls99G50kFa57Gzyn79xU0RmZ9YO5dM8",
   "clientId":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
   "clientSecret":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
   "spreadSheetId":"16kweqosStZJi4TiWgLVS8qxlRdLdobIJLz0kEyrHXzA",
   "payloadToSend":{
  "requests": [
    {
      "appendDimension": {

  "sheetId": 521331261,
  "dimension": "ROWS",
  "length": 3

      }
    }
  ]
}
}`;

    http:ClientConnector client = create http:ClientConnector(serviceURL);
    message request = {};
    messages:setJsonPayload(request, payload);
    message response = {};
    response = http:ClientConnector.post(client, "/appendDimension", request);
    string responseCode = (string)http:getStatusCode(response);
    system:println("....................................Executing appendCellsBatchRequest..........................................");
    test:assertEquals(responseCode, "200");
}

function testUpdateBorderBatchRequest () {
    string serviceURL = test:startService("googleSpreadSheetService");
    json payload = `{
   "accessToken":"ya29.GltJBLmNig9AstnV4LBTT3YP6yhcwKOSRnPZ7eahyvcb35_DuAEXBgt0WjTSIhEtJ0Q_rVSiuecqCvAk2AnP25J-dwlbvap8NsKe50xECG892z37kzurA64hF29p",
   "refreshToken":"1/dn02o7wTCVflls99G50kFa57Gzyn79xU0RmZ9YO5dM8",
   "clientId":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
   "clientSecret":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
   "spreadSheetId":"16kweqosStZJi4TiWgLVS8qxlRdLdobIJLz0kEyrHXzA",
   "payloadToSend":{
      "requests":[
         {
            "updateBorders":{
               "range":{
                  "sheetId":521331261,
                  "startRowIndex":2,
                  "endRowIndex":10,
                  "startColumnIndex":2,
                  "endColumnIndex":4
               }
            }
         }
      ]
   }
}`;

    http:ClientConnector client = create http:ClientConnector(serviceURL);
    message request = {};
    messages:setJsonPayload(request, payload);
    message response = {};
    response = http:ClientConnector.post(client, "/updateBorder", request);
    string responseCode = (string)http:getStatusCode(response);
    system:println("....................................Executing updateBorderBatchRequest..........................................");
    test:assertEquals(responseCode, "200");
}

function testRepeatCellsBatchRequest () {
    string serviceURL = test:startService("googleSpreadSheetService");
    json payload = `{
    "accessToken":"ya29.GltJBLmNig9AstnV4LBTT3YP6yhcwKOSRnPZ7eahyvcb35_DuAEXBgt0WjTSIhEtJ0Q_rVSiuecqCvAk2AnP25J-dwlbvap8NsKe50xECG892z37kzurA64hF29p",
   "refreshToken":"1/dn02o7wTCVflls99G50kFa57Gzyn79xU0RmZ9YO5dM8",
   "clientId":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
   "clientSecret":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
   "spreadSheetId":"16kweqosStZJi4TiWgLVS8qxlRdLdobIJLz0kEyrHXzA",
   "payloadToSend":{
   "requests":[
      {
         "repeatCell":{
            "range":{
               "sheetId":521331261,
               "startRowIndex":0,
               "endRowIndex":1
            },
            "cell":{
               "userEnteredFormat":{
                  "backgroundColor":{
                     "red":0.0,
                     "green":0.0,
                     "blue":0.0
                  },
                  "horizontalAlignment":"CENTER",
                  "textFormat":{
                     "foregroundColor":{
                        "red":1.0,
                        "green":1.0,
                        "blue":1.0
                     },
                     "fontSize":12,
                     "bold":true
                  }
               }
            },
            "fields":"userEnteredFormat(backgroundColor,textFormat,horizontalAlignment)"
         }
      }
   ]
}
}`;

    http:ClientConnector client = create http:ClientConnector(serviceURL);
    message request = {};
    messages:setJsonPayload(request, payload);
    message response = {};
    response = http:ClientConnector.post(client, "/repeatCells", request);
    string responseCode = (string)http:getStatusCode(response);
    system:println("....................................Executing repeatCellsBatchRequest..........................................");
    test:assertEquals(responseCode, "200");
}

function testMergeCellsBatchRequest () {
    string serviceURL = test:startService("googleSpreadSheetService");
    json payload = `{
    "accessToken":"ya29.GltJBLmNig9AstnV4LBTT3YP6yhcwKOSRnPZ7eahyvcb35_DuAEXBgt0WjTSIhEtJ0Q_rVSiuecqCvAk2AnP25J-dwlbvap8NsKe50xECG892z37kzurA64hF29p",
   "refreshToken":"1/dn02o7wTCVflls99G50kFa57Gzyn79xU0RmZ9YO5dM8",
   "clientId":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
   "clientSecret":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
   "spreadSheetId":"16kweqosStZJi4TiWgLVS8qxlRdLdobIJLz0kEyrHXzA",
   "payloadToSend":{
   "requests":[
      {
         "mergeCells":{
            "range":{
               "sheetId":521331261,
               "startRowIndex":0,
               "endRowIndex":1,
               "startColumnIndex":0,
               "endColumnIndex":1
            },
            "mergeType":"MERGE_ALL"
         }
      }
   ]
}
}`;

    http:ClientConnector client = create http:ClientConnector(serviceURL);
    message request = {};
    messages:setJsonPayload(request, payload);
    message response = {};
    response = http:ClientConnector.post(client, "/mergeCells", request);
    string responseCode = (string)http:getStatusCode(response);
    system:println("....................................Executing mergeCellsBatchRequest..........................................");
    test:assertEquals(responseCode, "200");
}

function testSetDataValidationBatchRequest () {
    string serviceURL = test:startService("googleSpreadSheetService");
    json payload = `{
    "accessToken":"ya29.GltJBLmNig9AstnV4LBTT3YP6yhcwKOSRnPZ7eahyvcb35_DuAEXBgt0WjTSIhEtJ0Q_rVSiuecqCvAk2AnP25J-dwlbvap8NsKe50xECG892z37kzurA64hF29p",
   "refreshToken":"1/dn02o7wTCVflls99G50kFa57Gzyn79xU0RmZ9YO5dM8",
   "clientId":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
   "clientSecret":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
   "spreadSheetId":"16kweqosStZJi4TiWgLVS8qxlRdLdobIJLz0kEyrHXzA",
   "payloadToSend":{"requests": [
    {
      "setDataValidation": {
        "range": {
          "sheetId": 521331261,
          "startRowIndex": 0,
          "endRowIndex": 10,
          "startColumnIndex": 0,
          "endColumnIndex": 6
        },
        "rule": {
          "condition": {
            "type": "NUMBER_GREATER",
            "values": [
              {
                "userEnteredValue": "5"
              }
            ]
          },
          "inputMessage": "Value must be > 5",
          "strict": true
        }
      }
    }
  ]
}
}`;

    http:ClientConnector client = create http:ClientConnector(serviceURL);
    message request = {};
    messages:setJsonPayload(request, payload);
    message response = {};
    response = http:ClientConnector.post(client, "/setDataValidation", request);
    string responseCode = (string)http:getStatusCode(response);
    system:println("....................................Executing setDataValidationBatchRequest..........................................");
    test:assertEquals(responseCode, "200");
}

function testCopyPasteBatchRequest () {
    string serviceURL = test:startService("googleSpreadSheetService");
    json payload = `{
    "accessToken":"ya29.GltJBLmNig9AstnV4LBTT3YP6yhcwKOSRnPZ7eahyvcb35_DuAEXBgt0WjTSIhEtJ0Q_rVSiuecqCvAk2AnP25J-dwlbvap8NsKe50xECG892z37kzurA64hF29p",
   "refreshToken":"1/dn02o7wTCVflls99G50kFa57Gzyn79xU0RmZ9YO5dM8",
   "clientId":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
   "clientSecret":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
   "spreadSheetId":"16kweqosStZJi4TiWgLVS8qxlRdLdobIJLz0kEyrHXzA",
   "payloadToSend":{
   "requests":[
      {
         "copyPaste":{
            "source":{
               "sheetId":789,
               "startRowIndex":0,
               "endRowIndex":10,
               "startColumnIndex":0,
               "endColumnIndex":4
            },
            "destination":{
               "sheetId":521331261,
               "startRowIndex":0,
               "endRowIndex":10,
               "startColumnIndex":5,
               "endColumnIndex":9
            },
            "pasteType":"PASTE_FORMAT",
            "pasteOrientation":"NORMAL"
         }
      }
   ]
}
}`;

    http:ClientConnector client = create http:ClientConnector(serviceURL);
    message request = {};
    messages:setJsonPayload(request, payload);
    message response = {};
    response = http:ClientConnector.post(client, "/copyPaste", request);
    string responseCode = (string)http:getStatusCode(response);
    system:println("....................................Executing copyPasteBatchRequest..........................................");
    test:assertEquals(responseCode, "200");
}

function testCutPasteBatchRequest () {
    string serviceURL = test:startService("googleSpreadSheetService");
    json payload = `{
    "accessToken":"ya29.GltJBLmNig9AstnV4LBTT3YP6yhcwKOSRnPZ7eahyvcb35_DuAEXBgt0WjTSIhEtJ0Q_rVSiuecqCvAk2AnP25J-dwlbvap8NsKe50xECG892z37kzurA64hF29p",
   "refreshToken":"1/dn02o7wTCVflls99G50kFa57Gzyn79xU0RmZ9YO5dM8",
   "clientId":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
   "clientSecret":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
   "spreadSheetId":"16kweqosStZJi4TiWgLVS8qxlRdLdobIJLz0kEyrHXzA",
   "payloadToSend":{
   "requests":[
      {
         "cutPaste":{
            "source":{
               "sheetId":789,
               "startRowIndex":0,
               "endRowIndex":10,
               "startColumnIndex":0,
               "endColumnIndex":4
            },
            "destination":{
               "sheetId":521331261,
               "rowIndex":0,
               "columnIndex":5
            },
            "pasteType":"PASTE_NORMAL"
         }
      }
   ]
}
}`;

    http:ClientConnector client = create http:ClientConnector(serviceURL);
    message request = {};
    messages:setJsonPayload(request, payload);
    message response = {};
    response = http:ClientConnector.post(client, "/cutPaste", request);
    string responseCode = (string)http:getStatusCode(response);
    system:println("....................................Executing cutPasteBatchRequest..........................................");
    test:assertEquals(responseCode, "200");
}

function testUpdateConidtionalFormatRuleBatchRequest () {
    string serviceURL = test:startService("googleSpreadSheetService");
    json payload = `{
    "accessToken":"ya29.GltJBP-OJ9KoOmXIqV40JH9hzHmU3uv4_0D3nz7MErxjZOIm1HoFpEvhy7S7shZzsTEcQT7MPFt2NVrF9lQzetxIfh-y1bzB2LyOcAgLqkjAy76AyVmt8-rKtaH0",
   "refreshToken":"1/JkG5XiHNiJfSJ2JWC72QnfblEFh7UWrQ1OJeouMX_o0",
   "clientId":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
   "clientSecret":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
   "spreadSheetId":"16kweqosStZJi4TiWgLVS8qxlRdLdobIJLz0kEyrHXzA",
   "payloadToSend":{
   "requests":[
      {
         "updateConditionalFormatRule":{
            "sheetId":521331261,
            "index":1,
            "rule":{
               "ranges":[
                  {
                     "sheetId":521331261,
                     "startRowIndex":0,
                     "endRowIndex":5,
                     "startColumnIndex":0,
                     "endColumnIndex":4
                  }
               ],
               "booleanRule":{
                  "condition":{
                     "type":"TEXT_EQ",
                     "values":[
                        {
                           "userEnteredValue":"Total Cost"
                        }
                     ]
                  },
                  "format":{
                     "textFormat":{
                        "bold":true
                     }
                  }
               }
            }
         }
      }
   ]
}


}`;

    http:ClientConnector client = create http:ClientConnector(serviceURL);
    message request = {};
    messages:setJsonPayload(request, payload);
    message response = {};
    response = http:ClientConnector.post(client, "/updateConditionalFormat", request);
    string responseCode = (string)http:getStatusCode(response);
    system:println("....................................Executing updateConditionalFormatRuleBatchRequest..........................................");
    test:assertEquals(responseCode, "200");
}


function testAddConditionalFormatRuleBatchRequest () {
    string serviceURL = test:startService("googleSpreadSheetService");
    json payload = `{
    "accessToken":"ya29.GltJBP-OJ9KoOmXIqV40JH9hzHmU3uv4_0D3nz7MErxjZOIm1HoFpEvhy7S7shZzsTEcQT7MPFt2NVrF9lQzetxIfh-y1bzB2LyOcAgLqkjAy76AyVmt8-rKtaH0",
   "refreshToken":"1/JkG5XiHNiJfSJ2JWC72QnfblEFh7UWrQ1OJeouMX_o0",
   "clientId":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
   "clientSecret":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
   "spreadSheetId":"16kweqosStZJi4TiWgLVS8qxlRdLdobIJLz0kEyrHXzA",
   "payloadToSend":{
   "requests":[
      {
         "addConditionalFormatRule":{
            "rule":{
               "ranges":[
                  {
                     "sheetId":521331261,
                     "startRowIndex":9,
                     "endRowIndex":10
                  }
               ],
               "gradientRule":{
                  "minpoint":{
                     "color":{
                        "green":0.2,
                        "red":0.8
                     },
                     "type":"MIN"
                  },
                  "maxpoint":{
                     "color":{
                        "green":0.9
                     },
                     "type":"MAX"
                  }
               }
            },
            "index":0
         }
      }
   ]
}
}`;

    http:ClientConnector client = create http:ClientConnector(serviceURL);
    message request = {};
    messages:setJsonPayload(request, payload);
    message response = {};
    response = http:ClientConnector.post(client, "/addConditionalFormat", request);
    string responseCode = (string)http:getStatusCode(response);
    system:println("....................................Executing addConditionalFormatRuleBatchRequest..........................................");
    test:assertEquals(responseCode, "200");
}

function testDeleteConditionalFormatRuleBatchRequest () {
    string serviceURL = test:startService("googleSpreadSheetService");
    json payload = `{
    "accessToken":"ya29.GltJBP-OJ9KoOmXIqV40JH9hzHmU3uv4_0D3nz7MErxjZOIm1HoFpEvhy7S7shZzsTEcQT7MPFt2NVrF9lQzetxIfh-y1bzB2LyOcAgLqkjAy76AyVmt8-rKtaH0",
   "refreshToken":"1/JkG5XiHNiJfSJ2JWC72QnfblEFh7UWrQ1OJeouMX_o0",
   "clientId":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
   "clientSecret":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
   "spreadSheetId":"16kweqosStZJi4TiWgLVS8qxlRdLdobIJLz0kEyrHXzA",
   "payloadToSend":{"requests": [
    {
      "deleteConditionalFormatRule": {
        "sheetId": 521331261,
        "index": 0
      }
    }
  ]
}
}`;

    http:ClientConnector client = create http:ClientConnector(serviceURL);
    message request = {};
    messages:setJsonPayload(request, payload);
    message response = {};
    response = http:ClientConnector.post(client, "/deleteConditionalFormat", request);
    string responseCode = (string)http:getStatusCode(response);
    system:println("....................................Executing deleteConditionalFormatRuleBatchRequest..........................................");
    test:assertEquals(responseCode, "200");
}

function testUpdateDimensionPropertiesBatchRequest () {
    string serviceURL = test:startService("googleSpreadSheetService");
    json payload = `{
    "accessToken":"ya29.GltJBP-OJ9KoOmXIqV40JH9hzHmU3uv4_0D3nz7MErxjZOIm1HoFpEvhy7S7shZzsTEcQT7MPFt2NVrF9lQzetxIfh-y1bzB2LyOcAgLqkjAy76AyVmt8-rKtaH0",
   "refreshToken":"1/JkG5XiHNiJfSJ2JWC72QnfblEFh7UWrQ1OJeouMX_o0",
   "clientId":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
   "clientSecret":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
   "spreadSheetId":"16kweqosStZJi4TiWgLVS8qxlRdLdobIJLz0kEyrHXzA",
   "payloadToSend":{
   "requests":[
      {
         "updateDimensionProperties":{
            "range":{
               "sheetId":521331261,
               "dimension":"COLUMNS",
               "startIndex":0,
               "endIndex":1
            },
            "properties":{
               "pixelSize":160
            },
            "fields":"pixelSize"
         }
      }
   ]
}
}`;

    http:ClientConnector client = create http:ClientConnector(serviceURL);
    message request = {};
    messages:setJsonPayload(request, payload);
    message response = {};
    response = http:ClientConnector.post(client, "/updateDimensionProperties", request);
    string responseCode = (string)http:getStatusCode(response);
    system:println("....................................Executing updateDimensionPropertiesBatchRequest..........................................");
    test:assertEquals(responseCode, "200");
}

function testAutoResizeBatchRequest () {
    string serviceURL = test:startService("googleSpreadSheetService");
    json payload = `{
    "accessToken":"ya29.GltJBP-OJ9KoOmXIqV40JH9hzHmU3uv4_0D3nz7MErxjZOIm1HoFpEvhy7S7shZzsTEcQT7MPFt2NVrF9lQzetxIfh-y1bzB2LyOcAgLqkjAy76AyVmt8-rKtaH0",
   "refreshToken":"1/JkG5XiHNiJfSJ2JWC72QnfblEFh7UWrQ1OJeouMX_o0",
   "clientId":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
   "clientSecret":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
   "spreadSheetId":"16kweqosStZJi4TiWgLVS8qxlRdLdobIJLz0kEyrHXzA",
   "payloadToSend":{
   "requests":[
      {
         "autoResizeDimensions":{
            "dimensions":{
               "sheetId":521331261,
               "dimension":"COLUMNS",
               "startIndex":0,
               "endIndex":3
            }
         }
      }
   ]
}
}`;

    http:ClientConnector client = create http:ClientConnector(serviceURL);
    message request = {};
    messages:setJsonPayload(request, payload);
    message response = {};
    response = http:ClientConnector.post(client, "/autoResize", request);
    string responseCode = (string)http:getStatusCode(response);
    system:println("....................................Executing autoResizeBatchRequest..........................................");
    test:assertEquals(responseCode, "200");
}

function testInsertDimensionBatchRequest () {
    string serviceURL = test:startService("googleSpreadSheetService");
    json payload = `{
    "accessToken":"ya29.GltJBP-OJ9KoOmXIqV40JH9hzHmU3uv4_0D3nz7MErxjZOIm1HoFpEvhy7S7shZzsTEcQT7MPFt2NVrF9lQzetxIfh-y1bzB2LyOcAgLqkjAy76AyVmt8-rKtaH0",
   "refreshToken":"1/JkG5XiHNiJfSJ2JWC72QnfblEFh7UWrQ1OJeouMX_o0",
   "clientId":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
   "clientSecret":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
   "spreadSheetId":"16kweqosStZJi4TiWgLVS8qxlRdLdobIJLz0kEyrHXzA",
   "payloadToSend":{
   "requests":[
      {
         "insertDimension":{
            "range":{
               "sheetId":521331261,
               "dimension":"COLUMNS",
               "startIndex":2,
               "endIndex":4
            },
            "inheritFromBefore":true
         }
      }
   ]
}
}`;

    http:ClientConnector client = create http:ClientConnector(serviceURL);
    message request = {};
    messages:setJsonPayload(request, payload);
    message response = {};
    response = http:ClientConnector.post(client, "/insertDimension", request);
    string responseCode = (string)http:getStatusCode(response);
    system:println("....................................Executing insertDimensionBatchRequest..........................................");
    test:assertEquals(responseCode, "200");
}

function testMoveDimensionBatchRequest () {
    string serviceURL = test:startService("googleSpreadSheetService");
    json payload = `{
    "accessToken":"ya29.GltJBPD6EUfzYhARz0DVsHnobiEjMGwfhGTiULImX8E6bYz2dFn95ZyO2RzbkztJtvembdti-df8RnZGIPe1CyEvNfbmHZ_QOg_Vrm7gZHjFQK3Wlz1Bcb0aX2Le",
   "refreshToken":"1/OSrpfMaL6sMh7F6jLcEzPIkZ1lQDu_mTJSutl-8T1m4",
   "clientId":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
   "clientSecret":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
   "spreadSheetId":"16kweqosStZJi4TiWgLVS8qxlRdLdobIJLz0kEyrHXzA",
   "payloadToSend":{
   "requests":[
      {
         "moveDimension":{
            "source":{
               "sheetId":521331261,
               "dimension":"COLUMNS",
               "startIndex":0,
               "endIndex":1
            },
            "destinationIndex":3
         }
      }
   ]
}
}`;

    http:ClientConnector client = create http:ClientConnector(serviceURL);
    message request = {};
    messages:setJsonPayload(request, payload);
    message response = {};
    response = http:ClientConnector.post(client, "/moveDimension", request);
    string responseCode = (string)http:getStatusCode(response);
    system:println("....................................Executing moveDimensionBatchRequest..........................................");
    test:assertEquals(responseCode, "200");
}

function testSortRangeBatchRequest () {
    string serviceURL = test:startService("googleSpreadSheetService");
    json payload = `{
    "accessToken":"ya29.GltJBPD6EUfzYhARz0DVsHnobiEjMGwfhGTiULImX8E6bYz2dFn95ZyO2RzbkztJtvembdti-df8RnZGIPe1CyEvNfbmHZ_QOg_Vrm7gZHjFQK3Wlz1Bcb0aX2Le",
   "refreshToken":"1/OSrpfMaL6sMh7F6jLcEzPIkZ1lQDu_mTJSutl-8T1m4",
   "clientId":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
   "clientSecret":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
   "spreadSheetId":"16kweqosStZJi4TiWgLVS8qxlRdLdobIJLz0kEyrHXzA",
   "payloadToSend":{
   "requests":[
      {
         "sortRange":{
            "range":{
               "sheetId":521331261,
               "startRowIndex":0,
               "endRowIndex":10,
               "startColumnIndex":0,
               "endColumnIndex":6
            },
            "sortSpecs":[
               {
                  "dimensionIndex":1,
                  "sortOrder":"ASCENDING"
               },
               {
                  "dimensionIndex":3,
                  "sortOrder":"DESCENDING"
               },
               {
                  "dimensionIndex":4,
                  "sortOrder":"DESCENDING"
               }
            ]
         }
      }
   ]
}
}`;

    http:ClientConnector client = create http:ClientConnector(serviceURL);
    message request = {};
    messages:setJsonPayload(request, payload);
    message response = {};
    response = http:ClientConnector.post(client, "/sortRange", request);
    string responseCode = (string)http:getStatusCode(response);
    system:println("....................................Executing sortDimensionBatchRequest..........................................");
    test:assertEquals(responseCode, "200");
}


function testAddRowsColumnsDataRequest () {
    string serviceURL = test:startService("googleSpreadSheetService");
    json payload = `{
   "accessToken":"ya29.GltJBPD6EUfzYhARz0DVsHnobiEjMGwfhGTiULImX8E6bYz2dFn95ZyO2RzbkztJtvembdti-df8RnZGIPe1CyEvNfbmHZ_QOg_Vrm7gZHjFQK3Wlz1Bcb0aX2Le",
   "refreshToken":"1/OSrpfMaL6sMh7F6jLcEzPIkZ1lQDu_mTJSutl-8T1m4",
   "clientId":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
   "clientSecret":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
   "spreadSheetId":"16kweqosStZJi4TiWgLVS8qxlRdLdobIJLz0kEyrHXzA",
   "range":"Withdrawls!A1:B2",
   "insertDataOption":"INSERT_ROWS",
   "valueInputOption":"RAW",
   "payloadToSend":{
      "values":[
         [
            "20",
            "21"
         ],
         [
            "22",
            "23"
         ]
      ]
   }
}`;

    http:ClientConnector client = create http:ClientConnector(serviceURL);
    message request = {};
    messages:setJsonPayload(request, payload);
    message response = {};
    response = http:ClientConnector.post(client, "/addRowsColumnsData", request);
    string responseCode = (string)http:getStatusCode(response);
    system:println("....................................Executing addRowsColumnsDataRequest..........................................");
    test:assertEquals(responseCode, "200");
}





