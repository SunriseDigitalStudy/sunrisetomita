{extends file='default/base.tpl'}
{block css}
    <link rel="stylesheet" href="/css/threadlist.css" type="text/css">
    <link rel="stylesheet" href="/css/search.css" type="text/css">
{/block}
{block js}
    <script src="/js/search.js"></script>
    <script src="/js/format.js"></script>

    {*---------thread-list.tpl代わり----------*}
    <script type="text/html" id="tpl_article_row">
      <table class="table table-bordered">
        <thead>
          <tr class="success">
            <th><a href="/thread/%id%/entry-list"><i class="fa fa-play"></i> %title%</a></th>
          </tr>
        </thead>
        <tbody>
          <tr><td>最終更新日時：%newest_date%</td></tr>
        </tbody>
      </table>
    </script>
    
   {* 投稿が1件も無いスレッドに表示させるメッセージのテンプレ *}
    <script type="text/html" id="tpl_no_entry">
      <i class="fa fa-exclamation-triangle"></i> 
      <span style="color:#ff4500;font-weight:bold">まだ投稿がありません</span>
    </script>
{/block}
{block title append} 検索用ページ{/block}
{block main_contents}
<div class="panel panel-default">
  <div class="panel-heading">
    <h1 class="panel-title">検索用ページ</h1>
  </div>
</div>
<h2>検索メニュー</h2>
<ul>
{foreach $thread_list as $record}
    <li>{$record->get()}</li>

{/foreach}
</ul>

<div class="sub_menu">
<form id="search-form" action="javascript:void(0);">
<dl class="clearfix">
  <dt>ジャンル</dt>
    <dd><label><input type="radio" name="genre_id" value="">指定なし</label></dd>
  {foreach $genre_list as $record}
    <dd><label><input type="radio" name="genre_id" value="{$record->getId()}">{$record->getName()}</label></dd>
  {/foreach}
</dl>
<dl class="clearfix">
  <dt>タグ</dt>
  {foreach $tag_list as $record}
    <dd><label><input type="checkbox" name="tag_id[{$record->getId()}]" value="{$record->getId()}">{$record->getName()}</label></dd>
  {/foreach}  
</dl>
<div class="navbar-search">
  <div class="icon-search"></div>
  <input type="submit" name="submit" value="検索開始" class="btn btn-default">
</div>
<div class="loading"><img src="/img/loading.gif" alt="Now loading...">Now loading... </div>
</form>

  {if $sdx_user->hasId()}
  <dl class="clearfix">
    <dt><i class="fa fa-lock"></i> 管理メニュー</dt>
      <dd><a href="/control/thread">スレッド管理</a></dd>
      <dd><a href="/control/genre">ジャンル管理</a></dd>
      <dd><a href="/control/tag">タグ管理</a></dd>
  </dl>
  {/if}
</div>
  
{*-------------ajaxで取得したdataの表示スペース--------------*}
<h2>スレッドリスト</h2>
<div class="data-disp">

</div>
{*-------------必要に応じて表示させる要素群。基本隠す--------------*}
{* 検索に一致するスレがないときに表示 *}
<div class="no-data alert alert-warning">スレッドが見つかりません。</div>
{* レコードが追加取得可能なときに表示 *}
<input type="button" name="more" value="さらに表示" >
{* 通信をしているときに表示 *}
<div class="loading"><img src="/img/loading.gif" alt="Now loading...">Now loading... </div>
{/block}