# Redis 6.2.4 for Windows

- It is an unofficial version of Redis for Windows (latest is 6.2.4)
- We unofficially support the 64-bit version only. Although you can build the 32-bit version from source if desired.
- You can find the release of **Redis 6.2.4 for Windows** on [releases page](https://github.com/zkteco_india/redis/releases). Please test it and [report any issues](https://github.com/zkteco_india/redis/wiki/Submitting-an-Issue), thanks in advance!


## DISCLAIMER

This release is based on [Redis](https://github.com/redis/redis). It has passed all the standard tests but it hasn't been tested in a production environment.

Therefore, before considering using this release in production, make sure to test it thoroughly in your own test environment.

Due to the many functional differences between windows and liunx,There are still unknown issues/bugs, in particular there is a bug to work properly in certain scenarios. This release SHOULD NOT be used in production.
If you download and install it, you accept the following agreement by default：

NO LIABILITY FOR DAMAGES.
In no event shall the author of this Software be liable for any damages whatsoever (including, without limitation, damages for loss of business profits, business interruption, loss of business information, or any other pecuniary loss) arising out of the use of or inability to use this product, even if the Author of this Software has been advised of the possibility of such damages.


## Building from source code on Windows

  - Redis binaries are built with the original source [Redis](https://github.com/redis/redis) and have been compiled with free Visual Studio 2019 (VC16,Community Edition, version 16.2.5) to obtain higher performance and better stability than the binaries built by MSYS
  - Redis can be installed as a Windows Service.
  
## Supported Windows Versions

- Windows Vista x64
- Windows Server 2008 x64
- Windows Server 2012 x64
- Windows Server 2016 x64  
- Windows 7 x64
- Windows 10 x64

## Windows-specific changes

Default port is 6388
save ""

if you want to modify parameters,it is recommanded you edit the local.conf file


## Running Redis as a Service

Run install_redis.cmd as Administrator

you also can use the following command and manage redis service:

*--service-install*

This must be the first argument on the redis-server command line. Arguments after this are passed in the order they occur to Redis when the service is launched. The service will be configured as Autostart and will be launched as "NT AUTHORITY\\NetworkService". Upon successful installation a success message will be displayed and Redis will exit.

This command does not start the service.

For instance:

redis-server --service-install redis.windows.conf --loglevel verbose

Uninstalling the Service
------------------------

*--service-uninstall*

This will remove the Redis service configuration information from the registry. Upon successful uninstallation a success message will be displayed and Redis will exit.

This does command not stop the service.

For instance:

redis-server --service-uninstall

Starting the Service
--------------------

*--service-start*

This will start the Redis service. Upon successful start, a success message will be displayed and Redis will begin running.

For instance:

redis-server --service-start

Stopping the Service
--------------------

*--service-stop*

This will stop the Redis service. Upon successful termination a success message will be displayed and Redis will exit.

For instance:

redis-server --service-stop

Naming the Service
------------------

*--service-name **name***

This optional argument may be used with any of the preceding commands to set the name of the installed service. This argument should follow the service-install, service-start, service-stop or service-uninstall commands, and precede any arguments to be passed to Redis via the service-install command.

The following would install and start three separate instances of Redis as a service:

redis-server --service-install --service-name redisService1 redis.conf

redis-server --service-start --service-name redisService1

The following would stop and uninstall three separate instances of Redis as a service:

redis-server --service-stop --service-name redisService1
redis-server --service-uninstall --service-name redisService1

  