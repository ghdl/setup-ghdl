# Setup GHDL in GitHub Action Workflows

This composite action, installs GHDL in a GitHub Action's workflow job.

> [!IMPORTANT]  
> This GitHub Action replaces [`setup-ghdl-ci`](https://github.com/ghdl/setup-ghdl-ci).

## Features

* Select GHDL version:
  * tagged release like `5.0.0`, or
  * `nightly` release (rolling release).
* Select GHDL backend:
  * mcode
  * LLVM
  * LLVM-JIT (new)
  * GCC (deprecated).
* Activate an investigation mode (check and show GHDL installation, ...).
* Supported runner OS' provided by GitHub (automatically detected):
  * Ubuntu 24.04 (LTS),
  * macOS-13 (x86-64),
  * macOS-14 (aarch64)
  * Windows Server 2022.

## Usage

```yaml
jobs:
  GHDL-on-Ubuntu:
    runs-on: ubuntu-24.04
    steps:
      - name: Run VHDL Simulation
        uses: ghdl/setup-ghdl@v1
        with:
          version: nightly
          backend: mcode
          investigate: true
          
  GHDL-on-macOS:
    runs-on: macOS-14
    steps:
      - name: Run VHDL Simulation
        uses: ghdl/setup-ghdl@v1
        with:
          version: nightly
          backend: llvm

  GHDL-on-Windows:
    runs-on: windows-2022
    steps:
      - name: Run VHDL Simulation
        uses: ghdl/setup-ghdl@v1
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
        uses: ghdl/setup-ghdl@v1
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


## Behavior and Dependencies

### On Linux (Ubuntu)

* Download GHDL asset from https://github.com/ghdl/ghdl/releases as `*.tar.gz` and extract files into
  `install-directory`.
* Further dependencies will be installed using `apt-get` and reading the embedded `ubuntu.requirements`
  file.
* GHDL's `bin` directory will be added to `PATH`.

### On macOS

* Download GHDL asset from https://github.com/ghdl/ghdl/releases as `*.tar.gz` and extract files into
  `install-directory`.
* All dependencies are contained within the archive, thus no further dependencies need to be installed.
* GHDL's `bin` directory will be added to `PATH`.

### On Windows (native)

* Download GHDL asset from https://github.com/ghdl/ghdl/releases as `*.zip` into `install-directory`.
* The archive is extracted into the same directory.
* All dependencies are contained within the archive, thus no further dependencies need to be installed.
* GHDL's `bin` directory will be added to `PATH`.

### On Windows + MSYS2

* Download GHDL asset from https://github.com/ghdl/ghdl/releases as `*.pkg.tar.zst` installation package for pacman.
* Install this package.
* Further dependencies get automatically installed by pacman, as listed as dependencies in the package.
* No need to modify `PATH`, because GHDL got installed into the MSYS2 system.

## Contributors

* [Patrick Lehmann](https://GitHub.com/Paebbels) (Maintainer)
* [and more...](https://GitHub.com/ghdl/setup-ghdl/graphs/contributors)

### Credits

This GitHub Action replaces `setup-ghdl-ci`, a Javascript Action developed by
[Unai Martinez-Corral](https://GitHub.com/umarcor), with a composite action using simples instructions (`curl`, `tar`,
`apt-get`) written in Bash or Powershell.


## License

This GitHub Composite Action (source code) licensed under [The MIT License](LICENSE.md).

---

SPDX-License-Identifier: MIT
