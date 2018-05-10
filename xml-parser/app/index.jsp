<%@ page import = "java.io.*,java.util.*, javax.servlet.*,
javax.xml.parsers.DocumentBuilderFactory,
javax.xml.parsers.DocumentBuilder,
javax.xml.transform.Transformer,
javax.xml.transform.TransformerFactory,
javax.xml.transform.dom.DOMSource,
javax.xml.transform.stream.StreamResult,
org.w3c.dom.Document" %>
<%
String errorMsg = null;
String xmlOutput = null;

if(request.getParameter("xml") != null) {
  // save received xml in temp file
  String xmlContent = request.getParameter("xml");
  File tempFile     = File.createTempFile("temp-", ".xml");
  PrintWriter pw    = new PrintWriter(tempFile);
  pw.write(xmlContent);
  pw.close();

  try {
    // build xml document from file
    DocumentBuilderFactory dbFactory  = DocumentBuilderFactory.newInstance();
    DocumentBuilder dBuilder          = dbFactory.newDocumentBuilder();
    Document doc                      = dBuilder.parse(tempFile);
    doc.getDocumentElement().normalize();

    // convert to string
    DOMSource domSource     = new DOMSource(doc);
    Transformer transformer = TransformerFactory.newInstance().newTransformer();
    StringWriter writer     = new StringWriter();
    StreamResult result     = new StreamResult(writer);
    transformer.transform(domSource, result);

    // escape xml before embedding in html
    xmlOutput = org.apache.commons.lang3.StringEscapeUtils.escapeXml(writer.toString()); 

  } catch (Exception e) {
    e.printStackTrace();
    errorMsg = e.getMessage();
  }
}
%>

<html>
  <head>
    <title>XML parser</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <script src="/js/bootstrap.min.js"></script>
  </head>
  <body>
    <%@ include file="header.html" %>
    <div class="container">
      <% if(errorMsg != null ) { %>
        <div class="alert alert-danger" role="alert">
          Error while parsing XML:
          <%= errorMsg %>
        </div>
      <% } %>
      <% if(null == xmlOutput) { %>
      <form method="post" action="/index.jsp">
        <div class="form-group">
          <textarea class="form-control" rows="5" name="xml" id="xml"></textarea>
        </div>
        <button type="submit" class="btn btn-primary">Parse</button>
      </form>
      <% } else { %>
        <h3>Submitted XML:</h3>
        <div class="p-3 mb-2 bg-light">
          <code class="language-xml">
            <%= xmlOutput %>
          </code>
        </div>
        <a class="btn btn-primary" href="/" role="button">Back</a>
      <% } %>
    </div>
  </body>
</html>
