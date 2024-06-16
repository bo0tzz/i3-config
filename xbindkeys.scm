;; Right Click
(define (first-binding)
    "First binding"                                  
    (xbindkey-function '("b:8") b8-second-binding)
)

(define (reset-first-binding)
    "reset first binding"
    (ungrab-all-keys)
    (remove-all-keys)
)

(define (b8-second-binding)
    "Button Extra Functions"
    (reset-first-binding)
  
    ;; First Key Down + Second Key = Action Ctrl+F5 And Release
    (xbindkey-function '("b:4")
        (lambda ()
            (reset-first-binding)
	    (run-command "$HOME/.config/i3/scripts/vol.sh up")
            (run-command "killall xbindkeys; xbindkeys") 
        )
    )
 
    (xbindkey-function '("b:5")
        (lambda ()
            (reset-first-binding)
	    (run-command "$HOME/.config/i3/scripts/vol.sh down")
            (run-command "killall xbindkeys; xbindkeys")
        )
    )

    ;; First Key Up = Release
    (xbindkey-function '(release "b:8") 
        (lambda ()
            (reset-first-binding)
            (run-command "xte 'mouseclick 8'")
            (run-command "killall xbindkeys; ")
        )
    )
)

(first-binding) 
