<%@page import="javax.swing.JOptionPane"%>
<%@ page import="connection.ConnectionProvider"%>
<%@page import="java.sql.*" %>

<%
String id=request.getParameter("id");
String name=request.getParameter("name");
String category=request.getParameter("category");
String price=request.getParameter("price");
String active=request.getParameter("active");

try {
      Connection con = ConnectionProvider.getConnection();
      Statement st= con.createStatement();
      st.executeUpdate("update product set name='"+name+"',category='"+category+"', price='"+price+"', active='"+active+"' where id='"+id+"'");
      if(active.equals("no")){
      st.executeUpdate("delete from cart where product_id='"+id+"' and adress is null");
    }
    response.sendRedirect("allProductEditProduct.jsp?msg=done");
    } catch (Exception e) {
    response.sendRedirect("allProductEditProduct.jsp?msg=wrong");
    JOptionPane.showMessageDialog(null, e);
    System.out.println(e);
    }
%>