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
<c:set var="loginEmp" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal}"/>

<%--<%@ taglib prefix="seo_num" uri="/WEB-INF/views/logistics/formatNumber.tag" %>--%>


<%
    LocalDateTime now = LocalDateTime.now();
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-ddHH:mm");
    String formattedNow = now.format(formatter);
%>
<%--<title>로켓코딩ERP</title>--%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param name="title" value="재고 현황 조회"/>
</jsp:include>
<script type="text/javascript"
        src="${path }/resources/assets/vendor_components/moment/moment.js"></script>


<style>

    /* To hide */
    #zmmtg-root {
        display: none;
    }

    /* To show */
    #zmmtg-root {
        display: block;
    }


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

    html, body {
        min-width: 0 !important;
    }

    #zmmtg-root {
        display: none;
        min-width: 0 !important;
    }

    main {
        width: 70%;
        margin: auto;
        text-align: center;
    }

    main button {
        margin-top: 20px;
        background-color: #2D8CFF;
        color: #ffffff;
        text-decoration: none;
        padding-top: 10px;
        padding-bottom: 10px;
        padding-left: 40px;
        padding-right: 40px;
        display: inline-block;
        border-radius: 10px;
        cursor: pointer;
        border: none;
        outline: none;
    }

    main button:hover {
        background-color: #2681F2;
    }

    video {
        width: 500px;
        height: auto;
    }

    .small-btn {
        padding: 5px 10px; /* 상하 좌우 패딩 조정 */
        font-size: 12px; /* 폰트 크기 조정 */
        border-radius: 4px; /* 버튼의 모서리를 둥글게 */
    }
</style>


<div class="content-wrapper">
    <div class="container-full">
        <!-- Main content -->
        <section class="content">

            <!-- Content Header (Page header) -->
            <div class="content-header" style="margin-bottom:10px;">
                <div class="d-flex align-items-center">
                    <div class="me-auto">
                        <h5 class="page-title">재고 현황 검색</h5>
                        <div class="d-inline-block align-items-center">
                            <nav>
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="${path}/"> <i
                                            class="mdi mdi-home-outline"></i></a></li>
                                    <li class="breadcrumb-item" aria-current="page">재고 관리</li>
                                    <li class="breadcrumb-item active" aria-current="page">재고 현황 검색
                                    </li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12 col-12">

                    <div class="box">
                        <div class="box-header">


                            <h4 class="box-title"><strong>화상 회의</strong>
                            </h4>
                            <h6 class="subtitle">화상 회의</h6>
                        </div>

                        <div class="box-body">

                            <div>
                                <%--       <div name="${loginEmp.empName}"></div>--%>
                                <!-- your number -->
                                <br>
                                <div id="number" style="margin-left:10px;"></div>
                                <br>

                                <!-- camera -->
                                <div>
                                    <button id="startcam" class="btn btn-primary small-btn" style="display: none;">카메라
                                        켜기
                                    </button>
                                </div>
                                <div>
                                    <button id="stopcam" class="btn btn-primary small-btn" style="display: none;">카메라
                                        끄기(통화 중일 시
                                        종료됩니다)
                                    </button>
                                </div>

                                <!-- dialer/calling -->
                                <div>
                                    <button id="startcall" class="btn btn-primary small-btn">화상통화 걸기</button>
                                    <input id="dial" placeholder="상대방 화상통화 코드 입력"></div>
                            </div>
                            <br>
                            <div>
                                <button id="stopcall" class="btn btn-primary small-btn">화상 통화 끄기</button>
                            </div>
                            <br>

                            <!-- Video Feeds -->
                            <div id="video-out">
                                <%--          <div style="position: absolute; bottom: 0; left: 30%; transform: translateX(-50%); background-color: rgba(0,0,0,0.5); color: white; padding: 5px;">
                                              ${loginEmp.empName}
                                          </div>--%>
                            </div>


                            <!-- Libs and Scripts -->
                            <script src="${path}/resources/js/call/webrtc-v2.js"></script>
                            <script>playCount = 0;</script>
                            <script>
                                var someEmpName = "${loginEmp.empName}";
                                var someEmpNo = "${loginEmp.empNo}";
                                var string2 = someEmpName + someEmpNo;
                                string2 = string2 + Math.ceil(Math.random() * 10000);

                            </script>
                            <script>(() => {
                                'use strict';


                                let session = null;
                                // const number = Math.ceil(Math.random() * 10000);
                                const phone = PHONE({
                                    number: string2
                                    , autocam: true
                                    , publish_key: 'pub-c-6ee7f3b6-134c-41cc-8221-b66f0806f1c8'
                                    , subscribe_key: 'sub-c-f2fe376d-283b-47a7-a6dc-f4819d38cbed'
                                    , ssl: false
                                });

                                // Debugging Output
                                phone.debug(info => console.info(info));

                                // Show Number
                                phone.$('number').innerHTML = '<h4>화상통화 코드: ' + string2 + '</h4>';


                                // Start Camera
                                phone.bind(
                                    'mousedown,touchstart'
                                    , phone.$('startcam')
                                    , event => phone.camera.start()
                                );

                                // Stop Camera
                                phone.bind(
                                    'mousedown,touchstart'
                                    , phone.$('stopcam')
                                    , event => phone.camera.stop()
                                );

                                // Local Camera Display
                                phone.camera.ready(video => {
                                    phone.$('video-out').appendChild(video);
                                });

                                // As soon as the phone is ready we can make calls
                                phone.ready(() => {

                                    // Start Call
                                    phone.bind(
                                        'mousedown,touchstart'
                                        , phone.$('startcall')
                                        , event => session = phone.dial(phone.$('dial').value)
                                    );

                                    // Stop Call
                                    phone.bind(
                                        'mousedown,touchstart'
                                        , phone.$('stopcall')
                                        , event => phone.hangup()
                                    );

                                });

                                phone.receive(function (session) {
                                    // Display Your Friend's Live Video
                                    session.connected(function (session) {
                                        if (!session.isVideoAppended) {
                                            phone.$('video-out').appendChild(session.video);
                                            session.isVideoAppended = true; // 이미 video를 추가했음을 표시
                                        }
                                    });
                                });

                            })();

                            // 화상 통화 끄기 버튼을 클릭할 때 실행될 함수
                            document.getElementById("stopcall").addEventListener("click", function () {
                                // video-container div를 찾아서 삭제
                                var videoContainer = document.getElementById("video-container");
                                if (videoContainer) {
                                    videoContainer.parentNode.removeChild(videoContainer);
                                }
                            });
                            </script>
                        </div>
                    </div>
                </div>
            </div>


    </section>
