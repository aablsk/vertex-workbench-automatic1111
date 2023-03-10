#!/bin/bash
echo What username do you want to use for access to the UI?
read username
echo What password do you want to use for access to the UI?
read password

source /opt/conda/bin/activate py310
/home/stable-diffusion-webui/webui.sh --share --gradio-auth $username:$password --enable-insecure-extension-access
