# Revshell

## Description

The Revshell tool is a simple bash script that helps users generate reverse shell commands in various programming languages. It can be used for educational purposes, penetration testing, and understanding the mechanics of reverse shells.

## Features

- Supports multiple programming languages (bash, python, perl, nc).
- User-friendly prompt for selecting the language and entering the IP address and port.
- Easy to use and integrate into different environments.

## Prerequisite
Before installing and running Revshell, ensure you have installed the required dependency tools on your system

[ngrok](https://dashboard.ngrok.com/get-started/setup/linux)
 

## Installation

### 1. Clone the repository:
```
git clone https://github.com/cucumber0x1/revshell-tool.git
```

### 2. Navigate to the project directory
```
cd revshell-tool
```

### 3. Give execute permission to the install.sh script
```
chmod +x install.sh
```

### 4. Run the install script
```
./install.sh
```

## Usage

Once the  install script is run you can use tool by the command ```revshell``` or you can find the tool in the app menu

![Screenshot 2024-01-04 205017](https://github.com/cucumber0x1/revshell-tool/assets/66362384/2187a920-d956-4912-a21b-cc41b84f0f2f)

Once you run the tool you will be asked to mention your system's package manager as shown in the attachment below

![2](https://github.com/cucumber0x1/revshell-tool/assets/66362384/1f406bbf-edb3-47e8-9392-5d67617d428a)

This is required for the dependencies to be installed

Once the dependencies are installed the tool will finally be run

### Preview
Choose the language you need and then provide yes or no, if you want to use ngrok for setting up public IP and then provide port you want to setup for public ip from your system.

![Screenshot 2024-01-04 212256](https://github.com/bar3met4l/revshell-tool/assets/66362384/e0e45293-6524-430e-9efa-0268a090f42e)

## Disclaimer
This tool is intended for educational and ethical use only. Use it responsibly and ensure you have the necessary permissions before attempting to access any systems.

## License
The revshell-tool project is licensed under [MIT License](/LICENSE)
