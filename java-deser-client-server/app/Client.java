import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;
import java.util.Scanner;

public class Client {

  private static void printUsage() {
    System.out.println("\nClient <listen-address> <port>\n");
  }

  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);
    Socket socket   = null;

    if(args.length < 2) {
      printUsage();
      System.exit(1);
    }

    try {
      String address = args[0];
      int port       = Integer.parseInt(args[1]);
      socket         = new Socket(address, port);

      System.out.println("Connected to server");
    } catch (Exception ex) {
      System.out.println("Error connecting to server: " + ex.getMessage());
      System.exit(1);
    }

    ObjectInputStream in   = null;
    ObjectOutputStream out = null;
    while (true) {
      try {
        if (out == null) {
          out = new ObjectOutputStream(socket.getOutputStream());
        }

        System.out.println("Enter a message: ");
        String str = scanner.nextLine();

        out.writeObject(new Message(str));
        out.flush();

        if (in == null) {
          in = new ObjectInputStream(socket.getInputStream());
        }
        Message message = (Message) in.readObject();
        System.out.println("Response: " + message.getMessage());

      } catch (Exception ex) {
        System.out.println("Error: " + ex);
        return;
      }
    }
  }
}
