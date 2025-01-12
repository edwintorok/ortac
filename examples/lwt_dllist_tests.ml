open Lwt_dllist_spec
module Spec =
  struct
    open STM
    [@@@ocaml.warning "-26-27"]
    include Lwt_dllist_incl
    type sut = int t
    type cmd =
      | Is_empty 
      | Length 
      | Add_l of int 
      | Add_r of int 
      | Take_l 
      | Take_r 
      | Take_opt_l 
      | Take_opt_r 
    let show_cmd cmd__001_ =
      match cmd__001_ with
      | Is_empty -> Format.asprintf "%s" "is_empty"
      | Length -> Format.asprintf "%s" "length"
      | Add_l a_1 ->
          Format.asprintf "%s %a" "add_l" (Util.Pp.pp_int true) a_1
      | Add_r a_2 ->
          Format.asprintf "%s %a" "add_r" (Util.Pp.pp_int true) a_2
      | Take_l -> Format.asprintf "%s" "take_l"
      | Take_r -> Format.asprintf "%s" "take_r"
      | Take_opt_l -> Format.asprintf "%s" "take_opt_l"
      | Take_opt_r -> Format.asprintf "%s" "take_opt_r"
    type nonrec state = {
      contents: int Ortac_runtime.Gospelstdlib.sequence }
    let init_state =
      let () = () in
      {
        contents =
          (try Ortac_runtime.Gospelstdlib.Sequence.empty
           with
           | e ->
               raise
                 (Ortac_runtime.Partial_function
                    (e,
                      {
                        Ortac_runtime.start =
                          {
                            pos_fname = "lwt_dllist_spec.mli";
                            pos_lnum = 46;
                            pos_bol = 1807;
                            pos_cnum = 1834
                          };
                        Ortac_runtime.stop =
                          {
                            pos_fname = "lwt_dllist_spec.mli";
                            pos_lnum = 46;
                            pos_bol = 1807;
                            pos_cnum = 1848
                          }
                      })))
      }
    let init_sut () = create ()
    let cleanup _ = ()
    let arb_cmd _ =
      let open QCheck in
        make ~print:show_cmd
          (let open Gen in
             oneof
               [pure Is_empty;
               pure Length;
               (pure (fun a_1 -> Add_l a_1)) <*> int;
               (pure (fun a_2 -> Add_r a_2)) <*> int;
               pure Take_l;
               pure Take_r;
               pure Take_opt_l;
               pure Take_opt_r])
    let next_state cmd__002_ state__003_ =
      match cmd__002_ with
      | Is_empty -> state__003_
      | Length -> state__003_
      | Add_l a_1 ->
          {
            contents =
              ((try
                  Ortac_runtime.Gospelstdlib.Sequence.cons a_1
                    state__003_.contents
                with
                | e ->
                    raise
                      (Ortac_runtime.Partial_function
                         (e,
                           {
                             Ortac_runtime.start =
                               {
                                 pos_fname = "lwt_dllist_spec.mli";
                                 pos_lnum = 64;
                                 pos_bol = 3085;
                                 pos_cnum = 3112
                               };
                             Ortac_runtime.stop =
                               {
                                 pos_fname = "lwt_dllist_spec.mli";
                                 pos_lnum = 64;
                                 pos_bol = 3085;
                                 pos_cnum = 3144
                               }
                           }))))
          }
      | Add_r a_2 ->
          {
            contents =
              ((try
                  Ortac_runtime.Gospelstdlib.Sequence.snoc
                    state__003_.contents a_2
                with
                | e ->
                    raise
                      (Ortac_runtime.Partial_function
                         (e,
                           {
                             Ortac_runtime.start =
                               {
                                 pos_fname = "lwt_dllist_spec.mli";
                                 pos_lnum = 70;
                                 pos_bol = 3553;
                                 pos_cnum = 3580
                               };
                             Ortac_runtime.stop =
                               {
                                 pos_fname = "lwt_dllist_spec.mli";
                                 pos_lnum = 70;
                                 pos_bol = 3553;
                                 pos_cnum = 3612
                               }
                           }))))
          }
      | Take_l ->
          {
            contents =
              ((try
                  if
                    state__003_.contents =
                      Ortac_runtime.Gospelstdlib.Sequence.empty
                  then Ortac_runtime.Gospelstdlib.Sequence.empty
                  else
                    Ortac_runtime.Gospelstdlib.Sequence.tl
                      state__003_.contents
                with
                | e ->
                    raise
                      (Ortac_runtime.Partial_function
                         (e,
                           {
                             Ortac_runtime.start =
                               {
                                 pos_fname = "lwt_dllist_spec.mli";
                                 pos_lnum = 82;
                                 pos_bol = 4150;
                                 pos_cnum = 4177
                               };
                             Ortac_runtime.stop =
                               {
                                 pos_fname = "lwt_dllist_spec.mli";
                                 pos_lnum = 84;
                                 pos_bol = 4259;
                                 pos_cnum = 4319
                               }
                           }))))
          }
      | Take_r ->
          {
            contents =
              ((try
                  if
                    state__003_.contents =
                      Ortac_runtime.Gospelstdlib.Sequence.empty
                  then Ortac_runtime.Gospelstdlib.Sequence.empty
                  else
                    Ortac_runtime.Gospelstdlib.__mix_Bddub
                      state__003_.contents
                      (Ortac_runtime.Gospelstdlib.(-)
                         (Ortac_runtime.Gospelstdlib.Sequence.length
                            state__003_.contents)
                         (Ortac_runtime.Gospelstdlib.integer_of_int 2))
                with
                | e ->
                    raise
                      (Ortac_runtime.Partial_function
                         (e,
                           {
                             Ortac_runtime.start =
                               {
                                 pos_fname = "lwt_dllist_spec.mli";
                                 pos_lnum = 96;
                                 pos_bol = 4953;
                                 pos_cnum = 4980
                               };
                             Ortac_runtime.stop =
                               {
                                 pos_fname = "lwt_dllist_spec.mli";
                                 pos_lnum = 98;
                                 pos_bol = 5062;
                                 pos_cnum = 5152
                               }
                           }))))
          }
      | Take_opt_l ->
          {
            contents =
              ((try
                  if
                    (Ortac_runtime.Gospelstdlib.Sequence.length
                       state__003_.contents)
                      = (Ortac_runtime.Gospelstdlib.integer_of_int 0)
                  then Ortac_runtime.Gospelstdlib.Sequence.empty
                  else
                    Ortac_runtime.Gospelstdlib.Sequence.tl
                      state__003_.contents
                with
                | e ->
                    raise
                      (Ortac_runtime.Partial_function
                         (e,
                           {
                             Ortac_runtime.start =
                               {
                                 pos_fname = "lwt_dllist_spec.mli";
                                 pos_lnum = 109;
                                 pos_bol = 5855;
                                 pos_cnum = 5882
                               };
                             Ortac_runtime.stop =
                               {
                                 pos_fname = "lwt_dllist_spec.mli";
                                 pos_lnum = 111;
                                 pos_bol = 5969;
                                 pos_cnum = 6029
                               }
                           }))))
          }
      | Take_opt_r ->
          {
            contents =
              ((try
                  match Ortac_runtime.Gospelstdlib.Sequence.length
                          state__003_.contents
                  with
                  | __x__004_ when
                      (=) __x__004_
                        (Ortac_runtime.Gospelstdlib.integer_of_int 0)
                      -> Ortac_runtime.Gospelstdlib.Sequence.empty
                  | l ->
                      Ortac_runtime.Gospelstdlib.__mix_Bddub
                        state__003_.contents
                        (Ortac_runtime.Gospelstdlib.(-) l
                           (Ortac_runtime.Gospelstdlib.integer_of_int 2))
                with
                | e ->
                    raise
                      (Ortac_runtime.Partial_function
                         (e,
                           {
                             Ortac_runtime.start =
                               {
                                 pos_fname = "lwt_dllist_spec.mli";
                                 pos_lnum = 121;
                                 pos_bol = 6691;
                                 pos_cnum = 6718
                               };
                             Ortac_runtime.stop =
                               {
                                 pos_fname = "lwt_dllist_spec.mli";
                                 pos_lnum = 123;
                                 pos_bol = 6810;
                                 pos_cnum = 6868
                               }
                           }))))
          }
    let precond cmd__013_ state__014_ =
      match cmd__013_ with
      | Is_empty -> true
      | Length -> true
      | Add_l a_1 -> true
      | Add_r a_2 -> true
      | Take_l -> true
      | Take_r -> true
      | Take_opt_l -> true
      | Take_opt_r -> true
    let postcond cmd__005_ state__006_ res__007_ =
      let new_state__008_ = lazy (next_state cmd__005_ state__006_) in
      match (cmd__005_, res__007_) with
      | (Is_empty, Res ((Bool, _), b)) ->
          (try
             (b = true) =
               ((Lazy.force new_state__008_).contents =
                  Ortac_runtime.Gospelstdlib.Sequence.empty)
           with
           | e ->
               raise
                 (Ortac_runtime.Partial_function
                    (e,
                      {
                        Ortac_runtime.start =
                          {
                            pos_fname = "lwt_dllist_spec.mli";
                            pos_lnum = 51;
                            pos_bol = 2194;
                            pos_cnum = 2208
                          };
                        Ortac_runtime.stop =
                          {
                            pos_fname = "lwt_dllist_spec.mli";
                            pos_lnum = 51;
                            pos_bol = 2194;
                            pos_cnum = 2241
                          }
                      })))
      | (Length, Res ((Int, _), l_1)) ->
          (try
             (Ortac_runtime.Gospelstdlib.integer_of_int l_1) =
               (Ortac_runtime.Gospelstdlib.Sequence.length
                  (Lazy.force new_state__008_).contents)
           with
           | e ->
               raise
                 (Ortac_runtime.Partial_function
                    (e,
                      {
                        Ortac_runtime.start =
                          {
                            pos_fname = "lwt_dllist_spec.mli";
                            pos_lnum = 58;
                            pos_bol = 2649;
                            pos_cnum = 2663
                          };
                        Ortac_runtime.stop =
                          {
                            pos_fname = "lwt_dllist_spec.mli";
                            pos_lnum = 58;
                            pos_bol = 2649;
                            pos_cnum = 2693
                          }
                      })))
      | (Add_l a_1, Res ((Node (Int), _), n)) -> true
      | (Add_r a_2, Res ((Node (Int), _), n_1)) -> true
      | (Take_l, Res ((Result (Int, Exn), _), a_3)) ->
          (match a_3 with
           | Ok a_3 ->
               (try
                  if
                    state__006_.contents =
                      Ortac_runtime.Gospelstdlib.Sequence.empty
                  then false
                  else
                    a_3 =
                      (Ortac_runtime.Gospelstdlib.Sequence.hd
                         state__006_.contents)
                with
                | e ->
                    raise
                      (Ortac_runtime.Partial_function
                         (e,
                           {
                             Ortac_runtime.start =
                               {
                                 pos_fname = "lwt_dllist_spec.mli";
                                 pos_lnum = 85;
                                 pos_bol = 4320;
                                 pos_cnum = 4334
                               };
                             Ortac_runtime.stop =
                               {
                                 pos_fname = "lwt_dllist_spec.mli";
                                 pos_lnum = 87;
                                 pos_bol = 4394;
                                 pos_cnum = 4445
                               }
                           })))
           | Error (Empty) ->
               (try
                  let __t1__009_ =
                    state__006_.contents =
                      Ortac_runtime.Gospelstdlib.Sequence.empty in
                  let __t2__010_ =
                    Ortac_runtime.Gospelstdlib.Sequence.empty =
                      (Lazy.force new_state__008_).contents in
                  __t1__009_ && __t2__010_
                with
                | e ->
                    raise
                      (Ortac_runtime.Partial_function
                         (e,
                           {
                             Ortac_runtime.start =
                               {
                                 pos_fname = "lwt_dllist_spec.mli";
                                 pos_lnum = 88;
                                 pos_bol = 4446;
                                 pos_cnum = 4468
                               };
                             Ortac_runtime.stop =
                               {
                                 pos_fname = "lwt_dllist_spec.mli";
                                 pos_lnum = 88;
                                 pos_bol = 4446;
                                 pos_cnum = 4512
                               }
                           })))
           | _ -> false)
      | (Take_r, Res ((Result (Int, Exn), _), a_4)) ->
          (match a_4 with
           | Ok a_4 ->
               (try
                  if
                    state__006_.contents =
                      Ortac_runtime.Gospelstdlib.Sequence.empty
                  then false
                  else
                    a_4 =
                      (Ortac_runtime.Gospelstdlib.__mix_Bub
                         state__006_.contents
                         (Ortac_runtime.Gospelstdlib.(-)
                            (Ortac_runtime.Gospelstdlib.Sequence.length
                               state__006_.contents)
                            (Ortac_runtime.Gospelstdlib.integer_of_int 1)))
                with
                | e ->
                    raise
                      (Ortac_runtime.Partial_function
                         (e,
                           {
                             Ortac_runtime.start =
                               {
                                 pos_fname = "lwt_dllist_spec.mli";
                                 pos_lnum = 99;
                                 pos_bol = 5153;
                                 pos_cnum = 5167
                               };
                             Ortac_runtime.stop =
                               {
                                 pos_fname = "lwt_dllist_spec.mli";
                                 pos_lnum = 101;
                                 pos_bol = 5227;
                                 pos_cnum = 5304
                               }
                           })))
           | Error (Empty) ->
               (try
                  let __t1__011_ =
                    state__006_.contents =
                      Ortac_runtime.Gospelstdlib.Sequence.empty in
                  let __t2__012_ =
                    Ortac_runtime.Gospelstdlib.Sequence.empty =
                      (Lazy.force new_state__008_).contents in
                  __t1__011_ && __t2__012_
                with
                | e ->
                    raise
                      (Ortac_runtime.Partial_function
                         (e,
                           {
                             Ortac_runtime.start =
                               {
                                 pos_fname = "lwt_dllist_spec.mli";
                                 pos_lnum = 102;
                                 pos_bol = 5305;
                                 pos_cnum = 5327
                               };
                             Ortac_runtime.stop =
                               {
                                 pos_fname = "lwt_dllist_spec.mli";
                                 pos_lnum = 102;
                                 pos_bol = 5305;
                                 pos_cnum = 5371
                               }
                           })))
           | _ -> false)
      | (Take_opt_l, Res ((Option (Int), _), o)) ->
          (try
             state__006_.contents =
               (match o with
                | None -> Ortac_runtime.Gospelstdlib.Sequence.empty
                | Some a_5 ->
                    Ortac_runtime.Gospelstdlib.Sequence.cons a_5
                      (Lazy.force new_state__008_).contents)
           with
           | e ->
               raise
                 (Ortac_runtime.Partial_function
                    (e,
                      {
                        Ortac_runtime.start =
                          {
                            pos_fname = "lwt_dllist_spec.mli";
                            pos_lnum = 112;
                            pos_bol = 6030;
                            pos_cnum = 6044
                          };
                        Ortac_runtime.stop =
                          {
                            pos_fname = "lwt_dllist_spec.mli";
                            pos_lnum = 114;
                            pos_bol = 6131;
                            pos_cnum = 6201
                          }
                      })))
      | (Take_opt_r, Res ((Option (Int), _), o_1)) ->
          (try
             state__006_.contents =
               (match o_1 with
                | None -> Ortac_runtime.Gospelstdlib.Sequence.empty
                | Some a_6 ->
                    Ortac_runtime.Gospelstdlib.Sequence.snoc
                      (Lazy.force new_state__008_).contents a_6)
           with
           | e ->
               raise
                 (Ortac_runtime.Partial_function
                    (e,
                      {
                        Ortac_runtime.start =
                          {
                            pos_fname = "lwt_dllist_spec.mli";
                            pos_lnum = 124;
                            pos_bol = 6869;
                            pos_cnum = 6883
                          };
                        Ortac_runtime.stop =
                          {
                            pos_fname = "lwt_dllist_spec.mli";
                            pos_lnum = 126;
                            pos_bol = 6970;
                            pos_cnum = 7040
                          }
                      })))
      | _ -> true
    let run cmd__015_ sut__016_ =
      match cmd__015_ with
      | Is_empty -> Res (bool, (is_empty sut__016_))
      | Length -> Res (int, (length sut__016_))
      | Add_l a_1 -> Res ((node int), (add_l a_1 sut__016_))
      | Add_r a_2 -> Res ((node int), (add_r a_2 sut__016_))
      | Take_l ->
          Res ((result int exn), (protect (fun () -> take_l sut__016_) ()))
      | Take_r ->
          Res ((result int exn), (protect (fun () -> take_r sut__016_) ()))
      | Take_opt_l -> Res ((option int), (take_opt_l sut__016_))
      | Take_opt_r -> Res ((option int), (take_opt_r sut__016_))
  end
module STMTests = (STM_sequential.Make)(Spec)
let _ =
  QCheck_base_runner.run_tests_main
    (let count = 1000 in
     [STMTests.agree_test ~count ~name:"Lwt_dllist_spec STM tests"])
