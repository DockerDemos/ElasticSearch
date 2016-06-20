Elasticsearch Docker Image
==========================

[Docker](http://docker.io) image for running an [Elasticsearch](https://www.elastic.co/products/elasticsearch) instance.

__Building and Running__

1. `git clone https://github.com/DockerDemos/ElasticSearch`
2. `cd ElasticSearch`
3. `docker build -t elastic .  <-- note the period on the end`
4. `docker run -p 9200:9200 \
               -v <host_data_storage_path>:/var/lib/elasticsearch \
	       -e ELASTIC_CONFIG_NETWORK_HOST=<address to bind to> \
	       --name elastic \
	       -d elastic`

The "host\_data\_storage\_path" is the directory on the host in which you will store the persistent data, and the "ELASTIC\_CONFIG\_NETWORK\_HOST" variable is the address you want ElasticSearch to listen for connections on \(usually 0.0.0.0, or 127.0.0.1, depending on if it will be a stand-alone, or linked container instance\). The ELASTIC\_CONFIG\_NETWORK\_HOST will default to 127.0.0.1 if nothing is specified.

You now have an Elasticsearch instance running, listening on port 9200.

__Testing__

Put some info in:

    curl -XPUT 'http://localhost:9200/twitter/user/kimchy' -d '{ "name" : "Shay Banon" }'

Get it back out:

    curl -XGET 'http://localhost:9200/twitter/user/kimchy?pretty=true'

