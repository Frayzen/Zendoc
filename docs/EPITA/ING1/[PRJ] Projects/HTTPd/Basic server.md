---
title: "Basic server"
---
Last edited time: November 17, 2023 3:34 PM

- 1) init addrinfo structs
    - hints is what we will use to guide the address resolution process (not pointer)
        - we need to memset it all to zeros
        - family = AF_NET
        - socktype = SOCK_STREAM
        - protocol = IPPROTO_TCP
    - *res, *p : res to store linked list after getaddrinfo, p used to loop through linked list
- 2) getaddrinfo
    
    ```objectivec
    int getaddrinfo(
    char *node,
    char *service,
    struct addrinfo *hints, 
    struct addrinfo **res
    );
    ```
    
    - node:
        - is the ip address to resolve
        - if null then localhost
        - ex: 127.0.0.1 , example.com
    - service:
        - service name or port number
            - a port is communication endpoint
            - port + ip address = socket
            - socket directs data to right place
            - HTTP normally uses 80
        - all service names have port numbers
        - ports are more explicit
    - hints:
        - mainly just used to set up the linked list (*res) and provide constants for the address resolution process
    - res:
        - we will store the linked list of potential socket addresses that match the hints (doesn't mean that family, socket type and protocol will be the same as hints)
        - 
- 3) loop through results
    - for each struct addrinfo:
        - server_sock =socket(family, socktype, protocol)
            - check if server_sock is - 1 ⇒ continue
        - bind(server_sock, addr, addresslen)
            - addr:
                - we use the current addrinfo which represents the local address which server_sock will be bound to
            - addresslen:
                - is the length of the addr structure in bytes
    - check if the result is -1 ⇒ continue
    - else ⇒ we successfully bind to a socket so break and free res with freeaddrinfo function
    - if we get to the end of the list then error filed to bind
- 4) listen
    - after finding a valid server_sock, we want to mark it as passive ⇒ used to accept incoming connection requests.
    - the **backlog** argument defines the maximum length of the queue of pending connections. It specifies the maximum number of clients that can be waiting to be served by the server. In other words, it determines the maximum number of connections that can be queued up before the server starts rejecting new connections.
    - again check if the result is -1 in which case we have an listening error
- 5) Accept
    - now we want at a never ending while loop
    - we are going to try create a file descriptor for the client (input an output of the client)
    - if we have the client socket = -1 ⇒ error accepting connection ⇒ close server_sock & exit
    - if we have a valid client socket ⇒ now we can handle the client
        - in the ehco server we will read from the client socket to a buffer and write the buffer back to the client socket
