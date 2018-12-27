# docker-yolo

YOLOv3 Pre-Trained Model docker image based on alpine

## Usage

```
docker build -t local/yolo .

ip=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')

docker run -it --rm -v $PWD:/code -w /darknet -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$ip:2 local/yolo sh

> ./darknet detect cfg/yolov3.cfg yolov3.weights data/dog.jpg
> mv predictions.jpg /code/

> darknet detector demo cfg/coco.data cfg/yolov3.cfg yolov3.weights <video file>

> ./darknet detector demo cfg/yolov3.cfg yolov3.weights video.mp4

#docker run -it --rm -v $PWD:/code -w /darknet local/yolo sh

```