#!/bin/bash -e

#http://www.apache.org/licenses/LICENSE-2.0.txt
#
#
#Copyright 2016 Intel Corporation
#
#Licensed under the Apache License, Version 2.0 (the "License");
#you may not use this file except in compliance with the License.
#You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
#Unless required by applicable law or agreed to in writing, software
#distributed under the License is distributed on an "AS IS" BASIS,
#WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#See the License for the specific language governing permissions and
#limitations under the License.

BUILDCMD='go build -a -ldflags "-w"'
FILEEXT=`go env GOEXE`
BUILDDIR=$1
PLUGIN=$2
PLUGINNAME=`echo $PLUGIN$FILEEXT | sed 's/.*\(snap-\)/\1/'`

echo "    $PLUGINNAME => $BUILDDIR"
$BUILDCMD -o $BUILDDIR/$PLUGINNAME $PLUGIN || exit 2
