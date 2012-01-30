var Validator=function(f,g){var h=this;this.regexp=g;this.result=true;this.rules=[];this.errors=[];this.values=[];this.elements=[];this.defaults={form:null,errorLine:true,errorBox:null,errorClass:null};$.extend(h.defaults,f);$(f.form).submit(function(){h.validate();return false});this.rule=function(a,b,c,d){h.addElement(a,{type:'rule',rule:b,error:c,key:d});return h};this.min=function(a,b,c,d){h.addElement(a,{type:'min',min:b,error:c,key:d});return h};this.max=function(a,b,c,d){h.addElement(a,{type:'max',max:b,error:c,key:d});return h};this.minmax=function(a,b,c,d,e){h.addElement(a,{type:'minmax',min:b,max:c,error:d,key:e});return h};this.minlen=function(a,b,c,d){h.addElement(a,{type:'minlen',min:b,error:c,key:d});return h};this.maxlen=function(a,b,c,d){h.addElement(a,{type:'maxlen',max:b,error:c,key:d});return h};this.minmaxlen=function(a,b,c,d,e){h.addElement(a,{type:'minmaxlen',min:b,max:c,error:d,key:e});return h};this.checked=function(a,b,c){h.addElement(a,{type:'checked',error:b,key:c});return h};this.compare=function(a,b,c,d){h.addElement(a,{type:'compare',element:b,error:c,key:d});return h};this.addElement=function(a,b){b.key=(typeof(b.key)=="undefined")?null:b.key;b.error=(typeof(b.error)=="undefined")?null:b.error;var c=h.elements.indexOf(a);if(c!=-1){h.rules[c].push(b)}else{c=h.elements.push(a);c-=1;h.rules[c]=new Array();h.rules[c].push(b)}};this.addRule=function(a,b){h.regexp[a]=b;return h};this.getValues=function(){for(var i=0;i<h.elements.length;i++){h.values[i]=h.getValue(h.elements[i])}};this.getValue=function(a){var b=$(h.defaults.form+' '+a);var c=null;if(b.length>0){b=b[0];var d=$(b).get(0).tagName.toLowerCase();switch(d){case'select':c=$(b).find('option:selected').val();break;default:switch($(b).attr('type').toLowerCase()){case'checkbox':c=$(b).attr('checked');break;default:c=$(b).val();break}break}}return c};this.validate=function(){h.resetErrors();h.getValues();for(var i=0;i<h.rules.length;i++){for(var j=0;j<h.rules[i].length;j++){if(h.errors[i]==undefined){switch(h.rules[i][j].type){case'rule':if(h.regexp[h.rules[i][j].rule]){var a=new RegExp(h.regexp[h.rules[i][j].rule]);if(false==a.test(h.values[i])){h.setError(i,h.rules[i][j].error,h.rules[i][j].key)}}break;case'min':h.values[i]=parseFloat(h.values[i]);h.values[i]=isNaN(h.values[i])?0:h.values[i];if(h.values[i]<=h.rules[i][j].min){h.setError(i,h.rules[i][j].error,h.rules[i][j].key)}break;break;case'max':h.values[i]=parseFloat(h.values[i]);h.values[i]=isNaN(h.values[i])?0:h.values[i];if(h.values[i]>h.rules[i][j].max){h.setError(i,h.rules[i][j].error,h.rules[i][j].key)}break;break;case'minmax':h.values[i]=parseFloat(h.values[i]);h.values[i]=isNaN(h.values[i])?0:h.values[i];if(h.values[i]<=h.rules[i][j].min||h.values[i]>h.rules[i][j].max){h.setError(i,h.rules[i][j].error,h.rules[i][j].key)}break;break;case'minlen':if(h.values[i].length<=h.rules[i][j].min){h.setError(i,h.rules[i][j].error,h.rules[i][j].key)}break;break;case'maxlen':if(h.values[i].length>h.rules[i][j].max){h.setError(i,h.rules[i][j].error,h.rules[i][j].key)}break;break;case'minmaxlen':if(h.values[i].length<=h.rules[i][j].min||h.values[i].length>h.rules[i][j].max){h.setError(i,h.rules[i][j].error,h.rules[i][j].key)}break;break;case'checked':if(h.values[i]==false){h.setError(i,h.rules[i][j].error,h.rules[i][j].key)}break;case'compare':var b=h.getValue(h.rules[i][j].element);if(h.values[i]!=b){h.setError(i,h.rules[i][j].error,h.rules[i][j].key)}break}}}}var c=h.result;if(c==false){h.showErrors()}return c};this.setError=function(a,b,c){h.errors[a]={'error':b,'key':c};h.result=false};this.resetErrors=function(){if(h.defaults.errorClass!=null){$(h.defaults.form+' .'+h.defaults.errorClass).removeClass(h.defaults.errorClass)}if(h.defaults.errorLine==true){$(h.defaults.errorBox).html('').hide()}else{for(var i=0;i<h.rules.length;i++){for(var j=0;j<h.rules[i].length;j++){if(h.rules[i][j].key!=null){$(h.defaults.form+' '+h.rules[i][j].key).html('').hide()}}}}};this.showErrors=function(){if(h.defaults.errorLine==true){var a='';for(var i=0;i<h.errors.length;i++){if(h.errors[i]!=undefined){if(h.defaults.errorClass!=null){$(h.defaults.form+' '+h.elements[i]).addClass(h.defaults.errorClass)}a+=h.errors[i].error}}$(h.defaults.errorBox).html(a).show()}else{for(var i=0;i<h.errors.length;i++){if(h.errors[i]!=undefined){if(h.defaults.errorClass!=null){$(h.defaults.form+' '+h.elements[i]).addClass(h.defaults.errorClass)}if(h.errors[i].key!=null&&h.errors[i].error!=null){$(h.defaults.form+' '+h.errors[i].key).html(h.errors[i].error).show()}}}}h.errors=[];h.values=[];h.result=true}}