@extends('layouts.app')

@section('content')
    <!-- APP MAIN ==========-->
    <main id="app-main" class="app-main">
        <div class="wrap">
            <section class="app-content">
                <div class="row">
                    <div class="col-md-6 col-lg-6 ">
                        <div class="widget">
                            <header class="widget-header">
                                <h4 class="widget-title">Simulador con el método de amortización francés</h4>
                            </header><!-- .widget-header -->
                            <hr class="widget-separator">
                            <div class="widget-body">
                                <div class="form-group">
                                    <label for="monto">Monto</label>
                                    <input type="text" class="form-control" id="monto" placeholder="Ingresar monto">
                                </div>
                                <div class="form-group">
                                    <label for="tiempo">Tiempo en Meses</label>
                                    <input type="text" class="form-control" id="tiempo" placeholder="Ingresar cantidad de meses">
                                </div>
                                <div class="form-group">
                                    <label for="interes">Interés Mensual</label>
                                    <input type="text" class="form-control" id="interes" placeholder="Ingresar tasa de interés mensual">
                                </div>
                                <button type="submit" class="btn btn-primary" id="btnCalcular">Calcular</button>                
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
                                    
                                    