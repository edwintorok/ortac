open Hashtbl
let rec remove_first x xs_1 =
  try
    match xs_1 with
    | (a_1, b_1)::xs ->
        if a_1 = x then xs else (a_1, b_1) :: (remove_first x xs)
    | [] -> []
  with
  | e ->
      raise
        (Ortac_runtime.Partial_function
           (e,
             {
               Ortac_runtime.start =
                 {
                   pos_fname = "hashtbl.mli";
                   pos_lnum = 49;
                   pos_bol = 2390;
                   pos_cnum = 2396
                 };
               Ortac_runtime.stop =
                 {
                   pos_fname = "hashtbl.mli";
                   pos_lnum = 51;
                   pos_bol = 2486;
                   pos_cnum = 2502
                 }
             }))
module Spec =
  struct
    open STM
    [@@@ocaml.warning "-26-27"]
    type sut = (char, int) t
    type cmd =
      | Clear 
      | Reset 
      | Add of char * int 
      | Find of char 
      | Find_opt of char 
      | Find_all of char 
      | Mem of char 
      | Remove of char 
      | Replace of char * int 
      | Length 
    let show_cmd cmd__001_ =
      match cmd__001_ with
      | Clear -> Format.asprintf "%s" "clear"
      | Reset -> Format.asprintf "%s" "reset"
      | Add (a_2, b_2) ->
          Format.asprintf "%s %a %a" "add" (Util.Pp.pp_char true) a_2
            (Util.Pp.pp_int true) b_2
      | Find a_3 -> Format.asprintf "%s %a" "find" (Util.Pp.pp_char true) a_3
      | Find_opt a_4 ->
          Format.asprintf "%s %a" "find_opt" (Util.Pp.pp_char true) a_4
      | Find_all a_5 ->
          Format.asprintf "%s %a" "find_all" (Util.Pp.pp_char true) a_5
      | Mem a_6 -> Format.asprintf "%s %a" "mem" (Util.Pp.pp_char true) a_6
      | Remove a_7 ->
          Format.asprintf "%s %a" "remove" (Util.Pp.pp_char true) a_7
      | Replace (a_8, b_3) ->
          Format.asprintf "%s %a %a" "replace" (Util.Pp.pp_char true) a_8
            (Util.Pp.pp_int true) b_3
      | Length -> Format.asprintf "%s" "length"
    type nonrec state = {
      contents: (char * int) list }
    let init_state =
      let random = false
      and size = 16 in
      {
        contents =
          (try []
           with
           | e ->
               raise
                 (Ortac_runtime.Partial_function
                    (e,
                      {
                        Ortac_runtime.start =
                          {
                            pos_fname = "hashtbl.mli";
                            pos_lnum = 7;
                            pos_bol = 318;
                            pos_cnum = 343
                          };
                        Ortac_runtime.stop =
                          {
                            pos_fname = "hashtbl.mli";
                            pos_lnum = 7;
                            pos_bol = 318;
                            pos_cnum = 345
                          }
                      })))
      }
    let init_sut () = create ~random:false 16
    let cleanup _ = ()
    let arb_cmd _ =
      let open QCheck in
        make ~print:show_cmd
          (let open Gen in
             oneof
               [pure Clear;
               pure Reset;
               ((pure (fun a_2 -> fun b_2 -> Add (a_2, b_2))) <*> char) <*>
                 int;
               (pure (fun a_3 -> Find a_3)) <*> char;
               (pure (fun a_4 -> Find_opt a_4)) <*> char;
               (pure (fun a_5 -> Find_all a_5)) <*> char;
               (pure (fun a_6 -> Mem a_6)) <*> char;
               (pure (fun a_7 -> Remove a_7)) <*> char;
               ((pure (fun a_8 -> fun b_3 -> Replace (a_8, b_3))) <*> char)
                 <*> int;
               pure Length])
    let next_state cmd__002_ state__003_ =
      match cmd__002_ with
      | Clear ->
          {
            contents =
              ((try []
                with
                | e ->
                    raise
                      (Ortac_runtime.Partial_function
                         (e,
                           {
                             Ortac_runtime.start =
                               {
                                 pos_fname = "hashtbl.mli";
                                 pos_lnum = 12;
                                 pos_bol = 486;
                                 pos_cnum = 511
                               };
                             Ortac_runtime.stop =
                               {
                                 pos_fname = "hashtbl.mli";
                                 pos_lnum = 12;
                                 pos_bol = 486;
                                 pos_cnum = 513
                               }
                           }))))
          }
      | Reset ->
          {
            contents =
              ((try []
                with
                | e ->
                    raise
                      (Ortac_runtime.Partial_function
                         (e,
                           {
                             Ortac_runtime.start =
                               {
                                 pos_fname = "hashtbl.mli";
                                 pos_lnum = 17;
                                 pos_bol = 655;
                                 pos_cnum = 680
                               };
                             Ortac_runtime.stop =
                               {
                                 pos_fname = "hashtbl.mli";
                                 pos_lnum = 17;
                                 pos_bol = 655;
                                 pos_cnum = 682
                               }
                           }))))
          }
      | Add (a_2, b_2) ->
          {
            contents =
              ((try (a_2, b_2) :: state__003_.contents
                with
                | e ->
                    raise
                      (Ortac_runtime.Partial_function
                         (e,
                           {
                             Ortac_runtime.start =
                               {
                                 pos_fname = "hashtbl.mli";
                                 pos_lnum = 26;
                                 pos_bol = 1020;
                                 pos_cnum = 1045
                               };
                             Ortac_runtime.stop =
                               {
                                 pos_fname = "hashtbl.mli";
                                 pos_lnum = 26;
                                 pos_bol = 1020;
                                 pos_cnum = 1069
                               }
                           }))))
          }
      | Find a_3 -> state__003_
      | Find_opt a_4 -> state__003_
      | Find_all a_5 -> state__003_
      | Mem a_6 -> state__003_
      | Remove a_7 ->
          {
            contents =
              ((try remove_first a_7 state__003_.contents
                with
                | e ->
                    raise
                      (Ortac_runtime.Partial_function
                         (e,
                           {
                             Ortac_runtime.start =
                               {
                                 pos_fname = "hashtbl.mli";
                                 pos_lnum = 56;
                                 pos_bol = 2643;
                                 pos_cnum = 2668
                               };
                             Ortac_runtime.stop =
                               {
                                 pos_fname = "hashtbl.mli";
                                 pos_lnum = 56;
                                 pos_bol = 2643;
                                 pos_cnum = 2680
                               }
                           }))))
          }
      | Replace (a_8, b_3) ->
          {
            contents =
              ((try (a_8, b_3) :: (remove_first a_8 state__003_.contents)
                with
                | e ->
                    raise
                      (Ortac_runtime.Partial_function
                         (e,
                           {
                             Ortac_runtime.start =
                               {
                                 pos_fname = "hashtbl.mli";
                                 pos_lnum = 61;
                                 pos_bol = 2890;
                                 pos_cnum = 2915
                               };
                             Ortac_runtime.stop =
                               {
                                 pos_fname = "hashtbl.mli";
                                 pos_lnum = 61;
                                 pos_bol = 2890;
                                 pos_cnum = 2956
                               }
                           }))))
          }
      | Length -> state__003_
    let precond cmd__008_ state__009_ =
      match cmd__008_ with
      | Clear -> true
      | Reset -> true
      | Add (a_2, b_2) -> true
      | Find a_3 -> true
      | Find_opt a_4 -> true
      | Find_all a_5 -> true
      | Mem a_6 -> true
      | Remove a_7 -> true
      | Replace (a_8, b_3) -> true
      | Length -> true
    let postcond cmd__004_ state__005_ res__006_ =
      let new_state__007_ = lazy (next_state cmd__004_ state__005_) in
      match (cmd__004_, res__006_) with
      | (Clear, Res ((Unit, _), _)) -> true
      | (Reset, Res ((Unit, _), _)) -> true
      | (Add (a_2, b_2), Res ((Unit, _), _)) -> true
      | (Find a_3, Res ((Result (Int, Exn), _), b_4)) ->
          (match b_4 with
           | Ok b_4 ->
               (try
                  Ortac_runtime.Gospelstdlib.List.mem (a_3, b_4)
                    (Lazy.force new_state__007_).contents
                with
                | e ->
                    raise
                      (Ortac_runtime.Partial_function
                         (e,
                           {
                             Ortac_runtime.start =
                               {
                                 pos_fname = "hashtbl.mli";
                                 pos_lnum = 32;
                                 pos_bol = 1360;
                                 pos_cnum = 1372
                               };
                             Ortac_runtime.stop =
                               {
                                 pos_fname = "hashtbl.mli";
                                 pos_lnum = 32;
                                 pos_bol = 1360;
                                 pos_cnum = 1398
                               }
                           })))
           | Error (Not_found) ->
               (try
                  not
                    (Ortac_runtime.Gospelstdlib.List.mem a_3
                       (Ortac_runtime.Gospelstdlib.List.map
                          Ortac_runtime.Gospelstdlib.fst
                          (Lazy.force new_state__007_).contents))
                with
                | e ->
                    raise
                      (Ortac_runtime.Partial_function
                         (e,
                           {
                             Ortac_runtime.start =
                               {
                                 pos_fname = "hashtbl.mli";
                                 pos_lnum = 31;
                                 pos_bol = 1293;
                                 pos_cnum = 1317
                               };
                             Ortac_runtime.stop =
                               {
                                 pos_fname = "hashtbl.mli";
                                 pos_lnum = 31;
                                 pos_bol = 1293;
                                 pos_cnum = 1359
                               }
                           })))
           | _ -> false)
      | (Find_opt a_4, Res ((Option (Int), _), o)) ->
          (try
             (match o with
              | None ->
                  if
                    not
                      (Ortac_runtime.Gospelstdlib.List.mem a_4
                         (Ortac_runtime.Gospelstdlib.List.map
                            Ortac_runtime.Gospelstdlib.fst
                            (Lazy.force new_state__007_).contents))
                  then true
                  else false
              | Some b_5 ->
                  if
                    Ortac_runtime.Gospelstdlib.List.mem (a_4, b_5)
                      (Lazy.force new_state__007_).contents
                  then true
                  else false)
               = true
           with
           | e ->
               raise
                 (Ortac_runtime.Partial_function
                    (e,
                      {
                        Ortac_runtime.start =
                          {
                            pos_fname = "hashtbl.mli";
                            pos_lnum = 36;
                            pos_bol = 1559;
                            pos_cnum = 1571
                          };
                        Ortac_runtime.stop =
                          {
                            pos_fname = "hashtbl.mli";
                            pos_lnum = 38;
                            pos_bol = 1643;
                            pos_cnum = 1687
                          }
                      })))
      | (Find_all a_5, Res ((List (Int), _), bs)) ->
          (try
             (Ortac_runtime.Gospelstdlib.List.to_seq bs) =
               (Ortac_runtime.Gospelstdlib.Sequence.filter_map
                  (fun (x_1, y) -> if x_1 = a_5 then Some y else None)
                  (Ortac_runtime.Gospelstdlib.List.to_seq
                     (Lazy.force new_state__007_).contents))
           with
           | e ->
               raise
                 (Ortac_runtime.Partial_function
                    (e,
                      {
                        Ortac_runtime.start =
                          {
                            pos_fname = "hashtbl.mli";
                            pos_lnum = 42;
                            pos_bol = 1853;
                            pos_cnum = 1865
                          };
                        Ortac_runtime.stop =
                          {
                            pos_fname = "hashtbl.mli";
                            pos_lnum = 42;
                            pos_bol = 1853;
                            pos_cnum = 1947
                          }
                      })))
      | (Mem a_6, Res ((Bool, _), b_6)) ->
          (try
             (b_6 = true) =
               (Ortac_runtime.Gospelstdlib.List.mem a_6
                  (Ortac_runtime.Gospelstdlib.List.map
                     Ortac_runtime.Gospelstdlib.fst
                     (Lazy.force new_state__007_).contents))
           with
           | e ->
               raise
                 (Ortac_runtime.Partial_function
                    (e,
                      {
                        Ortac_runtime.start =
                          {
                            pos_fname = "hashtbl.mli";
                            pos_lnum = 46;
                            pos_bol = 2149;
                            pos_cnum = 2161
                          };
                        Ortac_runtime.stop =
                          {
                            pos_fname = "hashtbl.mli";
                            pos_lnum = 46;
                            pos_bol = 2149;
                            pos_cnum = 2201
                          }
                      })))
      | (Remove a_7, Res ((Unit, _), _)) -> true
      | (Replace (a_8, b_3), Res ((Unit, _), _)) -> true
      | (Length, Res ((Int, _), i)) ->
          (try
             (Ortac_runtime.Gospelstdlib.integer_of_int i) =
               (Ortac_runtime.Gospelstdlib.List.length
                  (Lazy.force new_state__007_).contents)
           with
           | e ->
               raise
                 (Ortac_runtime.Partial_function
                    (e,
                      {
                        Ortac_runtime.start =
                          {
                            pos_fname = "hashtbl.mli";
                            pos_lnum = 76;
                            pos_bol = 3727;
                            pos_cnum = 3739
                          };
                        Ortac_runtime.stop =
                          {
                            pos_fname = "hashtbl.mli";
                            pos_lnum = 76;
                            pos_bol = 3727;
                            pos_cnum = 3765
                          }
                      })))
      | _ -> true
    let run cmd__010_ sut__011_ =
      match cmd__010_ with
      | Clear -> Res (unit, (clear sut__011_))
      | Reset -> Res (unit, (reset sut__011_))
      | Add (a_2, b_2) -> Res (unit, (add sut__011_ a_2 b_2))
      | Find a_3 ->
          Res ((result int exn), (protect (fun () -> find sut__011_ a_3) ()))
      | Find_opt a_4 -> Res ((option int), (find_opt sut__011_ a_4))
      | Find_all a_5 -> Res ((list int), (find_all sut__011_ a_5))
      | Mem a_6 -> Res (bool, (mem sut__011_ a_6))
      | Remove a_7 -> Res (unit, (remove sut__011_ a_7))
      | Replace (a_8, b_3) -> Res (unit, (replace sut__011_ a_8 b_3))
      | Length -> Res (int, (length sut__011_))
  end
module STMTests = (STM_sequential.Make)(Spec)
let _ =
  QCheck_base_runner.run_tests_main
    (let count = 1000 in
     [STMTests.agree_test ~count ~name:"Hashtbl STM tests"])
