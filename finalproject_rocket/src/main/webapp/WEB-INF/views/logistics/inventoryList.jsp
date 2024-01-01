<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%
    LocalDateTime now = LocalDateTime.now();
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-ddHH:mm");
    String formattedNow = now.format(formatter);
%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param name="title" value=""/>
</jsp:include>
<script type="text/javascript" src="${path }/resources/assets/vendor_components/moment/moment.js"></script>
<%--<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-gothic.css" rel="stylesheet">--%>
<%--<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">--%>
<%--<script src="${path }/resources/js/pdfmake.min.js"></script>
<script src="${path }/resources/js/vfs_fonts.js"></script>--%>

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

    /*    .box-body > div, .box-body form > div {
            margin: 20px; !* 각 요소의 하단에 20px 마진 추가 *!
        }

        .input-group.mb-3 {
            margin: 20px; !* input-group 클래스가 적용된 요소에도 마진 추가 *!
        }

        .custom-file, .form-control {
            margin: 20px; !* custom-file과 form-control 클래스가 적용된 요소에도 마진 추가 *!
        }*/

    .col-xl-4.connectedSortable div {
        margin-bottom: 20px;
        margin-right: 20px;
        margin-left: 20px;
    }

    .dataTables_wrapper .dataTable td {
        white-space: normal;
        word-wrap: break-word;
    }
