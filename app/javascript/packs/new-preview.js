/*global $*/
/*global labelWidth*/
$(function(){

  function buildHTML(count) {
    var html = `<div class="preview-box" id="preview-box_${count}">
                  <div class="upper-box">
                    <img src="" alt="preview">
                  </div>
                  <div class="lower-box">
                    <div class="update-box">
                      <label class="edit_btn">編集</label>
                    </div>
                    <div class="delete-box" id="delete_btn_${count}">
                      <span>削除</span>
                    </div>
                  </div>
                </div>`
    return html;
  }

  function setLabel() {
    //プレビューボックスのwidthを取得し、maxから引くことでラベルのwidthを決定
    var prevContent = $('.label-content').prev();
    labelWidth = (1620 - $(prevContent).css('width').replace(/[^0-9]/g, ''));
    $('.label-content').css('width', labelWidth);
  }

  // プレビューの追加
  $(document).on('change', '.hidden-field', function() {
    setLabel();
    //hidden-fieldのidの数値のみ取得
    var id = $(this).attr('id').replace(/[^0-9]/g, '');
    //labelボックスのidとforを更新
    // $('.label-box').attr({id: `label-box-${id}`,for: `post_image_${id}`});
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
      if (count == 1) {
        $('.label-box_0').hide();
      }
      if (count == 2) {
        $('.label-box_1').hide();
      }
      if (count == 3) {
        $('.label-box_2').hide();
      }
      if (count == 4) {
        $('.label-box_3').hide();
      }
      if (count == 5) {
        $('.label-box_4').hide();
      }
      if (count == 6) {
        $('.label-box_5').hide();
      }
      if (count == 7) {
        $('.label-box_6').hide();
      }
      if (count == 8) {
        $('.label-box_7').hide();
      }
      if (count == 9) {
        $('.label-box_8').hide();
      }
      if (count == 10) {
        $('.label-box_9').hide();
      }
      
      //ラベルのwidth操作
      setLabel();
      //ラベルのidとforの値を変更
      if(count < 10){
        //プレビューの数でラベルのオプションを更新する
        // $('.label-box').attr({id: `label-box-${count}`,for: `post_image_${count}`});
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

    // if ($('#preview-box_0') == null) {
    //   $('.label-box_0').show();
    // }
    // if ($('#preview-box_1') == null) {
    //   $('.label-box_1').show();
    // }
    // if ($('#preview-box_2') == null) {
    //   $('.label-box_2').show();
    // }
    // if ($('#preview-box_3') == null) {
    //   $('.label-box_3').show();
    // }
    // if ($('#preview-box_4') == null) {
    //   $('.label-box_4').show();
    // }
    // if ($('#preview-box_5') == null) {
    //   $('.label-box_5').show();
    // }
    // if ($('#preview-box_6') == null) {
    //   $('.label-box_6').show();
    // }
    // if ($('#preview-box_7') == null) {
    //   $('.label-box_7').show();
    // }
    // if ($('#preview-box_8') == null) {
    //   $('.label-box_8').show();
    // }
    // if ($('#preview-box_9') == null) {
    //   $('.label-box_9').show();
    // }
    
  });
});
