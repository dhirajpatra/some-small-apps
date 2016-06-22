<?php

/**
 * This class will process the main application fix at 20th dec.
 */
class For20dec

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
            // take the back up of current vendor_schedule table
            // create back up table first
            $backupSql1 = 'CREATE TABLE ' . $this->_backupVendorSchedule . ' LIKE ' . $this->_vendorSchedule . '';
            $this->_mysqli->query($backupSql1);
            
            // insert all data from current table to back up table
            $backupSql2 = 'INSERT INTO ' . $this->_backupVendorSchedule . ' (SELECT * FROM ' . $this->_vendorSchedule . ')';
            $this->_mysqli->query($backupSql2);
            
            // get all vendors
            $vendorsSql = 'SELECT * FROM ' . $this->_vendor . ' ORDER BY id';
            $vendors = $this->_mysqli->query($vendorsSql);
            
            // loop through all vendors
            foreach ($vendors as $vendor) {
                
                // get the details of specia day data for this vendor
                $vendorSpecialDaysQuery = 'SELECT * FROM ' . $this->_vendorSpeicalDay . ' WHERE vendor_id = ' . $vendor['id'] . '';
                $vendorSpecialDays = $this->_mysqli->query($vendorSpecialDaysQuery);
                
                if (count($vendorSpecialDays) > 0) {
                    // delete the rows for this vendor first
                    $deleteSql = 'DELETE FROM ' . $this->_vendorSchedule . ' WHERE vendor_id = ' . $vendor['id'] . '';
                    $this->_mysqli->query($deleteSql);
                    
                    // loop through all special days of this vendor
                    foreach ($vendorSpecialDays as $vendorSpecialDay) {
                        
                        // day of the week in int
                        $dayOfTheweek = date('w', strtotime($vendorSpecialDay['special_date']));
                        
                        // as day of the week in integer is different in our process than php return for sunday
                        if ($dayOfTheweek == 0) { // only different in sunday
                            
                            $dayOfTheweek = 7; // here day of the week in integer
                        }
                        
                        // check if start hour and stop hour is NULL from special day data
                        if (is_null($vendorSpecialDay['start_hour']) && is_null($vendorSpecialDay['stop_hour'])) {
                            
                            $insertSql = 'INSERT INTO vendor_schedule (vendor_id, weekday, all_day, start_hour, stop_hour) values (' . $vendor['id'] . ', ' . $dayOfTheweek . ', ' . $vendorSpecialDay['all_day'] . ', NULL, NULL)';
                        } else {
                            
                            $insertSql = 'INSERT INTO vendor_schedule (vendor_id, weekday, all_day, start_hour, stop_hour) values (' . $vendor['id'] . ', ' . $dayOfTheweek . ', ' . $vendorSpecialDay['all_day'] . ", '" . $vendorSpecialDay['start_hour'] . "', '" . $vendorSpecialDay['stop_hour'] . "')";
                        }
                        // insert into vendor schedule from special day
                        // echo $insertSql; exit;
                        $this->_mysqli->query($insertSql);
                    } // special day loop end here
                    
                    echo 'Data has been fixed for vendor ' . $vendor['name'] . "\n";
                } // end special day if condition
            } // vendors loop end here
        } catch (Exception $e) {
            echo 'Caught exception: ', $e->getMessage(), "\n";
        }
    }
}
