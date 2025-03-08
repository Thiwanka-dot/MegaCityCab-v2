<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>
<%@page import="Servlets.DBConnection"%>

<%
    String startLocation = request.getParameter("startLocation");
    String endLocation = request.getParameter("endLocation");

    Connection conn = null;
    try {
        conn = DBConnection.getConnection();

        String query = "SELECT total_price FROM distance WHERE startLocation = ? AND endLocation = ?";
        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setString(1, startLocation);
        stmt.setString(2, endLocation);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            out.print(rs.getString("total_price"));
        } else {
            out.print("0");
        }

        rs.close();
        stmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
        out.print("0");
    }
%>
