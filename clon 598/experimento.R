
library(libresense)


####### dia 1 ##############
run_panel(
  products_file = "clon 598/grupo_f1/vinos_f1.csv",
  attributes_file = "clon 598/atributos.csv",
  answers_dir = "clon 598/grupo_f1/answers2",
  product_name = "CodigoProducto",
  design_file = "clon 598/grupo_f1/grupo_f1.csv",
  dest_url ="192.168.1.132:4001",
  numeric_range = c(0,3),
  numeric_step=1)

run_panel(
  products_file = "clon 713/grupo_f1/vinos_f1.csv",
  attributes_file = "clon 713/atributos.csv",
  answers_dir = "clon 713/grupo_f1/answers2",
  product_name = "CodigoProducto",
  design_file = "clon 713/grupo_f1/grupo_f1.csv",
  dest_url ="192.168.1.132:4002",
  numeric_range = c(0,3),
  numeric_step=1)


################  visor ################3
## usar run_tradacional. solo dos tratamientoe
run_board2(answers_dir = "clon 713/grupo_f1/answers",numeric_range = c(0,3))
run_board2(answers_dir = "clon 713/grupo_f1/answers2",numeric_range = c(0,3))
run_board2(answers_dir = "clon 598/grupo_f1/answers",numeric_range = c(0,3))
run_board2(answers_dir = "clon 598/grupo_f1/answers2",numeric_range = c(0,3))

run_perf(answers_dir = "clon 713/grupo_f1//answers",
         numeric_range = c(0,3))



