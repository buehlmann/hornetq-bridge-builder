# HornetQ Bridge Builder
Helper to build a Wildfly/JBoss EAP module with all required dependencies in
the versions used by the application server modules under the provided path
`$module_input_directory`.


## Usage
Configure `module_input_directory` in the script to the modules directory of the
JBoss EAP 6.x instance used. Tested only with JBoss EAP 6.3.

```
$ ./build-hornetq-module.sh
```


The generated module will be created per default in the subdirectory `modules`
in the same directory the script was executed.


## References
* https://access.redhat.com/solutions/2998571
* https://access.redhat.com/documentation/en-us/red_hat_jboss_enterprise_application_platform/7.1/html-single/configuring_messaging/#configuring_jms_bridges
