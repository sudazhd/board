<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Upload Result</title>
<script type="text/javascript">
	var result = '${savedName}';
	
	parent.addFilePath(result);
</script>
</head>
<body>

</body>
</html>