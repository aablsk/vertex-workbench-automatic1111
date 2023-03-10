FROM gcr.io/deeplearning-platform-release/pytorch-gpu.1-12
RUN apt update && apt install -y libgl1-mesa-glx
RUN conda create -y -q --name py310 python=3.10 
WORKDIR /home
ADD stable-diffusion-webui ./stable-diffusion-webui
ADD start.sh .
