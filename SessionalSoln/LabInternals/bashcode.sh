#!/usr/bin/sh

#1. write a Shell script to 
   # 1. update friends.txt by adding more records 
        echo ---------------------------------------------------------------------------------------------------------
        echo "Please enter Name, Dob, City, Phonenumber and Hobbies with spaces between each field"
        read NAME DOB CITY PHONE HOBBIES
            if [ $? -eq 0 ] 
                then
                    DATA=$NAME":"$DOB":"$CITY":"$PHONE":"$HOBBIES
                    echo $DATA>>friends.txt
                else 
                    echo "Please enter the data in the given format"
            fi  
            
 
        
        echo ---------------------------------------------------------------------------------------------------------
    #2. delete the "asha" details from the file 
        echo ---------------------------------------------------------------------------------------------------------
        sed  '/asha/d' friends.txt
        echo ---------------------------------------------------------------------------------------------------------

    #3. count total number of records 
        echo ---------------------------------------------------------------------------------------------------------
        awk -F: 'END{print NR-1}' friends.txt # NR-1 is done to remove Header columns
        echo ---------------------------------------------------------------------------------------------------------

    #4. Find out is there any invalid record, if so print the record number
        echo ---------------------------------------------------------------------------------------------------------
        awk -F: '{if(NF!=5) print}' friends.txt
        echo ---------------------------------------------------------------------------------------------------------

    #5. create a mail id for your friends with the following format
        echo ---------------------------------------------------------------------------------------------------------
        awk -F: '{if(NR>1) print $1"@vlsicommunity.com"}' friends.txt 
        echo ---------------------------------------------------------------------------------------------------------

    #Example: Assume your friend name is Asha, generate mail id as - asha@vlsicommunity.com
