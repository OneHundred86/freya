<?php

require __DIR__.'/global.php';

session_start();

Lib\User\User::add_user([
	'username' => 'freya',
	'password' => md5('freya'),
	'email'    => 'foo@b.ar',
	'group'    => 1,
]);