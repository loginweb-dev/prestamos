@extends('layouts.app')

@section('content')
    <!-- APP MAIN ==========-->
    <main id="app-main" class="app-main">
        <div class="wrap">
            <section class="app-content">
                <div class="row">
                    <div class="col-sm-5">
                        <div class="widget">
                            <header class="widget-header">
                                <h4 class="widget-title">Nuevo prestamo</h4>
                            </header><!-- .widget-header -->
                            <hr class="widget-separator">
                            <div class="widget-body">
                                <form method="POST" action="{{ url('client') }}" class="new-register" enctype="multipart/form-data">
                                    {{ csrf_field() }}
                                    <div class="form-group">
                                        <table class="table">
                                            <tr>
        										<td colspan="2">
                                        		    <label for="amount">Clase de prestamo:</label>
                                                
                                        		    <select name="" id="" class="form-control">
                                                        <option value="">opt1</option>
                                                    </select>
                                        		</td>
    										</tr>	
    										<tr>
        										<td>
                                        		    <label for="amount">Monto en Bs:</label>
                                        		    <input type="number" step="any" min="1" name="monto" class="form-control" id="monto" required value="6000" />
                                        		</td>
        										<td>
                                                	<label for="amount">Cantidad de cuotas:</label>
                                                    <input type="number" class="form-control" name="tiempo"  id="tiempo" value="1">
                                                </td>
    										</tr>						                                       
    										<tr>
        										<td>
                                                    <label for="utility">Interes acordado:</label>
                                                    <input type="number" class="form-control" value="0.03" name="interes" id="interes"></td>
        										<td>
                                                    <br />
                                                    <a href="#" class="btn btn-dark btn-block"  id="btnCalcular">Calcular</a></td>
    										</tr>
                                            <tr>
                                                <td>
                                                    <label for="nit_number">Nº Identificacion:</label>
                                                    <input type="number" name="nit_number" value="5619016"
                                               class="form-control" id="nit_number" required>
                                                </td>
                                                <td>
                                                    <label for="phone">Teléfono:</label>
                                                    <input type="tel" name="phone" value="72823861"
                                               class="form-control" id="phone" required>
                                                </td>
                                            </tr>
                                            
                                            <tr>
                                                <td>
                                                    <label for="nit_number">Nombres:</label>
                                                    <input type="text" name="name" value="luis"
                                               class="form-control" id="name" required>
                                                </td>
                                                <td>
                                                    <label for="last_name">Apellidos:</label>
                                                    <input type="text" name="last_name"
                                                    value="flores" class="form-control"
                                                    id="last_name">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="">Direccion:</label>
                                                    <input type="text" name="address" value="" placeholder="" class="form-control g-autoplaces-address" id="address" />
                                                </td>
                                                <td>
                                                    <label for="">Localidad:</label>
                                                    <select name="" id="" class="form-control">
                                                        <option value=""></option>
                                                    </select>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <label for="">Perfil:</label>
                                                    <input type="file" name="" value="" placeholder="" class="form-control" id="" />
                                                </td>
                                                <td>
                                                    <label for="">Documentos:</label>
                                                    <input type="file" name="" value="" placeholder="" class="form-control" id="" />
                                                </td>
                                            </tr>

										</table>
                                    </div>
                                                    
                                    <div class="form-group d-none over-change-display">
                                        <label for="address">Mapa:</label>
                                        <div id="map" class="map-google"></div>
                                    </div>
                                    <input type="hidden" name="lat" value=""
                                           class="form-control" id="lat">
                                    <input type="hidden" name="lng" value=""
                                           class="form-control" id="lng">
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-primary btn-block btn-md">Guardar</button>
                                    </div>
                                </form>
                            </div><!-- .widget-body -->
                        </div><!-- .widget -->
                    </div><!-- END column -->
                    <div class="col-sm-7">
                        <div class="widget">
                            <table id="lista-tabla" class="table">
                                <thead>
                                    <tr>
                                        <th>Fecha</th>
                                        <th>Cuota</th>
                                        <th>Capital</th>
                                        <th>Interés</th>
                                        <th>Saldo</th>
                                    </tr>
                                </thead>
                                <tbody></tbody>
                            </table>
                        </div>
                    </div>
                </div><!-- .row -->
            </section>
        </div>
    </main>
@endsection

@section('javascript')
    {{-- <script src="{{ asset('js/amortizacion.js') }}"></script> --}}
    <script src="{{ asset('js/moment.js') }}"></script>
    <script>
        const monto = document.getElementById('monto');
        const tiempo = document.getElementById('tiempo');
        const interes = document.getElementById('interes');
        const btnCalcular = document.getElementById('btnCalcular');
        const llenarTabla = document.querySelector('#lista-tabla tbody');
        btnCalcular.addEventListener('click', () => {
            calcularCuota(monto.value, interes.value, tiempo.value);
        })
        function calcularCuota(monto, interes, tiempo){

            while(llenarTabla.firstChild){
                llenarTabla.removeChild(llenarTabla.firstChild);
            }

            let fechas = [];
            let fechaActual = Date.now();
            let mes_actual = moment(fechaActual);
            mes_actual.add(1, 'month');    

            let pagoInteres=0, pagoCapital = 0, cuota = 0;

            cuota = monto * (Math.pow(1+interes/100, tiempo)*interes/100)/(Math.pow(1+interes/100, tiempo)-1);

            for(let i = 1; i <= tiempo; i++) {

                pagoInteres = parseFloat(monto*(interes/100));
                pagoCapital = cuota - pagoInteres;
                monto = parseFloat(monto-pagoCapital);

                //Formato fechas
                fechas[i] = mes_actual.format('MM-YY');
                mes_actual.add(1, 'month');

                const row = document.createElement('tr');
                row.innerHTML = `
                    <td>${fechas[i]}</td>
                    <td>${cuota.toFixed(2)}</td>
                    <td>${pagoCapital.toFixed(2)}</td>
                    <td>${pagoInteres.toFixed(2)}</td>
                    <td>${monto.toFixed(2)}</td>
                `;
                llenarTabla.appendChild(row)
            }
        }
    </script>
@endsection