</div>
</div>
<script src="${path }/resources/js/pages/validation.js"></script>
<script src="${path }/resources/js/pages/form-validation.js"></script>
<%--
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>--%>
<footer class="main-footer">
    &copy;
    <script>document.write(new Date().getFullYear())</script>
    All Rights Reserved.
</footer>
<!-- Vendor JS -->
<script src="${path}/resources/js/vendors.min.js"></script>
<script src="${path}/resources/js/pages/chat-popup.js"></script>
<script src="${path}/resources/assets/icons/feather-icons/feather.min.js"></script>
<script src="${path}/resources/assets/vendor_components/datatable/datatables.min.js"></script>
<script src="${path }/resources/assets/vendor_components/tiny-editable/mindmup-editabletable.js"></script>
<script src="${path }/resources/assets/vendor_components/tiny-editable/numeric-input-example.js"></script>
<script src="${path }/resources/assets/vendor_components/jquery-ui/jquery-ui.js"></script>
<script src="${path }/resources/assets/vendor_components/dropzone/dropzone.js"></script>

<script src="${path}/resources/assets/vendor_components/moment/min/moment.min.js"></script>
<script src="${path}/resources/assets/vendor_components/fullcalendar/fullcalendar.js"></script>

<script src="${path}/resources/assets/vendor_components/bootstrap-select/dist/js/bootstrap-select.js"></script>
<script src="${path}/resources/assets/vendor_components/bootstrap-tagsinput/dist/bootstrap-tagsinput.js"></script>
<script src="${path}/resources/assets/vendor_components/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.js"></script>
<script src="${path}/resources/assets/vendor_components/select2/dist/js/select2.full.js"></script>
<script src="${path}/resources/assets/vendor_plugins/input-mask/jquery.inputmask.js"></script>
<script src="${path}/resources/assets/vendor_plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="${path}/resources/assets/vendor_plugins/input-mask/jquery.inputmask.extensions.js"></script>
<script src="${path}/resources/assets/vendor_components/bootstrap-daterangepicker/daterangepicker.js"></script>
<script src="${path}/resources/assets/vendor_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<script src="${path}/resources/assets/vendor_components/bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
<script src="${path}/resources/assets/vendor_plugins/timepicker/bootstrap-timepicker.min.js"></script>
<script src="${path}/resources/assets/vendor_plugins/iCheck/icheck.min.js"></script>


<!-- CRMi App -->
<script src="${path}/resources/js/template.js"></script>
<script src="${path}/resources/js/pages/calendar.js"></script>
<script src="${path}/resources/js/pages/editor.js"></script>
<script src="${path}/resources/js/pages/data-table.js"></script>
<script src="${path }/resources/js/pages/editable-tables.js"></script>


<script src="${path}/resources/js/jquery.smartmenus.js"></script>
<script src="${path}/resources/js/menus.js"></script>
<script src="${path}/resources/js/pages/extra_taskboard.js"></script>
<script src="${path}/resources/js/pages/advanced-form-element.js"></script>

<script src="${path}/resources/assets/vendor_components/ckeditor/ckeditor.js"></script>


<script>
    $.widget.bridge('uibutton', $.ui.button);
</script>


</body>
</html>

