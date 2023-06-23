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
  }
  $(document).on('change', '.img_field', function(){
    readURL(this);
  });
});

$(function() {
  const createImageHTML = (blob, target) => {

  // 既に画像表示エリアが存在するなら img の src だけ更新
     let preview = document.querySelector(`img[data-for="${target.id}"]`);
     if (preview) {
       preview.setAttribute('src', blob);
       return;
     }

      // 画像を表示するためのdiv要素を生成
      const imageElement = document.createElement('div');
      imageElement.setAttribute('class', "image-element")
      let imageElementNum = document.querySelectorAll('.image-element').length

      // 表示する画像を生成
      const blobImage = document.createElement('img');
      blobImage.className="img-preview";
     blobImage.dataset.for = target.id;
      blobImage.setAttribute('src', blob);
  }
});