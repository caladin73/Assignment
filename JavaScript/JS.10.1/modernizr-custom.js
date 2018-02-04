/*
 *
 */
'use strict';
var isDate = function (date) {
    return true;
}
var validate = function (e) {
    if (!Modernizr.inputtypes.date) {
        var date = document.getElementById('dat');
        window.alert(date.value);
        if (!isDate(date.value)) {
            date.focus();
             e.preventDefault();
            return false;
        }
    }
    return true;
}

var dispSlide = function () {
  document.getElementById('ranger').innerHTML =
                                   document.getElementById('rng').value;
}

var followme = function () {
  document.getElementById('formal').addEventListener('submit', validate);
  dispSlide();
  document.getElementById('rng').addEventListener('mousemove', dispSlide);

  if (!Modernizr.input.placeholder) {
    document.getElementById('dateplch').innerHTML = "format: yyyy-mm-dd";
  }
}
window.addEventListener('load', followme);
