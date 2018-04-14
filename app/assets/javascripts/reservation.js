// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on("turbolinks:load ", function(){


  $('.datepicker').pickadate({
    selectMonths: true, // Creates a dropdown to control month
    selectYears: 15, // Creates a dropdown of 15 years to control year,
    today: 'Today',
    clear: 'Clear',
    close: 'Ok',
    closeOnSelect: false // Close upon selecting a date,
  });

  $("#date-changer").on("click", () => {
    let selectedDate = $("#day").val()
    let clubName = $("#clubname-hidden").val()
    let postData = {
      authenticity_token: $('meta[name=csrf-token]').attr('content'),
      day: selectedDate,
      clubname: clubName
    }
    $.post("/available_tables_for_date", postData, (data) => {
      console.log(data);
      let options = ""
      data.forEach( (opt) => {
        options += `<option value="${opt.name}">${opt.id}</option>`
      })
      $("#table_id").html(options);

      data.forEach(function(table){
        if (table.available_today){
          $('#' + table.id).addClass("green")
        }else{
          $('#' + table.id).addClass("red")

        }
      })

      // let availability = $('.box')
      // // .data('available-today')
      //
      // availability.forEach(function(){
      //   $(this).css("border-color", "black");
      // });

    })
  })

})

// <option value="Table 1">1</option>
