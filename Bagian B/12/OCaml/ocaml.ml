(* Read matrix from file *)
let read_matrix filename =
  let ic = open_in filename in
  let n = int_of_string (input_line ic) in
  let matrix = Array.init n (fun _ ->
    let line = input_line ic in
    let numbers = String.split_on_char ' ' line in
    Array.of_list (List.map float_of_string numbers))
  in
  close_in ic;
  (matrix, n)

(* Write matrix to file *)
let write_matrix filename matrix n =
  let oc = open_out filename in
  for i = 0 to n - 1 do
    for j = 0 to n - 1 do
      Printf.fprintf oc "%e " matrix.(i).(j)
    done;
    Printf.fprintf oc "\n"
  done;
  close_out oc

(* Gauss-Jordan elimination to find the inverse matrix *)
let gauss_jordan matrix n =
  let identity = Array.init n (fun i -> Array.init n (fun j -> if i = j then 1. else 0.)) in
  (* Augment the matrix with the identity matrix to form [A|I] *)
  let augmented = Array.init n (fun i -> Array.append matrix.(i) identity.(i)) in
  (* Apply Gauss-Jordan elimination *)
  for i = 0 to n - 1 do
    (* Find pivot *)
    let pivot = augmented.(i).(i) in
    if pivot = 0. then failwith "Matrix is singular";
    (* Normalize pivot row *)
    for j = 0 to 2 * n - 1 do
      augmented.(i).(j) <- augmented.(i).(j) /. pivot
    done;
    (* Eliminate other rows *)
    for k = 0 to n - 1 do
      if k <> i then
        let factor = augmented.(k).(i) in
        for j = 0 to 2 * n - 1 do
          augmented.(k).(j) <- augmented.(k).(j) -. factor *. augmented.(i).(j)
        done
    done
  done;
  (* Extract the inverse from the augmented matrix *)
  Array.init n (fun i -> Array.sub augmented.(i) n n)

(* Main function *)
let () =
  let filename = "input.txt" in
  let matrix, n = read_matrix filename in
  try
    let inverse = gauss_jordan matrix n in
    let out_filename = "output.txt" in
    write_matrix out_filename inverse n
  with
  | Failure msg -> Printf.printf "Error: %s\n" msg