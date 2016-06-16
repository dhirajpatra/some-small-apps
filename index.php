<?php
/**
 * This will process the main application.
 */
require_once 'For20dec.php';
require_once 'For28dec.php';

// all parameter from command line or web url 
if (PHP_SAPI === 'cli') { // eg. php index.php for20dec
    //print_r($argv);
    $argument1 = $argv[0];
    $fix = $argv[1];
} else { // eg. index.php?fix=for20dec

    $fix = $_GET['fix'];
}

if ($fix == 'for20dec') {
    $for20DecFixObj = new For20dec();
    $for20DecFixObj->doTheFix();
} elseif ($fix == 'for28dec') {
    $for28DecFixObj = new For28dec();
    $for28DecFixObj->doTheFix();
} else {
    echo 'Kindly enter which day fix you want to run';
    exit;
}
