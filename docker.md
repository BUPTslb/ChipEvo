Load Container Image Using Singularity
Singularity is a container solution, it can be used to load Docker and Singularity Image.
Available in all Linux, GPGPU and HPC hosts.
Singularity is a container solution created by necessity for scientific and application driven workloads. Singularity containers are designed to be as portable as possible, spanning many flavors and vintages of Linux. Within the container, there are almost no limitations aside from basic binary compatibility. Each Singularity image includes all of the application’s necessary run-time libraries and can even include the required data and files for a particular application to run. This encapsulation of the entire user-space environment facilitates not only portability but also reproducibility. You can bring with you a stack of software, libraries, and a Linux operating system that is independent of the host computer you run the container on.

We will introduce some basic knowledge about how to use singularity in the following section. You may also refer to official Singularity User Guide.

Our servers are running Singularity version 3.4.

Singularity Container Image

By default, Singularity containers are read-only image file that usually ends in .sif(Singularity Image Format). You can copy the singularity image file directly from others pre-build containers with any copy file command like cp. You can also pull the container from Docker Hub or Singularity Hub repositories. Based on the container in the repositories, you may customize your own container desired for your job nature.

Reminder: You should set your singularity temp and cache folder before pulling any docker/singularity container image.

For bash
$ export SINGULARITY_CACHEDIR=[your home directory/big data storage]/cache
$ export SINGULARITY_LOCALCACHEDIR=[your home directory/big data storage]/localcache
$ export SINGULARITY_TMPDIR=[your home directory/big data storage]/tmp

For csh/tcsh
$ setenv SINGULARITY_CACHEDIR [your home directory/big data storage]/cache
$ setenv SINGULARITY_LOCALCACHEDIR [your home directory/big data storage]/localcache
$ setenv SINGULARITY_TMPDIR [your home directory/big data storage]/tmp

Pulling Singularity Container

If you encounter problem that mksquashfs is not found when you pulling singularity container.
Please run the following command.
$ export PATH=”$PATH:/usr/sbin”

#From Docker Hub
$ singularity pull docker://ubuntu:latest

#From Singularity Hub
$ singularity pull shub://singularityhub/hello-world

You may pull the container images from Docker Hub or Singularity Hub into your home directory/big data storage.

Access Data Inside Container

By default, Singularity will bind several directories in the container. The container will be able to access those resources located in following directories:
$PWD
$HOME
/tmp
/var/tmp

If your data is located in other directories you may use –B option to bind the directories in the container.
# Folder /here_is_testing is in the host and /temp is in the container
$ singularity shell –B /here_is_testing:/temp my_container.sif

You can bind the directory every time you run Singularity by setting environment variable
For bash
$ export SINGULARITY_BIND=”/here_is_testing:/temp”

For csh/tcsh
$ setenv SINGULARITY_BIND ”/here_is_testing:/temp”

Singularity Login Docker Repositories

If the Docker repositories require to log in, you can sign in using.
For bash
$ export SINGULARITY_DOCKER_USERNAME=’username’
$ export SINGULARITY_DOCKER_PASSWORD=’password_or_API_Key’

For csh/tcsh
$ setenv SINGULARITY_DOCKER_USERNAME ‘username’
$ setenv SINGULARITY_DOCKER_PASSWORD ‘password_or_API_Key’

Running Singularity Container

Use singularity shell to run any command interactively inside the container.
$ singularity shell singularity.sif

If you are require to use the GPU resources with the singularity container, you are require to add the parameter –nv.
$ singularity exec –nv singularity.sif python pythonscript.py

Reminder: Please remember to bind the CUDA driver into the container if you need to use GPU. If you set up an environment variable on the host, the environment variable will be valid in the container

Example: work with tensorflow v1.15.0
For bash
$ export SINGULARITY_BIND=”/usr/local/cuda-10.0:/usr/local/cuda,/usr/local/cuda-10.1/:/usr/local/cuda-10.1″
$ export LD_LIBRARY_PATH=”/usr/local/cuda/lib64/:/.singularity.d/libs:/usr/local/cuda-10.1/lib64/”

For csh/tcsh
$ setenv SINGULARITY_BIND “/usr/local/cuda-10.0:/usr/local/cuda,/usr/local/cuda-10.1/:/usr/local/cuda-10.1/”
$ setenv LD_LIBRARY_PATH “/usr/local/cuda/lib64/:/.singularity.d/libs:/usr/local/cuda-10.1/lib64/”

Running Singularity Container with Slurm

You can use the singularity container with slurm.

$ salloc -p [partition name] –qos=[gpu/hpc] –c [cpu cores] –gres=gpu:[gpu number]
$ srun -p [partition name] –qos=[gpu/hpc] –c [cpu cores] –gres=gpu:[gpu number] singularity exec –nv [singularity image] [command to be executed]

Example:
Allocate 10 cores and 2 gpu
$ salloc –p gpu_2h –qos=gpu –c 10 –gres=gpu:2
$ srun -p gpu_2h –qos=gpu -c 10 –gres=gpu:2 singularity exec –nv tensorflow_1.15.0.sif python models/tutorials/image/mnist/convolutional.py

Create Singularity Container

If the Docker Hub or Singularity Hub does not have the container meeting your requirement, you can build the singularity image on your own.

To make your own container, you should have a Linux machine where Singularity is installed and you have the administrative privileges.

To start building a singularity container, we usually use a recipes file to define the container specification. If you define the recipes file as custom.recipes, you can build you container using the following command with administrative privileges(root right):

# singularity build my_container.sif custom.recipes

Building a singularity container requires advanced knowledge on Linux command and shell scripting. If the container built by others already fulfill your needs, we do not recommend to build your own container.
Sample Singularity recipe file can be found here.

Reminder: Test your container before job submission. You can test it in interactive mode or batch mode. It is important to test if the container works as you expect, especially when your application utilizes GPU.