#!/bin/bash

set -e
set -x


test_start () {
    # Test the container starts, and responds to external output
    curl -XGET 'http://localhost:9200/twitter/tweet/1' | grep "trying out Elasticsearch"
}

test_put () {
    # Test that data can be put into the Elastic DB
    curl -XPUT 'http://localhost:9200/twitter/tweet/1' -d '{
               "user" : "kimchy",
               "post_date" : "2009-11-15T14:12:12",
               "message" : "trying out Elasticsearch"
    }'
}

test_get () {
    # Test that the data can be retrieved
     curl -XGET 'http://localhost:9200/twitter/tweet/1' |grep "trying out Elasticsearch"
}

create_container () {
    local testdir="$1"
    local container=$(docker run -p 9200:9200 \
                                 -v ${testdir}:/var/lib/elasticsearch \
                                 -e ELASTIC_CONFIG_NETWORK_HOST="0.0.0.0" \
                                 --name elastic \
                                 -d elastic)

    echo $contaienr

}

main () {
    local testdir=$(pwd/tmp)

    local container=$(create_container)
    test_start || return 1
    test_put   || return 1
    test_get   || return 1

    # Test out persistence
    docker stop $container
    docker rm $container

    local container=$(create_container)
    # This should still be here
    test_get   || return 1

}

main "$@"
