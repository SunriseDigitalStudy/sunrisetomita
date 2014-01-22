$(function(){
  /* *
   * 変数の用意
   */
  var searchSubmit = $("#search-form input[type='submit']");
  var searchMore = $('input[name=more]');
  var loading = $('.loading');
  
  /* *
   * 通信用function
   */
  function loadThread(somePid){
    /* *
     * somePid にデフォルト値として1を設定。
     * somePid がnull、0、空文字、undefined だったら"1"になるようにする。
     */
    somePid = somePid || 1;
    searchSubmit.hide();//通信が開始したらすぐ隠す
    searchMore.hide();//これも隠しておかないと通信開始直後｢さらに表示｣がいきなり見える。
    var $form = $("#search-form");
    var query = $form.serialize();
    $(".data-disp").addClass("thread_list");
    $.ajax({
      type: "GET",
      url: "/thread/entrance/thread-list", 
      data: query+"&pid="+somePid
    }).done(function(data){
      
        //レコードがあったかどうかの判定。
        //data['records']の中身が無ければメッセージを出す。
        if(data['records'].length === 0){
          $(".data-disp").append(
            "<div class='alert alert-warning'>検索条件に一致するスレッドが見つかりません。</div>"
          );
        }
        
        //レコードがあればそれを出力する。
        for(var i in data.records){
          $(".data-disp").append('<table class="table table-bordered"></table>');
          $(".data-disp > table:last").append('<thead></thead><tbody></tbody>');
          $(".data-disp > table:last > thead" ).append(
            "<tr class='success'>"+"<th>"+
            "<a href='/thread/"+data.records[i].id+"/list'>"+"<i class ='fa fa-play'></i>"+
            " "+data.records[i].title +
            "</a>" +"</th>"+"</tr>"
          );
          $(".data-disp > table:last > tbody").append(
            "<tr>"+"<td>"+ "最終更新日時："+formatDate(data.records[i].newest_date)+
            "</td>"+"</tr>"
          );
        }
    
        //｢さらに表示｣ボタンの表示判定に使うdata-next_pid属性を追加
        $(".data-disp").attr("data-next_pid",data.next_pid);
    }).fail(function(jsondata){
        alert("NG");
    }).always(function(jsondata){
        searchSubmit.show();//通信が終わったのでsubmitボタンの非表示を解除
        loading.hide();
        
        //｢さらに表示｣ボタンはnext_pidがある限り表示させる
        if($(".data-disp").attr("data-next_pid")){
          searchMore.show();
        }
    });
    
    return this;
  }
  
  /* * 
   * 日付フォーマット変換用
   * PHPから受け取った日付をそのまま出力すると
   * " 2014-01-10 15:25:43 "みたいな形式になるので
   * これを" 2014年1月10日(金) 15時25分43秒 "になおす。
   */
  function formatDate(str) {
    //Chromeではないブラウザ対策
    // yyyy-mm-dd ⇒ yyyy/mm/dd にしてからDate()に渡す
    var date = new Date(str.replace(/-/g,'/'));
    
    var week = ["日","月","火","水","木","金","土"];//日本語曜日表示用
    var month = date.getMonth()+1;//そのまま出力すると0月～11月表記になるので。
    
    //変換開始
    var formatted = 
      date.getFullYear()+"年"
      +month +"月"
      +date.getDate()+"日"
      +"("+week[date.getDay()]+")"+"　"
      +date.getHours()+"時"
      +date.getMinutes()+"分"
      +date.getSeconds()+"秒";
    
    return formatted;
  }
  
  /* *
   * 各種イベント別動作
   */
  
  //submitボタンを押したときの動作
  searchSubmit.on('click', function(){
    searchSubmit.hide();
    loading.show();
    $('.data-disp').html("");//これまでappendされたものを消す。
    loadThread();
  });
  
  //｢さらに表示｣ボタンを押したときの動作
  searchMore.on('click', function(){
    searchMore.hide();
    loading.show();
    
    //loadThread()の引数は data-next_pid の値を指定。    
    loadThread($(".data-disp").attr("data-next_pid"));
  });
  
  //ページのロード時に実行。
  loadThread();
});