$(function() {
  $('#add_to_cart').click(function() {
    alert("Add to cart");
    $(this).parent('form').submit();
  });
});
