#GsDevKit Client Installation

These instructions describe installing the GsDevKit tODE client on a desktop machine, on a different node than the GsDevKit server (stone) will be running.  You should first [install the GsDevKit server][1], on the node you will use as the server. To complete this client installation, You will need a file from the servers installation.  For the complete set of steps, including OS configuration requirements, see the [instructions to install on separate server and client][2]

Clients may be installed on **Linux**, **Mac** or **Windows**. 

##Install Client

The following steps are involved in installing the GsDevKit client. For an example script to execute, see [Install GsDevKit client on Linux or Mac](#script-to-install-client) or [Install GsDevKit client on Windows](#script-to-install-client-on-windows)

1. Determine your installation directory and clone GsDevKit_home to that location

   The following instructions clone the Development Kit to the current directory, so before starting, cd to the directory in which you want the GsDevKit checkout to be located.  On Windows, it is recommended to install in the root of the user's home directory (`cd ~`), to avoid [path length restrictions][3].
   
   You must use bash or, on Windows, the Git Shell executable provided by the GitHub desktop.

   ```
   cd <githubdirectory>
   git clone https://github.com/GsDevKit/GsDevKit_home.git
   cd GsDevKit_home
   ```

2. Perform the git checkout and branch
   ```
   git checkout -b gsdevkit
   ```

3. Set the environment

   The environment variable $GS_HOME and the updated $PATH are required to use DevKit, so you should add them to your `.bashrc` or another initialization script.
   ```
   export GS_HOME=`pwd`
   export PATH=$GS_HOME/bin:$PATH
   ```

4. Perform the Client installation
   
    The installation is performed by a GsDevKit script.  This script takes care of cloning the required projects to your client node and creating a client with the selected name.  

   you will need to know the version of the GsDevKit stone on your server.

   Script to install the client:
   ```
   $GS_HOME/bin/installClient <myGemStoneVersion> <myClientName>
   ```
   You may use any name for `<myClientName>`, and note that you may later have multiple clients. The examples below use  **tode** as the client name.

   The install scripts invokes the following sub-scripts:
   ```
   downloadGemStone
   cloneSharedTodeProjects
   createClient 
   ```

## Script to Install Client on Linux or Mac

This script installs the GsDevKit client components and creates a client with the name **tode**.

 ```
cd <githubdirectory>

git clone https://github.com/GsDevKit/GsDevKit_home.git
cd GsDevKit_home
git checkout -b gsdevkit
export GS_HOME=`pwd`
export PATH=$GS_HOME/bin:$PATH
$GS_HOME/bin/installClient -c https 3.2.9 tode
 ```

## Script to Install Client on Windows

This script installs the GsDevKit client components and creates a client with the name **tode**.


 ```
cd ~
git clone https://github.com/GsDevKit/GsDevKit_home.git
cd gsDevKit_home
git checkout -b gsdevkit
export GS_HOME=`pwd`
export PATH=$GS_HOME/bin:$PATH
git config --global core.longpaths true   
$GS_HOME/bin/installClient -c https 3.2.9 tode

 ```
You now have an instance of the tODE client installed on your client machine, with the name **tode** (if you used the sequence as entered here).  

## Determine port number for connection

To establish the connection between the client and the server, a server process called the NetLDI listens on a well-known port, and the client must be configured to contact the server on  this port.  If the server and client  machines are not on the same local network, you will also need to setup SSH port forwarding for this port.

it is recommended, but not required, to assign a reserved port number to a named NetLDI by adding an entry to the network services database, which may be /etc/services.  For example,
```
devKit_329_ldi          50378/tcp        # Gemstone netldi
```

To setup SSH port forwarding, 

```
ssh -L 50378:hostNameOrIp user@example.com
```


#Client setup

1. Edit your `.bashrc`, or create another intializations file, that includes the lines:

   ```
   export GS_HOME=`pwd`
   export PATH=$GS_HOME/bin:$PATH
   ```

   these  will be needed to use tODE.

2.  From the server installation, copy the file

   `$GS_HOME/shared/tode/sys/local/client`

   to the same path on the client node.

3.  Start your client

   ```
   startClient tode 
   ```

   for further details on using tode, see [Getting started with tODE][4]







[1]: ./installDevKitServer.md
[2]: ./README.md#installation-on-separate-server-and-client
[3]:  https://github.com/git-for-windows/git/wiki/Git-cannot-create-a-file-or-directory-with-a-long-path
[4]: ../gettingStartedWithTode.md



