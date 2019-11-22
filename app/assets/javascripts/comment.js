jQuery(document).on('turbolinks:load', function(){
  $(function(){
    function buildHTML(comment){
      var html = `<div class="comment-box">
                    <div class="comment-box__left">
                      <div class="user-avater">
                        <img class="user-avater__photo" src="${comment.user_image}">
                      </div>
                    </div>
                    <div class="comment-box__right">
                      <div class="user-comment">
                        <div class="user-comment__upper">
                          <div class="user-name">
                            <a class="user-name__link" href="/users/${comment.user_id}">${comment.user_name}</a>
                          </div>
                          <div class="user-comment__daytime">
                            ${comment.created_at}
                          </div>
                        </div>
                        <div class="user-comment__text">
                          ${comment.text}
                        </div>
                      </div>
                    </div>
                  </div>`
      return html;
    }

    $('#new_comment').on('submit', function(e){
      e.preventDefault();
      var formData = new FormData(this);
      var url = $(this).attr('action')
      $.ajax({
        url: url,
        type: 'POST',
        data: formData,
        dataType: 'json',
        processData: false,
        contentType: false
      })
      .done(function(data){
        var html = buildHTML(data);
        $('.sweets-comments__lower-content').append(html);
        $('#comment_text').val('');
        $('.comment-btn').prop('disabled', false);
        $('.sweets-wrapper').animate({ scrollTop: $('.sweets-wrapper')[0].scrollHeight });
      })
      .fail(function(){
        alert('error');
      })
    })
  })
});