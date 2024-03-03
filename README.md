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
- Also includes Ruff, Pytest, Pre-commit, Poetry set-up for a development environment.
- **[Branch: devcontainer]** Provides a [devcontainer](https://code.visualstudio.com/docs/devcontainers/containers) set-up for GitHub Codespaces and Visual Studio Code Remote Development.

<table style="margin: 0; border: none">
  <tr style="border: none">
    <!--::: Pytorch -->
    <td align="center" width="25%">
      <a href="https://pytorch.org/" target="_blank">
        <img alt="PyTorch" height="200" src="https://pytorch.org/assets/images/pytorch-logo.png" />
      </a>
      <a href="https://pypi.org/project/torch/" target="_blank">
        <img src="https://img.shields.io/pypi/v/torch?style=for-the-badge&logo=pytorch&logoColor=EE4C2C&color=EE4C2C">
      </a>
      <a href="https://pypi.org/project/torchvision/" target="_blank">
        <img src="https://img.shields.io/pypi/v/torchvision?style=for-the-badge&logo=pytorch&logoColor=EE4C2C&color=EE4C2C">
      </a>
    </td>
    <!--::: Poetry -->
    <td align="center" width="25%">
      <a href="https://python-poetry.org/" target="_blank">
        <img alt="Poetry" height="180" src="https://python-poetry.org/images/logo-origami.svg">
      </a>
      <a href="https://pypi.org/project/poetry/" target="_blank">
        <img src="https://img.shields.io/pypi/v/poetry?style=for-the-badge&logo=poetry&logoColor=60A5FA&color=60A5FA">
      </a>
    </td>
    <!--::: Python -->
    <td align="center" width="25%">
      <img alt="Python" height="200" src="https://s3.dualstack.us-east-2.amazonaws.com/pythondotorg-assets/media/community/logos/python-logo-only.png" />
      <a href="https://www.python.org/" target="_blank">
        <img src="https://img.shields.io/badge/Python-3.12.2-3776AB?style=for-the-badge&logo=Python&logoColor=FFD43B" />
      </a>
      <a href="https://www.python.org/downloads/" target="_blank">
        <img src="https://img.shields.io/pypi/pyversions/torch?label=pytorch">
      </a>
    </td>
    <!--::: Jupyter -->
    <td align="center" width="25%">
      <a href="https://jupyter.org/" target="_blank">
        <img alt="Jupyter" height="200" src="https://upload.wikimedia.org/wikipedia/commons/3/38/Jupyter_logo.svg" />
      </a>
      <a href="https://pypi.org/project/notebook/" target="_blank">
        <img src="https://img.shields.io/pypi/v/notebook?style=for-the-badge&logo=jupyter&logoColor=F37626&color=F37626">
      </a>
    </td>
  </tr>
</table>

<table style="margin: 0; border: none">
  <tr style="border: none">
    <!--::: Ruff -->
    <td align="center" width="25%">
      <a href="https://docs.astral.sh/ruff/" target="_blank">
        <img alt="Ruff" height="180" src="https://github.com/astral-sh/ruff-vscode/blob/main/icon.png?raw=true">
      </a>
      <a href="https://pypi.org/project/ruff/" target="_blank">
        <img src="https://img.shields.io/pypi/v/ruff?style=for-the-badge&logo=Pytest&logoColor=D7FF64&color=30173D">
      </a>
    </td>
    <!--::: Pytest -->
    <td align="center" width="25%">
      <a href="https://docs.pytest.org/en/8.0.x/" target="_blank">
        <img alt="Pytest" height="200" src="https://docs.pytest.org/en/8.0.x/_static/pytest_logo_curves.svg">
      </a>
      <a href="https://pypi.org/project/pytest/" target="_blank">
        <img src="https://img.shields.io/pypi/v/pytest?style=for-the-badge&logo=Pytest&logoColor=0A9EDC&color=0A9EDC">
      </a>
    </td>
    <!--::: Pre-commit -->
    <td align="center" width="25%">
      <a href="https://pre-commit.com/" target="_blank">
        <img alt="Pre-commit" height="200" src="https://pre-commit.com/logo.svg">
      </a>
      <a href="https://pypi.org/project/pre-commit/" target="_blank">
        <img src="https://img.shields.io/pypi/v/pre-commit?style=for-the-badge&logo=Pre-commit&logoColor=FAB041&color=FAB041">
      </a>
    </td>
    <!--::: Pyright -->
    <td align="center" width="25%">
      <a href="https://microsoft.github.io/pyright/" target="_blank">
        <img alt="Pyright" height="200" src="https://ms-pyright.gallerycdn.vsassets.io/extensions/ms-pyright/pyright/1.1.350/1707151800648/Microsoft.VisualStudio.Services.Icons.Default">
      </a>
      <a href="https://pypi.org/project/pyright/" target="_blank">
        <img src="https://img.shields.io/pypi/v/pyright?style=for-the-badge&logo=python&logoColor=B8B87E&color=B8B87E">
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
- <s>Select the `include all branches` option to include the `devcontainer` branch.</s>
  - `devcontainer` branch is included by default branch.
- Click the `Create repository` button.

### 3. Open the repository in Visual Studio Code

- Open the repository in Remote Server or Codespaces.
- Click the `Reopen in Container` button to open the repository in the devcontainer.
  - You may need to install [Docker](https://www.docker.com/) if you are using a local machine.
- A new container will be created and the repository will be opened in the new container.
  (It may take a few minutes to build the container for the first time.)
- (Optional) Click the `Reopen in Workspace` button to open the repository in the workspace.
  - Additional extensions and settings will be applied to the workspace.

### 4. Install additional dependencies

- Check [Poetry Managing Dependencies](https://python-poetry.org/docs/managing-dependencies/) for more information.
- Check [Node Package Manager](https://www.npmjs.com/) for more information.

### Done! :tada:

<br/>

---

<br/>

## :notebook_with_decorative_cover: Additional Information

### Commit Signinig with SSH (Verified Commit)

- [How to sign commits](https://docs.github.com/en/authentication/managing-commit-signature-verification/signing-commits)

> **note**
> You don't need to set up git on the devcontainer. The git configuration on the local machine will be reflected to the devcontainer automatically.

1. Generate a new SSH key and add it to your GitHub account.

   ```bash
   # Creates a new ssh key, using the provided email as a label
   ssh-keygen -t ed25519 -C "your@github_email"

   # Start the ssh-agent in the background (if not already running)
   eval "$(ssh-agent -s)"

   # Add your SSH private key to the ssh-agent
   ssh-add PATH/TO/.SSH/PRIVATE_KEY   # e.g. ~/.ssh/id_ed25519
   ```

2. Add the SSH key to your GitHub account.

   - [Adding a new SSH key to your GitHub account](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)

3. Set your user name and email address to your GitHub username and email.

   ```bash
   git config --global user.name "your_github_username"
   git config --global user.email "your@github_email"
   ```

4. Set global git configuration for signing.

   ```bash
   git config --global gpg.format ssh
   git config --global gpg.ssh.defaultKeyCommand "ssh-add -L"
   ```

5. Add following line to your settings.json in Visual Studio Code.

   ```json
   "git.enableCommitSigning": true
   ```
