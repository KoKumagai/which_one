# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $("input[data-radio='sentence-type']").on "click", ->
    value = $('input[data-radio=\'sentence-type\']:checked').val()
    if value == '1'
      $('#general_prefix').css 'display', 'inline'
      $('#be_prefix').css 'display', 'none'
      $("#survey_comparison_word").attr('placeholder', 'like');
      $("#survey_first_word").attr('placeholder', 'apple');
      $("#survey_second_word").attr('placeholder', 'orange');
    else if value == '2'
      $('#general_prefix').css 'display', 'none'
      $('#be_prefix').css 'display', 'inline'
      $("#survey_comparison_word").attr('placeholder', 'stronger');
      $("#survey_first_word").attr('placeholder', 'lion');
      $("#survey_second_word").attr('placeholder', 'gorilla');
