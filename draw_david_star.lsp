(defun C:DRAW_DAVID_STAR (/ star_center star_radius)

	(setq star_center (getpoint "\nChoose star center:"))
	
	(setq star_radius (getdist star_center "\nChoose star radius:"))

	(command "polygon" 3 star_center "inscribed" star_radius)

  	(command "rotate" (entlast) "" star_center "180")
  
	(command "polygon" 3 star_center "inscribed" star_radius)
)