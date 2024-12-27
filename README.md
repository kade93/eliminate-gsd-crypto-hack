# **`gsd`: Malicious Crypto Mining Process**

## Gist
https://gist.github.com/kade93/577c44e0e0f01eba8c88c68ce82ec29a
```
wget https://gist.github.com/kade93/577c44e0e0f01eba8c88c68ce82ec29a
```

## Overview

In December 2024, I discovered a malicious crypto mining process named `gsd`. This process exhibits the following behaviors:

- **Stealthy Process Termination**:
  - Python processes are killed without leaving any logs.
  - Kubernetes `kube-api-server` processes are terminated and restarted without generating OOM (Out of Memory) logs.

## Mitigation

To prevent `gsd` from disrupting your system, the included scripts will terminate the `gsd` process, allowing your nodes and other critical processes to run normally.

However, these scripts should be considered a temporary solution. **For complete system recovery, I strongly recommend the following steps**:

1. **Reinstall your operating system (OS)**:
   - This ensures the complete removal of the malicious software and any associated backdoors.

2. **If reinstallation is not possible**, perform the following:
   - Change all system passwords.
   - Replace existing SSH keys with new ones.

## Usage

1. Clone this repository:
2. Run the mitigation script you need

## Important Notes

- These scripts **do not guarantee complete system recovery**. They serve as a temporary measure to mitigate immediate threats.
- Always monitor your system for unusual activity, especially on critical servers running Kubernetes or other sensitive workloads.

## Contact

If you have any questions or encounter similar issues, feel free to open an issue in this repository or contact me directly.

---
