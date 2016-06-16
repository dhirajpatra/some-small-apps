<?php
/**
 * This will process the main application.
 */

// all parameter from command line or web url
if (PHP_SAPI === 'cli') { // eg. php index.php for20dec
                          // print_r($argv);
    $argument1 = $argv[0];
    $fix = $argv[1];
} elseif (isset($_GET['fix'])) { // eg. index.php?fix=for20dec
    
    $fix = $_GET['fix'];
}

// run the class as per day requirement
if ($fix == 'for20dec') {
    
    // main class
    require_once 'For20dec.php'; 
    
    $for20DecFixObj = new For20dec(); 
    $for20DecFixObj->doTheFix();
} elseif ($fix == 'for28dec') {
    
    // main class
    require_once 'For28dec.php';
    
    $for28DecFixObj = new For28dec();
    $for28DecFixObj->doTheFix();
} else {
    
    echo 'Kindly enter which day fix you want to run';
    exit();
}
