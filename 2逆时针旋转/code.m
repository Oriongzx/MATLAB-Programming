% 读取图像
img = imread('image.jpg');
[height, width, channels] = size(img);

% 使用函数旋转
img_rotated1 = imrotate(img, 30, 'bilinear', 'loose');

% 定义旋转角度（30度）
theta = -30;
theta_rad = deg2rad(theta);  % 转换为弧度
% 构造旋转矩阵
rotation_matrix = [cos(theta_rad), -sin(theta_rad); sin(theta_rad), cos(theta_rad)];

% 计算旋转后的图像边界
new_width = round(abs(width * cos(theta_rad)) + abs(height * sin(theta_rad)));
new_height = round(abs(height * cos(theta_rad)) + abs(width * sin(theta_rad)));

% 创建一个较大的空图像用于存储旋转后的结果
img_rotated2 = uint8(zeros(new_height, new_width, channels));

% 计算新图像的中心点
center_x_new = new_width / 2;
center_y_new = new_height / 2;

% 计算原始图像的中心点
center_x = width / 2;
center_y = height / 2;

% 遍历每个像素位置，进行旋转映射
for y_new = 1:new_height
    for x_new = 1:new_width
        % 计算当前像素相对于新图像中心的偏移量
        offset_x_new = x_new - center_x_new;
        offset_y_new = y_new - center_y_new;
        % 逆时针旋转，得到原图像中对应的坐标
        original_pos = rotation_matrix \ [offset_x_new; offset_y_new];  % 使用反转矩阵
        original_x = round(original_pos(1) + center_x);
        original_y = round(original_pos(2) + center_y);
        % 判断新位置是否在原图像内，并进行插值
        if original_x >= 1 && original_x <= width && original_y >= 1 && original_y <= height
            img_rotated2(y_new, x_new, :) = img(original_y, original_x, :);
        end
    end
end

% 显示图片
subplot(1,2,1),imshow(img_rotated1),title('函数方法')
subplot(1,2,2),imshow(img_rotated2),title('遍历像元旋转方法')
% 保存图片
imwrite(img_rotated1, 'img_rotated.jpg');
