//This file contains all code related to document & note
function getFollowUpIndexPage() {
    var notable_type = $('#notable_type').val();
    var notable_id = $('#notable_id').val();
    $.ajax({
        method: "GET",
        dataType: "html",
        url: '/get-follow-up-page',
        async: false,
        data: {'notable_type' : notable_type, 'notable_id' : notable_id},
        success: function(result){
            $('.follow_up_body').html(result);            
        }
    });
}

$(document).on('click', '.follow_ups_btn', function() {
    var url  = $(this).data('href');
    $.ajax({
        method: "GET",
        dataType: "html",
        url: url,
        success: function(result){
            $('.follow_up_modal').html(result).modal("show");
        }
    });
});

// initialize ck editor & dropzone on docs & notes model open
var dropzoneForFollowUp = {};
$(document).on('shown.bs.modal','.follow_up_modal', function (e) {
    tinymce.init({
        selector: 'textarea#docs_note_description',
    });
    $('form#follow_up_form').validate();
    initialize_dropzone_for_follow_up();
});

// function initializing dropzone for docs & notes
function initialize_dropzone_for_follow_up() {
    var file_names = [];

    if (dropzoneForFollowUp.length > 0) {
        Dropzone.forElement("div#followUpload").destroy();
    }

    dropzoneForFollowUp = $("div#followUpload").dropzone({
        url: '/post-follow-upload',
        paramName: 'file',
        uploadMultiple: true,
        autoProcessQueue: true,
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        success: function(file, response) {
            if (response.success) {
                toastr.success(response.msg);
                file_names.push(response.file_name);
                $('input#follow_ups_media').val(file_names);
            } else {
                toastr.error(response.msg);
            }
        },
    });
}

//form submittion of docs & notes form
$(document).on('submit', 'form#follow_up_form', function(e){
    e.preventDefault();
    var url = $('form#follow_up_form').attr('action');
    var method = $('form#follow_up_form').attr('method');
    var data = $('form#follow_up_form').serialize();
    $.ajax({
        method: method,
        dataType: "json",
        url: url,
        data:data,
        success: function(result){
            if (result.success) {
                $('.follow_up_modal').modal('hide');
                toastr.success(result.msg);
                follow_up_data_table.ajax.reload();
            } else {
                toastr.error(result.msg);
            }
        }
    });
});

// on close of docs & notes form destroy dropzone
$(document).on('hide.bs.modal','.follow_up_modal', function (e) {
    tinymce.remove("textarea#follow_up_description");
    if (dropzoneForFollowUp.length > 0) {
        Dropzone.forElement("div#followUpload").destroy();
        dropzoneForFollowUp = {};
    }
});

// delete a docs & note
$(document).on('click', '#delete_follow_up', function(e) {
    e.preventDefault();
    var url = $(this).data('href');
    swal({
        title: LANG.sure,
        icon: "warning",
        buttons: true,
        dangerMode: true,
    }).then((confirmed) => {
        if (confirmed) {
            $.ajax({
                method:'DELETE',
                dataType: 'json',
                url: url,
                success: function(result){
                    if (result.success) {
                        toastr.success(result.msg);
                        follow_up_data_table.ajax.reload();
                    } else {
                        toastr.error(result.msg);
                    }
                }
            });
        }
    });
});

// view docs & note
$(document).on('click', '.view_a_follow_up', function() {
    var url  = $(this).data('href');
    $.ajax({
        method: "GET",
        dataType: "html",
        url: url,
        success: function(result){
            $('.view_modal').html(result).modal("show");
        }
    });
});

function initializeFollowUpDataTable() {
    
    follow_up_data_table = $('#follow_ups_table').DataTable({
            processing: true,
            serverSide: true,
            ajax:{
                url: '/follow-ups',
                data: function(d) {
                    d.notable_id = $('#notable_id').val();
                    d.notable_type = $('#notable_type').val();
                }
            },
            columnDefs: [
                {
                    targets: [0, 2, 4],
                    orderable: false,
                    searchable: false,
                },
            ],
            aaSorting: [[3, 'asc']],
            columns: [
                { data: 'action', name: 'action' },
                { data: 'heading', name: 'heading' },
                { data: 'createdBy'},
                { data: 'created_at', name: 'created_at' },
                { data: 'updated_at', name: 'updated_at' },
            ]
        });
}