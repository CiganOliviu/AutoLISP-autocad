(defun projdist (p0 p1)
	 (list (abs (- (car p0) (car p1))) 
	 (abs (- (cadr p0) (cadr p1))) 
	 )
 ) 

(defun C:CIRCLEC (/ radius start_rectangle_point cmdecho)
  	
	(setq start_rectangle_point (getpoint "Pick first point of rectangle"))
  	(setq second_rectangle_point (getcorner start_rectangle_point "Pick second point of rectangle"))
  
  	(setq width (projdist start_rectangle_point second_rectangle_point))
  	(setq part_one (car width))
  	(setq part_two (cadr width))

  	(setq least_size (min part_one part_two))

  	(setq center (getpoint "Set radius center"))
  	(setq radius (getdist center "Set radius for circle"))

  	(while (> radius (/ least_size 2))
	  	(setq center (getpoint "Set radius center"))
  		(setq radius (getdist center "Set radius for circle"))	
   	)
	  
	(command "circle" center radius)
 )