#!/bin/bash
set -x
module_input_directory=../jboss-eap-6.3/modules
module_output_directory=module/org/hornetq/server
module_output_file=$module_output_directory/module.xml
module_definition="<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<module xmlns=\"urn:jboss:module:1.3\" name=\"org.hornetq.server\">
    <resources>
"
footer="
    </resources>
    <dependencies>
        <module name=\"javax.api\"/>
        <module name=\"javax.jms.api\" />
        <module name=\"javax.resource.api\"/>
        <module name=\"io.netty\"/>
        <module name=\"org.jboss.logging\"/>
        <module name=\"org.jgroups\"/>
    </dependencies>
</module>"
template="        <resource-root path=\"PLACEHOLDER\"/>\n"
files=`find $module_input_directory \
-name "hornetq-commons-*.jar" \
-o -name "hornetq-server-*.jar" \
-o -name "hornetq-core-client-*.jar" \
-o -name "hornetq-jms-client-*.jar" \
-o -name "hornetq-jms-server-*.jar" \
-o -name "jboss-remote-naming-*.jar" \
-o -name "jboss-ejb-client-*.jar" \
-o -name "jboss-remoting-*.jar" \
-o -name "jboss-marshalling-*.jar" \
-o -name "jboss-sasl-*.jar" \
-o -name "jboss-marshalling-river-*.jar" \
-o -name "xnio-api-*.jar" \
-o -name "xnio-nio-*.jar" \
-o -name "netty-*.jar"`

mkdir -p $module_output_directory
rm -rf $module_output_directory/*
printf "$module_definition" >> $module_output_file

for path in $files;
do
  cp "$path" $module_output_directory
  filename=${path##*/}
  printf "${template/PLACEHOLDER/$filename}" >> $module_output_file
done

printf "$footer" >> $module_output_file
