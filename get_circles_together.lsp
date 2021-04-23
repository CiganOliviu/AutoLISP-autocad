
(defun get_average(sum index)

  	(setq result (/ sum index))

  	(setq result result)
)

(defun set_new_center(entities center)

    	(setq index 0)
  
	(repeat (sslength circles)

		(setq circle (entget (ssname circles index)))
	  	(setq circle (subst (cons 10 newCenter) (assoc 10 circle) circle))

		(entmod circle)

		(setq index (+ index 1))
	)
)

(defun C:MOVE_CIRCLES()
  	(setq sumOx 0)
  	(setq sumOy 0)

  	(setq circles (ssget "X" '((0 . "CIRCLE")) ))
  
  	(setq index 0)
  
  	(repeat (sslength circles)
	  
		(setq circle (entget (ssname circles index)))
	  	(setq center (cdr (assoc 10 circle)))
	  	(setq Ox (car center))
	  	(setq Oy (cadr center))
	  	(setq sumOx (+ sumOx Ox))
	  	(setq sumOy (+ sumOy Oy))

	  	(entmod circle)

	  	(setq index (+ 1 index))
  	)
  	(princ)

  	(setq centerOx (get_average sumOx index))
  	(setq centerOy (get_average sumOy index))
  
  	(setq newCenter (list centerOx centerOy 0.0))

  	(set_new_center circles newCenter)
  
  	(princ)
)