</style>
<script>


    /*    var path = "${path}";
    pdfMake.fonts = {
        NanumGothic: {
            normal: path + '/resources/assets/fonts/NanumGothic.ttf',
            bold: path + '/resources/assets/fonts/NanumGothic.ttf',
            italics: path + '/resources/assets/fonts/NanumGothic.ttf',
            bolditalics: path + '/resources/assets/fonts/NanumGothic.ttf'
        }
    };*/
    /*    var path = "
${path}";
    const fs = require('fs');

    // nanumgothinc.ttf 파일 경로
    const filePath = path + '/resources/assets/fonts/NanumGothic.ttf';

    // 파일 읽기
    fs.readFile(filePath, (err, data) => {
        if (err) {
            console.error('파일을 읽을 수 없습니다:', err);
            return;
        }

        // Base64로 인코딩
        const base64Data = data.toString('base64');
        console.log(base64Data);

        pdfMake.vfs = {
            'NanumGothic-Regular.ttf': 'base64Data',
            'NanumGothic-Bold.ttf': '...Base64 인코딩된 데이터...',
        };

    var path = "
        ${path}";
    pdfMake.fonts = {
        NanumGothic: {
            normal: path + '/resources/assets/fonts/NanumGothic.ttf',
            bold: path + '/resources/assets/fonts/NanumGothicBold.ttf',
            italics: path + '/resources/assets/fonts/NanumGothicLight.ttf',
            bolditalics: path + '/resources/assets/fonts/NanumGothicExtraBold.ttf'
        }
    };*/

    // 각 폰트 파일의 경로를 콘솔에 출력
    // console.log("NanumGothic 폰트 경로:");
    // console.log(pdfMake.fonts.NanumGothic.normal);
    // console.log(pdfMake.fonts.NanumGothic.bold);
    // console.log(pdfMake.fonts.NanumGothic.italics);
    // console.log(pdfMake.fonts.NanumGothic.bolditalics);

    /*    // 폰트 파일 로드 테스트를 위한 임시 텍스트 요소 생성
        var testElement = document.createElement('div');
        testElement.style.fontFamily = 'NanumGothic';
        testElement.textContent = '폰트 로드 테스트';
        document.body.appendChild(testElement);

        // 폰트 로드 확인
        testElement.addEventListener('fontloading', function () {
            console.log('폰트 로드 중...');
        });

        testElement.addEventListener('fontactive', function () {
            console.log('폰트 로드 성공!');
        });

        testElement.addEventListener('fontinactive', function () {
            console.log('폰트 로드 실패...');
        });*/
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

    $(document).ready(function () {
        $('#example1').DataTable({
            // 기본 DataTables 설정
            "paging": true,
            "lengthChange": true,
            "searching": true,
            "ordering": false,
            "info": true,
            // "editable": true,
            "responsive": true,
            "dateFormat": 'YYYY-MM-DD HH:mm',
            "dom": '<"dt-buttons"Bfli>rtp',
            "autoWidth": false,
            "fixedHeader": true,
            "drawCallback": function (settings) {
                // DataTables가 다시 그려질 때마다 실행됩니다.
                $('#example1').editableTableWidget();

            },
            /*  "columns": [
                  { "editable": false },  // 입/출고
                  { "editable": false },  // 타입
                  { "editable": false },  // 수량
                  { "editable": false },  // 게시일
                  { "editable": false },  // 결재여부
                  { "editable": false },  // 거래처
                  { "editable": true },  // 담당자
                  { "editable": false },  // 금액합계
                  { "editable": true },  // 부가세유형
                  { "editable": true },  // 적요
                  { "editable": false },  // 삭제

              ],*/
            columnDefs: [
                {targets: '_all', editable: true}
            ],
            // 수정 불가능한 행 설정
            createdRow: function (row, data, dataIndex) {
                if (dataIndex === 6 || dataIndex === 8 || dataIndex === 9) { // 수정 불가능한 행의 인덱스
                    $(row).addClass('not-editable');
                }
            },
            "buttons": [{
                extend: 'colvis',
                text: '일부 컬럼 보기'

            }, {
                extend: 'colvisRestore',
                text: '컬럼 복원'

            }, {

                extend: 'copyHtml5',

                exportData: {decodeEntities: true},
                text: '클립보드에 복사',
                exportOptions: {
                    columns: ':visible',
                    encoding: 'UTF-8'

                }
            }, {
                extend: 'csvHtml5',

                exportData: {decodeEntities: true},
                title: '입/출고내역' + getCurrentDateTime(),
                exportOptions: {
                    columns: ':visible',
                    encoding: 'UTF-8'
                }
            }, {
                extend: 'excelHtml5',
                title: '입/출고내역' + getCurrentDateTime(),
                exportData: {decodeEntities: true},
                exportOptions: {
                    columns: ':visible',
                    encoding: 'UTF-8'

                }
            }, {
                extend: 'pdfHtml5',
                exportData: {decodeEntities: true},
                text: 'PDF',
                title: '입/출고내역' + getCurrentDateTime(),
                exportOptions: {
                    columns: ':visible',
                    encoding: 'UTF-8',
                    /*             font: 'NanumGothic',*/
                    /*                    customize: function (doc) {
                                            // 폰트 설정 추가
                                            doc.defaultStyle.font = 'NanumGothic'; // 폰트 패밀리 이름
                                            doc.styles.tableHeader.font = 'NanumGothic'; // 테이블 헤더에 적용할 폰트
                                        },*/
                    /*                    format: {
                                            body: function (data, row, column, node) {
                                                // 한글 폰트 설정
                                                var font = 'NanumGothic'; // 사용하고자 하는 폰트명으로 변경해주세요.
                                                node.style.fontFamily = font;
                                                return node;
                                            }
                                        },*/
                    /*                    customize: function (doc) {
                                            doc.defaultStyle.font = 'NanumGothic';
                                            doc.styles.tableHeader.font = 'NanumGothic';
                                        },*/
                }

            }, {
                extend: 'print',
                title: '입/출고내역' + getCurrentDateTime(),
                exportData: {decodeEntities: true},
                exportOptions: {
                    columns: ':visible',
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
        $('#example1').editableTableWidget().on('change', function (e, newValue) {
            // 셀의 데이터가 변경되었을 때의 처리
            var cell = $(e.target);
            var columnIdx = cell.index();
            var rowIdx = cell.closest('tr').index();
            var table = $('#example1').DataTable();
            var data = table.row(rowIdx).data();

            data[columnIdx] = newValue; // 데이터 배열 업데이트
            table.row(rowIdx).data(data).draw(); // 검색 색인 업데이트
        });

        // 편집 가능한 테이블에서 행이 수정될 때 발생하는 이벤트
        /*$('#example1').on('edit', function (e, datatable, cell) {
                // 수정된 셀의 행 인덱스 가져오기
                var rowIndex = cell.index().row;
            console.log("행 인덱스: " + rowIndex);
            // Datatables로부터 해당 행의 데이터 가져오기
            var rowData = datatable.row(rowIndex).data();

            // IV_ID 열의 데이터 가져오기
            var ivIdValue = rowData.IV_ID;

            // 수정된 값 가져오기
            var cellData = cell.data();

            // 이제 IV_ID와 cellData를 사용하여 원하는 작업 수행
            // 데이터를 서버로 전송하거나 다른 작업을 수행할 수 있음
            console.log("IV_ID: " + ivIdValue);
            console.log("새로운 값: " + cellData);

            // 추가 작업을 수행할 수 있음
            // ...

            // 예를 들어, 서버로 데이터를 전송하는 경우
            $.ajax({
                method: "POST",
                url: "your_server_url_here",
                data: {
                    IV_ID: ivIdValue,
                    newValue: cellData
                },
                success: function (response) {
                    // 성공적으로 서버에 데이터를 전송한 후 수행할 작업
                    console.log("데이터 전송 성공");
                },
                error: function (error) {
                    // 데이터 전송 중 오류 발생 시 수행할 작업
                    console.error("데이터 전송 오류: " + error);
                }
            });

        });*/

    });


</script>
<%--<script>
    $(document).ready(
        function () {
            //Only needed for the filename of export files.
            //Normally set in the title tag of your page.
            /*document.title = 'Simple DataTable';*/
            // DataTable initialisation
            // var data = [
            // <c:forEach var="iv" items="${inventories}" varStatus="status">
            // {
            //     "IV_ID": "${iv.IV_ID}",
            //    "IV_TYPE": " ${iv.IV_TYPE}",
            //    "QUANTITY": "${iv.QUANTITY != null ? iv.QUANTITY : '수량'}",
            //    "IV_DATE": "${iv.IV_DATE}",
            //    "CONFIRM_YN": "${iv.CONFIRM_YN != null ? iv.CONFIRM_YN : '결재여부'}",
            //    "SEND_BRANCH_NAME": "${iv.SEND_BRANCH_NAME}",
            //    "SEND_EMP_NAME": " ${iv.SEND_EMP_NAME}",
            //    "TOTAL_AMOUNT": "${iv.TOTAL_AMOUNT != null ? iv.TOTAL_AMOUNT : '금액합계'}",
            //     "IV_VAT_TYPE": "${iv.IV_VAT_TYPE}",
            //    "IV_MEMO": "<c:out value='${iv.IV_MEMO}'/>",
            //    "deleteLink": '<a href="${path} / inventory / delete ? iv_id =${iv.IV_ID}">삭제</a>'
            // }
            //  <c:if test="${!status.last}">, </c:if>
            //   </c:forEach>
            //];

            $('#example1').DataTable(
                {
                    "processing": true,
                    "serverSide": true,
                    "destroy": true,
                    "dateFormat": 'YYYY-MM-DD HH:mm:ss',
                    "ajax": {
                        "url": "${path }/logistics/inventories",
                        "type": "GET",
                        "dataSrc": function (json) {
                            console.log("Received JSON:", json);
                            var data = json.data;
                            return data;
                        }
                    },
                    "columns": [
                        {title: "입/출고 코드", "data": "IV_ID"},
                        {title: "타입", "data": "IV_TYPE"},
                        {
                            /*                    title: "수량", "data": "QUANTITY"*/
                            title: "수량",
                            "data": null,
                            "defaultContent": "수량",
                            "render": function (data, type, row, meta) {
                                return '임의의 값 또는 HTML 요소';
                            }
                        },
                        {title: "게시일", "data": "IV_DATE"},
                        {
                            title: "결재여부",/* "data": "CONFIRM_YN"*/
                            "data": null,
                            "defaultContent": "결재여부",
                            "render": function (data, type, row, meta) {
                                return '임의의 값 또는 HTML 요소';
                            }
                        },
                        {title: "거래처", "data": "SEND_BRANCH_NAME"},
                        {title: "담당자", "data": "SEND_EMP_NAME"},
                        {
                            /* title: "금액합계", "data": "TOTAL_AMOUNT" */
                            title: "금액합계",
                            "data": null,
                            "defaultContent": "금액합계",
                            "render": function (data, type, row, meta) {
                                return '임의의 값 또는 HTML 요소';
                            }
                        },
                        {"data": "IV_VAT_TYPE"},
                        {"data": "IV_MEMO"},
                        {
                            /*                      title: "금액합계", "data": "TOTAL_AMOUNT"*/
                            title: "삭제",
                            "data": null,
                            "defaultContent": "삭제",
                            "render": function (data, type, row, meta) {
                                return '<a href="${path}/inventory/delete?iv_id=${iv.IV_ID}">삭제</a>';
                            }
                        }
                        /*                                   {
                                                               title: "적요",
                                                               "data": "deleteLink", "render": function (data) {
                                                                   return data;
                                                               }
                                                           }*/
                    ],
                    "dom": '<"dt-buttons"Bfli>rtp',
                    "paging": true,
                    "autoWidth": true,
                    "fixedHeader": true,
                    // 기타 DataTables 설정
                    "drawCallback": function (settings) {
                        // DataTables가 다시 그려질 때마다 실행됩니다.
                        $('#example1').editableTableWidget();

                    },
                    "buttons": [{
                        extend: 'colvis',
                        text: '일부 컬럼 보기'

                    }, {

                        extend: 'copyHtml5',
                        text: '클립보드에 복사',
                        exportOptions: {
                            columns: ':visible'

                        }
                    }, {
                        extend: 'csvHtml5',
                        exportOptions: {
                            columns: ':visible'
                        }
                    }, {
                        extend: 'excelHtml5',
                        exportOptions: {
                            columns: ':visible'
                        }
                    }, {
                        extend: 'pdfHtml5',
                        exportOptions: {
                            columns: ':visible'
                        }
                    }, {
                        extend: 'print',
                        exportOptions: {
                            columns: ':visible'
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

            // table.on('init', function() {
            //     $(".dataTables_length").after("<br>"); // .dataTables_length 뒤에 <br> 추가
            // });
        });
</script>--%>

<div class="content-wrapper">
    <div class="container-full">
        <!-- Main content -->
        <section class="content">


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

            <!-- Content Header (Page header) -->
            <div class="content-header">
                <div class="d-flex align-items-center">
                    <div class="me-auto">
                        <h4 class="page-title">입고내역</h4>
                        <div class="d-inline-block align-items-center">
                            <nav>
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#"> <i
                                            class="mdi mdi-home-outline"></i></a></li>
                                    <li class="breadcrumb-item" aria-current="page">입/출고 관리</li>
                                    <li class="breadcrumb-item active" aria-current="page">입고내역</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Main content -->
            <section class="content">

                <div class="row">

                    <div class="col-xl-4 connectedSortable">
                        <div class="box">
                            <div class="box-header with-border">
                                <h4 class="box-title">입/출고 추가</h4>

                                <ul class="box-controls pull-right">
                                    <li><a class="box-btn-close" href="#"></a></li>
                                    <li><a class="box-btn-slide" href="#"></a></li>
                                    <li><a class="box-btn-fullscreen" href="#"></a></li>
                                </ul>
                            </div>
                            <div class="box-body p-0">


                                <form name="boardFrm" action="${path }/board/insertBoard.do"
                                      method="post" enctype="multipart/form-data">


                                    <input name="group1" type="radio" id="write_Option_1" checked>

                                    <label for="write_Option_1">입고</label>

                                    <input name="group1" type="radio" id="write_Option_2"> <label
                                        for="write_Option_2">출고</label>

                                    <div>
                                        <input class="form-control" type="datetime-local" value="<%=formattedNow%>"
                                               id="example-datetime-local-input">
                                    </div>

                                    <div>
                                        <label class="form-label">담당자</label>
                                        <select class="form-control select2" multiple="multiple"
                                                data-placeholder="Select a State"
                                                style="width: 100%;">
                                            <option>부서 가져오기</option>
                                            <option>Alaska</option>
                                            <option>California</option>
                                            <option>Delaware</option>
                                            <option>Tennessee</option>
                                            <option>Texas</option>
                                            <option>Washington</option>
                                        </select>
                                    </div>

                                    <div>
                                        <label class="form-label">거래처</label>
                                        <select class="form-control select2" multiple="multiple"
                                                data-placeholder="Select a State"
                                                style="width: 100%;">
                                            <option>부서 가져오기</option>
                                            <option>Alaska</option>
                                            <option>California</option>
                                            <option>Delaware</option>
                                            <option>Tennessee</option>
                                            <option>Texas</option>
                                            <option>Washington</option>
                                        </select>
                                    </div>
                                    <%--				<div class="dropzone" id="myDropzone">
                                                        <div class="fallback">
                                                            <input name="file" type="file" multiple/>
                                                        </div>
                                                    </div>--%>
                                    <div>
                                        부가세 포함 여부
                                        <input name="group2" type="radio" id="vat_Option_1" checked>

                                        <label for="vat_Option_1">포함</label>

                                        <input name="group2" type="radio" id="vat_Option_2"> <label
                                            for="vat_Option_2">제외</label>
                                    </div>

                                    <div id="board-container">
                                        <div class="input-group mb-3" style="padding: 0px;">
                                            <div class="input-group-prepend" style="padding: 0px;">
                                                <button type="button"
                                                        class="waves-effect waves-light btn btn-info-light btn-flat mb-5"
                                                        onclick="fn_addFileForm();">첨부파일 추가
                                                </button>
                                                <button type="button"
                                                        class="waves-effect waves-light btn btn-danger-light btn-flat mb-5"
                                                        onclick="fn_deleteFileForm();">첨부파일 삭제
                                                </button>
                                            </div>
                                        </div>
                                        <div id="basicFileForm" class="input-group mb-3" style="padding:0px;">

                                            <span class="input-group-text1">첨부파일 1</span>

                                            <div class="custom-file">
                                                <input type="file" class="custom-file-input" name="upFile" id="upFile1">
                                                <label class="custom-file-label" for="upFile1">파일을 선택하세요</label>
                                            </div>
                                        </div>
                                        <textarea class="form-control" name="iv_memo" placeholder="적요"
                                                  required></textarea>
                                        <br/>
                                        <button type="submit" class="btn btn-primary">
                                            <i class="ti-save-alt"></i> 저장
                                        </button>


                                        <%--                                        <input type="submit" class="btn btn-outline-success" value="저장">--%>
                                    </div>
                                </form>
                            </div>

                            <%--					<script>
                                                    // Dropzone 설정
                                                    Dropzone.options.myDropzone = {
                                                        url: "${path}/board/insertBoard.do",
                                                        autoProcessQueue: false, // 자동 처리 비활성화
                                                        init: function () {
                                                            var myDropzone = this;

                                                            // 폼 제출 핸들러
                                                            document.getElementsByName("boardFrm")[0].addEventListener('submit', function (e) {
                                                                e.preventDefault();
                                                                e.stopPropagation();

                                                                // 모든 파일을 처리 큐에 추가
                                                                myDropzone.files.forEach(function (file) {
                                                                    myDropzone.enqueueFile(file);
                                                                });

                                                                // 파일 처리 완료 후 폼 데이터 전송
                                                                myDropzone.on("queuecomplete", function () {
                                                                    // 폼 데이터를 AJAX를 통해 전송
                                                                    // 폼 데이터 추가 로직...
                                                                });
                                                            });
                                                        }
                                                    };
                                                </script>--%>

                            <script>
                                const adddelFunction = (function () {
                                    let count = 2;
                                    const addFile = () => {
                                        if (count <= 5) {
                                            const fileForm = $("#basicFileForm").clone(true);
                                            fileForm.find("span.input-group-text1").text("첨부파일 " + count);
                                            fileForm.find("label.custom-file-label").text("파일을 선택하세요")
                                                .attr("for", "upFile" + count);
                                            fileForm.find("input[type=file]").attr("id", "upFile" + count).val("");
                                            $("textarea[name=iv_memo]").before(fileForm);
                                            count++;
                                        } else {
                                            alert("첨부파일은 5개까지 가능합니다.");
                                        }
                                    };
                                    const delFile = () => {
                                        if (count != 2) {
                                            $("textarea[name=iv_memo]").prev().remove();
                                            count--;
                                        }
                                    };

                                    return [addFile, delFile];
                                })();

                                const fn_addFileForm = adddelFunction[0];
                                const fn_deleteFileForm = adddelFunction[1];

                                $("input[name=upFile]").change(e => {
                                    const fileName = e.target.files[0].name;
                                    $(e.target).next(".custom-file-label").text(fileName);
                                });
                            </script>

                        </div>
                        <!-- /.box-body -->
                    </div>
                </div>

                <div class="col-12">
                    <div class="box">
                        <div class="box-header">
                            <h4 class="box-title">
                                입/출고 <strong>입/출고내역</strong>
                            </h4>
                            <h6 class="subtitle">수정할 row를 선택하세요</h6>
                        </div>

                        <div class="box-body">
                            <div class="table-responsive">

                                <table id="example1"
                                       class="table table-bordered table-separated">
                                    <thead>
                                    <tr>
                                        <th>입/출고 코드</th>
                                        <th>타입</th>
                                        <th>수량</th>
                                        <th>게시일</th>
                                        <th>결재여부</th>
                                        <th>거래처</th>
                                        <th>담당자</th>
                                        <th>금액합계</th>
                                        <th>부가세유형</th>
                                        <th>적요</th>
                                        <th>삭제</th>
                                    </thead>

                                    <tbody>
                                    <%--	<c:if test="받는 거래처가 로그인 직원의 해당 지점일 시">--%>
                                    <c:forEach var="iv" items="${inventories }">
                                        <tr>
                                            <td name="dontedit" data-column-name="IV_ID"
                                                data-table-name="INVENTORY">${iv.IV_ID}</td>
                                            <td name="dontedit" data-column-name="IV_VAT_TYPE"
                                                data-table-name="INVENTORY">${iv.IV_TYPE}</td>
                                            <td name="dontedit">수량</td>
                                            <td name="dontedit" data-column-name="IV_DATE"
                                                data-table-name="INVENTORY">${iv.IV_DATE}</td>
                                            <td name="dontedit"
                                            ">결제여부</td>
                                            <td name="dontedit" data-column-name="SEND_BRC_ID"
                                                data-parent-column="BRANCH_NAME"
                                                data-table-name="BRANCH">${iv.SEND_BRANCH_NAME}</td>
                                            <td data-column-name="SEND_EMP_ID" data-parent-column="EMP_NAME"
                                                data-table-name="EMPLOYEE">${iv.SEND_EMP_NAME}</td>
                                            <td name="dontedit">금액합계</td>
                                            <td data-column-name="IV_VAT_TYPE"
                                                data-table-name="INVENTORY">${iv.IV_VAT_TYPE}</td>
                                            <td data-column-name="IV_MEMO" data-parent-column="IV_MEMO"
                                                data-table-name="INVENTORY">${iv.IV_MEMO}</td>
                                            <td>
    										<form action="${path}/logistics/inventory/List/delete" method="post">
        									<input type="hidden" name="iv_id" value="${iv.IV_ID}">
        									<button type="submit" class="waves-effect waves-light btn btn-danger-light btn-flat mb-5">삭제</button>
    										</form>
											</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>

                                    <%-- 	  </c:if> --%>
                                    <%--                      <tfoot>
                                                          <tr>
                                                              <th>입/출고 코드</th>
                                                              <th>타입</th>
                                                              <th>수량</th>
                                                              <th>게시일</th>
                                                              <th>결재여부</th>
                                                              <th>거래처</th>
                                                              <th>담당자</th>
                                                              <th>금액합계</th>
                                                              <th>부가세유형</th>
                                                              <th>적요</th>
                                                          </tr>
                                                          </tfoot>--%>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row"></div>
            </section>
            <!-- /.content -->

            <!-- Page Content overlay -->


            <!-- Vendor JS -->

            <script src="${path }/resources/js/vendors.min.js"></script>
            <script src="${path }/resources/js/pages/chat-popup.js"></script>
            <script
                    src="${path }/resources/assets/icons/feather-icons/feather.min.js"></script>
            <script
                    src="${path }/resources/assets/vendor_components/datatable/datatables.min.js"></script>
            <script
                    src="${path }/resources/assets/vendor_components/tiny-editable/mindmup-editabletable.js"></script>
            <script
                    src="${path }/resources/assets/vendor_components/tiny-editable/numeric-input-example.js"></script>

            <!-- CRMi App -->
            <script src="${path }/resources/js/template.js"></script>

            <script src="${path }/resources/js/pages/data-table.js"></script>
            <script src="${path }/resources/js/pages/editable-tables.js"></script>

            <script>

            </script>
        </section>
    </div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>