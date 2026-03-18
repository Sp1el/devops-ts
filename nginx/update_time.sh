#!/bin/bash

TIME=$(date)

echo "<html>
<head>
<meta charset=\"UTF-8\">
</head>
<body>
<h1>Hello DevOps world!</h1>
<p>Current time: $TIME</p>
</body>
</html>" >  /usr/share/nginx/html/index.html
