#!/bin/bash

# Function to create a compressed image of the SD card
create_image() {
  read -p "Enter the SD card device path (e.g., /dev/sdc): " sd_device

  if [ ! -e "$sd_device" ]; then
    echo "The device $sd_device does not exist. Please check and try again."
    exit 1
  fi

  read -p "Enter the full path where the compressed image will be saved (e.g., /home/user/sdcard.img.gz): " img_path

  # Creating a raw image
  sudo dd if=$sd_device of="$img_path" bs=4M status=progress && sync

  # Shrinking the image with PiShrink and compressing
  wget https://raw.githubusercontent.com/Drewsif/PiShrink/master/pishrink.sh -O pishrink.sh
  chmod +x pishrink.sh
  sudo ./pishrink.sh "$img_path"
  gzip -f "$img_path"
  echo "Image created and compressed successfully."
}

# Function to write an image to an SD card
write_image() {
  read -p "Enter the path of the image to write (e.g., /home/user/sdcard.img.gz): " img_path

  if [ ! -f "$img_path" ]; then
    echo "The file $img_path does not exist. Please check and try again."
    exit 1
  fi

  read -p "Enter the SD card device path (e.g., /dev/sdc): " sd_device

  if [ ! -e "$sd_device" ]; then
    echo "The device $sd_device does not exist. Please check and try again."
    exit 1
  fi

  # Decompressing the image
  gzip -dk "$img_path" && \

  # Writing the image to the SD card
  img_uncompressed_path="${img_path%.*}"
  sudo dd if="$img_uncompressed_path" of="$sd_device" bs=4M status=progress && sync

  echo "Image written to the SD card successfully."
}

# Main menu
echo "What would you like to do?"
echo "1. Create an image of an existing system"
echo "2. Write an image to an SD card"
echo "3. Exit"
read -p "Select an option [1-3]: " action

case $action in
  1)
    create_image
    ;;
  2)
    write_image
    ;;
  3)
    echo "Operation cancelled."
    exit 0
    ;;
  *)
    echo "Invalid option: $action"
    exit 1
    ;;
esac
#!/bin/bash
