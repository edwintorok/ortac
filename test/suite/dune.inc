(rule
 (target lib_rtac.ml)
 (action
  (with-stdout-to
    %{target}
   (run gospel_rtac %{dep:lib.mli}))))

(rule
 (target lib_rtac.mli)
 (action
  (copy %{dep:lib.mli} %{target})))

(test
 (name client)
 (flags :standard -w -27-11)
 (libraries fmt ppxlib gospel-runtime))