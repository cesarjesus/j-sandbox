<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Listing Book Items</title>
            <link rel="stylesheet" type="text/css" href="/BookStore/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Listing Book Items</h1>
            <h:form styleClass="jsfcrud_list_form">
                <h:outputText escape="false" value="(No Book Items Found)<br />" rendered="#{book.pagingInfo.itemCount == 0}" />
                <h:panelGroup rendered="#{book.pagingInfo.itemCount > 0}">
                    <h:outputText value="Item #{book.pagingInfo.firstItem + 1}..#{book.pagingInfo.lastItem} of #{book.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{book.prev}" value="Previous #{book.pagingInfo.batchSize}" rendered="#{book.pagingInfo.firstItem >= book.pagingInfo.batchSize}"/>&nbsp;
                    <h:commandLink action="#{book.next}" value="Next #{book.pagingInfo.batchSize}" rendered="#{book.pagingInfo.lastItem + book.pagingInfo.batchSize <= book.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{book.next}" value="Remaining #{book.pagingInfo.itemCount - book.pagingInfo.lastItem}"
                                   rendered="#{book.pagingInfo.lastItem < book.pagingInfo.itemCount && book.pagingInfo.lastItem + book.pagingInfo.batchSize > book.pagingInfo.itemCount}"/>
                    <h:dataTable value="#{book.bookItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Id"/>
                            </f:facet>
                            <h:outputText value="#{item.id}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Title"/>
                            </f:facet>
                            <h:outputText value="#{item.title}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Author"/>
                            </f:facet>
                            <h:outputText value="#{item.author}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText escape="false" value="&nbsp;"/>
                            </f:facet>
                            <h:commandLink value="Show" action="#{book.detailSetup}">
                                <f:param name="jsfcrud.currentBook" value="#{jsfcrud_class['bookstore.bookstore.web.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][book.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{book.editSetup}">
                                <f:param name="jsfcrud.currentBook" value="#{jsfcrud_class['bookstore.bookstore.web.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][book.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{book.remove}">
                                <f:param name="jsfcrud.currentBook" value="#{jsfcrud_class['bookstore.bookstore.web.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][book.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                        </h:column>

                    </h:dataTable>
                </h:panelGroup>
                <br />
                <h:commandLink action="#{book.createSetup}" value="New Book"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />


            </h:form>
        </body>
    </html>
</f:view>
