---
Owner: Tim Pearson
---
```OCaml
open Printf
open Dict
let () =
  if Array.length Sys.argv <> 2 then begin
    eprintf "Usage: %s <dictionary_file>\n" Sys.argv.(0);
    exit 1
  end;
  let dictionary = Sys.argv.(1) in
  let dict = ref Dict.empty in
  let parse_line line =
    match String.split_on_char ':' line with
    | [word; def_str] ->
        let defs = String.split_on_char ';' def_str |> List.map String.trim in
        List.iter (fun def -> dict := Dict.add_def !dict ~word ~def) defs
    | _ -> ()
  in
  let df = open_in dictionary in
  try
    while true do
      let line = input_line df in
      parse_line line
    done
  with End_of_file -> close_in df;
let rec read_cmds () =
  let opt = try Some (input_line stdin) with End_of_file -> None in
  match opt with
  | Some line ->
      if line = "" then
        read_cmds ()
      else
        begin
          match line with
          | "entries" ->
              printf "entries:\n";
              Dict.get_entries !dict |> List.iter (fun entry ->
                printf "- %s\n" entry
              );
              read_cmds ()
          | cmd ->
              let cmd_parts = String.split_on_char ' ' cmd in
              match cmd_parts with
              | "definition" :: word :: [] ->
                  printf "definition %s:\n" word;
                  Dict.get_defs !dict word |> List.iter (fun def ->
                    printf "- %s\n" def
                  );
                  read_cmds ()
              | "synonyms" :: word :: [] ->
                  printf "synonyms %s:\n" word;
                  Dict.get_synonyms !dict word |> List.iter (fun synonym ->
                    printf "- %s\n" synonym
                  );
                  read_cmds ()
              | _ ->
                  printf "Invalid command\n";
                  read_cmds ()
        end
  | None ->
      ()
in
read_cmds ()
```
```OCaml
type t = (string * string list) list
let empty = []
let rec add_def dict ~word ~def =
  match dict with
  | [] -> [(word, [def])]
  | (w, defs) :: tl when w = word ->
      (word, def :: defs) :: tl
  | hd :: tl -> hd :: add_def tl ~word ~def

  let rec get_defs dict word =
  match dict with
  | [] -> []
  | (w, defs) :: tl when w = word -> defs
  | _ :: tl -> get_defs tl word
let rec get_synonyms dict word =
  let synonyms = List.filter_map (fun (w, defs) ->
    if List.mem word defs then Some w else None
  ) dict in
  List.sort compare synonyms
let get_entries dict =
  List.map fst dict |> List.sort compare
```