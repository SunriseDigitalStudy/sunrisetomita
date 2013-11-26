{extends file='default/base.tpl'}
{block css}
    <link rel="stylesheet" href="/css/top_page.css" type="text/css">
{/block}
{block title append} スレッドリスト{/block}
{block main_contents}
<div class="panel panel-default">
  <div class="panel-heading">
    <h1 class="panel-title">スレッド一覧ページ</h1>
  </div>
</div>

<div class="thread_list">
  <h2>スレッドリスト</h2>
  <dl>
  <dt>表示モード</dt>
  {if $smarty.get.genre_id}
  <dd>ジャンル別表示</dd>
  <dt>ジャンル名</dt>
  <dd>{$thread_list->getFirstRecord()->getGenre()->getName()}</dd>
  {elseif $smarty.get.tag_id}
  <dd>タグ別表示</dd>
  <dt>タグ名</dt>
  <dd>{$thread_list->getFirstRecord()->getThreadTagList()->getFirstRecord()->getTag()->getName()}</dd>
  {else}
  <p>全件表示</p>
  {/if}
  </dl>
  <table class="table">
    <tr class="success">
      <th>スレッドNo.</th>
      <th>スレッド名</th>
      <th>スレッド作成日時</th>
      <th>最終エントリ日時</th>
    </tr>
    
    {foreach $thread_list as $record}
    <tr>
      <td>{$record->getId()}</td>
      <td><i class="fa fa-arrow-circle-right"></i><a href="/thread/{$record->getId()}/list">{$record->getTitle()}</a></td>
      <td>{$record->getCreated_at()|date_format:"%Y年%m月%d日(%a) %H:%M:%S"|replace:"Sun":"日"|replace:"Mon":"月"|replace:"Tue":"火"|replace:"Wed":"水"|replace:"Thu":"木"|replace:"Fri":"金"|replace:"Sat":"土"}</td>
      <td>{$record->get('newest_date')|date_format:"%Y年%m月%d日(%a) %H:%M:%S"|replace:"Sun":"日"|replace:"Mon":"月"|replace:"Tue":"火"|replace:"Wed":"水"|replace:"Thu":"木"|replace:"Fri":"金"|replace:"Sat":"土"}</td> 
    </tr>
    {/foreach}
  </table>    
</div>
<span class="only_clear"></span>
{/block}