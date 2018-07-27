<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="ala"/>
		<title>Name Index Explorer</title>
	</head>
	<body>
	<h1>Name Index Explorer</h1>
    <div id="name-query">
	<g:form controller="explorer">
		<fieldset>
            <h3>Name</h3>
			<div class="text-input">
				<label for="scientificName"><g:message code="page.label.scientificName"/></label>
				<g:textField id="scientificName" name="scientificName" class="form-control"
							 value="${source?.scientificName}"
							 title="${message(code: 'page.label.scientificName.detail')}"/>
			</div>
			<div class="text-input">
				<label for="authorship"><g:message code="page.label.authorship"/></label>
				<g:textField id="authorship" name="authorship" class="form-control"
							 value="${source?.authorship}"
							 title="${message(code: 'page.label.authorship.detail')}"/>
			</div>
		</fieldset>
        <fieldset>
            <h3>Hints</h3>
            <div class="text-input">
                <label for="kingdom"><g:message code="page.label.kingdom"/></label>
                <g:textField id="kingdom" name="kingdom" class="form-control"
                             value="${source?.kingdom}"/>
            </div>
            <div class="text-input">
                <label for="phylum"><g:message code="page.label.phylum"/></label>
                <g:textField id="phylum" name="phylum" class="form-control"
                             value="${source?.phylum}"/>
            </div>
            <div class="text-input">
                <label for="klass"><g:message code="page.label.class"/></label>
                <g:textField id="klass" name="klass" class="form-control"
                             value="${source?.klass}"/>
            </div>
            <div class="text-input">
                <label for="rank"><g:message code="page.label.rank"/></label>
                <g:textField id="rank" name="rank" class="form-control"
                             value="${source?.rank}"/>
            </div>
        </fieldset>
        <fieldset>
		<div class="form-submit">
			<g:actionSubmit action="index" value="${message(code: 'page.label.check')}"/>
		</div>
        </fieldset>
	</g:form>
    </div>
    <div id="name-result">
	<g:if test="${result}">
	<h3>Result</h3>
        <g:set var="cl" value="${result.result?.rankClassification}"/>
		<table class="matched-name">
			<tbody>
            <tr>
                <td class="property-label"><g:message code="page.label.scientificName"/></td>
                <td class="property-value"><exp:nameLink name="${cl?.scientificName}" id="${result.result?.lsid}"/></td>
                <td class="property-label"><g:message code="page.label.authorship"/></td>
                <td class="property-value">${cl?.authorship}</td>
            </tr>
            <tr>
            </tr>
            <tr>
                <td class="property-label"><g:message code="page.label.rank"/></td>
                <td class="property-value"><g:fieldValue bean="${result.result}" field="rank"/></td>
                <td class="property-label"><g:message code="page.label.kingdom"/></td>
                <td class="property-value"><exp:nameLink name="${cl?.kingdom}" id="${cl?.kid}"/></td>
            </tr>
            <tr>
                <td class="property-label"><g:message code="page.label.nameType"/></td>
                <td class="property-value">${result.nameType}</td>
                <td class="property-label"><g:message code="page.label.phylum"/></td>
                <td class="property-value"><exp:nameLink name="${cl?.phylum}" id="${cl?.pid}"/></td>
            </tr>
            <tr>
                <td class="property-label"><g:message code="page.label.matchType"/></td>
                <td class="property-value">${result.result?.matchType}</td>
                <td class="property-label"><g:message code="page.label.class"/></td>
                <td class="property-value"><exp:nameLink name="${cl?.klass}" id="${cl?.cid}"/></td>
            </tr>
 			<tr>
                <td class="property-label"><g:message code="page.label.errors"/></td>
                <td class="property-value">${matchErrors}</td>
				<td class="property-label"><g:message code="page.label.order"/></td>
				<td class="property-value"><exp:nameLink name="${cl?.order}" id="${cl?.oid}"/></td>
			</tr>
            <tr>
                <td class="property-label"><g:message code="page.label.soundex"/></td>
                <td class="property-value">${soundex.genus} ${soundex.species}</td>
                <td class="property-label"><g:message code="page.label.family"/></td>
                <td class="property-value"><exp:nameLink name="${cl?.family}" id="${cl?.fid}"/></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td class="property-label"><g:message code="page.label.genus"/></td>
                <td class="property-value"><exp:nameLink name="${cl?.genus}" id="${cl?.gid}"/></td>
            </tr>
            <tr>
                <td class="property-label"><g:message code="page.label.notes"/></td>
                <td class="property-value" colspan="3">${issues}</td>
            </tr>
			</tbody>
		</table>
	</g:if>
    </div>
	</body>
</html>
