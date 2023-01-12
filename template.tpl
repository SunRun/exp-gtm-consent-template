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
  "displayName": "Sunrun Consent Manager",
  "categories": ["TAG_MANAGEMENT"],
  "brand": {
    "id": "github.com_Sunrun",
    "displayName": "Sunrun",
    "thumbnail": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGAAAABeCAMAAADrNuHXAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAk1BMVEX////v9vnN1t+6xdKirb2Wv8WM28iq5Ne56N7M7uf8/v98iZxCW3sdNFQAGj0AW2AAsIUWt483wKBz07zp7vCXo7QGIENecYpPyKs8T2z2+vxufpReyrktQmCGma9UZHy0usQRKEnf4eaNl6cAobIASpEAh/9csf92vf+Qyv+23P/T6v8qmv8Tj//i8f9Epv9ch7NdJ1LCAAAAAWJLR0QAiAUdSAAAAAd0SU1FB+YMHREdDfdz6ZoAAALoSURBVGje7Zlrc6IwFIa5rVqQNFouCqUIbFewYvf//7oFXWcNJTknJJ3ZD7xfOqMz79NzyUlMDGPWrFkyMi3bcX4slqsn09XubXtrn/R6pr0225elqc09CNcRuesGuGq7CHTY2/E/dxbQabdSTZa9J6xYQBfGUgVhrQkBAB3iaap9kkYEAaD0dVK9XSsjBAegm9UEQBgRNIDShWwlkpQQGQDdJXL+ayIJoFuZQvD9+QAZgsBfAKBbdJZiMglAd8hKv5GJAPqC8rejyQC6RPgHPpkO2CDma0wUAHQHJ4goAcAkuZkiYAP0akgUAXQhDsBXBohDcCB/GCAMwd1rAGwE69kC/REAKth9Ui2AVz4ALDEKwC8zIkMYAD9Hb5oA3KGaD938PE1zXxqwRZbAP9w+tjNJAOU0asD6F+X9C9OXBHDOeoNBmnbIeL9PS2ZAoQCckTqYE45heP3fiNkhUADOtKhYQDW6e6IA423keqzVvi+Ll00BcNbycFBU10/LypcGjG+c7hAQ5bc+Sh6L8PwTIWQEfZrCK+Nhir//QuiIBnRal0x/qQAGXUT+5n7NrBAUoB4HDDb8PPGuXeoZxkES0GBWctZN9eAQhpbBTEEU4DQOKNkIwtHQUICPcYBbDFrI6U+aic1McRSAt+1/PVMU/nAXxQDOHH/DI7AwgJoHgA6+WMCJB0gKPQD+4THWAjhy/R8XlALgxAfAh2sEoBX91qw0AGqBvxGAZQYB7UUEgJcCCBAGgAgBArTQjQX0Iw0CNIA/+CMHAJzh6worUgF8gP5Qq4oBYIKuyicDjih/w8wmAs7YGynRhYsAcL4g/Q239CcAWrR/Jz7hXf3/vxEySYCkf1fpXApwlLuXvaqK8ABc/w81ejs+BvjErN8xuVWBALSNwhNF8OUJYQhoa8XHosArBIBzo+EtKnHyaBTQHk+63tPMQ5pFDKD9rLW53wOxnCqN89913TSni/anwAd9p/esWbP+T/0B3TlqDR6BwlEAAAAldEVYdGRhdGU6Y3JlYXRlADIwMjItMTItMjlUMTc6Mjk6MTIrMDA6MDAlaGhOAAAAJXRFWHRkYXRlOm1vZGlmeQAyMDIyLTEyLTI5VDE3OjI5OjEyKzAwOjAwVDXQ8gAAACh0RVh0ZGF0ZTp0aW1lc3RhbXAAMjAyMi0xMi0yOVQxNzoyOToxMyswMDowMKVX+pkAAAAASUVORK5CYII\u003d"
  },
  "description": "Sunrun Consent Manager allows to be compliant with the GDPR and consumer data regulations",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "privacyPolicyUrl",
    "simpleValueType": true,
    "defaultValue": "https://www.sunrun.com/privacy-policy",
    "help": "Link to privacy policy page",
    "valueValidators": [
      {
        "type": "REGEX",
        "args": [
          "https?:\\/\\/(www\\.)?[-a-zA-Z0-9@:%._\\+~#\u003d]{1,256}\\.[a-zA-Z0-9()]{1,6}\\b([-a-zA-Z0-9()@:%_\\+.~#?\u0026//\u003d]*)"
        ]
      }
    ],
    "displayName": "Privacy Policy URL"
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

// Enter your template code here.
const queryPermission = require('queryPermission');
const encodeUriComponent = require('encodeUriComponent');
const injectScript = require('injectScript');
const setDefaultConsentState = require('setDefaultConsentState');
const updateConsentState = require('updateConsentState');
const callInWindow = require('callInWindow');
const scriptUrl = 'https://devmaj-exp.sunrundev.com/consent-script.js';

const onUserConsentUpdate = (consentData) => {
  const consentModeStates  = {
    ad_storage: consentData.ad_storage || 'denied',
    analytics_storage: consentData.analytics_storage || 'denied',
  };
  updateConsentState(consentModeStates);
};

//set default consent denied
setDefaultConsentState({
  ad_storage:'denied',
  analytics_storage: 'denied',
});

if (queryPermission('inject_script', scriptUrl)) {
  const fullScriptUrl = scriptUrl + '?privacy-policy-url=' + encodeUriComponent(data.privacyPolicyUrl);
  injectScript(fullScriptUrl,  () => {
    /* Call function that adds consent update listeners with provided function param. */
    callInWindow('addUserConsentUpdateListener', onUserConsentUpdate);
    data.gtmOnSuccess();
  }, data.gtmOnFailure);
} else {
  data.gtmOnFailure();
}


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://*.sunrun.com/*"
              },
              {
                "type": 1,
                "string": "https://*.sunrundev.com/*"
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
  },
  {
    "instance": {
      "key": {
        "publicId": "access_consent",
        "versionId": "1"
      },
      "param": [
        {
          "key": "consentTypes",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "ad_storage"
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
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "analytics_storage"
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
  },
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
                    "string": "addUserConsentUpdateListener"
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": false
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

scenarios: []


___NOTES___

Created on 1/9/2023, 1:28:34 PM


