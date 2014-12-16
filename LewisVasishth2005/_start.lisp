
;; Run if something changed in ACT-R files:
(push :actr-recompile *features*)
;; Compile for faster processing:
(push :actr-fast *features*)

;; Set Working directory (not necessarily necessary):
; (setf *default-pathname-defaults* #P"/PATH_TO_YOUR_WORKSPACE/ACTR-SentenceParser-EM/LewisVasishth2005/")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Run ACT-R and load the model:
(load "../actr6/load-act-r-6.lisp")
(load "sp-lv05.lisp")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; In case environment should be used:
(run-environment)
; (run-program "open" '("sp/actr6/environment/Start\ Environment\ OSX.app"))
; (start-environment)




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; SOME EXAMPLES
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;
;;; Demos
;;;
(demo)
(demo '(:lf 0.8))
(demo1)
(demo2)


;;;
;;; Print information
;;;
(print-params)
(print-interface-params)
(print-runtime-vars)
(parsing-print-info)


;;;
;;; Useful functions
;;;
(rl) 				;; reload model files
(clear-sp) 	;; reload all files
(delete-output)
;; Change trace output:
(setprint full)
(setprint firing)
(setprint notrace)
(setprint off)
(setprint default)


;;;
;;; Run sentences
;;;
(ps *gg-sr*) 
(ps *gg-or* :params '(:lf 0.8)) 
;; For better eye movement presentation:
(setf *real-time* T)


;;;
;;; Set interface parameters
;;;
(setf *output-dir* "output")
(setf *real-time* T)
(setf *record-times* T)
(setf *record-visloc-activations* T)
;; Model parameters:
(setf *read-corpus* nil)
(setf *raw-freq* nil)
(setf *surprisal-on* nil)
(setf *surprisal-hl-on* nil)
(setf *fake-retrieval-on* nil)
(setf *time-penalty-factor* 0.1) ;; "Factor for penalizing use of time-out productions (p = -FACTOR*FIRING-COUNT)"


;;;
;;; Experiments
;;;
;; Run experiment:
(re 'gg-exp1 100) 
(re 'gg-exp1 50 :params '(:lf 0.4 :mp 2))
(re 'staub10 60)
;; Run experiment with subjects:
(re 'gg-exp1 30 100) 
(res 'gg-exp1 30 50 '(0.75 1.25) :params '(:lf 0.3 :mp 6))


;;;
;;; Search param-space
;;;
(setf *pspace1* '(
                  (:lf .2 .4 .1)
                  (:mas .25 .45 .1)
                  ))

(search-param-space-em gg-exp1 50 *pspace1*)
(search-param-space-subjects-em gg-exp1 20 50 *pspace1*)


;;;
;;; Run external scripts or programs
;;;
(cwd "output/")
(run-program "Rscript" '("demo-analysis.R"))
(cwd "../")
; (run-program "open" '("output/results.pdf"))
