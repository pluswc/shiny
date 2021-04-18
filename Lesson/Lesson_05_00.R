
# Lesson 5. Use R scipts and data -----------------------------------------

# shiny에서 데이터, Rscript, package를 불러와서 사용하는 방법을 알아보도록 하자.
# 미국 인구데이터 이용

# load counties.rds dataset
# 미국군 이름
# 총 인구
# 거주중인 인종 비율

counties <- readRDS('./Lesson/data/counties.rds')
head(counties)


# source helpers.R
# 인구밀도 지도(choropleth maps)를 그리는데 필요한 함수 'percent_map' 함수가 작성된 script
install.packages(c('maps', 'mapproj'))
library(maps)
library(mapproj)
source('./Lesson/helpers.R')

# percent_map 함수의 인수
# var	          a column vector from the counties.rds dataset
# color	        any character string you see in the output of colors()
# legend.title	A character string to use as the title of the plot’s legend
# max	          A parameter for controlling shade range (defaults to 100)
# min	          A parameter for controlling shade range (defaults to 0)

percent_map(counties$white, "darkgreen", '% White')

# Shiny에서는 server가 실행되는 곳이 working directory로 인싣됨
