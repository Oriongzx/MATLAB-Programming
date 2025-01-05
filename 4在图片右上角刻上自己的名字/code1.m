% 读取图像
img = imread('image.jpg');

% 获取图像的尺寸
[height, width, ~] = size(img);

% 在图像上添加文本
position = [width - 100, 0];  % 右上角位置（可以根据需要调整位置）

% 使用 insertText 将文本添加到图像上，并去除背景框
img_with_name = insertText(img, position, '郭子筱', 'FontSize', 24, 'TextColor', 'white', 'Font', 'SimSun', 'BoxOpacity', 0);

% 显示添加名字后的图像
imshow(img_with_name);
title('添加名字后的图像');

% 保存修改后的图像
imwrite(img_with_name, 'img_with_name1.jpg');
