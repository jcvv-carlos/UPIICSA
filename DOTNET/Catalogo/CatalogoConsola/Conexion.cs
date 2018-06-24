using System;
using System.Data;
using System.IO;
using System.Data.SQLite;
using System.Xml;

namespace CatalogoConsola
{
	public class Conexion{

		private string file;
		private SQLiteConnection cnx;
		private SQLiteCommand cmd;

		public Conexion (String file){
			this.file = file;

			// COMPROBAR QUE EL ARCHIVO EXISTA
			if (!File.Exists (this.file)) {
				FileStream fs;
				fs = File.Create (this.file);
				fs.Dispose ();
				Console.WriteLine ("Msj: Se ha creado la base de datos");
			}

			this.ejecutar (@"CREATE TABLE IF NOT EXISTS autoparte( id INTEGER PRIMARY KEY AUTOINCREMENT, codigoParte TEXT NOT NULL, marca TEXT NOT NULL, categoria TEXT NOT NULL, descripcion TEXT NOT NULL, precio REAL NOT NULL )");
		}

		public DataTable getAutopartes(){
			DataTable tabla = new DataTable ();

			if (conectar ()) {
				cmd.CommandText = "SELECT * FROM autoparte";
				tabla.Load(cmd.ExecuteReader ());
				cmd.Dispose ();
				cnx.Close ();
			}
			return tabla;
		}

		public bool ejecutar(String query){
			if (conectar ()) {
				try{
					cmd.CommandText = query;
					cmd.ExecuteNonQuery ();
					cmd.Dispose ();
					cnx.Close ();
					return true;
				}catch (Exception e){
					cmd.Dispose ();
					cnx.Close ();
					Console.WriteLine ("Msj: No se pudo completar la operacion: " + e.Message);
					return false;
				}
			}
			return false;
		}

		private bool conectar(){
			try{
				cnx = new SQLiteConnection(@"Data Source=" + this.file + ";Version= 3; New=False;Compress=True;");
				cnx.Open ();
				cmd = new SQLiteCommand("", cnx);
				return true;
			}catch{
				Console.WriteLine ("Msj: Error de conexion");
				return false;
			}
		}
	}
}
