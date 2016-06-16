<?php

/**
 * This class will process the main application fix at 28th dec.
 */
class For28dec

{

    private $_db;

    private $_mysqli;

    private $_vendorSchedule = 'vendor_schedule';

    private $_vendor = 'vendor';

    private $_vendorSpeicalDay = 'vendor_special_day';

    private $_backupVendorSchedule = 'backup_vendor_schedule';

    /**
     * constructor to create db instances with connection.
     */
    public function __construct()
    
    {
        // db connection class
        require_once 'Database.php';
        
        $this->_db = Database::getInstance();
        
        $this->_mysqli = $this->_db->getConnection();
    }

    /**
     * This method will fix the issue or bug.
     */
    public final function doTheFix()
    
    {
        try {
            // truncate the current vendor_schedule table
            $truncateSql = 'TRUNCATE TABLE ' . $this->_vendorSchedule . '';
            $this->_mysqli->query($truncateSql);
            
            // restore from old backup
            $backupSql = 'INSERT INTO ' . $this->_vendorSchedule . ' (SELECT * FROM ' . $this->_backupVendorSchedule . ')';
            $this->_mysqli->query($backupSql);
            
            if ($this->_mysqli->affected_rows > 0) {
                
                echo 'Restoration done' . "\n";
                exit();
            }
        } catch (Exception $e) {
            echo 'Caught exception: ', $e->getMessage(), "\n";
        }
    }
}
