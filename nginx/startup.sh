#!/bin/bash

service nginx start
fluentd -c fluentd.conf
