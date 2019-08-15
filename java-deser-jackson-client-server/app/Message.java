import com.fasterxml.jackson.annotation.JsonTypeInfo;

@JsonTypeInfo(use = JsonTypeInfo.Id.CLASS)
public class Message {

  @JsonTypeInfo(use = JsonTypeInfo.Id.CLASS)
  private Object messageId;

  private String message;

  public Message(String message) {
    this.message = message;
    this.messageId = new MessageId("aaaa");
  }

  Message() {}

  public String getMessage(){
    return message;
  }

  public void setMessage(String message) {
    this.message = message;
  }

  public Object getMessageId() {
    return messageId;
  }

  public void setMessageId(Object msgId) {
    this.messageId = msgId;
  }
}
