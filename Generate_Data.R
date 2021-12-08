set.seed(400)
library(tidyverse)

#Convert average season1 rating to probability
imbd_new <- imbd_data %>%
  mutate(p_season1 = season1/10)

#Generate n season1 ratings for each show
m <- nrow(imbd_data)
n <- 1000

season1_generated <- matrix(NA, nrow=n, ncol=m)
for(i in 1:m){
  show_ratings <- rbinom(n,10,imbd_new$p_season1[i])
  season1_generated[,i] <- show_ratings
}


#Check to see difference in mean of season1 generated ratings vs. actual mean for each show
diff_mean_gen_orig <- mean(imbd_data$season1 - colMeans(season1_generated))
diff_mean_gen_orig
##This not accurate----need to deal with 0 values, this is decreasing mean score having them in


#---------------------------------------------------------------------------------------------------------


#Genertate season2 ratings for no assumption (all equal probabilities based on season1)
baseline_matrix <- matrix(c(rep(1/11,121)), nrow = 11, ncol = 11)


season2_generated_baseline <- matrix(NA, nrow=n, ncol=m)
for(i in 1:m){
  for(j in 1:n){
    if(season1_generated[j,i] == 0){
      show_ratings <- sample(0:10, size = 1, replace = TRUE, prob = baseline_matrix[1,])
      season2_generated_baseline[j,i] <- show_ratings
    }
    else if(season1_generated[j,i] == 1){
      show_ratings <- sample(0:10, size = 1, replace = TRUE, prob = baseline_matrix[2,])
      season2_generated_baseline[j,i] <- show_ratings
    }
    else if(season1_generated[j,i] == 2){
      show_ratings <- sample(0:10, size = 1, replace = TRUE, prob = baseline_matrix[3,])
      season2_generated_baseline[j,i] <- show_ratings
    }
    else if(season1_generated[j,i] == 3){
      show_ratings <- sample(0:10, size = 1, replace = TRUE, prob = baseline_matrix[4,])
      season2_generated_baseline[j,i] <- show_ratings
    }
    else if(season1_generated[j,i] == 4){
      show_ratings <- sample(0:10, size = 1, replace = TRUE, prob = baseline_matrix[5,])
      season2_generated_baseline[j,i] <- show_ratings
    }
    else if(season1_generated[j,i] == 5){
      show_ratings <- sample(0:10, size = 1, replace = TRUE, prob = baseline_matrix[6,])
      season2_generated_baseline[j,i] <- show_ratings
    }
    else if(season1_generated[j,i] == 6){
      show_ratings <- sample(0:10, size = 1, replace = TRUE, prob = baseline_matrix[7,])
      season2_generated_baseline[j,i] <- show_ratings
    }
    else if(season1_generated[j,i] == 7){
      show_ratings <- sample(0:10, size = 1, replace = TRUE, prob = baseline_matrix[8,])
      season2_generated_baseline[j,i] <- show_ratings
    }
    else if(season1_generated[j,i] == 8){
      show_ratings <- sample(0:10, size = 1, replace = TRUE, prob = baseline_matrix[9,])
      season2_generated_baseline[j,i] <- show_ratings
    }
    else if(season1_generated[j,i] == 9){
      show_ratings <- sample(0:10, size = 1, replace = TRUE, prob = baseline_matrix[10,])
      season2_generated_baseline[j,i] <- show_ratings
    }
    else if(season1_generated[j,i] == 10){
      show_ratings <- sample(0:10, size = 1, replace = TRUE, prob = baseline_matrix[11,])
      season2_generated_baseline[j,i] <- show_ratings
    }
  }
}

#---------------------------------------------------------------------------------------------------------

