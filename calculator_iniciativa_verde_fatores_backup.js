$(document).ready(function() {

	var about = (function() {
		return {
			vars: {
                windowWidth: $(window).width(),
                mobile: ( $(window).width() < 992 ),
            },
			init: function() {
				this.initFeatures();
				this.initMasks();
				this.initCalc();
				this.clickNext();
				this.manipulateModal();
				this.clickRemoveTr();
			},
			initFeatures: function() {
				var that = this;

				// Seta a largura da linha do tempo
				/*var length = $('#timeline ul:first li').length,
					width = 80 * length,
					containerWidth = $('#timeline .container').width();

				if( width <= containerWidth ) width = containerWidth;

				$('#timeline ul:first').css({ 'width' : width });

				$(".timelineWrap").mCustomScrollbar({
					axis: 'x'
				});*/

				var timelineCarousel = $('.timelineWrap .owl-carousel').owlCarousel({
					itemsCustom : [
						[0, 3],
						[992, 7],
					],
					navigation: false
				});

				// No clique do botão
				$('#timeline ul:first li').click(function() {
					var target = $(this).data('target'),
						index = $(this).parents('.timelineWrap').find('li').index($(this));

					$('#timeline ul:first li.active').removeClass('active');
					$('#timeline .description.active').removeClass('active');
					$(this).addClass('active');
					$(target).addClass('active');

					var carousel = timelineCarousel.data('owlCarousel');
					carousel.goTo(index);
				});


			},
			initMasks: function(){
				$('.metric').on('change', function(){
					if($(this).val() == 'dinheiro'){
						$(this).siblings('.valor').maskMoney({prefix: 'R$ ', thousands: '.', decimal: ','});
					}else{
						$(this).siblings('.valor').maskMoney('destroy');
					}
				});

				$("#tao, #tad").select2();

				var cl1 = new Cleave('#tckm', {
					numeral: true,
				    numeralDecimalMark: ',',
				    delimiter: '.'
				});

				var cl2 = new Cleave('#tikm', {
					numeral: true,
				    numeralDecimalMark: ',',
				    delimiter: '.'
				});

				var cl3 = new Cleave('#tic-aut', {
					numeral: true,
				    numeralDecimalMark: ',',
				    delimiter: '.'
				});
			},
			initCalc: function() {
				var that = this;
				var ce, cg, tir, tcr = 0;

				//eletricidade - casa
				$('#ce-metric, #ce-value').on('change', function(){
					if($('#ce-metric').val() == 'dinheiro'){
						let val = $('#ce-value').maskMoney('unmasked');
						ce = (val[0] * 0.1016);	
					}else{
						let val = cleanVal($('#ce-value').val());
						ce = (val * 0.0750);
					}
					
					if($(this).attr('id') == 'ce-metric'){
						$('#ce-value').val("");
					}

					$("#ce-result").html(ce.toFixed(4).replace('.', ','));
					let anual = ce * 12;
					// let hec = (anual / 390.94);
					//let g = (hec / 10000);
					//let a = (hec * 1667);
					$("#ce-result-a").html(anual.toFixed(4).replace('.', ','));

					//em toneladas
					let anut = anual / 1000;
					$('.ce-emissao').html(anut.toFixed(4).replace('.', ',')); //anual
					//$('.ce-gas').html(g.toFixed(2)); //m²

					updateTotalCalc();
				});

				//gas - casa
				$('#cg-metric, #cg-value').on('change', function(){
					if($('#cg-metric').val() == 'dinheiro'){
						let val = $('#cg-value').maskMoney('unmasked');
						cg = (val[0] * 0.16);	
					}else if($('#cg-metric').val() == 'm3'){
						let val = cleanVal($('#cg-value').val());
						cg = (val * 2.0671);
					}else{
						let val = cleanVal($('#cg-value').val());
						cg = (val * 2.938);
					}

					if($(this).attr('id') == 'cg-metric'){
						$('#cg-value').val("");
					}

					$("#cg-result").html(cg.toFixed(4).replace('.', ','));
					let anual = cg * 12;
					// let g = (hec / 10000);
					// let a = (hec * 1667);
					$("#cg-result-a").html(anual.toFixed(4).replace('.', ','));
					
					//em toneladas
					let anut = anual / 1000;
					$('.cg-emissao').html(anut.toFixed(4).replace('.', ',')); //anual
					//$('.cg-gas').html(g.toFixed(2)); //m²

					updateTotalCalc();
				});
			},
			manipulateModal: function() {
				//manipular modal de transporte individual
				$("#tiv").on('change', function(){
					if($(this).val() == 'carro'){
						$(".combustivel").show();
						clearAndHide('.moto');
					}else{
						clearAndHide('.combustivel');
						clearAndHide('.potencia');
						clearAndHide('.modelo');
						clearAndHide('.hibrido');
						clearAndHide('.moto');
						if($(this).val() == 'moto'){
							$('.moto').show();
						}
					}
				});

				$("#tic").on('change', function(){
					if($(this).val() !== 'elec' && $(this).val() !== 'hib'){
						$('.potencia').show();
						clearAndHide('.modelo');
						clearAndHide('.hibrido');
					}else{
						clearAndHide('.potencia');
						if($(this).val() == 'elec'){
							$('.modelo').show();
							clearAndHide('.hibrido');
						}else{
							clearAndHide('.modelo');
							$('.hibrido').show();
						}
					}
				});

				$("#addIndividual").on('click', function(e){
					$(this).attr('disabled', true);
					let c = calculateIndividualModal();
					var titulo = '';
					if($("#tiv").val() == 'carro'){
						titulo = 'Carro - ' + $("#tic option:selected").text();
					}else{
						titulo = $("#tiv option:selected").text();
					}
					$("#table-individual tbody").append('<tr><td>'+ titulo +'</td><td>'+$("#tikm").val()+'</td><td class="ems">'+c.toFixed(4).replace('.', ',')+'</td><td><a href="#" class="btn btn-xs btn-danger rtr">&times;</a></td></tr>');
					updateTables('#table-individual', '#ti-result', '.ctri-emissao');
					$(".transp-ind")[0].reset();
					clearAndHide('.moto');
					clearAndHide('.combustivel');
					clearAndHide('.potencia');
					clearAndHide('.modelo');
					clearAndHide('.hibrido');
					$("#tri-modal").modal('hide');
					$(this).removeAttr('disabled');
				});

				$("#addColetivo").on('click', function(e){
					$(this).attr('disabled', true);
					let tckm_val = $("#tckm").val();
					let c = parseFloat($("#tcv").val()) * parseFloat(tckm_val.replace('.', ''));
					$("#table-coletivo tbody").append('<tr><td>'+$("#tcv option:selected").text()+'</td><td>'+$("#tckm").val()+'</td><td class="ems">'+c.toFixed(4).replace('.', ',')+'</td><td><a href="#" class="btn btn-xs btn-danger rtr">&times;</a></td></tr>');
					updateTables('#table-coletivo', '#tc-result', '.ctrc-emissao');
					clearAndHide('.transp-pub', false);
					$("#trc-modal").modal('hide');
					$(this).removeAttr('disabled');
				});

				$("#addAereo").on('click', function(e){
					$(this).attr('disabled', true);
					updateAerial();
					let c = parseFloat($("#calcResult").val());
					let dist_val = $("#dist").val();
					let d = parseFloat(cleanVal(dist_val));
					var titulo = $("#tao option:selected").text() + ' - ' + $("#tad option:selected").text();
					$("#table-aereo tbody").append('<tr><td>'+ titulo +'</td><td>'+ d.toFixed(2).replace('.', ',') +'</td><td class="ems">'+c.toFixed(4).replace('.', ',')+'</td><td><a href="#" class="btn btn-xs btn-danger rtr">&times;</a></td></tr>');
					updateTables('#table-aereo', '#va-result', '.ctra-emissao');
					clearAndHide('.transp-aer', false);

					$("#tra-modal").modal('hide');
					$(this).removeAttr('disabled');
				});
			},
			clickNext: function(){
				$(".nxt").on('click', function(e){
					e.preventDefault();
					if($(this).hasClass('init')){
						$("#timeline ul li").removeClass('disabled_li');
					}
					let parent = $(this).parents('.description');
					let nid = $(parent.next()).attr('id');
					$('.timelineWrap li[data-target="#'+ nid +'"]').trigger('click');
				});
			},
			clickRemoveTr: function(){
				$(document).on('click', '.rtr', function(e){
					e.preventDefault();
					var elem = $(this).parents('tr');
					var tabela = $(this).parents('table');
					var rs = $(tabela).parent().parent().find('.result');

					let tid = '#'+ $(tabela).attr('id');
					let rsid = '#' + $(rs[0]).attr('id');
					if(tid == '#table-individual'){
						var rtid = '.ctri-emissao';
					}else if(tid == '#table-coletivo'){
						var rtid = '.ctrc-emissao';
					}else{
						var rtid = '.ctra-emissao';
					}
					$(elem).remove();
					updateTables(tid, rsid, rtid);
				});
			}
		}
	})();

	about.init();
});

