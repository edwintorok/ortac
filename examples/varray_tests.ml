open Varray_spec
let inside i s =
  try
    if
      let __t1__001_ =
        Ortac_runtime.Gospelstdlib.(<=)
          (Ortac_runtime.Gospelstdlib.integer_of_int 0) i in
      let __t2__002_ =
        Ortac_runtime.Gospelstdlib.(<) i
          (Ortac_runtime.Gospelstdlib.Sequence.length s) in
      __t1__001_ && __t2__002_
    then true
    else false
  with
  | e ->
      raise
        (Ortac_runtime.Partial_function
           (e,
             {
               Ortac_runtime.start =
                 {
                   pos_fname = "varray_spec.mli";
                   pos_lnum = 4;
                   pos_bol = 342;
                   pos_cnum = 350
                 };
               Ortac_runtime.stop =
                 {
                   pos_fname = "varray_spec.mli";
                   pos_lnum = 4;
                   pos_bol = 342;
                   pos_cnum = 376
                 }
             }))
let proj e =
  try e
  with
  | e ->
      raise
        (Ortac_runtime.Partial_function
           (e,
             {
               Ortac_runtime.start =
                 {
                   pos_fname = "varray_spec.mli";
                   pos_lnum = 14;
                   pos_bol = 1022;
                   pos_cnum = 1062
                 };
               Ortac_runtime.stop =
                 {
                   pos_fname = "varray_spec.mli";
                   pos_lnum = 14;
                   pos_bol = 1022;
                   pos_cnum = 1063
                 }
             }))
