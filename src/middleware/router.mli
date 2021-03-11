(* This file is part of Dream, released under the MIT license. See
   LICENSE.md for details, or visit https://github.com/aantron/dream.

   Copyright 2021 Anton Bachin *)



module Dream = Dream_pure.Inmost

type route

(* Leaf routes. *)
val get : string -> Dream.handler -> route
val post : string -> Dream.handler -> route

(* Route groups. *)
val scope : string -> Dream.middleware list -> route list -> route

(* The middleware and the path parameter retriever. With respect to path
   parameters ("crumbs"), the middleware is the setter, and the retriever is,
   of course, the getter. *)
val router : route list -> Dream.middleware
val crumb : string -> Dream.request -> string

(**/**)

type token =
  | Literal of string
  | Variable of string

val parse : string -> token list
