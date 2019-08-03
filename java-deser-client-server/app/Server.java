import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.ServerSocket;
import java.net.Socket;

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
        ObjectInputStream in = null;
        ObjectOutputStream out = null;
        while(true) {
          try {
            if (in == null) {
              in = new ObjectInputStream(socket.getInputStream());
            }
            Message message = (Message) in.readObject();
            System.out.println("Client said: " + message.getMessage());

            if (out == null) {
              out = new ObjectOutputStream(socket.getOutputStream());
            }
            out.writeObject(new Message("Message recieved: " + message.getMessage()));
            out.flush();
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
