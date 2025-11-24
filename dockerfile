# 使用 CUDA 12.6 开发镜像（含 nvcc、cuDNN、GCC 等）
# 注意：12.6 是当前（2025年初）最稳定广泛支持的版本；12.7/12.8 可替换为对应标签（若存在）
# FROM docker.1ms.run/nvidia/cuda:12.8.0-devel-ubuntu22.04
FROM nvcr.io/nvidia/pytorch:24.10-py3


# 设置时区 & 非交互式安装
# ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Shanghai

# 安装基础开发工具 & 依赖
# RUN apt-get update && apt-get install -y --no-install-recommends \
#     build-essential \
#     cmake \
#     git \
#     wget \
#     curl \
#     ca-certificates \
#     vim \
#     htop \
#     nano \
#     libgl1-mesa-glx \
#     libglib2.0-0 \
#     && rm -rf /var/lib/apt/lists/*

# 安装 Python 3.10 + pip
# RUN apt-get update && apt-get install -y python3.10 python3.10-dev python3.10-venv \
#     && ln -sf /usr/bin/python3.10 /usr/bin/python3 \
#     && ln -sf /usr/bin/python3 /usr/bin/python \
#     && curl -sS https://bootstrap.pypa.io/get-pip.py | python3.10

# 安装常用 Python 科学计算包（可按需调整）
# RUN pip install --no-cache-dir \
#     numpy==1.26.3 \
#     # scipy \
#     pandas \
#     matplotlib \
#     jupyterlab \
#     ipykernel \
#     torch==2.6.0 --index-url https://download.pytorch.org/whl/cu126 \
#     && python -m ipykernel install --user --name cuda-env --display-name "Python (CUDA)"

# 可选：安装 OpenCV（带 CUDA 支持较复杂；这里用 CPU 版；如需 CUDA 版需手动编译）
# RUN pip install --no-cache-dir opencv-python

# 设置工作目录
WORKDIR /workspace

# 创建非 root 用户（安全最佳实践）
# RUN useradd -m -u 1000 -G sudo developer && \
#     echo "developer ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
# USER developer

# 暴露 Jupyter 端口（可选）
EXPOSE 8888

# 启动命令（可替换为 bash）
CMD ["bash"]