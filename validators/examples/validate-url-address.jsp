<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>
<%@ taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme" %>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui" %>

<liferay-theme:defineObjects />
<portlet:defineObjects />

<aui:form name="form" action="" method="post">
       <%-- URL Adress --%>
       <aui:input name="site" value='' label="Site Address">
              <aui:validator name="url" />
       </aui:input>

       <aui:button type="submit" name="save" value="Save" />
</aui:form>