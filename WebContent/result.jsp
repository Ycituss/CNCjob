<%@page import="javax.xml.transform.Templates"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.io.*"
    import="java.util.*"
    import="myfirstwebproject.*"
    import="net.sf.json.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>POST数据报发送结果</title>
</head>
<body>
<%
File file = new File("/home/tomcat/apache-tomcat-9.0.36/webapps/temp.txt");
FileReader fr = new FileReader(file);
BufferedReader br = new BufferedReader(fr);
StringBuffer strB = new StringBuffer();
String str = br.readLine();
while(str != null){
	strB.append(str).append("<br>");
	str = br.readLine();
}
br.close();
/*
String s = strB.toString();
JSONArray json = new JSONArray(s);

if(json != null){
    for(int i=0; i<json.length(); i++){
        JSONObject job = json.getJSONObject(i);
        out.println(job.get("name"));
        out.println(job.get("studentnumber"));
    }
    //out.println(json);
}*/

 %>
 <h2>
 <center>
 <%=strB %>
 </center>
 </h2>
 
</body>
</html>