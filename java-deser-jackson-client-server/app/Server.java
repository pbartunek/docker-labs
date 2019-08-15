import java.io.IOException;
import java.io.InputStreamReader;
import java.io.BufferedReader;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.annotation.JsonTypeInfo;
import com.fasterxml.jackson.databind.SerializationFeature;

public class Server {

  private static void printUsage() {
    System.out.println("\nServer <port>\n");
  }

  public static void main(String[] args) {
    ServerSocket serverSocket = null;

    if(args.length < 1) {
      printUsage();
      System.exit(1);
    }

    try {
      int port     = Integer.parseInt(args[0]);
      serverSocket = new ServerSocket(port);
      System.out.println("Server started");
    } catch (IOException ex) {
      System.out.println("Error occured while creating the server socket");
      return;
    }

    try {
      Socket socket = null;
      while (true) {
        try {
          socket = serverSocket.accept();
        } catch (IOException ex) {
          System.out.println("Error occured while accepting the socket");
          return;
        }
        System.out.println("Connection created, client IP: " + socket.getInetAddress());

        BufferedReader in = null;
        PrintWriter out   = null;
        while(true) {
          try {
            if (in == null) {
              in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
            }
            String jsonMessage  = in.readLine();

            // create object mapper
            ObjectMapper mapper = new ObjectMapper();
            mapper.enableDefaultTyping();
            mapper.configure(SerializationFeature.FAIL_ON_EMPTY_BEANS, false);

            // create Message from serialized JSON
            Message message = mapper.readValue(jsonMessage, Message.class);

            System.out.println("Client JSON: " + jsonMessage);
            System.out.println("Client said: " + message.getMessage());

            if (out == null) {
              out = new PrintWriter(socket.getOutputStream(), true);
            }

            // send response
            String jsonString = mapper.writeValueAsString(new Message("Message received: " + message.getMessage()));
            out.println(jsonString);
          } catch (java.io.EOFException ex) {
            System.out.println("Client closed connection");
            socket.close();
            break;
          } catch (Exception ex) {
            System.out.println("Error while receiving a message: " + ex);
            socket.close();
            break;
          }
        }
      }
    }
    catch (Exception ex) {
      System.out.println("Error: " + ex);
    }
  }
}
