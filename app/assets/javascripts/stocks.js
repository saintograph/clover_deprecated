const init_stock_lookup = function() {
  $('#stock-lookup-form').on('ajax:before', (event, data, status) => {
    show_spinner();
  });
  $('#stock-lookup-form').on('ajax:after', (event, data, status) => {
    hide_spinner();
  });
  $('#stock-lookup-form').on('ajax:success', function(event, data, status) {
    $('#stock-lookup').replaceWith(data);
    init_stock_lookup();
  });

  $('#stock-lookup-form').on('ajax:error', function(event, xhr, status, error) {
    $('#stock-lookup-results').replaceWith(' ')
    $('#stock-lookup-errors').replaceWith('Stock was not found.');
    hide_spinner();
  });
};


$(document).ready(function() {
  init_stock_lookup();
});
