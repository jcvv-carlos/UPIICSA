using System;
using System.Data;

namespace CatalogoConsola
{
	class MainClass
	{
		public static void Main (string[] args)
		{
			Conexion con = new Conexion (@"C:\BD\catalogo.sqlite");
			String op = "";

			do{
				String s = "--- CATALOGO DE AUTOPARTES ---\n";
				Console.SetCursorPosition ((Console.WindowWidth - s.Length)/2, Console.CursorTop);
				Console.WriteLine (s);
				Console.WriteLine ("----------------------------------------------------------------------------------------------------------------------");
				Console.WriteLine ("| {0}| {1}| {2}| {3}| {4}| {5}|",fix("ID",10),fix("Codigo",15),fix("Marca",15),fix("Categoria",15),fix("Descripcion",40),fix("Precio",10));
				Console.WriteLine ("----------------------------------------------------------------------------------------------------------------------");
				DataSet dst = new DataSet ("Autopartes");
				dst.Tables.Add (con.getAutopartes ());
				foreach (DataRow row in dst.Tables[0].Rows) Console.WriteLine ("| {0}| {1}| {2}| {3}| {4}| {5}|",fix(row[0],10),fix(row[1],15),fix(row[2],15),fix(row[3],15),fix(row[4],40),fix(row[5],10));

				Console.WriteLine ("----------------------------------------------------------------------------------------------------------------------\n");
				Console.WriteLine ("1. Agregar autoparte");
				Console.WriteLine ("2. Quitar autoparte");
				Console.WriteLine ("3. Modificar autoparte");
				Console.WriteLine ("4. Salir\n");
				Console.Write ("Escriba una opcion: ");
				op = Console.ReadLine ();

				switch(op){
				case "1":
					con.ejecutar(insertarAutoparte());
					Console.WriteLine("Presione una tecla para continuar . . .");
					Console.Read();
					break;
				case "2":
					Console.Write("Escriba el ID que desea eliminar: ");
					con.ejecutar("DELETE FROM autoparte WHERE id='" + Console.ReadLine() + "'");
					Console.WriteLine("Presione una tecla para continuar . . .");
					Console.Read();
					break;
				case "3":
					Console.Write("Escriba el ID que desea modificar: ");
					int id=0; // = Convert.ToInt32(Console.ReadLine());
					if(Int32.TryParse(Console.ReadLine(), out id)){
						String query = actualizarAutoparte (dst.Tables[0].Rows.Find(id));
						con.ejecutar(query);
					}else{
						Console.WriteLine("Err: Escriba un id valido");
					}
					Console.WriteLine("Presione una tecla para continuar . . .");
					Console.Read();
					break;
				}

				Console.Clear();

			} while(op!="4");
		}

		public static String insertarAutoparte(){
			String codigoParte, marca, categoria, descripcion, precio;
			Console.Clear();
			Console.WriteLine("--- AGREGAR AUTOPARTE ---");
			Console.Write("\nCodigo: ");
			codigoParte = Console.ReadLine();
			Console.Write("Marca: ");
			marca = Console.ReadLine();
			Console.Write("Categoria: ");
			categoria = Console.ReadLine();
			Console.Write("Descripcion: ");
			descripcion = Console.ReadLine();
			Console.Write("Precio: ");
			precio = Console.ReadLine();

			return "INSERT INTO autoparte (codigoParte, marca, categoria, descripcion, precio) VALUES ('" + codigoParte + "','" + marca + "','" + categoria + "','" + descripcion + "','" + precio + "')";
		}

		public static String actualizarAutoparte(DataRow row){
			String query = "";			String op;

			Console.Clear();
			Console.WriteLine("--- ACTUALIZAR AUTOPARTE ---");

			if(row!=null){
				Console.WriteLine ("-------------------------------------------------------------------------------------------------------");
				Console.WriteLine ("{0}{1}{2}{3}{4}{5}",fix("ID",10),fix("Codigo",15),fix("Marca",15),fix("Categoria",15),fix("Descripcion",40),fix("Precio",10));
				Console.WriteLine ("-------------------------------------------------------------------------------------------------------");
				Console.WriteLine ("{0}{1}{2}{3}{4}{5}",fix(row[0],10),fix(row[1],15),fix(row[2],15),fix(row[3],15),fix(row[4],40),fix(row[5],10));
				Console.WriteLine ("-------------------------------------------------------------------------------------------------------\n");

				Console.WriteLine ("1. Codigo\n2. Marca\n3. Categoria\n4. Descripcion\n5. Precio\n6. Cancelar\n");
				Console.WriteLine ("Escriba una opcion: ");
				op = Console.ReadLine ();
				query = "UPDATE autoparte SET ";

				switch(op){
				case "1":
					query += "codigoParte='";
					break;
				case "2":
					query += "marca='";
					break;
				case "3":
					query += "categoria='";
					break;
				case "4":
					query += "descripcion='";
					break;
				case "5":
					query += "precio='";
					break;
				case "6":
					return "";
				}

				Console.Write ("Escriba el nuevo valor: ");
				query += Console.ReadLine () + "' WHERE id='" + row[0] + "'";
			}else{
				Console.WriteLine("Msj: No se encontro la autoparte deseada");
			}
			return query;
		}

		public static String fix(Object obj, int longitud){
			String final;
			String inicial = Convert.ToString (obj);

			if (inicial.Length > longitud) {
				final = inicial.Substring (0, longitud);
			} else {
				int faltante = longitud - inicial.Length;
				for(int i =0; i<faltante; i++) inicial += " ";
				final = inicial;
			}
			return final;
		}
	}
}
