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
                                    <select name="" id="">
                                        <option value="">type 1</option>
                                        <option value="">type 2</option>
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
                                    <label for="interes">Interésen en %</label>
                                    <input type="number" class="form-control" id="interes" placeholder="Ingresar tasa de interés mensual" value="3">
                                </div>
                                <div class="form-group">
                                    <label for="interes">Pago Mensual</label>
                                    <input type="number" class="form-control" id="pmensual" placeholder="Pago mensual" value="1133.33">
                                </div>
                                <div class="form-group">
                                    {{-- <label for="interes">Opciones</label> --}}
                                    redoondear
                                    <input type="checkbox" class="form-control">

                                </div>
                                <hr class="widget-separator">
                                <button type="submit" class="btn btn-primary" id="btnCalcular">Calcular</button>                
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

btnCalcular.addEventListener('click', () => {
    calcularCuota(monto.value, interes.value, tiempo.value, pmensual.value);
})

function calcularCuota(monto, interes, tiempo, pmensual){

    while(llenarTabla.firstChild){
        llenarTabla.removeChild(llenarTabla.firstChild);
    }

    let fechas = [];
    let fechaActual = Date.now();
    let mes_actual = moment(fechaActual);
    mes_actual.add(1, 'month');    

    //let pagoInteres=0, pagoCapital = 0, cuota = 0;

    //cuota = monto * (Math.pow(1+interes/100, tiempo)*interes/100)/(Math.pow(1+interes/100, tiempo)-1);
    var mideuda = 0
    var micapital = 0
    var mimonto = 0
    // let miinteres = 
    for(let i = 1; i <= tiempo; i++) {

        // pagoInteres = parseFloat(monto*(interes/100));
        //pagoCapital = cuota - pagoInteres;
        //monto = parseFloat(monto-pagoCapital);

        //Formato fechas
        fechas[i] = mes_actual.format('MM-YY');
        mes_actual.add(1, 'month');

        
        //var deuda = parseFloat((monto+(interes*100))-pmensual)


        if (i == 1) {
            mimonto = monto
            mideuda = (parseFloat(monto)+parseFloat(interes*100)) - parseFloat(pmensual)
            micapital = pmensual - (interes*100)
        } else {
            
            mimonto = mideuda.toFixed(2)
            mideuda = (parseFloat(mimonto)+parseFloat(interes*100)) - parseFloat(pmensual)
        }
        const row = document.createElement('tr');
        row.innerHTML = `
            <td>${fechas[i]}</td>
            <td>${i}</td>
            <td>${mimonto}</td>
            <td>${(interes*100).toFixed(2)}</td>
            <td>${micapital.toFixed(2)}</td>
            <td>${pmensual}</td>
            <td>${mideuda.toFixed(2)}</td>
        `;
        llenarTabla.appendChild(row)
    }
}


    </script>
@endsection
                                    
                                    