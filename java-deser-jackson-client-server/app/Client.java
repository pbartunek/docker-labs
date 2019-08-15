import java.net.Socket;
import java.util.Scanner;
import java.io.InputStreamReader;
import java.io.BufferedReader;
import java.io.PrintWriter;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.annotation.JsonTypeInfo;
import com.fasterxml.jackson.databind.SerializationFeature;

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

    BufferedReader in = null;
    PrintWriter out   = null;
    while (true) {
      try {
        if (out == null) {
          out = new PrintWriter(socket.getOutputStream(), true);
        }

        // send message
        System.out.println("Enter a message: ");
        String str = scanner.nextLine();

        // create object mapper
        ObjectMapper mapper = new ObjectMapper();
        mapper.enableDefaultTyping();
        mapper.configure(SerializationFeature.FAIL_ON_EMPTY_BEANS, false);

        // serialize Message
        String jsonString   = mapper.writeValueAsString(new Message(str));
        out.println(jsonString);

        // read response
        if (in == null) {
          in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
        }

        String jsonMessage = in.readLine();
        mapper             = new ObjectMapper();
        Message message    = mapper.readValue(jsonMessage, Message.class);
        System.out.println("Response: " + message.getMessage());

      } catch (Exception ex) {
        System.out.println("Error: " + ex);
        return;
      }
    }
  }
}
