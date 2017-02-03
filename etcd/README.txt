Description
===========
This is etcd connector with the following actions. And the actions are being invoked in a ballerina main function.


    * setKeyValue : Store key/value pair
    * getValue    : Get the value for given key
    * updateValue : Update the value for given key
    * deleteKey   : Delete the key
    * createDir   : Create a directory
    * listDir     : List directory (recursive lising also supported)
    * deleteDir   : Delete directory (recoursive delete also supported)

Prerequisites
=============
1. Setup ectd

docker run -p 2379:2379 --name etcd quay.io/coreos/etcd:v3.0.0 /usr/local/bin/etcd -advertise-client-urls http://0.0.0.0:2379 -listen-client-urls http://0.0.0.0:2379

How to run this sample
======================

1. Place the etcd connector in  {BALLERINA_HOME}/connectors.
2. Update the main function with the relevant configuration given bellow with each action and run the command.

connectors:etcd etcdConnector = new connectors:etcd("http://127.0.0.1:2379", "root", "test123", "v2");
# etcd Server URL = "http://127.0.0.1:2379"
# etcd user = "root"
# etcd password = "test123"
# etcd API version = "v2"

Commands to trigger actions: 

# setKeyValue	
./bin/ballerina run connectors/etcd/etcd.bal setKeyValue <key> <value>

# getValue
./bin/ballerina run connectors/etcd/etcd.bal getValue <key>

# updateValue
./bin/ballerina run connectors/etcd/etcd.bal updateValue <key> <value>

# deleteKey
./bin/ballerina run connectors/etcd/etcd.bal deleteKey <key>

#createDir
./bin/ballerina run connectors/etcd/etcd.bal createDir <dir>

#listDir
./bin/ballerina run connectors/etcd/etcd.bal listDir <dir> [recuresive=true]

# deleteDir
./bin/ballerina run connectors/etcd/etcd.bal deleteDir <dir> [recursive=true]
