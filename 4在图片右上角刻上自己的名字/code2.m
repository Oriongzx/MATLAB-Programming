% 读取两张图像
img = imread('image.jpg');
name = imread('name.jpg');
% 获取两张图像的尺寸
[img_height, img_width, ~] = size(img);
[name_height, name_width, ~] = size(name);

start_x = 400;  % 大图区域的起始x坐标
start_y = 10;  % 大图区域的起始y坐标

% 确保选定的区域不超出大图的边界
if start_x + name_width - 1 > img_width
    start_x = img_width - name_width + 1;  % 修正起始x坐标
end
if start_y + name_height - 1 > img_height
    start_y = img_height - name_height + 1;  % 修正起始y坐标
end

% 提取大图中的对应区域
img_region = img(start_y:start_y+name_height-1, start_x:start_x+name_width-1, :);

% 将两个图像的该区域逐元素相乘
img_with_name2 = img_region + name;

% 将相乘后的结果放回到大图中的对应区域
img(start_y:start_y+name_height-1, start_x:start_x+name_width-1, :) = img_with_name2;

% 显示修改后的大图
imshow(img);
title('相乘后的大图');

% 保存修改后的大图
imwrite(img, 'img_with_name2.jpg');