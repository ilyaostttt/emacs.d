(setq lexical-binding t)

(eval-when-compile
  (require 'cl))

(defvar tasks [(4 . 70)
               (2 . 60)
               (4 . 50)
               (3 . 40)
               (1 . 30)
               (4 . 20)
               (6 . 10)])

(defun di (tasks i)
  (car (elt tasks i)))

(defun wi (tasks i)
  (cdr (elt tasks i)))

(defun d (task)
  (car task))

(defun w (task)
  (cdr task))

(di tasks 0)
(wi tasks 0)

(defun independent-taskp (task-set)
  (let ((task-set
         (sort* (copy-sequence task-set) '< :key 'd)))
    (let ((independent t)
          (i 0)
          (len (length task-set)))
      (while (and (< i len) independent)
        (if (< (di task-set i) i)
            (setq independent nil)
          (setq i (1+ i))))
      independent)))

(independent-taskp [(5 . 70)
                     (2 . 60)
                     (6 . 50)
                     (3 . 40)
                     (1 . 30)
                     (8 . 20)
                     (0 . 10)])

(defun greedy-optimal-subset (universum independentp weight)
  (loop with universum = (sort* (copy-sequence universum)
                                '> :key weight)
        with result = (make-vector 0 nil)
        for i across tasks
        do (let ((temp-result (vconcat result `(,i))))
             (when (funcall independentp temp-result)
               (setq result temp-result)))
        finally return result))

(defun greedy-optimal-subset-2 (universum independentp weight)
  (loop with universum = (sort* (copy-sequence universum)
                                '> :key weight)
        for i across universum
        if (funcall independentp (vconcat result `(,i)))
        vconcat (list i) into result
        finally return result))

(greedy-optimal-subset tasks 'independent-taskp 'w)
(greedy-optimal-subset-2 tasks 'independent-taskp 'w)

(defvar tasks-2 [(4 . 70)
                 (2 . 60)
                 (4 . 50)
                 (3 . 40)
                 (1 . 30)
                 (4 . 80)
                 (6 . 10)])

(sort* (copy-seq tasks-2) '< :key w)

(greedy-optimal-subset tasks-2 'independent-taskp 'w)