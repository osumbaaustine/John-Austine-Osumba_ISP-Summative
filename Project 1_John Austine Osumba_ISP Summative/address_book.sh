#!/bin/bash

# Address Book in Bash Shell Script
# Author: Ausine Osumba 

# Function to Create New Contact Entry
new_contact(){
    echo "CREATE NEW CONTACT"
    echo "******************"
    # User Input for Contact Name
    echo "Enter Contact Name: "
    read contact_name
    # User Input for Contact Phone Number
    echo "Enter Contact Phone Number"
    read phone_number
    # User Input for Contact Email Address
    echo "Enter Contact Email Address"
    read email_address
    echo " "
    echo "Contact Information Added"
    echo "Name: $contact_name"
    echo "Phone Number: $phone_number"
    echo "Email Address: $email_address"
    # Adding the Contact Information to the address_book Text file
    echo "$contact_name --> $phone_number --> $email_address"  >> address_book.txt
    echo " "
    # Print success message
    echo "Contact Saved Successfully!"
}

# Function to View Contact Entries in the record
view_contacts(){
    echo "VIEW CONTACTS"
    echo "*************"
    echo " "
    # cat command to print out address book contents
    cat address_book.txt
}

# Function to Edit Contacts in the record
edit_contact(){
    echo "EDIT CONTACTS"
    echo "*************"
    # cat command to list address book contents for users to view before editing
    cat address_book.txt
    echo " "
    # Then search for the Item to be edited
    echo "Enter Old Text to Edit"
    read user_input
    # Search if user input exists in the address book 
    grep -i $user_input address_book.txt

    # If search status is equal to 1
    if [ `echo $?` -eq 1]
        # then Return Error Message
        then echo "The query --> \"$user_input\" is not on this address book!"
    else
        # Prompt user for number of line to edit in the address block 
        echo "Enter Line Number to Edit: "
        read line_to_edit
        echo
            # Loop through the address book line by line
			for line in `grep -n "$user_input" address_book.txt`
			do
                # Setting line number to hold contents from each line for editing
                # Using cut command to isolate the columns one at a time
				line_number=`echo "$line" | cut -c1`
                # If line to be changed is equal to line number...
				if [ $line_number -eq $line_to_edit ]
					then
                    # Start Edit process
					echo "Edit Contact Information: "
                    echo "FORMAT [Contact Name --> Phone Number --> Email Address]"0
					read new_edit
					lineChange="${line_to_edit}s"
                    # Using sed command to perform find & replace
					sed -i -e "$lineChange/.*/$new_edit/" address_book.txt
					echo
					echo "Edit Made Successfully."
				fi
			done
    fi
}

# Function to Search for Contacts in the record
search_contact(){
    echo "SEARCH CONTACT"
    echo "**************"
    echo " "
    # Prompt user input for what to search for
    echo "Enter Contact Name to Search"
    read search_name
    # Command to search for input from address book
    grep -i $search_name address_book.txt
    
}

# Function to Search for Contacts in the record
delete_contact(){
    echo "DELETE CONTACT"
    echo "**************"
    echo " "
    # Prompt user input for what to delete
    echo "Enter Contact to Delete(Case-Sensitive)"
    read contact_to_delete
    # command to delete contact information
    sed -i -e "/$contact_to_delete/d" address_book.txt
    echo "Deletion Successful!"
}

while :
do
clear
# Welcome Menu + Instructions
echo "*****WELCOME TO THE ADDRESS BOOK*****"
echo "             *****MENU*****"
echo "1. Create New Contact"
echo "2. View Contacts"
echo "3. Edit Contact"
echo "4. Search Contacts"
echo "5. Delete Contact"
echo "6. Exit Address Book"

echo "Pick an Option Above - Enter Option Number"
read userOption

# Handles user input by calling appropriate functions
case $userOption in
# 1 for Adding Contact
1) new_contact ;;

# 2 for Viewing Contacts
2) view_contacts ;;

# 3 for Editing Contacts
3) edit_contact ;;

# 4 To Search Contacts
4) search_contact ;;

# 5 to Delete Contacts
5) delete_contact ;;

6) break ;;
*) echo "INVALID OPTION! TRY AGAIN";;
esac;

echo "Press 6 to Quit" 
read confirm_exit

if [$confirm_exit -eq 6]
then break
fi
done