function clearAndHide(selector, hide = true){
	$(selector + ' input').each(function(){
		$(this).val("");
	});

	$(selector + ' select').each(function(){
		$(this).val("");
	});

	// clear select2 fields
	$('#tao').val(null).trigger('change');
	$('#tad').val(null).trigger('change');

	if(hide){
		$(selector).hide();
	}
}

function updateTables(table, result_span, result_td){
	var total = 0;
	$(table + ' td.ems').each(function(value){
		let ems_val = $(this).html();
		total += parseFloat(cleanVal(ems_val));
	});

	$(result_span).html(total.toFixed(4).replace('.', ','));

	if(table !== '#table-aereo'){
		var tan = total * 12;
		$(result_span+'-a').html(tan.toFixed(4).replace('.', ','));
		//em toneladas
		let ttan = tan / 1000;
		$(result_td).html(ttan.toFixed(4).replace('.', ',')); //anual
	}else{
		// transporte aereo já conta como toneladas, não precisa dividir
		$(result_td).html(total.toFixed(4).replace('.', ',')); //o valor da tabela já é o valor anual
	}
	updateTotalCalc();
}

function updateAerial(){
	if($('#tao').val() != null && $('#tad').val() != null){
		$.ajax({
		  method: "GET",
		  async: false,
		  url: "/api/calculator/distance/" + $('#tao').val() + '/' + $('#tad').val()
		})
		.done(function( response ) {
		    if(response){
		    	var distancia = response;
		    	var tva = 0;
		    	let pass = $('#tap').val();
		    	let tipo = $('#tatipo').val();
		    	
		    	if(pass == ""){
		    		pass = 1;
		    	}

		    	if(tipo == null){
		    		tipo = 0;
		    	}

		    	if(distancia <= 500){
		    		var fator = 0.144610895;
		    	}else if(distancia > 500 && distancia <= 3700 ){
		    		var fator = 0.078734338;
		    	}else{
		    		var fator = 0.103068448;
		    	}

		    	let dt = distancia * pass * tipo;
		    	let legFactor = (dt * fator / 1000);
		    	
		    	$("#dist").val(dt.toFixed(4).replace('.', ','));
		    	$("#calcResult").val(legFactor);
		    	
		    }
		});
	}
}


