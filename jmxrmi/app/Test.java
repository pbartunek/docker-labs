import java.io.IOException;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import com.sun.net.httpserver.HttpExchange;
import com.sun.net.httpserver.HttpHandler;
import com.sun.net.httpserver.HttpServer;

public class Test {
  public static void main(String[] args) throws Exception {
    int port = Integer.parseInt(args[0]);
    HttpServer server = HttpServer.create(new InetSocketAddress(port), 0);
    server.createContext("/", new MyHandler());
    server.setExecutor(null);
    server.start();
  }

  static class MyHandler implements HttpHandler {
    @Override
    public void handle(HttpExchange t) throws IOException {
      String response = "Nothing to see here";
      t.sendResponseHeaders(200, response.length());
      OutputStream os = t.getResponseBody();
      os.write(response.getBytes());
      os.close();
    }
  }
}
