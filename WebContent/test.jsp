<%@page import="javax.xml.transform.Templates"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.io.*"
    import="java.util.*"
    import="CNCjob.*"
    import="net.sf.json.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>自动刷新</title>
</head>
<body>
<center>
<h2>
<%   // 设置每隔5秒自动刷新
   response.setIntHeader("Refresh", 5);
   // 获取当前时间
   Calendar calendar = new GregorianCalendar();
   String am_pm;
   int year = calendar.get(Calendar.YEAR);
   int month = calendar.get(Calendar.MONTH);
   month++; //月份计数从0开始，加1获得正确月份
   int day = calendar.get(Calendar.DATE);
   int hour = calendar.get(Calendar.HOUR);
   int minute = calendar.get(Calendar.MINUTE);
   int second = calendar.get(Calendar.SECOND);
   if(calendar.get(Calendar.AM_PM) == 0)
      am_pm = "AM";
   else
      am_pm = "PM";
   String CT = year+"."+month+"."+day+" "+hour+":"+ minute +":"+ second +" "+ am_pm;
   out.println("当前时间: " + CT + "\n"); %>
</h2>
<h2>
<% String postData = Common.getPostData(request.getInputStream(), request.getContentLength(), null);
//out.println(postData);
//String post = postData.substring(0, postData.length()-1);
JSONArray json = JSONArray.fromObject(postData);

File file = new File("/home/tomcat/apache-tomcat-9.0.36/webapps/temp.txt");
if(!file.exists()){
	   file.createNewFile();
}
String s = new String();

try{
	if(!json.isEmpty()){      //判断是否接收到数据
	    for(int i=0; i<json.length(); i++){
	        JSONObject job = json.getJSONObject(i);
	        out.println("接收到数据</br>");
	        out.println("姓名:" + job.get("name"));                  //获取键值为“name”的数据
	        out.println("  学号:" + job.get("studentnumber"));         //获取键值为“studentnumber”的数据
	        s = s + "\n" + CT + " " + "姓名:" + job.get("name") + "  学号:" + job.get("studentnumber");
	    }
	    //out.println(json);
	    /*
	    将数据存入文件
	    */
	    byte[] b = s.getBytes();
	    int l = s.length();
	    OutputStream os = new FileOutputStream(file,true);
	    os.write(b);        
	    os.close();
	}
	else 
	    out.println("没有接收到任何POST数据报"); 
}catch(Exception e){
	out.println("没有接收到任何POST数据报");
}

	

%>
</h2>
</center>
</body>
</html>