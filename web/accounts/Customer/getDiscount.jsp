<%@ page import="java.sql.*" %>
<%@page import="Servlets.DBConnection"%>
<%
    Connection conn = null;
    
    String discountCode = request.getParameter("discountCode");
    int discountPercentage = 0;

    if (discountCode != null && !discountCode.isEmpty()) {
        try {
            conn = DBConnection.getConnection();

            String query = "SELECT discountPrice FROM discounts WHERE discountCode = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, discountCode);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                discountPercentage = rs.getInt("discountPrice");
            }

            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    out.print(discountPercentage);
%>
