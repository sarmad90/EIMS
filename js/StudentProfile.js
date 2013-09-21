$(document).ready(function () {
    if ($('#MainContent_TxtStatus').val() != "" || $('#MainContent_TxtSemester').val() != "" || $('#MainContent_TxtGPA').val() != "" || $('#MainContent_TxtAttendance').val() != "") {
        $(".collapse").collapse();
        if ($('#MainContent_TxtSubject2').val() == "") {
            $('.subject_fields_2').hide();
        }
        if ($('#MainContent_TxtSubject3').val() == "") {
            $('.subject_fields_3').hide();
            $('#MainContent_subject_fields_button_3').hide();
        }
        if ($('#MainContent_TxtSubject4').val() == "") {
            $('.subject_fields_4').hide();
            $('#MainContent_subject_fields_button_4').hide();
        }
        if ($('#MainContent_TxtSubject5').val() == "") {
            $('.subject_fields_5').hide();
            $('#MainContent_subject_fields_button_5').hide();
        }
        if ($('#MainContent_TxtSubject6').val() == "") {
            $('.subject_fields_6').hide();
            $('#MainContent_subject_fields_button_6').hide();
        }
        if ($('.subject_fields_2').is(':visible')) {
            $('#MainContent_subject_fields_button_2').hide();
        }
        if ($('.subject_fields_3').is(':visible')) {
            $('#MainContent_subject_fields_button_3').hide();
        }
        if ($('.subject_fields_4').is(':visible')) {
            $('#MainContent_subject_fields_button_4').hide();
        }
        if ($('.subject_fields_5').is(':visible')) {
            $('#MainContent_subject_fields_button_5').hide();
        }
        if ($('.subject_fields_6').is(':visible')) {
            $('#MainContent_subject_fields_button_6').hide();
        }
    }
    else {
        $('.subject_fields_2').hide();
        $('.subject_fields_3').hide();
        $('.subject_fields_4').hide();
        $('.subject_fields_5').hide();
        $('.subject_fields_6').hide();
        $('#MainContent_subject_fields_button_3').hide();
        $('#MainContent_subject_fields_button_4').hide();
        $('#MainContent_subject_fields_button_5').hide();
        $('#MainContent_subject_fields_button_6').hide();
    }
    $('#MainContent_subject_fields_button_2').click(function () {
        $('.subject_fields_2').show();
        $('#MainContent_subject_fields_button_2').hide();
        $('#MainContent_subject_fields_button_3').show();
    });
    $('#MainContent_subject_fields_button_3').click(function () {
        $('.subject_fields_3').show();
        $('#MainContent_subject_fields_button_3').hide();
        $('#MainContent_subject_fields_button_4').show();
    });
    $('#MainContent_subject_fields_button_4').click(function () {
        $('.subject_fields_4').show();
        $('#MainContent_subject_fields_button_4').hide();
        $('#MainContent_subject_fields_button_5').show();
    });
    $('#MainContent_subject_fields_button_5').click(function () {
        $('.subject_fields_5').show();
        $('#MainContent_subject_fields_button_5').hide();
        $('#MainContent_subject_fields_button_6').show();
    });
    $('#MainContent_subject_fields_button_6').click(function () {
        $('.subject_fields_6').show();
        $('#MainContent_subject_fields_button_6').hide();
    });
});