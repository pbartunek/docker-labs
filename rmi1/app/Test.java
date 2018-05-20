import java.util.Scanner;

public class Test {

  public static void main(String[] args) {
    while(true) {
      System.out.println("Enter any text");
      Scanner scanner = new Scanner(System.in);
      String input = scanner.nextLine();
      System.out.println("Your input " + input);
    }
  }

}
