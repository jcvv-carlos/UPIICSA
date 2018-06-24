<%@ Page Language="C#" Inherits="CatalogoWeb.Default" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head runat="server">
	<title>Catalogo de autopartes</title>
    <META charset="UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style type="text/css">
		#fondo {
			width: 100%;
			height: 100%;
			position: absolute;
			top: 0px;
			left: 0px;
			display: none; 
			background-color: #000000;
			opacity: 0.6;
		}
		#flotante {
			position: absolute;
			top: 50%;
			left: 50%;
			transform: translate(-50%,-50%);
			display: none;
		}
	</style>
</head>
<body>
<form runat="server">
    	        <div class="jumbotron text-center" style="background: #2f4357; color:#FFFFFF; ">
	            <h2>Catalogo de autopartes</h2>
	        </div>
    <div id="container" class="container">

	    <div id="content">
	        <div class="panel panel-default">
				<div class="panel-body">
					<div class="row">
						<div class="col-sm-12">
							<h4>Catalogo > <asp:LinkButton id="lnk1" runat="server" OnCommand="mostrar" Text="Agregar autoparte"/></h4><br/>
							<asp:DataGrid id="grid" runat="server" AutoGenerateColumns="False" Style="font: 10px Arial" CssClass="table table-striped table-bordered" 
			                    OnEditCommand="Grid_Editar"
			                    OnCancelCommand="Grid_Cancelar"
			                    OnUpdateCommand="Grid_Actualizar"
			                    OnItemCommand="Grid_Comando" >
			                    <Columns>
			                        <asp:BoundColumn HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderText="Codigo" ReadOnly="False" DataField="codigoParte"/>
			                        <asp:BoundColumn HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderText="Marca" ReadOnly="False" DataField="marca"/>
			                        <asp:BoundColumn HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderText="Categoria" ReadOnly="False" DataField="categoria"/>
			                        <asp:BoundColumn HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderText="Descripcion" ReadOnly="False" DataField="descripcion"/>
			                        <asp:BoundColumn HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderText="Precio" ReadOnly="False" DataField="precio"/>

			                        <asp:EditCommandColumn ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Center"  EditText="Editar" CancelText="Cancelar" UpdateText="Actualizar" HeaderText="">
			                            <ItemStyle Wrap="False" />
			                            <HeaderStyle Wrap="False" />
			                        </asp:EditCommandColumn>
			                        <asp:ButtonColumn ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Center" HeaderText="" ButtonType="LinkButton" Text="Eliminar" CommandName="btnEliminar"/>
			                    </Columns>
			                </asp:DataGrid>
						</div>
					</div>
				</div>
	        </div>
        </div>
    </div>
	<!-- INICIO DIV FLOTANTE -->
	<div runat="server" id="fondo"></div>
	<div runat="server" id="flotante" class="col-sm-6">
		<div class="panel panel-default">
			<div class="panel-body">
				<h4>Agregar autoparte</h4><br/>
			    <div class="form-group">
				    <asp:TextBox runat="server" id="codigoText" CssClass="form-control" placeholder="Codigo" />
			    </div>
				<div class="form-group">
					<asp:DropDownList id="marcaLista" placeholder="Marca" CssClass="form-control" SelectionMode="Single" runat="server">
		                <asp:ListItem>Acura</asp:ListItem>
						<asp:ListItem>Audi</asp:ListItem>
						<asp:ListItem>BMW</asp:ListItem>
						<asp:ListItem>Cadillac</asp:ListItem>
						<asp:ListItem>Chevrolet</asp:ListItem>
						<asp:ListItem>Dodge / Chrysler</asp:ListItem>
						<asp:ListItem>Fiat</asp:ListItem>
						<asp:ListItem>Ford</asp:ListItem>
						<asp:ListItem>Honda</asp:ListItem>
						<asp:ListItem>Hyundai</asp:ListItem>
						<asp:ListItem>International</asp:ListItem>
						<asp:ListItem>Isuzu</asp:ListItem>
						<asp:ListItem>Jeep</asp:ListItem>
						<asp:ListItem>Kia</asp:ListItem>
						<asp:ListItem>Lincoln</asp:ListItem>
						<asp:ListItem>Mazda</asp:ListItem>
						<asp:ListItem>Mercedes Benz</asp:ListItem>
						<asp:ListItem>Mini Cooper</asp:ListItem>
						<asp:ListItem>Mitsubishi</asp:ListItem>
						<asp:ListItem>Nissan</asp:ListItem>
						<asp:ListItem>Peugeot</asp:ListItem>
						<asp:ListItem>Renault</asp:ListItem>
						<asp:ListItem>Saturn</asp:ListItem>
						<asp:ListItem>Scion</asp:ListItem>
						<asp:ListItem>Seat</asp:ListItem>
						<asp:ListItem>Subaru</asp:ListItem>
						<asp:ListItem>Suzuki</asp:ListItem>
						<asp:ListItem>Toyota</asp:ListItem>
						<asp:ListItem>Volkswagen</asp:ListItem>
						<asp:ListItem>Volvo</asp:ListItem>
						<asp:ListItem>ZUNIVERSAL</asp:ListItem>
	                </asp:DropDownList>	
				</div>
				<div class="form-group">
					<asp:DropDownList id="categoriaLista" CssClass="form-control" SelectionMode="Single" runat="server">
						<asp:ListItem>Alerones de Defensa</asp:ListItem>
						<asp:ListItem>Amortiguadores Suspension</asp:ListItem>
						<asp:ListItem>Antimpactos de Defensa</asp:ListItem>
						<asp:ListItem>Bases de Faro</asp:ListItem>
						<asp:ListItem>Bed Liners</asp:ListItem>
						<asp:ListItem>Bigoteras</asp:ListItem>
						<asp:ListItem>Bisagras de Cofre</asp:ListItem>
						<asp:ListItem>Biseles</asp:ListItem>
						<asp:ListItem>Brazos de Defensa</asp:ListItem>
						<asp:ListItem>Bulbos</asp:ListItem>
						<asp:ListItem>Calaveras</asp:ListItem>
						<asp:ListItem>Chapas y Contrachapas</asp:ListItem>
						<asp:ListItem>Chicotes de Tapa de Caja</asp:ListItem>
						<asp:ListItem>Cofres</asp:ListItem>
						<asp:ListItem>Condensadores</asp:ListItem>
						<asp:ListItem>Costados</asp:ListItem>
						<asp:ListItem>Cuartos</asp:ListItem>
						<asp:ListItem>Defensas Delanteras</asp:ListItem>
						<asp:ListItem>Defensas Traseras</asp:ListItem>
						<asp:ListItem>Deposito Limpiaparabrisas</asp:ListItem>
						<asp:ListItem>Deposito Recuperador</asp:ListItem>
						<asp:ListItem>Elevadores de Cristal</asp:ListItem>
						<asp:ListItem>Espejos Laterales</asp:ListItem>
						<asp:ListItem>Estribos</asp:ListItem>
						<asp:ListItem>Euroguards</asp:ListItem>
						<asp:ListItem>Faros</asp:ListItem>
						<asp:ListItem>Faros de Niebla</asp:ListItem>
						<asp:ListItem>Guias de Defensa</asp:ListItem>
						<asp:ListItem>Lienzos de Costado y Puerta</asp:ListItem>
						<asp:ListItem>Lunas de Espejo</asp:ListItem>
						<asp:ListItem>Manijas Elevador de Cristal e Interior de Puerta</asp:ListItem>
						<asp:ListItem>Manijas Exteriores de Puerta y de Tapa de Caja</asp:ListItem>
						<asp:ListItem>Marco de Parrilla</asp:ListItem>
						<asp:ListItem>Marcos de Radiador</asp:ListItem>
						<asp:ListItem>Moldura de Canuela</asp:ListItem>
						<asp:ListItem>Molduras Arco</asp:ListItem>
						<asp:ListItem>Molduras de Cofre</asp:ListItem>
						<asp:ListItem>Molduras de Defensa</asp:ListItem>
						<asp:ListItem>Molduras de Faro</asp:ListItem>
						<asp:ListItem>Molduras de Parrilla</asp:ListItem>
						<asp:ListItem>Molduras de Puerta</asp:ListItem>
						<asp:ListItem>Molduras de Rollo</asp:ListItem>
						<asp:ListItem>Molduras de Salpicadero o Costado</asp:ListItem>
						<asp:ListItem>Molduras de Tapa de Cajuela</asp:ListItem>
						<asp:ListItem>Motoventiladores</asp:ListItem>
						<asp:ListItem>Parrillas</asp:ListItem>
						<asp:ListItem>Portaplacas</asp:ListItem>
						<asp:ListItem>Puertas</asp:ListItem>
						<asp:ListItem>Radiadores</asp:ListItem>
						<asp:ListItem>Radiadores de Aluminio</asp:ListItem>
						<asp:ListItem>Refuerzos de Defensa</asp:ListItem>
						<asp:ListItem>Resortes de Gas</asp:ListItem>
						<asp:ListItem>Salpicaderas</asp:ListItem>
						<asp:ListItem>Spoilers</asp:ListItem>
						<asp:ListItem>Tapas de Caja y Cajuela</asp:ListItem>
						<asp:ListItem>Tapon Deposito Limpiaparabrisas y Recuperador</asp:ListItem>
						<asp:ListItem>Tolva Calavera</asp:ListItem>
						<asp:ListItem>Tolva Escalon</asp:ListItem>
						<asp:ListItem>Tolvas Inferiores de Parabrisas</asp:ListItem>
						<asp:ListItem>Tolvas Inferiores y Superiores de Defensa</asp:ListItem>
						<asp:ListItem>Tolvas Interiores de Salpicadero</asp:ListItem>
						<asp:ListItem>Tolvas Lodera</asp:ListItem>
						<asp:ListItem>Tolvas Radiador y Sup Marco de Radiador</asp:ListItem>
					</asp:DropDownList>
				</div>
	            <div class="form-group">
	                <asp:TextBox runat="server" id="descripcionText" TextMode="MultiLine" placeholder="Descripcion" Rows="4" CssClass="form-control" />
	            </div>
				<div class="form-group">
	                <asp:TextBox runat="server" id="precioText" placeholder="Precio $0.00" CssClass="form-control" />
	            </div>
	            <div class="form-group" style="text-align:right">
	                <asp:Button id="b2" runat="server" Text="Cancelar" OnClick="cancelar" CssClass="btn btn-secondary btn-lg"/>
	            	<asp:Button id="b1" runat="server" Text="Agregar" OnClick="insertar" CssClass="btn btn-primary btn-lg"/>
	            </div>
			</div>
		</div>
	</div>
	<!-- FIN DIV FLOTANTE -->
</form>
</body>
</html>
	