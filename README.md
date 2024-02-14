# Python Boilerplate with Pytorch GPU support

[![GitHub](https://img.shields.io/badge/pytorch--gpu--template-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/AI-Data-system-EH/pytorch-gpu-template)
[![License: MIT](https://img.shields.io/badge/License-MIT-FFD43B?style=for-the-badge)](https://opensource.org/licenses/MIT)

[![GitHub last commit](https://img.shields.io/github/last-commit/AI-Data-system-EH/pytorch-gpu-template?style=for-the-badge)]()
[![GitHub issues](https://img.shields.io/github/issues/AI-Data-system-EH/pytorch-gpu-template?style=for-the-badge)](https://github.com/AI-Data-system-EH/pytorch-gpu-template/issues)
[![GitHub pull requests](https://img.shields.io/github/issues-pr/AI-Data-system-EH/pytorch-gpu-template?style=for-the-badge)](https://github.com/AI-Data-system-EH/pytorch-gpu-template/pulls)
[![GitHub stars](https://img.shields.io/github/stars/AI-Data-system-EH/pytorch-gpu-template?style=for-the-badge)](#)
[![GitHub forks](https://img.shields.io/github/forks/AI-Data-system-EH/pytorch-gpu-template?style=for-the-badge)](#)

## :orange_book: Introduction

- PyTorch GPU boilerplate for deep learning projects.
- Also includes Ruff, Pre-commit, and Poetry set-up for a complete development environment.

<table style="margin: 0; border: none">
  <tr style="border: none">
    <td align="center" width="25%">
      <img alt="PyTorch" height="200" src="https://pytorch.org/assets/images/pytorch-logo.png" />
      <a href="https://pytorch.org/" target="_blank">
        <img src="https://img.shields.io/badge/PyTorch-2.2.0--cu121-EE4C2C?style=for-the-badge&logo=PyTorch&logoColor=EE4C2C" />
      </a>
      <a href="https://pytorch.org/vision/stable/index.html" target="_blank">
        <img src="https://img.shields.io/badge/Torchvision-0.17.0-EE4C2C?style=for-the-badge&logo=PyTorch&logoColor=EE4C2C" />
      </a>
    </td>
    <td align="center" width="25%">
      <img alt="Poetry" height="200" src="https://python-poetry.org/images/logo-origami.svg">
      <a href="https://python-poetry.org/" target="_blank">
        <img src="https://img.shields.io/badge/Poetry-1.7.1-60A5FA?style=for-the-badge&logo=Poetry&logoColor=60A5FA" />
      </a>
    </td>
    <td align="center" width="25%">
      <img alt="Python" height="200" src="https://s3.dualstack.us-east-2.amazonaws.com/pythondotorg-assets/media/community/logos/python-logo-only.png" />
      <a href="https://www.python.org/" target="_blank">
        <img src="https://img.shields.io/badge/Python-3.11.7-3776AB?style=for-the-badge&logo=Python&logoColor=FFD43B" />
      </a>
    </td>
    <td align="center" width="25%">
      <img alt="Jupyter" height="200" src="https://upload.wikimedia.org/wikipedia/commons/3/38/Jupyter_logo.svg" />
      <a href="https://jupyter.org/" target="_blank">
        <img src="https://img.shields.io/badge/Notebook-7.1.0-F37626?style=for-the-badge&logo=Jupyter&logoColor=F37626" />
      </a>
    </td>
  </tr>
</table>

<table style="margin: 0; border: none">
  <tr style="border: none">
    <td align="center" width="25%">
      <img alt="Ruff" height="200" src="https://github.com/astral-sh/ruff-vscode/blob/main/icon.png?raw=true">
      <a href="https://www.python.org/" target="_blank">
        <img src="https://img.shields.io/badge/Ruff-0.2.1-30173D?style=for-the-badge&logo=Ruff&logoColor=D7FF64" />
      </a>
    </td>
    <td align="center" width="25%">
      <img alt="Pytest" height="200" src="https://docs.pytest.org/en/8.0.x/_static/pytest_logo_curves.svg">
      <a href="https://docs.pytest.org/en/8.0.x/" target="_blank">
        <img src="https://img.shields.io/badge/Pytest-8.0.0-0A9EDC?style=for-the-badge&logo=Pytest&logoColor=0A9EDC" />
      </a>
    </td>
    <td align="center" width="25%">
      <img alt="Pre-commit" height="200" src="https://pre-commit.com/logo.svg">
      <a href="https://pre-commit.com/" target="_blank">
        <img src="https://img.shields.io/badge/Pre--commit-3.6.1-FAB041?style=for-the-badge&logo=Pre-commit&logoColor=FAB041" />
      </a>
    </td>
    <td align="center" width="25%">
      <img alt="Pyright" height="200" src="https://ms-pyright.gallerycdn.vsassets.io/extensions/ms-pyright/pyright/1.1.350/1707151800648/Microsoft.VisualStudio.Services.Icons.Default">
      <a href="https://microsoft.github.io/pyright/" target="_blank">
        <img src="https://img.shields.io/badge/Pyright-1.1.350-B8B87E?style=for-the-badge&logo=python&logoColor=B8B87E" />
      </a>
    </td>
  </tr>
</table>

## :rocket: Quick Start

Ubuntu is recommended for the development environment.  
Tested on Windows 11 WSL2 (Ubuntu 22.04.3 LTS).

```bash
# Check the OS version
lsb_release -a
```

- :information_source: No need to install CUDA and cuDNN separately on WSL. (Nvidia driver on Windows is required.)
  - CUDA and cuDNN are installed automatically with the PyTorch package.

### 1. Clone the repository

```bash
git clone https://github.com/AI-Data-system-EH/pytorch-gpu-template.git
```

- :information_source: Check your current directory before cloning the repository.

### 2. Automatic Setup

```bash
cd pytorch-gpu-template
chmod +x ./.config/scripts/*.sh
```

#### 2-1. Install interactively

```bash
./.config/scripts/install_script.sh
```

#### 2-2. Install quietly (without user interaction, full installation)

```bash
./.config/scripts/install_script.sh --quiet
```

### 3. Manual Setup

#### 3-1. Install Python 3.11 or higher

```bash
# if add-apt-repository is not installed
sudo apt install software-properties-common
```

```bash
# add repository for newer python version
sudo add-apt-repository ppa:deadsnakes/ppa

sudo apt update
sudo apt install python3.11

# Set python3.11 as the default python3; create a symbolic link to the python3.11 binary
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.11 1
sudo update-alternatives --config python3

# Check the python version
python3 --version
```

#### 3-2. Install Poetry

[Poetry Installation](https://python-poetry.org/docs/#installing-with-the-official-installer)

```bash
curl -sSL https://install.python-poetry.org | python3 -

# Check the poetry version
poetry --version
```

#### 3-3. Install Python dependencies

1. Use Python 3.11 environment

```bash
poetry env use python3.11
```

- :information_source: If you have not installed Python 3.11, you will get an error message.
- or you can `poetry env use python3` to use the default python version. (Check the default python version with `python --version`)

2. Install Python dependencies

```bash
poetry install --no-root
```

- :information_source: `--no-root` option is used to prevent the installation of the project itself. (It is not necessary to install the project itself.)

#### 3-4. Install Pre-commit hooks (Optional)

```bash
poetry run pre-commit install
```

- Check [Pre-commit](https://pre-commit.com/) for more information.

#### 3-5. Open the project with Visual Studio Code

```bash
# Check the current working directory
code .
```

- :information_source: Follow the vscode prompt instructions to install the recommended extensions.

### Done! :tada:
