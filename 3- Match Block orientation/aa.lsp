;Matches Block Orientation to a selected block or to the only non zero Block
(princ "Author: Ahmed Abd-elmotey - NOV 2015 - ahmed.abdelmotey92@gmail.com")
(defun c:MZBO ()
	(setq ss (ssget) i 0 j 0)
	(while (< i (sslength ss))
		(progn
			(setq ro 
				(* 180.0 (/ (vla-get-rotation (vlax-ename->vla-object (ssname ss i))) pi))
			)
			(if (/= 0 ro) (setq rott ro))
			(setq i (1+ i))
		)
	)
	(while rott 
		(progn 
			(vla-put-rotation 
				(vlax-ename->vla-object (ssname ss j)) (* pi (/ rott 180.0))
			) 
			(setq j (1+ j))
		)
	)
	) 
(defun c:MBO ()
	(setq ro (vla-get-rotation (vlax-ename->vla-object (car (entsel "\nSelect Block Object")))))
	(setq ss (ssget) i 0)
	(repeat (sslength ss)
		(vla-put-rotation (vlax-ename->vla-object (ssname ss i)) ro)
		(setq i (1+ i))
	)
) 
