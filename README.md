
# micaR

`micaR` 是一个专为科研人员设计的 R 包，基于 `ggplot2`，提供符合 SCI 期刊出版要求的高质量数据可视化工具。包内函数涵盖主成分分析（PCA）、柱状图、箱线图、散点图、堆积柱状图、分组柱状图和热图，配有专属配色和主题，帮助您快速生成美观且专业的科研图表。


## 安装

```r
# 从 GitHub 安装最新开发版本：
devtools::install_github("yourusername/micaR")
```

## 使用示例

### 1. PCA 主成分分析绘图

```r
library(micaR)
library(ggplot2)

data(iris)
iris_num <- iris[, 1:4]
group <- iris$Species

p <- micar_pca(iris_num, group_var = group, ellipse = TRUE)
print(p)
```
![PCA示例图片](https://github.com/ZhijunWang1991/micaR/blob/main/example/p1.png)


### 2. 基础柱状图

```r
df <- data.frame(
  group = c("A", "B", "C"),
  value = c(3, 5, 2)
)

p <- micar_barplot(df, x = group, y = value, title = "Basic Barplot")
print(p)
```
![基础柱状图示例图片](https://github.com/ZhijunWang1991/micaR/blob/main/example/p2.png)

### 3. 箱线图

```r
df <- iris
p <- micar_boxplot(df, x = Species, y = Sepal.Length, title = "Sepal Length by Species")
print(p)
```
![箱线图示例图片](https://github.com/ZhijunWang1991/micaR/blob/main/example/p3.png)

### 4. 散点图

```r
df <- iris
p <- micar_scatterplot(df, x = Sepal.Length, y = Sepal.Width, color = Species, title = "Scatterplot with Groups")+
  micar_theme()
print(p)
```
![散点图示例图片](https://github.com/ZhijunWang1991/micaR/blob/main/example/p4.png)

### 5. 分组柱状图

```r
df <- data.frame(
  category = rep(c("Cat1", "Cat2", "Cat3"), each = 3),
  subgroup = rep(c("Sub1", "Sub2", "Sub3"), times = 3),
  value = c(2, 5, 3, 4, 6, 2, 3, 4, 5)
)

p <- micar_grouped_barplot(df, x = category, y = value, group = subgroup, title = "Grouped Barplot")+
  scale_fill_micar()
print(p)
```
![分组柱状图](https://github.com/ZhijunWang1991/micaR/blob/main/example/p5.png)

### 6. 堆积柱状图

```r
df <- data.frame(
  category = rep(c("Cat1", "Cat2", "Cat3"), each = 3),
  subgroup = rep(c("Sub1", "Sub2", "Sub3"), times = 3),
  value = c(2, 5, 3, 4, 6, 2, 3, 4, 5)
)

p <- micar_stacked_barplot(df, x = category, y = value, group = subgroup, title = "Stacked Barplot")+micar_theme()
print(p)
```
![堆积柱状图](https://github.com/ZhijunWang1991/micaR/blob/main/example/p6.png)

### 7. 热图（基于相关性矩阵）

```r
data(iris)
p <- micar_heatmap(iris[, 1:4])+micar_theme() +
  labs(title = "Heatmap of Iris Dataset Features")
print(p)
```
![热图](https://github.com/ZhijunWang1991/micaR/blob/main/example/p7.png)

### 8. 自定义配色

```r
library(ggplot2)

my_colors <- micaR::micar_palette()

ggplot(mtcars, aes(x = factor(cyl), fill = factor(gear))) +
  geom_bar(position = "dodge") +
  scale_fill_micar() +
  labs(title = "Custom Palette with micaR")
```
![配色展示](https://github.com/ZhijunWang1991/micaR/blob/main/example/p8.png)

## 主题与调色板

* `micar_theme()` 提供简洁、符合 SCI 杂志审美的基础主题。
* `scale_fill_micar()` 和 `scale_color_micar()` 是配套的调色板函数，确保可读性和美观。
