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
        options += `<option value="${opt.min_price}">${opt.id}</option>`
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

$(document).ready(function(){
    var tableValue_,
        servervalue = 200,
        atmosval = 300;
    $("#chingy").on('change', function() {
      console.log("dis works?")
        tableValue_ = Number($('#table_id').val())
        console.log(tableValue_);
        document.getElementById('results').value = '$' + tableValue_;
        tablevalue=document.getElementById('results').value;
    });
    $("#yonce").on('change', function() {
        document.getElementById('sresults').value = '$' + parseInt(servervalue);

  });
    $("#yaus").on('change', function() {
        document.getElementById('aresults').value = parseInt(300);
  });
    $("#naus").on('change', function() {
        document.getElementById('aresults').value = parseInt(0);
  });
    $("#mels").on('change', function() {
      men = document.getElementById('nresults').value;
      if(men >= 3){
        document.getElementById("aresults").value= '$' + 300;
          $("#radioyes").prop("checked", true);
          $(":radio").click(function(e){
            e.preventDefault();
          })
      } else {
        atmosval = 0;
        $(":radio").click(function(e){
          $(":radio").unbind('click').click();

        });
      }

  });
  $("#refresh").on('click', function(w){
    let calctotal = "$" + ( tableValue_ + servervalue + atmosval).toString();
    document.getElementById("total").value = calctotal;
    document.getElementById("stripetotal").dataset.amount = calctotal;
    w.preventDefault();
  })

  $("#stripetotal").on("click", (event)=>{
    let calctotal = Number(tableValue_) + Number(servervalue) + Number(atmosval);
    console.log(tableValue_ + servervalue + atmosval, calctotal, 'calctotal')

    StripeCheckout.configure({
      key: "pk_test_XcZDuXi6mofUZLtwZpiaSH3D",
      image: "https://stripe.com/img/documentation/checkout/marketplace.png",
      locale: "payment_section"
    })
    console.log(calctotal);
    StripeCheckout.open({
      name: "Velvet Rope",
      amount: calctotal * 100,
      description: "Table Charge",
      key: "pk_test_XcZDuXi6mofUZLtwZpiaSH3D",
      token: "tok_us"
    })
  })
});