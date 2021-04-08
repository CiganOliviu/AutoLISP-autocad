(defun get_sum(x)

  (setq end_point 20)
  (setq index 2)
  (setq result 0)

  (while (<= index end_point)
    
    (if (= (rem index 2) 0) 
      (setq result (+ result (* x index)))
    )

    (if (= (rem index 2) 1) 
      (setq result (+ result (+ x index)))
    )

    (setq index (+ 1 index))
  )

  (setq result result)
)