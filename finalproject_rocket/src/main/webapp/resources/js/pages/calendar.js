
function CalendarApp(calendarId, isDateSelectable) {
    this.$calendar = $(calendarId);
    this.$calendarObj = null;
    this.isDateSelectable = isDateSelectable;
}

CalendarApp.prototype.enableDrag = function() {
    //드래그 가능성을 활성화
};

CalendarApp.prototype.onDrop = function(source, date) {
    //드래그 앤 드롭 이벤트
};

CalendarApp.prototype.onSelect = function(start, end, allDay) {
    //캘린더의 날짜/시간 선택을 처리
    this.selectedRange = {
        start: start,
        end: start==end?end:end.subtract(1, 'days') 
    };
    var startDate = this.selectedRange.start.format('YYYY-MM-DD');
    var endDate = this.selectedRange.end.format('YYYY-MM-DD');

    let prevForm=document.querySelector("#holy");
    if(prevForm==null) {
		prevForm=document.createElement("form");
		prevForm.setAttribute("id","holy");
  	 	prevForm.setAttribute("method", "get");
    	prevForm.setAttribute("action", `/docu/insertaprv`);
	}
	prevForm.innerHTML="";
    // form 생성
/*    var form = document.createElement("form");
    form.setAttribute("id","holy");
    form.setAttribute("method", "post");
    form.setAttribute("action", `/docu/insertaprv`);*/

    // startDate input 생성
    var startDateInput = document.createElement("input");
    startDateInput.setAttribute("type", "hidden");
    startDateInput.setAttribute("name", "startDate");
    startDateInput.setAttribute("value", startDate);
    prevForm.appendChild(startDateInput);

    // endDate input 생성
    var endDateInput = document.createElement("input");
    endDateInput.setAttribute("type", "hidden");
    endDateInput.setAttribute("name", "endDate");
    endDateInput.setAttribute("value", endDate);
    prevForm.appendChild(endDateInput);
 	
 	console.log(prevForm); // 생성된 form 출력
    
   document.body.appendChild(prevForm);

    // form 객체 반환
    return prevForm;
};

CalendarApp.prototype.onEventClick = function(calEvent, jsEvent, view) {
    //캘린더 이벤트 클릭
};

CalendarApp.prototype.init = function() {
    this.enableDrag();

    var $this = this;
    var today = new Date($.now());

    $this.$calendarObj = $this.$calendar.fullCalendar({
        handleWindowResize: true,
        header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
        },
       	events: this.$calendar[0].id === 'mycal1' ? null : "/myevents",
        eventDataTransform: function(eventData) {
			
    console.log(eventData);

    var color;
    switch(eventData.STATUS) {
        case '지각':
            color = 'red';
            break;
        case '조퇴':
            color = 'orange';
            break;
        case '출근':
            color = 'green';
            break;
        case '휴가승인':
            color = 'blue';
            break;
        default:
            color = 'gray'; 
    }

    var startMoment = moment(eventData.START_DAY);
    var endMoment = moment(eventData.END_DAY);

    // 여러 날에 걸친 이벤트인 경우, 종료 날짜의 자정이 아닌 다음 날 자정까지 포함되도록 수정합니다.
    if (startMoment.isBefore(endMoment, 'day')) {
        endMoment.add(1, 'days');
    }

    return {
        title: eventData.STATUS,
        start: startMoment.format('YYYY-MM-DD'),
        end: endMoment.format('YYYY-MM-DD'),
        allDay: true,
        backgroundColor: color,
        borderColor: color,
        textColor: 'white',
        className: 'custom-event'
    };
},
        
        editable: false,
        droppable: true,
        eventLimit: false,
        selectable: this.isDateSelectable,
        select: this.isDateSelectable ? function (start, end, allDay) {
            $("td").removeClass('selected');
            $this.onSelect(start, end, allDay); 
        } : null,
        selectAllow: function(selectInfo) {
    var start = selectInfo.start;
    var today = moment().startOf('day');
    if (selectInfo.start < today) return false;

    var end = selectInfo.end.clone().subtract(1, 'days');
    var diffDays = end.diff(start, 'days');

    if (diffDays > 14) {
        return false;
    }

    while(end >= start) {
        $("td[data-date='" + start.format('YYYY-MM-DD') + "']")
            .addClass('selected')
            .css({"background-color": "black", "color": "white"});
        start.add(1, 'days');
    }
    return true;
        },
        drop:  function(date) { $this.onDrop($(this), date); },
        eventClick: function(calEvent, jsEvent, view) { $this.onEventClick(calEvent, jsEvent, view); }	
    });
};

