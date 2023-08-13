#Header

For Raspberry Pi OS, enable the I2C driver as follows:
```
Run sudo raspi-config
```
 Interfacing Options -> Enable I2C -> Save that and reboot

After rebooting re-check that the `dmesg | grep i2c` command shows whether I2C driver is loaded before proceeding. You can also enable I2C manually if the raspi-config utility is not available.

Optionally, to improve performance, increase the I2C baudrate from the default of 100KHz to 400KHz by altering `/boot/config.txt` to include:

`dtparam=i2c_arm=on,i2c_baudrate=400000`
Then reboot.

Next, add your user to the i2c group and install i2c-tools:
`sudo usermod -a -G i2c pi`
`sudo apt-get install i2c-tools`

Check to see if it works
`i2cdetect -y 1`

Check that the device is communicating properly (if using a rev.1 board, use 0 for the bus, not 1) and determine its address using i2cdetect:
Should be something similar to this:
```
$ i2cdetect -y 1
       0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
  00:          -- -- -- -- -- -- -- -- -- -- -- -- --
  10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
  20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
  30: -- -- -- -- -- -- -- -- -- -- -- -- 3c -- -- --
  40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
  50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
  60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
  70: -- -- -- -- -- -- -- --
```
Enabling The SPI Interface:
`sudo raspi-config`
Interfacing Options - Enable SPI -> Save that and reboot


Ensure that the SPI kernel driver is enabled:
Check to see if it works
`lsmod | grep spi`

Then add your user to the spi and gpio groups:
`sudo usermod -a -G spi,gpio pi`
Log out and back in again to ensure that the group permissions are applied successfully.

#Now that we have all those done.

