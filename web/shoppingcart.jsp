<!--
Shopping Cart jsp for Web Server Programming P2
Authored with <3 by Jay-T Parrish
-->
<%@page import="com.google.josiahparrish9844.Item"%>
<%@page import="com.google.josiahparrish9844.ShoppingCart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% final double ACRYLIC_PRICE = 15.50; %>
<% final double BRUSH_PRICE = 2.20; %>
<% final double PASTEL_PRICE = 8.30; %>
<% final double WATERCOLOR_PRICE = 10.30; %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping Cart</title>
        <style>
            #header {
                border-radius: 5px;
                background-color: #f2f2f2;
                padding: 40px;
                text-align:center;
            }
            body {
                background-image: url("images/rainynight.jpg");
                background-repeat: no-repeat;
            }
            table {
                border-collapse: collapse;
                align: center;
                width: 100%;
                padding: 20px;
            }
            td {
                text-align: right;
                padding: 8px;
            }
            tr:nth-child(even){background-color: white}
            /*Gives Alternating Color look*/
            th {
                background-color: #4CAF50;
                color: white;
                width: 33%;
            }
            input[type=text],input[type=password] {
                width: 90%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;                
            }
          
            input[type=submit] {
                width: 90%;
                background-color: #3A6693;
                color: white;
                padding: 4px 2px;
                margin: 8px 0;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
            input[type=submit]:hover {
                background-color: #195582;
            }
            #contentBox {
                width: 70%;
                margin: auto;
                margin-top: 10%;
                border-radius: 5px;
                background-color: #f2f2f2;
                padding: 40px;
            }
            p {
                text-align: right;
                background-color:lightgrey;
                padding: 18px 0;
                font-size:150%;
            }
        </style>
    </head>
    <%
        ShoppingCart cart = (ShoppingCart) session.getAttribute("shoppingcart");
        if (cart == null) {
            cart = new ShoppingCart();
            session.setAttribute("shoppingcart", cart);
        }
        String itemName = request.getParameter("item");
        if (itemName != null) {
            if (itemName.startsWith("Ac")) {
                Item item = new Item("Acrylic Set");
                item.setCount(Integer.parseInt(request.getParameter("Quantity")));
                item.setPrice(ACRYLIC_PRICE);
                cart.addItem(item);
            }
            if (itemName.startsWith("Br")) {
                Item item = new Item("Brush Set");
                item.setCount(Integer.parseInt(request.getParameter("Quantity")));
                item.setPrice(BRUSH_PRICE);
                cart.addItem(item);
            }
            if (itemName.startsWith("Pa")) {
                Item item = new Item("Pastel Set");
                item.setCount(Integer.parseInt(request.getParameter("Quantity")));
                item.setPrice(PASTEL_PRICE);
                cart.addItem(item);
            }
            if (itemName.startsWith("Wa")) {
                Item item = new Item("Watercolor Set");
                item.setCount(Integer.parseInt(request.getParameter("Quantity")));
                item.setPrice(WATERCOLOR_PRICE);
                cart.addItem(item);
            }
            //For the removal of an item
            //Note: An item is not an individual quantity, rather a group of
            //similar items with a 'Count' field that specifies the amount of
            //items within the group. Removing an item, removes the entire group
            //so if it is multiple items, they are all removed at once!
            if (itemName.equals("Remove Acrylic Set")) {
                cart.removeItem("Acrylic Set");
            }
            if (itemName.equals("Remove Brush Set")) {
                cart.removeItem("Brush Set");
            }
            if (itemName.equals("Remove Pastel Set")) {
                cart.removeItem("Pastel Set");
            }
            if (itemName.equals("Remove Watercolor Set")) {
                cart.removeItem("Watercolor Set");
            }
        }
    %>
    <body>
        <div id="contentBox">
            <table>
                <th rowspan="5">
                    The Contents of Shopping Cart<br>
                </th>
                <%
                    if (cart == null || cart.getCart().size() == 0) {
                        out.println("Shopping cart is empty! Buy more!");
                    } else {
                        for (Item item : cart.getCart()) {
                            out.print("<tr>");
                            out.print("<td>");
                            out.print(item.getName() + "</td><td>" + item.getCount() + " x </td><td>$" + String.format("%.2f", item.getPrice()));
                            out.print("</td>");
                            out.print("<td>");
                            //To get the remove button to work, I specified a
                            //submit element to contain the correct "Remove.."
                            //string. Then we just use out.print to hax it in.
                            out.print("<form action=\"shoppingcart.jsp\" method=\"POST\">");
                            out.print("<input type=\"submit\" name=\"item\" value=\"Remove ");
                            out.print( item.getName() ); 
                            out.print("\">");
                            //end of remove button
                            out.print("</input></form></td>");
                            out.print("</tr>");
                        }
                    }
                %>
            </table>
            <p>
                <%
                    out.println("Subtotal: | " + String.format("%.2f", cart.getSubtotal()));
                %>
            </p>
            <table align="right"><tr><td>
                        <a href="index.html">Back to Shopping!</a>
                    <td></tr>
            </table>
        </div>
    </body>
</html>
