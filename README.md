# Python Boilerplate with Pytorch GPU support

[![GitHub](https://img.shields.io/badge/pytorch--gpu--template-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/AI-Data-system-EH/pytorch-gpu-template)
[![License: MIT](https://img.shields.io/badge/License-MIT-FFD43B?style=for-the-badge)](https://opensource.org/licenses/MIT)
[![GitHub stars](https://img.shields.io/github/stars/AI-Data-system-EH/pytorch-gpu-template?style=for-the-badge)](#)
[![GitHub forks](https://img.shields.io/github/forks/AI-Data-system-EH/pytorch-gpu-template?style=for-the-badge)](#)

[![GitHub last commit](https://img.shields.io/github/last-commit/AI-Data-system-EH/pytorch-gpu-template?label=last-commit:main&style=flat-square&logo=github&color=white&labelColor=008000)](https://github.com/AI-Data-system-EH/pytorch-gpu-template/tree/main)
[![GitHub last commit](https://img.shields.io/github/last-commit/AI-Data-system-EH/pytorch-gpu-template/devcontainer?label=last-commit:devcontainer&style=flat-square&logo=github&color=white&labelColor=8F784B)](https://github.com/AI-Data-system-EH/pytorch-gpu-template/tree/devcontainer)

[![GitHub issues](https://img.shields.io/github/issues/AI-Data-system-EH/pytorch-gpu-template?color=C0C0C0)](https://github.com/AI-Data-system-EH/pytorch-gpu-template/issues)
[![GitHub pull requests](https://img.shields.io/github/issues-pr/AI-Data-system-EH/pytorch-gpu-template?color=C0C0C0)](https://github.com/AI-Data-system-EH/pytorch-gpu-template/pulls)

## :orange_book: Introduction

- PyTorch GPU boilerplate for deep learning projects.
- Also includes Ruff, Pre-commit, and Poetry set-up for a complete development environment.
- **[Branch: devcontainer]** Provides a [devcontainer](https://code.visualstudio.com/docs/devcontainers/containers) set-up for GitHub Codespaces and Visual Studio Code Remote Development.

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
        <img src="https://img.shields.io/badge/Poetry-1.8.1-60A5FA?style=for-the-badge&logo=Poetry&logoColor=60A5FA" />
      </a>
    </td>
    <td align="center" width="25%">
      <img alt="Python" height="200" src="https://s3.dualstack.us-east-2.amazonaws.com/pythondotorg-assets/media/community/logos/python-logo-only.png" />
      <a href="https://www.python.org/" target="_blank">
        <img src="https://img.shields.io/badge/Python-3.12.2-3776AB?style=for-the-badge&logo=Python&logoColor=FFD43B" />
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
        <img src="https://img.shields.io/badge/Ruff-0.2.2-30173D?style=for-the-badge&logo=Ruff&logoColor=D7FF64" />
      </a>
    </td>
    <td align="center" width="25%">
      <img alt="Pytest" height="200" src="https://docs.pytest.org/en/8.0.x/_static/pytest_logo_curves.svg">
      <a href="https://docs.pytest.org/en/8.0.x/" target="_blank">
        <img src="https://img.shields.io/badge/Pytest-8.0.1-0A9EDC?style=for-the-badge&logo=Pytest&logoColor=0A9EDC" />
      </a>
      <a href="https://github.com/pytest-dev/pytest-cov" target="_blank">
        <img src="https://img.shields.io/badge/Pytest--cov-4.1.0-0A9EDC?style=for-the-badge&logo=Pytest&logoColor=0A9EDC" />
      </a>
    </td>
    <td align="center" width="25%">
      <img alt="Pre-commit" height="200" src="https://pre-commit.com/logo.svg">
      <a href="https://pre-commit.com/" target="_blank">
        <img src="https://img.shields.io/badge/Pre--commit-3.6.2-FAB041?style=for-the-badge&logo=Pre-commit&logoColor=FAB041" />
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

### 1. Open Visual Studio Code with Remote Development

- Install [Visual Studio Code](https://code.visualstudio.com/) and [Remote Development Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack).
- Connect to a <u>(Case 1) Remote-SSH server</u> or create a new <u>(Case 2) Codespaces with this repository</u>.
  1. (Recommend) [How to Connect Remote-SSH](https://code.visualstudio.com/docs/remote/ssh)
  2. Install [GitHub Codespaces Extension](https://marketplace.visualstudio.com/items?itemName=GitHub.codespaces) and Create a new [Codespaces](https://github.com/features/codespaces) with this repository.
     <i>important!</i> Check you have access to Codespaces plan. (free accounts does not support GPU machines.)
- :information_source: Be aware that this devcontainer is set up for a GPU environment. you may need a gpu-enabled remote server or Codespaces.

### 2. Create your repository using template with the <u><i>devcontainer</i></u> branch

- Click the `Use this template` button on the top-right of this repository.
  - [How to use a repository as a template](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template)
- Select the `include all branches` option to include the `devcontainer` branch.
- Click the `Create repository` button.

### 3. Open the repository in Visual Studio Code

- Open the repository in Remote Server or Codespaces.
- Click the `Reopen in Container` button to open the repository in the devcontainer.
  - You may need to install [Docker](https://www.docker.com/) if you are using a local machine.
- A new container will be created and the repository will be opened in the new container.
  (It may take a few minutes to build the container for the first time.)

### 4. Install additional dependencies

- Check [Poetry Managing Dependencies](https://python-poetry.org/docs/managing-dependencies/) for more information.
- Check [Node Package Manager](https://www.npmjs.com/) for more information.

### Done! :tada:
