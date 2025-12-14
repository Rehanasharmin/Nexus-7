# NEXUS-7 Virus Simulation

A terminal-based simulation that mimics malicious software behavior for educational and entertainment purposes. Written in Bash for Termux and Linux systems.

---

## Disclaimer

This software is a simulation. It does not perform any actual malicious operations. No files are accessed, modified, or deleted. No network connections are made. No data is collected or transmitted. The author assumes no responsibility for misuse or any distress caused by running this script without understanding its nature.

---

## Purpose

This project exists for two reasons:

1. To demonstrate how social engineering and fear tactics work in real malware
2. To provide entertainment through an interactive terminal experience

Understanding how threats present themselves helps users recognize and avoid actual dangers.

---

## Requirements

- Bash shell (version 4.0 or higher)
- Terminal with ANSI color support
- Termux (Android) or any Linux distribution

---

## Installation

```bash
git clone https://github.com/Rehanasharmin/Nexus-7.git
cd Nexus-7
chmod +x virus_simulation.sh
```

Manual installation:

```bash
curl -O https://raw.githubusercontent.com/yourusername/nexus7-simulation/main/virus_simulation.sh
chmod +x virus_simulation.sh
```

---

## Usage

```bash
./virus_simulation.sh
```

The simulation runs approximately 10-15 minutes. Press Ctrl+C at any time to exit.

---

## What It Simulates

| Component | Description |
|-----------|-------------|
| File Scanner | Displays fake file discovery messages |
| Credential Extractor | Shows simulated password harvesting |
| Encryption Module | Mimics ransomware file locking |
| Camera Access | Pretends to capture images |
| Data Exfiltration | Simulates upload to remote server |
| System Corruption | Displays fake system damage |
| Ransom Screen | Shows mock payment demand |
| Blue Screen | Simulates system crash |

None of these operations are real.

---

## What It Does Not Do

- Access any actual files on your system
- Connect to the internet
- Collect any personal information
- Modify system settings
- Install anything
- Run background processes
- Persist after termination

---

## Technical Details

The script uses only:

- echo and printf for text output
- sleep for timing
- ANSI escape codes for colors and effects
- Basic arithmetic for random number generation
- tput for cursor control

No external dependencies. No root access required.

---

## File Structure

```
nexus7-simulation/
├── virus_simulation.sh    # Main script
├── README.md              # This file
└── LICENSE                # MIT License
```

---

## Ethical Guidelines

Do not use this script to:

- Frighten individuals without their consent
- Deceive others into believing their system is compromised
- Demand actual payment from anyone
- Cause psychological distress

This is a learning tool and entertainment software. Use it responsibly.

---

## Known Limitations

- Terminal width affects visual formatting
- Some effects may not render correctly on all terminal emulators
- Color support depends on terminal configuration
- Windows terminals may not display correctly

---

## Tested On

| Platform | Status |
|----------|--------|
| Termux (Android) | Working |
| Ubuntu 20.04+ | Working |
| Debian 11+ | Working |
| Kali Linux | Working |
| Arch Linux | Working |
| macOS Terminal | Partial |
| Windows WSL | Partial |

---

## Contributing

Contributions are not currently being accepted. This project is provided as-is.

---

## License

MIT License

Copyright (c) 2024

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files, to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

---

## Contact

For issues or questions, open an issue on the repository.

---

## Final Note

If you ran this script expecting actual malware, reconsider your approach to security. If you ran it knowing it was a simulation, you understand that awareness is the first line of defense.

Stay safe.
