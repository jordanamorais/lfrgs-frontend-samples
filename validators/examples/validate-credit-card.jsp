<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>
<%@ taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme" %>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui" %>

<liferay-theme:defineObjects />
<portlet:defineObjects />

<aui:form name="form" action="" method="post">
      <%-- (Custom) Credit Card --%>
      <aui:input type="text" cssClass="form-control col-xs-12" id="nome" name="card.name" required="true" placeholder="card.name" label="">
          <aui:validator name="custom"  errorMessage="card.name.alpha.only">
              function (val, fieldNode, ruleValue) {
                      var returnValue = true;
                      var iChars = "~`!@#$%^&*()_+=-[]\\\';,./{}|\":<>?0123456789";
                      for (var i = 0; i < val.length; i++) {
                          if (iChars.indexOf(val.charAt(i)) != -1) {                  
                           returnValue = false;
                          }
                      }
                      return returnValue;
              }
          </aui:validator>
      </aui:input>

       <aui:button type="submit" name="save" value="Save" />
</aui:form>