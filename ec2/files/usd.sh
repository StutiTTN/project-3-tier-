#!/bin/bash
apt-get update
apt-get install -y nginx
systemctl stop nginx
apt-get install -y mysql-client
apt-get install -y php7.4 php7.4-gd php7.4-mysql php7.4-zip php7.4-fpm
systemctl restart php7.4-fpm
wget -P /home/ubuntu/ https://wordpress.org/latest.tar.gz
tar -xzf /home/ubuntu/latest.tar.gz -C /var/www/
chown -R www-data:www-data /var/www/wordpress
unlink /etc/nginx/sites-enabled/default
rm -rf /etc/nginx/sites-enabled/default
echo -e 'server {
    listen 80 default_server;
    listen [::]:80 default_server;
    root /var/www/wordpress;
    index index.php index.html index.htm index.nginx-debian.html;
    server_name _;
    location = /favicon.ico { 
        log_not_found off; 
        access_log off; 
    }
    location = /robots.txt { 
        log_not_found off; 
        access_log off; 
        allow all; 
    }
    location ~* \.(css|gif|ico|jpeg|jpg|js|png)$ {
        expires max;
        log_not_found off;
    }
    location / {
        # First attempt to serve request as file, then
        # as directory, then fall back to displaying a 404.
        try_files $uri $uri/ /index.php$is_args$args;
    }
    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php7.4-fpm.sock;
    }
}' > /etc/nginx/sites-available/wp-app.conf
link /etc/nginx/sites-available/wp-app.conf /etc/nginx/sites-enabled/default
echo -e '<?php
define( "DB_NAME", "wordpress" );
define( "DB_USER", "admin" );
define( "DB_PASSWORD", "wordpressadmin" );
define( "DB_HOST", "replaceme" );
define( "DB_CHARSET", "utf8" );
define( "DB_COLLATE", "" );

define("AUTH_KEY",         "VAm33fx+ 7f+8OTe++{<,Js,~(2jFHtVGVJbaoM-IGuv2iL$8%`c]e=tGb|6{l+J");
define("SECURE_AUTH_KEY",  "*|F&{0|tP4f}D5eR~CIi{*6umsxjj+,;ag!wQ|)%O,jX~I7fh R|;|c,S?ykSRA(");
define("LOGGED_IN_KEY",    "jw[6Awj<C|VE`04zJbWev5rG@pD&i+? h#Hjx;m7C9[}t&4QqGJ?,af{~m6/DuqV");
define("NONCE_KEY",        "Ggf[MY~6DK2N n|D;{y7kQ:I,o_ib-N1<}KH}yF1P7|X-xL)(ls0u5AdKlWt`U&6");
define("AUTH_SALT",        "~35!weB3-1(k3VYz,*|8KrV59:6n4[IXfqlBD9oA0v{9d|-zE-6^!Mnqqrt~3?1m");
define("SECURE_AUTH_SALT", "~InU#<&JR&5VJ!_K]%pj?GB+Fg:4]oa[=+oqoeV?$;cMXQb.3V%S PIX+qLVQa");
define("LOGGED_IN_SALT",   "1!XHsqZm+4q5ld~HfN568e;K{w?C){0.%LG@-W4[I}2ag>(u9&S}/p!3%f4%#7");
define("NONCE_SALT",       "S/2[>A-MB_NcR`hdjf%^|s!SG-?&h*_I6[>L[Zb9i/-&<9rhB>aTlK[d8M9in$");
$table_prefix = "wp_";
define( "WP_DEBUG", false );
if ( ! defined( "ABSPATH" ) ) {
        define( "ABSPATH", __DIR__ . "/" );
}
require_once ABSPATH . "wp-settings.php";' > /var/www/wordpress/wp-config.php
sed -i "s/replaceme/${endpoint}/" /var/www/wordpress/wp-config.php
systemctl start nginx
systemctl restart nginx
systemctl reload nginx