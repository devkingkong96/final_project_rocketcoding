<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.TimeZone" %>
<%@ page import="java.util.Date" %>
<%-- <%@ page import="org.apache.logging.log4j.LogManager" %>
<%@ page import="org.apache.logging.log4j.Logger" %> --%>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<%--<%@ taglib prefix="seo_num" uri="/WEB-INF/views/logistics/formatNumber.tag" %>--%>


<%
    LocalDateTime now = LocalDateTime.now();
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-ddHH:mm");
    String formattedNow = now.format(formatter);
%>
<%--<title>로켓코딩ERP</title>--%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param name="title" value="지점별 재고 현황"/>
</jsp:include>
<script type="text/javascript"
        src="${path }/resources/assets/vendor_components/moment/moment.js"></script>
<%--<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-gothic.css" rel="stylesheet">--%>
<%--<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">--%>
<%-- <script src="${path }/resources/js/pdfmake.min.js"></script>
<script src="${path }/resources/js/vfs_fonts.js"></script> --%>
<%--<link rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>--%>
<!-- <script
src="https://cdn.datatables.net/datetime/1.5.1/js/dataTables.dateTime.min.js"></script> -->

<!-- extract 버튼 가져오기 -->
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script
        src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
<script
        src="https://cdn.datatables.net/buttons/1.2.2/js/dataTables.buttons.min.js"></script>
<script
        src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.colVis.min.js"></script>
<script
        src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.html5.min.js"></script>
<script
        src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.print.min.js"></script>
<script
        src="https://cdn.datatables.net/1.10.12/js/dataTables.bootstrap.min.js"></script>
<script
        src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.bootstrap.min.js"></script>
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
<script
        src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/vfs_fonts.js"></script>
<script
        src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/pdfmake.min.js"></script>
<script
        src="https://cdn.datatables.net/fixedheader/3.1.2/js/dataTables.fixedHeader.min.js"></script>

<style>
    .dt-button-background {
        display: none !important;
    }

    .dt-buttons.btn-group {
        display: block;
    }

    .dataTables_length {
        display: block;
        justify-content: flex-end;
        margin-left: 0;
    }

    .dataTables_info {
        display: block;
        justify-content: flex-end;
    }

    #example1_filter, #example1_info {
        display: block;
        justify-content: flex-end;
    }

    .col-lg-6 col-6 connectedSortable ui-sortable {
        margin-right: 50px;
        margin-left: 50px;
    }

    .dataTables_wrapper .dataTable td {
        white-space: normal;
        word-wrap: break-word;
    }

    .box-table {
        margin-bottom: 400px;
        /*margin-left: 50px;*/
        /*width: 95%;*/
        align-content: center;
    }

    /*    .section-margin {
            margin-left: 20px;
            !*margin: 50px;*!
            !*margin-top: -10px;*!

        }*/

    /*    div {
            margin: 10px;
        }*/

    textarea.form-control {
        width: 200px;
        height: 150px;
        resize: none;
    }

    .input-group-text1 {
        vertical-align: middle;
        position: relative;
        top: 10px;

    }

    .error-border {
        /*border: 2px solid red !important;*/
        border-color: red !important;
    }

    /*.table-striped tbody tr:nth-of-type(odd) {*/
    /*    background-color: #FFFFFF;*/
    /*}*/
</style>


