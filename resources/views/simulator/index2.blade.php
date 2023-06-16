@extends('layouts.app')

@section('content')
    <!-- APP MAIN ==========-->
    <main id="app-main" class="app-main">
        <div class="wrap">
            <section class="app-content">
                <div class="row">
                    <div class="col-sm-3">
                        <div class="widget">
                            <header class="widget-header">
                                <h2 class="widget-title">Simulador de prestamos</h2>
                            </header><!-- .widget-header -->
                            <hr class="widget-separator">
                            <div class="widget-body">
                                <div class="form-group">
                                    <label for="monto">Tipo</label>
                                    <select name="" id="type" class="form-control">
                                        <option value="1">Prest. tipo 1</option>
                                        <option value="2">Prest. tipo 2</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="monto">Monto</label>
                                    <input type="number" class="form-control" id="monto" placeholder="Ingresar monto" value="10000">
                                </div>
                                <div class="form-group">
                                    <label for="tiempo">Tiempo en Meses</label>
                                    <input type="number" class="form-control" id="tiempo" placeholder="Ingresar cantidad de meses" value="12">
                                </div>
                                <div class="form-group">
                                    <label for="interes">Interés del prestamo</label>
                                    <input type="number" class="form-control" id="interes" placeholder="Ingresar tasa de interés mensual" value="0.03">
                                </div>
                                <div class="form-group">
                                    <label for="interes">Pago Mensual</label>
                                    <input type="number" class="form-control" id="pmensual" placeholder="Pago mensual" value="1133.33">
                                </div>
                                {{-- <div class="form-group">
                                    redondear montos
                                    <input type="checkbox" class="form-control">
                                </div> --}}
                                <hr class="widget-separator">
                                <button type="submit" class="btn btn-primary btn-block" id="btnCalcular">Calcular</button>                
                                </div><!-- .widget-body -->
                            </div><!-- .widget -->
                        </div><!-- END column -->
					<div class="col-sm-9">
                        <div class="widget">
                            <table id="lista-tabla" class="table">
                                <thead>
                                    <tr>
                                        <th>MES</th>
                                        <th>NRO</th>
                                        <th>MONTO</th>
                                        <th>INTERES</th>
                                        <th>CAPITAL</th>
                                        <th>CUOTA</th>
                                        <th>DEUDA</th>
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
    <script src="{{ asset('js/moment.js') }}"></script>
    <script>
        const monto = document.getElementById('monto');
        const tiempo = document.getElementById('tiempo');
        const interes = document.getElementById('interes');
        const btnCalcular = document.getElementById('btnCalcular');
        const llenarTabla = document.querySelector('#lista-tabla tbody');
        const pmensual = document.getElementById('pmensual');
        const mitipo = document.getElementById('type');

        btnCalcular.addEventListener('click', () => {
            if (mitipo.value == 1) {
                calcularCuota(monto.value, interes.value, tiempo.value, pmensual.value);
            } else {
                calcularCuota2(monto.value, interes.value, tiempo.value, pmensual.value);
            }
            
        })
        function calcularCuota(monto, interes, tiempo, pmensual){
            while(llenarTabla.firstChild){
                llenarTabla.removeChild(llenarTabla.firstChild);
            }
            let fechas = [];
            let fechaActual = Date.now();
            let mes_actual = moment(fechaActual);
            mes_actual.add(1, 'month');    

            var mideuda = 0
            var micapital =  pmensual - (interes*100)
            var mimonto = 0
            var miaxu = 0 
            var miinteres = interes * monto
            for(let i = 1; i <= tiempo; i++) {
                //Formato fechas
                fechas[i] = mes_actual.format('MM-YY');
                mes_actual.add(1, 'month');
                if (i == 1) {
                    mimonto = monto
                    mideuda =  (parseFloat(monto)+parseFloat(miinteres)) - parseFloat(pmensual).toFixed(2)
                    miaxu = mideuda.toFixed(2) 
                } else {
                    mimonto = miaxu
                    mideuda = (parseFloat(mimonto)+parseFloat(miinteres)) - parseFloat(pmensual).toFixed(2)
                    miaxu = mideuda.toFixed(2)
                }
                const row = document.createElement('tr');
                row.innerHTML = `
                    <td>${fechas[i]}</td>
                    <td>${i}</td>
                    <td>${mimonto}</td>
                    <td>${miinteres.toFixed(2)}</td>
                    <td>${micapital.toFixed(2)}</td>
                    <td>${pmensual}</td>
                    <td>${mideuda.toFixed(2)}</td>
                `;
                llenarTabla.appendChild(row)
            }
        }
        function calcularCuota2(monto, interes, tiempo, pmensual){
            while(llenarTabla.firstChild){
                llenarTabla.removeChild(llenarTabla.firstChild);
            }
            let fechas = [];
            let fechaActual = Date.now();
            let mes_actual = moment(fechaActual);
            mes_actual.add(1, 'month');    

            var mideuda = 0
            var micapital = 0
            var mimonto = 0
            var miaxu = 0 
            var miinteres = 0
            //var mipgm = 0
            for(let i = 1; i <= tiempo; i++) {
                //Formato fechas
                fechas[i] = mes_actual.format('MM-YY');
                mes_actual.add(1, 'month');
                if (i == 1) {
                    mimonto = monto
                    miinteres = interes * monto
                    micapital =  pmensual - miinteres
                    mideuda =  (parseFloat(monto)+parseFloat(miinteres)) - parseFloat(pmensual).toFixed(2)
                    miaxu = mideuda.toFixed(2) 
                } else if(i == tiempo){
                    mimonto = miaxu
                    miinteres = interes * mimonto            
                    micapital =  mimonto
                    pmensual = miaxu + micapital
                    mideuda = pmensual - miaxu
                } else {
                    mimonto = miaxu
                    miinteres = interes * mimonto
                    micapital =  pmensual + miinteres
                    mideuda = (parseFloat(mimonto)+parseFloat(miinteres)) - parseFloat(pmensual).toFixed(2)
                    miaxu = mideuda.toFixed(2)
                }
                const row = document.createElement('tr');
                row.innerHTML = `
                    <td>${fechas[i]}</td>
                    <td>${i}</td>
                    <td>${mimonto}</td>
                    <td>${miinteres.toFixed(2)}</td>
                    <td>${micapital}</td>
                    <td>${pmensual}</td>
                    <td>${mideuda.toFixed(2)}</td>
                `;
                llenarTabla.appendChild(row)
            }
        }
    </script>
@endsection
                                    
                                    