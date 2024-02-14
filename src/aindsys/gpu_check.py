import sys

import torch
import torch.version


# Check if CUDA is available
cuda = torch.cuda.is_available()
print(f"CUDA is available: {cuda}")


# Get the number of GPUs
n_gpu = torch.cuda.device_count()
print(f"Number of GPUs: {n_gpu}")

# Get the name of the GPU
gpu_name = torch.cuda.get_device_name(0)
print(f"Name of the GPU: {gpu_name}")

# Get the current GPU
current_gpu = torch.cuda.current_device()
print(f"Current GPU: {current_gpu}")

# Get the GPU capability
capability = torch.cuda.get_device_capability(0)
print(f"GPU Capability: {capability}")

# Get the GPU memory
gpu_memory = torch.cuda.get_device_properties(0).total_memory
print(f"GPU Memory: {gpu_memory}")

# Get the CUDA version
cuda_version = torch.version.cuda
print(f"CUDA Version: {cuda_version}")

# Get the cuDNN version
cudnn_version = torch.backends.cudnn.version()
print(f"cuDNN Version: {cudnn_version}")

# Get the PyTorch version
pytorch_version = torch.__version__
print(f"PyTorch Version: {pytorch_version}")

# Get the Python version
python_version = sys.version
print(f"Python Version: {python_version}")

# Get the OS
os = sys.platform
print(f"OS: {os}")

# Get the device
device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
print(f"Device: {device}")

# Get the number of threads
threads = torch.get_num_threads()
print(f"Number of threads: {threads}")
print(f"Number of threads: {threads}")
