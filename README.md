# docker-yolo

YOLOv3 Pre-Trained Model docker image based on alpine

## Usage

```
docker build -t local/yolo .
docker run -it --rm -v $PWD:/code -w /darknet local/yolo sh
> ./darknet detect cfg/yolov3.cfg yolov3.weights data/dog.jpg
> mv predictions.jpg /code/

```