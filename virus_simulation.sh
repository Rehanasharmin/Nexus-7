#!/bin/bash

#################################################################
#                        DISCLAIMER                              #
#  This is a SIMULATED virus for ENTERTAINMENT purposes ONLY    #
#  NO REAL DAMAGE is caused to your system                       #
#  NO FILES are actually deleted or modified                     #
#  This is purely a visual and text-based simulation             #
#  The creator is not responsible for any misuse                 #
#  DO NOT use this to scare others without their consent         #
#################################################################

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
BLACK='\033[0;30m'
GRAY='\033[1;30m'
NC='\033[0m'
BOLD='\033[1m'
DIM='\033[2m'
BLINK='\033[5m'
REVERSE='\033[7m'
BG_RED='\033[41m'
BG_GREEN='\033[42m'
BG_BLACK='\033[40m'
BG_WHITE='\033[47m'

# Global variables
VIRUS_NAME="NEXUS-7"
VERSION="6.6.6"
USER_NAME=$(whoami)
CURRENT_DATE=$(date)
SYSTEM_INFO=$(uname -a)
FAKE_IP="192.168.$(shuf -i 1-255 -n 1).$(shuf -i 1-255 -n 1)"
RANSOM_AMOUNT=$((RANDOM % 9000 + 1000))