// CalendarApp 인스턴스 생성
$.CalendarApp1 = new CalendarApp('#calendar', false); 
$.CalendarApp1.Constructor = CalendarApp;

$.CalendarApp2 = new CalendarApp('#mycal1', true); 
$.CalendarApp2.Constructor = CalendarApp;

// 초기화
(function($) {
    "use strict";
    $.CalendarApp1.init();
    $.CalendarApp2.init();
})(window.jQuery);
=======
//[calendar Javascript]

//Project:	CRMi - Responsive Admin Template
//Primary use:   Used only for the event calendar


<<<<<<< HEAD
CalendarApp.prototype.onSelect = function(start, end, allDay) {
    //캘린더의 날짜/시간 선택을 처리
    this.selectedRange = {
        start: start,
        end: start==end?end:end.subtract(1, 'days') 
    };
    var startDate = this.selectedRange.start.format('YYYY-MM-DD');
    var endDate = this.selectedRange.end.format('YYYY-MM-DD');

    let prevForm=document.querySelector("#holy");
    if(prevForm==null) {
      prevForm=document.createElement("form");
      prevForm.setAttribute("id","holy");
         prevForm.setAttribute("method", "get");
       prevForm.setAttribute("action", `/docu/insertaprv`);
   }
   prevForm.innerHTML="";
    // form 생성
/*    var form = document.createElement("form");
    form.setAttribute("id","holy");
    form.setAttribute("method", "post");
    form.setAttribute("action", `/docu/insertaprv`);*/

    // startDate input 생성
    var startDateInput = document.createElement("input");
    startDateInput.setAttribute("type", "hidden");
    startDateInput.setAttribute("name", "startDate");
    startDateInput.setAttribute("value", startDate);
    prevForm.appendChild(startDateInput);

    // endDate input 생성
    var endDateInput = document.createElement("input");
    endDateInput.setAttribute("type", "hidden");
    endDateInput.setAttribute("name", "endDate");
    endDateInput.setAttribute("value", endDate);
    prevForm.appendChild(endDateInput);
    
    console.log(prevForm); // 생성된 form 출력
    
   document.body.appendChild(prevForm);

    // form 객체 반환
    return prevForm;
};

CalendarApp.prototype.onEventClick = function(calEvent, jsEvent, view) {
    //캘린더 이벤트 클릭
};

CalendarApp.prototype.init = function() {
    this.enableDrag();

    var $this = this;
    var today = new Date($.now());

    $this.$calendarObj = $this.$calendar.fullCalendar({
        handleWindowResize: true,
        header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
        },
          events: this.$calendar[0].id === 'mycal1' ? null : "/myevents",
        eventDataTransform: function(eventData) {
         
    console.log(eventData);

    var color;
    switch(eventData.STATUS) {
        case '지각':
            color = 'red';
            break;
        case '조퇴':
            color = 'orange';
            break;
        case '출근':
            color = 'green';
            break;
        case '휴가승인':
            color = 'blue';
            break;
        default:
            color = 'gray'; 
    }

    var startMoment = moment(eventData.START_DAY);
    var endMoment = moment(eventData.END_DAY);

    // 여러 날에 걸친 이벤트인 경우, 종료 날짜의 자정이 아닌 다음 날 자정까지 포함되도록 수정합니다.
    if (startMoment.isBefore(endMoment, 'day')) {
        endMoment.add(1, 'days');
    }

    return {
        title: eventData.STATUS,
        start: startMoment.format('YYYY-MM-DD'),
        end: endMoment.format('YYYY-MM-DD'),
<<<<<<< HEAD
        allDay: true,
        backgroundColor: color,
        borderColor: color,
        textColor: 'white',
        className: 'custom-event'
    };
},
        
        editable: false,
        droppable: true,
        eventLimit: false,
        selectable: this.isDateSelectable,
        select: this.isDateSelectable ? function (start, end, allDay) {
            $("td").removeClass('selected');
            $this.onSelect(start, end, allDay); 
        } : null,
        selectAllow: function(selectInfo) {
    var start = selectInfo.start;
    var today = moment().startOf('day');
    if (selectInfo.start < today) return false;

    var end = selectInfo.end.clone().subtract(1, 'days');
    var diffDays = end.diff(start, 'days');

    if (diffDays > 14) {
        return false;
    }

    while(end >= start) {
        $("td[data-date='" + start.format('YYYY-MM-DD') + "']")
            .addClass('selected')
            .css({"background-color": "black", "color": "white"});
        start.add(1, 'days');
    }
    return true;
=======
        allDay: false,
        backgroundColor: color,
        borderColor: color,
        textColor: 'white',
        className: 'custom-event'
    };
},
        
        editable: false,
        droppable: true,
        eventLimit: false,
        selectable: this.isDateSelectable,
        select: this.isDateSelectable ? function (start, end, allDay) {
            $("td").removeClass('selected');
            $this.onSelect(start, end, allDay); 
        } : null,
        selectAllow: function(selectInfo) {
            var start = selectInfo.start;
            var today = moment().startOf('day');
          if (selectInfo.start < today) return false;
            var end = selectInfo.end.clone().subtract(1, 'days');
            while(end >= start) {
                $("td[data-date='" + start.format('YYYY-MM-DD') + "']")
                    .addClass('selected')
                    .css({"background-color": "black", "color": "white"});
                start.add(1, 'days');
            }
            return true;
>>>>>>> branch 'dev' of https://github.com/devkingkong96/final_project_rocketcoding.git
        },
        drop:  function(date) { $this.onDrop($(this), date); },
        eventClick: function(calEvent, jsEvent, view) { $this.onEventClick(calEvent, jsEvent, view); }   
    });
};

