$(document).ready ->
  $('#user_search').validate
    rules:
      'q[student_id_eq]': required: true
      'q[alumni_id_eq]': required: true
      'q[last_name_eq]': required: true
    messages:
      'q[student_id_eq]': required: 'Student id is required.'
      'q[alumni_id_eq]': required: 'Alumni id is required.'
      'q[last_name_eq]': required: 'Last name is requred'

    validClass: 'has-success'
    errorClass: 'help-block'
    errorElement: 'small'
    errorPlacement: (error, element) ->
      element.parent().parent().parent().addClass("has-error")
      error.insertAfter element.parent()
      return

$('#new_request').validate
  rules:
    'request[email]': required: true
    'request[phone_number]': required: true
    'request[name]': required: true
    'request[faculty]': required: true
    'request[campus]': required: true
    'request[programme]': required: true
    'request[intake]': required: true

  messages:
    'request[email]': required: 'Email is required'
    'request[phone_number]': required: 'Phone number is required'
    'request[name]': required: 'Name is required'
    'request[faculty]': required: 'Faculty is required'
    'request[campus]': required: 'Campus is required'
    'request[programme]': required: 'Programme is required'
    'request[intake]': required: 'Intake is required'

  validClass: 'has-success'
  errorClass: 'help-block'
  errorElement: 'small'
  errorPlacement: (error, element) ->
    element.parent().parent().parent().addClass("has-error")
    error.insertAfter element.parent()
    return

$('#new_user').validate
  rules:
    'user[student_id]': required: true
    'user[password]': required: true
    'user[email]': required: true
    'user[name]': required: true


  messages:
    'user[student_id]': required: 'Student id is required'
    'user[password]': required: 'Password is required'
    'user[email]': required: 'Email is required'
    'user[name]': required: 'Name is required'


  validClass: 'has-success'
  errorClass: 'help-block'
  errorElement: 'small'
  errorPlacement: (error, element) ->
    element.parent().parent().parent().addClass("has-error")
    error.insertAfter element.parent()
    return

$('#new_batch').validate
  rules:
    'batch[month]': required: true
    'batch[year]': required: true


  messages:
    'batch[month]': required: 'Please select month'
    'batch[year]': required: 'Please select year'

  validClass: 'has-success'
  errorClass: 'help-block'
  errorElement: 'small'
  errorPlacement: (error, element) ->
    element.parent().parent().parent().addClass("has-error")
    error.insertAfter element.parent()
    return

$('#new_campu').validate
  rules:
    'campu[name]': required: true

  messages:
    'campu[name]': required: 'Campus name is required'

  validClass: 'has-success'
  errorClass: 'help-block'
  errorElement: 'small'
  errorPlacement: (error, element) ->
    element.parent().parent().parent().addClass("has-error")
    error.insertAfter element.parent()
    return

$('#new_faculty').validate
  rules:
    'faculty[name]': required: true
    'faculty[campu_id]': required: true

  messages:
    'faculty[name]': required: 'faculty name is required'
    'faculty[campu_id]': required: 'Please select campus'

  validClass: 'has-success'
  errorClass: 'help-block'
  errorElement: 'small'
  errorPlacement: (error, element) ->
    element.parent().parent().parent().addClass("has-error")
    error.insertAfter element.parent()
    return

$('#new_programme').validate
  rules:
    'programme[name]': required: true
    'programme[faculty_id]': required: true

  messages:
    'programme[name]': required: 'Programme name is required'
    'programme[faculty_id]': required: 'Please select programme'

  validClass: 'has-success'
  errorClass: 'help-block'
  errorElement: 'small'
  errorPlacement: (error, element) ->
    element.parent().parent().parent().addClass("has-error")
    error.insertAfter element.parent()
    return

$('#new_announcement').validate
  rules:
    'announcement[title]': required: true
    'announcement[content]': required: true

  messages:
    'announcement[title]': required: 'Title is required'
    'announcement[content]': required: 'Content is required'

  validClass: 'has-success'
  errorClass: 'help-block'
  errorElement: 'small'
  errorPlacement: (error, element) ->
    element.parent().parent().parent().addClass("has-error")
    error.insertAfter element.parent()
    return

$('#new_event').validate
  rules:
    'event[title]': required: true
    'event[content]': required: true

  messages:
    'event[title]': required: 'Title is required'
    'event[content]': required: 'Content is required'

  validClass: 'has-success'
  errorClass: 'help-block'
  errorElement: 'small'
  errorPlacement: (error, element) ->
    element.parent().parent().parent().addClass("has-error")
    error.insertAfter element.parent()
    return

$('#new_job').validate
  rules:
    'job[title]': required: true
    'job[company]': required: true
    'job[city]': required: true
    'job[country]': required: true
    'job[skills]': required: true
    'job[description]': required: true

  messages:
    'job[title]': required: 'Job title is required'
    'job[company]': required: 'Company name is required'
    'job[city]': required: 'City is required'
    'job[country]': required: 'country is required'
    'job[skills]': required: 'skills is required'
    'job[description]': required: 'description is requred'

  validClass: 'has-success'
  errorClass: 'help-block'
  errorElement: 'small'
  errorPlacement: (error, element) ->
    element.parent().parent().parent().addClass("has-error")
    error.insertAfter element.parent()
    return

$('#new_message').validate
  rules:
    'message[body]': required: true

  messages:
    'message[body]': required: 'Message body cannot be empty!'

  validClass: 'has-success'
  errorClass: 'help-block'
  errorElement: 'small'
  errorPlacement: (error, element) ->
    element.parent().parent().parent().addClass("has-error")
    error.insertAfter element.parent()
    return
