((magit-fetch "--tags")
 (magit-log:magit-log-mode "-n256" "--graph" "--color" "--decorate")
 (magit-merge "--no-ff"))
