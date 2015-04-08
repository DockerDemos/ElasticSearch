Elasticsearch Docker Image
==========================

[Docker](http://docker.io) image for running an [Elasticsearch](https://www.elastic.co/products/elasticsearch) instance.

__Building and Running__

1. `git clone https://github.com/DockerDemos/ElasticSearch`
2. `cd ElasticSearch`
3. `docker build -t elastic .  <-- note the period on the end`
4. `docker run -p 9200:9200 -d elastic`

You now have an Elasticsearch instance running, listening on port 9200.

__Testing__

Put some info in:

    curl -XPUT 'http://localhost:9200/twitter/user/kimchy' -d '{ "name" : "Shay Banon" }'

Get it back out:

    curl -XGET 'http://localhost:9200/twitter/user/kimchy?pretty=true'

Enjoy!

##Copyright Information##

Elasticsearch is Copyright 2015 Elasticsearch

The DockerDemos/ElasticSearch code here is:
 
Copyright (C) 2014-2015 Chris Collins

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program. If not, see http://www.gnu.org/licenses/.






