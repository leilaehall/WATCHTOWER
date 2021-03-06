import flatpickr from "flatpickr";
import "flatpickr/dist/themes/light.css";

flatpickr(".datepicker", {
  altInput: true,

        mode: "range",
        minDate: "today",
        dateFormat: 'n/j/Y',
        onClose: function(selectedDates, dateStr, instance) {
          let daysInRange = document.getElementsByClassName('inRange');
          let daysLengthTotal = daysInRange.length + 1;
          console.log(daysLengthTotal);
          if (document.querySelector("#price")) {
           let price = parseInt(document.querySelector("#price").textContent)
          document.querySelector("#totalprice").innerHTML = `That will be just €${daysLengthTotal * price} for ${daysLengthTotal} days!`
          }
          if(document.querySelector("#totaldays")) {
            document.querySelector("#totaldays").innerHTML = `That's ${daysLengthTotal} day(s)`
          }
        }
});
