# power-scheduler
Simple bash GTK utility to schedule a shutdown in Linux systems.

# How to use
Requirements:
- Zenity
- BASH
These are preinstalled with **most** Linux distributions.

To run, simply git clone the repo with `git clone https://github.com/shippus/power-scheduler.git && cd power-scheduler`
Then run with `./gui.sh`.

# Troubleshooting

**Program fails to open**
Make sure the program has permissions to execute with `sudo chmod +x ./gui.sh && sudo chmod +x ./cli.sh` (This will ask you to log in as sudo).

**Program doesn't schedule a shutdown**
Run it as `sudo` with `sudo bash gui.sh`.
