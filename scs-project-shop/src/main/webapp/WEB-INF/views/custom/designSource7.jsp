<!DOCTYPE html>
<html lang="UTF-8">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<div id='designSource7'>
	<div class="designSource7Underline"></div>
	<div class="designSource7Textbox">
	<p id="1" class="designSource7Title">${contentsList.get(0).getContent() } </p>
	<textarea id="2" class="designSource7TextArea">${contentsList.get(1).getContent() } </textarea>
	</div>
</div>