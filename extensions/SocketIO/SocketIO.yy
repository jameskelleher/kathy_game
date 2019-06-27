{
    "id": "9f5f87eb-9266-4b29-8d93-5935e52680d5",
    "modelName": "GMExtension",
    "mvc": "1.0",
    "name": "SocketIO",
    "IncludedResources": [
        
    ],
    "androidPermissions": [
        
    ],
    "androidProps": false,
    "androidactivityinject": "",
    "androidclassname": "",
    "androidinject": "",
    "androidmanifestinject": "",
    "androidsourcedir": "",
    "author": "",
    "classname": "",
    "copyToTargets": 32,
    "date": "2019-23-04 02:02:07",
    "description": "",
    "extensionName": "",
    "files": [
        {
            "id": "4f50be56-489f-4dd2-a6cc-20f99898d5da",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                
            ],
            "copyToTargets": 32,
            "filename": "gms2_socket.io.js",
            "final": "sio_disconnect",
            "functions": [
                {
                    "id": "9e245a62-bf2d-4f60-be1d-83bbc213f117",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1,
                        2
                    ],
                    "externalName": "sio_connect",
                    "help": "sio_connect(ip:string, port:int)",
                    "hidden": false,
                    "kind": 5,
                    "name": "sio_connect",
                    "returnType": 2
                },
                {
                    "id": "9e4f9d56-c27b-4d4c-96fe-ff47d6c3dad7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sio_disconnect",
                    "help": "sio_disconnect()",
                    "hidden": false,
                    "kind": 5,
                    "name": "sio_disconnect",
                    "returnType": 2
                },
                {
                    "id": "a3344919-3cc9-43df-9387-e81ef940da4c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sio_reconnect",
                    "help": "sio_reconnect()",
                    "hidden": false,
                    "kind": 5,
                    "name": "sio_reconnect",
                    "returnType": 2
                },
                {
                    "id": "1f4733aa-d6ab-4d1c-b7d2-d706df75fc03",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "sio_addEvent",
                    "help": "sio_addEvent(eventName)",
                    "hidden": false,
                    "kind": 5,
                    "name": "sio_addEvent",
                    "returnType": 1
                },
                {
                    "id": "3e515d5b-f37d-4429-8eb0-42c638111468",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1,
                        1
                    ],
                    "externalName": "sio_emit",
                    "help": "sio_emit(eventName, data)",
                    "hidden": false,
                    "kind": 5,
                    "name": "sio_emit",
                    "returnType": 2
                },
                {
                    "id": "2e533290-b70e-4eee-9a7b-d4aef2e8836a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sio_get_connection_status",
                    "help": "sio_get_connection_status()",
                    "hidden": false,
                    "kind": 5,
                    "name": "sio_get_connection_status",
                    "returnType": 2
                }
            ],
            "init": "",
            "kind": 5,
            "order": [
                "9e245a62-bf2d-4f60-be1d-83bbc213f117",
                "9e4f9d56-c27b-4d4c-96fe-ff47d6c3dad7",
                "a3344919-3cc9-43df-9387-e81ef940da4c",
                "1f4733aa-d6ab-4d1c-b7d2-d706df75fc03",
                "3e515d5b-f37d-4429-8eb0-42c638111468",
                "2e533290-b70e-4eee-9a7b-d4aef2e8836a"
            ],
            "origname": "",
            "uncompress": false
        },
        {
            "id": "29273d6d-b1dc-466d-9d61-693b59794250",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                
            ],
            "copyToTargets": 32,
            "filename": "socket.io.js",
            "final": "",
            "functions": [
                
            ],
            "init": "",
            "kind": 5,
            "order": [
                
            ],
            "origname": "",
            "uncompress": false
        }
    ],
    "gradleinject": "",
    "helpfile": "",
    "installdir": "",
    "iosProps": false,
    "iosSystemFrameworkEntries": [
        
    ],
    "iosThirdPartyFrameworkEntries": [
        
    ],
    "iosdelegatename": null,
    "iosplistinject": "",
    "license": "",
    "maccompilerflags": "",
    "maclinkerflags": "",
    "macsourcedir": "",
    "packageID": "",
    "productID": "",
    "sourcedir": "",
    "tvosProps": false,
    "tvosSystemFrameworkEntries": [
        
    ],
    "tvosThirdPartyFrameworkEntries": [
        
    ],
    "tvosclassname": "",
    "tvosdelegatename": null,
    "tvosmaccompilerflags": "",
    "tvosmaclinkerflags": "",
    "tvosplistinject": "",
    "version": "1.0.0"
}