// zmq_client project.
//  Hello World client 
#include <zmq.h>
#include <string.h>
#include <stdio.h>
#include <unistd.h>

int main (void)
{
    printf ("Connecting to hello world server…\n");
    void *context = zmq_ctx_new (); // create zmq context
    void *requester = zmq_socket (context, ZMQ_REQ); // create zmq socket
    zmq_connect (requester, "tcp://localhost:5555");

    // the client sends a request and reads the reply back from the server
    int request_nbr;
    for (request_nbr = 0; request_nbr != 10; request_nbr++) {
        char buffer [10];
        printf ("Sending Hello %d…\n", request_nbr);
        zmq_send (requester, "Hello", 5, 0);
        zmq_recv (requester, buffer, 10, 0);
        printf ("Received World %d\n", request_nbr);
        printf ("%s \n", buffer);
    }
    zmq_close (requester);
    zmq_ctx_destroy (context);
    return 0;
}