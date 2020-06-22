<!DOCTYPE html>
<html lang="UTF-8">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>

<div id='designSource4'>
	<div class="designSource4TextBox">
		<p id="1" class="designSource4Title">123</p>
		<div class="space"></div>
		<p id="2" class="designSource4Content">123 <c:out value="=${param.id }"/></p>
		<p id="3" class="designSource4Content">123 <c:out value="=${param.id }"/></p>
	</div>
	<div class="designSource4Space"></div>
	<div class="designSource4ImageBox">
		<div class="designSource4ImgSector"><img src="" class=""/></div>
	</div>
</div>
