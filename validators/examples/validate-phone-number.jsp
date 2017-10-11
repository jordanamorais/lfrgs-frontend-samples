<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>
<%@ taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme" %>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui" %>

<liferay-theme:defineObjects />
<portlet:defineObjects />

<aui:form name="form" action="" method="post">
       <%-- Phone Number --%>
       <aui:input name="phoneNumber" value='' label="Phone Number">
              <aui:validator name="digits"></aui:validator>
              <aui:validator name="minLength">8</aui:validator>
              <aui:validator name="maxLength">10</aui:validator>
       </aui:input>

       <aui:button type="submit" name="save" value="Save" />
</aui:form>