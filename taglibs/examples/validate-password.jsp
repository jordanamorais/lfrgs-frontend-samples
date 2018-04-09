<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>
<%@ taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme" %>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui" %>

<liferay-theme:defineObjects />
<portlet:defineObjects />

<aui:form name="form" action="" method="post">
       <%-- Password --%>
       <aui:input name="password1" id="password1" value='' label="Password"
              type="password">
              <aui:validator name="required"></aui:validator>
       </aui:input>
       
       <%-- Re-type password --%>
       <aui:input name="password2" value='' label="Re Type Password"
              type="password">
              <aui:validator name="required" />
              <aui:validator name="equalTo">'#<portlet:namespace />password1'</aui:validator>
       </aui:input>

       <aui:button type="submit" name="save" value="Save" />
</aui:form>