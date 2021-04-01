(defun degrees_to_radians (degrees)
  (setq one_degree_in_radians (/ pi 180))
  (setq result (* degrees one_degree_in_radians))
)

(defun radians_to_degrees (radians)
  (setq one_radian_in_degrees (/ 180 pi))
  (setq result (* radians one_radian_in_degrees))
)
