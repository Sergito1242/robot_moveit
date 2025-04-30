#  Simulación TurtleBot3 con SLAM en Docker (ROS Noetic)

##  Descripción
Este proyecto permite ejecutar una simulación completa del robot TurtleBot3 usando ROS Noetic dentro de un contenedor Docker, incluyendo:

-  Simulación en Gazebo 
-  SLAM con gmapping 
-  Navegación autónoma 
-  Control por teclado
-  Visualización en RViz

## 🖥️Requisitos del Sistema
| Componente | Requerimiento Mínimo |
|------------|----------------------|
| Sistema Operativo | Ubuntu 20.04/22.04 (recomendado) |
| Docker | Versión 20.10+ |
| Hardware | CPU 4 núcleos, 8GB RAM, GPU dedicada (opcional) |
| Dependencias | X11, Nvidia Docker (opcional para aceleración GPU) |

##  Configuración Inicial

### 1. Instalar dependencias
```bash
sudo apt-get update
sudo apt-get install -y x11-xserver-utils git docker.io

Paso 2: Construir imagen con docker

docker build -t turtlebot3_slam:noetic .

Paso 3: Ejecutar contenedor
xhost +local:root
docker run -it --privileged --net=host \
  -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v $HOME/.ros:/root/.ros \
  -v $HOME/turtlebot3_ws:/root/catkin_ws \
  --name tb3_slam \
  turtlebot3_slam:noetic
Paso 4: abrir contenedor y ejecutar 1
apt update
apt install -y \
  ros-noetic-turtlebot3-gazebo \
  ros-noetic-turtlebot3-slam \
  ros-noetic-turtlebot3-description \
  ros-noetic-turtlebot3-teleop \
  ros-noetic-gmapping
y 2
echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
echo "export TURTLEBOT3_MODEL=burger" >> ~/.bashrc
source ~/.bashrc
Paso 3: Ejecutar las terminales, terminal 1:roslaunch turtlebot3_gazebo turtlebot3_world.launch
terminal 2: roslaunch turtlebot3_slam turtlebot3_slam.launch slam_methods:=gmapping
terminal 3: roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch
