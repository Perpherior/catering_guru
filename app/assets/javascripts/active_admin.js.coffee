#= require active_admin/base

$ ->
  $('#redactor').redactor(
    minHeight: 200
    cleanOnPaste: false
    cleanStyleOnEnter: true
    imageUpload: '/article/upload' + "?" + $('meta[name=csrf-param]').attr('content') + "=" + encodeURIComponent($('meta[name=csrf-token]').attr('content'))
  )