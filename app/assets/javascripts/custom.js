$(document).ready(function () {
  $(this).find("#btn").hide();
  $(document).on('mouseenter', '#image_container', function () {
      $(this).find("#btn").show();
  }).on('mouseleave', '#image_container', function () {
      $(this).find("#btn").hide();
  });
});
