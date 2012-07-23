;; -*- coding: utf-8; lexical-binding: t -*-

(defun make-adder (a)
  #'(lambda (x)
      (+ a x)))

(setq adder (make-adder 3))
(funcall adder 2)

