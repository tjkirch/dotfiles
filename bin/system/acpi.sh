#!/bin/sh

set $*

case "$1" in
   button/lid)
      case "$3" in
         close)
            logger "LID closed, suspending and locking..."
	    /usr/local/bin/suspend
            ;;
         open)	logger "LID opened" ;;
         *) logger "ACPI action undefined (LID): $2";;
      esac
      ;;
esac