#Genertate season2 ratings for cutoff assumption (assume rate within +-1 of season 1 rating)
v0 <- c(3/4, 1, 1, 1, 6/10, 5/10, 4/10, 3/10, 2/10, 1/10, 0)
v1 <- c(0.025, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
v2 <- c(0.025, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
v3 <- c(0.025, 0, 0, 0, 2/15, 0, 0, 0, 0, 0, 0)
v4 <- c(0.025, 0, 0, 0, 2/15, 1/6, 0, 0, 0, 0, 0)
v5 <- c(0.025, 0, 0, 0, 2/15, 1/6, 1/5, 0, 0, 0, 0)
v6 <- c(0.025, 0, 0, 0, 0, 1/6, 1/5, 7/30, 0, 0, 0)
v7 <- c(0.025, 0, 0, 0, 0, 0, 1/5, 7/30, 4/15, 0, 0)
v8 <- c(0.025, 0, 0, 0, 0, 0, 0, 7/30, 4/15, 3/10, 0)
v9 <- c(0.025, 0, 0, 0, 0, 0, 0, 0, 4/15, 3/10, 1/2)
v10 <- c(0.025, 0, 0, 0, 0, 0, 0, 0, 0, 3/10, 1/2)
cutoff_matrix <- cbind(v0,v1,v2,v3,v4,v5,v6,v7,v8,v9,v10)

season2_generated_cutoff <- matrix(NA, nrow=n, ncol=m)
for(i in 1:m){
  for(j in 1:n){
    if(season1_generated[j,i] == 0){
      show_ratings <- sample(0:10, size = 1, replace = TRUE, prob = cutoff_matrix[1,])
      season2_generated_cutoff[j,i] <- show_ratings
    }
    else if(season1_generated[j,i] == 1){
      show_ratings <- sample(0:10, size = 1, replace = TRUE, prob = cutoff_matrix[2,])
      season2_generated_cutoff[j,i] <- show_ratings
    }
    else if(season1_generated[j,i] == 2){
      show_ratings <- sample(0:10, size = 1, replace = TRUE, prob = cutoff_matrix[3,])
      season2_generated_cutoff[j,i] <- show_ratings
    }
    else if(season1_generated[j,i] == 3){
      show_ratings <- sample(0:10, size = 1, replace = TRUE, prob = cutoff_matrix[4,])
      season2_generated_cutoff[j,i] <- show_ratings
    }
    else if(season1_generated[j,i] == 4){
      show_ratings <- sample(0:10, size = 1, replace = TRUE, prob = cutoff_matrix[5,])
      season2_generated_cutoff[j,i] <- show_ratings
    }
    else if(season1_generated[j,i] == 5){
      show_ratings <- sample(0:10, size = 1, replace = TRUE, prob = cutoff_matrix[6,])
      season2_generated_cutoff[j,i] <- show_ratings
    }
    else if(season1_generated[j,i] == 6){
      show_ratings <- sample(0:10, size = 1, replace = TRUE, prob = cutoff_matrix[7,])
      season2_generated_cutoff[j,i] <- show_ratings
    }
    else if(season1_generated[j,i] == 7){
      show_ratings <- sample(0:10, size = 1, replace = TRUE, prob = cutoff_matrix[8,])
      season2_generated_cutoff[j,i] <- show_ratings
    }
    else if(season1_generated[j,i] == 8){
      show_ratings <- sample(0:10, size = 1, replace = TRUE, prob = cutoff_matrix[9,])
      season2_generated_cutoff[j,i] <- show_ratings
    }
    else if(season1_generated[j,i] == 9){
      show_ratings <- sample(0:10, size = 1, replace = TRUE, prob = cutoff_matrix[10,])
      season2_generated_cutoff[j,i] <- show_ratings
    }
    else if(season1_generated[j,i] == 10){
      show_ratings <- sample(0:10, size = 1, replace = TRUE, prob = cutoff_matrix[11,])
      season2_generated_cutoff[j,i] <- show_ratings
    }
  }
}


#---------------------------------------------------------------------------------------------------------

#Genertate season2 ratings -- season1 extreme rating more likely to rate season2 (if 0 for season1, uniform for season 2 prob)
w0 <- c(3/4, 0, 1/10, 2/10, 4/10, 9/10, 9/10, 4/10, 2/10, 1/10, 0)
w1 <- c(0.025, 1/2, 3/10, 0, 0, 0, 0, 0, 0, 0, 0)
w2 <- c(0.025, 1/2, 3/10, 4/15, 0, 0, 0, 0, 0, 0, 0)
w3 <- c(0.025, 0, 3/10, 4/15, 1/5, 0, 0, 0, 0, 0, 0)
w4 <- c(0.025, 0, 0, 4/15, 1/5, 1/30, 0, 0, 0, 0, 0)
w5 <- c(0.025, 0, 0, 0, 1/5, 1/30, 1/30, 0, 0, 0, 0)
w6 <- c(0.025, 0, 0, 0, 0, 1/30, 1/30, 1/5, 0, 0, 0)
w7 <- c(0.025, 0, 0, 0, 0, 0, 1/30, 1/5, 4/15, 0, 0)
w8 <- c(0.025, 0, 0, 0, 0, 0, 0, 1/5, 4/15, 3/10, 0)
w9 <- c(0.025, 0, 0, 0, 0, 0, 0, 0, 4/15, 3/10, 1/2)
w10 <- c(0.025, 0, 0, 0, 0, 0, 0, 0, 0, 3/10, 1/2)
parabolic_matrix <- cbind(w0,w1,w2,w3,w4,w5,w6,w7,w8,w9,w10)

season2_generated_parabolic <- matrix(NA, nrow=n, ncol=m)
for(i in 1:m){
  for(j in 1:n){
    if(season1_generated[j,i] == 0){
      show_ratings <- sample(0:10, size = 1, replace = TRUE, prob = parabolic_matrix[1,])
      season2_generated_parabolic[j,i] <- show_ratings
    }
    else if(season1_generated[j,i] == 1){
      show_ratings <- sample(0:10, size = 1, replace = TRUE, prob = parabolic_matrix[2,])
      season2_generated_parabolic[j,i] <- show_ratings
    }
    else if(season1_generated[j,i] == 2){
      show_ratings <- sample(0:10, size = 1, replace = TRUE, prob = parabolic_matrix[3,])
      season2_generated_parabolic[j,i] <- show_ratings
    }
    else if(season1_generated[j,i] == 3){
      show_ratings <- sample(0:10, size = 1, replace = TRUE, prob = parabolic_matrix[4,])
      season2_generated_parabolic[j,i] <- show_ratings
    }
    else if(season1_generated[j,i] == 4){
      show_ratings <- sample(0:10, size = 1, replace = TRUE, prob = parabolic_matrix[5,])
      season2_generated_parabolic[j,i] <- show_ratings
    }
    else if(season1_generated[j,i] == 5){
      show_ratings <- sample(0:10, size = 1, replace = TRUE, prob = parabolic_matrix[6,])
      season2_generated_parabolic[j,i] <- show_ratings
    }
    else if(season1_generated[j,i] == 6){
      show_ratings <- sample(0:10, size = 1, replace = TRUE, prob = parabolic_matrix[7,])
      season2_generated_parabolic[j,i] <- show_ratings
    }
    else if(season1_generated[j,i] == 7){
      show_ratings <- sample(0:10, size = 1, replace = TRUE, prob = parabolic_matrix[8,])
      season2_generated_parabolic[j,i] <- show_ratings
    }
    else if(season1_generated[j,i] == 8){
      show_ratings <- sample(0:10, size = 1, replace = TRUE, prob = parabolic_matrix[9,])
      season2_generated_parabolic[j,i] <- show_ratings
    }
    else if(season1_generated[j,i] == 9){
      show_ratings <- sample(0:10, size = 1, replace = TRUE, prob = parabolic_matrix[10,])
      season2_generated_parabolic[j,i] <- show_ratings
    }
    else if(season1_generated[j,i] == 10){
      show_ratings <- sample(0:10, size = 1, replace = TRUE, prob = parabolic_matrix[11,])
      season2_generated_parabolic[j,i] <- show_ratings
    }
  }
}
 
