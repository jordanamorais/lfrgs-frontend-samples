<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>
<%@ taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme" %>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui" %>

<liferay-theme:defineObjects />
<portlet:defineObjects />

<aui:form name="form" action="" method="post">
       <%-- Price Range --%>
       <aui:input name="price" value='' label="Price Range">
              <aui:validator name="number"></aui:validator>
              <aui:validator name="min">200</aui:validator>
              <aui:validator name="max">1000</aui:validator>
       </aui:input>

       <aui:button type="submit" name="save" value="Save" />
</aui:form>