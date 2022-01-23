$(document).on('turbolinks:load',function(){show_diagnosis_item()});

function show_diagnosis_item(){
  $('.btn.btn-outline-success.lol').click(function(){
    console.log('lol')
let patientId = $(this).attr('id');

    $.ajax({
      url: `/diagnosis_items.json?patient_id=${patientId}`,
      dataType: "json",

      success: function (data, textStatus) {
        const res = data.map((item) => item.content);
        $(`#show-items${patientId}`).html('<div>' + res + '</div>');
      }
    })
  });
    
}
