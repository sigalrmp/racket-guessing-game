#lang racket
(define (process-guess g n)
  (cond
    [(= g n) (begin (printf "That's correct! You win!!~n") #t)]
    [(< g n) (begin (printf "Too small~n") #f)]
    [(> g n) (begin (printf "Too big~n") #f)]))

(define (read-guess min max)
  (define g (read))
  (if (is-valid g min max)
      g
      (begin
        (printf "Your guess is invalid. Remember, it must be an integer between ~s and ~s.~n" min max)
        (read-guess min max))))
        
(define (is-valid g min max)
  (and (integer? g) (<= g max) (>= g min)))

(define (round n min max rem-guesses)
  (printf "You have ~s guesses remaining~n" rem-guesses)
  (process-guess (read-guess min max) n))

(define (play-h n min max rem-guesses)
  (cond
    [(= rem-guesses 0) (printf "You have no guesses left. The number was ~s~n" n)]
    [(not (round n min max rem-guesses)) (play-h n min max (- rem-guesses 1))]))

(define (play)
  (printf "Try to guess the random number between 0 and 99!~n~n")
  (play-h (random 100) 0 99 7))

(play)