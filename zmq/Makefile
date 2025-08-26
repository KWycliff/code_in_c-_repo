CC = gcc
CFLAGS = -Wall -Wextra
LDFLAGS = -lzmq

all: zmq_server zmq_client

zmq_server: zmq_server.c
	$(CC) $(CFLAGS) -o zmq_server zmq_server.c $(LDFLAGS)

zmq_client: zmq_client.c
	$(CC) $(CFLAGS) -o zmq_client zmq_client.c $(LDFLAGS)

clean:
	rm -f zmq_server zmq_client