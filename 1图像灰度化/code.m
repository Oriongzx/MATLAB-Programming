% 读取图像
img = imread('image.jpg');
% 使用函数将彩色图像转为灰度图像
img_gray1 = rgb2gray(img);
% 提取R、G、B值
R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);
% 使用公式将彩色图像转为灰度图像
img_gray2 = 0.299*R+0.587*G+0.114*B ;
% 显示图片
subplot(1,2,1),imshow(img_gray1),title('函数方法')
subplot(1,2,2),imshow(img_gray2),title('公式方法')
% 保存图片
imwrite(img_gray1, 'gray_image.jpg');