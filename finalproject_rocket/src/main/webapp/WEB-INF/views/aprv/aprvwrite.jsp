<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">

    <jsp:param name="title" value="" />
</jsp:include>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<style>
    
   
 	table {
	    width: 100%;
	    border-collapse: collapse;
	}
	
	th,
	td {
	    border: 1px solid black;
	    padding: 15px;
	    text-align: left;
	}
	
	th {
	    background-color: #f2f2f2;
	} 
	
	
	</style>


<%
	Date date = new Date();
	SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
	String strDate = simpleDate.format(date);
	

%>


<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <div class="container-full">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="d-flex align-items-center">
                <div class="me-auto">
                    <h4 class="page-title">Editors</h4>
                    <div class="d-inline-block align-items-center">
                        <nav>
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="#"><i class="mdi mdi-home-outline"></i></a></li>
                                <li class="breadcrumb-item" aria-current="page">Forms</li>
                                <li class="breadcrumb-item active" aria-current="page">Editors</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-12">
                    <div class="box">
                        <div class="box-header">
                            <h3>결재문서 작성</h3>
                            <div class="row">
                                <div class="col-md-12 col-12">
                                	<table>
	                                   	 <tr>
	                                    	<th>
	                                    		<p>양식설정</p>
	                                    	</th>
	                                    	<td>
	                                    		<select class="form-control select2" id="tagSelect" onchange="tagSelect()">
		                                            <option selected="selected" value="">양식을 선택하세요</option>
		                                            <option value="option1">휴가양식</option>
		                                            <option value="option2">재고양식</option>              
	                                        	</select>
	                                    	</td>
	                                    	<th rowspan="2">
	                                    		<p>기안자</p>
	                                    	</th>
	                                    	<td>홍길동</td>
	                                    </tr>
                                	</table>
                                </div>
                                <div id="contentContainer" style="display: none">
                                    <div>
                                        <div>
                                            <div>
                                                <div>
                                                    <div class="box-body" style="display: flex;">
                                                        <h4>결재선 설정</h4>
                                                        &nbsp;&nbsp;&nbsp;
                                                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target=".bs-example-modal-lg">
                                                            결재선 추가
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /.col -->
                                           <div class="table table-bordered mb-0">
											    <table style="border: 1px solid black;" id="aprvtable">								
											            <tr style="background-color: #f2f2f2;">
											               <td rowspan="4" style="text-align: center;">결재</td>
											            </tr>
											            <tr style="background-color: #f2f2f2;">
											                <td>이름</td>
											                <td>이름</td>
											                <td>이름</td>
											                <td>이름</td>
											            </tr>
											            <tr style="height: 120px">
											                <td>도장</td>
											                <td>도장</td>
											                <td>도장</td>
															<td>도장</td>
														</tr>
											            <tr>
											                <td>직책</td>
											                <td>직책</td>
											                <td>직책</td>
											                <td>직책</td>
											            </tr>
											        </tbody>
											    </table>
											</div>
										</div>
										
                                        <form action="${path }/aprv/insertaprv" method="post">
                                            <div class="box-header">
                                                <h4 class="box-title">제목<br>
                                                    <input type="text" name="" class="form-control" style="width: 500px">
                                                </h4>
                                            </div>
                                            <!-- /.box-header -->
                                            <div class="box-body">
                                                <h4 class="box-title">본문</h4>
                                                <div id="tagCont">                                                   
                                                    
												

                                                </div>
                                                <br>
                                                <button class="btn btn-primary" type="submit">제출하기</button>
                                        </form>
                                    </div>
                                </div>
                                <!-- /.box -->
                            </div>
                            <!-- /.col-->
                        </div>
                        <!-- ./row -->
                        <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none; width: 100%" >
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content" style="background-color: white;">
                                    <div class="modal-header">
                                        <h4 class="modal-title" id="myLargeModalLabel">결재선 설정</h4>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="myBtn"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div id="flex-cotainer" style="display: flex" >
                                              
                                         
								  <div class="multinav-scroll" style="height: 97%;">	
									  <!-- sidebar menu-->
									  <ul class="sidebar-menu" data-widget="tree">					  
										<li class="treeview">
										  <a href="#">
											<i class="icon-Library"><span class="path1"></span><span class="path2"></span></i>
											<span>로켓서점 &nbsp;&nbsp;&nbsp;&nbsp;</span>
											<span class="pull-right-container">
											  <i class="fa fa-angle-right pull-right"></i>
											</span>
										  </a>
										  <ul class="treeview-menu">											
											<li class="treeview">
												
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;												
												<input name="group4" type="radio" id="radio_1" class="radio-col-danger" />
												<label for="radio_1">일부</label>
												
											</li>												
											<li class="treeview">
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<input name="group4" type="radio" id="radio_2" class="radio-col-danger" />
												<label for="radio_2">인사부</label>
											</li>										
											<li class="treeview">
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<input name="group4" type="radio" id="radio_3" class="radio-col-danger" />
												<label for="radio_3">재고부</label>
											</li>									
											<li class="treeview">
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<input name="group4" type="radio" id="radio_13" class="radio-col-danger" />
												<label for="radio_13">부부</label>
											</li>
											<li class="treeview">
												<a href="#">
													<i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>아이부
													<span class="pull-right-container">
														<i class="fa fa-angle-right pull-right"></i>
													</span>
												</a>
												<ul class="treeview-menu">
													<li><a href="component_bootstrap_switch.html"><i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>장원영</a></li>
													<li><a href="component_date_paginator.html"><i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>안유진</a></li>	
												</ul>
											</li>  
										  </ul>
										</li>                        
                                        </div>
                                            <div id="btn-container" class="b-groove">
                                                select emp_name from employee where 부서코드 =
                                            </div>
                                            <div id="table-container" class="b-groove">
                                                그거 저장해야되는데 어케하지????
                                            </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-danger text-start" data-bs-dismiss="modal">Close</button>
                                    </div>
                                </div>
                                <!-- /.modal-content -->
                            </div>
                            <!-- /.modal-dialog -->
                        </div>
                        <!-- /.modal -->
                    </div>
                </div>
            </div>
        </section>
        <!-- /.content -->
    </div>