// CalendarApp 인스턴스 생성
$.CalendarApp1 = new CalendarApp('#calendar', false); 
$.CalendarApp1.Constructor = CalendarApp;

$.CalendarApp2 = new CalendarApp('#mycal1', true); 
$.CalendarApp2.Constructor = CalendarApp;

// 초기화
(function($) {
=======
!function ($) {
>>>>>>> branch 'dev' of https://github.com/devkingkong96/final_project_rocketcoding.git
    "use strict";

    var CalendarApp = function () {
        this.$body = $("body");
        this.$calendar = $('#calendar'),
            this.$event = ('#external-events div.external-event'),
            this.$categoryForm = $('#add-new-events form'),
            this.$extEvents = $('#external-events'),
            this.$modal = $('#my-event'),
            this.$saveCategoryBtn = $('.save-category'),
            this.$calendarObj = null;
    };


    /* on drop */
    CalendarApp.prototype.onDrop = function (eventObj, date) {
        var $this = this;
        // retrieve the dropped element's stored Event Object
        var originalEventObject = eventObj.data('eventObject');
        var $categoryClass = eventObj.attr('data-class');
        // we need to copy it, so that multiple events don't have a reference to the same object
        var copiedEventObject = $.extend({}, originalEventObject);
        // assign it the date that was reported
        copiedEventObject.start = date;
        if ($categoryClass)
            copiedEventObject['className'] = [$categoryClass];
        // render the event on the calendar
        $this.$calendar.fullCalendar('renderEvent', copiedEventObject, true);
        // is the "remove after drop" checkbox checked?
        if ($('#drop-remove').is(':checked')) {
            // if so, remove the element from the "Draggable Events" list
            eventObj.remove();
        }
    },
        /* on click on event */
        CalendarApp.prototype.onEventClick = function (calEvent, jsEvent, view) {
            var $this = this;
            var form = $("<form></form>");
            form.append("<label>Change event name</label>");
            form.append("<div class='input-group'><input class='form-control' type=text value='" + calEvent.title + "' /><span class='input-group-btn'><button type='submit' class='btn btn-success waves-effect waves-light'><i class='fa fa-check'></i> Save</button></span></div>");
            $this.$modal.modal({
                backdrop: 'static'
            });
            $this.$modal.find('.delete-event').show().end().find('.save-event').hide().end().find('.modal-body').empty().prepend(form).end().find('.delete-event').unbind('click').click(function () {
                $this.$calendarObj.fullCalendar('removeEvents', function (ev) {
                    return (ev._id == calEvent._id);
                });
                $this.$modal.modal('hide');
            });
            $this.$modal.find('form').on('submit', function () {
                calEvent.title = form.find("input[type=text]").val();
                $this.$calendarObj.fullCalendar('updateEvent', calEvent);
                $this.$modal.modal('hide');
                return false;
            });
        },
        /* on select */
        CalendarApp.prototype.onSelect = function (start, end, allDay) {
            var $this = this;
            $this.$modal.modal({
                backdrop: 'static'
            });
            var form = $("<form></form>");
            form.append("<div class='row'></div>");
            form.find(".row")
                .append("<div class='col-md-6'><div class='form-group'><label class='form-label'>Event Name</label><input class='form-control' placeholder='Insert Event Name' type='text' name='title'/></div></div>")
                .append("<div class='col-md-6'><div class='form-group'><label class='form-label'>Category</label><select class='form-control' name='category'></select></div></div>")
                .find("select[name='category']")
                .append("<option value='bg-danger'>Danger</option>")
                .append("<option value='bg-success'>Success</option>")
                .append("<option value='bg-purple'>Purple</option>")
                .append("<option value='bg-primary'>Primary</option>")
                .append("<option value='bg-pink'>Pink</option>")
                .append("<option value='bg-info'>Info</option>")
                .append("<option value='bg-warning'>Warning</option></div></div>");
            $this.$modal.find('.delete-event').hide().end().find('.save-event').show().end().find('.modal-body').empty().prepend(form).end().find('.save-event').unbind('click').click(function () {
                form.submit();
            });
            $this.$modal.find('form').on('submit', function () {
                var title = form.find("input[name='title']").val();
                var beginning = form.find("input[name='beginning']").val();
                var ending = form.find("input[name='ending']").val();
                var categoryClass = form.find("select[name='category'] option:checked").val();
                if (title !== null && title.length != 0) {
                    $this.$calendarObj.fullCalendar('renderEvent', {
                        title: title,
                        start: start,
                        end: end,
                        allDay: false,
                        className: categoryClass
                    }, true);
                    $this.$modal.modal('hide');
                } else {
                    alert('You have to give a title to your event');
                }
                return false;

            });
            $this.$calendarObj.fullCalendar('unselect');
        },
        CalendarApp.prototype.enableDrag = function () {
            //init events
            $(this.$event).each(function () {
                // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
                // it doesn't need to have a start or end
                var eventObject = {
                    title: $.trim($(this).text()) // use the element's text as the event title
                };
                // store the Event Object in the DOM element so we can get to it later
                $(this).data('eventObject', eventObject);
                // make the event draggable using jQuery UI
                $(this).draggable({
                    zIndex: 999999,
                    revert: true,      // will cause the event to go back to its
                    revertDuration: 0  //  original position after the drag
                });
            });
        };
    /* Initializing */
    CalendarApp.prototype.init = function () {
        this.enableDrag();
        /*  Initialize the calendar  */
        var date = new Date();
        var d = date.getDate();
        var m = date.getMonth();
        var y = date.getFullYear();
        var form = '';
        var today = new Date($.now());

        var defaultEvents = [{
            title: 'Released Ample Admin!',
            start: '2017-08-08',
            end: '2017-08-08',
            className: 'bg-info'
        }, {
            title: 'This is today check date',
            start: today,
            end: today,
            className: 'bg-danger'
        }, {
            title: 'This is your birthday',
            start: '2017-09-08',
            end: '2017-09-08',
            className: 'bg-info'
        },
            {
                title: 'Hanns birthday',
                start: '2017-10-08',
                end: '2017-10-08',
                className: 'bg-danger'
            }, {
                title: 'Like it?',
                start: new Date($.now() + 784800000),
                className: 'bg-success'
            }];

        var $this = this;
        $this.$calendarObj = $this.$calendar.fullCalendar({
            slotDuration: '00:15:00', /* If we want to split day time each 15minutes */
            minTime: '08:00:00',
            maxTime: '19:00:00',
            defaultView: 'month',
            handleWindowResize: true,

            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'month,agendaWeek,agendaDay'
            },
            events: defaultEvents,
            editable: true,
            droppable: true, // this allows things to be dropped onto the calendar !!!
            eventLimit: true, // allow "more" link when too many events
            selectable: true,
            drop: function (date) {
                $this.onDrop($(this), date);
            },
            select: function (start, end, allDay) {
                $this.onSelect(start, end, allDay);
            },
            eventClick: function (calEvent, jsEvent, view) {
                $this.onEventClick(calEvent, jsEvent, view);
            }

        });

        //on new event
        this.$saveCategoryBtn.on('click', function () {
            var categoryName = $this.$categoryForm.find("input[name='category-name']").val();
            var categoryColor = $this.$categoryForm.find("select[name='category-color']").val();
            if (categoryName !== null && categoryName.length != 0) {
                $this.$extEvents.append('<div class="m-15 external-event bg-' + categoryColor + '" data-class="bg-' + categoryColor + '" style="position: relative;"><i class="fa fa-hand-o-right"></i>' + categoryName + '</div>');
                $this.enableDrag();
            }

        });
    },

        //init CalendarApp
        $.CalendarApp = new CalendarApp, $.CalendarApp.Constructor = CalendarApp;

}(window.jQuery),// End of use strict

//initializing CalendarApp
    function ($) {
        "use strict";
        $.CalendarApp.init();

    }(window.jQuery);// End of use strict
>>>>>>> branch 'dev' of https://github.com/devkingkong96/final_project_rocketcoding.git
