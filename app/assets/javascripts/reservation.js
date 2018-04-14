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
    $(".djbooth").removeClass("green");
    $(".box").removeClass("green");
    $('#date-changer').css('background', '#4CAF50');
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
          console.log('true');
          $('#' + table.id).addClass("green");
        } else {
          console.log('false');
          $('#' + table.id).removeClass("green");
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
