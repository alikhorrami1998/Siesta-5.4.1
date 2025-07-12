
# SIESTA 5.4.0 - Build & Installation Script

This repository provides a complete Bash script to automate the installation and compilation of **SIESTA 5.4.0** with support for MPI, SCALAPACK, NetCDF, LibXC, ELSI, and more on Debian/Ubuntu-based systems.
> 🇮🇷 [برای مشاهده نسخه فارسی کلیک کنید](./README.fa.md)
## 📦 Prerequisites

Make sure your system is up-to-date and you are using a Debian/Ubuntu-based Linux distribution.

## 📁 Contents

- `install_siesta.sh` – Bash script to:
  - Update your system
  - Install all required dependencies
  - Download and extract SIESTA source code
  - Configure build using CMake with necessary options
  - Build and install the program

---

## ⚙️ How to Use

### Run the Installation

```bash
bash <(curl -Ls https://raw.githubusercontent.com/alikhorrami1998/Siesta-5.4.0/refs/heads/main/install_siesta.sh)
```




This will automatically:




- Install required packages  
- Download SIESTA 5.4.0
- Configure the build using MPI and other optional components  
- Compile with all available cores  
- Install SIESTA system-wide






