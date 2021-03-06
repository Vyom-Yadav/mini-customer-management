<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>

<html>

<head>
    <title>List Customers</title>

    <!-- reference our style sheet -->

    <link type="text/css"
          rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/css/style.css"/>

</head>

<body>

<div id="wrapper">
    <div id="header">
        <h2>CRM - Customer Relationship Management, Welcome <security:authentication
                property="principal.username"/></h2>
    </div>
</div>

<div id="container">

    <div id="content">

        <!-- Add Button -->
        <security:authorize access="hasRole('OWNER')">
            <input type="button" value="Add Customer"
                   onclick="window.location.href = 'showFormForAdd'; return false;"
                   class="add-button"/>
        </security:authorize>

        <!-- Search Bar -->

        <form:form action="search" method="get">
            <label>
                Search Customer:
                <input type="text" name="theSearchName"/>
            </label>

            <input type="submit" value="Search" class="add-button"/>
        </form:form>

        <!--  add our html table here -->

        <table>
            <tr>
                <th><a href="${pageContext.request.contextPath}/customer/sortByFirstName">First Name</a></th>
                <th><a href="${pageContext.request.contextPath}/customer/sortByLastName">Last Name</a></th>
                <th><a href="${pageContext.request.contextPath}/customer/sortByEmail">Email</a></th>
                <security:authorize access="hasAnyRole('OWNER', 'MANAGER')">
                    <th>Action</th>
                </security:authorize>
            </tr>

            <!-- loop over and print our customers -->
            <c:forEach var="tempCustomer" items="${customers}">

                <!-- construct an "update" link with customer id -->
                <c:url var="updateLink" value="/customer/showFormForUpdate">
                    <c:param name="customerId" value="${tempCustomer.id}"/>
                </c:url>

                <!-- construct an "deleteCustomer" link with customer id -->
                <c:url var="deleteLink" value="/customer/delete">
                    <c:param name="customerId" value="${tempCustomer.id}"/>
                </c:url>

                <tr>
                    <td> ${tempCustomer.firstName} </td>
                    <td> ${tempCustomer.lastName} </td>
                    <td> ${tempCustomer.email} </td>
                    <td>
                        <security:authorize access="hasAnyRole('OWNER', 'MANAGER')">
                            <a href="${updateLink}">Update</a> </security:authorize> <security:authorize
                            access="hasRole('OWNER')">| <a href="${deleteLink}"
                                                           onclick="if(!(confirm('Are you sure you want to deleteCustomer this customer?'))) return false">Delete</a> </security:authorize>
                    </td>
                </tr>

            </c:forEach>

        </table>

    </div>

</div>

<p>
    <form:form action="${pageContext.request.contextPath}/logout" method="post">
        <input type="submit" value="logout" class="add-button">
    </form:form>
</p>


</body>

</html>









