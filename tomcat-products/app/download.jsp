<%@ page import = "java.io.*, java.util.*, javax.servlet.*" %>
  <head>
      <title></title>
      <link rel="stylesheet" href="/css/bootstrap.min.css">
      <script src="/js/bootstrap.min.js"></script>
  </head>
  <body>
    <%@ include file="header.html" %>
    <div class="container">
      <table class="table">
        <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">Timestamp</th>
            <th scope="col">File name</th>
            <th scope="col">Log file</th>
            <th scope="col">Download</th>
          </tr>
        </thead>
        <tbody>
          <%
          String path = application.getRealPath("/downloads");
          File dir = new File(path);
          File[] exportDirectories = dir.listFiles();
          for(int i = 0; i < exportDirectories.length; i++) {
            String exportDirName = exportDirectories[i].getName();
            File exportDir = new File(path, exportDirName);
            File[] files = exportDir.listFiles();

            String fileName = null;
            String logFile  = null;
            for(File file : files) {
              String name = file.getName();
              if(name.endsWith(".csv"))
                fileName = name;
              else
                logFile = name;
            }

            if(fileName == null)
              continue;
          %>
          <tr>
            <th scope="row"><%= i + 1 %></th>
            <td><%= exportDirName %></td>
            <td><%= fileName %></td>
            <td>
              <% if(logFile != null) { %>
                <a href="/downloads/<%= exportDirName %>/<%= logFile %>">Log file</a>
              <% } %>
            </td>
            <td>
              <a href="/downloads/<%= exportDirName %>/<%= fileName %>">Download</a>
            </td>
          </tr>
          <% } %>
        </tbody>
      </table>
    </div>
  </body>
</html>
