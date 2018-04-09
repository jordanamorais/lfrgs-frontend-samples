<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>
<%@ taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme" %>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui" %>

<liferay-theme:defineObjects />
<portlet:defineObjects />

<aui:form name="form" action="" method="post">
       <%-- Select/Combo box --%>
       <aui:select name="date.month" label="" required="true" cssClass="form-control input-month col-md-6">
          <aui:option disabled="disabled" selected="selected" value="">
            <liferay-ui:message key="month"/>
          </aui:option>
          <c:forEach begin="1" end="${12}" var="month">
              <aui:option value="${month}">${month}</aui:option>
          </c:forEach>
        </aui:select>
      
       <aui:button type="submit" name="save" value="Save" />
</aui:form>