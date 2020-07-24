#!/bin/sh

# rdiff-backup script
# tjkirch 2012-04-26

# Backs everything up to external drive except paths from /.backup-exclude

# Here's how you would remove backups older than 10 backups ago
## rdiff-backup --remove-older-than 10B ${BACKUP_PATH}

# The backup is just a standard set of files, but here's how you can
# restore everything from 7 days ago for example:
## rdiff-backup --restore-as-of 7D ${BACKUP_PATH} /

BACKUP_DEVICE="/dev/backup"
BACKUP_MOUNT="/mnt/backup"
BACKUP_MOUNT_OPTIONS="-t ntfs"
BACKUP_PATH="/mnt/backup/linux"
BACKUP_EXCLUSIONS="/.backup-exclude"

# Check for errors
if [ "${USER}" != "root" ]; then
   echo "Must run as root."
   exit 1
elif [ ! -b "${BACKUP_DEVICE}" ]; then
   echo "Invalid backup device: ${BACKUP_DEVICE}"
   exit 1
elif [ ! -r "${BACKUP_EXCLUSIONS}" ]; then
   echo "Invalid exclusion file: ${BACKUP_EXCLUSIONS}"
   exit 1
fi

# Mount backup device if it isn't already
if ! grep -Fq "${BACKUP_MOUNT}" /proc/mounts >/dev/null 2>&1; then
   mount ${BACKUP_MOUNT_OPTIONS} ${BACKUP_DEVICE} ${BACKUP_MOUNT}
   if [ ${?} -ne 0 ]; then
      echo "Failed to mount ${BACKUP_DEVICE} at ${BACKUP_MOUNT}"
      exit 1
   fi
   udevadm settle --quiet --exit-if-exists=${BACKUP_DEVICE}
   MOUNTED=1
fi

# Make sure backup directory exists
if [ ! -d "${BACKUP_PATH}" ]; then
   mkdir -p "${BACKUP_PATH}"
fi

# Do the work
rdiff-backup \
   --exclude-globbing-filelist ${BACKUP_EXCLUSIONS} \
   --exclude-device-files \
   --exclude "/proc/*" --exclude "/sys/*" --exclude "/tmp/*" \
   --exclude ${BACKUP_PATH} \
   --print-statistics \
   / ${BACKUP_PATH}

if [ -n "${MOUNTED}" ]; then
   umount ${BACKUP_MOUNT}
fi
