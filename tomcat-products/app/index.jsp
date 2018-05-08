<%@ page import = "java.io.*,
  java.util.*,
  javax.servlet.*,
  com.github.javafaker.Faker,
  com.github.javafaker.Commerce,
  org.yaml.snakeyaml.*,
  org.apache.commons.lang3.StringUtils.*" %>
<html>
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
            <th scope="col">Product name</th>
            <th scope="col">Promotion code</th>
            <th scope="col">Price</th>
          </tr>
        </thead>
        <tbody>
          <%
          Faker faker = new Faker();
          String productName = null;
          String promotionCode = null;
          String price = null;

          for(int i = 1; i <= 100; i++) {
            productName = faker.commerce().productName();
            promotionCode = faker.commerce().promotionCode();
            price = faker.commerce().price();
          %>
          <tr>
            <th scope="row"><%= i %></th>
            <td><%= productName %></td>
            <td><%= promotionCode %></td>
            <td>$<%= price %></td>
          </tr>
          <% } %>
        </tbody>
      </table>
    </div>
  </body>
</html>
