type term = Pre of string | Post of string

type error_kind = Violated | RuntimeExn of exn

type error =
  | Condition of {
      loc : Ppxlib.location;
      fun_name : string;
      term : term;
      error_kind : error_kind;
    }

val report : Format.formatter -> error -> unit

exception Error of error

val runtime_exn : Ppxlib.location -> string -> term -> exn -> 'a

val violated : Ppxlib.location -> string -> term -> 'a

module Z : sig
  include module type of Z

  val forall : t -> t -> (t -> bool) -> bool
  (** [forall i j p] is [true] iff the predicate `p` holds forall [k] within [i]
     and [j], included. *)
end

module Array : sig
  val create : Z.t -> 'a -> 'a array

  val get : 'a array -> Z.t -> 'a

  val length : 'a array -> Z.t
end
