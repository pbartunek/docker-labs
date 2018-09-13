import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;

public class SampleServer {
  private ServerSocket server;

  public SampleServer(int port) throws Exception {
    this.server = new ServerSocket(port);
  }

  private void listen() throws Exception {
    String data = null;
    while(true) {
      Socket client = this.server.accept();
      String clientAddress = client.getInetAddress().getHostAddress();
      System.out.println("\r\nNew connection from " + clientAddress);

      PrintWriter out =
        new PrintWriter(client.getOutputStream(), true);
      out.println("Hello " + clientAddress);

      client.close();
    }
  }

  public int getPort() {
    return this.server.getLocalPort();
  }

  public static void main(String[] args) throws Exception {
    SampleServer app = new SampleServer(8080);
    System.out.println("\r\nRunning Server: " + " Port: " + app.getPort());

    app.listen();
  }
}
