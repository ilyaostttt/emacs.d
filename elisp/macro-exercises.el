(defmacro my-if (condition then else)
  `(cond (,condition ,then)
         (t ,else)))

(macroexpand '(my-if (> 1 2)
                     1
                     0))

(defmacro nth-expr (n &rest expr)
  `(eval (nth (- ,n 1) '(,@expr))))

(defmacro nth-expr1 (n &rest expr)
  (let ((iter 0))
    `(cond ,@(mapcar #'(lambda (ex)
                         (setq iter (1+ iter))
                         (list `(= ,iter ,n) ex))
                     expr))))

(setq x 1)
(macroexpand '(nth-expr x (+ 0 0) (+ 1 1) (+ 3 3) (+ 4 4) (+ 5 5)))
(macroexpand '(nth-expr1 2 (+ 0 0) (+ 1 1) (+ 3 3) (+ 4 4) (+ 5 5)))

(let ((n 2))
  (nth-expr n (/ 1 0) (+ 1 2) (/ 1 0)))

(let ((n 2))
  (nth-expr1 n (/ 1 0) (+ 1 2) (/ 1 0)))

(defmacro n-of (n expr)
  (let ((res-list (make-symbol "res"))
        (i (make-symbol "ii")))
      `(let ((,res-list nil))
         (dotimes (,i ,n (reverse ,res-list))
           (setq ,res-list (cons ,expr ,res-list))))))

(macroexpand '(n-of 4 1))

(setq i 0)

(let ((i 0) (n 4))
  (n-of n (setq i (+ i 2))))

(defmacro save-vars (vars &rest body)
  `(let ,(mapcar #'(lambda (v)
                     `(,v ,v))
          vars)
     ,@body))

(let ((a 1)
      (b 2))
 (save-vars (a b)
            (setq a 11)
            (setq b 22)
            (message (format "a: %d b: %d" a b)))
 (message (format "a: %d b: %d" a b)))