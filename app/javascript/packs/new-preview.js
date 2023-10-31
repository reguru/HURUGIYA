/*global $*/
$(function(){

  function buildHTML(count) {
    var html = `<div class="preview-box" id="preview-box_${count}">
                  <div class="img-box">
                    <img src="" alt="preview">
                  </div>
                  <div class="under-box">
                    <div class="delete-box" id="delete_btn_${count}">
                      <i class="fas fa-trash-alt" style="color: #636974;"></i>
                    </div>
                  </div>
                </div>`
    return html;
  }

  //posts/:id/editページに遷移した時のアクション=========================
  if (window.location.href.match(/\/posts\/\d+\/edit/)) {
    //プレビューにidを追加
    $('.preview-box').each(function(index, box) {
      $(box).attr('id', `preview-box_${index}`);
    })
    //削除ボタンにidを追加
    $('.delete-box').each(function(index, box) {
      $(box).attr('id', `delete_btn_${index}`);
    })
    $('.image_id').each(function(index, box) {
      $(box).attr('id', `edit_image_${index}`);
    })
    var count = $('.preview-box').length;
    if (count == 10) {
      $('.label-content').hide();
    }
  }
  //=====================================================================

  // プレビューの追加
  $(document).on('change', '.hidden-field', function() {
    //hidden-fieldのidの数値のみ取得
    var id = $(this).attr('id').replace(/[^0-9]/g, '');
    //blobのimage_idを取得
    const imageId = $(`#edit_image_${id}`).text().replace(/\s+/g,'');
    //labelボックスのidとforを更新
    $('.label-box').attr({id: `label-box-${id}`,for: `post_image_${id}`});
    //選択したfileのオブジェクトを取得
    var file = this.files[0];
    var reader = new FileReader();
    //readAsDataURLで指定したFileオブジェクトを読み込む
    reader.readAsDataURL(file);
    //読み込み時に発火するイベント
    reader.onload = function() {
      var image = this.result;
      //プレビューが元々なかった場合はhtmlを追加
      if ($(`#preview-box_${id}`).length == 0) {
        var count = $('.preview-box').length;
        var html = buildHTML(id);
        //ラベルの直前のプレビュー群にプレビューを追加
        var prevContent = $('.label-content').prev();
        $(prevContent).append(html);
      }
      //イメージを追加
      $(`#preview-box_${id} img`).attr('src', `${image}`);
      var count = $('.preview-box').length;
      //プレビューが10個あったらラベルを隠す
      if (count == 10) {
        $('.label-content').hide();
      }
      //ラベルのidとforの値を変更
      if(count < 10){
        //プレビューの数でラベルのオプションを更新する
        $('.label-box').attr({id: `label-box-${count}`,for: `post_image_${count}`});
      }

      // if($(`#post_image_ids_${imageId}`)) {
      //   $(`#post_image_ids_${imageId}`).prop('checked', false);
      // }
    }
  });

  //画像の削除
  $(document).on('click', '.delete-box', function() {
    var id = $(this).attr('id').replace(/[^0-9]/g, '');

    //チェックボックスにチェックをつける
    const imageId = $(`#edit_image_${id}`).text().replace(/\s+/g,'');
    $(`#post_image_ids_${imageId}`).prop('checked', true);

    //取得したidに該当するプレビューを削除
    $(`#preview-box_${id}`).remove();
    //フォームの中身を削除
    $(`#post_image_${id}`).val("");


    //削除時のラベル操作
    var count = $('.preview-box').length;
    //10個めが消されたらラベルを表示
    if (count == 9) {
      $('.label-content').show();
    }

    if(id < 10){
      //削除された際に、空っぽになったfile_fieldをもう一度入力可能にする
      $('.label-box').attr({id: `label-box-${id}`,for: `post_image_${id}`});
    }

  });
});
