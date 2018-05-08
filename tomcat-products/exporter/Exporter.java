import java.io.*;
import com.github.javafaker.Faker;
import com.github.javafaker.Commerce;
import org.yaml.snakeyaml.*;
import org.apache.commons.lang3.StringUtils.*;
import java.io.PrintWriter;

public class Exporter {
	public static void main(String[] args)
	throws IOException {
		if(args.length < 1) {
			System.out.println("exporter: No arguments");
			System.exit(1);
		}
 
    String tempPath       = args[0];
    String temporaryFile  = args[1];
    String outPath        = args[2];
    String outFile        = args[3];

    // add timestamp to output path
    long timestamp  = System.currentTimeMillis();
    outPath         = outPath + "/" + timestamp;

    // create output directory
    File outDir = new File(outPath);
    outDir.mkdir();

    PrintWriter writer = new PrintWriter(outDir + "/output.log", "UTF-8");
    writer.println("temp path: " + tempPath);
    writer.println("temp file: " + temporaryFile);
    writer.println("output path: " + outPath);
    writer.println("output file: " + outFile);

    // generate CSV file with fake product data in temp directory
    Faker faker       = new Faker();
    File tempFile     = new File(temporaryFile + ".csv");
    PrintWriter pw    = new PrintWriter(tempFile);
    StringBuilder sb  = new StringBuilder();

    sb.append("id");
    sb.append(',');
    sb.append("product name");
    sb.append(',');
    sb.append("promotion code");
    sb.append(',');
    sb.append("price");
    sb.append('\n');

    for(int i = 1; i <= 100; i++) {
      sb.append(i);
      sb.append(',');
      sb.append(faker.commerce().productName());
      sb.append(',');
      sb.append(faker.commerce().promotionCode());
      sb.append(',');
      sb.append(faker.commerce().price());
      sb.append('\n');
    }

    pw.write(sb.toString());
    pw.close();

    // copy temp file to destination
    InputStream is = null;
    OutputStream os = null;
    try {
      is = new FileInputStream(tempPath + "/" + temporaryFile + ".csv");
      os = new FileOutputStream(outPath + "/" + temporaryFile + ".csv");
      byte[] buffer = new byte[1024];
      int length;
      while ((length = is.read(buffer)) > 0) {
        os.write(buffer, 0, length);
      }

      // generate log
      FileInputStream fs;
      fs = new FileInputStream(outPath + "/" + outFile + ".csv");
      writer.println("Bytes written " + fs.available());

    } catch (Exception e) {
      //is.close();
      //os.close();
      writer.println(e.getMessage());
    }

    writer.close();
	}
}
