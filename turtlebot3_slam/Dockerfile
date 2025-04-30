FROM ros:noetic

ENV DEBIAN_FRONTEND=noninteractive

# Configurar locales
RUN apt update && apt install -y locales && \
    locale-gen en_US en_US.UTF-8 && \
    update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8

ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

# Instalar paquetes de TurtleBot3 y SLAM
RUN apt update && apt install -y \
    ros-noetic-turtlebot3-gazebo \
    ros-noetic-turtlebot3-slam \
    ros-noetic-turtlebot3-msgs \
    ros-noetic-turtlebot3-navigation \
    ros-noetic-turtlebot3-teleop \
    && rm -rf /var/lib/apt/lists/*

# Configuración del modelo
ENV TURTLEBOT3_MODEL=burger

# Comando por defecto
CMD ["bash"]
