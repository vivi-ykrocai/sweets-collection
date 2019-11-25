jQuery(document).on('turbolinks:load', function(){
  $(function () {
    $('.ranking__link').on('click', function () {
      $('#modal-wrapper').fadeIn();
      document.getElementById('modal-close-btn').onclick = function () {
        $('#modal-wrapper').fadeOut();
      };
    });
  });
});