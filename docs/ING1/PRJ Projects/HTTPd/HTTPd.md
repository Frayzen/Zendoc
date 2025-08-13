---
title: HTTPd
Owner: "Florian "
---
# Usage

> [!important] ./httpd [--dry-run] [-a (start | stop | reload | restart)] server.conf
If the arguments does not follow this usage or if any argument is invalid your binary must return 1 and output an error on stderr.  
If the option -a is not given, the binary must run the server without daemonizing it (i.e: on the parent process).
## Actions

> [!important] Note that after this level, your program must work when started with a -a option, but it must still work when started without a -a option (which will not daemonize the server).
- **start:**  
    When the server is launched with -a start, the new PID must be stored in the file indicated by the PID_FILE configuration variable. If this file does not exist, you must create it. If the file exists and contains a PID, check if the process is alive. If it is, your binary must stop and return 1. If it is not, delete the content and proceed as specified above.
- **stop:**
    
    When -a stop is given, check if the file exists and if the process is alive. If it is, a SIGINT is sent to the server, which will handle this signal and stop itself. After this step (or if the process is not alive), delete the PID_FILE and return 0.
    
- **reload**
    
    When started with -a reload, a signal is sent to the server. Once the signal is received, HTTPd will reload: the configuration file will be read again, updating the different vhosts, but the vhosts shall not be stopped.  
    Since there is no predefined signal corresponding to the behavior we want to implement, we need to use our custom signals. There exist two signals left specifically for user usage, we expect you to use those.
    
- **restart**
    
    > [!important] This is equivalent to calling HTTPd with -a stop, then calling it again with -a start.
    
    When started with -a restart, check the content of PID_FILE. If the file does not exist or if the PID refers to a dead process, perform the same as if -a start was passed. Otherwise, a SIGINT is sent to the server, which will handle it and terminate itself. Then start the daemon and rewrite the content of PID_FILE.
    
  
# Step by step
1. Config
2. Logger
3. HTTP (_Echo Server first_)
4. Server Working
5. Link HTTP Log Server and Config to create a **Basic Server**
  
# Per module
## Config
The first line of the file will always be the tag [global].
A tag section will always end with an empty line.

> [!important] Some path are relative other can be absolute
The configuration must contain at least one vhosts tag section. For now, consider a single vhosts tag section to simplify your parser.
## Utils
## HTTP

> [!important] Your server must not crash in case of a malformed request. Catching SIGSEGV is forbidden and will be considered cheating. In case of an error, you must be able to throw 400 Bad Request if the request is
> 
>   
> malformed.
[https://www.rfc-editor.org/rfc/rfc9110](https://www.rfc-editor.org/rfc/rfc9110)
[https://www.rfc-editor.org/rfc/rfc9112](https://www.rfc-editor.org/rfc/rfc9112)
- parse HTTP requests
    - Each field line consists of a case-insensitive field name followed by a colon (":"), optional leading whitespace, the field line value, and optional trailing whitespace.
- create a response from an HTTP request
- convert an HTTP response to a string
## Request

> [!important] **REQUEST LINE:**
> 
>   
> Method SP Request-target SP HTTP-Version _\r\n__Exemple: GET / HTTP-1.1 \r\n_
In the case of HTTPd, Host header is considered valid if it matches one of the following cases:  
• The server_name of a vhost (e.g. [www.example.com](http://www.example.com/))  
• The IP address of a vhost (e.g. 127.0.0.1)  
• The IP port combination of a vhost (e.g. 127.0.0.1:4242)
Method SP Request-target SP HTTP-Version _\r\n_
Key: Value\r\n
Key: Value\r\n
\r\n
Body
If the target is a directory, you have to return the _default_file_ of the config inside of the given directory.

> [!important] Headers are case
> 
> **insensitive**
Headers:  
`Host: www.example.org`
## Response

> [!important] **REQUEST LINE:**
> 
>   
> HTTP-Version SP Status-Code SP Reason-Phrase CRLF _\r\n__Exemple: HTTP-1.1 200 OK \r\n_
### Header
**Mandatory Headers:**
- Date (use _strftime_) : Wed, 18 Oct 2023 19:58:54 GMT
- Content-header
- Connection header set to “close”.
- Content-Length: 447
- Content-Type: text/html
- Content-Language: ja
**Status**
- 403 Forbidden: Raised when a client tries to access a resource it does not have permission to.
- 404 Not Found: Raised when a client tries to access a resource that does not exist.
- 405 Method Not Allowed: Raised when a method not supported/allowed by the server is used in a request.
- 505 HTTP Version Not Supported: Raised when an HTTP version not supported by the server is used in a request. Anything other than 1.1 in our case

> [!info] RFC 9110: HTTP Semantics  
> The Hypertext Transfer Protocol (HTTP) is a stateless application-level protocol for distributed, collaborative, hypertext information systems.  
> [https://www.rfc-editor.org/rfc/rfc9110#name-status-codes](https://www.rfc-editor.org/rfc/rfc9110#name-status-codes)  
**Body**

> [!important] You should use sendfile(2) when possible. It is very useful to optimize data transfer between file descriptors.
  
## Daemon

> [!important] Before daemonizing your server, you must make sure that the binary can run on the parent process if the -a option is not specified.
Whenever a client closes a socket while a process is still writing on it, the process will receive the  
signal SIGPIPE, which by default will stop the process. You need to handle it using sigaction.
## Server
This module must use your other HTTP module and only handle reading from a client.
Since you are receiving bytes by reading from the socket fd, you must bear in mind that there is no standard way to know if you have finished reading everything. This means that you can no longer use the null byte as the end of a string since the notion of string is no longer applicable.**Your server must continue reading beyond the null byte if you still need to read anything.**

> [!important] You can have a header with the value “Host: serv\0name”

> [!important] A connection is
> 
> **NOT** persistent and has to be closed every time.
  
[[Basic server]]

  
**Signal Handler**
- SIGINT: clean shutdown (free all) and return 0

> [!important] Signal handlers are run asynchronously. This means you will have to use signal-safe functions in your handler. See signal-safety(7) for more information. Note that exit(3) is not signal-safe.
## Logger
If no log file is given as a daemon, write to HTTPd.log in the current directory
If you are asked to log, when no log_file is provided, you should log on stdout.
### Format
- **Request**
    
    DATE [SERV_NAME] received REQUEST_TYPE on 'TARGET' from CLIENT_IP
    
    > [!important] As for the Date header, you should follow the GMT format.
    
    For Bad Request, since the request will be ill-formed you should replace the target with Bad Request:
    
    - _Sun, 06 Nov 1994 08:49:37 GMT [localhost] received Bad Request from 218.20.4.2_
- **Response**
    
    DATE [SERV_NAME] responding with STATUS_CODE to CLIENT_IP for REQUEST_TYPE on 'TARGET’_Mon, 07 Nov 1994 20:42:27 GMT [localhost] responding with 200 to 218.20.4.2 for GET on '/index.html'_
    
  

> [!important] If the log variable is set to false, you must not create a log file.