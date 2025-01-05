% 读取图像
img = imread('image.jpg');
% 函数上下镜像
img_flipped1 = flipud(img);
% 遍历像元上下镜像
% 获取图像的高度、宽度和通道数
[height, width, channels] = size(img);
% 创建一个新的空图像用于存储镜像后的结果
img_flipped2 = uint8(zeros(height, width, channels));
% 遍历每一行，将原图像的每一行复制到翻转位置
for y = 1:height
    img_flipped2(height - y + 1, :, :) = img(y, :, :);
end
% 显示图片
subplot(1,2,1), imshow(img_flipped1), title('函数方法');
subplot(1,2,2), imshow(img_flipped2), title('遍历像元方法');
% 保存镜像后的图像
imwrite(img_flipped1, 'img_flipped.jpg');