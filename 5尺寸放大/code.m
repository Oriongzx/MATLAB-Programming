% 读取图像
img = imread('image.jpg');

% 使用 imresize 函数将图像放大为原来的两倍
img_resized1 = imresize(img, 2);
% 获取图像的尺寸
[height, width, channels] = size(img);

% 创建一个新的空图像，尺寸为原图的两倍
img_resized2 = uint8(zeros(2 * height, 2 * width, channels));

% 遍历原图像素并复制到新图像
for y = 1:height
    for x = 1:width
        % 在放大后的图像中，每个像素复制为 2x2 的区域
        img_resized2(2*y-1, 2*x-1, :) = img(y, x, :);
        img_resized2(2*y-1, 2*x, :) = img(y, x, :);
        img_resized2(2*y, 2*x-1, :) = img(y, x, :);
        img_resized2(2*y, 2*x, :) = img(y, x, :);
    end
end
% 显示原图和放大后的图像
figure,imshow(img),title('原图像');
figure,imshow(img_resized1),title('函数方法');
figure,imshow(img_resized2),title('遍历像元方法');
% 保存放大后的图像
imwrite(img_resized1, 'img_resized.jpg');