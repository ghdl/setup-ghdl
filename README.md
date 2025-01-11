# Setup GHDL in GitHub Action Workflows

This composite action, installs GHDL in a GitHub Action's workflow job.


## Features

* Select GHDL version (tagged release or nightly build).
* Select GHDL backend (LLVM, LLVM-JIT, mcode, GCC)
* Activate an investigation mode (check and show GHDL installation, ...)
* Supported runner OS' (automatically detected): Ubuntu 2024.04, macOS (x86-64), macOS (aarch64), Windows

## Usage

```yaml
jobs:
  GHDL-on-Ubuntu:
    runs-on: ubuntu-24.04
    steps:
      - name: Run VHDL Simulation
        uses: paebbels/setup-ghdl@v1
        with:
          version: nightly
          backend: mcode
          investigate: true
          
  GHDL-on-macOS:
    runs-on: macOS-14
    steps:
      - name: Run VHDL Simulation
        uses: paebbels/setup-ghdl@v1
        with:
          version: nightly
          backend: llvm

  GHDL-on-Windows:
    runs-on: windows-2022
    steps:
      - name: Run VHDL Simulation
        uses: paebbels/setup-ghdl@v1
        with:
          version: nightly
          backend: mcode

  GHDL-on-Windows-with-UCRT64:
    runs-on: windows-2022
    steps:
      - name: 🟦 Setup MSYS2 for UCRT64
        uses: msys2/setup-msys2@v2
        with:
          msystem: ucrt64
          update: true

      - name: Run VHDL Simulation
        uses: paebbels/setup-ghdl@v1
        with:
          version: nightly
          backend: mcode
          runtime: ucrt64
```


### Input Parameters

| Parameter           | Required | Default     | Description                                                                                                                                 |
|---------------------|:--------:|-------------|---------------------------------------------------------------------------------------------------------------------------------------------|
| `version`           |    no    | `'nightly'` | A tagged GHDL version starting at `v5.0.0` or `nightly`.                                                                                    |
| `backend`           |    no    | `'mcode'`   | GHDL backend: `llvm`, `llvm-jit`, `mcode`, `gcc`.                                                                                           |
| `runtime`           |    no    | `''`        | If runner OS is Windows, a MSYS2 runtime can be selected (`mingw64`, `ucrt64`). If not set, Windows native is used (not MSYS2 environment). |
| `install-directory` |    no    | `'install'` | Local installation directory, in case an archive asset is downloaded and extracted.                                                         |
| `investigate`       |    no    | `false`     | If enabled, more details are printed and check the GHDL installation is checked.                                                            |


### Output Parameters

| Parameter            | Description |
|----------------------|-------------|
| `ghdl-bin-directory` | tbd         |
| `ghdl-lib-directory` | tbd         |


## Dependencies

### On Linux (Ubuntu)

* Download GHDL asset as `*.tar.gz` and extract files to `install-directory`.
* Further dependencies will be installed using `apt-get`.
* GHDL will be added to `PATH`.

### On macOS

* Download GHDL asset as `*.tar.gz` and extract files to `install-directory`.
* GHDL will be added to `PATH`.

### On Windows (native)

*tbd*

### On Windows + MSYS2

* Download GHDL asset as `*.pkg.tar.zst` installation package for pacman.
* Install package and further dependencies (listed in the package) via pacman.


## Contributors

* [Patrick Lehmann](https://GitHub.com/Paebbels) (Maintainer)
* [and more...](https://GitHub.com/ghdl/setup-ghdl/graphs/contributors)

### Credits

This GitHub Action replaces `setup-ghdl-ci`, a Javascript Action developed by Umarcor, with a composite action using
simples instructions (`curl`, `tar`, `apt-get`) written in Bash.
