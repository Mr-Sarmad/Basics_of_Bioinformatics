### Implement a Markov Model to Generate Random DNA Sequences

set.seed(123)

# Transition probability matrix
transition_matrix <- matrix(c(0.3, 0.2, 0.2, 0.3,
                              0.2, 0.3, 0.3, 0.2,
                              0.3, 0.2, 0.2, 0.3,
                              0.2, 0.3, 0.3, 0.2),
                            nrow = 4, byrow = TRUE,
                            dimnames = list(c("A", "C", "G", "T"), c("A", "C", "G", "T")))

# Function to generate sequence
generate_sequence <- function(length = 100, start_base = "A") {
  sequence <- c(start_base)
  for (i in 2:length) {
    current_base <- sequence[i - 1]
    next_base <- sample(c("A", "C", "G", "T"), 1, prob = transition_matrix[current_base, ])
    sequence <- c(sequence, next_base)
  }
  paste(sequence, collapse = "")
}

# Generate DNA sequence
random_sequence <- generate_sequence(100)
print(random_sequence)
