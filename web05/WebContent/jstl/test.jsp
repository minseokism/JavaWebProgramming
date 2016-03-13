<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:out value="안녕하세요"/><br>
	<c:out value="${null }">반갑습니다.</c:out><br>
	<c:out value="안녕하세요!">반갑습니다.</c:out><br>
	<c:out value="${null }"></c:out>
	
	<h3>값 설정 방식</h3>
	<c:set var="username1" value="홍길동"/>
	<c:set var="username2">임꺽정</c:set>
	${username1 }<br>
	${username2 }<br>
	
	<h3>기본 보관소 - page</h3>
	${pageScope.username1 }<br>
	${requestScope.username1 }<br>
	
	<h3>보관소 지정 - scope 속성</h3>
	<c:set var="username3" scope="request">일지매</c:set>
	${pageScope.username3 }<br>
	${requestScope.username3 }<br>
	
	<h3>기존의 값 덮어씀</h3>
	<% pageContext.setAttribute("username4","똘이장군"); %>
	기존값=${username4 }<br>
	<c:set var="username4" value="주먹대장"/>
	덮어쓴 값=${username4 }<br>
	
	<h3>객체의 프로퍼티 값 변경</h3>
	<%!
	public static class MyMember{
		int no;
		String name;
		
		public int getNo(){
			return no;
		}
		public void setNo(int no){
			this.no=no;
		}
		public String getName(){
			return name;
		}
		public void setName(String name){
			this.name=name;
		}
		
	}
	%>
	<%
	MyMember member = new MyMember();
	member.setNo(100);
	member.setName("홍길동");
	pageContext.setAttribute("member",member);
	%>
	
	${member.name }<br>
	<c:set target="${member }" property="name" value="임꺽정"/>
	${member.name }<br>
	
	<h3>보관소에 저장된 값 제거</h3>
	<% pageContext.setAttribute("username1", "홍길동"); %>
	${username1 }<br>
	<c:remove var="username1"/>
	${username1 }<br>
	
	<c:if test="${10 > 20 }" var="result1">
	10은 20보다 크다.<br>
	</c:if>
	${result1 }<br>
	
	<c:if test="${10 <20 }" var="result2">
	10은 20보다 크다<br>
	</c:if>
	${result2 }<br>
	
	<c:set var="userid" value="admin"/>
	<c:choose>
		<c:when test="${userid == 'hong' }">
		홍길동님 반값습니다.
		</c:when>
		<c:when test="${userid == 'leem' }">
		임꺾정님 반값습니다.
		</c:when>
		<c:when test="${userid == 'admin' }">
		관리자 전용 페이지 입니다.
		</c:when>
		<c:otherwise>
		등록되지 않은 사용자입니다.
		</c:otherwise>
	</c:choose>
	<h3>for each</h3>
	<% pageContext.setAttribute("nameList", new String[]{"홍길동","임꺽정","일지매"}); %>
	<ul>
	<c:forEach var="name" items="${nameList }">
		<li>${name }</li>
	</c:forEach>
	</ul>
	
	<%
	ArrayList<String> nameList3 = new ArrayList<String>();
	nameList3.add("홍길동");
	nameList3.add("임꺽정");
	nameList3.add("일지매");
	nameList3.add("주먹대장");
	nameList3.add("똘이장군");
	pageContext.setAttribute("nameList3", "홍길동,임꺽정,일지매,주먹대장,똘이장군");
	%>
	
	<ul>
	<c:forEach var="name" items="${nameList3 }">
		<li>${name }</li>
	</c:forEach>
	</ul>
	<ul>
	<c:forEach var="no" begin="1" end="6">
		<li><a href="jstl10${no }.jsp">jstl 예제 ${no }</a></li>
	</c:forEach>
	</ul>
	
	<% pageContext.setAttribute("tokens", "v1=20&v2=30&op=+"); %>
	<ul>
	<c:forTokens var="item" items="${tokens } " delims="&">
		<li>${item }</li>
	</c:forTokens>
	</ul>
	
	<c:url var="calcUrl" value="http://localhost:9999/web05/calc/Calculator.jsp">
		<c:param name="v1" value="20"/>
		<c:param name="v2" value="30"/>
		<c:param name="op" value="+"/>
	</c:url>
	<a href="${calcUrl }">계산하기</a>


</body>
</html>