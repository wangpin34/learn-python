var app = window.app = {};

app.service = (function(){

	var 
		urls = {
			conf:'/conf'
		},
		callBackWrapper = function(callback){
			return $.isFunction(callback)?callback:function(){};
		},
		jsonWrapper = function(data){
			return JSON.stringify(data);
		}
	;
	
	return  {
		save:function(conf,onSuccess,onError){
				$.post(urls.conf,jsonWrapper(conf),callBackWrapper(onSuccess),callBackWrapper(onError));
		}
	}
	
}());



app.bind = function(){

	$(function(){
		$("#save").click(function(){
			
			var confData = {};
			$("#conf li ").each(function(index){
				var pName = $($(this).children('span').get(0)).text();
				var pbName = $($(this).find('select').get(0)).val();
				confData[pName] = pbName;
				app.service.save(confData,function(res){
						debugger;
				},function(res){
						debugger;
				});
			})
		});

	});

};





app.bind();