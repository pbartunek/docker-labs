<%@ page import = "java.io.*,
  java.util.*, javax.servlet.*" %>
<%

String fileName = request.getParameter("fileName");

if( fileName != null) {
  String tomcatPath = "/usr/local/tomcat/";
  String tempPath   = "/usr/local/tomcat/temp";
  String outputPath = application.getRealPath("/downloads");

  // remove unsafe characters
  fileName = fileName.replaceAll("[.\"']", "");
  String[] command = {tomcatPath + "bin/exporter.sh", tempPath, fileName, outputPath, fileName};
  Runtime r = Runtime.getRuntime();
  Process p = r.exec(command);
  p.waitFor();

  BufferedReader stdOut = new BufferedReader(new InputStreamReader(p.getInputStream()));
  BufferedReader stdErr = new BufferedReader(new InputStreamReader(p.getErrorStream()));
  String line = "";
  while ((line = stdOut.readLine()) != null) {
    System.out.println(line);
  }
  while ((line = stdErr.readLine()) != null) {
    System.out.println(line);
  }

  stdOut.close();
  stdErr.close();
}
%>
<html>
  <head>
      <title></title>
      <link rel="stylesheet" href="/css/bootstrap.min.css">
      <script src="/js/bootstrap.min.js"></script>
  </head>
  <body>
    <%@ include file="header.html" %>
    <div class="container">
      <form action="/export.jsp" method="post">
        <div class="row">
          <div class="col-2"> </div>
          <div class="col-8">
            To export product list enter file name below, it will be available
            in "download" section.
          </div>
        </div>
        <div class="row mt-5">
          <div class="col">
            <label for="fileName" class="">File name</label>
          </div>
          <div class="col-3">
            <input type="text" class="form-control" name="fileName" id="fileName" />
          </div>
          <div class="col">
            <button type="submit" class="btn btn-primary">export</button>
          </div>
          <div class="col-5"></div>
        </div>
      </form>
    </div>
  </body>
</html>