module Spec =
  struct
    open STM
    [@@@ocaml.warning "-26-27"]
    include Varray_incl
    type sut = char t
    type cmd =
      | Push_back of char elt 
      | Pop_back 
      | Push_front of char elt 
      | Pop_front 
      | Insert_at of int * char elt 
      | Pop_at of int 
      | Delete_at of int 
      | Get of int 
      | Set of int * char elt 
      | Length 
      | Is_empty 
      | Fill of int * int * char elt 
    let show_cmd cmd__003_ =
      match cmd__003_ with
      | Push_back x ->
          Format.asprintf "%s %a" "push_back"
            (Util.Pp.pp_elt Util.Pp.pp_char true) x
      | Pop_back -> Format.asprintf "%s" "pop_back"
      | Push_front x_1 ->
          Format.asprintf "%s %a" "push_front"
            (Util.Pp.pp_elt Util.Pp.pp_char true) x_1
      | Pop_front -> Format.asprintf "%s" "pop_front"
      | Insert_at (i_1, x_2) ->
          Format.asprintf "%s %a %a" "insert_at" (Util.Pp.pp_int true) i_1
            (Util.Pp.pp_elt Util.Pp.pp_char true) x_2
      | Pop_at i_2 ->
          Format.asprintf "%s %a" "pop_at" (Util.Pp.pp_int true) i_2
      | Delete_at i_3 ->
          Format.asprintf "%s %a" "delete_at" (Util.Pp.pp_int true) i_3
      | Get i_4 -> Format.asprintf "%s %a" "get" (Util.Pp.pp_int true) i_4
      | Set (i_5, v) ->
          Format.asprintf "%s %a %a" "set" (Util.Pp.pp_int true) i_5
            (Util.Pp.pp_elt Util.Pp.pp_char true) v
      | Length -> Format.asprintf "%s" "length"
      | Is_empty -> Format.asprintf "%s" "is_empty"
      | Fill (pos, len, x_3) ->
          Format.asprintf "%s %a %a %a" "fill" (Util.Pp.pp_int true) pos
            (Util.Pp.pp_int true) len (Util.Pp.pp_elt Util.Pp.pp_char true)
            x_3
    type nonrec state = {
      contents: char Ortac_runtime.Gospelstdlib.sequence }
    let init_state =
      let n = 42
      and x_8 = 'a' in
      {
        contents =
          (try
             Ortac_runtime.Gospelstdlib.Sequence.init
               (Ortac_runtime.Gospelstdlib.integer_of_int n)
               (fun _ -> proj x_8)
           with
           | e ->
               raise
                 (Ortac_runtime.Partial_function
                    (e,
                      {
                        Ortac_runtime.start =
                          {
                            pos_fname = "varray_spec.mli";
                            pos_lnum = 154;
                            pos_bol = 8637;
                            pos_cnum = 8664
                          };
                        Ortac_runtime.stop =
                          {
                            pos_fname = "varray_spec.mli";
                            pos_lnum = 154;
                            pos_bol = 8637;
                            pos_cnum = 8697
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
               [(pure (fun x -> Push_back x)) <*> (elt char);
               pure Pop_back;
               (pure (fun x_1 -> Push_front x_1)) <*> (elt char);
               pure Pop_front;
               ((pure (fun i_1 -> fun x_2 -> Insert_at (i_1, x_2))) <*> int)
                 <*> (elt char);
               (pure (fun i_2 -> Pop_at i_2)) <*> int;
               (pure (fun i_3 -> Delete_at i_3)) <*> int;
               (pure (fun i_4 -> Get i_4)) <*> int;
               ((pure (fun i_5 -> fun v -> Set (i_5, v))) <*> int) <*>
                 (elt char);
               pure Length;
               pure Is_empty;
               (((pure
                    (fun pos -> fun len -> fun x_3 -> Fill (pos, len, x_3)))
                   <*> int)
                  <*> int)
                 <*> (elt char)])
    let next_state cmd__004_ state__005_ =
      match cmd__004_ with
      | Push_back x ->
          {
            contents =
              ((try
                  Ortac_runtime.Gospelstdlib.Sequence.snoc
                    state__005_.contents (proj x)
                with
                | e ->
                    raise
                      (Ortac_runtime.Partial_function
                         (e,
                           {
                             Ortac_runtime.start =
                               {
                                 pos_fname = "varray_spec.mli";
                                 pos_lnum = 23;
                                 pos_bol = 1485;
                                 pos_cnum = 1512
                               };
                             Ortac_runtime.stop =
                               {
                                 pos_fname = "varray_spec.mli";
                                 pos_lnum = 23;
                                 pos_bol = 1485;
                                 pos_cnum = 1551
                               }
                           }))))
          }
      | Pop_back ->
          {
            contents =
              ((try
                  if
                    state__005_.contents =
                      Ortac_runtime.Gospelstdlib.Sequence.empty
                  then Ortac_runtime.Gospelstdlib.Sequence.empty
                  else
                    Ortac_runtime.Gospelstdlib.__mix_Bddub
                      state__005_.contents
                      (Ortac_runtime.Gospelstdlib.(-)
                         (Ortac_runtime.Gospelstdlib.Sequence.length
                            state__005_.contents)
                         (Ortac_runtime.Gospelstdlib.integer_of_int 2))
                with
                | e ->
                    raise
                      (Ortac_runtime.Partial_function
                         (e,
                           {
                             Ortac_runtime.start =
                               {
                                 pos_fname = "varray_spec.mli";
                                 pos_lnum = 30;
                                 pos_bol = 1962;
                                 pos_cnum = 1989
                               };
                             Ortac_runtime.stop =
                               {
                                 pos_fname = "varray_spec.mli";
                                 pos_lnum = 32;
                                 pos_bol = 2071;
                                 pos_cnum = 2159
                               }
                           }))))
          }
      | Push_front x_1 ->
          {
            contents =
              ((try
                  Ortac_runtime.Gospelstdlib.Sequence.cons (proj x_1)
                    state__005_.contents
                with
                | e ->
                    raise
                      (Ortac_runtime.Partial_function
                         (e,
                           {
                             Ortac_runtime.start =
                               {
                                 pos_fname = "varray_spec.mli";
                                 pos_lnum = 44;
                                 pos_bol = 2910;
                                 pos_cnum = 2937
                               };
                             Ortac_runtime.stop =
                               {
                                 pos_fname = "varray_spec.mli";
                                 pos_lnum = 44;
                                 pos_bol = 2910;
                                 pos_cnum = 2976
                               }
                           }))))
          }
      | Pop_front ->
          {
            contents =
              ((try
                  if
                    state__005_.contents =
                      Ortac_runtime.Gospelstdlib.Sequence.empty
                  then Ortac_runtime.Gospelstdlib.Sequence.empty
                  else
                    Ortac_runtime.Gospelstdlib.Sequence.tl
                      state__005_.contents
                with
                | e ->
                    raise
                      (Ortac_runtime.Partial_function
                         (e,
                           {
                             Ortac_runtime.start =
                               {
                                 pos_fname = "varray_spec.mli";
                                 pos_lnum = 53;
                                 pos_bol = 3462;
                                 pos_cnum = 3489
                               };
                             Ortac_runtime.stop =
                               {
                                 pos_fname = "varray_spec.mli";
                                 pos_lnum = 55;
                                 pos_bol = 3571;
                                 pos_cnum = 3631
                               }
                           }))))
          }
      | Insert_at (i_1, x_2) ->
          if
            (try
               let __t1__008_ =
                 Ortac_runtime.Gospelstdlib.(<=)
                   (Ortac_runtime.Gospelstdlib.integer_of_int 0)
                   (Ortac_runtime.Gospelstdlib.integer_of_int i_1) in
               let __t2__009_ =
                 Ortac_runtime.Gospelstdlib.(<=)
                   (Ortac_runtime.Gospelstdlib.integer_of_int i_1)
                   (Ortac_runtime.Gospelstdlib.Sequence.length
                      state__005_.contents) in
               __t1__008_ && __t2__009_
             with
             | e ->
                 raise
                   (Ortac_runtime.Partial_function
                      (e,
                        {
                          Ortac_runtime.start =
                            {
                              pos_fname = "varray_spec.mli";
                              pos_lnum = 72;
                              pos_bol = 4496;
                              pos_cnum = 4509
                            };
                          Ortac_runtime.stop =
                            {
                              pos_fname = "varray_spec.mli";
                              pos_lnum = 72;
                              pos_bol = 4496;
                              pos_cnum = 4545
                            }
                        })))
          then
            {
              contents =
                ((try
                    if
                      let __t1__006_ =
                        Ortac_runtime.Gospelstdlib.(<=)
                          (Ortac_runtime.Gospelstdlib.integer_of_int 0)
                          (Ortac_runtime.Gospelstdlib.integer_of_int i_1) in
                      let __t2__007_ =
                        Ortac_runtime.Gospelstdlib.(<=)
                          (Ortac_runtime.Gospelstdlib.integer_of_int i_1)
                          (Ortac_runtime.Gospelstdlib.Sequence.length
                             state__005_.contents) in
                      __t1__006_ && __t2__007_
                    then
                      Ortac_runtime.Gospelstdlib.(++)
                        (Ortac_runtime.Gospelstdlib.__mix_Bddub
                           state__005_.contents
                           (Ortac_runtime.Gospelstdlib.(-)
                              (Ortac_runtime.Gospelstdlib.integer_of_int i_1)
                              (Ortac_runtime.Gospelstdlib.integer_of_int 1)))
                        (Ortac_runtime.Gospelstdlib.Sequence.cons (proj x_2)
                           (Ortac_runtime.Gospelstdlib.__mix_Buddb
                              state__005_.contents
                              (Ortac_runtime.Gospelstdlib.integer_of_int i_1)))
                    else state__005_.contents
                  with
                  | e ->
                      raise
                        (Ortac_runtime.Partial_function
                           (e,
                             {
                               Ortac_runtime.start =
                                 {
                                   pos_fname = "varray_spec.mli";
                                   pos_lnum = 74;
                                   pos_bol = 4572;
                                   pos_cnum = 4603
                                 };
                               Ortac_runtime.stop =
                                 {
                                   pos_fname = "varray_spec.mli";
                                   pos_lnum = 76;
                                   pos_bol = 4745;
                                   pos_cnum = 4793
                                 }
                             }))))
            }
          else state__005_
      | Pop_at i_2 ->
          if
            (try
               (inside (Ortac_runtime.Gospelstdlib.integer_of_int i_2)
                  state__005_.contents)
                 = true
             with
             | e ->
                 raise
                   (Ortac_runtime.Partial_function
                      (e,
                        {
                          Ortac_runtime.start =
                            {
                              pos_fname = "varray_spec.mli";
                              pos_lnum = 89;
                              pos_bol = 5403;
                              pos_cnum = 5416
                            };
                          Ortac_runtime.stop =
                            {
                              pos_fname = "varray_spec.mli";
                              pos_lnum = 89;
                              pos_bol = 5403;
                              pos_cnum = 5435
                            }
                        })))
          then
            {
              contents =
                ((try
                    Ortac_runtime.Gospelstdlib.(++)
                      (Ortac_runtime.Gospelstdlib.__mix_Bddub
                         state__005_.contents
                         (Ortac_runtime.Gospelstdlib.(-)
                            (Ortac_runtime.Gospelstdlib.integer_of_int i_2)
                            (Ortac_runtime.Gospelstdlib.integer_of_int 1)))
                      (Ortac_runtime.Gospelstdlib.__mix_Buddb
                         state__005_.contents
                         (Ortac_runtime.Gospelstdlib.(+)
                            (Ortac_runtime.Gospelstdlib.integer_of_int i_2)
                            (Ortac_runtime.Gospelstdlib.integer_of_int 1)))
                  with
                  | e ->
                      raise
                        (Ortac_runtime.Partial_function
                           (e,
                             {
                               Ortac_runtime.start =
                                 {
                                   pos_fname = "varray_spec.mli";
                                   pos_lnum = 91;
                                   pos_bol = 5462;
                                   pos_cnum = 5514
                                 };
                               Ortac_runtime.stop =
                                 {
                                   pos_fname = "varray_spec.mli";
                                   pos_lnum = 91;
                                   pos_bol = 5462;
                                   pos_cnum = 5516
                                 }
                             }))))
            }
          else state__005_
      | Delete_at i_3 ->
          if
            (try
               (inside (Ortac_runtime.Gospelstdlib.integer_of_int i_3)
                  state__005_.contents)
                 = true
             with
             | e ->
                 raise
                   (Ortac_runtime.Partial_function
                      (e,
                        {
                          Ortac_runtime.start =
                            {
                              pos_fname = "varray_spec.mli";
                              pos_lnum = 102;
                              pos_bol = 6066;
                              pos_cnum = 6079
                            };
                          Ortac_runtime.stop =
                            {
                              pos_fname = "varray_spec.mli";
                              pos_lnum = 102;
                              pos_bol = 6066;
                              pos_cnum = 6098
                            }
                        })))
          then
            {
              contents =
                ((try
                    Ortac_runtime.Gospelstdlib.(++)
                      (Ortac_runtime.Gospelstdlib.__mix_Bddub
                         state__005_.contents
                         (Ortac_runtime.Gospelstdlib.(-)
                            (Ortac_runtime.Gospelstdlib.integer_of_int i_3)
                            (Ortac_runtime.Gospelstdlib.integer_of_int 1)))
                      (Ortac_runtime.Gospelstdlib.__mix_Buddb
                         state__005_.contents
                         (Ortac_runtime.Gospelstdlib.(+)
                            (Ortac_runtime.Gospelstdlib.integer_of_int i_3)
                            (Ortac_runtime.Gospelstdlib.integer_of_int 1)))
                  with
                  | e ->
                      raise
                        (Ortac_runtime.Partial_function
                           (e,
                             {
                               Ortac_runtime.start =
                                 {
                                   pos_fname = "varray_spec.mli";
                                   pos_lnum = 104;
                                   pos_bol = 6125;
                                   pos_cnum = 6177
                                 };
                               Ortac_runtime.stop =
                                 {
                                   pos_fname = "varray_spec.mli";
                                   pos_lnum = 104;
                                   pos_bol = 6125;
                                   pos_cnum = 6179
                                 }
                             }))))
            }
          else state__005_
      | Get i_4 -> state__005_
      | Set (i_5, v) ->
          if
            (try
               (inside (Ortac_runtime.Gospelstdlib.integer_of_int i_5)
                  state__005_.contents)
                 = true
             with
             | e ->
                 raise
                   (Ortac_runtime.Partial_function
                      (e,
                        {
                          Ortac_runtime.start =
                            {
                              pos_fname = "varray_spec.mli";
                              pos_lnum = 137;
                              pos_bol = 7645;
                              pos_cnum = 7658
                            };
                          Ortac_runtime.stop =
                            {
                              pos_fname = "varray_spec.mli";
                              pos_lnum = 137;
                              pos_bol = 7645;
                              pos_cnum = 7677
                            }
                        })))
          then
            {
              contents =
                ((try
                    Ortac_runtime.Gospelstdlib.Sequence.set
                      state__005_.contents
                      (Ortac_runtime.Gospelstdlib.integer_of_int i_5)
                      (proj v)
                  with
                  | e ->
                      raise
                        (Ortac_runtime.Partial_function
                           (e,
                             {
                               Ortac_runtime.start =
                                 {
                                   pos_fname = "varray_spec.mli";
                                   pos_lnum = 139;
                                   pos_bol = 7704;
                                   pos_cnum = 7731
                                 };
                               Ortac_runtime.stop =
                                 {
                                   pos_fname = "varray_spec.mli";
                                   pos_lnum = 139;
                                   pos_bol = 7704;
                                   pos_cnum = 7771
                                 }
                             }))))
            }
          else state__005_
      | Length -> state__005_
      | Is_empty -> state__005_
      | Fill (pos, len, x_3) ->
          if
            (try
               let __t1__012_ =
                 Ortac_runtime.Gospelstdlib.(<=)
                   (Ortac_runtime.Gospelstdlib.integer_of_int 0)
                   (Ortac_runtime.Gospelstdlib.integer_of_int pos) in
               let __t2__013_ =
                 let __t1__014_ =
                   Ortac_runtime.Gospelstdlib.(<=)
                     (Ortac_runtime.Gospelstdlib.integer_of_int 0)
                     (Ortac_runtime.Gospelstdlib.integer_of_int len) in
                 let __t2__015_ =
                   Ortac_runtime.Gospelstdlib.(<)
                     (Ortac_runtime.Gospelstdlib.(+)
                        (Ortac_runtime.Gospelstdlib.integer_of_int pos)
                        (Ortac_runtime.Gospelstdlib.integer_of_int len))
                     (Ortac_runtime.Gospelstdlib.Sequence.length
                        state__005_.contents) in
                 __t1__014_ && __t2__015_ in
               __t1__012_ && __t2__013_
             with
             | e ->
                 raise
                   (Ortac_runtime.Partial_function
                      (e,
                        {
                          Ortac_runtime.start =
                            {
                              pos_fname = "varray_spec.mli";
                              pos_lnum = 211;
                              pos_bol = 12225;
                              pos_cnum = 12238
                            };
                          Ortac_runtime.stop =
                            {
                              pos_fname = "varray_spec.mli";
                              pos_lnum = 211;
                              pos_bol = 12225;
                              pos_cnum = 12300
                            }
                        })))
          then
            {
              contents =
                ((try
                    Ortac_runtime.Gospelstdlib.Sequence.init
                      (Ortac_runtime.Gospelstdlib.Sequence.length
                         state__005_.contents)
                      (fun i_6 ->
                         if
                           let __t1__010_ =
                             Ortac_runtime.Gospelstdlib.(<=)
                               (Ortac_runtime.Gospelstdlib.integer_of_int pos)
                               i_6 in
                           let __t2__011_ =
                             Ortac_runtime.Gospelstdlib.(<) i_6
                               (Ortac_runtime.Gospelstdlib.(+)
                                  (Ortac_runtime.Gospelstdlib.integer_of_int
                                     pos)
                                  (Ortac_runtime.Gospelstdlib.integer_of_int
                                     len)) in
                           __t1__010_ && __t2__011_
                         then proj x_3
                         else
                           Ortac_runtime.Gospelstdlib.__mix_Bub
                             state__005_.contents i_6)
                  with
                  | e ->
                      raise
                        (Ortac_runtime.Partial_function
                           (e,
                             {
                               Ortac_runtime.start =
                                 {
                                   pos_fname = "varray_spec.mli";
                                   pos_lnum = 213;
                                   pos_bol = 12327;
                                   pos_cnum = 12354
                                 };
                               Ortac_runtime.stop =
                                 {
                                   pos_fname = "varray_spec.mli";
                                   pos_lnum = 213;
                                   pos_bol = 12327;
                                   pos_cnum = 12474
                                 }
                             }))))
            }
          else state__005_
    let precond cmd__030_ state__031_ =
      match cmd__030_ with
      | Push_back x -> true
      | Pop_back -> true
      | Push_front x_1 -> true
      | Pop_front -> true
      | Insert_at (i_1, x_2) -> true
      | Pop_at i_2 -> true
      | Delete_at i_3 -> true
      | Get i_4 -> true
      | Set (i_5, v) -> true
      | Length -> true
      | Is_empty -> true
      | Fill (pos, len, x_3) -> true
    let postcond cmd__016_ state__017_ res__018_ =
      let new_state__019_ = lazy (next_state cmd__016_ state__017_) in
      match (cmd__016_, res__018_) with
      | (Push_back x, Res ((Unit, _), _)) -> true
      | (Pop_back, Res ((Result (Elt (Char), Exn), _), x_4)) ->
          (match x_4 with
           | Ok x_4 ->
               (try
                  if
                    state__017_.contents =
                      Ortac_runtime.Gospelstdlib.Sequence.empty
                  then false
                  else
                    (proj x_4) =
                      (Ortac_runtime.Gospelstdlib.__mix_Bub
                         state__017_.contents
                         (Ortac_runtime.Gospelstdlib.(-)
                            (Ortac_runtime.Gospelstdlib.Sequence.length
                               state__017_.contents)
                            (Ortac_runtime.Gospelstdlib.integer_of_int 1)))
                with
                | e ->
                    raise
                      (Ortac_runtime.Partial_function
                         (e,
                           {
                             Ortac_runtime.start =
                               {
                                 pos_fname = "varray_spec.mli";
                                 pos_lnum = 33;
                                 pos_bol = 2160;
                                 pos_cnum = 2174
                               };
                             Ortac_runtime.stop =
                               {
                                 pos_fname = "varray_spec.mli";
                                 pos_lnum = 35;
                                 pos_bol = 2234;
                                 pos_cnum = 2316
                               }
                           })))
           | Error (Not_found) ->
               (try
                  let __t1__020_ =
                    (Lazy.force new_state__019_).contents =
                      state__017_.contents in
                  let __t2__021_ =
                    state__017_.contents =
                      Ortac_runtime.Gospelstdlib.Sequence.empty in
                  __t1__020_ && __t2__021_
                with
                | e ->
                    raise
                      (Ortac_runtime.Partial_function
                         (e,
                           {
                             Ortac_runtime.start =
                               {
                                 pos_fname = "varray_spec.mli";
                                 pos_lnum = 36;
                                 pos_bol = 2317;
                                 pos_cnum = 2343
                               };
                             Ortac_runtime.stop =
                               {
                                 pos_fname = "varray_spec.mli";
                                 pos_lnum = 36;
                                 pos_bol = 2317;
                                 pos_cnum = 2387
                               }
                           })))
           | _ -> false)
      | (Push_front x_1, Res ((Unit, _), _)) -> true
      | (Pop_front, Res ((Result (Elt (Char), Exn), _), x_5)) ->
          (match x_5 with
           | Ok x_5 ->
               (try
                  if
                    state__017_.contents =
                      Ortac_runtime.Gospelstdlib.Sequence.empty
                  then false
                  else
                    (proj x_5) =
                      (Ortac_runtime.Gospelstdlib.Sequence.hd
                         state__017_.contents)
                with
                | e ->
                    raise
                      (Ortac_runtime.Partial_function
                         (e,
                           {
                             Ortac_runtime.start =
                               {
                                 pos_fname = "varray_spec.mli";
                                 pos_lnum = 56;
                                 pos_bol = 3632;
                                 pos_cnum = 3646
                               };
                             Ortac_runtime.stop =
                               {
                                 pos_fname = "varray_spec.mli";
                                 pos_lnum = 58;
                                 pos_bol = 3706;
                                 pos_cnum = 3762
                               }
                           })))
           | Error (Not_found) ->
               (try
                  let __t1__022_ =
                    (Lazy.force new_state__019_).contents =
                      state__017_.contents in
                  let __t2__023_ =
                    state__017_.contents =
                      Ortac_runtime.Gospelstdlib.Sequence.empty in
                  __t1__022_ && __t2__023_
                with
                | e ->
                    raise
                      (Ortac_runtime.Partial_function
                         (e,
                           {
                             Ortac_runtime.start =
                               {
                                 pos_fname = "varray_spec.mli";
                                 pos_lnum = 59;
                                 pos_bol = 3763;
                                 pos_cnum = 3789
                               };
                             Ortac_runtime.stop =
                               {
                                 pos_fname = "varray_spec.mli";
                                 pos_lnum = 59;
                                 pos_bol = 3763;
                                 pos_cnum = 3833
                               }
                           })))
           | _ -> false)
      | (Insert_at (i_1, x_2), Res ((Result (Unit, Exn), _), res)) ->
          if
            (try
               let __t1__024_ =
                 Ortac_runtime.Gospelstdlib.(<=)
                   (Ortac_runtime.Gospelstdlib.integer_of_int 0)
                   (Ortac_runtime.Gospelstdlib.integer_of_int i_1) in
               let __t2__025_ =
                 Ortac_runtime.Gospelstdlib.(<=)
                   (Ortac_runtime.Gospelstdlib.integer_of_int i_1)
                   (Ortac_runtime.Gospelstdlib.Sequence.length
                      state__017_.contents) in
               __t1__024_ && __t2__025_
             with
             | e ->
                 raise
                   (Ortac_runtime.Partial_function
                      (e,
                        {
                          Ortac_runtime.start =
                            {
                              pos_fname = "varray_spec.mli";
                              pos_lnum = 72;
                              pos_bol = 4496;
                              pos_cnum = 4509
                            };
                          Ortac_runtime.stop =
                            {
                              pos_fname = "varray_spec.mli";
                              pos_lnum = 72;
                              pos_bol = 4496;
                              pos_cnum = 4545
                            }
                        })))
          then (match res with | Ok _ -> true | _ -> false)
          else
            (match res with | Error (Invalid_argument _) -> true | _ -> false)
      | (Pop_at i_2, Res ((Result (Elt (Char), Exn), _), x_6)) ->
          if
            (try
               (inside (Ortac_runtime.Gospelstdlib.integer_of_int i_2)
                  state__017_.contents)
                 = true
             with
             | e ->
                 raise
                   (Ortac_runtime.Partial_function
                      (e,
                        {
                          Ortac_runtime.start =
                            {
                              pos_fname = "varray_spec.mli";
                              pos_lnum = 89;
                              pos_bol = 5403;
                              pos_cnum = 5416
                            };
                          Ortac_runtime.stop =
                            {
                              pos_fname = "varray_spec.mli";
                              pos_lnum = 89;
                              pos_bol = 5403;
                              pos_cnum = 5435
                            }
                        })))
          then
            (match x_6 with
             | Ok x_6 ->
                 (try
                    (proj x_6) =
                      (Ortac_runtime.Gospelstdlib.__mix_Bub
                         state__017_.contents
                         (Ortac_runtime.Gospelstdlib.integer_of_int i_2))
                  with
                  | e ->
                      raise
                        (Ortac_runtime.Partial_function
                           (e,
                             {
                               Ortac_runtime.start =
                                 {
                                   pos_fname = "varray_spec.mli";
                                   pos_lnum = 92;
                                   pos_bol = 5540;
                                   pos_cnum = 5554
                                 };
                               Ortac_runtime.stop =
                                 {
                                   pos_fname = "varray_spec.mli";
                                   pos_lnum = 92;
                                   pos_bol = 5540;
                                   pos_cnum = 5582
                                 }
                             })))
             | _ -> false)
          else
            (match x_6 with | Error (Invalid_argument _) -> true | _ -> false)
      | (Delete_at i_3, Res ((Result (Unit, Exn), _), res)) ->
          if
            (try
               (inside (Ortac_runtime.Gospelstdlib.integer_of_int i_3)
                  state__017_.contents)
                 = true
             with
             | e ->
                 raise
                   (Ortac_runtime.Partial_function
                      (e,
                        {
                          Ortac_runtime.start =
                            {
                              pos_fname = "varray_spec.mli";
                              pos_lnum = 102;
                              pos_bol = 6066;
                              pos_cnum = 6079
                            };
                          Ortac_runtime.stop =
                            {
                              pos_fname = "varray_spec.mli";
                              pos_lnum = 102;
                              pos_bol = 6066;
                              pos_cnum = 6098
                            }
                        })))
          then
            (match res with
             | Ok _ ->
                 (try
                    (Ortac_runtime.Gospelstdlib.Sequence.length
                       (Lazy.force new_state__019_).contents)
                      =
                      (Ortac_runtime.Gospelstdlib.(-)
                         (Ortac_runtime.Gospelstdlib.Sequence.length
                            state__017_.contents)
                         (Ortac_runtime.Gospelstdlib.integer_of_int 1))
                  with
                  | e ->
                      raise
                        (Ortac_runtime.Partial_function
                           (e,
                             {
                               Ortac_runtime.start =
                                 {
                                   pos_fname = "varray_spec.mli";
                                   pos_lnum = 105;
                                   pos_bol = 6203;
                                   pos_cnum = 6217
                                 };
                               Ortac_runtime.stop =
                                 {
                                   pos_fname = "varray_spec.mli";
                                   pos_lnum = 105;
                                   pos_bol = 6203;
                                   pos_cnum = 6282
                                 }
                             })))
             | _ -> false)
          else
            (match res with | Error (Invalid_argument _) -> true | _ -> false)
      | (Get i_4, Res ((Result (Elt (Char), Exn), _), x_7)) ->
          if
            (try
               (inside (Ortac_runtime.Gospelstdlib.integer_of_int i_4)
                  state__017_.contents)
                 = true
             with
             | e ->
                 raise
                   (Ortac_runtime.Partial_function
                      (e,
                        {
                          Ortac_runtime.start =
                            {
                              pos_fname = "varray_spec.mli";
                              pos_lnum = 128;
                              pos_bol = 7220;
                              pos_cnum = 7233
                            };
                          Ortac_runtime.stop =
                            {
                              pos_fname = "varray_spec.mli";
                              pos_lnum = 128;
                              pos_bol = 7220;
                              pos_cnum = 7252
                            }
                        })))
          then
            (match x_7 with
             | Ok x_7 ->
                 (try
                    (proj x_7) =
                      (Ortac_runtime.Gospelstdlib.__mix_Bub
                         (Lazy.force new_state__019_).contents
                         (Ortac_runtime.Gospelstdlib.integer_of_int i_4))
                  with
                  | e ->
                      raise
                        (Ortac_runtime.Partial_function
                           (e,
                             {
                               Ortac_runtime.start =
                                 {
                                   pos_fname = "varray_spec.mli";
                                   pos_lnum = 127;
                                   pos_bol = 7181;
                                   pos_cnum = 7195
                                 };
                               Ortac_runtime.stop =
                                 {
                                   pos_fname = "varray_spec.mli";
                                   pos_lnum = 127;
                                   pos_bol = 7181;
                                   pos_cnum = 7219
                                 }
                             })))
             | _ -> false)
          else
            (match x_7 with | Error (Invalid_argument _) -> true | _ -> false)
      | (Set (i_5, v), Res ((Result (Unit, Exn), _), res)) ->
          if
            (try
               (inside (Ortac_runtime.Gospelstdlib.integer_of_int i_5)
                  state__017_.contents)
                 = true
             with
             | e ->
                 raise
                   (Ortac_runtime.Partial_function
                      (e,
                        {
                          Ortac_runtime.start =
                            {
                              pos_fname = "varray_spec.mli";
                              pos_lnum = 137;
                              pos_bol = 7645;
                              pos_cnum = 7658
                            };
                          Ortac_runtime.stop =
                            {
                              pos_fname = "varray_spec.mli";
                              pos_lnum = 137;
                              pos_bol = 7645;
                              pos_cnum = 7677
                            }
                        })))
          then (match res with | Ok _ -> true | _ -> false)
          else
            (match res with | Error (Invalid_argument _) -> true | _ -> false)
      | (Length, Res ((Int, _), l)) ->
          (try
             (Ortac_runtime.Gospelstdlib.integer_of_int l) =
               (Ortac_runtime.Gospelstdlib.Sequence.length
                  (Lazy.force new_state__019_).contents)
           with
           | e ->
               raise
                 (Ortac_runtime.Partial_function
                    (e,
                      {
                        Ortac_runtime.start =
                          {
                            pos_fname = "varray_spec.mli";
                            pos_lnum = 144;
                            pos_bol = 8166;
                            pos_cnum = 8180
                          };
                        Ortac_runtime.stop =
                          {
                            pos_fname = "varray_spec.mli";
                            pos_lnum = 144;
                            pos_bol = 8166;
                            pos_cnum = 8210
                          }
                      })))
      | (Is_empty, Res ((Bool, _), b)) ->
          (try
             (b = true) =
               ((Lazy.force new_state__019_).contents =
                  Ortac_runtime.Gospelstdlib.Sequence.empty)
           with
           | e ->
               raise
                 (Ortac_runtime.Partial_function
                    (e,
                      {
                        Ortac_runtime.start =
                          {
                            pos_fname = "varray_spec.mli";
                            pos_lnum = 171;
                            pos_bol = 9662;
                            pos_cnum = 9676
                          };
                        Ortac_runtime.stop =
                          {
                            pos_fname = "varray_spec.mli";
                            pos_lnum = 171;
                            pos_bol = 9662;
                            pos_cnum = 9709
                          }
                      })))
      | (Fill (pos, len, x_3), Res ((Result (Unit, Exn), _), res)) ->
          if
            (try
               let __t1__026_ =
                 Ortac_runtime.Gospelstdlib.(<=)
                   (Ortac_runtime.Gospelstdlib.integer_of_int 0)
                   (Ortac_runtime.Gospelstdlib.integer_of_int pos) in
               let __t2__027_ =
                 let __t1__028_ =
                   Ortac_runtime.Gospelstdlib.(<=)
                     (Ortac_runtime.Gospelstdlib.integer_of_int 0)
                     (Ortac_runtime.Gospelstdlib.integer_of_int len) in
                 let __t2__029_ =
                   Ortac_runtime.Gospelstdlib.(<)
                     (Ortac_runtime.Gospelstdlib.(+)
                        (Ortac_runtime.Gospelstdlib.integer_of_int pos)
                        (Ortac_runtime.Gospelstdlib.integer_of_int len))
                     (Ortac_runtime.Gospelstdlib.Sequence.length
                        state__017_.contents) in
                 __t1__028_ && __t2__029_ in
               __t1__026_ && __t2__027_
             with
             | e ->
                 raise
                   (Ortac_runtime.Partial_function
                      (e,
                        {
                          Ortac_runtime.start =
                            {
                              pos_fname = "varray_spec.mli";
                              pos_lnum = 211;
                              pos_bol = 12225;
                              pos_cnum = 12238
                            };
                          Ortac_runtime.stop =
                            {
                              pos_fname = "varray_spec.mli";
                              pos_lnum = 211;
                              pos_bol = 12225;
                              pos_cnum = 12300
                            }
                        })))
          then (match res with | Ok _ -> true | _ -> false)
          else
            (match res with | Error (Invalid_argument _) -> true | _ -> false)
      | _ -> true
    let run cmd__032_ sut__033_ =
      match cmd__032_ with
      | Push_back x -> Res (unit, (push_back sut__033_ x))
      | Pop_back ->
          Res
            ((result (elt char) exn),
              (protect (fun () -> pop_back sut__033_) ()))
      | Push_front x_1 -> Res (unit, (push_front sut__033_ x_1))
      | Pop_front ->
          Res
            ((result (elt char) exn),
              (protect (fun () -> pop_front sut__033_) ()))
      | Insert_at (i_1, x_2) ->
          Res
            ((result unit exn),
              (protect (fun () -> insert_at sut__033_ i_1 x_2) ()))
      | Pop_at i_2 ->
          Res
            ((result (elt char) exn),
              (protect (fun () -> pop_at sut__033_ i_2) ()))
      | Delete_at i_3 ->
          Res
            ((result unit exn),
              (protect (fun () -> delete_at sut__033_ i_3) ()))
      | Get i_4 ->
          Res
            ((result (elt char) exn),
              (protect (fun () -> get sut__033_ i_4) ()))
      | Set (i_5, v) ->
          Res
            ((result unit exn), (protect (fun () -> set sut__033_ i_5 v) ()))
      | Length -> Res (int, (length sut__033_))
      | Is_empty -> Res (bool, (is_empty sut__033_))
      | Fill (pos, len, x_3) ->
          Res
            ((result unit exn),
              (protect (fun () -> fill sut__033_ pos len x_3) ()))
  end
module STMTests = (STM_sequential.Make)(Spec)
let _ =
  QCheck_base_runner.run_tests_main
    (let count = 1000 in
     [STMTests.agree_test ~count ~name:"Varray_spec STM tests"])
