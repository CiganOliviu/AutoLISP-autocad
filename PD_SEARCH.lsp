(defun C:PD_ADDENTRY ( / fname lname age entry)
  
  (initget 1)
  (setq fname (getstring "\nEnter person's first name: "))
  (initget 1)
  (setq lname (getstring "\nEnter person's last name: "))
  (initget 7)
  (setq age (getint "\nEnter person's age: "))

  (setq entry (list (cons 'FN fname) (cons 'LN lname) (cons 'AGE age))
	PD_DATA (append PD_DATA (list entry))
	)
  
  (princ)
  )


(defun C:PD_LIST ( / current entry counter)
  
  (setq current PD_DATA
	counter 1)	
 
  (while current
    (setq entry (car current))

 
    (princ (strcat "\nRecord #" (itoa counter)
		   ": " (cdr (assoc 'LN entry))
		   ", " (cdr (assoc 'FN entry))
		   ". Age " (itoa (cdr (assoc 'AGE entry)))
		   )
	   )
    (setq current (cdr current)
	  counter (1+ counter)
	  )
    )

  (princ)
  )

(defun C:PD_SEARCH(/ current entry counter)

  (setq inferior_limit (getint "\nEnter inferior age: "))
  (setq superior_limit (getint "\nEnter superior age: "))
  
  (setq current PD_DATA
	counter 1)	
 
  (while current
    (setq entry (car current))

   	(if (> (cdr (assoc 'AGE entry)) inferior_limit)
    		(if (< (cdr (assoc 'AGE entry)) superior_limit)
		          (princ (strcat "\nRecord #" (itoa counter)
				   ": " (cdr (assoc 'LN entry))
				   ", " (cdr (assoc 'FN entry))
				   ". Age " (itoa (cdr (assoc 'AGE entry)))
				   )
			   )
		  )
	)

    (setq current (cdr current)
	  counter (1+ counter)
	  )
    )

  (princ)	
)