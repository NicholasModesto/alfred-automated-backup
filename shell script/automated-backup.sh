# MOUNT SERVER
	osascript -e 'tell app "Finder" to open location "smb://$USER:$PASS@$SERVER"'

# DEFINE ACTIVE PROJECT VARIABLES
	A_LOG="PATH-TO-A-LOG-DIRECTORY/ACTIVE_SYNC_LOG.txt"
	A_SOURCE="SOURCE-DIRECTORY"
	A_TARGET="REMOTE-TARGET-DIRECTORY"

# DEFINE COMPLETED PROJECT VARIABLES
	C_LOG="PATH-TO-A-LOG-DIRECTORY/COMPLETED_SYNC_LOG.txt"
	C_SOURCE="SOURCE-DIRECTORY"
	C_TARGET="REMOTE-TARGET-DIRECTORY"

# SYNC ACTIVE PROJECTS
	# APPEND A TIMESTAMP HEADER TO THE LOG
	echo -e " \n \n============================ " >> "$A_LOG"
	echo -e " %Backup Started " >> "$A_LOG"
	date +"%R :: %D" >> "$A_LOG"
	echo -e "============================ " >> "$A_LOG"
	
	# SYNC FILES & APPEND LOG
	rsync -va --delete "$A_SOURCE" "$A_TARGET" >> "$A_LOG"


# SYNC COMPLETED PROJECTS
	# APPEND A TIMESTAMP HEADER TO THE LOG
	echo -e " \n============================ " >> "$C_LOG"
	echo -e " %Backup Started " >> "$C_LOG"
	date +"%R :: %D" >> "$C_LOG"
	echo -e "============================ " >> "$C_LOG"
	
	# SYNC FILES & APPEND LOG
	rsync -va --delete "$C_SOURCE" "$C_TARGET" >> "$C_LOG"

# SYSTEM ALERT
#	osascript -e 'tell app "System Events" to display dialog "Backup Complete"'