<div class="content-wrapper">
    <div class="container-full">
        <!-- Main content -->
        <section class="content">

            <%--
                        <!-- 모달 -->
                        <div class="col-lg-4 col-12">
                            <div class="box">
                                <div class="box-body">
                                    <h4 class="box-title d-block">Large modal</h4>
                                    <button type="button" class="btn btn-primary"
                                            data-bs-toggle="modal" data-bs-target=".bs-example-modal-lg">
                                        Large modal
                                    </button>
                                </div>
                            </div>
                        </div>
                        <!-- /.col -->

                        <div class="modal fade bs-example-modal-lg" tabindex="-1"
                             role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true"
                             style="display: none;">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title" id="myLargeModalLabel">Large modal</h4>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <h4>Overflowing text to show scroll behavior</h4>
                                        <p>Praesent commodo cursus magna, vel scelerisque nisl
                                            consectetur et. Vivamus sagittis lacus vel augue laoreet rutrum
                                            faucibus dolor auctor.</p>
                                        <p>Aenean lacinia bibendum nulla sed consectetur. Praesent
                                            commodo cursus magna, vel scelerisque nisl consectetur et. Donec
                                            sed odio dui. Donec ullamcorper nulla non metus auctor
                                            fringilla.</p>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-danger text-start"
                                                data-bs-dismiss="modal">Close
                                        </button>
                                    </div>
                                </div>
                                <!-- /.modal-content -->
                            </div>
                            <!-- /.modal-dialog -->
                        </div>
            --%>

            <!-- Content Header (Page header) -->
            <div class="content-header" style="margin-bottom:10px;">
                <div class="d-flex align-items-center">
                    <div class="me-auto">
                        <h5 class="page-title">지점별 재고 현황 (지점 기준)</h5>
                        <div class="d-inline-block align-items-center">
                            <nav>
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="${path}/"> <i
                                            class="mdi mdi-home-outline"></i></a></li>
                                    <li class="breadcrumb-item" aria-current="page">재고 관리</li>
                                    <li class="breadcrumb-item active" aria-current="page">지점별 재고 현황 (지점 기준)
                                    </li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <%--               <div class="col-lg-12 col-12">
                                   <div class=" connectedSortable">
                                       <form name="insertproduct" id="insertproduct"
                                       &lt;%&ndash; method="post"&ndash;%&gt; enctype="multipart/form-data">
                                           <div class="box">
                                               <div class="box-header with-border">
                                                   <h4 class="box-title"><i class="ti-agenda"></i> 책 등록</h4>

                                                   <ul class="box-controls pull-right">
                                                       <li><a class="box-btn-close" href="#"></a></li>
                                                       <li><a class="box-btn-slide" href="#"></a></li>
                                                       <li><a class="box-btn-fullscreen" href="#"></a></li>
                                                   </ul>
                                               </div>

                                               <div class="box-body p-12"> &lt;%&ndash;action="${path }/logistics/write"&ndash;%&gt;

                                                   <div class="row">
                                                       <div class="col-2
                                                       " style="margin-bottom: 20px;">
                                                           <div class="col-12" style="margin-bottom: 5px;">
                                                               <label class="form-label" style="margin:5px;">
                                                                   <i class="si-note si" for="prdTitle"></i>
                                                                   도서명</label>
                                                           </div>
                                                           <input name="prdTitle" id="prdTitle" class="form-control" type="text"
                                                                  placeholder="도서명" required>
                                                       </div>

                                                       <div class="col-2" style="margin-bottom: 20px;">
                                                           <div class="col-12" style="margin-bottom: 5px;">
                                                               <label class="form-label" style="margin:5px;" for="prdAuthor">
                                                                   <i class="si-location-pin si"></i>
                                                                   저자명</label>
                                                           </div>
                                                           <input name="prdAuthor" id="prdAuthor" class="form-control" type="text"
                                                                  placeholder="저자명" required>
                                                       </div>
                                                   </div>
                                                   <div class="row">
                                                       <div class="col-lg-2 col-5" style="margin:0px; margin-top:0px;"><label
                                                               class=" form-label" for="prdGenre">
                                                           <i class="si-organization si" style="margin-right:10px;"></i>장르</label>
                                                           &lt;%&ndash;               <select
                                                                                  class="form-control select2" name="recieveBrcId" multiple="multiple"
                                                                                  data-placeholder="Select a State" style="width: 100%;">&ndash;%&gt;
                                                           <select
                                                                   class="form-control select2 genre" name="prdGenre" id="prdGenre"
                                                                   data-placeholder="장르" style="width: 100%;">
                                                               <option></option>
                                                               <option>소설</option>
                                                               <option>시,에세이</option>
                                                               <option>인문</option>
                                                               <option>가정,육아</option>
                                                               <option>요리</option>
                                                               <option>건강</option>
                                                               <option>취미,실용,스포츠</option>
                                                               <option>경제, 경영</option>
                                                               <option>자기계발</option>
                                                               <option>정치,사회</option>
                                                               <option>역사,문화</option>
                                                               <option>종교</option>
                                                               <option>예술, 대중문화</option>
                                                               <option>중,고등 참고서</option>
                                                               <option>기술, 공학</option>
                                                               <option>외국어</option>
                                                               <option>과학</option>
                                                               <option>취업, 수험서</option>
                                                               <option>여행</option>
                                                               <option>컴퓨터,IT</option>
                                                               <option>잡지</option>
                                                               <option>청소년</option>
                                                               <option>초등참고서</option>
                                                               <option>유아</option>
                                                               <option>어린이</option>
                                                               <option>만화</option>
                                                               <option>대학교재</option>
                                                               &lt;%&ndash;                                                <c:forEach var="entry" items="${uniqueProductList }">

                                                                                                                   <option value="${entry.BRANCH_ID}">${entry.BRANCH_NAME}</option>

                                                                                                               </c:forEach>&ndash;%&gt;
                                                           </select>
                                                       </div>


                                                       <div class="col-lg-2 col-5" style="margin:0px; margin-top:0px" ;><label
                                                               class=" form-label">
                                                           <i class="si-organization si" style="margin-right:10px;" for="pubId"></i>출판사</label>
                                                           &lt;%&ndash;               <select
                                                                                  class="form-control select2" name="recieveBrcId" multiple="multiple"
                                                                                  data-placeholder="Select a State" style="width: 100%;">&ndash;%&gt;
                                                           <select
                                                                   class=" form-control select2" name="pubId" id="pubId"
                                                                   data-placeholder="출판사" style="width: 100%;">
                                                               <option></option>
                                                               <c:forEach var="entry" items="${publisherList }">
                                                                   <option value="${entry.PUB_ID}">${entry.PUB_NAME}</option>
                                                               </c:forEach>
                                                           </select>
                                                       </div>
                                                   </div>

                                                   <div class="row" style="margin-top:10px;">

                                                       <div class="col-lg-2 col-5">
                                                           <label class="form-label" style="margin:5px;"
                                                                  for="publishDate"><i
                                                                   class="si-calendar si"
                                                                   style="margin-right:10px;"></i>
                                                               출판일</label>
                                                           <input class="form-control" id="publishDate" name="publishDate"
                                                                  type="date"
                                                                  id="example-datetime-local-input" required>

                                                       </div>

                                                       <div class="col-lg-2 col-5 form-group">
                                                           <label class="form-label" style="margin:5px;" for="prdPrice">
                                                               <i class="si-calendar si"
                                                                  style="margin-right:10px;"></i>
                                                               판매가</label>
                                                           <div class="input-group"><span class="input-group-addon">&#8361;</span>
                                                               <input type="number" id="prdPrice" name="prdPrice" class="form-control"
                                                                      placeholder="판매가"
                                                                      required
                                                                      data-validation-containsnumber-regex="(\d)+"
                                                                      data-validation-containsnumber-message="숫자만 입력 가능합니다.">
                                                           </div>
                                                       </div>
                                                   </div>
                                                   <div class="row">

                                                       <div class="col-lg-2 col-5 form-group">
                                                           <label class="form-label" style="margin:5px;" for="priceInStk">
                                                               <i class="si-calendar si" style="margin-right:10px;"></i>
                                                               입고 단가</label>
                                                           <div class="input-group"><span class="input-group-addon">&#8361;</span>
                                                               <input type="number" id="priceInStk" name="priceInStk"
                                                                      class="form-control"
                                                                      placeholder="입고 단가"
                                                                      required
                                                                      data-validation-containsnumber-regex="(\d)+"
                                                                      data-validation-containsnumber-message="숫자만 입력 가능합니다.">
                                                           </div>
                                                       </div>
                                                       <div class="form-group col-lg-2 col-5">
                                                           <label class="form-label" style="margin:5px;" for="priceOutStk">
                                                               <i class="si-calendar si" style="margin-right:10px;"></i>
                                                               출고 단가</label>
                                                           <div class="input-group"><span class="input-group-addon">&#8361;</span>
                                                               <input type="number" id="priceOutStk" name="priceOutStk"
                                                                      class="form-control" placeholder="출고 단가"
                                                                      required
                                                                      data-validation-containsnumber-regex="(\d)+"
                                                                      data-validation-containsnumber-message="숫자만 입력 가능합니다.">
                                                           </div>
                                                       </div>

                                                       &lt;%&ndash;    <div class="col-2
                                                           " style="margin-bottom: 20px;">
                                                               <div class="form-group">
                                                                   <div class="col-12" style="margin-bottom: 5px;">
                                                                       <label class="form-label" style="margin:5px;" for="pubPhone">
                                                                           <i class="si-earphones-alt si"></i>
                                                                           연락처</label>
                                                                   </div>
                                                                   <div class="controls">
                                                                       <input name="pubPhone" id="pubPhone" class="form-control"
                                                                              type="text"
                                                                              placeholder="연락처" required
                                                                              data-validation-containsnumber-regex="(\d)+"
                                                                              data-validation-containsnumber-message="숫자만 입력 가능합니다.">
                                                                   </div>
                                                               </div>&ndash;%&gt;
                                                   </div>

                                                   &lt;%&ndash;<div class="col-2
                                                       " style="margin-bottom: 20px;">
                                                       <div class="col-12" style="margin-bottom: 5px;">
                                                           <label class="form-label" style="margin:5px;" for="pubRepresentative">
                                                               <i class="mdi mdi-account-location"></i>
                                                               대표자명</label>
                                                       </div>
                                                       <input name="pubRepresentative" id="pubRepresentative" class="form-control"
                                                              type="text"
                                                              placeholder="대표자명" required>
                                                   </div>&ndash;%&gt;
                                                   <div id="file-container" style="margin-top:25px;">
                                                       &lt;%&ndash;<div class="input-group mb-3"
                                                            style="padding: 0px; margin-top: 10px; margin-left: -10px;">
                                                           <div class="input-group-prepend" style="padding: 0px; ">
                                                               <button type="button"
                                                                       class="waves-effect waves-light btn btn-info-light btn-flat mb-3"
                                                                       onclick="fn_addFileForm();" style="margin:10px;">첨부파일 추가
                                                               </button>
                                                               <button type="button"
                                                                       class="waves-effect waves-light btn btn-danger-light btn-flat mb-3"
                                                                       onclick="fn_deleteFileForm();" style="margin:10px;">첨부파일 삭제
                                                               </button>
                                                           </div>
                                                       </div>&ndash;%&gt;
                                                       <div class="row">
                                                           <div id="basicFileForm" class="input-group col-2"
                                                                style="padding: 0; margin-top:-20px;">
                                                               <div>
                                                                   <div>
                                                                   <span class="input-group-text1"><i
                                                                           class="fa fa-fw fa-file-o"
                                                                           style="margin-right:10px;"></i> 표지 이미지</span>
                                                                   </div>
                                                                   <input type="file" class="custom-file-input" name="upFile"
                                                                          id="upFile1" style="display: none;" accept="image/*"
                                                                          onchange="changeFileFunc(event);">
                                                                   <label
                                                                           class="custom-file-label waves-effect waves-light btn btn-primary-light btn-flat mb-3"
                                                                           for="upFile1" style="margin:10px; margin-top:25px;">파일을
                                                                       선택하세요</label>
                                                                   <div class="col-5 ImageThumbnail-container">
                                                                       <img id="thumbnail" src="" alt="Thumbnail"
                                                                            style="max-width: 300px; max-height: 300px; display: none;">
                                                                   </div>
                                                               </div>

                                                           </div>


                                                       </div>
                                                       &lt;%&ndash;<div class="col-lg-2 col-5">
                                                           <label>
                                                               <!--  <textarea id="editorElementId" class="form-control" name="iv_memo"
                                                                          placeholder="적요"></textarea> -->

                                                               <textarea class="col-lg-2 col-5 form-control" name="ivMemo"
                                                                         placeholder="&#128221;적요" style="display:none;"></textarea>
                                                           </label>
                                                       </div>&ndash;%&gt;
                                                   </div>
                                               </div>
                                               <div name="fileButton"></div>
                                               <br/>
                                               &lt;%&ndash; <div class="col-lg-2 col-5">
                                                    <label class="form-label" style="margin:5px;" for="pubBank"><i
                                                            class="mdi mdi-bank"
                                                            style="margin-right:10px;"></i>
                                                        이체 정보</label>
                                                    <div class="input-group">
                                                        <button type="button" class="btn btn-info btn-sm dropdown-toggle"
                                                                data-bs-toggle="dropdown">은행
                                                        </button>
                                                        <div class="dropdown-menu">
                                                            <a href="#" class="dropdown-item">국민</a>
                                                            <a href="#" class="dropdown-item">농협</a>
                                                            <a href="#" class="dropdown-item">우리</a>
                                                            <a href="#" class="dropdown-item">축협</a>
                                                        </div>
                                                        <input name="pubBank" id="pubBank" type="text" class="form-control"
                                                               placeholder="은행 선택" required>
                                                    </div>
                                                </div>&ndash;%&gt;

                                               <div>
                                                   <div class="col-12"
                                                        style="margin-top:30px; margin-left:430px; align-items: flex-end; margin-bottom:50px;">
                                                       &lt;%&ndash;  <input type="hidden" id="tableData" name="tableData" value="">&ndash;%&gt;
                                                       <input type="hidden" id="prdIsdel" name="prdIsdel" value="N">

                                                       <button type="submit" name="formSubmitButton"
                                                               class="btn btn-primary submitproduct">
                                                           <i class="ti-save-alt" style="margin-right:10px;"></i> 저장
                                                       </button>
                                                   </div>
                                                   &lt;%&ndash;                                        <input type="submit" class="btn btn-outline-success" value="저장">&ndash;%&gt;
                                               </div>
                                           </div>

                                           <script>
                                               const adddelFunction = (function () {
                                                   let count = 2;
                                                   const addFile = () => {
                                                       if (count <= 5) {

                                                           const fileForm = $("#basicFileForm").clone(true);
                                                           fileForm.find("span.input-group-text1").html('<i class="fa fa-fw fa-file-o" style="margin-right:10px;"></i> 첨부파일 ' + count);
                                                           fileForm.find("label.custom-file-label").text("파일을 선택하세요")
                                                               .attr("for", "upFile" + count);
                                                           fileForm.find("input[type=file]").attr("id", "upFile" + count).val("").change(changeFileFunc);
                                                           // alert(fileForm);
                                                           $("div[name=fileBut" +
                                                               "ton]").before(fileForm);
                                                           count++;
                                                       } else {
                                                           alert("첨부파일은 5개까지 가능합니다.");
                                                       }
                                                   };
                                                   const delFile = () => {
                                                       if (count != 2) {
                                                           $("div[name=fileButton]").prev().remove();
                                                           count--;
                                                       }
                                                   };
                                                   return [addFile, delFile];
                                               })();

                                               const fn_addFileForm = adddelFunction[0];
                                               const fn_deleteFileForm = adddelFunction[1];

                                               const changeFileFunc = e => {
                                                   const fileName = e.target.files[0].name;
                                                   $(e.target).next(".custom-file-label").text(fileName);

                                                   const thumbnailImg = document.getElementById("thumbnail");

                                                   if (e.target.files.length > 0) {
                                                       const file = e.target.files[0];
                                                       const reader = new FileReader();

                                                       reader.onload = function (event) {
                                                           const imageUrl = event.target.result;
                                                           thumbnailImg.src = imageUrl;
                                                           thumbnailImg.style.display = "block";
                                                       };

                                                       reader.readAsDataURL(file);
                                                   } else {
                                                       thumbnailImg.src = "";
                                                       thumbnailImg.style.display = "none";
                                                   }
                                               };
                                           </script>
                                       </form>
                                   </div>
                               </div>--%>

                <div class="col-lg-12 col-12">
                    <input type="hidden" id="branch-names" name="branch-names" value=
                    <c:forEach var="branch" items="${branchNameUniqueList}">
                        <c:set var="uniqueBranchNames" value=""/>
                    <c:forEach var="item" items="${branchNameUniqueList}">
                    <c:if test="${not uniqueBranchNames.contains(item.BRANCH_NAME)}">
                        <c:set var="uniqueBranchNames"
                               value="${uniqueBranchNames}${item.BRANCH_NAME},"/>
                    </c:if>
                    </c:forEach>
                        <c:set var="uniqueBranchNames"
                               value="${fn:substring(uniqueBranchNames, 0, fn:length(uniqueBranchNames) - 1)} "/>
                    </c:forEach>

                    ${uniqueBranchNames} 외>

                    <input type="hidden" id="branch-names3" name="branch-names3" value=
                    ${daybyStockList[0]["SELECTED_STK_DATE"]}>


                    <script>
                        var uniqueBottomMessage = "기준 날짜 : " + document.getElementById('branch-names3').value;

                        var uniqueBranchNames = document.getElementById('branch-names').value;
                        uniqueBranchNames = "회사명 : (주)로켓 ERP / " + uniqueBranchNames + " 외";

                        function getCurrentDateTime() {
                            var now = new Date();
                            var year = now.getFullYear();
                            var month = ('0' + (now.getMonth() + 1)).slice(-2);
                            var day = ('0' + now.getDate()).slice(-2);
                            var hour = ('0' + now.getHours()).slice(-2);
                            var minute = ('0' + now.getMinutes()).slice(-2);
                            var second = ('0' + now.getSeconds()).slice(-2);
                            return year + '-' + month + '-' + day + ' ' + hour + ':' + minute + ':' + second;
                        }

                        $(function () {
                            $("#min").datepicker();
                            $("#max").datepicker();
                        });
                        /*                        var select2Element;
                                                var parentElement;
                                                document.addEventListener('DOMContentLoaded', function () {
                                                    parentElement_forEmptyValue = document.querySelector('.form-control.select2.select2-hidden-accessible');
                                                    select2Element_forEmptyValue = parentElement_forEmptyValue.querySelector('.select2-selection.select2-selection--single');

                                                    // 이제 select2Element를 사용할 수 있습니다.
                                                });*/


                        /*          var uniqueBranchNames = "회사명 : (주)로켓 ERP / " + uniqueBranchNames;*/


                        $(document).ready(function () {

                            var path = "${path}";
                            var select2Data = {};

                            $('#example1').DataTable({
                                // 기본 DataTables 설정
                                "paging": false,
                                "lengthChange": true,
                                "searching": false,
                                "info": true,
                                ordering: true,
                                order: [[0, "desc"]],
                                // "editable": true,
                                "responsive": true,
                                /*    "dateFormat": 'YYYY-MM-DD HH:mm', */
                                "dom": '<"dt-buttons">Bflirtp',
                                // "dom": 'Bflir<"branch-names">tp',
                                // dom: '<"top"i>rt<"<"tableInfo">"flp><"clear">',
                                "autoWidth": false,
                                "fixedHeader": true,
                                "drawCallback": function (settings) {
                                    // DataTables가 다시 그려질 때마다 실행됩니다.
                                    $('#example1').editableTableWidget();
                                },

                                columnDefs: [
                                    {targets: '_all', editable: true, orderable: true},
                                    /*                         {
                                                                 targets: 5,
                                                                 /!* orderData: 3, // 정렬을 위해 원본 데이터의 인덱스 지정 *!/
                                                                 render: function (data, type, row) {
                                                                     if (type === 'display' || type === 'filter') {
                                                                         var date = moment(data, 'YYYY-MM-DD HH:mm:ss.S'); // SQL 형식에 맞춰서 변환
                                                                         return date.format('YYYY-MM-DD'); // 원하는 형식으로 표시
                                                                     }
                                                                     /!*                          if (type === 'sort') {
                                                                                                // 정렬을 위해 원본 데이터 형식 사용
                                                                                                return data;
                                                                                              }   *!/
                                                                     return data;
                                                                 },
                                                             }*/
                                ],

                                /*    "ordering": [[0, 'desc']],*/
                                // 수정 불가능한 행 설정
                                /*                    createdRow: function (row, data, dataIndex) {
                                                        if (dataIndex === 6 || dataIndex === 8 || dataIndex === 9) { // 수정 불가능한 행의 인덱스
                                                            $(row).addClass('not-editable');
                                                        }
                                                    },*/
                                "buttons": [{
                                    extend: 'colvis',
                                    text: '일부 컬럼 보기'
                                }, {
                                    extend: 'colvisRestore',
                                    text: '컬럼 복원'
                                }, {
                                    extend: 'copyHtml5',
                                    /*            exportData: {decodeEntities: true}, */
                                    text: '클립보드에 복사',
                                    messageTop: uniqueBranchNames,
                                    messageBottom: '생성 시각 : ' + getCurrentDateTime(),
                                    exportOptions: {
                                        columns: ':visible',
                                        rows: ':visible',
                                        encoding: 'UTF-8'
                                    }
                                }, {
                                    extend: 'csvHtml5',
                                    /*                 exportData: {decodeEntities: true}, */
                                    title: '재고현황 ' + uniqueBottomMessage,
                                    messageTop: uniqueBranchNames,
                                    /*                      messageBottom: '생성 시각 : ' + getCurrentDateTime(),*/
                                    exportOptions: {
                                        columns: ':visible',
                                        rows: ':visible',
                                        encoding: 'UTF-8'
                                    }
                                }, {
                                    extend: 'excelHtml5',
                                    title: '재고현황 ' + uniqueBottomMessage,
                                    /*                 exportData: {decodeEntities: true}, */
                                    messageTop: uniqueBranchNames,

                                    messageBottom: '생성 시각 : ' + getCurrentDateTime(),
                                    exportOptions: {
                                        columns: ':visible',
                                        rows: ':visible',
                                        encoding: 'UTF-8',

                                    }
                                }, /*{
                                    extend: 'pdfHtml5',
                                    /!*          exportData: {decodeEntities: true}, *!/
                                    messageTop: uniqueBranchNames,
                                    messageBottom: '생성 시각 : ' + getCurrentDateTime(),
                                    text: 'PDF',
                                    title: '재고현황 ' + uniqueBottomMessage,
                                    font: 'hangul',

                                    exportOptions: {
                                        columns: ':visible',
                                        rows: ':visible',
                                        encoding: 'UTF-8',

                                        /!*font: 'hangul',*!/
                                        /!*                              customize: function (doc) {
                                                                          // 폰트 설정 추가
                                                                          /!*                       doc.defaultStyle.styles.tableBodyEven.font = 'Roboto';*!/
                                                                          doc.defaultStyle.fonts = 'Roboto';
                                                                          doc.defaultStyle.font = 'Roboto';
                                                                          modifier: {
                                                                              page: 'current'
                                                                          }

                                                                      },*!/

                                    }

                                },*/ {
                                    extend: 'print',
                                    title: '재고현황 ' + uniqueBottomMessage,
                                    messageTop: uniqueBranchNames,
                                    messageBottom: '생성 시각 : ' + getCurrentDateTime(),
                                    /*           exportData: {decodeEntities: true}, */
                                    exportOptions: {
                                        columns: ':visible',
                                        rows: ':visible',
                                        encoding: 'UTF-8'
                                    }
                                }

                                ],
                                "lengthMenu": [[10, 25, 50, 100, -1],
                                    [10, 25, 50, 100, "All"]],
                                "language": {
                                    "lengthMenu": "표시할 항목 수: _MENU_",
                                    "info": "총 _TOTAL_개 중 _START_부터 _END_까지 표시",
                                    "search": "검색:",
                                    "paginate": {
                                        "first": "처음",
                                        "last": "마지막",
                                        "next": "다음",
                                        "previous": "이전",
                                        "emptyTable": "데이터가 없어요.",
                                        "lengthMenu": "페이지당 _MENU_ 개씩 보기",
                                        // "info": "현재 _START_ - _END_ / _TOTAL_건",
                                        "infoEmpty": "데이터 없음",
                                        "infoFiltered": "( _MAX_건의 데이터에서 필터링됨 )",
                                        // "search": "에서 검색: ",
                                        "zeroRecords": "일치하는 데이터가 없어요.",
                                        "loadingRecords": "로딩중...",
                                        "processing": "잠시만 기다려 주세요..."
                                        // "paginate": {
                                        //     "next": "다음",
                                        //     "previous": "이전"

                                        // },
                                    },
                                }
                            });

                            /*                     // 드롭다운 아이템 클릭 시 이벤트 처리
                                                 $('.dropdown-menu a').click(function () {
                                                     var selectedBank = $(this).text(); // 선택된 드롭다운 아이템의 텍스트 값 가져오기
                                                     $('input[name="pubBank"]').val(selectedBank + " "); // input 요소에 선택된 값 설정
                                                 });*/
                            /*          function addCells(data) {

                                          var sheetData = sheet.getElementsByTagName('sheetData')[0];
                                          for (i = 0; i < data.length; i++) {
                                              var key = data[i].key;
                                              var value = data[i].value;

                                              var c = sheet.createElement('c');
                                              c.setAttribute("t", "inlineStr");

                                              //Set styling (added styles to the buttons.html5.min.js file)
                                              switch (value) {
                                                  case 'I':
                                                      c.setAttribute("s", "78");  //REMEMBER ZERO BASED (COUNT -1)
                                                      break;
                                                  case 'Do':
                                                      c.setAttribute("s", "67");  //REMEMBER ZERO BASED (COUNT -1)
                                                      break;
                                                  case 'Not':
                                                      c.setAttribute("s", "68");  //REMEMBER ZERO BASED (COUNT -1)
                                                      break;
                                                  case 'Like':
                                                      c.setAttribute("s", "69");  //REMEMBER ZERO BASED (COUNT -1)
                                                      break;
                                                  case 'XML':
                                                      c.setAttribute("s", "70");  //REMEMBER ZERO BASED (COUNT -1)
                                                      break;
                                                  case 'It':
                                                      c.setAttribute("s", "71");  //REMEMBER ZERO BASED (COUNT -1)
                                                      break;
                                                  case 'Is':
                                                      c.setAttribute("s", "72");  //REMEMBER ZERO BASED (COUNT -1)
                                                      break;
                                                  case 'Too':
                                                      c.setAttribute("s", "73");  //REMEMBER ZERO BASED (COUNT -1)
                                                      break;
                                                  case 'Verbose':
                                                      c.setAttribute("s", "74");  //REMEMBER ZERO BASED (COUNT -1)
                                                      break;
                                              }

                                              var is = sheet.createElement('is');
                                              var t = sheet.createElement('t');
                                              var text = sheet.createTextNode(value)

                                              t.appendChild(text);
                                              is.appendChild(t);
                                              c.appendChild(is);

                                              //Add cells to row 2 (zero-based) of sheet
                                              sheetData.childNodes[1].appendChild(c);
                                          }
                                      }

          //The call to add cells to an existing row (in this case to row 2, which is in the function)
                                      addCells([{key: 'M', value: ''}, {key: 'N', value: 'I'}, {key: 'O', value: 'Do'}, {
                                          key: 'P',
                                          value: 'Not'
                                      }, {key: 'Q', value: 'Like'}, {key: 'R', value: 'XML'}, {key: 'S', value: 'It'}, {
                                          key: 'T',
                                          value: ' Is'
                                      }, {key: 'U', value: 'Too'}, {key: 'V', value: ''}, {key: 'W', value: 'Verbose'}]);*/

                            $('#example1').editableTableWidget().on('change', function (e, newValue) {
                                // alert("change");

                                var cell = $(e.target);
                                // <select> 요소의 변경은 무시
                                if (cell.is('select')) {
                                    return;
                                }

                                // 셀의 데이터가 변경되었을 때의 처리
                                var cell = $(e.target);
                                var columnIdx = cell.index();
                                var rowIdx = cell.closest('tr').index();
                                var table = $('#example1').DataTable();
                                var data = table.row(rowIdx).data();


                                data[columnIdx] = newValue; // 데이터 배열 업데이트

                                /*            // 검색 색인 업데이트 없이 데이터만 업데이트
                                            table.row(rowIdx).data(data);*/
                                table.row(rowIdx).data(data).draw(); // 검색 색인 업데이트
                            });
                            /*                    var prdTitleToIdMapString = '












































































































































































































































                            ${jsonMap}';
                            var prdTitleToIdMap = JSON.parse(prdTitleToIdMapString);

                            var table = $('#example1').DataTable();
                            console.log("prdTitleToIdMap: " + prdTitleToIdMap);*/

                            /*  $(document).on('change', '.chooseBrc', function () {

                                  var currentPagePath = window.location.pathname;
                                  var url = currentPagePath + '/branchempinfo';

                                  var select = $(this);
                                  var branchId = select.val();

                                  $.ajax({
                                      url: url, // 서버 URL
                                      method: 'GET',
                                      data: {
                                          /!* bookName: selectedBook,*!/
                                          branchId: branchId
                                      },
                                      success: function (response) {
                                          console.log(response);
                                          populateSelectOptions(response);
                                      },
                                      error: function (xhr, status, error) {
                                          // 에러 처리
                                          alert('오류가 발생했습니다: ' + error);
                                      }
                                  });

                                  function populateSelectOptions(empInfo) {
                                      var selectElement = document.querySelector('.chooseRecieveEmp');
                                      selectElement.innerHTML = ''; // 기존 옵션 제거

                                      // 서버로부터 받은 데이터를 이용하여 새로운 옵션 생성
                                      var option = document.createElement('option');
                                      empInfo.forEach(emp => {
                                          option = document.createElement('option');
                                          option.value = emp.EMP_NO; // 예: 직원 ID
                                          option.textContent = emp.EMP_NAME; // 예: 직원 이름
                                          selectElement.appendChild(option);
                                      });

                                      // select2 업데이트를 위해 'change' 이벤트를 트리거합니다.
                                      $(selectElement).select2();
                                      $(selectElement).trigger('change');
                                  }

                              });*/

                            /*                            $(document).on('change', 'td .chooseBook', function () {
                                                            /!*       var select = $(this);
                                                                   var selectedBook = select.val(); // 선택된 도서명*!/

                                                            var select = $(this);
                                                            var prdId = select.val();
                                                            var rowIndex = $(this).closest('tr').index();
                                                            select2Data[rowIndex] = prdId;

                                                            var selectedValue = $(this).val(); // 선택된 값 가져오기
                                                            var selectId = selectedValue; // 새로운 ID 생성
                                                            $(this).attr('id', selectId); // ID를 변경된 값으로 설정

                                                            console.log("prdId : " + prdId);
                                                            var selectedTitle = prdTitleToIdMap[prdId];
                                                            var row = select.closest('tr'); // 현재 행 찾기
                                                            var currentPagePath = window.location.pathname;
                                                            var url = currentPagePath + '/prdinfo';
                                                            console.log("prdId: " + prdId);

                                                            console.log("prdTitleToIdMap: " + prdTitleToIdMap);
                                                            // AJAX 요청
                                                            $.ajax({
                                                                url: url, // 서버 URL
                                                                method: 'GET',
                                                                data: {
                                                                    /!* bookName: selectedBook,*!/
                                                                    prdId: prdId
                                                                },
                                                                success: function (response) {

                                                                    console.log("response.PRD_PRICE: " + response.PRD_PRICE);
                                                                    var rowIndex = table.row(row).index();

                                                                    table.cell(rowIndex, 1).data(response.PRD_ID);
                                                                    table.cell(rowIndex, 4).data(response.PRD_PRICE);
                                                                    table.cell(rowIndex, 5).data(response.PRICE_IN_STK);

                                                                    table.draw();

                                                                },
                                                                error: function (xhr, status, error) {
                                                                    // 에러 처리
                                                                    alert('오류가 발생했습니다: ' + error);
                                                                },

                                                            });
                                                        });*/

                            var table = $('#example1').DataTable();

                            /*                            var plusButtonCounter = 1;

                                                        $(document).on('click', '[id$="plusButton"]', function () {

                                                            plusButtonCounter++; // 카운터 증가
                                                            // alert("하이");
                                                            var buttonId = $(this).attr('id'); // 클릭된 버튼의 ID
                                                            console.log("buttonId: " + buttonId);
                                                            var currentRow = $(this).closest('tr');
                                                            console.log("currentRow: " + currentRow);
                                                            var currentRowIndex = currentRow.index();
                                                            console.log("currentRowIndex: " + currentRowIndex);
                                                            /!*            var currentButtonRow = $(this).attr('id').closest('tr');*!/


                                                            var newData = ['<button type="button" id="' + plusButtonCounter + 'plusButton" class="plusButton waves-effect waves-light btn btn-outline btn-primary-light mb-5"></button>', '', '<label class="form-label">도서 선택</label> <select class="chooseBook form-control select2" data-placeholder="도서를 선택하세요" style="width: 100%;"> <option></option>












































































































































































































































                            <c:forEach var="entry" items="${prdTitleToIdMap }"><c:if test="${entry.key != null}"> <option value="












































































































































































































































                            ${entry.value}">












































































































































































































































                            ${entry.key}</option>












































































































































































































































                            </c:if></c:forEach> </select>', '최소 1 입력', '', '', '메모 입력', '<button type="button" id="delButton" class="waves-effect waves-light btn btn-danger-light btn-flat mb-5">삭제</button>'];


                                var firstRowChooseBook = $('#example1 tbody tr:first .choosebook');
                                // alert(firstRowCho