function updateTotalCalc(){
	let tte = 0;
	//dividir por 1000 pois são toneladas de carbono

	let ce = cleanVal($(".ce-emissao").html());
	let cg = cleanVal($(".cg-emissao").html());
	let ctri = cleanVal($(".ctri-emissao").html());
	let ctrc = cleanVal($(".ctrc-emissao").html());
	console.log($(".ctra-emissao").html(), 'ctra field');
	let ctra = cleanVal($(".ctra-emissao").html());
	console.log(ctra, 'ctra');

	// let ge = $(".ce-gas").html();
	// let gg = $(".cg-gas").html();
	// let gtri = $(".ctri-gas").html();
	// let gtrc = $(".ctrc-gas").html();
	// let gtra = $(".ctra-gas").html();

	// let ae = $(".ce-arvore").html();
	// let ag = $(".cg-arvore").html();
	// let atri = $(".ctri-arvore").html();
	// let atrc = $(".ctrc-arvore").html();
	// let atra = $(".ctra-arvore").html();

	tte = parseFloat(ce) + parseFloat(cg) + parseFloat(ctri) + parseFloat(ctrc) + parseFloat(ctra);
	// ttg = parseFloat(ge) + parseFloat(gg) + parseFloat(gtri) + parseFloat(gtrc) + parseFloat(gtra);
	// tta = parseInt(ae) + parseInt(ag) + parseInt(atri) + parseFloat(atrc) + parseFloat(atra);

	$('.tt-emissao').html(tte.toFixed(4).replace('.', ','));
	$('.tt-total').html('100%');
	// $('.tt-gas').html(ttg.toFixed(2));
	// $('.tt-arvore').html(tta);

	//calcular porcentagens para cada fator e atualizar
	calcFactorPercent('ce', ce, tte);
	calcFactorPercent('cg', cg, tte);
	calcFactorPercent('ctri', ctri, tte);
	calcFactorPercent('ctrc', ctrc, tte);
	calcFactorPercent('ctra', ctra, tte);


	convertEmissionInTrees(tte);

	$("a.donate").attr('href', '/doacoes');
}

