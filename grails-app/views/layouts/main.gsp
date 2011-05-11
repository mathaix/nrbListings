<!DOCTYPE html>
<html>
    <head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
        <title><g:layoutTitle default="Nearby Listings" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="application" />
    </head>
    
    <body > 
        <g:render template="/layouts/header" />
		<g:layoutBody />
        <g:render template="/layouts/footer" />
    </body>
</html>