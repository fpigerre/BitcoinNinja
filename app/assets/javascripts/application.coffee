# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
#= require jquery.transform2d.min
#= require jquery_ujs
#= require turbolinks

$(document).ready ->
  $('.flash').animate transform: 'translateY(-75px)'
  $(window).scroll ->
    setTimeout (->
      $('.flash').animate transform: 'translateY(75px)'
      return
    ), 1500