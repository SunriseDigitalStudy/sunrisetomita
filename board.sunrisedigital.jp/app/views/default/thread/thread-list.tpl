{extends file='default/base.tpl'}
{block css}
{/block}
{block main_contents}
<div class="panel panel-default">
  <div class="panel-heading">
    <h1 class="panel-title">スレッド一覧ページ</h1>
  </div>
</div>
{if $thread_list->isEmpty()}
<div class="alert alert-warning">検索条件に合致するスレッドはありません。</div>
{/if}

{if $sdx_user->hasId()}
<div class="alert alert-info">
  <dl>
    <dt><i class="fa fa-lock"></i> 管理メニュー</dt>
    <dd><a href="/control/thread">スレッド追加</a></dd>
    <dd><a href="/control/genre">ジャンル追加</a></dd>
    <dd><a href="/control/tag">タグ追加</a></dd>
  </dl>
</div>
{else}
<div class="alert alert-info">
  <p>掲示板ユーザー登録を行うと、新規スレッドの追加、書き込みができるようになります。</p>
  <dl>
    <dt>ログインメニュー</dt>
    <dd><i class="fa fa-sign-in"></i><a href="/account/create"> ユーザー登録</a></dd>
    <dd><i class="fa fa-sign-in"></i><a href="/secure/login"> ログイン</a></dd>
  </dl>
</div>
{/if}

<div class="thread_list">
  {foreach $thread_list as $record}
  <table class="table table-bordered">
    <thead>
    <tr class="success">
    <th><a href="/thread/{$record->getId()}/entry-list"><i class="fa fa-play"></i> {$record->getTitle()}</a></th>
    </tr>
    </thead>

    <tbody>
    <tr>
    <td>最終更新日時：{if $record->get('newest_date')}{$record->getFormatedDateByZend('newest_date', 'yyyy年MM月dd日(E) HH時mm分ss秒')}{else}<strong>まだコメントがありません</strong>{/if}</td>
    </tr>
    </tbody>
  </table>
  {/foreach}

  {if $pager->hasPrevPage() ||$pager->hasNextPage()}
    <ul class="pager">
      {if $pager->hasPrevPage()}
        <li>{$pager->getPrevLink("前のページ") nofilter}</li>
      {/if}
      {if $pager->hasNextPage()}
        <li>{$pager->getNextLink("次のページ") nofilter}</li>
      {/if}
    </ul>
  {/if}
</div>

{/block}