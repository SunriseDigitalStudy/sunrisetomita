board
=====

■概要
　掲示板用リポジトリです。

■ルール(*2013/11/14時点)
　作業用feat/board/xxxxx を機能ごとに作っていきます。
　既にブランチを作ってごっちゃになってきているので、今回に限り
　master = proj/board と置き換えて、フィートブランチは命名規則
　(feat/board/xxxxxx)に従うようにしています。
　
　フィートブランチでの作業内容が完了し、問題が無ければ
　master(仮想proj/board)にマージしていく　ということにします。
　基本的にはmaster 以外のブランチは常時1つだけという状態を保つ
　ようにしようと考えています。
　
　作ったフィートブランチはこれまで同様リモートにも同じ名前で
　プッシュし、見えるようにします。
　
　board/comment02以降の新フィートブランチから開始。

■その他
　11/22 README.md にまとめることにしました。
