<%@ page import="java.util.*" %>
<%@ page import="spms.vo.Member" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
${"test"}<br>
${'test'}<br>
${20 }<br>
${3.14 }<br>
${true }<br>
${null }<br>


<% //배열에서 꺼내기
pageContext.setAttribute("scores", new int[]{90,80,70,100});
%>
${scores[2] }
<br>

<% //List 객체에서 값 꺼내기
List<String> nameList = new LinkedList<String>();
nameList.add("홍길동");
nameList.add("임꺽정");
nameList.add("일지매");
pageContext.setAttribute("nameList", nameList);
%>

${nameList[1] }
<br>

<% //Map 객체에서 값 꺼내기
Map<String,String> map = new HashMap<String,String>();
map.put("s01","홍길동");
map.put("s02","임꺽정");
map.put("s03","일지매");
pageContext.setAttribute("map", map);
%>

${map.s02 }
<br>

<% //자바 객체에서 프로퍼티 값 꺼내기
pageContext.setAttribute("member", new Member()
									.setNo(100)
									.setName("홍길동")
									.setEmail("hong@test.com"));
%>

${member.email }
<br>

<% //ResourceBundle 객체에서 값 꺼내기
pageContext.setAttribute("myRB", 
			ResourceBundle.getBundle("MyResourceBundle"));
%>

${myRB.OK }
<br>

\${10+20 } = ${10+20 } <br>
\${10-20 } = ${10-20 } <br>
\${10*20 } = ${10*20 } <br>
\${10/20 } = ${10/20 } <br>
\${10%20 } = ${10%20 } <br>
\${10 mod 20 } = ${10 mod 20 } <br>

</body>
</html>