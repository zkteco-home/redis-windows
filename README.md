
# This is an unofficial version of Redis for Windows X64 system<!-- [zkteco-home](https://github.com/zkteco-home/redis-windows)-->


If you want to get latest version or [report any issues],please contact [michael](michael_zkteco@126.com), thanks in advance!

## Why not open source code?

1. It is very complicated to work on the windows edition

2. We have a professional team to maintain its stable operation

3. We can collect all the issues, because you don't have the source code, to avoid changing the source code by yourself and not being able to share

4. according to Redis BSD-3,it is legal

It includes several new user-facing features, significant performance
optimizations, and many other improvements. It also includes changes that
potentially break backwards compatibility with older versions. We urge users to
review the release notes carefully before upgrading.

In particular, users should be aware of the following changes:

1. It stores AOF as multiple files in a folder; see Multi-Part AOF below.
	(automatically migrated an old-style AOF file (appendonly.aof) into the AOF directory (appendonlydir))
	
2. It uses a new version 10 format for RDB files, which is incompatible
	with older versions.

3. It converts ziplist encoded keys to listpacks on the fly when loading
	an older RDB format. Conversion applies to loading a file from disk or
	replicating from a Redis master and will slightly increase loading time.

Here is a comprehensive list of changes in this release compared to 6.2.6.
https://github.com/redis/redis/releases/tag/7.0-rc1



If you want to know more, this is a list of selected starting points:

Redis 7.0 release Notes . https://github.com/redis/redis/releases/tag/7.0-rc1

Introduction to Redis data types. https://redis.io/topics/data-types-intro

Try Redis directly inside your browser. https://try.redis.io

The full list of Redis commands. https://redis.io/commands

There is much more inside the official Redis documentation. https://redis.io/documentation

## DISCLAIMER

This release is based on [Redis](https://github.com/redis/redis). It has passed all the standard tests.

Due to the many functional differences between windows and linux,There are still unknown issues/bugs, in particular there is a bug to work properly in certain scenarios.
If you download and install it, you accept the following agreement by default：

NO LIABILITY FOR DAMAGES

In no event shall the author of this Software be liable for any damages whatsoever (including, without limitation, damages for loss of business profits, business interruption, loss of business information, or any other pecuniary loss) arising out of the use of or inability to use this product, even if the Author of this Software has been advised of the possibility of such damages.


## Building from source code on Windows

  - Redis binaries are built with the original source [Redis](https://github.com/redis/redis) and have been compiled with Visual Studio 2022 to obtain higher performance and better stability than the binaries built by Cygwin, MSYS, or even WSL2.

  - Redis can be installed as a Windows Service.
  
## Supported Windows Versions

- Windows Vista x64
- Windows Server 2008 x64
- Windows Server 2012 x64
- Windows Server 2016/2019 x64  
- Windows 7 x64
- Windows 10/11 x64


## Default configrations

	save ""
	
	maxmemory 256mb
	
	appendonly no
	
	maxmemory-policy allkeys-lru

- if you want to modify parameters,it is recommanded you edit the redis.conf file


## Running Redis as a Service

-   Self elevation of the Redis executable so that service commands would work from a non-elevated command prompt.

-   Service naming so that multiple instances of the Redis service could be installed on one machine.

-   Automatically adjusting folder permissions so that when Redis is run under the NETWORK SERVICE account it could modify the files in the installation directory.



### Run install_redis.cmd as Administrator  (recommanded)

you also can use the following command and manage redis service:


Installing the Service
------------------------

*--service-install*

This must be the first argument on the redis-server command line. Arguments after this are passed in the order they occur to Redis when the service is launched. The service will be configured as Autostart and will be launched as "NT AUTHORITY\\NetworkService". Upon successful installation a success message will be displayed and Redis will exit.

This command does not start the service.

For instance:

redis-server --service-install redis.conf --loglevel verbose

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


Sentinel for Redis Server on Windows
------------------------------------
 

After you have edited and created the necessary configuration files,you must open the necessary firewall port. you can install Redis Sentinel from the command prompt as follows:


redis-server --service-install --service-name Sentinel sentinel.conf --sentinel


  
