@extends('layouts.app')

@section('content')
    <!-- APP MAIN ==========-->
    <main id="app-main" class="app-main">
        <div class="wrap">
            <section class="app-content">
                <div class="row">
                    <div class="col-md-6 col-lg-6">
                        <div class="widget">
                            <header class="widget-header">
                                <h4 class="widget-title">Nueva venta</h4>
                            </header><!-- .widget-header -->
                            <hr class="widget-separator">
                            <div class="widget-body">
                                <form method="POST" action="{{url('client')}}" class="new-register"
                                      enctype="multipart/form-data">
                                    {{ csrf_field() }}
                 <div class="form-group">
                                        <table>
    										<tr>
        										<td>
                                        		<label for="amount">Monto en Bs.:</label>
                                        		 <input type="number" step="any" min="1" name="monto"
                                               class="form-control" id="monto" required>
                                        		</td>
        										<td>
                                                	<label for="amount">Cantidad de cuotas:</label>
                                                    <input type="number" class="form-control" name="tiempo"  id="tiempo" value="1">
                                                </td>
    										</tr>
						
                                       
    										<tr>
        										<td>
                                                    <label for="utility">Utilidad en %:</label>
                                                    <input type="number" class="form-control" value="3" name="interes" id="interes" readonly></td>
        										<td>
                                                    <br />
                                                    <a href="#" class="btn btn-dark btn-block"  id="btnCalcular">Calcular</a></td>
    										</tr>
                                            <tr>
                                                   <td>
                                                      <label for="nit_number">Nº Identificacion:</label>
                                        <input type="text" name="nit_number" value="{{isset($user) ? $user->nit : ''}}"
                                               class="form-control" id="nit_number" required>
                                                    </td>
                                                      <td>
                                                        <label for="phone">Teléfono:</label>
                                        <input type="tel" name="phone" value="{{isset($user) ? $user->phone : ''}}"
                                               class="form-control" id="phone" required>
                                                      </td>
                                            </tr>
										</table>
                                    </div>
                                                    
       
                                    <div class="form-group">
                                        <label for="name">Nombres:</label>
                                        <input type="text" name="name" value="{{isset($user) ? $user->name : ''}}"
                                               class="form-control" id="name" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="last_name">Apellidos:</label>
                                        <input type="text" name="last_name"
                                               value="{{isset($user) ? $user->last_name : ''}}" class="form-control"
                                               id="last_name" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="address">Direccion:</label>
                                        <input type="text" name="address" value="{{isset($user) ? $user->address : ''}}"
                                               placeholder="" class="form-control g-autoplaces-address" id="address"
                                               required>
                                    </div>
                                    <div class="form-group d-none over-change-display">
                                        <label for="address">Mapa:</label>
                                        <div id="map" class="map-google"></div>
                                    </div>
                                    <input type="hidden" name="lat" value="{{isset($user) ? $user->lat : ''}}"
                                           class="form-control" id="lat">
                                    <input type="hidden" name="lng" value="{{isset($user) ? $user->lng : ''}}"
                                           class="form-control" id="lng">

                  
                  
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-success btn-block btn-md">Guardar</button>
                                    </div>
                                </form>

                            </div><!-- .widget-body -->
                        </div><!-- .widget -->
                    </div><!-- END column -->
                    <div class="col-md-6 col-lg-6">
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
    <script src="{{ asset('js/amortizacion.js') }}"></script>
    <script src="{{ asset('js/moment.js') }}"></script>
@endsection