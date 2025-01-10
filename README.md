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
  MyJob:
    steps:
      - name: Run VHDL Simulation
        uses: paebbels/setup-ghdl@v1
        with:
          version: nightly
          backend: mcode
          investigate: true
```


### Input Parameters

| Parameter                  | Required | Default     | Description                                              |
|----------------------------|:--------:|-------------|----------------------------------------------------------|
| `version`                  |    no    | `'nightly'` | A tagged GHDL version starting at `v5.0.0` or `nightly`. |
| `backend`                  |    no    | `'mcode'`   | GHDL backend: `llvm`, `llvm-jit`, `mcode`, `gcc`.        |
| `investigate`              |    no    | `false`     | If enabled, details and check GHDL installation.         |


### Output Parameters

| Parameter          | Description |
|--------------------|-------------|
| `ghdl-binary-dir`  | tbd         |
| `ghdl-library-dir` | tbd         |


## Dependencies

### On Linux (Ubuntu)

* Further dependencies will be installed using `apt-get`.
* GHDL will be added to `PATH`.

### On macOS

*tbd*

### On Windows (native)


### On Windows + MSYS2

## Contributors

* [Patrick Lehmann](https://GitHub.com/Paebbels) (Maintainer)
* [and more...](https://GitHub.com/ghdl/setup-ghdl/graphs/contributors)

### Credits

This GitHub Action replaces `setup-ghdl-ci`, a Javascript Action developed by Umarcor, with a composite action using
simples instructions (`curl`, `tar`, `apt-get`) written in Bash.
