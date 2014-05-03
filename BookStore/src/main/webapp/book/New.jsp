<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>New Book</title>
            <link rel="stylesheet" type="text/css" href="/BookStore/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>New Book</h1>
            <h:form>
                <h:inputHidden id="validateCreateField" validator="#{book.validateCreate}" value="value"/>
                <h:panelGrid columns="2">
                    <h:outputText value="Id:"/>
                    <h:inputText id="id" value="#{book.book.id}" title="Id" required="true" requiredMessage="The id field is required." />
                    <h:outputText value="Title:"/>
                    <h:inputText id="title" value="#{book.book.title}" title="Title" required="true" requiredMessage="The title field is required." />
                    <h:outputText value="Author:"/>
                    <h:inputText id="author" value="#{book.book.author}" title="Author" />

                </h:panelGrid>
                <br />
                <h:commandLink action="#{book.create}" value="Create"/>
                <br />
                <br />
                <h:commandLink action="#{book.listSetup}" value="Show All Book Items" immediate="true"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
