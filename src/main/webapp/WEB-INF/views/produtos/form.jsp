<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastro de produtos</title>
</head>
<body>
	<spring:hasBindErrors name="produto">
		<ul>
			<c:forEach var="error" items="${errors.allErrors}">
				<li><spring:message code="${error.code}" text="${error.defaultMessage}"/></li>
			</c:forEach>
		</ul>
	</spring:hasBindErrors>


	<form method="post" action="/casadocodigo/produtos">
		<div>
			<label for="titulo">Titulo</label> <input type="text" name="titulo"
				id="titulo" />
		</div>
		<div>
			<label for="descricao">Descrição</label>
			<textarea rows="10" cols="20" name="descricao" id="descricao">
			</textarea>
		</div>
		<div>
			<label for="paginas">Número de paginas</label> <input type="text"
				name="paginas" id="paginas" />
		</div>
		<c:forEach items="${tipos}" var="tipoDeLivro" varStatus="status">
			<div>
				<label for="preco_${tipoDeLivro}">${tipoDeLivro}</label> <input
					type="text" name="precos[${status.index}].value"
					id="preco_${tipoDeLivro}" /> <input type="hidden"
					name="precos[${status.index}].tipoDeLivro" value="${tipoDeLivro}" />
			</div>
		</c:forEach>
		<div>
			<input type="submit" value="Enviar">
		</div>
	</form>
</body>
</html>