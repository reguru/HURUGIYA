//ファイルを変更したら、プレビュー画像が切り替わる設定
/*global $*/
$(function() {
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('.img_prev').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
    if (input.files && input.files[1]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('.img_prev1').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[1]);
    }
  }
  $(document).on('change', '.img_field', function(){
    readURL(this);
  });
});

