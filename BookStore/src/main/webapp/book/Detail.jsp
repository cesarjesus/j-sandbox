<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Book Detail</title>
            <link rel="stylesheet" type="text/css" href="/BookStore/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Book Detail</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="Id:"/>
                    <h:outputText value="#{book.book.id}" title="Id" />
                    <h:outputText value="Title:"/>
                    <h:outputText value="#{book.book.title}" title="Title" />
                    <h:outputText value="Author:"/>
                    <h:outputText value="#{book.book.author}" title="Author" />


                </h:panelGrid>
                <br />
                <h:commandLink action="#{book.remove}" value="Destroy">
                    <f:param name="jsfcrud.currentBook" value="#{jsfcrud_class['bookstore.bookstore.web.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][book.book][book.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{book.editSetup}" value="Edit">
                    <f:param name="jsfcrud.currentBook" value="#{jsfcrud_class['bookstore.bookstore.web.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][book.book][book.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <h:commandLink action="#{book.createSetup}" value="New Book" />
                <br />
                <h:commandLink action="#{book.listSetup}" value="Show All Book Items"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
