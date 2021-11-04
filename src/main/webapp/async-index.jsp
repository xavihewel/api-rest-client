<%-- 
    Document   : async-index
    Created on : 4 nov. 2021, 12:23:02
    Author     : xavier.verges
--%>

<%@page import="java.util.concurrent.Future"%>
<%@page import="javax.ws.rs.core.Response"%>
<%@page import="javax.ws.rs.client.AsyncInvoker"%>
<%@page import="javax.ws.rs.client.Invocation"%>
<%@page import="javax.ws.rs.client.WebTarget"%>
<%@page import="javax.ws.rs.client.ClientBuilder"%>
<%@page import="javax.ws.rs.client.Client"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>

        <%
            Client client = ClientBuilder.newBuilder().build();
            WebTarget target = client.target("http://localhost:8080/myfirst-webservice/resources/StudentFacadeREST/simpleAsync");

            Invocation.Builder reqBuilder = target.request();
            AsyncInvoker asyncInvoker = reqBuilder.async();
            Future<Response> futureResp = asyncInvoker.get();

            Response responsec = futureResp.get(); //blocks until client responds or times out

            String responseBody = responsec.readEntity(String.class);
            out.println(responseBody + "<br>");
            out.println(Response.status(responsec.getStatus()).entity(responseBody).build());
        %>
    </body>
</html>
