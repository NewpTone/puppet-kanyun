#!/usr/bin/python
# Copyright (c) 2011-2012 Sina, SWS.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
# implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#This script is used to Initialize cassadra database.
import sys
import os

try:
    pycassa = __import__("pycassa")
except Exception, e:
    os.system('sudo pip install pycassa')

print "begin init kanyun db..."
try:
    pool = pycassa.pool.ConnectionPool('data')
    print "[ERROR] database for kanyun already exists"
    exit()
except Exception, e:
    print "create keyspace data" 
    pysys = pycassa.system_manager.SystemManager('127.0.0.1:9160')
    pysys.create_keyspace('data', 
                        pycassa.system_manager.NETWORK_TOPOLOGY_STRATEGY, 
                        {'datacenter1': '1'})
    columns = ('vmnetwork', 'cpu', 'mem_max', 'mem_free', 'nic_incoming', 
                'nic_outgoing', 'blk_read', 'blk_write')
    for column_name in columns:
        print "create columns", column_name
        pysys.create_column_family('data', column_name, super=True, 
                        comparator_type='AsciiType',
                        subcomparator_type='IntegerType',
                        default_validation_class='AsciiType',
                        key_validation_class='BytesType'
                        )
    