</div>
<!-- /.content-wrapper -->
<script>
    $(function() {
        // 6 create an instance when the DOM is ready
        $('#jstree').jstree();
        // 7 bind to events triggered on the tree
        $('#jstree').on("changed.jstree", function(e, data) {
            console.log(data.selected);
        });
    });
</script>




<script>
    function tagSelect() {
        var x = document.getElementById("tagSelect").value;

        if (x === "option1") {
        	document.getElementById("contentContainer").style.display ="block";
            document.getElementById("tagCont").innerHTML = "";
            document.getElementById("tagCont").innerHTML = `
        <style>
            table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid black;
            padding: 15px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        </style>
        <table>
            <thead>
                <th colspan="2"><h1 style="text-align: center;">휴가신청서</h1></th>
            </thead>
            <tbody>
                <tr>
                    <td>성명</td>
                    <td><input type="text"></td>
                </tr>
                <tr>
                    <td>부서</td>
                    <td>[당신의 부서]</td>
                </tr>
                <tr>
                    <td>기간</td>
                    <td>[휴가를 사용할 날짜]</td>
                </tr>
                <tr>
                    <td>휴가종류</td>
                    <td>[사용할 휴가의 종류]</td>
                </tr>
                <tr>
                    <td>휴가사유</td>
                    <td><textarea>texttext</textarea></td>
                </tr>
                <tr style="height: 500px">
                    <td colspan="2" style="text-align: center;">상기와 같은 이유로 휴가를 신청합니다.<br><br><br><br><br><br>
                    <%=strDate %></td>
                </tr>
            </tbody>
        </table>`;
        } else if (x === "option2") {
        	document.getElementById("contentContainer").style.display ="block";
            document.getElementById("tagCont").innerHTML = "";
            document.getElementById("tagCont").innerHTML = "";
        }else {
        	document.getElementById("contentContainer").style.display ="none";
        	document.getElementById("tagCont").innerHTML = "";
        }
    }
</script>
<script>




</script>



<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<!-- jstree CSS -->

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.12/themes/default/style.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.12/jstree.min.js"></script>