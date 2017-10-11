<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>
<%@ taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme" %>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui" %>

<liferay-theme:defineObjects />
<portlet:defineObjects />

<aui:form name="form" action="" method="post">
       <%-- (Custom) Age --%>
       <aui:input name="age" value='' label="Age">
            <aui:validator name="custom" errorMessage="You must have 22 years or more">
                function (val, fieldNode, ruleValue) {
                  var result = false;
                      
                    if (val >=22) {
                      result = true;
                    }
                      return result;
                }
            </aui:validator>
       </aui:input>

       <aui:button type="submit" name="save" value="Save" />
</aui:form>