function convertEmissionInTrees(emission){
	let m = (emission/391) * 10000;
	$("#metragem").html(m.toFixed(2).replace('.',','));
	let arv = Math.ceil(m/6);
	$("#arvores").html(arv);
	let money = arv * 20;
	$(".donation-buttons").find('script').attr('data-amount', (money * 100));
	$(".donation-buttons").find('script').attr('data-button-text', 'Compensar (R$ ' + money.toFixed(2).replace('.',',') + ')');
	$(".pagarme-checkout-btn").html('Compensar (R$ ' + money.toFixed(2).replace('.',',') + ')');
	$(".pagarme-checkout-btn").val('Compensar (R$ ' + money.toFixed(2).replace('.',',') + ')');
}

function calcFactorPercent(factor, emission, total){
	let percent = (parseFloat(emission)/total) * 100;
	if(percent % 1 === 0){
		$('.'+ factor +'-total').html(percent + '%');
	}else{
		$('.'+ factor +'-total').html(percent.toFixed(2).replace('.', ',') + '%');
	}

}

function cleanVal(val){
	return val.replace(',', '.');
}

function calculateIndividualModal(){
	let tikm_val = $("#tikm").val();
	let k = parseFloat(tikm_val.replace('.', ''));
	if($("#tiv").val() == 'carro'){
		if($("#tic").val() != 'hib' && $("#tic").val() != 'elec'){
			//carro a gasolina, etanol, gnv ou diesel
			let arr = [{'etanol': 0.0014, 'gasolina': 0.128, 'gnv': 0.137}, {'etanol': 0.0019, 'gasolina': 0.169, 'gnv': 0.163}, {'etanol': 0.0029, 'gasolina': 0.247, 'gnv': 0.235, 'diesel': 0.224}];
			let emis = arr[($("#tim").val() - 1)][$("#tic").val()];
			return (k*emis);
		}else{
			if($("#tic").val() == 'hib'){
				//carro hibrido
				//(emissão/autonomia)*kms
				let emis = parseFloat($("#tic-hib").val());
				let aut = parseFloat($("#tic-aut").val());
				return ((emis/aut) * k);
			}else{
				//carro eletrico (no select já está (bateria/autonomia)*fator medio)
				//((bateria/autonomia)*fator medio)*kms
				let emis = parseFloat($("#tice").val());
				return (k*emis);

			}
		}
	}else if($("#tiv").val() == 'moto'){
		let arr = [{'etanol': 0.0007, 'gasolina': 0.060}, {'etanol': 0.0008, 'gasolina': 0.068}, {'etanol': 0.0011, 'gasolina': 0.094}];
		let emis = arr[($("#tip-m").val() - 1)][$("#tic-m").val()];
		return (k*emis);
	}else if($("#tiv").val() == 'patinete'){
		return (k* 0.00084);
	}else if($("#tiv").val() == 'bike-elec'){
		return (k* 0.00047);
	}else{
		return 0;
	}
}