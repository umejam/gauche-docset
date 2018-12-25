[Gauche](http://practical-scheme.net/gauche/index-j.html)のリファレンスマニュアルを, [dashing](https://github.com/technosophos/dashing)を使って[Dash](https://kapeli.com/dash)のDocsetに変換。

1.  GaucheリファレンスマニュアルのHTML版を入手

    ソースパッケージからは以下で生成できる

        $ make -C doc htmls

2. 生成されたHTMLファイルをコピー

3. DocSetを生成

        $ dashing build gauche
