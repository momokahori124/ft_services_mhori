#!/bin/sh

wp core download --locale=ja

wp config create \
--dbname=wpdb \
--dbuser=admin \
--dbpass=admin \
--dbhost=mysql:3306

wp core install \
--url=https://192.168.49.50:5050 \
--title=ft_services \
--admin_user=admin \
--admin_password=admin \
--admin_email=admin@a.com

wp theme activate twentytwenty

# タイムゾーンと日時表記
wp option update timezone_string 'Asia/Tokyo' --allow-root
wp option update date_format 'Y-m-d' --allow-root
wp option update time_format 'H:i' --allow-root

# ユーザー追加
wp user create mhori mhori@a.com \
--role=author \
--user_pass=mhori
wp user create  ahori@a.com \
--role=author \
--user_pass=ahori

telegraf --config /etc/telegraf.conf &

php-fpm7

nginx

sleep infinity