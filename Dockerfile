FROM ros:noetic

# Instalar dependencias básicas
RUN apt update && apt install -y \
    ros-noetic-desktop-full \
    ros-noetic-turtlebot3-gazebo \
    ros-noetic-turtlebot3 \
    ros-noetic-moveit \
    python3-rosdep python3-colcon-common-extensions \
    && rm -rf /var/lib/apt/lists/*

# Configurar ROS
ENV ROS_DISTRO=noetic
ENV TURTLEBOT3_MODEL=burger

CMD ["bash"]
