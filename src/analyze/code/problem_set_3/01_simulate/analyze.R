main <- function() {

  # 運動神経 X のデータを生成
  set.seed(123)
  X = rnorm(500, mean = 3, sd = sqrt(2))

  # Y(試合で得点できるか) X + ε が4以上なら 1を返す
  set.seed(456)
  Y = ifelse(X + rnorm(500, mean = 0, sd = 1) >= 4, 1, 0)

  # Speed, Shoot, Height, Age, Teamwork のデータを生成
  set.seed(789)
  Speed = X + rnorm(500, mean = 0, sd = 1)

  set.seed(101112)
  Shoot = X + rnorm(500, mean = 0, sd = 1)

  set.seed(131415)
  Height = X + rnorm(500, mean = 0, sd = 1)

  set.seed(161718)
  Age = X + rnorm(500, mean = 0, sd = 1)

  set.seed(192021)
  Teamwork = X + rnorm(500, mean = 0, sd = 1)

  # 収入Z = Teamkwork + 0.5 * Shoot + 0.5 * Speed + η
  set.seed(222324)
  Z = Teamwork + 0.5 * Shoot + 0.5 * Speed + rnorm(500, mean = 0, sd = 1)

  # データフレームを作成
  simulate_dataset = data.frame(X, Y, Speed, Shoot, Height, Age, Teamwork, Z)

  save(simulate_dataset, file = basics$get_absolute_path("src/analyze/output/data/simulate_dataset.rda"))

}

box::use(functions/basics)
box::use(functions/plot_modules)
box::use(functions/df_modules)

main()
