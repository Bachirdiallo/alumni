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


  messages:
    'user[student_id]': required: 'Student id is required'
    'user[password]': required: 'Password is required'

  validClass: 'has-success'
  errorClass: 'help-block'
  errorElement: 'small'
  errorPlacement: (error, element) ->
    element.parent().parent().parent().addClass("has-error")
    error.insertAfter element.parent()
    return
