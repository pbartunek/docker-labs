import java.security.MessageDigest;
import java.sql.Timestamp;

public class MessageId {

  private String id;

  public MessageId() {}

  public MessageId(String msg) {
    this.id = generateMessageId(id);
  }

  public void setId(String msg) {
    this.id = generateMessageId(id);
  }

  public String getId() {
    return this.id;
  }

  private String generateMessageId(String msg) {
    try {
      Timestamp timestamp = new Timestamp(System.currentTimeMillis());
      String id = msg + ":" + timestamp.getTime();
      MessageDigest md = MessageDigest.getInstance("MD5");
      md.update(id.getBytes());
      byte[] hashInBytes = md.digest();

      StringBuilder sb = new StringBuilder();
      for (byte b : hashInBytes) {
        sb.append(String.format("%02x", b));
      }
      return sb.toString();

    } catch (Exception ex) {
      System.out.println("Error occured while generating message id");
      return null;
    }
  }
}
