# Sử dụng Python runtime chính thức như là hình ảnh cơ sở
FROM python:3.10

# Thiết lập các biến môi trường
ENV PYTHONUNBUFFERED 1

# Thiết lập thư mục làm việc trong container
WORKDIR /code

# Sao chép file requirements vào thư mục làm việc
COPY requirements.txt /code/

# Cài đặt các phụ thuộc của dự án
RUN pip install -r requirements.txt

# Sao chép mã nguồn dự án vào thư mục làm việc
COPY . /code/

# Mở cổng mà ứng dụng Django chạy
EXPOSE 8000

# Chạy máy chủ phát triển Django
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]