#!/bin/bash
export PKG_CONFIG_PATH="$(brew --prefix python3)/Frameworks/Python.framework/Versions/3.4/lib/pkgconfig"

# add pip install --user bin directory to $PATH
python_base_with_quotes=$(python -m site | grep USER_BASE | awk '{print $2}')
python_base="${python_base_with_quotes%\'}"
python_base="${python_base#\'}"
export PATH="$PATH:$python_base/bin"
