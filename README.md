# cpuid
Simple assembly to print the CPUID string of x86_64 processors.

To assemble and run:
```bash
make run
```

Common CPUID's:
- `"GenuineIntel"` - Intel
- `"AuthenticAMD"` - AMD
- `"Microsoft Hv"` - Microsoft Hyper-V
- `"GenuineIntel"` - Apple Rosetta 2
- `"VirtualApple"` - Rosetta 2 (newer versions)