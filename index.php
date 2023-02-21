<?php
spl_autoload_register();

use App\Controller\Controller;

$controller = new Controller();
$controller->route();

?>