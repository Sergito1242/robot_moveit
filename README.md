#  Simulación TurtleBot3 con SLAM en Docker (ROS Noetic)

##  Descripción
El segundo ejemplo del punto 1 consiste en un robot móvil simulado que integra sensores LIDAR y emplea el algoritmo SLAM (gmapping) para mapear su entorno en tiempo real. Este enfoque permite que el robot, sin conocimiento previo del entorno, genere un mapa a medida que se desplaza, lo cual es fundamental para aplicaciones de navegación autónoma y exploración. El entorno se ejecuta mediante ROS Noetic y Gazebo, aprovechando el modelo TurtleBot3 y sus paquetes oficiales. El control del robot se realiza a través del teclado, y la información sensorial se visualiza en RViz, permitiendo observar el proceso de construcción del mapa.
Para el punto 3 de este proyecto permite ejecutar una simulación completa del robot TurtleBot3 usando ROS Noetic dentro de un contenedor Docker, incluyendo:

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

###Paso 2: Construir imagen con docker

```bash
docker build -t turtlebot3_slam:noetic .

###Paso 3: Ejecutar contenedor
```bash
xhost +local:root
docker run -it --privileged --net=host \
  -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v $HOME/.ros:/root/.ros \
  -v $HOME/turtlebot3_ws:/root/catkin_ws \
  --name tb3_slam \
  turtlebot3_slam:noetic
###Paso 4: abrir contenedor y ejecutar
####1
```bash
apt update
apt install -y \
  ros-noetic-turtlebot3-gazebo \
  ros-noetic-turtlebot3-slam \
  ros-noetic-turtlebot3-description \
  ros-noetic-turtlebot3-teleop \
  ros-noetic-gmapping```
####2
```bash
echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
echo "export TURTLEBOT3_MODEL=burger" >> ~/.bashrc
source ~/.bashrc```
###Paso 3: Ejecutar las terminales.
 terminal 1:```bash
roslaunch turtlebot3_gazebo turtlebot3_world.launch```
terminal 2: ```bash
roslaunch turtlebot3_slam turtlebot3_slam.launch slam_methods:=gmapping```
terminal 3: ```bash
roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch```
