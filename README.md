# php53-src-install

普段PHP7使ってるけど、昔作ったPHPコードなどは5.3以下じゃないと動かない事があり…

PHP5.3.29をインストール後、


/usr/local/lib/php-5.3.29/bin/php-cgi53 を /var/www/cgi-bin/php53.cgi にコピーする。（シンボリックリンクはダメ）

.htaccessに以下を追記

''
Action php53-script /cgi-bin/php53.cgi

AddHandler php53-script .php
''
