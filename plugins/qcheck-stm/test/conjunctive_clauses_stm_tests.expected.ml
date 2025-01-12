open Conjunctive_clauses
let set_contents c i a_1 =
  try
    Ortac_runtime.Gospelstdlib.List.mapi
      (fun j -> fun x -> if i = j then a_1 else x) c
  with
  | e ->
      raise
        (Ortac_runtime.Partial_function
           (e,
             {
               Ortac_runtime.start =
                 {
                   pos_fname = "conjunctive_clauses.mli";
                   pos_lnum = 9;
                   pos_bol = 562;
                   pos_cnum = 572
                 };
               Ortac_runtime.stop =
                 {
                   pos_fname = "conjunctive_clauses.mli";
                   pos_lnum = 9;
                   pos_bol = 562;
                   pos_cnum = 619
                 }
             }))
module Spec =
  struct
    open STM
    [@@@ocaml.warning "-26-27"]
    type sut = char t
    type cmd =
      | Set of int * char 
    let show_cmd cmd__001_ =
      match cmd__001_ with
      | Set (i_1, a_2) ->
          Format.asprintf "%s %a %a" "set" (Util.Pp.pp_int true) i_1
            (Util.Pp.pp_char true) a_2
    type nonrec state = {
      contents: char list }
    let init_state =
      let i_2 = 42
      and a_3 = 'a' in
      {
        contents =
          (try
             Ortac_runtime.Gospelstdlib.List.init
               (Ortac_runtime.Gospelstdlib.integer_of_int i_2) (fun _ -> a_3)
           with
           | e ->
               raise
                 (Ortac_runtime.Partial_function
                    (e,
                      {
                        Ortac_runtime.start =
                          {
                            pos_fname = "conjunctive_clauses.mli";
                            pos_lnum = 6;
                            pos_bol = 277;
                            pos_cnum = 318
                          };
                        Ortac_runtime.stop =
                          {
                            pos_fname = "conjunctive_clauses.mli";
                            pos_lnum = 6;
                            pos_bol = 277;
                            pos_cnum = 342
                          }
                      })))
      }
    let init_sut () = make 42 'a'
    let cleanup _ = ()
    let arb_cmd _ =
      let open QCheck in
        make ~print:show_cmd
          (let open Gen in
             oneof
               [((pure (fun i_1 -> fun a_2 -> Set (i_1, a_2))) <*> int) <*>
                  char])
    let next_state cmd__002_ state__003_ =
      match cmd__002_ with
      | Set (i_1, a_2) ->
          if
            (try
               let __t1__004_ =
                 Ortac_runtime.Gospelstdlib.(<=)
                   (Ortac_runtime.Gospelstdlib.integer_of_int 0)
                   (Ortac_runtime.Gospelstdlib.integer_of_int i_1) in
               let __t2__005_ =
                 Ortac_runtime.Gospelstdlib.(<)
                   (Ortac_runtime.Gospelstdlib.integer_of_int i_1)
                   (Ortac_runtime.Gospelstdlib.List.length
                      state__003_.contents) in
               __t1__004_ && __t2__005_
             with
             | e ->
                 raise
                   (Ortac_runtime.Partial_function
                      (e,
                        {
                          Ortac_runtime.start =
                            {
                              pos_fname = "conjunctive_clauses.mli";
                              pos_lnum = 13;
                              pos_bol = 806;
                              pos_cnum = 817
                            };
                          Ortac_runtime.stop =
                            {
                              pos_fname = "conjunctive_clauses.mli";
                              pos_lnum = 13;
                              pos_bol = 806;
                              pos_cnum = 848
                            }
                        })))
          then
            {
              contents =
                ((try
                    set_contents state__003_.contents
                      (Ortac_runtime.Gospelstdlib.integer_of_int i_1) a_2
                  with
                  | e ->
                      raise
                        (Ortac_runtime.Partial_function
                           (e,
                             {
                               Ortac_runtime.start =
                                 {
                                   pos_fname = "conjunctive_clauses.mli";
                                   pos_lnum = 15;
                                   pos_bol = 864;
                                   pos_cnum = 905
                                 };
                               Ortac_runtime.stop =
                                 {
                                   pos_fname = "conjunctive_clauses.mli";
                                   pos_lnum = 15;
                                   pos_bol = 864;
                                   pos_cnum = 917
                                 }
                             }))))
            }
          else state__003_
    let precond cmd__012_ state__013_ =
      match cmd__012_ with | Set (i_1, a_2) -> true
    let postcond cmd__006_ state__007_ res__008_ =
      let new_state__009_ = lazy (next_state cmd__006_ state__007_) in
      match (cmd__006_, res__008_) with
      | (Set (i_1, a_2), Res ((Result (Unit, Exn), _), res)) ->
          if
            (try
               let __t1__010_ =
                 Ortac_runtime.Gospelstdlib.(<=)
                   (Ortac_runtime.Gospelstdlib.integer_of_int 0)
                   (Ortac_runtime.Gospelstdlib.integer_of_int i_1) in
               let __t2__011_ =
                 Ortac_runtime.Gospelstdlib.(<)
                   (Ortac_runtime.Gospelstdlib.integer_of_int i_1)
                   (Ortac_runtime.Gospelstdlib.List.length
                      state__007_.contents) in
               __t1__010_ && __t2__011_
             with
             | e ->
                 raise
                   (Ortac_runtime.Partial_function
                      (e,
                        {
                          Ortac_runtime.start =
                            {
                              pos_fname = "conjunctive_clauses.mli";
                              pos_lnum = 13;
                              pos_bol = 806;
                              pos_cnum = 817
                            };
                          Ortac_runtime.stop =
                            {
                              pos_fname = "conjunctive_clauses.mli";
                              pos_lnum = 13;
                              pos_bol = 806;
                              pos_cnum = 848
                            }
                        })))
          then (match res with | Ok _ -> true | _ -> false)
          else
            (match res with | Error (Invalid_argument _) -> true | _ -> false)
      | _ -> true
    let run cmd__014_ sut__015_ =
      match cmd__014_ with
      | Set (i_1, a_2) ->
          Res
            ((result unit exn),
              (protect (fun () -> set sut__015_ i_1 a_2) ()))
  end
module STMTests = (STM_sequential.Make)(Spec)
let _ =
  QCheck_base_runner.run_tests_main
    (let count = 1000 in
     [STMTests.agree_test ~count ~name:"Conjunctive_clauses STM tests"])
