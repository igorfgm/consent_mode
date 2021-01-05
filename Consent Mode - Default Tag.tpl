___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Consent Mode - Default Tag",
  "brand": {
    "id": "brand_dummy",
    "displayName": ""
  },
  "description": "",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "SELECT",
    "name": "adsConsent",
    "displayName": "Advertising Storage:",
    "macrosInSelect": false,
    "selectItems": [
      {
        "value": "granted",
        "displayValue": "Granted"
      },
      {
        "value": "denied",
        "displayValue": "Denied"
      }
    ],
    "simpleValueType": true,
    "help": "Select if you want to allow Google to collect advertising cookies when the Default Tag loads",
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "alwaysInSummary": true,
    "defaultValue": "denied"
  },
  {
    "type": "SELECT",
    "name": "analyticsConsent",
    "displayName": "Analytics Storage:",
    "macrosInSelect": false,
    "selectItems": [
      {
        "value": "granted",
        "displayValue": "Granted"
      },
      {
        "value": "denied",
        "displayValue": "Denied"
      }
    ],
    "simpleValueType": true,
    "help": "Select if you want to allow Google to collect analytics cookies when the Default Tag loads",
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "alwaysInSummary": true,
    "defaultValue": "denied"
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const createArgumentsQueue = require('createArgumentsQueue');
const createQueue = require('createQueue');
const makeTableMap = require('makeTableMap');

const gtag = createArgumentsQueue('gtag', 'dataLayer');

const dataLayerPush = createQueue('dataLayer');

    const settingObject = {
      ad_storage: data.adsConsent,
      analytics_storage: data.analyticsConsent
    };    
    gtag('consent', 'default', settingObject);

    dataLayerPush({'event': 'default_consent'});
        
//Call data.gtmOnSuccess when the tag is finished.
data.gtmOnSuccess();


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "gtag"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "dataLayer"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios:
- name: Untitled test 1
  code: |-
    const mockData = {
      // Mocked field values
    };

    // Call runCode to run the template's code.
    runCode(mockData);

    // Verify that the tag finished successfully.
    assertApi('gtmOnSuccess').wasCalled();
setup: ''


___NOTES___

Created on 1/5/2021, 1:34:07 PM