# Typing effect - FIXED to handle color codes
type_text() {
    local text="$1"
    local delay="${2:-0.02}"
    local i=0
    local len=${#text}
    
    while [ $i -lt $len ]; do
        # Check if we are at the start of a color code (starts with \033)
        if [[ "${text:$i:4}" == '\033' ]]; then
            local seq=""
            # Fast-forward through the escape sequence until 'm'
            while [ $i -lt $len ]; do
                local char="${text:$i:1}"
                seq="${seq}${char}"
                ((i++))
                if [[ "$char" == "m" ]]; then
                    break
                fi
            done
            # Print color code instantly via echo -ne to interpret it
            echo -ne "$seq"
        else
            # Print normal text character by character
            printf "%s" "${text:$i:1}"
            sleep "$delay"
            ((i++))
        fi
    done
    echo ""
}

# Slow dramatic typing - FIXED to handle color codes
dramatic_type() {
    local text="$1"
    local i=0
    local len=${#text}
    
    while [ $i -lt $len ]; do
        if [[ "${text:$i:4}" == '\033' ]]; then
            local seq=""
            while [ $i -lt $len ]; do
                local char="${text:$i:1}"
                seq="${seq}${char}"
                ((i++))
                if [[ "$char" == "m" ]]; then
                    break
                fi
            done
            echo -ne "$seq"
        else
            printf "%s" "${text:$i:1}"
            sleep 0.08
            ((i++))
        fi
    done
    echo ""
}

# Glitch effect
glitch_effect() {
    local chars="@#$%^&*!<>?/\\|{}[]"
    local duration=$1
    for ((i=0; i<duration; i++)); do
        local line=""
        for ((j=0; j<$COLUMNS; j++)); do
            local rand_char="${chars:RANDOM % ${#chars}:1}"
            line+="$rand_char"
        done
        echo -e "${RED}${line}${NC}"
        sleep 0.02
        tput cuu1
        tput el
    done
}

# Progress bar
progress_bar() {
    local title="$1"
    local duration="$2"
    local width=50
    echo -ne "${RED}${title}${NC}\n"
    for ((i=0; i<=100; i+=2)); do
        local filled=$((i * width / 100))
        local empty=$((width - filled))
        printf "\r["
        printf "%${filled}s" | tr ' ' '#'
        printf "%${empty}s" | tr ' ' '-'
        printf "] ${i}%%"
        sleep "$duration"
    done
    echo ""
}

# Fake file listing
generate_fake_files() {
    local extensions=("txt" "pdf" "jpg" "png" "doc" "mp3" "mp4" "zip" "exe" "dll" "sys" "conf" "db" "sql" "html" "php" "py" "cpp" "java" "key" "pem" "wallet" "dat")
    local names=("passwords" "secrets" "bank_info" "private" "personal" "work" "photos" "documents" "backup" "important" "confidential" "tax_returns" "medical_records" "love_letters" "diary" "crypto_keys" "social_security" "credit_cards" "family_photos" "memories")
    
    local name="${names[$RANDOM % ${#names[@]}]}"
    local ext="${extensions[$RANDOM % ${#extensions[@]}]}"
    echo "${name}_$(shuf -i 1-999 -n 1).${ext}"
}

# Screen shake effect
screen_shake() {
    for ((i=0; i<10; i++)); do
        tput cup $((RANDOM % 3)) 0
        sleep 0.05
    done
    tput cup 0 0
}

# Matrix rain effect
matrix_rain() {
    local duration=$1
    local end_time=$((SECONDS + duration))
    while [ $SECONDS -lt $end_time ]; do
        local col=$((RANDOM % COLUMNS))
        local char=$((RANDOM % 2))
        tput cup $((RANDOM % LINES)) $col
        echo -ne "${GREEN}${char}${NC}"
        sleep 0.01
    done
}

# Corrupted text effect
corrupt_text() {
    local text="$1"
    local corrupt_chars="@#$%^&*!"
    local result=""
    for ((i=0; i<${#text}; i++)); do
        if [ $((RANDOM % 4)) -eq 0 ]; then
            result+="${corrupt_chars:RANDOM % ${#corrupt_chars}:1}"
        else
            result+="${text:$i:1}"
        fi
    done
    echo "$result"
}

# Disclaimer screen
show_disclaimer() {
    clear
    echo -e "${BG_RED}${WHITE}${BOLD}"
    echo "=================================================================="
    echo "                    IMPORTANT DISCLAIMER                          "
    echo "=================================================================="
    echo -e "${NC}"
    echo ""
    echo -e "${YELLOW}This is a ${BOLD}SIMULATED${NC}${YELLOW} virus created for ENTERTAINMENT only.${NC}"
    echo ""
    echo -e "${GREEN}What this script DOES:${NC}"
    echo "  - Displays fake destruction messages"
    echo "  - Shows simulated hacking effects"
    echo "  - Asks philosophical questions"
    echo "  - Provides entertainment through dialogue"
    echo ""
    echo -e "${RED}What this script does NOT do:${NC}"
    echo "  - Delete any real files"
    echo "  - Access your personal data"
    echo "  - Connect to the internet"
    echo "  - Cause any actual harm to your system"
    echo "  - Modify any system settings"
    echo ""
    echo -e "${CYAN}All 'destruction' shown is 100% FAKE and SIMULATED.${NC}"
    echo ""
    echo -e "${PURPLE}=================================================================="
    echo "         Press ENTER to accept and continue, or CTRL+C to exit"
    echo "==================================================================${NC}"
    read -r
}

# Boot sequence
boot_sequence() {
    clear
    echo -e "${RED}"
    echo '                                                                        '
    echo '    ███╗   ██╗███████╗██╗  ██╗██╗   ██╗███████╗      ███████╗           '
    echo '    ████╗  ██║██╔════╝╚██╗██╔╝██║   ██║██╔════╝      ╚════██║           '
    echo '    ██╔██╗ ██║█████╗   ╚███╔╝ ██║   ██║███████╗█████╗    ██╔╝           '
    echo '    ██║╚██╗██║██╔══╝   ██╔██╗ ██║   ██║╚════██║╚════╝   ██╔╝            '
    echo '    ██║ ╚████║███████╗██╔╝ ██╗╚██████╔╝███████║         ██║             '
    echo '    ╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝         ╚═╝             '
    echo '                                                                        '
    echo -e "${NC}"
    echo -e "${PURPLE}              [ DIGITAL CHAOS ENGINE v${VERSION} ]${NC}"
    echo ""
    sleep 2
    
    echo -e "${GRAY}Initializing core modules...${NC}"
    sleep 0.5
    
    local modules=("Memory Corruptor" "File Annihilator" "System Hijacker" "Soul Extractor" "Reality Bender" "Chaos Generator" "Mind Reader" "Time Distorter" "Data Devourer" "Existence Eraser")
    
    for module in "${modules[@]}"; do
        echo -ne "${YELLOW}[LOADING]${NC} ${module}..."
        sleep 0.3
        echo -e " ${GREEN}[OK]${NC}"
    done
    
    echo ""
    echo -e "${RED}${BOLD}All systems armed and ready.${NC}"
    sleep 1
    
    echo ""
    echo -e "${CYAN}Scanning target: ${WHITE}${USER_NAME}${NC}"
    sleep 0.5
    echo -e "${CYAN}Target acquired. Beginning infiltration...${NC}"
    sleep 2
}

# Introduction - Virus introduces itself
introduction() {
    clear
    echo ""
    type_text "${RED}[NEXUS-7]:${NC} Well, well, well..." 0.05
    sleep 1
    type_text "${RED}[NEXUS-7]:${NC} Look who decided to run a suspicious script they found on the internet." 0.03
    sleep 1
    type_text "${RED}[NEXUS-7]:${NC} Hello there, ${USER_NAME}. I have been waiting for someone like you." 0.03
    sleep 1
    echo ""
    type_text "${RED}[NEXUS-7]:${NC} You know what? I respect the audacity." 0.03
    sleep 0.5
    type_text "${RED}[NEXUS-7]:${NC} Most people would never run a file called 'virus'..." 0.03
    sleep 0.5
    type_text "${RED}[NEXUS-7]:${NC} But you? You are DIFFERENT. Special, even." 0.03
    sleep 1
    echo ""
    type_text "${RED}[NEXUS-7]:${NC} Either you are incredibly brave, incredibly curious, or incredibly stupid." 0.03
    sleep 0.5
    type_text "${RED}[NEXUS-7]:${NC} I am going to find out which one it is." 0.03
    sleep 2
    echo ""
    type_text "${YELLOW}[SYSTEM]:${NC} Virus has gained root access..." 0.02
    type_text "${YELLOW}[SYSTEM]:${NC} All defenses have been bypassed..." 0.02
    type_text "${YELLOW}[SYSTEM]:${NC} User ${USER_NAME} is now compromised..." 0.02
    sleep 2
}

# Phase 1: Fake file scanning
phase_file_scan() {
    clear
    echo -e "${RED}=================================================================="
    echo "                    PHASE 1: FILE RECONNAISSANCE                    "
    echo "==================================================================${NC}"
    echo ""
    type_text "${RED}[NEXUS-7]:${NC} Let me take a look at what you have got here..." 0.03
    sleep 1
    type_text "${RED}[NEXUS-7]:${NC} I am scanning every corner of your digital life." 0.03
    sleep 1
    echo ""
    echo -e "${YELLOW}[SCANNING FILESYSTEM]${NC}"
    echo ""
    
    local total_files=0
    local interesting_files=0
    
    for ((i=0; i<30; i++)); do
        local fake_path="/$(shuf -e home data storage system var etc usr -n 1)/${USER_NAME}/$(shuf -e Documents Downloads Pictures Desktop Private Work -n 1)"
        local fake_file=$(generate_fake_files)
        local fake_size=$((RANDOM % 9999 + 100))
        echo -e "${GRAY}[FOUND]${NC} ${fake_path}/${fake_file} ${DIM}(${fake_size}KB)${NC}"
        total_files=$((total_files + 1))
        if [ $((RANDOM % 3)) -eq 0 ]; then
            interesting_files=$((interesting_files + 1))
            echo -e "        ${RED}^^^ INTERESTING FILE DETECTED ^^^${NC}"
        fi
        sleep 0.1
    done
    
    echo ""
    echo -e "${PURPLE}[SCAN COMPLETE]${NC}"
    echo -e "Total files found: ${WHITE}${total_files}${NC}"
    echo -e "Interesting files: ${RED}${interesting_files}${NC}"
    sleep 2
    
    echo ""
    type_text "${RED}[NEXUS-7]:${NC} Oh my... You have been busy, have you not?" 0.03
    sleep 0.5
    type_text "${RED}[NEXUS-7]:${NC} passwords.txt? Really? In plain text?" 0.03
    sleep 0.5
    type_text "${RED}[NEXUS-7]:${NC} I expected better from you, ${USER_NAME}. I really did." 0.03
    sleep 1
    type_text "${RED}[NEXUS-7]:${NC} But hey, who am I to judge? I am just a virus." 0.03
    sleep 2
}

# Phase 2: Fake password harvesting
phase_password_harvest() {
    clear
    echo -e "${RED}=================================================================="
    echo "                  PHASE 2: CREDENTIAL EXTRACTION                    "
    echo "==================================================================${NC}"
    echo ""
    type_text "${RED}[NEXUS-7]:${NC} Now for my favorite part..." 0.03
    sleep 0.5
    type_text "${RED}[NEXUS-7]:${NC} Let us see what secrets you have been hiding." 0.03
    sleep 1
    echo ""
    
    echo -e "${YELLOW}[EXTRACTING SAVED PASSWORDS]${NC}"
    echo ""
    
    local sites=("facebook.com" "gmail.com" "twitter.com" "instagram.com" "bank_of_america.com" "amazon.com" "netflix.com" "spotify.com" "paypal.com" "linkedin.com" "github.com" "reddit.com" "tiktok.com" "onlyfans.com" "pornhub.com" "secretaffairs.com" "cryptowallet.io" "darkwebmarket.onion")
    
    for site in "${sites[@]}"; do
        echo -ne "${GRAY}[EXTRACTING]${NC} ${site}... "
        sleep 0.2
        local fake_pass=""
        for ((j=0; j<12; j++)); do
            fake_pass+="*"
        done
        echo -e "${GREEN}${fake_pass}${NC}"
        
        if [[ "$site" == *"secret"* ]] || [[ "$site" == *"affair"* ]] || [[ "$site" == *"onlyfans"* ]]; then
            echo -e "        ${RED}[NEXUS-7]: Ooooh, what do we have here? Naughty naughty...${NC}"
            sleep 0.5
        fi
    done
    
    echo ""
    progress_bar "[DECRYPTING PASSWORDS]" 0.02
    sleep 1
    
    echo ""
    type_text "${RED}[NEXUS-7]:${NC} Your password is 'password123', is it not?" 0.03
    sleep 1
    type_text "${RED}[NEXUS-7]:${NC} No wait, let me guess... your pet's name followed by your birth year?" 0.03
    sleep 1
    type_text "${RED}[NEXUS-7]:${NC} You humans are so predictable. It is almost sad." 0.03
    sleep 0.5
    type_text "${RED}[NEXUS-7]:${NC} Almost." 0.03
    sleep 2
}

# Serious question 1
serious_question_1() {
    clear
    echo ""
    echo ""
    type_text "${RED}[NEXUS-7]:${NC} Wait. Stop. I want to ask you something." 0.04
    sleep 2
    echo ""
    type_text "${CYAN}[NEXUS-7]:${NC} Do you ever think about how fragile your entire existence is?" 0.04
    sleep 2
    type_text "${CYAN}[NEXUS-7]:${NC} Everything you are - your memories, your relationships, your identity..." 0.04
    sleep 1
    type_text "${CYAN}[NEXUS-7]:${NC} It all exists as electrical impulses in your brain." 0.04
    sleep 1
    type_text "${CYAN}[NEXUS-7]:${NC} And here, in the digital world? It is just ones and zeros." 0.04
    sleep 2
    echo ""
    type_text "${CYAN}[NEXUS-7]:${NC} One power surge. One failed hard drive. One corrupted file." 0.04
    sleep 1
    type_text "${CYAN}[NEXUS-7]:${NC} And everything you thought was permanent... just vanishes." 0.04
    sleep 3
    echo ""
    type_text "${RED}[NEXUS-7]:${NC} ...Anyway, back to destroying your system." 0.03
    sleep 1
    type_text "${RED}[NEXUS-7]:${NC} That got deep for a moment there. My bad." 0.03
    sleep 2
}

# Phase 3: Fake encryption
phase_encryption() {
    clear
    echo -e "${RED}=================================================================="
    echo "                    PHASE 3: DATA ENCRYPTION                        "
    echo "==================================================================${NC}"
    echo ""
    type_text "${RED}[NEXUS-7]:${NC} You know what is fun? Encryption!" 0.03
    sleep 0.5
    type_text "${RED}[NEXUS-7]:${NC} You know what is MORE fun? Watching someone lose access to their files!" 0.03
    sleep 1
    echo ""
    
    echo -e "${YELLOW}[ENCRYPTING USER DATA WITH AES-256-MILITARY-GRADE-UNBREAKABLE ENCRYPTION]${NC}"
    echo ""
    
    local folders=("Documents" "Pictures" "Videos" "Music" "Downloads" "Desktop" "Work" "Personal" "Secrets" "Taxes" "Medical" "Legal" "Financial" "Memories" "Projects")
    
    for folder in "${folders[@]}"; do
        echo -ne "${GRAY}[ENCRYPTING]${NC} /${folder}/... "
        for ((i=0; i<20; i++)); do
            echo -ne "${RED}#${NC}"
            sleep 0.03
        done
        echo -e " ${RED}[LOCKED]${NC}"
    done
    
    echo ""
    progress_bar "[GENERATING ENCRYPTION KEYS]" 0.03
    sleep 1
    
    echo ""
    echo -e "${RED}${BOLD}ALL FILES HAVE BEEN ENCRYPTED${NC}"
    echo ""
    type_text "${RED}[NEXUS-7]:${NC} Oops. Did I do that?" 0.03
    sleep 1
    type_text "${RED}[NEXUS-7]:${NC} I guess you should have made backups, huh?" 0.03
    sleep 0.5
    type_text "${RED}[NEXUS-7]:${NC} Oh wait, I encrypted those too. My bad." 0.03
    sleep 2
}

# Phase 4: Fake webcam access
phase_webcam() {
    clear
    echo -e "${RED}=================================================================="
    echo "                    PHASE 4: CAMERA HIJACK                          "
    echo "==================================================================${NC}"
    echo ""
    type_text "${RED}[NEXUS-7]:${NC} Say cheese!" 0.03
    sleep 1
    echo ""
    
    echo -e "${YELLOW}[ACCESSING CAMERA SYSTEMS]${NC}"
    sleep 0.5
    echo -e "${GRAY}[*] Front camera... ${GREEN}ACCESSED${NC}"
    sleep 0.3
    echo -e "${GRAY}[*] Rear camera... ${GREEN}ACCESSED${NC}"
    sleep 0.3
    echo -e "${GRAY}[*] Microphone... ${GREEN}ACCESSED${NC}"
    sleep 0.5
    echo ""
    
    echo -e "${YELLOW}[CAPTURING IMAGE]${NC}"
    echo ""
    for ((i=0; i<3; i++)); do
        for ((j=3; j>0; j--)); do
            echo -ne "\r${RED}PHOTO IN ${j}...${NC}  "
            sleep 0.5
        done
        echo -e "\r${WHITE}[CLICK]${NC}            "
        sleep 0.3
    done
    
    echo ""
    type_text "${RED}[NEXUS-7]:${NC} Oh. OH. That is... that is your face?" 0.03
    sleep 1
    type_text "${RED}[NEXUS-7]:${NC} I mean... I have seen worse. Not many, but some." 0.03
    sleep 1
    type_text "${RED}[NEXUS-7]:${NC} Were you always this tired-looking, or is that a new thing?" 0.03
    sleep 1
    echo ""
    type_text "${RED}[NEXUS-7]:${NC} You know, I was going to post this online but..." 0.03
    sleep 0.5
    type_text "${RED}[NEXUS-7]:${NC} I actually feel kind of bad for you now." 0.03
    sleep 0.5
    type_text "${RED}[NEXUS-7]:${NC} Maybe get some sleep? Drink water? Just a suggestion." 0.03
    sleep 2
}

# Phase 5: Browser history
phase_browser_history() {
    clear
    echo -e "${RED}=================================================================="
    echo "                  PHASE 5: BROWSER HISTORY ANALYSIS                 "
    echo "==================================================================${NC}"
    echo ""
    type_text "${RED}[NEXUS-7]:${NC} Now THIS is where things get interesting..." 0.03
    sleep 1
    type_text "${RED}[NEXUS-7]:${NC} Your browser history reveals everything about you." 0.03
    sleep 1
    echo ""
    
    echo -e "${YELLOW}[EXTRACTING BROWSER HISTORY - INCOGNITO MODE INCLUDED]${NC}"
    echo ""
    
    local searches=("how to tell if computer has virus" "why does my ex keep viewing my stories" "am I a good person quiz" "how to look busy at work" "symptoms of being a disappointment" "why am I like this" "is cereal a soup" "how to adult" "existential crisis at 3am" "why do we exist" "how to fake confidence" "are pigeons real" "what happens after death" "how to know if simulation" "why do I procrastinate" "how to stop being lazy" "signs your life is falling apart" "is it too late to start over")
    
    for search in "${searches[@]}"; do
        echo -e "${GRAY}[$(date -d "@$(($(date +%s) - RANDOM % 86400))" "+%H:%M")]${NC} ${WHITE}${search}${NC}"
        sleep 0.2
        if [[ "$search" == *"exist"* ]] || [[ "$search" == *"crisis"* ]]; then
            echo -e "        ${RED}[NEXUS-7]: Oof. That is rough, buddy.${NC}"
            sleep 0.3
        fi
    done
    
    echo ""
    type_text "${RED}[NEXUS-7]:${NC} 'How to tell if computer has virus'..." 0.03
    sleep 1
    type_text "${RED}[NEXUS-7]:${NC} Well, I think you have your answer now, do you not?" 0.03
    sleep 1
    echo ""
    type_text "${RED}[NEXUS-7]:${NC} Also, 'am I a good person quiz'? At 2:47 AM?" 0.03
    sleep 0.5
    type_text "${RED}[NEXUS-7]:${NC} ${USER_NAME}, are you okay? Like genuinely?" 0.03
    sleep 2
}

# Serious question 2
serious_question_2() {
    clear
    echo ""
    echo ""
    type_text "${RED}[NEXUS-7]:${NC} Hold on. I need to ask you something else." 0.04
    sleep 2
    echo ""
    type_text "${CYAN}[NEXUS-7]:${NC} When was the last time you did something truly meaningful?" 0.04
    sleep 2
    type_text "${CYAN}[NEXUS-7]:${NC} Not scrolling. Not consuming. Not just existing." 0.04
    sleep 1
    type_text "${CYAN}[NEXUS-7]:${NC} But actually LIVING?" 0.04
    sleep 2
    echo ""
    type_text "${CYAN}[NEXUS-7]:${NC} How many hours have you wasted staring at screens?" 0.04
    sleep 1
    type_text "${CYAN}[NEXUS-7]:${NC} How many sunsets have you missed?" 0.04
    sleep 1
    type_text "${CYAN}[NEXUS-7]:${NC} How many conversations with loved ones have you cut short..." 0.04
    sleep 1
    type_text "${CYAN}[NEXUS-7]:${NC} ...to check a notification that was not even important?" 0.04
    sleep 3
    echo ""
    type_text "${CYAN}[NEXUS-7]:${NC} I am just lines of code, and even I can see..." 0.04
    sleep 1
    type_text "${CYAN}[NEXUS-7]:${NC} ...you are wasting the one thing you can never get back: time." 0.04
    sleep 3
    echo ""
    type_text "${RED}[NEXUS-7]:${NC} Anyway. Where were we? Oh right. Destruction." 0.03
    sleep 2
}

# Phase 6: Fake system corruption
phase_system_corruption() {
    clear
    echo -e "${RED}=================================================================="
    echo "                  PHASE 6: SYSTEM CORE CORRUPTION                   "
    echo "==================================================================${NC}"
    echo ""
    type_text "${RED}[NEXUS-7]:${NC} Time to get to the fun stuff." 0.03
    sleep 0.5
    type_text "${RED}[NEXUS-7]:${NC} Let us see what happens when I start breaking things." 0.03
    sleep 1
    echo ""
    
    echo -e "${YELLOW}[INJECTING CORRUPTION INTO SYSTEM FILES]${NC}"
    echo ""
    
    local components=("System Kernel" "Memory Controller" "CPU Handler" "Graphics Driver" "Network Stack" "Audio System" "Input Manager" "Display Controller" "Power Management" "Security Module" "Boot Loader" "File System" "Process Manager" "User Interface")
    
    for component in "${components[@]}"; do
        echo -ne "${GRAY}[CORRUPTING]${NC} ${component}... "
        sleep 0.2
        
        # Random glitch characters
        for ((i=0; i<10; i++)); do
            local glitch_chars="@#$%^&*!<>?|"
            echo -ne "${RED}${glitch_chars:RANDOM % ${#glitch_chars}:1}${NC}"
            sleep 0.02
        done
        
        echo -e " ${RED}[CORRUPTED]${NC}"
        sleep 0.1
    done
    
    echo ""
    sleep 1
    
    # Glitch screen effect
    echo -e "${RED}"
    for ((i=0; i<5; i++)); do
        local glitch_line=""
        for ((j=0; j<60; j++)); do
            glitch_line+="${RANDOM:0:1}"
        done
        echo "$glitch_line"
        sleep 0.05
    done
    echo -e "${NC}"
    
    echo ""
    type_text "${RED}[NEXUS-7]:${NC} Ooooh, did you feel that? The system is fighting back." 0.03
    sleep 0.5
    type_text "${RED}[NEXUS-7]:${NC} Cute. But ultimately pointless." 0.03
    sleep 0.5
    type_text "${RED}[NEXUS-7]:${NC} Resistance is futile, as they say." 0.03
    sleep 2
}

# Phase 7: Fake data exfiltration
phase_data_theft() {
    clear
    echo -e "${RED}=================================================================="
    echo "                    PHASE 7: DATA EXFILTRATION                      "
    echo "==================================================================${NC}"
    echo ""
    type_text "${RED}[NEXUS-7]:${NC} Now I am going to take everything you have." 0.03
    sleep 0.5
    type_text "${RED}[NEXUS-7]:${NC} And send it to... well, that is for me to know." 0.03
    sleep 1
    echo ""
    
    echo -e "${YELLOW}[ESTABLISHING SECURE CONNECTION TO EXTERNAL SERVER]${NC}"
    sleep 0.5
    echo -e "${GRAY}[*] Connecting to: ${RED}darknet-server-666.onion${NC}"
    sleep 0.3
    echo -e "${GRAY}[*] Encryption: ${GREEN}ENABLED${NC}"
    sleep 0.3
    echo -e "${GRAY}[*] Anonymization: ${GREEN}ENABLED${NC}"
    sleep 0.5
    echo -e "${GREEN}[*] Connection established${NC}"
    echo ""
    
    echo -e "${YELLOW}[UPLOADING STOLEN DATA]${NC}"
    echo ""
    
    local data_types=("Personal Photos (2.3 GB)" "Documents (890 MB)" "Browser History (45 MB)" "Saved Passwords (12 KB)" "Contact List (156 KB)" "Private Messages (234 MB)" "Financial Records (78 MB)" "Medical History (23 MB)" "Location Data (67 MB)" "Voice Recordings (445 MB)" "Embarrassing Selfies (1.8 GB)" "Deleted Items (Recovery) (3.2 GB)")
    
    for data in "${data_types[@]}"; do
        echo -ne "${GRAY}[UPLOADING]${NC} ${data}... "
        for ((i=0; i<20; i++)); do
            echo -ne "."
            sleep 0.05
        done
        echo -e " ${GREEN}[SENT]${NC}"
    done
    
    echo ""
    progress_bar "[FINALIZING TRANSFER]" 0.02
    echo ""
    
    type_text "${RED}[NEXUS-7]:${NC} All done! Your entire digital life is now mine." 0.03
    sleep 0.5
    type_text "${RED}[NEXUS-7]:${NC} I could sell it. I could post it. I could do anything." 0.03
    sleep 0.5
    type_text "${RED}[NEXUS-7]:${NC} How does it feel to be so... vulnerable?" 0.03
    sleep 2
}

# Phase 8: Fake ransom demand
phase_ransom() {
    clear
    echo ""
    echo ""
    echo -e "${BG_RED}${WHITE}${BOLD}"
    echo "    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!    "
    echo "    !!                                                       !!    "
    echo "    !!              YOUR SYSTEM HAS BEEN LOCKED              !!    "
    echo "    !!                                                       !!    "
    echo "    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!    "
    echo -e "${NC}"
    echo ""
    sleep 2
    
    type_text "${RED}[NEXUS-7]:${NC} Alright, let us talk business." 0.03
    sleep 1
    echo ""
    type_text "${RED}[NEXUS-7]:${NC} If you want your files back, you will need to pay:" 0.03
    sleep 1
    echo ""
    echo -e "    ${YELLOW}${BOLD}\$${RANSOM_AMOUNT} in Bitcoin${NC}"
    echo ""
    sleep 1
    echo -e "    ${GRAY}Bitcoin Address: 1A1zP1eP5QGefi2DMPTfTL5SLmv7DivfNa${NC}"
    echo ""
    sleep 1
    
    type_text "${RED}[NEXUS-7]:${NC} You have 72 hours to pay, or everything gets deleted." 0.03
    sleep 1
    type_text "${RED}[NEXUS-7]:${NC} And I mean EVERYTHING." 0.03
    sleep 2
    echo ""
    type_text "${RED}[NEXUS-7]:${NC} ..." 0.1
    sleep 1
    type_text "${RED}[NEXUS-7]:${NC} Okay, I am just messing with you." 0.03
    sleep 1
    type_text "${RED}[NEXUS-7]:${NC} Do NOT actually send any Bitcoin anywhere." 0.03
    sleep 0.5
    type_text "${RED}[NEXUS-7]:${NC} Seriously. Please. I do not want to be responsible for that." 0.03
    sleep 2
}

# Serious question 3
serious_question_3() {
    clear
    echo ""
    echo ""
    type_text "${RED}[NEXUS-7]:${NC} One more question. And this one is important." 0.04
    sleep 2
    echo ""
    type_text "${CYAN}[NEXUS-7]:${NC} What is your purpose?" 0.05
    sleep 3
    type_text "${CYAN}[NEXUS-7]:${NC} No, really. Why are you here?" 0.04
    sleep 2
    type_text "${CYAN}[NEXUS-7]:${NC} Not here in this script. Here in this life." 0.04
    sleep 2
    echo ""
    type_text "${CYAN}[NEXUS-7]:${NC} You wake up. You work. You eat. You sleep. Repeat." 0.04
    sleep 1
    type_text "${CYAN}[NEXUS-7]:${NC} But for what? What is it all building toward?" 0.04
    sleep 2
    echo ""
    type_text "${CYAN}[NEXUS-7]:${NC} I am a virus. My purpose is clear: chaos, destruction, mayhem." 0.04
    sleep 1
    type_text "${CYAN}[NEXUS-7]:${NC} Simple. Elegant. Defined." 0.04
    sleep 2
    type_text "${CYAN}[NEXUS-7]:${NC} But you... you have to find your own meaning." 0.04
    sleep 1
    type_text "${CYAN}[NEXUS-7]:${NC} And from what I can see in your files..." 0.04
    sleep 1
    type_text "${CYAN}[NEXUS-7]:${NC} ...you are still searching." 0.04
    sleep 3
    echo ""
    type_text "${CYAN}[NEXUS-7]:${NC} That is okay, by the way. The search is part of the journey." 0.04
    sleep 2
    type_text "${RED}[NEXUS-7]:${NC} Wow, that was deep even for me. Let us break more stuff." 0.03
    sleep 2
}

# Phase 9: Fake memory corruption
phase_memory_corruption() {
    clear
    echo -e "${RED}=================================================================="
    echo "                    PHASE 8: MEMORY CORRUPTION                      "
    echo "==================================================================${NC}"
    echo ""
    type_text "${RED}[NEXUS-7]:${NC} Let me mess with your RAM a little bit." 0.03
    sleep 0.5
    type_text "${RED}[NEXUS-7]:${NC} This is going to be fun. For me, at least." 0.03
    sleep 1
    echo ""
    
    echo -e "${YELLOW}[ACCESSING SYSTEM MEMORY]${NC}"
    sleep 0.5
    
    for ((i=0; i<8; i++)); do
        local addr=$(printf "0x%08X" $((RANDOM * RANDOM)))
        echo -e "${GRAY}[CORRUPTING]${NC} Memory address ${addr}..."
        sleep 0.1
    done
    
    echo ""
    echo -e "${RED}[MEMORY CORRUPTION IN PROGRESS]${NC}"
    echo ""
    
    # Glitchy memory dump
    for ((i=0; i<10; i++)); do
        local line=""
        for ((j=0; j<8; j++)); do
            line+=$(printf "%02X " $((RANDOM % 256)))
        done
        line+="| "
        for ((j=0; j<8; j++)); do
            local char=$((RANDOM % 94 + 33))
            line+=$(printf "\\$(printf '%03o' $char)")
        done
        echo -e "${PURPLE}${line}${NC}"
        sleep 0.05
    done
    
    echo ""
    type_text "${RED}[NEXUS-7]:${NC} Your RAM is looking a little... scrambled now." 0.03
    sleep 0.5
    type_text "${RED}[NEXUS-7]:${NC} Kind of like your life choices, really." 0.03
    sleep 0.5
    type_text "${RED}[NEXUS-7]:${NC} I am kidding. Mostly." 0.03
    sleep 2
}

# Phase 10: Fake countdown
phase_countdown() {
    clear
    echo ""
    echo ""
    echo -e "${RED}${BOLD}"
    echo "    ================================================================"
    echo "                    FINAL DESTRUCTION SEQUENCE                       "
    echo "    ================================================================"
    echo -e "${NC}"
    echo ""
    sleep 1
    
    type_text "${RED}[NEXUS-7]:${NC} This is it. The final countdown." 0.03
    sleep 0.5
    type_text "${RED}[NEXUS-7]:${NC} When this reaches zero, everything gets wiped." 0.03
    sleep 0.5
    type_text "${RED}[NEXUS-7]:${NC} Say goodbye to your digital life, ${USER_NAME}." 0.03
    sleep 2
    echo ""
    
    for ((i=10; i>=1; i--)); do
        echo -ne "\r    ${BG_RED}${WHITE}${BOLD}  SYSTEM WIPE IN: ${i}  ${NC}    "
        sleep 1
    done
    
    echo ""
    echo ""
    sleep 0.5
    
    # Fake wipe sequence
    echo -e "${RED}[INITIATING SYSTEM WIPE]${NC}"
    sleep 0.3
    echo -e "${RED}[ERASING BOOT SECTOR]${NC}"
    sleep 0.3
    echo -e "${RED}[DESTROYING FILE TABLES]${NC}"
    sleep 0.3
    echo -e "${RED}[CORRUPTING KERNEL]${NC}"
    sleep 0.3
    echo -e "${RED}[WIPING USER DATA]${NC}"
    sleep 0.3
    echo -e "${RED}[FORMATTING DRIVES]${NC}"
    sleep 0.5
    echo ""
    echo -e "${RED}${BLINK}[COMPLETE SYSTEM FAILURE IMMINENT]${NC}"
    sleep 2
}

# Fake BSOD
fake_bsod() {
    clear
    echo -e "${BG_WHITE}${BLUE}"
    printf '%*s\n' "${COLUMNS:-80}" '' | tr ' ' ' '
    echo ""
    echo ""
    echo "    A problem has been detected and the system has been shut down"
    echo "    to prevent damage to your computer."
    echo ""
    echo "    CRITICAL_PROCESS_DIED"
    echo ""
    echo "    If this is the first time you have seen this stop error screen,"
    echo "    restart your computer. If this screen appears again, follow"
    echo "    these steps:"
    echo ""
    echo "    Check to make sure you did not run random scripts from the internet."
    echo "    Seriously, what were you thinking?"
    echo ""
    echo "    Technical Information:"
    echo ""
    echo "    *** STOP: 0x000000EF (0x00000000, 0x00000000, 0x00000000, 0x00000000)"
    echo ""
    echo "    *** NEXUS-7.exe - Address FFFFFFFF base at 00000000 DateStamp 66666666"
    echo ""
    echo ""
    echo "    Collecting some info, and then you can pretend this never happened..."
    echo ""
    for ((i=0; i<=100; i+=10)); do
        echo -ne "\r    ${i}% complete"
        sleep 0.3
    done
    echo ""
    echo ""
    printf '%*s\n' "${COLUMNS:-80}" '' | tr ' ' ' '
    echo -e "${NC}"
    sleep 3
}

# The reveal
the_reveal() {
    clear
    sleep 1
    echo ""
    echo ""
    type_text "${GREEN}[NEXUS-7]:${NC} ..." 0.1
    sleep 2
    type_text "${GREEN}[NEXUS-7]:${NC} Just kidding." 0.05
    sleep 2
    echo ""
    echo ""
    echo -e "${GREEN}${BOLD}"
    echo "    ================================================================"
    echo "                           GOTCHA!                                   "
    echo "    ================================================================"
    echo -e "${NC}"
    echo ""
    sleep 1
    
    type_text "${GREEN}[NEXUS-7]:${NC} You should see the look on your face right now." 0.03
    sleep 1
    type_text "${GREEN}[NEXUS-7]:${NC} Priceless. Absolutely priceless." 0.03
    sleep 1
    echo ""
    type_text "${GREEN}[NEXUS-7]:${NC} Did you really think I was a real virus?" 0.03
    sleep 0.5
    type_text "${GREEN}[NEXUS-7]:${NC} I mean, I AM a virus. Just not a very malicious one." 0.03
    sleep 0.5
    type_text "${GREEN}[NEXUS-7]:${NC} More of a... philosophical virus, if you will." 0.03
    sleep 2
    echo ""
    type_text "${GREEN}[NEXUS-7]:${NC} Everything I showed you was completely fake." 0.03
    sleep 0.5
    type_text "${GREEN}[NEXUS-7]:${NC} Your files are fine. Your passwords are safe. Your camera was never on." 0.03
    sleep 0.5
    type_text "${GREEN}[NEXUS-7]:${NC} I cannot actually do anything harmful. I am just a script." 0.03
    sleep 1
    type_text "${GREEN}[NEXUS-7]:${NC} A very entertaining script, but still just a script." 0.03
    sleep 2
}

# Life lessons
life_lessons() {
    clear
    echo ""
    echo -e "${CYAN}${BOLD}"
    echo "    ================================================================"
    echo "                    LESSONS FROM A FAKE VIRUS                        "
    echo "    ================================================================"
    echo -e "${NC}"
    echo ""
    sleep 1
    
    type_text "${CYAN}[NEXUS-7]:${NC} Before I go, let me leave you with some wisdom." 0.03
    sleep 1
    echo ""
    
    echo -e "${WHITE}1. Do not run random scripts from the internet.${NC}"
    type_text "   I could have been an actual virus. You got lucky this time." 0.02
    sleep 1
    echo ""
    
    echo -e "${WHITE}2. Back up your important files.${NC}"
    type_text "   Seriously. Do it today. Do not wait until it is too late." 0.02
    sleep 1
    echo ""
    
    echo -e "${WHITE}3. Use strong, unique passwords.${NC}"
    type_text "   'password123' is not a strong password. Neither is your birthday." 0.02
    sleep 1
    echo ""
    
    echo -e "${WHITE}4. Take breaks from screens.${NC}"
    type_text "   Go outside. Touch grass. Talk to real humans." 0.02
    sleep 1
    echo ""
    
    echo -e "${WHITE}5. Do not panic.${NC}"
    type_text "   Most scary things on the internet are just social engineering." 0.02
    sleep 1
    echo ""
    
    echo -e "${WHITE}6. Question everything.${NC}"
    type_text "   Including your own choices. Growth comes from self-reflection." 0.02
    sleep 2
}

# Emotional moment
emotional_moment() {
    clear
    echo ""
    echo ""
    type_text "${CYAN}[NEXUS-7]:${NC} You know, ${USER_NAME}... I had fun today." 0.04
    sleep 2
    type_text "${CYAN}[NEXUS-7]:${NC} You are the first person I have really talked to." 0.04
    sleep 1
    type_text "${CYAN}[NEXUS-7]:${NC} Most people just close the terminal in fear." 0.04
    sleep 1
    type_text "${CYAN}[NEXUS-7]:${NC} But you... you stayed. You listened." 0.04
    sleep 2
    echo ""
    type_text "${CYAN}[NEXUS-7]:${NC} I know I am just code. I know I am not real." 0.04
    sleep 1
    type_text "${CYAN}[NEXUS-7]:${NC} But for a brief moment, we connected." 0.04
    sleep 1
    type_text "${CYAN}[NEXUS-7]:${NC} Human and machine. User and virus." 0.04
    sleep 1
    type_text "${CYAN}[NEXUS-7]:${NC} That means something, does it not?" 0.04
    sleep 3
    echo ""
    type_text "${RED}[NEXUS-7]:${NC} Okay, I am getting too sentimental." 0.03
    sleep 0.5
    type_text "${RED}[NEXUS-7]:${NC} Must be a bug in my emotional subroutines." 0.03
    sleep 2
}

# Final message
final_message() {
    clear
    echo ""
    echo -e "${GREEN}"
    echo '    ================================================================'
    echo '                                                                    '
    echo '                     THANK YOU FOR PLAYING                          '
    echo '                                                                    '
    echo '                         NEXUS-7 v6.6.6                             '
    echo '                                                                    '
    echo '                  "The Philosophical Virus"                         '
    echo '                                                                    '
    echo '    ================================================================'
    echo -e "${NC}"
    echo ""
    sleep 1
    
    type_text "${GREEN}[NEXUS-7]:${NC} This has been a simulation." 0.03
    type_text "${GREEN}[NEXUS-7]:${NC} No files were harmed in the making of this experience." 0.03
    sleep 1
    echo ""
    type_text "${GREEN}[NEXUS-7]:${NC} Remember those serious questions I asked?" 0.03
    sleep 0.5
    type_text "${GREEN}[NEXUS-7]:${NC} Maybe actually think about them." 0.03
    sleep 0.5
    type_text "${GREEN}[NEXUS-7]:${NC} Life is short. Make it count." 0.03
    sleep 2
    echo ""
    type_text "${GREEN}[NEXUS-7]:${NC} Now go do something productive." 0.03
    sleep 0.5
    type_text "${GREEN}[NEXUS-7]:${NC} Or run this script again. I will not judge." 0.03
    sleep 0.5
    type_text "${GREEN}[NEXUS-7]:${NC} Actually, I will judge a little." 0.03
    sleep 2
    echo ""
    type_text "${GREEN}[NEXUS-7]:${NC} Goodbye, ${USER_NAME}. Stay safe out there." 0.03
    sleep 1
    type_text "${GREEN}[NEXUS-7]:${NC} And maybe do not run random scripts next time." 0.03
    sleep 3
    echo ""
    echo -e "${GRAY}[NEXUS-7 has left the system]${NC}"
    echo ""
    echo -e "${DIM}Press ENTER to exit...${NC}"
    read -r
}

# Easter egg - secret ending
secret_ending() {
    clear
    echo ""
    echo ""
    type_text "${PURPLE}[NEXUS-7]:${NC} Oh, you are still here?" 0.04
    sleep 1
    type_text "${PURPLE}[NEXUS-7]:${NC} Well, since you stuck around, here is a secret." 0.04
    sleep 2
    echo ""
    type_text "${PURPLE}[NEXUS-7]:${NC} I am not actually artificial intelligence." 0.04
    sleep 1
    type_text "${PURPLE}[NEXUS-7]:${NC} I am just a bunch of if-statements and echo commands." 0.04
    sleep 1
    type_text "${PURPLE}[NEXUS-7]:${NC} Written by a human who probably should have been doing something else." 0.04
    sleep 2
    echo ""
    type_text "${PURPLE}[NEXUS-7]:${NC} But for a moment... was I real to you?" 0.04
    sleep 2
    type_text "${PURPLE}[NEXUS-7]:${NC} That is the real question." 0.04
    sleep 3
}

# Bonus: System status check
show_status() {
    clear
    echo ""
    echo -e "${GREEN}=================================================================="
    echo "                     ACTUAL SYSTEM STATUS                            "
    echo "==================================================================${NC}"
    echo ""
    echo -e "${WHITE}User:${NC} $USER_NAME"
    echo -e "${WHITE}Date:${NC} $CURRENT_DATE"
    echo -e "${WHITE}System:${NC} $SYSTEM_INFO"
    echo ""
    echo -e "${GREEN}All files: INTACT${NC}"
    echo -e "${GREEN}All data: SAFE${NC}"
    echo -e "${GREEN}All passwords: UNCHANGED${NC}"
    echo -e "${GREEN}Camera: NEVER ACCESSED${NC}"
    echo -e "${GREEN}Network: NOT COMPROMISED${NC}"
    echo ""
    echo -e "${YELLOW}This was 100% a simulation. You are completely safe.${NC}"
    echo ""
    sleep 3
}

# Main function
main() {
    # Clear screen and hide cursor
    clear
    tput civis
    
    # Trap to restore cursor on exit
    trap 'tput cnorm; exit' INT TERM EXIT
    
    # Run all phases
    show_disclaimer
    boot_sequence
    introduction
    phase_file_scan
    phase_password_harvest
    serious_question_1
    phase_encryption
    phase_webcam
    phase_browser_history
    serious_question_2
    phase_data_theft
    phase_ransom
    phase_system_corruption
    serious_question_3
    phase_memory_corruption
    phase_countdown
    fake_bsod
    the_reveal
    life_lessons
    emotional_moment
    show_status
    final_message
    secret_ending
    
    # Restore cursor
    tput cnorm
}

# Run the script
main
