<?php

spl_autoload_register();

use Modules\Forum\Message;
use Modules\Chat\Message as MessageChat;

$messageForum = new Message();

$messageChat = new MessageChat();