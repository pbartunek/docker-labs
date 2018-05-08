<%@ page import="java.util.*" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.io.File" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.codec.digest.DigestUtils"%>
<%@ page import="javax.imageio.*"%>
<%@ page import="java.awt.image.BufferedImage"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
String errorMsg = null;
File tempDir = new File("/usr/local/tomcat/temp");

DiskFileItemFactory factory = new DiskFileItemFactory();
factory.setRepository(tempDir);

// create a new file upload handler
ServletFileUpload upload = new ServletFileUpload(factory);

// limit request size to 1 MB
upload.setSizeMax(1048576);

// get request content type
boolean isMultipart = ServletFileUpload.isMultipartContent(request);

try {
  // parse the request
  if (true == isMultipart) {
    List<FileItem> items = upload.parseRequest(request);

    Iterator<FileItem> iter = items.iterator();
    while (iter.hasNext()) {
      FileItem item = iter.next();

      if (item.isFormField()) {
        continue;
      }
      // get item details
      String fieldName = item.getFieldName();
      String fileName = item.getName();
      String contentType = item.getContentType();
      long sizeInBytes = item.getSize();

      System.out.println("File details:\n" + "field name: " + fieldName);
      System.out.println("file name: " + fileName);
      System.out.println("content type: " + contentType);
      System.out.println("size in bytes: " + sizeInBytes);

      // validate content type in request
      if (contentType.equals("image/jpeg") || contentType.equals("image/png")
          || contentType.equals("image/gif")) {
        // save file in temp
        String path = tempDir + "/" + fileName;
        File uploadedFile = new File(path);
        item.write(uploadedFile);

        // validate file type
        try {
          // Image I/O has built-in support for GIF, PNG, JPEG, BMP, and WBMP
          BufferedImage img = ImageIO.read(uploadedFile);

          // save uploaded file and delete temp
          String extension = contentType.substring(contentType.indexOf("/") + 1);
          String outputFileName = DigestUtils.md5Hex(fileName);
          File outputFile = new File(application.getRealPath("/images") + "/" + outputFileName + "." + extension);
          ImageIO.write(img, extension, outputFile);
          uploadedFile.delete();

          // image uploaded successfully, redirect to main page
          response.sendRedirect("/");
        } catch (Exception e) {
          System.out.println();
          throw new Exception("Uploaded file is not valid JPG, PNG or GIF image!");
        }
      }
      else {
        throw new Exception("Only JPG, PNG and GIF files are supported!");
      }
    }
  }
} catch(Exception e) {
  errorMsg = e.getMessage();
}
%>

<html>
  <%@ include file="head.html" %>
  <body>
    <%@ include file="header.html" %>
    <div class="container">
      <% if (errorMsg != null) { %>
      <div class="alert alert-danger" role="alert">
        <%= errorMsg %>
      </div>
      <% } %>

      <div class="jumbotron">
        <form action="/upload.jsp" method="post" enctype="multipart/form-data">
          <div class="form-group">
            <label for="imageFile">Select image to upload:</label>
            <input type="file" class="form-control-file" id="imageFile" name="imageFile" />
          </div>
          <button type="submit" class="btn btn-primary btn-lg">Upload File</button>
        </form>
      </div>
    </div>
  </body>
</html>
