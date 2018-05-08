<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<html>
  <%@ include file="head.html" %>
  <body>
    <%@ include file="header.html" %>
    <div class="container">
      <div class="card-columns">
      <%
        String path = application.getRealPath("/images");
        File dir = new File(path);
        File[] images = dir.listFiles();
        for(int i = 0; i < images.length; i++) {
          String name = images[i].getName();
      %>
        <div class="card">
          <img class="card-img-top" src="images/<%= name %>" />
        </div>
      <% } %>
      </div>
    </div>
  </body>
</html>
