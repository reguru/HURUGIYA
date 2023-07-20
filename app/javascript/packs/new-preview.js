/*global $*/
$(function(){

  function buildHTML(count) {
    var html = `<div class="preview-box" id="preview-box_${count}">
                  <div class="img-box">
                    <img src="" alt="preview">
                    <div class="delete-box" id="delete_btn_${count}">
                      <span>×</span>
                    </div>
                  </div>
                </div>`
    return html;
  }

  function setLabel() {
    //プレビューボックスを取得
    var prevContent = $('.label-content').prev();
  }

  // プレビューの追加
  $(document).on('change', '.hidden-field', function() {
    setLabel();
    //hidden-fieldのidの数値のみ取得
    var id = $(this).attr('id').replace(/[^0-9]/g, '');
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

      //ラベルのwidth操作
      setLabel();
      //ラベルのidとforの値を変更
      if(count < 10){
        //プレビューの数でラベルのオプションを更新する
        $('.label-box').attr({id: `label-box-${count}`,for: `post_image_${count}`});
      }
    }
  });

  // 画像の削除
  $(document).on('click', '.delete-box', function() {
    var count = $('.preview-box').length;
    setLabel(count);
    //post_image_${id} から${id}に入った数字のみを抽出
    var id = $(this).attr('id').replace(/[^0-9]/g, '');
    //取得したidに該当するプレビューを削除
    $(`#preview-box_${id}`).remove();
    console.log("new")
    //フォームの中身を削除
    $(`#post_image_${id}`).val("");

    //削除時のラベル操作
    var count = $('.preview-box').length;
    //10個めが消されたらラベルを表示
    if (count == 9) {
      $('.label-content').show();
    }
    setLabel(count);

    if(id < 10){
      //削除された際に、空っぽになったfile_fieldをもう一度入力可能にする
      $('.label-box').attr({id: `label-box-${id}`,for: `post_image_${id}`});
    }

  });
});
