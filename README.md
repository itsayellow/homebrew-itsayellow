# homebrew-paperspace
This [Homebrew](https://brew.sh/) tap allows you to use Homebrew to install and upgrade the [Paperspace CLI](https://paperspace.github.io/paperspace-node/#paperspace-cli) in macOS.  The Paperspace CLI allows you to manage and monitor jobs on the [Paperspace](https://www.paperspace.com/) cloud computing service.

## Usage (Install Paperspace CLI)
```bash
brew tap itsayellow/paperspace
brew install paperspace-cli
```

## Maintainer Instructions

### To update libraries
```bash
mkdir test
python -m venv virt
source virt/bin/activate
pip install --upgrade pip setuptools
pip install git+https://github.com/itsayellow/pspace.git@v0.3#egg=pspace
pip install homebrew-pypi-poet
poet pspace > pspace-new.rb
```

Integrate new stanza from pspace-new.rb into pspace.rb
