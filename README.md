# MinecraftBEwinBack

The script requires a 64 bit 7-Zip installation on Windows x64.

Within the script, you can configure the Source, Destination and Revision variables for ease of configuration.

This script is meant to run as a Windows Task in the task scheduler.  It supports general file backups based on revisions.

After creating the Basic Task within windows, open the properties of the task.
Under the Triggers tab, click edit button to edit the Triggers settings.  Under the advanced settings at the bottom of the window, you can set up to repeat the task every X minutes or hours and set an overall duration (but you can set indefinitely if you don't want it to stop at any point).
