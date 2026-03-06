
FROM python:3.8-slim

# OpenCV ve MediaPipe için gerekli sistem paketleri
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

#ktüphane
RUN pip install --no-cache-dir opencv-python mediapipe numpy

# Tüm projeyi içeri al
COPY . .

#buraya dosya adı gelecek bilgisayarında ki
CMD ["python", "src/vision/kamera_motor.py"]
