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
    if (input.files && input.files[2]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('.img_prev2').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[2]);
    }
    if (input.files && input.files[3]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('.img_prev3').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[3]);
    }
    if (input.files && input.files[4]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('.img_prev4').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[4]);
    }
    if (input.files && input.files[5]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('.img_prev5').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[5]);
    }
    if (input.files && input.files[6]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('.img_prev6').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[6]);
    }
    if (input.files && input.files[7]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('.img_prev7').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[7]);
    }
    if (input.files && input.files[8]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('.img_prev8').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[8]);
    }
    if (input.files && input.files[9]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('.img_prev9').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[9]);
    }
  }
  $(document).on('change', '.img_field', function(){
    readURL(this);
  });
});

