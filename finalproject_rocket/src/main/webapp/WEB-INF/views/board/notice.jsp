<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param name="title" value=""/>
</jsp:include>
<div class="content-wrapper">
   <div class="container-full">
      <!-- Main content -->
      <section class="content">
         <body class="hold-transition light-skin sidebar-mini theme-primary fixed">
    <div class="col-12">
         <div class="box">
               <div class="box-header with-border">
                 <h3 class="box-title">★공지사항★</h3>
                 <hr color="black" size="7">
               </div>
               <!-- /.box-header -->
               <div class="box-body">
                   <div class="table-responsive">
                     <table id="example1" class="table table-bordered table-striped">
                       <thead>
                           <tr>
                               <th>번호</th>
                               <th>제목</th>
                               <th>작성자</th>
                               <th>조회수</th>
                               <th>작성일</th>
                             
                           </tr>
                       </thead>
                       <tbody>
                           <tr>
                               <td></td>
                               <td></td>
                               <td></td>
                               <td></td>
                               <td></td>
                           </tr>
                       </tbody>
                  
                     </table>
                   </div>
               </div>
             </div>
  	</div>
 </body>
      </section>
   </div>
</div>
	<!-- Vendor JS -->
	<script src="src/resources/js/vendors.min.js"></script>
	<script src="src/resources/js/pages/chat-popup.js"></script>
	<script
		src="src/resources/js/assets/icons/feather-icons/feather.min.js"></script>
	<script
		src="src/resources/js/assets/vendor_components/datatable/datatables.min.js"></script>

	<!-- CRMi App -->
	<script src="src/resources/js/template.js"></script>

	<script src="src/resources/js/pages/data-table.js"></script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>