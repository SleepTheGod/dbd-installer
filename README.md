dbd - TCP Listener/Connector with Encryption Support

dbd is a lightweight command-line tool that allows you to either listen for incoming TCP connections or connect to remote hosts over TCP. It supports encryption and various other features, making it useful for secure network communications.

Features

Listen for incoming connections: Set up a TCP listener on a specific port.
Connect to remote hosts: Connect to any specified host and port.
Encryption support: Choose between encrypted or unencrypted connections with custom encryption phrases.
Program execution: Automatically run a specified program after a successful connection (e.g., a shell or any command).
Retry connection: Set up automatic reconnection with customizable retry intervals.
Snooping: Optionally monitor network traffic.
Daemonize: Run dbd as a background process.
Verbose mode: Get detailed output for debugging.
Cross-platform: Works on various Unix-like operating systems.
Installation

To install dbd, follow the steps below:

Step 1: Clone the Repository

git clone https://github.com/gitbrew/dbd.git cd dbd

Step 2: Build and Install

If you don't have dbd installed yet, run:

make sudo make install

This will build and install dbd as a system-wide command.

Step 3: Verify Installation

You can check if the installation was successful by running:

dbd -V

This will display the version of dbd if it's installed correctly.

Usage

General Syntax

dbd [-options] host port dbd -l -p port

host: The host IP address or domain to connect to.
port: The TCP port to connect to or listen on.
Help Option

To display the help message, run:

dbd -h

or

dbd --help

Example Commands

Listen for Incoming Connections

To listen on port 12345:

dbd -l -p 12345

Connect to a Remote Host

To connect to a host at IP 192.168.1.100 on port 80:

dbd 192.168.1.100 80

Enable Encryption

To use AES-CBC-128 + HMAC-SHA1 encryption with a custom phrase secret:

dbd -c on -k secret 192.168.1.100 80

Execute a Program After Connecting

To execute bash after connecting:

dbd -e bash 192.168.1.100 80

Enable Reconnection

To retry connecting every 5 seconds:

dbd -r 5 192.168.1.100 80

Run in the Background (Daemonize)

To run dbd in the background:

dbd -D on -l -p 12345

Options

-l: Listen for incoming connections.
-p n: Choose port to listen on or source port to connect out from.
-a address: Choose an address to listen on or connect out from.
-e prog: Program to execute after connecting (e.g., bash, cmd.exe).
-r n: Infinitely reconnect after disconnection with a pause of n seconds.
-c on|off: Enable or disable encryption (default: on).
-k secret: Set custom encryption secret (shared between client and server).
-q: Silent mode (no output).
-v: Enable verbose output.
-n: Use numeric-only IP addresses.
-m: Toggle monitoring/snooping on or off.
-P prefix: Add a prefix to all outbound data.
-H on|off: Highlight incoming data with a hardcoded color escape sequence.
-V: Display version information.
-s: Invoke a shell (if dbd is setuid to root).
-w n: Set an immobility timeout for idle operations.
-D on|off: Fork and run in the background (daemonize).
Contributing

Feel free to fork the repository, make changes, and submit a pull request! Any improvements, bug fixes, or suggestions are welcome.

License

This project is licensed under the GNU General Public License, version 2 (GPL-2.0).

Contact

For any issues or feature requests, please contact Kyle Barnthouse
