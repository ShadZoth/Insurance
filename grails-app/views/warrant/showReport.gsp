<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title><g:message code="warrant.showReport.label"
                      default="Report generation"/></title>
</head>

<body>
<g:if test="${certificateFail}">
    <g:message code="warrant.showReport.certificateFail.label"
               default="Insured vehicle should have at least one certificate"/>
</g:if>
<g:if test="${companyFail}">
    <g:message code="warrant.showReport.companyFail.label"
               default="Only contracts with persons can be printed"/>
</g:if>
<g:if test="${!certificateFail && !companyFail}">
    <g:message code="warrant.showReport.success.label"
               default="Contract is ready to be printed"/>
    <g:jasperReport jasper="product" format="PDF"
                    warrant_id="${warrantInstance.id}">
        <input type="hidden" name="warrant_id" value="${warrantInstance?.id}"/>
    </g:jasperReport>
</g:if>
</body>
</html>