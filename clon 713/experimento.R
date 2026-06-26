
library(libresense)
library(tidyverse)

####### dia 1 ##############
run_panel(
  products_file = "grupo_f1/vinos_f1.csv",
  attributes_file = "atributos.csv",
  answers_dir = "grupo_f1/answers",
  product_name = "CodigoProducto",
  design_file = "grupo_f1/grupo_f1.csv",
  dest_url ="192.168.1.121:4000",
  numeric_range = c(0,5),
  numeric_step=1)

run_panel(
  products_file = "clon 713/grupo_f1/vinos_f1.csv",
  attributes_file = "clon 713/atributos.csv",
  answers_dir = "clon 713/grupo_f1/answers",
  product_name = "CodigoProducto",
  design_file = "clon 713/grupo_f1/grupo_f1.csv",
  numeric_range = c(0,3),
  dest_url ="192.168.1.132:4002",
  numeric_step=1)


################  visor ################3
## usar run_tradacional. solo dos tratamientoe
run_board2(answers_dir = "clon 713/grupo_f1/answers",numeric_range = c(0,5))
run_perf(answers_dir = "clon 713/grupo_f1//answers",
         numeric_range = c(0,5))



