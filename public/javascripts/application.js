$(document).ready(function() {
  $('.section_title_edit').editable('/sections/inplace', {
    indicator : 'Saving...',
    tooltip   : 'Click to edit...'
  });
  $('.section_text_edit').editable('/sections/inplace', {
    type      : 'textarea',
    cancel    : 'Cancel',
    submit    : 'OK',
    loadurl   : '/sections/inplace',
    indicator : '<img src="/images/indicator.gif">',
    tooltip   : 'Click to edit...'
  });
});