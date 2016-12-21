function showLocation(province , city , town) {
	
	var loc	= new Location();
	var title	= ['省份' , '地级市' , '市、县、区'];
	$.each(title , function(k , v) {
		title[k]	= '<option value="">'+v+'</option>';
	})
	
	$('#loc_province2').append(title[0]);
	$('#loc_city2').append(title[1]);
	$('#loc_town2').append(title[2]);
	
	$("#loc_province2,#loc_city2,#loc_town2").select2()
	$('#loc_province2').change(function() {
		$('#loc_city2').empty();
		$('#loc_city2').append(title[1]);
		loc.fillOption('loc_city2' , '0,'+$('#loc_province2').val());
		$('#loc_city2').change()
	})
	
	$('#loc_city2').change(function() {
		$('#loc_town2').empty();
		$('#loc_town2').append(title[2]);
		loc.fillOption('loc_town2' , '0,' + $('#loc_province2').val() + ',' + $('#loc_city2').val());
	})
	
	$('#loc_town2').change(function() {
		$('input[name=location_id]').val($(this).val());
	})
	
	if (province) {
		loc.fillOption('loc_province2' , '0' , province);
		
		if (city) {
			loc.fillOption('loc_city2' , '0,'+province , city);
			
			if (town) {
				loc.fillOption('loc_town2' , '0,'+province+','+city , town);
			}
		}
		
	} else {
		loc.fillOption('loc_province2' , '0');
	}
		
}

$(function(){
		showLocation();
		/*$('#btnval').click(function(){
			alert($('#loc_province2').val() + ' - ' + $('#loc_city2').val() + ' - ' +  $('#loc_town2').val()) 
		})
		$('#btntext').click(function(){
			$("#msg").html($('#loc_province2').select2('data').text + ' - ' + $('#loc_city2').select2('data').text + ' - ' +  $('#loc_town2').select2('data').text) 
		})*/
		
	})
