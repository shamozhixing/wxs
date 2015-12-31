(function(){var X=this;
var T=X._;
var B={};
var J=Array.prototype,d=Object.prototype,g=Function.prototype;
var V=J.slice,Z=J.unshift,Y=d.toString,P=d.hasOwnProperty;
var N=J.forEach,I=J.map,b=J.reduce,E=J.reduceRight,M=J.filter,A=J.every,a=J.some,W=J.indexOf,F=J.lastIndexOf,C=Array.isArray,c=Object.keys,K=g.bind;
var f=function(j){return new G(j)
};
if(typeof exports!=="undefined"){if(typeof module!=="undefined"&&module.exports){exports=module.exports=f
}exports._=f
}else{X._=f
}f.VERSION="1.3.1";
var D=f.each=f.forEach=function(p,o,n){if(p==null){return 
}if(N&&p.forEach===N){p.forEach(o,n)
}else{if(p.length===+p.length){for(var m=0,j=p.length;
m<j;
m++){if(m in p&&o.call(n,p[m],m,p)===B){return 
}}}else{for(var k in p){if(f.has(p,k)){if(o.call(n,p[k],k,p)===B){return 
}}}}}};
f.map=f.collect=function(m,l,k){var j=[];
if(m==null){return j
}if(I&&m.map===I){return m.map(l,k)
}D(m,function(p,n,o){j[j.length]=l.call(k,p,n,o)
});
if(m.length===+m.length){j.length=m.length
}return j
};
f.reduce=f.foldl=f.inject=function(n,m,j,l){var k=arguments.length>2;
if(n==null){n=[]
}if(b&&n.reduce===b){if(l){m=f.bind(m,l)
}return k?n.reduce(m,j):n.reduce(m)
}D(n,function(q,o,p){if(!k){j=q;
k=true
}else{j=m.call(l,j,q,o,p)
}});
if(!k){throw new TypeError("Reduce of empty array with no initial value")
}return j
};
f.reduceRight=f.foldr=function(n,m,j,l){var k=arguments.length>2;
if(n==null){n=[]
}if(E&&n.reduceRight===E){if(l){m=f.bind(m,l)
}return k?n.reduceRight(m,j):n.reduceRight(m)
}var o=f.toArray(n).reverse();
if(l&&!k){m=f.bind(m,l)
}return k?f.reduce(o,m,j,l):f.reduce(o,m)
};
f.find=f.detect=function(m,l,k){var j;
R(m,function(p,n,o){if(l.call(k,p,n,o)){j=p;
return true
}});
return j
};
f.filter=f.select=function(m,l,k){var j=[];
if(m==null){return j
}if(M&&m.filter===M){return m.filter(l,k)
}D(m,function(p,n,o){if(l.call(k,p,n,o)){j[j.length]=p
}});
return j
};
f.reject=function(m,l,k){var j=[];
if(m==null){return j
}D(m,function(p,n,o){if(!l.call(k,p,n,o)){j[j.length]=p
}});
return j
};
f.every=f.all=function(m,l,k){var j=true;
if(m==null){return j
}if(A&&m.every===A){return m.every(l,k)
}D(m,function(p,n,o){if(!(j=j&&l.call(k,p,n,o))){return B
}});
return j
};
var R=f.some=f.any=function(m,l,k){l||(l=f.identity);
var j=false;
if(m==null){return j
}if(a&&m.some===a){return m.some(l,k)
}D(m,function(p,n,o){if(j||(j=l.call(k,p,n,o))){return B
}});
return !!j
};
f.include=f.contains=function(l,k){var j=false;
if(l==null){return j
}if(W&&l.indexOf===W){return l.indexOf(k)!=-1
}j=R(l,function(m){return m===k
});
return j
};
f.invoke=function(k,l){var j=V.call(arguments,2);
return f.map(k,function(m){return(f.isFunction(l)?l||m:m[l]).apply(m,j)
})
};
f.pluck=function(k,j){return f.map(k,function(l){return l[j]
})
};
f.max=function(m,l,k){if(!l&&f.isArray(m)){return Math.max.apply(Math,m)
}if(!l&&f.isEmpty(m)){return -Infinity
}var j={computed:-Infinity};
D(m,function(q,n,p){var o=l?l.call(k,q,n,p):q;
o>=j.computed&&(j={value:q,computed:o})
});
return j.value
};
f.min=function(m,l,k){if(!l&&f.isArray(m)){return Math.min.apply(Math,m)
}if(!l&&f.isEmpty(m)){return Infinity
}var j={computed:Infinity};
D(m,function(q,n,p){var o=l?l.call(k,q,n,p):q;
o<j.computed&&(j={value:q,computed:o})
});
return j.value
};
f.shuffle=function(l){var j=[],k;
D(l,function(o,m,n){if(m==0){j[0]=o
}else{k=Math.floor(Math.random()*(m+1));
j[m]=j[k];
j[k]=o
}});
return j
};
f.sortBy=function(l,k,j){return f.pluck(f.map(l,function(o,m,n){return{value:o,criteria:k.call(j,o,m,n)}
}).sort(function(p,o){var n=p.criteria,m=o.criteria;
return n<m?-1:n>m?1:0
}),"value")
};
f.groupBy=function(l,m){var j={};
var k=f.isFunction(m)?m:function(n){return n[m]
};
D(l,function(p,n){var o=k(p,n);
(j[o]||(j[o]=[])).push(p)
});
return j
};
f.sortedIndex=function(o,n,l){l||(l=f.identity);
var j=0,m=o.length;
while(j<m){var k=(j+m)>>1;
l(o[k])<l(n)?j=k+1:m=k
}return j
};
f.toArray=function(j){if(!j){return[]
}if(j.toArray){return j.toArray()
}if(f.isArray(j)){return V.call(j)
}if(f.isArguments(j)){return V.call(j)
}return f.values(j)
};
f.size=function(j){return f.toArray(j).length
};
f.first=f.head=function(l,k,j){return(k!=null)&&!j?V.call(l,0,k):l[0]
};
f.initial=function(l,k,j){return V.call(l,0,l.length-((k==null)||j?1:k))
};
f.last=function(l,k,j){if((k!=null)&&!j){return V.call(l,Math.max(l.length-k,0))
}else{return l[l.length-1]
}};
f.rest=f.tail=function(l,j,k){return V.call(l,(j==null)||k?1:j)
};
f.compact=function(j){return f.filter(j,function(k){return !!k
})
};
f.flatten=function(k,j){return f.reduce(k,function(l,m){if(f.isArray(m)){return l.concat(j?m:f.flatten(m))
}l[l.length]=m;
return l
},[])
};
f.without=function(j){return f.difference(j,V.call(arguments,1))
};
f.uniq=f.unique=function(n,m,l){var k=l?f.map(n,l):n;
var j=[];
f.reduce(k,function(o,q,p){if(0==p||(m===true?f.last(o)!=q:!f.include(o,q))){o[o.length]=q;
j[j.length]=n[p]
}return o
},[]);
return j
};
f.union=function(){return f.uniq(f.flatten(arguments,true))
};
f.intersection=f.intersect=function(k){var j=V.call(arguments,1);
return f.filter(f.uniq(k),function(l){return f.every(j,function(m){return f.indexOf(m,l)>=0
})
})
};
f.difference=function(k){var j=f.flatten(V.call(arguments,1));
return f.filter(k,function(l){return !f.include(j,l)
})
};
f.zip=function(){var j=V.call(arguments);
var m=f.max(f.pluck(j,"length"));
var l=new Array(m);
for(var k=0;
k<m;
k++){l[k]=f.pluck(j,""+k)
}return l
};
f.indexOf=function(o,m,n){if(o==null){return -1
}var k,j;
if(n){k=f.sortedIndex(o,m);
return o[k]===m?k:-1
}if(W&&o.indexOf===W){return o.indexOf(m)
}for(k=0,j=o.length;
k<j;
k++){if(k in o&&o[k]===m){return k
}}return -1
};
f.lastIndexOf=function(l,k){if(l==null){return -1
}if(F&&l.lastIndexOf===F){return l.lastIndexOf(k)
}var j=l.length;
while(j--){if(j in l&&l[j]===k){return j
}}return -1
};
f.range=function(o,m,n){if(arguments.length<=1){m=o||0;
o=0
}n=arguments[2]||1;
var k=Math.max(Math.ceil((m-o)/n),0);
var j=0;
var l=new Array(k);
while(j<k){l[j++]=o;
o+=n
}return l
};
var H=function(){};
f.bind=function h(m,k){var l,j;
if(m.bind===K&&K){return K.apply(m,V.call(arguments,1))
}if(!f.isFunction(m)){throw new TypeError
}j=V.call(arguments,2);
return l=function(){if(!(this instanceof l)){return m.apply(k,j.concat(V.call(arguments)))
}H.prototype=m.prototype;
var o=new H;
var n=m.apply(o,j.concat(V.call(arguments)));
if(Object(n)===n){return n
}return o
}
};
f.bindAll=function(k){var j=V.call(arguments,1);
if(j.length==0){j=f.functions(k)
}D(j,function(l){k[l]=f.bind(k[l],k)
});
return k
};
f.memoize=function(l,k){var j={};
k||(k=f.identity);
return function(){var m=k.apply(this,arguments);
return f.has(j,m)?j[m]:(j[m]=l.apply(this,arguments))
}
};
f.delay=function(k,l){var j=V.call(arguments,2);
return setTimeout(function(){return k.apply(k,j)
},l)
};
f.defer=function(j){return f.delay.apply(f,[j,1].concat(V.call(arguments,1)))
};
f.throttle=function(o,q){var m,j,p,n,l;
var k=f.debounce(function(){l=n=false
},q);
return function(){m=this;
j=arguments;
var r=function(){p=null;
if(l){o.apply(m,j)
}k()
};
if(!p){p=setTimeout(r,q)
}if(n){l=true
}else{o.apply(m,j)
}k();
n=true
}
};
f.debounce=function(j,l){var k;
return function(){var o=this,n=arguments;
var m=function(){k=null;
j.apply(o,n)
};
clearTimeout(k);
k=setTimeout(m,l)
}
};
f.once=function(l){var j=false,k;
return function(){if(j){return k
}j=true;
return k=l.apply(this,arguments)
}
};
f.wrap=function(j,k){return function(){var l=[j].concat(V.call(arguments,0));
return k.apply(this,l)
}
};
f.compose=function(){var j=arguments;
return function(){var k=arguments;
for(var l=j.length-1;
l>=0;
l--){k=[j[l].apply(this,k)]
}return k[0]
}
};
f.after=function(k,j){if(k<=0){return j()
}return function(){if(--k<1){return j.apply(this,arguments)
}}
};
f.keys=c||function(l){if(l!==Object(l)){throw new TypeError("Invalid object")
}var k=[];
for(var j in l){if(f.has(l,j)){k[k.length]=j
}}return k
};
f.values=function(j){return f.map(j,f.identity)
};
f.functions=f.methods=function(l){var k=[];
for(var j in l){if(f.isFunction(l[j])){k.push(j)
}}return k.sort()
};
f.extend=function(j){D(V.call(arguments,1),function(k){for(var l in k){j[l]=k[l]
}});
return j
};
f.defaults=function(j){D(V.call(arguments,1),function(k){for(var l in k){if(j[l]==null){j[l]=k[l]
}}});
return j
};
f.clone=function(j){if(!f.isObject(j)){return j
}return f.isArray(j)?j.slice():f.extend({},j)
};
f.tap=function(k,j){j(k);
return k
};
function e(m,l,k){if(m===l){return m!==0||1/m==1/l
}if(m==null||l==null){return m===l
}if(m._chain){m=m._wrapped
}if(l._chain){l=l._wrapped
}if(m.isEqual&&f.isFunction(m.isEqual)){return m.isEqual(l)
}if(l.isEqual&&f.isFunction(l.isEqual)){return l.isEqual(m)
}var p=Y.call(m);
if(p!=Y.call(l)){return false
}switch(p){case"[object String]":return m==String(l);
case"[object Number]":return m!=+m?l!=+l:(m==0?1/m==1/l:m==+l);
case"[object Date]":case"[object Boolean]":return +m==+l;
case"[object RegExp]":return m.source==l.source&&m.global==l.global&&m.multiline==l.multiline&&m.ignoreCase==l.ignoreCase
}if(typeof m!="object"||typeof l!="object"){return false
}var q=k.length;
while(q--){if(k[q]==m){return true
}}k.push(m);
var o=0,j=true;
if(p=="[object Array]"){o=m.length;
j=o==l.length;
if(j){while(o--){if(!(j=o in m==o in l&&e(m[o],l[o],k))){break
}}}}else{if("constructor" in m!="constructor" in l||m.constructor!=l.constructor){return false
}for(var n in m){if(f.has(m,n)){o++;
if(!(j=f.has(l,n)&&e(m[n],l[n],k))){break
}}}if(j){for(n in l){if(f.has(l,n)&&!(o--)){break
}}j=!o
}}k.pop();
return j
}f.isEqual=function(k,j){return e(k,j,[])
};
f.isEmpty=function(k){if(f.isArray(k)||f.isString(k)){return k.length===0
}for(var j in k){if(f.has(k,j)){return false
}}return true
};
f.isElement=function(j){return !!(j&&j.nodeType==1)
};
f.isArray=C||function(j){return Y.call(j)=="[object Array]"
};
f.isObject=function(j){return j===Object(j)
};
f.isArguments=function(j){return Y.call(j)=="[object Arguments]"
};
if(!f.isArguments(arguments)){f.isArguments=function(j){return !!(j&&f.has(j,"callee"))
}
}f.isFunction=function(j){return Y.call(j)=="[object Function]"
};
f.isString=function(j){return Y.call(j)=="[object String]"
};
f.isNumber=function(j){return Y.call(j)=="[object Number]"
};
f.isNaN=function(j){return j!==j
};
f.isBoolean=function(j){return j===true||j===false||Y.call(j)=="[object Boolean]"
};
f.isDate=function(j){return Y.call(j)=="[object Date]"
};
f.isRegExp=function(j){return Y.call(j)=="[object RegExp]"
};
f.isNull=function(j){return j===null
};
f.isUndefined=function(j){return j===void 0
};
f.has=function(k,j){return P.call(k,j)
};
f.noConflict=function(){X._=T;
return this
};
f.identity=function(j){return j
};
f.times=function(m,l,k){for(var j=0;
j<m;
j++){l.call(k,j)
}};
f.escape=function(j){return(""+j).replace(/&/g,"&amp;").replace(/</g,"&lt;").replace(/>/g,"&gt;").replace(/"/g,"&quot;").replace(/'/g,"&#x27;").replace(/\//g,"&#x2F;")
};
f.mixin=function(j){D(f.functions(j),function(k){S(k,f[k]=j[k])
})
};
var L=0;
f.uniqueId=function(j){var k=L++;
return j?j+k:k
};
f.templateSettings={evaluate:/<%([\s\S]+?)%>/g,interpolate:/<%=([\s\S]+?)%>/g,escape:/<%-([\s\S]+?)%>/g};
var U=/.^/;
var Q=function(j){return j.replace(/\\\\/g,"\\").replace(/\\'/g,"'")
};
f.template=function(m,l){var n=f.templateSettings;
var j="var __p=[],print=function(){__p.push.apply(__p,arguments);};with(obj||{}){__p.push('"+m.replace(/\\/g,"\\\\").replace(/'/g,"\\'").replace(n.escape||U,function(o,p){return"',_.escape("+Q(p)+"),'"
}).replace(n.interpolate||U,function(o,p){return"',"+Q(p)+",'"
}).replace(n.evaluate||U,function(o,p){return"');"+Q(p).replace(/[\r\n\t]/g," ")+";__p.push('"
}).replace(/\r/g,"\\r").replace(/\n/g,"\\n").replace(/\t/g,"\\t")+"');}return __p.join('');";
var k=new Function("obj","_",j);
if(l){return k(l,f)
}return function(o){return k.call(this,o,f)
}
};
f.chain=function(j){return f(j).chain()
};
var G=function(j){this._wrapped=j
};
f.prototype=G.prototype;
var O=function(k,j){return j?f(k).chain():k
};
var S=function(j,k){G.prototype[j]=function(){var l=V.call(arguments);
Z.call(l,this._wrapped);
return O(k.apply(f,l),this._chain)
}
};
f.mixin(f);
D(["pop","push","reverse","shift","sort","splice","unshift"],function(j){var k=J[j];
G.prototype[j]=function(){var l=this._wrapped;
k.apply(l,arguments);
var m=l.length;
if((j=="shift"||j=="splice")&&m===0){delete l[0]
}return O(l,this._chain)
}
});
D(["concat","join","slice"],function(j){var k=J[j];
G.prototype[j]=function(){return O(k.apply(this._wrapped,arguments),this._chain)
}
});
G.prototype.chain=function(){this._chain=true;
return this
};
G.prototype.value=function(){return this._wrapped
}
}).call(this);
(function(){var N=this;
var L=N.Backbone;
var M=Array.prototype.slice;
var U=Array.prototype.splice;
var B;
if(typeof exports!=="undefined"){B=exports
}else{B=N.Backbone={}
}B.VERSION="0.9.1";
var V=N._;
if(!V&&(typeof require!=="undefined")){V=require("underscore")
}var E=N.jQuery||N.Zepto||N.ender;
B.setDomLibrary=function(W){E=W
};
B.noConflict=function(){N.Backbone=L;
return this
};
B.emulateHTTP=false;
B.emulateJSON=false;
B.Events={on:function(Z,c,Y){var a;
Z=Z.split(/\s+/);
var X=this._callbacks||(this._callbacks={});
while(a=Z.shift()){var b=X[a]||(X[a]={});
var W=b.tail||(b.tail=b.next={});
W.callback=c;
W.context=Y;
b.tail=W.next={}
}return this
},off:function(Y,b,X){var a,W,Z;
if(!Y){delete this._callbacks
}else{if(W=this._callbacks){Y=Y.split(/\s+/);
while(a=Y.shift()){Z=W[a];
delete W[a];
if(!b||!Z){continue
}while((Z=Z.next)&&Z.next){if(Z.callback===b&&(!X||Z.context===X)){continue
}this.on(a,Z.callback,Z.context)
}}}}return this
},trigger:function(Z){var d,c,Y,X,W,b,a;
if(!(Y=this._callbacks)){return this
}b=Y.all;
(Z=Z.split(/\s+/)).push(null);
while(d=Z.shift()){if(b){Z.push({next:b.next,tail:b.tail,event:d})
}if(!(c=Y[d])){continue
}Z.push({next:c.next,tail:c.tail})
}a=M.call(arguments,1);
while(c=Z.pop()){X=c.tail;
W=c.event?[c.event].concat(a):a;
while((c=c.next)!==X){c.callback.apply(c.context||this,W)
}}return this
}};
B.Events.bind=B.Events.on;
B.Events.unbind=B.Events.off;
B.Model=function(W,X){var Y;
W||(W={});
if(X&&X.parse){W=this.parse(W)
}if(Y=C(this,"defaults")){W=V.extend({},Y,W)
}if(X&&X.collection){this.collection=X.collection
}this.attributes={};
this._escapedAttributes={};
this.cid=V.uniqueId("c");
if(!this.set(W,{silent:true})){throw new Error("Can't create an invalid model")
}delete this._changed;
this._previousAttributes=V.clone(this.attributes);
this.initialize.apply(this,arguments)
};
V.extend(B.Model.prototype,B.Events,{idAttribute:"id",initialize:function(){},toJSON:function(){return V.clone(this.attributes)
},get:function(W){return this.attributes[W]
},escape:function(W){var X;
if(X=this._escapedAttributes[W]){return X
}var Y=this.attributes[W];
return this._escapedAttributes[W]=V.escape(Y==null?"":""+Y)
},has:function(W){return this.attributes[W]!=null
},set:function(d,c,f){var e,b,Y;
if(V.isObject(d)||d==null){e=d;
f=c
}else{e={};
e[d]=c
}f||(f={});
if(!e){return this
}if(e instanceof B.Model){e=e.attributes
}if(f.unset){for(b in e){e[b]=void 0
}}if(!this._validate(e,f)){return false
}if(this.idAttribute in e){this.id=e[this.idAttribute]
}var X=this.attributes;
var W=this._escapedAttributes;
var Z=this._previousAttributes||{};
var a=this._setting;
this._changed||(this._changed={});
this._setting=true;
for(b in e){Y=e[b];
if(!V.isEqual(X[b],Y)){delete W[b]
}f.unset?delete X[b]:X[b]=Y;
if(this._changing&&!V.isEqual(this._changed[b],Y)){this.trigger("change:"+b,this,Y,f);
this._moreChanges=true
}delete this._changed[b];
if(!V.isEqual(Z[b],Y)||(V.has(X,b)!=V.has(Z,b))){this._changed[b]=Y
}}if(!a){if(!f.silent&&this.hasChanged()){this.change(f)
}this._setting=false
}return this
},unset:function(W,X){(X||(X={})).unset=true;
return this.set(W,null,X)
},clear:function(W){(W||(W={})).unset=true;
return this.set(V.clone(this.attributes),W)
},fetch:function(X){X=X?V.clone(X):{};
var W=this;
var Y=X.success;
X.success=function(b,Z,a){if(!W.set(W.parse(b,a),X)){return false
}if(Y){Y(W,b)
}};
X.error=B.wrapError(X.error,W,X);
return(this.sync||B.sync).call(this,"read",this,X)
},save:function(b,a,f){var c,Z;
if(V.isObject(b)||b==null){c=b;
f=a
}else{c={};
c[b]=a
}f=f?V.clone(f):{};
if(f.wait){Z=V.clone(this.attributes)
}var X=V.extend({},f,{silent:true});
if(c&&!this.set(c,f.wait?X:f)){return false
}var Y=this;
var d=f.success;
f.success=function(k,g,j){var h=Y.parse(k,j);
if(f.wait){h=V.extend(c||{},h)
}if(!Y.set(h,f)){return false
}if(d){d(Y,k)
}else{Y.trigger("sync",Y,k,f)
}};
f.error=B.wrapError(f.error,Y,f);
var W=this.isNew()?"create":"update";
var e=(this.sync||B.sync).call(this,W,this,f);
if(f.wait){this.set(Z,X)
}return e
},destroy:function(X){X=X?V.clone(X):{};
var W=this;
var a=X.success;
var Z=function(){W.trigger("destroy",W,W.collection,X)
};
if(this.isNew()){return Z()
}X.success=function(b){if(X.wait){Z()
}if(a){a(W,b)
}else{W.trigger("sync",W,b,X)
}};
X.error=B.wrapError(X.error,W,X);
var Y=(this.sync||B.sync).call(this,"delete",this,X);
if(!X.wait){Z()
}return Y
},url:function(){var W=C(this.collection,"url")||C(this,"urlRoot")||P();
if(this.isNew()){return W
}return W+(W.charAt(W.length-1)=="/"?"":"/")+encodeURIComponent(this.id)
},parse:function(X,W){return X
},clone:function(){return new this.constructor(this.attributes)
},isNew:function(){return this.id==null
},change:function(X){if(this._changing||!this.hasChanged()){return this
}this._changing=true;
this._moreChanges=true;
for(var W in this._changed){this.trigger("change:"+W,this,this._changed[W],X)
}while(this._moreChanges){this._moreChanges=false;
this.trigger("change",this,X)
}this._previousAttributes=V.clone(this.attributes);
delete this._changed;
this._changing=false;
return this
},hasChanged:function(W){if(!arguments.length){return !V.isEmpty(this._changed)
}return this._changed&&V.has(this._changed,W)
},changedAttributes:function(Y){if(!Y){return this.hasChanged()?V.clone(this._changed):false
}var a,Z=false,X=this._previousAttributes;
for(var W in Y){if(V.isEqual(X[W],(a=Y[W]))){continue
}(Z||(Z={}))[W]=a
}return Z
},previous:function(W){if(!arguments.length||!this._previousAttributes){return null
}return this._previousAttributes[W]
},previousAttributes:function(){return V.clone(this._previousAttributes)
},isValid:function(){return !this.validate(this.attributes)
},_validate:function(Y,X){if(X.silent||!this.validate){return true
}Y=V.extend({},this.attributes,Y);
var W=this.validate(Y,X);
if(!W){return true
}if(X&&X.error){X.error(this,W,X)
}else{this.trigger("error",this,W,X)
}return false
}});
B.Collection=function(X,W){W||(W={});
if(W.comparator){this.comparator=W.comparator
}this._reset();
this.initialize.apply(this,arguments);
if(X){this.reset(X,{silent:true,parse:W.parse})
}};
V.extend(B.Collection.prototype,B.Events,{model:B.Model,initialize:function(){},toJSON:function(){return this.map(function(W){return W.toJSON()
})
},add:function(X,f){var b,d,Z,c,e,Y,a={},W={};
f||(f={});
X=V.isArray(X)?X.slice():[X];
for(b=0,Z=X.length;
b<Z;
b++){if(!(c=X[b]=this._prepareModel(X[b],f))){throw new Error("Can't add an invalid model to a collection")
}if(a[e=c.cid]||this._byCid[e]||(((Y=c.id)!=null)&&(W[Y]||this._byId[Y]))){throw new Error("Can't add the same model to a collection twice")
}a[e]=W[Y]=c
}for(b=0;
b<Z;
b++){(c=X[b]).on("all",this._onModelEvent,this);
this._byCid[c.cid]=c;
if(c.id!=null){this._byId[c.id]=c
}}this.length+=Z;
d=f.at!=null?f.at:this.models.length;
U.apply(this.models,[d,0].concat(X));
if(this.comparator){this.sort({silent:true})
}if(f.silent){return this
}for(b=0,Z=this.models.length;
b<Z;
b++){if(!a[(c=this.models[b]).cid]){continue
}f.index=b;
c.trigger("add",c,this,f)
}return this
},remove:function(b,Z){var a,W,Y,X;
Z||(Z={});
b=V.isArray(b)?b.slice():[b];
for(a=0,W=b.length;
a<W;
a++){X=this.getByCid(b[a])||this.get(b[a]);
if(!X){continue
}delete this._byId[X.id];
delete this._byCid[X.cid];
Y=this.indexOf(X);
this.models.splice(Y,1);
this.length--;
if(!Z.silent){Z.index=Y;
X.trigger("remove",X,this,Z)
}this._removeReference(X)
}return this
},get:function(W){if(W==null){return null
}return this._byId[W.id!=null?W.id:W]
},getByCid:function(W){return W&&this._byCid[W.cid||W]
},at:function(W){return this.models[W]
},sort:function(X){X||(X={});
if(!this.comparator){throw new Error("Cannot sort a set without a comparator")
}var W=V.bind(this.comparator,this);
if(this.comparator.length==1){this.models=this.sortBy(W)
}else{this.models.sort(W)
}if(!X.silent){this.trigger("reset",this,X)
}return this
},pluck:function(W){return V.map(this.models,function(X){return X.get(W)
})
},reset:function(Z,X){Z||(Z=[]);
X||(X={});
for(var Y=0,W=this.models.length;
Y<W;
Y++){this._removeReference(this.models[Y])
}this._reset();
this.add(Z,{silent:true,parse:X.parse});
if(!X.silent){this.trigger("reset",this,X)
}return this
},fetch:function(W){W=W?V.clone(W):{};
if(W.parse===undefined){W.parse=true
}var Y=this;
var X=W.success;
W.success=function(b,Z,a){Y[W.add?"add":"reset"](Y.parse(b,a),W);
if(X){X(Y,b)
}};
W.error=B.wrapError(W.error,Y,W);
return(this.sync||B.sync).call(this,"read",this,W)
},create:function(X,W){var Y=this;
W=W?V.clone(W):{};
X=this._prepareModel(X,W);
if(!X){return false
}if(!W.wait){Y.add(X,W)
}var Z=W.success;
W.success=function(a,c,b){if(W.wait){Y.add(a,W)
}if(Z){Z(a,c)
}else{a.trigger("sync",X,c,W)
}};
X.save(null,W);
return X
},parse:function(X,W){return X
},chain:function(){return V(this.models).chain()
},_reset:function(W){this.length=0;
this.models=[];
this._byId={};
this._byCid={}
},_prepareModel:function(Y,X){if(!(Y instanceof B.Model)){var W=Y;
X.collection=this;
Y=new this.model(W,X);
if(!Y._validate(Y.attributes,X)){Y=false
}}else{if(!Y.collection){Y.collection=this
}}return Y
},_removeReference:function(W){if(this==W.collection){delete W.collection
}W.off("all",this._onModelEvent,this)
},_onModelEvent:function(Y,X,Z,W){if((Y=="add"||Y=="remove")&&Z!=this){return 
}if(Y=="destroy"){this.remove(X,W)
}if(X&&Y==="change:"+X.idAttribute){delete this._byId[X.previous(X.idAttribute)];
this._byId[X.id]=X
}this.trigger.apply(this,arguments)
}});
var S=["forEach","each","map","reduce","reduceRight","find","detect","filter","select","reject","every","all","some","any","include","contains","invoke","max","min","sortBy","sortedIndex","toArray","size","first","initial","rest","last","without","indexOf","shuffle","lastIndexOf","isEmpty","groupBy"];
V.each(S,function(W){B.Collection.prototype[W]=function(){return V[W].apply(V,[this.models].concat(V.toArray(arguments)))
}
});
B.Router=function(W){W||(W={});
if(W.routes){this.routes=W.routes
}this._bindRoutes();
this.initialize.apply(this,arguments)
};
var G=/:\w+/g;
var T=/\*\w+/g;
var D=/[-[\]{}()+?.,\\^$|#\s]/g;
V.extend(B.Router.prototype,B.Events,{initialize:function(){},route:function(W,X,Y){B.history||(B.history=new B.History);
if(!V.isRegExp(W)){W=this._routeToRegExp(W)
}if(!Y){Y=this[X]
}B.history.route(W,V.bind(function(a){var Z=this._extractParameters(W,a);
Y&&Y.apply(this,Z);
this.trigger.apply(this,["route:"+X].concat(Z));
B.history.trigger("route",this,X,Z)
},this));
return this
},navigate:function(X,W){B.history.navigate(X,W)
},_bindRoutes:function(){if(!this.routes){return 
}var X=[];
for(var Y in this.routes){X.unshift([Y,this.routes[Y]])
}for(var Z=0,W=X.length;
Z<W;
Z++){this.route(X[Z][0],X[Z][1],this[X[Z][1]])
}},_routeToRegExp:function(W){W=W.replace(D,"\\$&").replace(G,"([^/]+)").replace(T,"(.*?)");
return new RegExp("^"+W+"$")
},_extractParameters:function(W,X){return W.exec(X).slice(1)
}});
B.History=function(){this.handlers=[];
V.bindAll(this,"checkUrl")
};
var K=/^[#\/]/;
var H=/msie [\w.]+/;
var J=false;
V.extend(B.History.prototype,B.Events,{interval:50,getFragment:function(X,W){if(X==null){if(this._hasPushState||W){X=window.location.pathname;
var Y=window.location.search;
if(Y){X+=Y
}}else{X=window.location.hash
}}X=decodeURIComponent(X);
if(!X.indexOf(this.options.root)){X=X.substr(this.options.root.length)
}return X.replace(K,"")
},start:function(Y){if(J){throw new Error("Backbone.history has already been started")
}this.options=V.extend({},{root:"/"},this.options,Y);
this._wantsHashChange=this.options.hashChange!==false;
this._wantsPushState=!!this.options.pushState;
this._hasPushState=!!(this.options.pushState&&window.history&&window.history.pushState);
var X=this.getFragment();
var W=document.documentMode;
var a=(H.exec(navigator.userAgent.toLowerCase())&&(!W||W<=7));
if(a){this.iframe=E('<iframe src="javascript:0" tabindex="-1" />').hide().appendTo("body")[0].contentWindow;
this.navigate(X)
}if(this._hasPushState){E(window).bind("popstate",this.checkUrl)
}else{if(this._wantsHashChange&&("onhashchange" in window)&&!a){E(window).bind("hashchange",this.checkUrl)
}else{if(this._wantsHashChange){this._checkUrlInterval=setInterval(this.checkUrl,this.interval)
}}}this.fragment=X;
J=true;
var b=window.location;
var Z=b.pathname==this.options.root;
if(this._wantsHashChange&&this._wantsPushState&&!this._hasPushState&&!Z){this.fragment=this.getFragment(null,true);
window.location.replace(this.options.root+"#"+this.fragment);
return true
}else{if(this._wantsPushState&&this._hasPushState&&Z&&b.hash){this.fragment=b.hash.replace(K,"");
window.history.replaceState({},document.title,b.protocol+"//"+b.host+this.options.root+this.fragment)
}}if(!this.options.silent){return this.loadUrl()
}},stop:function(){E(window).unbind("popstate",this.checkUrl).unbind("hashchange",this.checkUrl);
clearInterval(this._checkUrlInterval);
J=false
},route:function(W,X){this.handlers.unshift({route:W,callback:X})
},checkUrl:function(X){var W=this.getFragment();
if(W==this.fragment&&this.iframe){W=this.getFragment(this.iframe.location.hash)
}if(W==this.fragment||W==decodeURIComponent(this.fragment)){return false
}if(this.iframe){this.navigate(W)
}this.loadUrl()||this.loadUrl(window.location.hash)
},loadUrl:function(Y){var X=this.fragment=this.getFragment(Y);
var W=V.any(this.handlers,function(Z){if(Z.route.test(X)){Z.callback(X);
return true
}});
return W
},navigate:function(X,W){if(!J){return false
}if(!W||W===true){W={trigger:W}
}var Y=(X||"").replace(K,"");
if(this.fragment==Y||this.fragment==decodeURIComponent(Y)){return 
}if(this._hasPushState){if(Y.indexOf(this.options.root)!=0){Y=this.options.root+Y
}this.fragment=Y;
window.history[W.replace?"replaceState":"pushState"]({},document.title,Y)
}else{if(this._wantsHashChange){this.fragment=Y;
this._updateHash(window.location,Y,W.replace);
if(this.iframe&&(Y!=this.getFragment(this.iframe.location.hash))){if(!W.replace){this.iframe.document.open().close()
}this._updateHash(this.iframe.location,Y,W.replace)
}}else{window.location.assign(this.options.root+X)
}}if(W.trigger){this.loadUrl(X)
}},_updateHash:function(W,X,Y){if(Y){W.replace(W.toString().replace(/(javascript:|#).*$/,"")+"#"+X)
}else{W.hash=X
}}});
B.View=function(W){this.cid=V.uniqueId("view");
this._configure(W||{});
this._ensureElement();
this.initialize.apply(this,arguments);
this.delegateEvents()
};
var A=/^(\S+)\s*(.*)$/;
var Q=["model","collection","el","id","attributes","className","tagName"];
V.extend(B.View.prototype,B.Events,{tagName:"div",$:function(W){return this.$el.find(W)
},initialize:function(){},render:function(){return this
},remove:function(){this.$el.remove();
return this
},make:function(X,W,Z){var Y=document.createElement(X);
if(W){E(Y).attr(W)
}if(Z){E(Y).html(Z)
}return Y
},setElement:function(W,X){this.$el=E(W);
this.el=this.$el[0];
if(X!==false){this.delegateEvents()
}return this
},delegateEvents:function(a){if(!(a||(a=C(this,"events")))){return 
}this.undelegateEvents();
for(var Z in a){var b=a[Z];
if(!V.isFunction(b)){b=this[a[Z]]
}if(!b){throw new Error('Event "'+a[Z]+'" does not exist')
}var Y=Z.match(A);
var X=Y[1],W=Y[2];
b=V.bind(b,this);
X+=".delegateEvents"+this.cid;
if(W===""){this.$el.bind(X,b)
}else{this.$el.delegate(W,X,b)
}}},undelegateEvents:function(){this.$el.unbind(".delegateEvents"+this.cid)
},_configure:function(Y){if(this.options){Y=V.extend({},this.options,Y)
}for(var Z=0,X=Q.length;
Z<X;
Z++){var W=Q[Z];
if(Y[W]){this[W]=Y[W]
}}this.options=Y
},_ensureElement:function(){if(!this.el){var W=C(this,"attributes")||{};
if(this.id){W.id=this.id
}if(this.className){W["class"]=this.className
}this.setElement(this.make(this.tagName,W),false)
}else{this.setElement(this.el,false)
}}});
var R=function(W,X){var Y=I(this,W,X);
Y.extend=this.extend;
return Y
};
B.Model.extend=B.Collection.extend=B.Router.extend=B.View.extend=R;
var O={create:"POST",update:"PUT","delete":"DELETE",read:"GET"};
B.sync=function(a,X,W){var Y=O[a];
var Z={type:Y,dataType:"json"};
if(!W.url){Z.url=C(X,"url")||P()
}if(!W.data&&X&&(a=="create"||a=="update")){Z.contentType="application/json";
Z.data=JSON.stringify(X.toJSON())
}if(B.emulateJSON){Z.contentType="application/x-www-form-urlencoded";
Z.data=Z.data?{model:Z.data}:{}
}if(B.emulateHTTP){if(Y==="PUT"||Y==="DELETE"){if(B.emulateJSON){Z.data._method=Y
}Z.type="POST";
Z.beforeSend=function(b){b.setRequestHeader("X-HTTP-Method-Override",Y)
}
}}if(Z.type!=="GET"&&!B.emulateJSON){Z.processData=false
}return E.ajax(V.extend(Z,W))
};
B.wrapError=function(X,Y,W){return function(Z,a){a=Z===Y?a:Z;
if(X){X(Y,a,W)
}else{Y.trigger("error",Y,a,W)
}}
};
var F=function(){};
var I=function(X,W,Y){var Z;
if(W&&W.hasOwnProperty("constructor")){Z=W.constructor
}else{Z=function(){X.apply(this,arguments)
}
}V.extend(Z,X);
F.prototype=X.prototype;
Z.prototype=new F();
if(W){V.extend(Z.prototype,W)
}if(Y){V.extend(Z,Y)
}Z.prototype.constructor=Z;
Z.__super__=X.prototype;
return Z
};
var C=function(W,X){if(!(W&&W[X])){return null
}return V.isFunction(W[X])?W[X]():W[X]
};
var P=function(){throw new Error('A "url" property or function must be specified')
}
}).call(this);
/* http://mths.be/details v0.0.5 by @mathias | includes http://mths.be/noselect v1.0.3 */
(function(A,F){var E=F.fn,D,C=Object.prototype.toString.call(window.opera)=="[object Opera]",G=(function(L){var J=L.createElement("details"),I,H,K;
if(!("open" in J)){return false
}H=L.body||(function(){var M=L.documentElement;
I=true;
return M.insertBefore(L.createElement("body"),M.firstElementChild||M.firstChild)
}());
J.innerHTML="<summary>a</summary>b";
J.style.display="block";
H.appendChild(J);
K=J.offsetHeight;
J.open=true;
K=K!=J.offsetHeight;
H.removeChild(J);
if(I){H.parentNode.removeChild(H)
}return K
}(A)),B=function(I,L,K,H){var J=typeof I.attr("open")=="string",M=J&&H||!J&&!H;
if(M){I.removeClass("open").prop("open",false).triggerHandler("close.details");
L.attr("aria-expanded",false);
K.hide()
}else{I.addClass("open").prop("open",true).triggerHandler("open.details");
L.attr("aria-expanded",true);
K.show()
}};
E.noSelect=function(){var H="none";
return this.bind("selectstart dragstart mousedown",function(){return false
}).css({MozUserSelect:H,msUserSelect:H,webkitUserSelect:H,userSelect:H})
};
if(G){D=E.details=function(){return this.each(function(){var I=F(this),H=F("summary",I).first();
H.attr({role:"button","aria-expanded":I.prop("open")}).on("click",function(){var J=I.prop("open");
H.attr("aria-expanded",!J);
I.triggerHandler((J?"close":"open")+".details")
})
})
};
D.support=G
}else{D=E.details=function(){return this.each(function(){var H=F(this),J=F("summary",H).first(),I=H.children(":not(summary)"),K=H.contents(":not(summary)");
if(!J.length){J=F("<summary>").text("Details").prependTo(H)
}if(I.length!=K.length){K.filter(function(){return this.nodeType==3&&/[^ \t\n\f\r]/.test(this.data)
}).wrap("<span>");
I=H.children(":not(summary)")
}B(H,J,I);
J.attr("role","button").noSelect().prop("tabIndex",0).on("click",function(){J.focus();
B(H,J,I,true)
}).keyup(function(L){if(32==L.keyCode&&!C||13==L.keyCode){L.preventDefault();
J.click()
}})
})
};
D.support=G
}}(document,jQuery));
/*
 * fancyBox - jQuery Plugin
 * version: 2.0.6 (Thu, 19 Jul 2012)
 * @requires jQuery v1.6 or later
 *
 * Examples at http://fancyapps.com/fancybox/
 * License: www.fancyapps.com/fancybox/#license
 *
 * Copyright 2012 Janis Skarnelis - janis@fancyapps.com
 *
 */
(function(M,P,K,G){var E=K(M),A=K(P),Q=K.fancybox=function(){Q.open.apply(this,arguments)
},C=false,H=P.createTouch!==G,L=function(D){return D&&D.hasOwnProperty&&D instanceof K
},B=function(D){return D&&K.type(D)==="string"
},N=function(D){return B(D)&&D.indexOf("%")>0
},J=function(D){return(D&&!(D.style.overflow&&D.style.overflow==="hidden")&&((D.clientWidth&&D.scrollWidth>D.clientWidth)||(D.clientHeight&&D.scrollHeight>D.clientHeight)))
},O=function(D,F){if(F&&N(D)){D=Q.getViewport()[F]/100*parseInt(D,10)
}return Math.ceil(D)
},I=function(D,F){return O(D,F)+"px"
};
K.extend(Q,{version:"2.0.6",defaults:{padding:15,margin:20,width:800,height:600,minWidth:100,minHeight:100,maxWidth:9999,maxHeight:9999,autoSize:true,autoHeight:false,autoWidth:false,autoResize:!H,autoCenter:!H,fitToView:true,aspectRatio:false,topRatio:0.5,fixed:false,scrolling:"auto",wrapCSS:"",arrows:true,closeBtn:true,closeClick:false,nextClick:false,mouseWheel:true,autoPlay:false,playSpeed:3000,preload:3,modal:false,loop:true,ajax:{dataType:"html",headers:{"X-fancyBox":true}},iframe:{scrolling:"auto",preload:true},swf:{wmode:"transparent",allowfullscreen:"true",allowscriptaccess:"always"},keys:{next:{13:"right",34:"down",39:"right",40:"down"},prev:{8:"left",33:"up",37:"left",38:"up"},close:[27],play:[32],toggle:[70]},direction:{next:"right",prev:"left"},index:0,type:null,href:null,content:null,title:null,tpl:{wrap:'<div class="fancybox-wrap"><div class="fancybox-skin"><div class="fancybox-outer"><div class="fancybox-inner"></div></div></div></div>',image:'<img class="fancybox-image" src="{href}" alt="" />',iframe:'<iframe id="fancybox-frame{rnd}" name="fancybox-frame{rnd}" class="fancybox-iframe" frameborder="0" vspace="0" hspace="0"'+(K.browser.msie?' allowtransparency="true"':"")+"></iframe>",error:'<p class="fancybox-error">The requested content cannot be loaded.<br/>Please try again later.</p>',closeBtn:'<div title="Close" class="fancybox-item fancybox-close"></div>',next:'<a title="Next" class="fancybox-nav fancybox-next"><span></span></a>',prev:'<a title="Previous" class="fancybox-nav fancybox-prev"><span></span></a>'},openEffect:"fade",openSpeed:250,openEasing:"swing",openOpacity:true,openMethod:"zoomIn",closeEffect:"fade",closeSpeed:250,closeEasing:"swing",closeOpacity:true,closeMethod:"zoomOut",nextEffect:"elastic",nextSpeed:250,nextEasing:"swing",nextMethod:"changeIn",prevEffect:"elastic",prevSpeed:250,prevEasing:"swing",prevMethod:"changeOut",helpers:{overlay:{speedIn:0,speedOut:250,opacity:0.8,css:{cursor:"pointer"},closeClick:true},title:{type:"float"}},onCancel:K.noop,beforeLoad:K.noop,afterLoad:K.noop,beforeShow:K.noop,afterShow:K.noop,beforeChange:K.noop,beforeClose:K.noop,afterClose:K.noop},group:{},opts:{},previous:null,coming:null,current:null,isActive:false,isOpen:false,isOpened:false,wrap:null,skin:null,outer:null,inner:null,player:{timer:null,isActive:false},ajaxLoad:null,imgPreload:null,transitions:{},helpers:{},open:function(F,D){if(!F){return 
}D=K.isPlainObject(D)?D:{};
Q.close(true);
if(!K.isArray(F)){F=L(F)?K(F).get():[F]
}K.each(F,function(V,W){var U={},R,Z,X,Y,T,a,S;
if(K.type(W)==="object"){if(W.nodeType){W=K(W)
}if(L(W)){U={href:W.attr("href"),title:W.attr("title"),isDom:true,element:W};
if(K.metadata){K.extend(true,U,W.metadata())
}}else{U=W
}}R=D.href||U.href||(B(W)?W:null);
Z=D.title!==G?D.title:U.title||"";
X=D.content||U.content;
Y=X?"html":(D.type||U.type);
if(!Y&&U.isDom){Y=W.data("fancybox-type");
if(!Y){T=W.prop("class").match(/fancybox\.(\w+)/);
Y=T?T[1]:null
}}if(B(R)){if(!Y){if(Q.isImage(R)){Y="image"
}else{if(Q.isSWF(R)){Y="swf"
}else{if(R.charAt(0)==="#"){Y="inline"
}else{if(B(W)){Y="html";
X=W
}}}}}if(Y==="ajax"){a=R.split(/\s+/,2);
R=a.shift();
S=a.shift()
}}if(!X){if(Y==="inline"){if(R){X=K(B(R)?R.replace(/.*(?=#[^\s]+$)/,""):R)
}else{if(U.isDom){X=W
}}}else{if(Y==="html"){X=R
}else{if(!Y&&!R&&U.isDom){Y="inline";
X=W
}}}}K.extend(U,{href:R,type:Y,content:X,title:Z,selector:S});
F[V]=U
});
Q.opts=K.extend(true,{},Q.defaults,D);
if(D.keys!==G){Q.opts.keys=D.keys?K.extend({},Q.defaults.keys,D.keys):false
}Q.group=F;
return Q._start(Q.opts.index||0)
},cancel:function(){var D=Q.coming;
if(!D||false===Q.trigger("onCancel")){return 
}Q.hideLoading();
if(D.wrap){D.wrap.stop().trigger("onReset").remove()
}Q.coming=null;
if(Q.ajaxLoad){Q.ajaxLoad.abort()
}Q.ajaxLoad=null;
if(Q.imgPreload){Q.imgPreload.onload=Q.imgPreload.onerror=null
}},close:function(D){Q.cancel();
if(!Q.current||false===Q.trigger("beforeClose")){return 
}Q.unbindEvents();
if(!Q.isOpen||D===true){K(".fancybox-wrap").stop().trigger("onReset").remove();
Q._afterZoomOut()
}else{Q.isOpen=Q.isOpened=false;
Q.isClosing=true;
K(".fancybox-item, .fancybox-nav").remove();
Q.wrap.stop(true).removeClass("fancybox-opened");
if(Q.wrap.css("position")==="fixed"){Q.wrap.css(Q._getPosition(true))
}Q.transitions[Q.current.closeMethod]()
}},play:function(R){var D=function(){clearTimeout(Q.player.timer)
},T=function(){D();
if(Q.current&&Q.player.isActive){Q.player.timer=setTimeout(Q.next,Q.current.playSpeed)
}},F=function(){D();
K("body").unbind(".player");
Q.player.isActive=false;
Q.trigger("onPlayEnd")
},S=function(){if(Q.current&&(Q.current.loop||Q.current.index<Q.group.length-1)){Q.player.isActive=true;
K("body").bind({"afterShow.player onUpdate.player":T,"onCancel.player beforeClose.player":F,"beforeLoad.player":D});
T();
Q.trigger("onPlayStart")
}};
if(R===true||(!Q.player.isActive&&R!==false)){S()
}else{F()
}},next:function(F){var D=Q.current;
if(D){if(!B(F)){F=D.direction.next
}Q.jumpto(D.index+1,F,"next")
}},prev:function(F){var D=Q.current;
if(D){if(!B(F)){F=D.direction.prev
}Q.jumpto(D.index-1,F,"prev")
}},jumpto:function(F,S,D){var R=Q.current;
if(!R){return 
}F=parseInt(F,10);
Q.direction=S||(F>R.index?"right":"left");
Q.router=D||"jumpto";
if(R.loop){if(F<0){F=R.group.length+(F%R.group.length)
}F=F%R.group.length
}if(R.group[F]!==G){Q.cancel();
Q._start(F)
}},reposition:function(F,D){var R;
if(Q.isOpen){R=Q._getPosition(D);
if(F&&F.type==="scroll"){delete R.position;
Q.wrap.stop(true,true).animate(R,200)
}else{Q.wrap.css(R)
}}},update:function(R){var F=!R||(R&&R.type==="orientationchange"),D=R&&R.type==="scroll";
if(F){clearTimeout(C);
C=null
}if(!Q.isOpen||C){return 
}if(F&&H){Q.wrap.removeAttr("style").addClass("fancybox-tmp");
Q.trigger("onUpdate")
}C=setTimeout(function(){var S=Q.current;
C=null;
if(!S){return 
}Q.wrap.removeClass("fancybox-tmp");
if((S.autoResize&&!D)||F){Q._setDimension();
Q.trigger("onUpdate")
}if((S.autoCenter&&!(D&&S.canShrink))||F){Q.reposition(R)
}Q.trigger("onUpdate")
},(F?20:300))
},toggle:function(D){if(Q.isOpen){Q.current.fitToView=K.type(D)==="boolean"?D:!Q.current.fitToView;
Q.update()
}},hideLoading:function(){A.unbind("keypress.fb");
K("#fancybox-loading").remove()
},showLoading:function(){var F,D;
Q.hideLoading();
A.bind("keypress.fb",function(R){if((R.which||R.keyCode)===27){R.preventDefault();
Q.cancel()
}});
F=K('<div id="fancybox-loading"><div></div></div>').click(Q.cancel).appendTo("body");
if(Q.coming&&!Q.coming.fixed){D=Q.getViewport();
F.css({position:"absolute",top:(D.h*0.5)+D.y,left:(D.w*0.5)+D.x})
}},getViewport:function(){return{x:E.scrollLeft(),y:E.scrollTop(),w:H&&M.innerWidth?M.innerWidth:E.width(),h:H&&M.innerHeight?M.innerHeight:E.height()}
},unbindEvents:function(){if(Q.wrap&&L(Q.wrap)){Q.wrap.unbind(".fb")
}A.unbind(".fb");
E.unbind(".fb")
},bindEvents:function(){var F=Q.current,D;
if(!F){return 
}E.bind("resize.fb orientationchange.fb"+(F.autoCenter&&!F.fixed?" scroll.fb":""),Q.update);
D=F.keys;
if(D){A.bind("keydown.fb",function(T){var R=T.which||T.keyCode,S=T.target||T.srcElement;
if(!T.ctrlKey&&!T.altKey&&!T.shiftKey&&!T.metaKey&&!(S&&(S.type||K(S).is("[contenteditable]")))){K.each(D,function(U,V){if(F.group.length>1&&V[R]!==G){Q[U](V[R]);
T.preventDefault();
return false
}if(K.inArray(R,V)>-1){Q[U]();
T.preventDefault();
return false
}})
}})
}if(K.fn.mousewheel&&F.mouseWheel){Q.wrap.bind("mousewheel.fb",function(W,X,S,R){var V=W.target||null,T=K(V),U=false;
while(T.length){if(U||T.is(".fancybox-skin")||T.is(".fancybox-wrap")){break
}U=J(T[0]);
T=K(T).parent()
}if(X!==0&&!U){if(Q.group.length>1&&!F.canShrink){if(R>0||S>0){Q.prev(R>0?"up":"left")
}else{if(R<0||S<0){Q.next(R<0?"down":"right")
}}W.preventDefault()
}else{if(Q.wrap.css("position")==="fixed"){W.preventDefault()
}}}})
}},trigger:function(F,S){var D,R=S||Q[K.inArray(F,["onCancel","beforeLoad","afterLoad"])>-1?"coming":"current"];
if(!R){return 
}if(K.isFunction(R[F])){D=R[F].apply(R,Array.prototype.slice.call(arguments,1))
}if(D===false){return false
}if(R.helpers){K.each(R.helpers,function(U,T){if(T&&Q.helpers[U]&&K.isFunction(Q.helpers[U][F])){Q.helpers[U][F](T,R)
}})
}K.event.trigger(F+".fb")
},isImage:function(D){return B(D)&&D.match(/\.(jp(e|g|eg)|gif|png|bmp|webp)((\?|#).*)?$/i)
},isSWF:function(D){return B(D)&&D.match(/\.(swf)((\?|#).*)?$/i)
},_start:function(F){var R={},V=Q.group[F]||null,D,S,T,U;
if(!V){return false
}R=K.extend(true,{},Q.opts,V);
T=R.margin;
U=R.padding;
if(K.type(T)==="number"){R.margin=[T,T,T,T]
}if(K.type(U)==="number"){R.padding=[U,U,U,U]
}if(R.modal){K.extend(true,R,{closeBtn:false,closeClick:false,nextClick:false,arrows:false,mouseWheel:false,keys:null,helpers:{overlay:{css:{cursor:"auto"},closeClick:false}}})
}if(R.autoSize){R.autoWidth=R.autoHeight=true
}if(R.width==="auto"){R.autoWidth=true
}if(R.height==="auto"){R.autoHeight=true
}R.group=Q.group;
R.index=F;
Q.coming=R;
if(false===Q.trigger("beforeLoad")){Q.coming=null;
return 
}S=R.type;
D=R.href;
if(!S){Q.coming=null;
if(Q.current&&Q.router&&Q.router!=="jumpto"){Q.current.index=F;
return Q[Q.router](Q.direction)
}return false
}Q.isActive=true;
if(S==="image"||S==="swf"){R.autoHeight=R.autoWidth=false;
R.scrolling="visible"
}if(S==="image"){R.aspectRatio=true
}if(S==="iframe"&&H){R.scrolling="scroll"
}R.wrap=K(R.tpl.wrap).addClass("fancybox-"+(H?"mobile":"desktop")+" fancybox-type-"+S+" fancybox-tmp "+R.wrapCSS).appendTo(R.parent);
K.extend(R,{skin:K(".fancybox-skin",R.wrap),outer:K(".fancybox-outer",R.wrap),inner:K(".fancybox-inner",R.wrap)});
K.each(["Top","Right","Bottom","Left"],function(X,W){R.skin.css("padding"+W,I(R.padding[X]))
});
if(S==="inline"||S==="html"){if(!R.content||!R.content.length){return Q._error("content")
}}else{if(!D){return Q._error("href")
}}if(S==="image"){Q._loadImage()
}else{if(S==="ajax"){Q._loadAjax()
}else{if(S==="iframe"){Q._loadIframe()
}else{Q._afterLoad()
}}}},_error:function(D){K.extend(Q.coming,{type:"html",autoWidth:true,autoHeight:true,minWidth:0,minHeight:0,scrolling:"no",hasError:D,content:Q.coming.tpl.error});
Q._afterLoad()
},_loadImage:function(){var D=Q.imgPreload=new Image();
D.onload=function(){this.onload=this.onerror=null;
Q.coming.width=this.width;
Q.coming.height=this.height;
Q._afterLoad()
};
D.onerror=function(){this.onload=this.onerror=null;
Q._error("image")
};
D.src=Q.coming.href;
if(D.complete===G||!D.complete){Q.showLoading()
}},_loadAjax:function(){var D=Q.coming;
Q.showLoading();
Q.ajaxLoad=K.ajax(K.extend({},D.ajax,{url:D.href,error:function(F,R){if(Q.coming&&R!=="abort"){Q._error("ajax",F)
}else{Q.hideLoading()
}},success:function(F,R){if(R==="success"){D.content=F;
Q._afterLoad()
}}}))
},_loadIframe:function(){var D=Q.coming,F=K(D.tpl.iframe.replace(/\{rnd\}/g,new Date().getTime())).attr("scrolling",H?"auto":D.iframe.scrolling).attr("src",D.href);
K(D.wrap).bind("onReset",function(){try{F.hide().parent().empty()
}catch(R){}});
if(D.iframe.preload){Q.showLoading();
F.bind("load",function(){K(this).unbind().bind("load.fb",Q.update).data("ready",1);
Q.coming.wrap.removeClass("fancybox-tmp").show();
Q._afterLoad()
})
}D.content=F.appendTo(D.inner);
if(!D.iframe.preload){Q._afterLoad()
}},_preloadImages:function(){var U=Q.group,T=Q.current,D=U.length,R=T.preload?Math.min(T.preload,D-1):0,S,F;
for(F=1;
F<=R;
F+=1){S=U[(T.index+F)%D];
if(S.type==="image"&&S.href){new Image().src=S.href
}}},_afterLoad:function(){var F=Q.coming,T=Q.current,V,S,R,U,D,W;
Q.hideLoading();
if(!F||false===Q.trigger("afterLoad",F,T)){Q.coming.wrap.stop().trigger("onReset").remove();
Q.coming=null;
return 
}if(T){Q.trigger("beforeChange",T);
T.wrap.stop(true).removeClass("fancybox-opened").find(".fancybox-item, .fancybox-nav").remove();
if(T.wrap.css("position")==="fixed"){T.wrap.css(Q._getPosition(true))
}}Q.unbindEvents();
V=F;
S=F.content;
R=F.type;
U=F.scrolling;
K.extend(Q,{wrap:V.wrap,skin:V.skin,outer:V.outer,inner:V.inner,current:V,previous:T});
D=V.href;
switch(R){case"inline":case"ajax":case"html":if(V.selector){S=K("<div>").html(S).find(V.selector)
}else{if(L(S)){S=S.show().detach();
V.wrap.bind("onReset",function(){K(this).find(".fancybox-inner").children().appendTo(V.parent).hide()
})
}}break;
case"image":S=V.tpl.image.replace("{href}",D);
break;
case"swf":S='<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="100%" height="100%"><param name="movie" value="'+D+'"></param>';
W="";
K.each(V.swf,function(X,Y){S+='<param name="'+X+'" value="'+Y+'"></param>';
W+=" "+X+'="'+Y+'"'
});
S+='<embed src="'+D+'" type="application/x-shockwave-flash" width="100%" height="100%"'+W+"></embed></object>";
break
}if(!(V.type==="iframe"&&V.iframe.preload)){V.inner.append(S)
}Q.trigger("beforeShow");
Q._setDimension();
V.wrap.removeClass("fancybox-tmp");
V.inner.css("overflow",U==="yes"?"scroll":(U==="no"?"hidden":U));
V.pos=K.extend({},V.dim,Q._getPosition(true));
Q.isOpen=false;
Q.coming=null;
Q.bindEvents();
if(!Q.isOpened){K(".fancybox-wrap").not(V.wrap).stop().trigger("onReset").remove()
}else{if(T.prevMethod){Q.transitions[T.prevMethod]()
}}Q.transitions[Q.isOpened?V.nextMethod:V.openMethod]();
Q._preloadImages()
},_setDimension:function(){var v=Q.getViewport(),q=0,x=false,z=false,a=Q.wrap,o=Q.skin,AA=Q.inner,l=Q.current,m=l.width,j=l.height,d=l.minWidth,W=l.minHeight,t=l.maxWidth,k=l.maxHeight,c=l.scrolling,U=l.scrollOutside,h=l.margin,V=h[1]+h[3],T=h[0]+h[2],R,F,p,r,g,f,n,Y,X,w,S,y,D,Z,b;
a.add(o).add(AA).width("auto").height("auto");
R=o.outerWidth(true)-o.width();
F=o.outerHeight(true)-o.height();
p=V+R;
r=T+F;
g=N(m)?(v.w-p)*parseFloat(m)/100:m;
f=N(j)?(v.h-r)*parseFloat(j)/100:j;
if(l.type==="iframe"){Z=l.content;
if(l.autoHeight&&Z.data("ready")===1){try{if(Z[0].contentWindow.document.location){AA.width(g).height(9999);
b=Z.contents().find("body");
if(U){b.css("overflow-x","hidden")
}f=b.height()
}}catch(u){}}}else{if(l.autoWidth||l.autoHeight){AA.addClass("fancybox-tmp");
if(l.autoWidth){g=AA.width()
}if(l.autoHeight){f=AA.height()
}AA.removeClass("fancybox-tmp")
}}m=O(g);
j=O(f);
X=g/f;
d=O(N(d)?O(d,"w")-p:d);
t=O(N(t)?O(t,"w")-p:t);
W=O(N(W)?O(W,"h")-r:W);
k=O(N(k)?O(k,"h")-r:k);
n=t;
Y=k;
y=v.w-V;
D=v.h-T;
if(l.aspectRatio){if(m>t){m=t;
j=m/X
}if(j>k){j=k;
m=j*X
}if(m<d){m=d;
j=m/X
}if(j<W){j=W;
m=j*X
}}else{m=Math.max(d,Math.min(m,t));
j=Math.max(W,Math.min(j,k))
}if(l.fitToView){t=Math.min(v.w-p,t);
k=Math.min(v.h-r,k);
AA.width(O(m)).height(O(j));
a.width(O(m+R));
w=a.width();
S=a.height();
if(l.aspectRatio){while((w>y||S>D)&&m>d&&j>W){if(q++>19){break
}j=Math.max(W,Math.min(k,j-10));
m=j*X;
if(m<d){m=d;
j=m/X
}if(m>t){m=t;
j=m/X
}AA.width(O(m)).height(O(j));
a.width(O(m+R));
w=a.width();
S=a.height()
}}else{m=Math.max(d,Math.min(m,m-(w-y)));
j=Math.max(W,Math.min(j,j-(S-D)))
}}if(U&&c==="auto"&&j<f&&(m+R+U)<y){m+=U
}AA.width(O(m)).height(O(j));
a.width(O(m+R));
w=a.width();
S=a.height();
x=(w>y||S>D)&&m>d&&j>W;
z=l.aspectRatio?(m<n&&j<Y&&m<g&&j<f):((m<n||j<Y)&&(m<g||j<f));
K.extend(l,{dim:{width:I(w),height:I(S)},origWidth:g,origHeight:f,canShrink:x,canExpand:z,wPadding:R,hPadding:F,wrapSpace:S-o.outerHeight(true),skinSpace:o.height()-j});
if(!Z&&l.autoHeight&&j>W&&j<k&&!z){AA.height("auto")
}},_getPosition:function(R){var V=Q.current,F=Q.getViewport(),T=V.margin,S=Q.wrap.width()+T[1]+T[3],D=Q.wrap.height()+T[0]+T[2],U={position:"absolute",top:T[0]+F.y,left:T[3]+F.x};
if(V.autoCenter&&V.fixed&&!R&&D<=F.h&&S<=F.w){U={position:"fixed",top:T[0],left:T[3]}
}U.top=I(Math.max(U.top,U.top+((F.h-D)*V.topRatio)));
U.left=I(Math.max(U.left,U.left+((F.w-S)*0.5)));
return U
},_afterZoomIn:function(){var D=Q.current;
if(!D){return 
}Q.isOpen=Q.isOpened=true;
Q.wrap.addClass("fancybox-opened").css("overflow","visible");
Q.reposition();
if(D.closeClick||D.nextClick){Q.inner.css("cursor","pointer").bind("click.fb",function(F){if(!K(F.target).is("a")&&!K(F.target).parent().is("a")){Q[D.closeClick?"close":"next"]()
}})
}if(D.closeBtn){K(D.tpl.closeBtn).appendTo(Q.skin).bind("click.fb",Q.close)
}if(D.arrows&&Q.group.length>1){if(D.loop||D.index>0){K(D.tpl.prev).appendTo(Q.outer).bind("click.fb",Q.prev)
}if(D.loop||D.index<Q.group.length-1){K(D.tpl.next).appendTo(Q.outer).bind("click.fb",Q.next)
}}Q.trigger("afterShow");
if(Q.opts.autoPlay&&!Q.player.isActive){Q.opts.autoPlay=false;
Q.play()
}},_afterZoomOut:function(){var D=Q.current;
Q.wrap.trigger("onReset").remove();
K.extend(Q,{group:{},opts:{},router:false,current:null,isActive:false,isOpened:false,isOpen:false,isClosing:false,wrap:null,skin:null,outer:null,inner:null});
Q.trigger("afterClose",D)
}});
Q.transitions={getOrigPosition:function(){var S=Q.current,F=S.element,V=K(S.orig),U={},D=50,W=50,T=S.hPadding,X=S.wPadding,R;
if(!V.length&&S.isDom&&F.is(":visible")){V=F.find("img:first");
if(!V.length){V=F
}}if(V.length){U=V.offset();
if(V.is("img")){D=V.outerWidth();
W=V.outerHeight()
}}else{R=Q.getViewport();
U.top=R.y+(R.h-W)*0.5;
U.left=R.x+(R.w-D)*0.5
}U={top:I(U.top-T*0.5),left:I(U.left-X*0.5),width:I(D+X),height:I(W+T)};
return U
},step:function(F,R){var T,V,W,D=R.prop,S=Q.current,U=S.wrapSpace,X=S.skinSpace;
if(D==="width"||D==="height"){T=R.end===R.start?1:(F-R.start)/(R.end-R.start);
if(Q.isClosing){T=1-T
}V=D==="width"?S.wPadding:S.hPadding;
W=F-V;
Q.skin[D](O(D==="width"?W:W-(U*T)));
Q.inner[D](O(D==="width"?W:W-(U*T)-(X*T)))
}},zoomIn:function(){var T=Q.current,F=T.pos,R=T.openEffect,S=R==="elastic",D=K.extend({opacity:1},F);
delete D.position;
if(S){F=this.getOrigPosition();
if(T.openOpacity){F.opacity=0.1
}}else{if(R==="fade"){F.opacity=0.1
}}Q.wrap.css(F).animate(D,{duration:R==="none"?0:T.openSpeed,easing:T.openEasing,step:S?this.step:null,complete:Q._afterZoomIn})
},zoomOut:function(){var S=Q.current,F=S.closeEffect,R=F==="elastic",D={opacity:0.1};
if(R){D=this.getOrigPosition();
if(S.closeOpacity){D.opacity=0.1
}}Q.wrap.animate(D,{duration:F==="none"?0:S.closeSpeed,easing:S.closeEasing,step:R?this.step:null,complete:Q._afterZoomOut})
},changeIn:function(){var U=Q.current,R=U.nextEffect,F=U.pos,D={opacity:1},T=Q.direction,V=200,S;
F.opacity=0.1;
if(R==="elastic"){S=T==="down"||T==="up"?"top":"left";
if(T==="up"||T==="left"){F[S]=I(parseInt(F[S],10)-V);
D[S]="+="+V+"px"
}else{F[S]=I(parseInt(F[S],10)+V);
D[S]="-="+V+"px"
}}Q.wrap.css(F).animate(D,{duration:R==="none"?0:U.nextSpeed,easing:U.nextEasing,complete:function(){setTimeout(Q._afterZoomIn,10)
}})
},changeOut:function(){var R=Q.previous,F=R.prevEffect,D={opacity:0.1},S=Q.direction,T=200;
if(F==="elastic"){D[S==="down"||S==="up"?"top":"left"]=(S==="down"||S==="right"?"-":"+")+"="+T+"px"
}R.wrap.animate(D,{duration:F==="none"?0:R.prevSpeed,easing:R.prevEasing,complete:function(){K(this).trigger("onReset").remove()
}})
}};
Q.helpers.overlay={overlay:null,update:function(){var R,D,F;
this.overlay.width("100%").height("100%");
if(K.browser.msie||H){D=Math.max(P.documentElement.scrollWidth,P.body.scrollWidth);
F=Math.max(P.documentElement.offsetWidth,P.body.offsetWidth);
R=D<F?E.width():D
}else{R=A.width()
}this.overlay.width(R).height(A.height())
},beforeShow:function(F){var D;
if(this.overlay){return 
}F=K.extend(true,{},Q.defaults.helpers.overlay,F);
D=this.overlay=K('<div id="fancybox-overlay"></div>').css(F.css).appendTo("body").bind("mousewheel",function(R){if(!Q.wrap||(Q.wrap.css("position")==="fixed"||Q.wrap.is(":animated"))){R.preventDefault()
}});
if(F.closeClick){D.bind("click.fb",Q.close)
}if(Q.defaults.fixed&&!H){D.addClass("overlay-fixed")
}else{this.update();
this.onUpdate=function(){this.update()
}
}D.fadeTo(F.speedIn,F.opacity)
},afterClose:function(D){if(this.overlay){this.overlay.fadeOut(D.speedOut||0,function(){K(this).remove()
})
}this.overlay=null
}};
Q.helpers.title={beforeShow:function(F){var T=Q.current.title,D=F.type,S,R;
if(!B(T)||K.trim(T)===""){return 
}S=K('<div class="fancybox-title fancybox-title-'+D+'-wrap">'+T+"</div>");
switch(D){case"inside":R=Q.skin;
break;
case"outside":R=Q.wrap;
break;
case"over":R=Q.inner;
break;
default:R=Q.skin;
S.appendTo("body").width(S.width()).wrapInner('<span class="child"></span>');
Q.current.margin[2]+=Math.abs(parseInt(S.css("margin-bottom"),10));
break
}if(F.position==="top"){S.prependTo(R)
}else{S.appendTo(R)
}}};
K.fn.fancybox=function(R){var F,S=K(this),D=this.selector||"",T=function(X){var W=this,U=F,V,Y;
if(!(X.ctrlKey||X.altKey||X.shiftKey||X.metaKey)&&!K(W).is(".fancybox-wrap")){V=R.groupAttr||"data-fancybox-group";
Y=K(W).attr(V);
if(!Y){V="rel";
Y=W[V]
}if(Y&&Y!==""&&Y!=="nofollow"){W=D.length?K(D):S;
W=W.filter("["+V+'="'+Y+'"]');
U=W.index(this)
}R.index=U;
if(Q.open(W,R)!==false){X.preventDefault()
}}};
R=R||{};
F=R.index||0;
if(!D||R.live===false){S.unbind("click.fb-start").bind("click.fb-start",T)
}else{A.undelegate(D,"click.fb-start").delegate(D+":not('.fancybox-item, .fancybox-nav')","click.fb-start",T)
}return this
};
if(!K.scrollbarWidth){K.scrollbarWidth=function(){var F,R,D;
F=K('<div style="width:50px;height:50px;overflow:auto"><div/></div>').appendTo("body");
R=F.children();
D=R.innerWidth()-R.height(99).innerWidth();
F.remove();
return D
}
}A.ready(function(){K.extend(Q.defaults,{scrollOutside:K.scrollbarWidth(),fixed:K.support.fixedPosition||!((K.browser.msie&&K.browser.version<=6)||H),parent:K("body")})
})
}(window,document,jQuery));
/*
* MediaElement.js
* HTML5 <video> and <audio> shim and player
* http://mediaelementjs.com/
*
* Creates a JavaScript object that mimics HTML5 MediaElement API
* for browsers that don't understand HTML5 or can't play the provided codec
* Can play MP4 (H.264), Ogg, WebM, FLV, WMV, WMA, ACC, and MP3
*
* Copyright 2010-2012, John Dyer (http://j.hn)
* Dual licensed under the MIT or GPL Version 2 licenses.
*
*/
var mejs=mejs||{};
mejs.version="2.7.0";
mejs.meIndex=0;
mejs.plugins={silverlight:[{version:[3,0],types:["video/mp4","video/m4v","video/mov","video/wmv","audio/wma","audio/m4a","audio/mp3","audio/wav","audio/mpeg"]}],flash:[{version:[9,0,124],types:["video/mp4","video/m4v","video/mov","video/flv","video/x-flv","audio/flv","audio/x-flv","audio/mp3","audio/m4a","audio/mpeg"]}],youtube:[{version:null,types:["video/youtube"]}],vimeo:[{version:null,types:["video/vimeo"]}]};
mejs.Utility={encodeUrl:function(A){return encodeURIComponent(A)
},escapeHTML:function(A){return A.toString().split("&").join("&amp;").split("<").join("&lt;").split('"').join("&quot;")
},absolutizeUrl:function(A){var B=document.createElement("div");
B.innerHTML='<a href="'+this.escapeHTML(A)+'">x</a>';
return B.firstChild.href
},getScriptPath:function(H){var E=0,C,I="",A="",F,B=document.getElementsByTagName("script"),G=B.length,D=H.length;
for(;
E<G;
E++){F=B[E].src;
for(C=0;
C<D;
C++){A=H[C];
if(F.indexOf(A)>-1){I=F.substring(0,F.indexOf(A));
break
}}if(I!==""){break
}}return I
},secondsToTimeCode:function(C,G,A,B){if(typeof A=="undefined"){A=false
}else{if(typeof B=="undefined"){B=25
}}var F=Math.floor(C/3600)%24,D=Math.floor(C/60)%60,H=Math.floor(C%60),E=Math.floor(((C%1)*B).toFixed(3)),I=((G||F>0)?(F<10?"0"+F:F)+":":"")+(D<10?"0"+D:D)+":"+(H<10?"0"+H:H)+((A)?":"+(E<10?"0"+E:E):"");
return I
},timeCodeToSeconds:function(C,J,D,E){if(typeof D=="undefined"){D=false
}else{if(typeof E=="undefined"){E=25
}}var F=C.split(":"),A=parseInt(F[0],10),B=parseInt(F[1],10),H=parseInt(F[2],10),I=0,G=0;
if(D){I=parseInt(F[3])/E
}G=(A*3600)+(B*60)+H+I;
return G
},removeSwf:function(B){var A=document.getElementById(B);
if(A&&A.nodeName=="OBJECT"){if(mejs.MediaFeatures.isIE){A.style.display="none";
(function(){if(A.readyState==4){mejs.Utility.removeObjectInIE(B)
}else{setTimeout(arguments.callee,10)
}})()
}else{A.parentNode.removeChild(A)
}}},removeObjectInIE:function(C){var B=document.getElementById(C);
if(B){for(var A in B){if(typeof B[A]=="function"){B[A]=null
}}B.parentNode.removeChild(B)
}}};
mejs.PluginDetector={hasPluginVersion:function(C,A){var B=this.plugins[C];
A[1]=A[1]||0;
A[2]=A[2]||0;
return(B[0]>A[0]||(B[0]==A[0]&&B[1]>A[1])||(B[0]==A[0]&&B[1]==A[1]&&B[2]>=A[2]))?true:false
},nav:window.navigator,ua:window.navigator.userAgent.toLowerCase(),plugins:[],addPlugin:function(D,C,E,A,B){this.plugins[D]=this.detectPlugin(C,E,A,B)
},detectPlugin:function(F,B,C,I){var G=[0,0,0],H,D,A;
if(typeof (this.nav.plugins)!="undefined"&&typeof this.nav.plugins[F]=="object"){H=this.nav.plugins[F].description;
if(H&&!(typeof this.nav.mimeTypes!="undefined"&&this.nav.mimeTypes[B]&&!this.nav.mimeTypes[B].enabledPlugin)){G=H.replace(F,"").replace(/^\s+/,"").replace(/\sr/gi,".").split(".");
for(D=0;
D<G.length;
D++){G[D]=parseInt(G[D].match(/\d+/),10)
}}}else{if(typeof (window.ActiveXObject)!="undefined"){try{A=new ActiveXObject(C);
if(A){G=I(A)
}}catch(E){}}}return G
}};
mejs.PluginDetector.addPlugin("flash","Shockwave Flash","application/x-shockwave-flash","ShockwaveFlash.ShockwaveFlash",function(B){var A=[],C=B.GetVariable("$version");
if(C){C=C.split(" ")[1].split(",");
A=[parseInt(C[0],10),parseInt(C[1],10),parseInt(C[2],10)]
}return A
});
mejs.PluginDetector.addPlugin("silverlight","Silverlight Plug-In","application/x-silverlight-2","AgControl.AgControl",function(B){var A=[0,0,0,0],C=function(F,D,E,G){while(F.isVersionSupported(D[0]+"."+D[1]+"."+D[2]+"."+D[3])){D[E]+=G
}D[E]-=G
};
C(B,A,0,1);
C(B,A,1,1);
C(B,A,2,10000);
C(B,A,2,1000);
C(B,A,2,100);
C(B,A,2,10);
C(B,A,2,1);
C(B,A,3,1);
return A
});
mejs.MediaFeatures={init:function(){var D=this,G=document,F=mejs.PluginDetector.nav,C=mejs.PluginDetector.ua.toLowerCase(),B,A,E=["source","track","audio","video"];
D.isiPad=(C.match(/ipad/i)!==null);
D.isiPhone=(C.match(/iphone/i)!==null);
D.isiOS=D.isiPhone||D.isiPad;
D.isAndroid=(C.match(/android/i)!==null);
D.isBustedAndroid=(C.match(/android 2\.[12]/)!==null);
D.isIE=(F.appName.toLowerCase().indexOf("microsoft")!=-1);
D.isChrome=(C.match(/chrome/gi)!==null);
D.isFirefox=(C.match(/firefox/gi)!==null);
D.isWebkit=(C.match(/webkit/gi)!==null);
D.isGecko=(C.match(/gecko/gi)!==null)&&!D.isWebkit;
D.isOpera=(C.match(/opera/gi)!==null);
D.hasTouch=("ontouchstart" in window);
for(B=0;
B<E.length;
B++){A=document.createElement(E[B])
}D.supportsMediaTag=(typeof A.canPlayType!=="undefined"||D.isBustedAndroid);
D.hasSemiNativeFullScreen=(typeof A.webkitEnterFullscreen!=="undefined");
D.hasWebkitNativeFullScreen=(typeof A.webkitRequestFullScreen!=="undefined");
D.hasMozNativeFullScreen=(typeof A.mozRequestFullScreen!=="undefined");
D.hasTrueNativeFullScreen=(D.hasWebkitNativeFullScreen||D.hasMozNativeFullScreen);
D.nativeFullScreenEnabled=D.hasTrueNativeFullScreen;
if(D.hasMozNativeFullScreen){D.nativeFullScreenEnabled=A.mozFullScreenEnabled
}if(this.isChrome){D.hasSemiNativeFullScreen=false
}if(D.hasTrueNativeFullScreen){D.fullScreenEventName=(D.hasWebkitNativeFullScreen)?"webkitfullscreenchange":"mozfullscreenchange";
D.isFullScreen=function(){if(A.mozRequestFullScreen){return G.mozFullScreen
}else{if(A.webkitRequestFullScreen){return G.webkitIsFullScreen
}}};
D.requestFullScreen=function(H){if(D.hasWebkitNativeFullScreen){H.webkitRequestFullScreen()
}else{if(D.hasMozNativeFullScreen){H.mozRequestFullScreen()
}}};
D.cancelFullScreen=function(){if(D.hasWebkitNativeFullScreen){document.webkitCancelFullScreen()
}else{if(D.hasMozNativeFullScreen){document.mozCancelFullScreen()
}}}
}if(D.hasSemiNativeFullScreen&&C.match(/mac os x 10_5/i)){D.hasNativeFullScreen=false;
D.hasSemiNativeFullScreen=false
}}};
mejs.MediaFeatures.init();
mejs.HtmlMediaElement={pluginType:"native",isFullScreen:false,setCurrentTime:function(A){this.currentTime=A
},setMuted:function(A){this.muted=A
},setVolume:function(A){this.volume=A
},stop:function(){this.pause()
},setSrc:function(A){var C=this.getElementsByTagName("source");
while(C.length>0){this.removeChild(C[0])
}if(typeof A=="string"){this.src=A
}else{var B,D;
for(B=0;
B<A.length;
B++){D=A[B];
if(this.canPlayType(D.type)){this.src=D.src
}}}},setVideoSize:function(B,A){this.width=B;
this.height=A
}};
mejs.PluginMediaElement=function(B,C,A){this.id=B;
this.pluginType=C;
this.src=A;
this.events={}
};
mejs.PluginMediaElement.prototype={pluginElement:null,pluginType:"",isFullScreen:false,playbackRate:-1,defaultPlaybackRate:-1,seekable:[],played:[],paused:true,ended:false,seeking:false,duration:0,error:null,tagName:"",muted:false,volume:1,currentTime:0,play:function(){if(this.pluginApi!=null){if(this.pluginType=="youtube"){this.pluginApi.playVideo()
}else{this.pluginApi.playMedia()
}this.paused=false
}},load:function(){if(this.pluginApi!=null){if(this.pluginType=="youtube"){}else{this.pluginApi.loadMedia()
}this.paused=false
}},pause:function(){if(this.pluginApi!=null){if(this.pluginType=="youtube"){this.pluginApi.pauseVideo()
}else{this.pluginApi.pauseMedia()
}this.paused=true
}},stop:function(){if(this.pluginApi!=null){if(this.pluginType=="youtube"){this.pluginApi.stopVideo()
}else{this.pluginApi.stopMedia()
}this.paused=true
}},canPlayType:function(E){var D,C,A,B=mejs.plugins[this.pluginType];
for(D=0;
D<B.length;
D++){A=B[D];
if(mejs.PluginDetector.hasPluginVersion(this.pluginType,A.version)){for(C=0;
C<A.types.length;
C++){if(E==A.types[C]){return true
}}}}return false
},positionFullscreenButton:function(A,C,B){if(this.pluginApi!=null&&this.pluginApi.positionFullscreenButton){this.pluginApi.positionFullscreenButton(A,C,B)
}},hideFullscreenButton:function(){if(this.pluginApi!=null&&this.pluginApi.hideFullscreenButton){this.pluginApi.hideFullscreenButton()
}},setSrc:function(A){if(typeof A=="string"){this.pluginApi.setSrc(mejs.Utility.absolutizeUrl(A));
this.src=mejs.Utility.absolutizeUrl(A)
}else{var B,C;
for(B=0;
B<A.length;
B++){C=A[B];
if(this.canPlayType(C.type)){this.pluginApi.setSrc(mejs.Utility.absolutizeUrl(C.src));
this.src=mejs.Utility.absolutizeUrl(A)
}}}},setCurrentTime:function(A){if(this.pluginApi!=null){if(this.pluginType=="youtube"){this.pluginApi.seekTo(A)
}else{this.pluginApi.setCurrentTime(A)
}this.currentTime=A
}},setVolume:function(A){if(this.pluginApi!=null){if(this.pluginType=="youtube"){this.pluginApi.setVolume(A*100)
}else{this.pluginApi.setVolume(A)
}this.volume=A
}},setMuted:function(A){if(this.pluginApi!=null){if(this.pluginType=="youtube"){if(A){this.pluginApi.mute()
}else{this.pluginApi.unMute()
}this.muted=A;
this.dispatchEvent("volumechange")
}else{this.pluginApi.setMuted(A)
}this.muted=A
}},setVideoSize:function(B,A){if(this.pluginElement.style){this.pluginElement.style.width=B+"px";
this.pluginElement.style.height=A+"px"
}if(this.pluginApi!=null&&this.pluginApi.setVideoSize){this.pluginApi.setVideoSize(B,A)
}},setFullscreen:function(A){if(this.pluginApi!=null&&this.pluginApi.setFullscreen){this.pluginApi.setFullscreen(A)
}},enterFullScreen:function(){if(this.pluginApi!=null&&this.pluginApi.setFullscreen){this.setFullscreen(true)
}},exitFullScreen:function(){if(this.pluginApi!=null&&this.pluginApi.setFullscreen){this.setFullscreen(false)
}},addEventListener:function(B,C,A){this.events[B]=this.events[B]||[];
this.events[B].push(C)
},removeEventListener:function(A,C){if(!A){this.events={};
return true
}var B=this.events[A];
if(!B){return true
}if(!C){this.events[A]=[];
return true
}for(i=0;
i<B.length;
i++){if(B[i]===C){this.events[A].splice(i,1);
return true
}}return false
},dispatchEvent:function(A){var C,B,D=this.events[A];
if(D){B=Array.prototype.slice.call(arguments,1);
for(C=0;
C<D.length;
C++){D[C].apply(null,B)
}}},attributes:{},hasAttribute:function(A){return(A in this.attributes)
},removeAttribute:function(A){delete this.attributes[A]
},getAttribute:function(A){if(this.hasAttribute(A)){return this.attributes[A]
}return""
},setAttribute:function(A,B){this.attributes[A]=B
},remove:function(){mejs.Utility.removeSwf(this.pluginElement.id)
}};
mejs.MediaPluginBridge={pluginMediaElements:{},htmlMediaElements:{},registerPluginElement:function(C,A,B){this.pluginMediaElements[C]=A;
this.htmlMediaElements[C]=B
},initPlugin:function(C){var A=this.pluginMediaElements[C],B=this.htmlMediaElements[C];
if(A){switch(A.pluginType){case"flash":A.pluginElement=A.pluginApi=document.getElementById(C);
break;
case"silverlight":A.pluginElement=document.getElementById(A.id);
A.pluginApi=A.pluginElement.Content.MediaElementJS;
break
}if(A.pluginApi!=null&&A.success){A.success(A,B)
}}},fireEvent:function(G,C,B){var F,E,A,D=this.pluginMediaElements[G];
D.ended=false;
D.paused=true;
F={type:C,target:D};
for(E in B){D[E]=B[E];
F[E]=B[E]
}A=B.bufferedTime||0;
F.target.buffered=F.buffered={start:function(H){return 0
},end:function(H){return A
},length:1};
D.dispatchEvent(F.type,F)
}};
mejs.MediaElementDefaults={mode:"auto",plugins:["flash","silverlight","youtube","vimeo"],enablePluginDebug:false,type:"",pluginPath:mejs.Utility.getScriptPath(["mediaelement.js","mediaelement.min.js","mediaelement-and-player.js","mediaelement-and-player.min.js"]),flashName:"flashmediaelement.swf",enablePluginSmoothing:false,silverlightName:"silverlightmediaelement.xap",defaultVideoWidth:480,defaultVideoHeight:270,pluginWidth:-1,pluginHeight:-1,pluginVars:[],timerRate:250,startVolume:0.8,success:function(){},error:function(){}};
mejs.MediaElement=function(A,B){return mejs.HtmlMediaElementShim.create(A,B)
};
mejs.HtmlMediaElementShim={create:function(E,D){var M=mejs.MediaElementDefaults,J=(typeof (E)=="string")?document.getElementById(E):E,H=J.tagName.toLowerCase(),G=(H==="audio"||H==="video"),B=(G)?J.getAttribute("src"):J.getAttribute("href"),K=J.getAttribute("poster"),F=J.getAttribute("autoplay"),I=J.getAttribute("preload"),L=J.getAttribute("controls"),A,C;
for(C in D){M[C]=D[C]
}B=(typeof B=="undefined"||B===null||B=="")?null:B;
K=(typeof K=="undefined"||K===null)?"":K;
I=(typeof I=="undefined"||I===null||I==="false")?"none":I;
F=!(typeof F=="undefined"||F===null||F==="false");
L=!(typeof L=="undefined"||L===null||L==="false");
A=this.determinePlayback(J,M,mejs.MediaFeatures.supportsMediaTag,G,B);
A.url=(A.url!==null)?mejs.Utility.absolutizeUrl(A.url):"";
if(A.method=="native"){if(mejs.MediaFeatures.isBustedAndroid){J.src=A.url;
J.addEventListener("click",function(){J.play()
},false)
}return this.updateNative(A,M,F,I)
}else{if(A.method!==""){return this.createPlugin(A,M,K,F,I,L)
}else{this.createErrorMessage(A,M,K);
return this
}}},determinePlayback:function(N,Q,B,D,A){var P=[],I,H,G,F,C,L,O={method:"",url:"",htmlMediaElement:N,isVideo:(N.tagName.toLowerCase()!="audio")},J,K,M,E;
if(typeof Q.type!="undefined"&&Q.type!==""){if(typeof Q.type=="string"){P.push({type:Q.type,url:A})
}else{for(I=0;
I<Q.type.length;
I++){P.push({type:Q.type[I],url:A})
}}}else{if(A!==null){L=this.formatType(A,N.getAttribute("type"));
P.push({type:L,url:A})
}else{for(I=0;
I<N.childNodes.length;
I++){C=N.childNodes[I];
if(C.nodeType==1&&C.tagName.toLowerCase()=="source"){A=C.getAttribute("src");
L=this.formatType(A,C.getAttribute("type"));
P.push({type:L,url:A})
}}}}if(!D&&P.length>0&&P[0].url!==null&&this.getTypeFromFile(P[0].url).indexOf("audio")>-1){O.isVideo=false
}if(mejs.MediaFeatures.isBustedAndroid){N.canPlayType=function(R){return(R.match(/video\/(mp4|m4v)/gi)!==null)?"maybe":""
}
}if(B&&(Q.mode==="auto"||Q.mode==="native")){if(!D){E=document.createElement(O.isVideo?"video":"audio");
N.parentNode.insertBefore(E,N);
N.style.display="none";
O.htmlMediaElement=N=E
}for(I=0;
I<P.length;
I++){if(N.canPlayType(P[I].type).replace(/no/,"")!==""||N.canPlayType(P[I].type.replace(/mp3/,"mpeg")).replace(/no/,"")!==""){O.method="native";
O.url=P[I].url;
break
}}if(O.method==="native"){if(O.url!==null){N.src=O.url
}return O
}}if(Q.mode==="auto"||Q.mode==="shim"){for(I=0;
I<P.length;
I++){L=P[I].type;
for(H=0;
H<Q.plugins.length;
H++){J=Q.plugins[H];
K=mejs.plugins[J];
for(G=0;
G<K.length;
G++){M=K[G];
if(M.version==null||mejs.PluginDetector.hasPluginVersion(J,M.version)){for(F=0;
F<M.types.length;
F++){if(L==M.types[F]){O.method=J;
O.url=P[I].url;
return O
}}}}}}}if(O.method===""&&P.length>0){O.url=P[0].url
}return O
},formatType:function(A,C){var B;
if(A&&!C){return this.getTypeFromFile(A)
}else{if(C&&~C.indexOf(";")){return C.substr(0,C.indexOf(";"))
}else{return C
}}},getTypeFromFile:function(A){var B=A.substring(A.lastIndexOf(".")+1);
return(/(mp4|m4v|ogg|ogv|webm|flv|wmv|mpeg|mov)/gi.test(B)?"video":"audio")+"/"+B
},createErrorMessage:function(C,B,F){var D=C.htmlMediaElement,A=document.createElement("div");
A.className="me-cannotplay";
try{A.style.width=D.width+"px";
A.style.height=D.height+"px"
}catch(E){}A.innerHTML=(F!=="")?'<a href="'+C.url+'"><img src="'+F+'" width="100%" height="100%" /></a>':'<a href="'+C.url+'"><span>Download File</span></a>';
D.parentNode.insertBefore(A,D);
D.style.display="none";
B.error(D)
},createPlugin:function(M,A,C,E,D,H){var Q=M.htmlMediaElement,L=1,K=1,R="me_"+M.method+"_"+(mejs.meIndex++),N=new mejs.PluginMediaElement(R,M.method,M.url),G=document.createElement("div"),B,O,I;
N.tagName=Q.tagName;
for(var P=0;
P<Q.attributes.length;
P++){var F=Q.attributes[P];
if(F.specified==true){N.setAttribute(F.name,F.value)
}}O=Q.parentNode;
while(O!==null&&O.tagName.toLowerCase()!="body"){if(O.parentNode.tagName.toLowerCase()=="p"){O.parentNode.parentNode.insertBefore(O,O.parentNode);
break
}O=O.parentNode
}if(M.isVideo){L=(A.videoWidth>0)?A.videoWidth:(Q.getAttribute("width")!==null)?Q.getAttribute("width"):A.defaultVideoWidth;
K=(A.videoHeight>0)?A.videoHeight:(Q.getAttribute("height")!==null)?Q.getAttribute("height"):A.defaultVideoHeight;
L=mejs.Utility.encodeUrl(L);
K=mejs.Utility.encodeUrl(K)
}else{if(A.enablePluginDebug){L=320;
K=240
}}N.success=A.success;
mejs.MediaPluginBridge.registerPluginElement(R,N,Q);
G.className="me-plugin";
G.id=R+"_container";
if(M.isVideo){Q.parentNode.insertBefore(G,Q)
}else{document.body.insertBefore(G,document.body.childNodes[0])
}I=["id="+R,"isvideo="+((M.isVideo)?"true":"false"),"autoplay="+((E)?"true":"false"),"preload="+D,"width="+L,"startvolume="+A.startVolume,"timerrate="+A.timerRate,"height="+K];
if(M.url!==null){if(M.method=="flash"){I.push("file="+mejs.Utility.encodeUrl(M.url))
}else{I.push("file="+M.url)
}}if(A.enablePluginDebug){I.push("debug=true")
}if(A.enablePluginSmoothing){I.push("smoothing=true")
}if(H){I.push("controls=true")
}if(A.pluginVars){I=I.concat(A.pluginVars)
}switch(M.method){case"silverlight":G.innerHTML='<object data="data:application/x-silverlight-2," type="application/x-silverlight-2" id="'+R+'" name="'+R+'" width="'+L+'" height="'+K+'"><param name="initParams" value="'+I.join(",")+'" /><param name="windowless" value="true" /><param name="background" value="black" /><param name="minRuntimeVersion" value="3.0.0.0" /><param name="autoUpgrade" value="true" /><param name="source" value="'+A.pluginPath+A.silverlightName+'" /></object>';
break;
case"flash":if(mejs.MediaFeatures.isIE){B=document.createElement("div");
G.appendChild(B);
B.outerHTML='<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="//download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab" id="'+R+'" width="'+L+'" height="'+K+'"><param name="movie" value="'+A.pluginPath+A.flashName+"?x="+(new Date())+'" /><param name="flashvars" value="'+I.join("&amp;")+'" /><param name="quality" value="high" /><param name="bgcolor" value="#000000" /><param name="wmode" value="transparent" /><param name="allowScriptAccess" value="always" /><param name="allowFullScreen" value="true" /></object>'
}else{G.innerHTML='<embed id="'+R+'" name="'+R+'" play="true" loop="false" quality="high" bgcolor="#000000" wmode="transparent" allowScriptAccess="always" allowFullScreen="true" type="application/x-shockwave-flash" pluginspage="//www.macromedia.com/go/getflashplayer" src="'+A.pluginPath+A.flashName+'" flashvars="'+I.join("&")+'" width="'+L+'" height="'+K+'"></embed>'
}break;
case"youtube":var J=M.url.substr(M.url.lastIndexOf("=")+1);
youtubeSettings={container:G,containerId:G.id,pluginMediaElement:N,pluginId:R,videoId:J,height:K,width:L};
if(mejs.PluginDetector.hasPluginVersion("flash",[10,0,0])){mejs.YouTubeApi.createFlash(youtubeSettings)
}else{mejs.YouTubeApi.enqueueIframe(youtubeSettings)
}break;
case"vimeo":console.log("vimeoid");
N.vimeoid=M.url.substr(M.url.lastIndexOf("/")+1);
G.innerHTML='<object width="'+L+'" height="'+K+'"><param name="allowfullscreen" value="true" /><param name="allowscriptaccess" value="always" /><param name="flashvars" value="api=1" /><param name="movie" value="http://vimeo.com/moogaloop.swf?clip_id='+N.vimeoid+'&amp;server=vimeo.com&amp;show_title=0&amp;show_byline=0&amp;show_portrait=0&amp;color=00adef&amp;fullscreen=1&amp;autoplay=0&amp;loop=0" /><embed src="//vimeo.com/moogaloop.swf?api=1&amp;clip_id='+N.vimeoid+'&amp;server=vimeo.com&amp;show_title=0&amp;show_byline=0&amp;show_portrait=0&amp;color=00adef&amp;fullscreen=1&amp;autoplay=0&amp;loop=0" type="application/x-shockwave-flash" allowfullscreen="true" allowscriptaccess="always" width="'+L+'" height="'+K+'"></embed></object>';
break
}Q.style.display="none";
return N
},updateNative:function(D,C,F,B){var E=D.htmlMediaElement,A;
for(A in mejs.HtmlMediaElement){E[A]=mejs.HtmlMediaElement[A]
}C.success(E,E);
return E
}};
mejs.YouTubeApi={isIframeStarted:false,isIframeLoaded:false,loadIframeApi:function(){if(!this.isIframeStarted){var A=document.createElement("script");
A.src="http://www.youtube.com/player_api";
var B=document.getElementsByTagName("script")[0];
B.parentNode.insertBefore(A,B);
this.isIframeStarted=true
}},iframeQueue:[],enqueueIframe:function(A){if(this.isLoaded){this.createIframe(A)
}else{this.loadIframeApi();
this.iframeQueue.push(A)
}},createIframe:function(C){var B=C.pluginMediaElement,A=new YT.Player(C.containerId,{height:C.height,width:C.width,videoId:C.videoId,playerVars:{controls:0},events:{onReady:function(){C.pluginMediaElement.pluginApi=A;
mejs.MediaPluginBridge.initPlugin(C.pluginId);
setInterval(function(){mejs.YouTubeApi.createEvent(A,B,"timeupdate")
},250)
},onStateChange:function(D){mejs.YouTubeApi.handleStateChange(D.data,A,B)
}}})
},createEvent:function(D,C,B){var E={type:B,target:C};
if(D&&D.getDuration){C.currentTime=E.currentTime=D.getCurrentTime();
C.duration=E.duration=D.getDuration();
E.paused=C.paused;
E.ended=C.ended;
E.muted=D.isMuted();
E.volume=D.getVolume()/100;
E.bytesTotal=D.getVideoBytesTotal();
E.bufferedBytes=D.getVideoBytesLoaded();
var A=E.bufferedBytes/E.bytesTotal*E.duration;
E.target.buffered=E.buffered={start:function(F){return 0
},end:function(F){return A
},length:1}
}C.dispatchEvent(E.type,E)
},iFrameReady:function(){this.isLoaded=true;
this.isIframeLoaded=true;
while(this.iframeQueue.length>0){var A=this.iframeQueue.pop();
this.createIframe(A)
}},flashPlayers:{},createFlash:function(C){this.flashPlayers[C.pluginId]=C;
var B,A="http://www.youtube.com/apiplayer?enablejsapi=1&amp;playerapiid="+C.pluginId+"&amp;version=3&amp;autoplay=0&amp;controls=0&amp;modestbranding=1&loop=0";
if(mejs.MediaFeatures.isIE){B=document.createElement("div");
C.container.appendChild(B);
B.outerHTML='<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="//download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab" id="'+C.pluginId+'" width="'+C.width+'" height="'+C.height+'"><param name="movie" value="'+A+'" /><param name="wmode" value="transparent" /><param name="allowScriptAccess" value="always" /><param name="allowFullScreen" value="true" /></object>'
}else{C.container.innerHTML='<object type="application/x-shockwave-flash" id="'+C.pluginId+'" data="'+A+'" width="'+C.width+'" height="'+C.height+'" style="visibility: visible; "><param name="allowScriptAccess" value="always"><param name="wmode" value="transparent"></object>'
}},flashReady:function(E){var C=this.flashPlayers[E],B=document.getElementById(E),A=C.pluginMediaElement;
A.pluginApi=A.pluginElement=B;
mejs.MediaPluginBridge.initPlugin(E);
B.cueVideoById(C.videoId);
var D=C.containerId+"_callback";
window[D]=function(F){mejs.YouTubeApi.handleStateChange(F,B,A)
};
B.addEventListener("onStateChange",D);
setInterval(function(){mejs.YouTubeApi.createEvent(B,A,"timeupdate")
},250)
},handleStateChange:function(C,B,A){switch(C){case -1:A.paused=true;
A.ended=true;
mejs.YouTubeApi.createEvent(B,A,"loadedmetadata");
break;
case 0:A.paused=false;
A.ended=true;
mejs.YouTubeApi.createEvent(B,A,"ended");
break;
case 1:A.paused=false;
A.ended=false;
mejs.YouTubeApi.createEvent(B,A,"play");
mejs.YouTubeApi.createEvent(B,A,"playing");
break;
case 2:A.paused=true;
A.ended=false;
mejs.YouTubeApi.createEvent(B,A,"pause");
break;
case 3:mejs.YouTubeApi.createEvent(B,A,"progress");
break;
case 5:break
}}};
function onYouTubePlayerAPIReady(){mejs.YouTubeApi.iFrameReady()
}function onYouTubePlayerReady(A){mejs.YouTubeApi.flashReady(A)
}window.mejs=mejs;
window.MediaElement=mejs.MediaElement;
/*
 * MediaElementPlayer
 * http://mediaelementjs.com/
 *
 * Creates a controller bar for HTML5 <video> add <audio> tags
 * using jQuery and MediaElement.js (HTML5 Flash/Silverlight wrapper)
 *
 * Copyright 2010-2012, John Dyer (http://j.hn/)
 * Dual licensed under the MIT or GPL Version 2 licenses.
 *
 */
if(typeof jQuery!="undefined"){mejs.$=jQuery
}else{if(typeof ender!="undefined"){mejs.$=ender
}}(function(A){mejs.MepDefaults={poster:"",defaultVideoWidth:480,defaultVideoHeight:270,videoWidth:-1,videoHeight:-1,defaultAudioWidth:400,defaultAudioHeight:30,audioWidth:-1,audioHeight:-1,startVolume:0.8,loop:false,enableAutosize:true,alwaysShowHours:false,showTimecodeFrameCount:false,framesPerSecond:25,autosizeProgress:true,alwaysShowControls:false,iPadUseNativeControls:false,iPhoneUseNativeControls:false,AndroidUseNativeControls:false,features:["playpause","current","progress","duration","tracks","volume","fullscreen"],isVideo:true,enableKeyboard:true,pauseOtherPlayers:true,keyActions:[{keys:[32,179],action:function(B,C){if(C.paused||C.ended){C.play()
}else{C.pause()
}}},{keys:[38],action:function(B,D){var C=Math.min(D.volume+0.1,1);
D.setVolume(C)
}},{keys:[40],action:function(B,D){var C=Math.max(D.volume-0.1,0);
D.setVolume(C)
}},{keys:[37,227],action:function(B,D){if(!isNaN(D.duration)&&D.duration>0){if(B.isVideo){B.showControls();
B.startControlsTimer()
}var C=Math.min(D.currentTime-(D.duration*0.05),D.duration);
D.setCurrentTime(C)
}}},{keys:[39,228],action:function(B,D){if(!isNaN(D.duration)&&D.duration>0){if(B.isVideo){B.showControls();
B.startControlsTimer()
}var C=Math.max(D.currentTime+(D.duration*0.05),0);
D.setCurrentTime(C)
}}},{keys:[70],action:function(B,C){if(typeof B.enterFullScreen!="undefined"){if(B.isFullScreen){B.exitFullScreen()
}else{B.enterFullScreen()
}}}}]};
mejs.mepIndex=0;
mejs.players=[];
mejs.MediaElementPlayer=function(C,D){if(!(this instanceof mejs.MediaElementPlayer)){return new mejs.MediaElementPlayer(C,D)
}var B=this;
B.$media=B.$node=A(C);
B.node=B.media=B.$media[0];
if(typeof B.node.player!="undefined"){return B.node.player
}else{B.node.player=B
}if(typeof D=="undefined"){D=B.$node.data("mejsoptions")
}B.options=A.extend({},mejs.MepDefaults,D);
mejs.players.push(B);
B.init();
return B
};
mejs.MediaElementPlayer.prototype={hasFocus:false,controlsAreVisible:true,init:function(){var D=this,E=mejs.MediaFeatures,G=A.extend(true,{},D.options,{success:function(I,H){D.meReady(I,H)
},error:function(H){D.handleError(H)
}}),C=D.media.tagName.toLowerCase();
D.isDynamic=(C!=="audio"&&C!=="video");
if(D.isDynamic){D.isVideo=D.options.isVideo
}else{D.isVideo=(C!=="audio"&&D.options.isVideo)
}if((E.isiPad&&D.options.iPadUseNativeControls)||(E.isiPhone&&D.options.iPhoneUseNativeControls)){D.$media.attr("controls","controls");
if(E.isiPad&&D.media.getAttribute("autoplay")!==null){D.media.load();
D.media.play()
}}else{if(E.isAndroid&&D.AndroidUseNativeControls){}else{D.$media.removeAttr("controls");
D.id="mep_"+mejs.mepIndex++;
D.container=A('<div id="'+D.id+'" class="mejs-container"><div class="mejs-inner"><div class="mejs-mediaelement"></div><div class="mejs-layers"></div><div class="mejs-controls"></div><div class="mejs-clear"></div></div></div>').addClass(D.$media[0].className).insertBefore(D.$media);
D.container.addClass((E.isAndroid?"mejs-android ":"")+(E.isiOS?"mejs-ios ":"")+(E.isiPad?"mejs-ipad ":"")+(E.isiPhone?"mejs-iphone ":"")+(D.isVideo?"mejs-video ":"mejs-audio "));
if(E.isiOS){var F=D.$media.clone();
D.container.find(".mejs-mediaelement").append(F);
D.$media.remove();
D.$node=D.$media=F;
D.node=D.media=F[0]
}else{D.container.find(".mejs-mediaelement").append(D.$media)
}D.controls=D.container.find(".mejs-controls");
D.layers=D.container.find(".mejs-layers");
var B=C.substring(0,1).toUpperCase()+C.substring(1);
if(D.options[C+"Width"]>0||D.options[C+"Width"].toString().indexOf("%")>-1){D.width=D.options[C+"Width"]
}else{if(D.media.style.width!==""&&D.media.style.width!==null){D.width=D.media.style.width
}else{if(D.media.getAttribute("width")!==null){D.width=D.$media.attr("width")
}else{D.width=D.options["default"+B+"Width"]
}}}if(D.options[C+"Height"]>0||D.options[C+"Height"].toString().indexOf("%")>-1){D.height=D.options[C+"Height"]
}else{if(D.media.style.height!==""&&D.media.style.height!==null){D.height=D.media.style.height
}else{if(D.$media[0].getAttribute("height")!==null){D.height=D.$media.attr("height")
}else{D.height=D.options["default"+B+"Height"]
}}}D.setPlayerSize(D.width,D.height);
G.pluginWidth=D.height;
G.pluginHeight=D.width
}}mejs.MediaElement(D.$media[0],G)
},showControls:function(B){var C=this;
B=typeof B=="undefined"||B;
if(C.controlsAreVisible){return 
}if(B){C.controls.css("visibility","visible").stop(true,true).fadeIn(200,function(){C.controlsAreVisible=true
});
C.container.find(".mejs-control").css("visibility","visible").stop(true,true).fadeIn(200,function(){C.controlsAreVisible=true
})
}else{C.controls.css("visibility","visible").css("display","block");
C.container.find(".mejs-control").css("visibility","visible").css("display","block");
C.controlsAreVisible=true
}C.setControlsSize()
},hideControls:function(B){var C=this;
B=typeof B=="undefined"||B;
if(!C.controlsAreVisible){return 
}if(B){C.controls.stop(true,true).fadeOut(200,function(){A(this).css("visibility","hidden").css("display","block");
C.controlsAreVisible=false
});
C.container.find(".mejs-control").stop(true,true).fadeOut(200,function(){A(this).css("visibility","hidden").css("display","block")
})
}else{C.controls.css("visibility","hidden").css("display","block");
C.container.find(".mejs-control").css("visibility","hidden").css("display","block");
C.controlsAreVisible=false
}},controlsTimer:null,startControlsTimer:function(C){var B=this;
C=typeof C!="undefined"?C:1500;
B.killControlsTimer("start");
B.controlsTimer=setTimeout(function(){B.hideControls();
B.killControlsTimer("hide")
},C)
},killControlsTimer:function(C){var B=this;
if(B.controlsTimer!==null){clearTimeout(B.controlsTimer);
delete B.controlsTimer;
B.controlsTimer=null
}},controlsEnabled:true,disableControls:function(){var B=this;
B.killControlsTimer();
B.hideControls(false);
this.controlsEnabled=false
},enableControls:function(){var B=this;
B.showControls(false);
B.controlsEnabled=true
},meReady:function(D,F){var J=this,I=mejs.MediaFeatures,G=F.getAttribute("autoplay"),E=!(typeof G=="undefined"||G===null||G==="false"),B,K;
if(J.created){return 
}else{J.created=true
}J.media=D;
J.domNode=F;
if(!(I.isAndroid&&J.options.AndroidUseNativeControls)&&!(I.isiPad&&J.options.iPadUseNativeControls)&&!(I.isiPhone&&J.options.iPhoneUseNativeControls)){J.buildposter(J,J.controls,J.layers,J.media);
J.buildkeyboard(J,J.controls,J.layers,J.media);
J.buildoverlays(J,J.controls,J.layers,J.media);
J.findTracks();
for(B in J.options.features){K=J.options.features[B];
if(J["build"+K]){try{J["build"+K](J,J.controls,J.layers,J.media)
}catch(H){}}}J.container.trigger("controlsready");
J.setPlayerSize(J.width,J.height);
J.setControlsSize();
if(J.isVideo){if(mejs.MediaFeatures.hasTouch){J.$media.bind("touchstart",function(){if(J.controlsAreVisible){J.hideControls(false)
}else{if(J.controlsEnabled){J.showControls(false)
}}})
}else{var C=(J.media.pluginType=="native")?J.$media:A(J.media.pluginElement);
C.click(function(){if(D.paused){D.play()
}else{D.pause()
}});
J.container.bind("mouseenter mouseover",function(){if(J.controlsEnabled){if(!J.options.alwaysShowControls){J.killControlsTimer("enter");
J.showControls();
J.startControlsTimer(2500)
}}}).bind("mousemove",function(){if(J.controlsEnabled){if(!J.controlsAreVisible){J.showControls()
}if(!J.options.alwaysShowControls){J.startControlsTimer(2500)
}}}).bind("mouseleave",function(){if(J.controlsEnabled){if(!J.media.paused&&!J.options.alwaysShowControls){J.startControlsTimer(1000)
}}})
}if(E&&!J.options.alwaysShowControls){J.hideControls()
}if(J.options.enableAutosize){J.media.addEventListener("loadedmetadata",function(L){if(J.options.videoHeight<=0&&J.domNode.getAttribute("height")===null&&!isNaN(L.target.videoHeight)){J.setPlayerSize(L.target.videoWidth,L.target.videoHeight);
J.setControlsSize();
J.media.setVideoSize(L.target.videoWidth,L.target.videoHeight)
}},false)
}}D.addEventListener("play",function(){for(var M=0,L=mejs.players.length;
M<L;
M++){var N=mejs.players[M];
if(N.id!=J.id&&J.options.pauseOtherPlayers&&!N.paused&&!N.ended){N.pause()
}N.hasFocus=false
}J.hasFocus=true
},false);
J.media.addEventListener("ended",function(L){try{J.media.setCurrentTime(0)
}catch(M){}J.media.pause();
if(J.setProgressRail){J.setProgressRail()
}if(J.setCurrentRail){J.setCurrentRail()
}if(J.options.loop){J.media.play()
}else{if(!J.options.alwaysShowControls&&J.controlsEnabled){J.showControls()
}}},false);
J.media.addEventListener("loadedmetadata",function(L){if(J.updateDuration){J.updateDuration()
}if(J.updateCurrent){J.updateCurrent()
}if(!J.isFullScreen){J.setPlayerSize(J.width,J.height);
J.setControlsSize()
}},false);
setTimeout(function(){J.setPlayerSize(J.width,J.height);
J.setControlsSize()
},50);
A(window).resize(function(){if(!(J.isFullScreen||(mejs.MediaFeatures.hasTrueNativeFullScreen&&document.webkitIsFullScreen))){J.setPlayerSize(J.width,J.height)
}J.setControlsSize()
});
if(J.media.pluginType=="youtube"){J.container.find(".mejs-overlay-play").hide()
}}if(E&&D.pluginType=="native"){D.load();
D.play()
}if(J.options.success){if(typeof J.options.success=="string"){window[J.options.success](J.media,J.domNode,J)
}else{J.options.success(J.media,J.domNode,J)
}}},handleError:function(C){var B=this;
B.controls.hide();
if(B.options.error){B.options.error(C)
}},setPlayerSize:function(G,B){var E=this;
if(typeof G!="undefined"){E.width=G
}if(typeof B!="undefined"){E.height=B
}if(E.height.toString().indexOf("%")>0){var H=(E.media.videoWidth&&E.media.videoWidth>0)?E.media.videoWidth:E.options.defaultVideoWidth,D=(E.media.videoHeight&&E.media.videoHeight>0)?E.media.videoHeight:E.options.defaultVideoHeight,F=E.container.parent().width(),C=parseInt(F*D/H,10);
if(E.container.parent()[0].tagName.toLowerCase()==="body"){F=A(window).width();
C=A(window).height()
}E.container.width(F).height(C);
E.$media.width("100%").height("100%");
E.container.find("object, embed, iframe").width("100%").height("100%");
if(E.media.setVideoSize){E.media.setVideoSize(F,C)
}E.layers.children(".mejs-layer").width("100%").height("100%")
}else{E.container.width(E.width).height(E.height);
E.layers.children(".mejs-layer").width(E.width).height(E.height)
}},setControlsSize:function(){var C=this,F=0,H=0,G=C.controls.find(".mejs-time-rail"),D=C.controls.find(".mejs-time-total"),E=C.controls.find(".mejs-time-current"),B=C.controls.find(".mejs-time-loaded");
others=G.siblings();
if(C.options&&!C.options.autosizeProgress){H=parseInt(G.css("width"))
}if(H===0||!H){others.each(function(){if(A(this).css("position")!="absolute"){F+=A(this).outerWidth(true)
}});
H=C.controls.width()-F-(G.outerWidth(true)-G.outerWidth(false))
}G.width(H);
D.width(H-(D.outerWidth(true)-D.width()));
if(C.setProgressRail){C.setProgressRail()
}if(C.setCurrentRail){C.setCurrentRail()
}},buildposter:function(E,B,G,F){var D=this,H=A('<div class="mejs-poster mejs-layer"></div>').appendTo(G),C=E.$media.attr("poster");
if(E.options.poster!==""){C=E.options.poster
}if(C!==""&&C!=null){D.setPoster(C)
}else{H.hide()
}F.addEventListener("play",function(){H.hide()
},false)
},setPoster:function(C){var D=this,E=D.container.find(".mejs-poster"),B=E.find("img");
if(B.length==0){B=A('<img width="100%" height="100%" />').appendTo(E)
}B.attr("src",C)
},buildoverlays:function(E,B,G,F){if(!E.isVideo){return 
}var H=A('<div class="mejs-overlay mejs-layer"><div class="mejs-overlay-loading"><span></span></div></div>').hide().appendTo(G),C=A('<div class="mejs-overlay mejs-layer"><div class="mejs-overlay-error"></div></div>').hide().appendTo(G),D=A('<div class="mejs-overlay mejs-layer mejs-overlay-play"><div class="mejs-overlay-button"></div></div>').appendTo(G).click(function(){if(F.paused){F.play()
}else{F.pause()
}});
F.addEventListener("play",function(){D.hide();
H.hide();
C.hide()
},false);
F.addEventListener("playing",function(){D.hide();
H.hide();
C.hide()
},false);
F.addEventListener("pause",function(){if(!mejs.MediaFeatures.isiPhone){D.show()
}},false);
F.addEventListener("waiting",function(){H.show()
},false);
F.addEventListener("loadeddata",function(){H.show()
},false);
F.addEventListener("canplay",function(){H.hide()
},false);
F.addEventListener("error",function(){H.hide();
C.show();
C.find("mejs-overlay-error").html("Error loading this resource")
},false)
},buildkeyboard:function(D,B,F,E){var C=this;
A(document).keydown(function(L){if(D.hasFocus&&D.options.enableKeyboard){for(var K=0,G=D.options.keyActions.length;
K<G;
K++){var J=D.options.keyActions[K];
for(var H=0,I=J.keys.length;
H<I;
H++){if(L.keyCode==J.keys[H]){L.preventDefault();
J.action(D,E);
return false
}}}}return true
});
A(document).click(function(G){if(A(G.target).closest(".mejs-container").length==0){D.hasFocus=false
}})
},findTracks:function(){var B=this,C=B.$media.find("track");
B.tracks=[];
C.each(function(E,D){D=A(D);
B.tracks.push({srclang:D.attr("srclang").toLowerCase(),src:D.attr("src"),kind:D.attr("kind"),label:D.attr("label")||"",entries:[],isLoaded:false})
})
},changeSkin:function(B){this.container[0].className="mejs-container "+B;
this.setPlayerSize(this.width,this.height);
this.setControlsSize()
},play:function(){this.media.play()
},pause:function(){this.media.pause()
},load:function(){this.media.load()
},setMuted:function(B){this.media.setMuted(B)
},setCurrentTime:function(B){this.media.setCurrentTime(B)
},getCurrentTime:function(){return this.media.currentTime
},setVolume:function(B){this.media.setVolume(B)
},getVolume:function(){return this.media.volume
},setSrc:function(B){this.media.setSrc(B)
},remove:function(){var B=this;
if(B.media.pluginType=="flash"){B.media.remove()
}else{if(B.media.pluginTyp=="native"){B.media.prop("controls",true)
}}if(!B.isDynamic){B.$node.insertBefore(B.container)
}B.container.remove()
}};
if(typeof jQuery!="undefined"){jQuery.fn.mediaelementplayer=function(B){return this.each(function(){new mejs.MediaElementPlayer(this,B)
})
}
}A(document).ready(function(){A(".mejs-player").mediaelementplayer()
});
window.MediaElementPlayer=mejs.MediaElementPlayer
})(mejs.$);
(function(A){A.extend(mejs.MepDefaults,{playpauseText:"Play/Pause"});
A.extend(MediaElementPlayer.prototype,{buildplaypause:function(D,B,G,F){var C=this,E=A('<div class="mejs-button mejs-playpause-button mejs-play" ><button type="button" aria-controls="'+C.id+'" title="'+C.options.playpauseText+'"></button></div>').appendTo(B).click(function(H){H.preventDefault();
if(F.paused){F.play()
}else{F.pause()
}return false
});
F.addEventListener("play",function(){E.removeClass("mejs-play").addClass("mejs-pause")
},false);
F.addEventListener("playing",function(){E.removeClass("mejs-play").addClass("mejs-pause")
},false);
F.addEventListener("pause",function(){E.removeClass("mejs-pause").addClass("mejs-play")
},false);
F.addEventListener("paused",function(){E.removeClass("mejs-pause").addClass("mejs-play")
},false)
}})
})(mejs.$);
(function(A){A.extend(mejs.MepDefaults,{stopText:"Stop"});
A.extend(MediaElementPlayer.prototype,{buildstop:function(E,B,G,F){var D=this,C=A('<div class="mejs-button mejs-stop-button mejs-stop"><button type="button" aria-controls="'+D.id+'" title="'+D.options.stopText+"></button></div>").appendTo(B).click(function(){if(!F.paused){F.pause()
}if(F.currentTime>0){F.setCurrentTime(0);
B.find(".mejs-time-current").width("0px");
B.find(".mejs-time-handle").css("left","0px");
B.find(".mejs-time-float-current").html(mejs.Utility.secondsToTimeCode(0));
B.find(".mejs-currenttime").html(mejs.Utility.secondsToTimeCode(0));
G.find(".mejs-poster").show()
}})
}})
})(mejs.$);
(function(A){A.extend(MediaElementPlayer.prototype,{buildprogress:function(M,N,F,C){A('<div class="mejs-time-rail"><span class="mejs-time-total"><span class="mejs-time-loaded"></span><span class="mejs-time-current"></span><span class="mejs-time-handle"></span><span class="mejs-time-float"><span class="mejs-time-float-current">00:00</span><span class="mejs-time-float-corner"></span></span></span></div>').appendTo(N);
var O=this,K=N.find(".mejs-time-total"),G=N.find(".mejs-time-loaded"),J=N.find(".mejs-time-current"),I=N.find(".mejs-time-handle"),L=N.find(".mejs-time-float"),B=N.find(".mejs-time-float-current"),E=function(T){var P=T.pageX,U=K.offset(),R=K.outerWidth(),Q=0,S=0,V=P-U.left;
if(P>U.left&&P<=R+U.left&&C.duration){Q=((P-U.left)/R);
S=(Q<=0.02)?0:Q*C.duration;
if(H){C.setCurrentTime(S)
}if(!mejs.MediaFeatures.hasTouch){L.css("left",V);
B.html(mejs.Utility.secondsToTimeCode(S));
L.show()
}}},H=false,D=false;
K.bind("mousedown",function(P){if(P.which===1){H=true;
E(P);
return false
}});
N.find(".mejs-time-total").bind("mouseenter",function(P){D=true;
if(!mejs.MediaFeatures.hasTouch){L.show()
}}).bind("mouseleave",function(P){D=false;
L.hide()
});
A(document).bind("mouseup",function(P){H=false;
L.hide()
}).bind("mousemove",function(P){if(H||D){E(P)
}});
C.addEventListener("progress",function(P){M.setProgressRail(P);
M.setCurrentRail(P)
},false);
C.addEventListener("timeupdate",function(P){M.setProgressRail(P);
M.setCurrentRail(P)
},false);
O.loaded=G;
O.total=K;
O.current=J;
O.handle=I
},setProgressRail:function(E){var B=this,D=(E!=undefined)?E.target:B.media,C=null;
if(D&&D.buffered&&D.buffered.length>0&&D.buffered.end&&D.duration){C=D.buffered.end(0)/D.duration
}else{if(D&&D.bytesTotal!=undefined&&D.bytesTotal>0&&D.bufferedBytes!=undefined){C=D.bufferedBytes/D.bytesTotal
}else{if(E&&E.lengthComputable&&E.total!=0){C=E.loaded/E.total
}}}if(C!==null){C=Math.min(1,Math.max(0,C));
if(B.loaded&&B.total){B.loaded.width(B.total.width()*C)
}}},setCurrentRail:function(){var B=this;
if(B.media.currentTime!=undefined&&B.media.duration){if(B.total&&B.handle){var D=B.total.width()*B.media.currentTime/B.media.duration,C=D-(B.handle.outerWidth(true)/2);
B.current.width(D);
B.handle.css("left",C)
}}}})
})(mejs.$);
(function(A){A.extend(mejs.MepDefaults,{duration:-1,timeAndDurationSeparator:" <span> | </span> "});
A.extend(MediaElementPlayer.prototype,{buildcurrent:function(D,B,F,E){var C=this;
A('<div class="mejs-time"><span class="mejs-currenttime">'+(D.options.alwaysShowHours?"00:":"")+(D.options.showTimecodeFrameCount?"00:00:00":"00:00")+"</span></div>").appendTo(B);
C.currenttime=C.controls.find(".mejs-currenttime");
E.addEventListener("timeupdate",function(){D.updateCurrent()
},false)
},buildduration:function(D,B,F,E){var C=this;
if(B.children().last().find(".mejs-currenttime").length>0){A(C.options.timeAndDurationSeparator+'<span class="mejs-duration">'+(C.options.duration>0?mejs.Utility.secondsToTimeCode(C.options.duration,C.options.alwaysShowHours||C.media.duration>3600,C.options.showTimecodeFrameCount,C.options.framesPerSecond||25):((D.options.alwaysShowHours?"00:":"")+(D.options.showTimecodeFrameCount?"00:00:00":"00:00")))+"</span>").appendTo(B.find(".mejs-time"))
}else{B.find(".mejs-currenttime").parent().addClass("mejs-currenttime-container");
A('<div class="mejs-time mejs-duration-container"><span class="mejs-duration">'+(C.options.duration>0?mejs.Utility.secondsToTimeCode(C.options.duration,C.options.alwaysShowHours||C.media.duration>3600,C.options.showTimecodeFrameCount,C.options.framesPerSecond||25):((D.options.alwaysShowHours?"00:":"")+(D.options.showTimecodeFrameCount?"00:00:00":"00:00")))+"</span></div>").appendTo(B)
}C.durationD=C.controls.find(".mejs-duration");
E.addEventListener("timeupdate",function(){D.updateDuration()
},false)
},updateCurrent:function(){var B=this;
if(B.currenttime){B.currenttime.html(mejs.Utility.secondsToTimeCode(B.media.currentTime,B.options.alwaysShowHours||B.media.duration>3600,B.options.showTimecodeFrameCount,B.options.framesPerSecond||25))
}},updateDuration:function(){var B=this;
if(B.media.duration&&B.durationD){B.durationD.html(mejs.Utility.secondsToTimeCode(B.media.duration,B.options.alwaysShowHours,B.options.showTimecodeFrameCount,B.options.framesPerSecond||25))
}}})
})(mejs.$);
(function(A){A.extend(mejs.MepDefaults,{muteText:"Mute Toggle",hideVolumeOnTouchDevices:true,audioVolume:"horizontal",videoVolume:"vertical"});
A.extend(MediaElementPlayer.prototype,{buildvolume:function(M,N,I,D){if(mejs.MediaFeatures.hasTouch&&this.options.hideVolumeOnTouchDevices){return 
}var O=this,K=(O.isVideo)?O.options.videoVolume:O.options.audioVolume,F=(K=="horizontal")?A('<div class="mejs-button mejs-volume-button mejs-mute"><button type="button" aria-controls="'+O.id+'" title="'+O.options.muteText+'"></button></div><div class="mejs-horizontal-volume-slider"><div class="mejs-horizontal-volume-total"></div><div class="mejs-horizontal-volume-current"></div><div class="mejs-horizontal-volume-handle"></div></div>').appendTo(N):A('<div class="mejs-button mejs-volume-button mejs-mute"><button type="button" aria-controls="'+O.id+'" title="'+O.options.muteText+'"></button><div class="mejs-volume-slider"><div class="mejs-volume-total"></div><div class="mejs-volume-current"></div><div class="mejs-volume-handle"></div></div></div>').appendTo(N),P=O.container.find(".mejs-volume-slider, .mejs-horizontal-volume-slider"),B=O.container.find(".mejs-volume-total, .mejs-horizontal-volume-total"),H=O.container.find(".mejs-volume-current, .mejs-horizontal-volume-current"),G=O.container.find(".mejs-volume-handle, .mejs-horizontal-volume-handle"),L=function(V){if(!P.is(":visible")){P.show();
L(V);
P.hide();
return 
}V=Math.max(0,V);
V=Math.min(V,1);
if(V==0){F.removeClass("mejs-mute").addClass("mejs-unmute")
}else{F.removeClass("mejs-unmute").addClass("mejs-mute")
}if(K=="vertical"){var T=B.height(),S=B.position(),R=T-(T*V);
G.css("top",S.top+R-(G.height()/2));
H.height(T-R);
H.css("top",S.top+R)
}else{var Q=B.width(),S=B.position(),U=Q*V;
G.css("left",S.left+U-(G.width()/2));
H.width(U)
}},C=function(V){var T=null,R=B.offset();
if(K=="vertical"){var S=B.height(),Q=parseInt(B.css("top").replace(/px/,""),10),U=V.pageY-R.top;
T=(S-U)/S;
if(R.top==0||R.left==0){return 
}}else{var X=B.width(),W=V.pageX-R.left;
T=W/X
}T=Math.max(0,T);
T=Math.min(T,1);
L(T);
if(T==0){D.setMuted(true)
}else{D.setMuted(false)
}D.setVolume(T)
},J=false,E=false;
F.hover(function(){P.show();
E=true
},function(){E=false;
if(!J&&K=="vertical"){P.hide()
}});
P.bind("mouseover",function(){E=true
}).bind("mousedown",function(Q){C(Q);
J=true;
return false
});
A(document).bind("mouseup",function(Q){J=false;
if(!E&&K=="vertical"){P.hide()
}}).bind("mousemove",function(Q){if(J){C(Q)
}});
F.find("button").click(function(){D.setMuted(!D.muted)
});
D.addEventListener("volumechange",function(Q){if(!J){if(D.muted){L(0);
F.removeClass("mejs-mute").addClass("mejs-unmute")
}else{L(D.volume);
F.removeClass("mejs-unmute").addClass("mejs-mute")
}}},false);
if(O.container.is(":visible")){L(M.options.startVolume);
if(D.pluginType==="native"){D.setVolume(M.options.startVolume)
}}}})
})(mejs.$);
(function(A){A.extend(mejs.MepDefaults,{usePluginFullScreen:true,newWindowCallback:function(){return""
},fullscreenText:"Fullscreen"});
A.extend(MediaElementPlayer.prototype,{isFullScreen:false,isNativeFullScreen:false,docStyleOverflow:null,isInIframe:false,buildfullscreen:function(O,P,K,G){if(!O.isVideo){return 
}O.isInIframe=(window.location!=window.parent.location);
if(mejs.MediaFeatures.hasTrueNativeFullScreen){O.container.bind(mejs.MediaFeatures.fullScreenEventName,function(S){if(mejs.MediaFeatures.isFullScreen()){O.isNativeFullScreen=true;
O.setControlsSize()
}else{O.isNativeFullScreen=false;
O.exitFullScreen()
}})
}var R=this,L=0,E=0,B=O.container,H=A('<div class="mejs-button mejs-fullscreen-button"><button type="button" aria-controls="'+R.id+'" title="'+R.options.fullscreenText+'"></button></div>').appendTo(P);
if(R.media.pluginType==="native"||(!R.options.usePluginFullScreen&&!mejs.MediaFeatures.isFirefox)){H.click(function(){var S=(mejs.MediaFeatures.hasTrueNativeFullScreen&&mejs.MediaFeatures.isFullScreen())||O.isFullScreen;
if(S){O.exitFullScreen()
}else{O.enterFullScreen()
}})
}else{var J=null,D=(document.documentElement.style.pointerEvents==="");
if(D&&!mejs.MediaFeatures.isOpera){var Q=false,F=function(){if(Q){M.hide();
I.hide();
C.hide();
H.css("pointer-events","");
R.controls.css("pointer-events","");
Q=false
}},M=A('<div class="mejs-fullscreen-hover" />').appendTo(R.container).mouseover(F),I=A('<div class="mejs-fullscreen-hover"  />').appendTo(R.container).mouseover(F),C=A('<div class="mejs-fullscreen-hover"  />').appendTo(R.container).mouseover(F),N=function(){var T={position:"absolute",top:0,left:0};
M.css(T);
I.css(T);
C.css(T);
M.width(R.container.width()).height(R.container.height()-R.controls.height());
var S=H.offset().left-R.container.offset().left;
fullScreenBtnWidth=H.outerWidth(true);
I.width(S).height(R.controls.height()).css({top:R.container.height()-R.controls.height()});
C.width(R.container.width()-S-fullScreenBtnWidth).height(R.controls.height()).css({top:R.container.height()-R.controls.height(),left:S+fullScreenBtnWidth})
};
A(document).resize(function(){N()
});
H.mouseover(function(){if(!R.isFullScreen){var S=H.offset(),T=O.container.offset();
G.positionFullscreenButton(S.left-T.left,S.top-T.top,false);
H.css("pointer-events","none");
R.controls.css("pointer-events","none");
M.show();
C.show();
I.show();
N();
Q=true
}});
G.addEventListener("fullscreenchange",function(S){F()
})
}else{H.mouseover(function(){if(J!==null){clearTimeout(J);
delete J
}var S=H.offset(),T=O.container.offset();
G.positionFullscreenButton(S.left-T.left,S.top-T.top,true)
}).mouseout(function(){if(J!==null){clearTimeout(J);
delete J
}J=setTimeout(function(){G.hideFullscreenButton()
},1500)
})
}}O.fullscreenBtn=H;
A(document).bind("keydown",function(S){if(((mejs.MediaFeatures.hasTrueNativeFullScreen&&mejs.MediaFeatures.isFullScreen())||R.isFullScreen)&&S.keyCode==27){O.exitFullScreen()
}})
},enterFullScreen:function(){var C=this;
if(C.media.pluginType!=="native"&&(mejs.MediaFeatures.isFirefox||C.options.usePluginFullScreen)){return 
}docStyleOverflow=document.documentElement.style.overflow;
document.documentElement.style.overflow="hidden";
normalHeight=C.container.height();
normalWidth=C.container.width();
if(C.media.pluginType==="native"){if(mejs.MediaFeatures.hasTrueNativeFullScreen){mejs.MediaFeatures.requestFullScreen(C.container[0]);
if(C.isInIframe){setTimeout(function D(){if(C.isNativeFullScreen){if(A(window).width()!==screen.width){C.exitFullScreen()
}else{setTimeout(D,500)
}}},500)
}}else{if(mejs.MediaFeatures.hasSemiNativeFullScreen){C.media.webkitEnterFullscreen();
return 
}}}if(C.isInIframe){var B=C.options.newWindowCallback(this);
if(B!==""){if(!mejs.MediaFeatures.hasTrueNativeFullScreen){C.pause();
window.open(B,C.id,"top=0,left=0,width="+screen.availWidth+",height="+screen.availHeight+",resizable=yes,scrollbars=no,status=no,toolbar=no");
return 
}else{setTimeout(function(){if(!C.isNativeFullScreen){C.pause();
window.open(B,C.id,"top=0,left=0,width="+screen.availWidth+",height="+screen.availHeight+",resizable=yes,scrollbars=no,status=no,toolbar=no")
}},250)
}}}C.container.addClass("mejs-container-fullscreen").width("100%").height("100%");
setTimeout(function(){C.container.css({width:"100%",height:"100%"});
C.setControlsSize()
},500);
if(C.pluginType==="native"){C.$media.width("100%").height("100%")
}else{C.container.find("object, embed, iframe").width("100%").height("100%");
C.media.setVideoSize(A(window).width(),A(window).height())
}C.layers.children("div").width("100%").height("100%");
if(C.fullscreenBtn){C.fullscreenBtn.removeClass("mejs-fullscreen").addClass("mejs-unfullscreen")
}C.setControlsSize();
C.isFullScreen=true
},exitFullScreen:function(){var B=this;
if(B.media.pluginType!=="native"&&mejs.MediaFeatures.isFirefox){B.media.setFullscreen(false);
return 
}if(mejs.MediaFeatures.hasTrueNativeFullScreen&&(mejs.MediaFeatures.isFullScreen()||B.isFullScreen)){mejs.MediaFeatures.cancelFullScreen()
}document.documentElement.style.overflow=docStyleOverflow;
B.container.removeClass("mejs-container-fullscreen").width(normalWidth).height(normalHeight);
if(B.pluginType==="native"){B.$media.width(normalWidth).height(normalHeight)
}else{B.container.find("object embed").width(normalWidth).height(normalHeight);
B.media.setVideoSize(normalWidth,normalHeight)
}B.layers.children("div").width(normalWidth).height(normalHeight);
B.fullscreenBtn.removeClass("mejs-unfullscreen").addClass("mejs-fullscreen");
B.setControlsSize();
B.isFullScreen=false
}})
})(mejs.$);
(function(A){A.extend(mejs.MepDefaults,{startLanguage:"",tracksText:"Captions/Subtitles"});
A.extend(MediaElementPlayer.prototype,{hasChapters:false,buildtracks:function(F,B,H,G){if(!F.isVideo){return 
}if(F.tracks.length==0){return 
}var E=this,D,C="";
F.chapters=A('<div class="mejs-chapters mejs-layer"></div>').prependTo(H).hide();
F.captions=A('<div class="mejs-captions-layer mejs-layer"><div class="mejs-captions-position"><span class="mejs-captions-text"></span></div></div>').prependTo(H).hide();
F.captionsText=F.captions.find(".mejs-captions-text");
F.captionsButton=A('<div class="mejs-button mejs-captions-button"><button type="button" aria-controls="'+E.id+'" title="'+E.options.tracksText+'"></button><div class="mejs-captions-selector"><ul><li><input type="radio" name="'+F.id+'_captions" id="'+F.id+'_captions_none" value="none" checked="checked" /><label for="'+F.id+'_captions_none">None</label></li></ul></div></div>').appendTo(B).hover(function(){A(this).find(".mejs-captions-selector").css("visibility","visible")
},function(){A(this).find(".mejs-captions-selector").css("visibility","hidden")
}).delegate("input[type=radio]","click",function(){lang=this.value;
if(lang=="none"){F.selectedTrack=null
}else{for(D=0;
D<F.tracks.length;
D++){if(F.tracks[D].srclang==lang){F.selectedTrack=F.tracks[D];
F.captions.attr("lang",F.selectedTrack.srclang);
F.displayCaptions();
break
}}}});
if(!F.options.alwaysShowControls){F.container.bind("mouseenter",function(){F.container.find(".mejs-captions-position").addClass("mejs-captions-position-hover")
}).bind("mouseleave",function(){if(!G.paused){F.container.find(".mejs-captions-position").removeClass("mejs-captions-position-hover")
}})
}else{F.container.find(".mejs-captions-position").addClass("mejs-captions-position-hover")
}F.trackToLoad=-1;
F.selectedTrack=null;
F.isLoadingTrack=false;
for(D=0;
D<F.tracks.length;
D++){if(F.tracks[D].kind=="subtitles"){F.addTrackButton(F.tracks[D].srclang,F.tracks[D].label)
}}F.loadNextTrack();
G.addEventListener("timeupdate",function(I){F.displayCaptions()
},false);
G.addEventListener("loadedmetadata",function(I){F.displayChapters()
},false);
F.container.hover(function(){if(F.hasChapters){F.chapters.css("visibility","visible");
F.chapters.fadeIn(200)
}},function(){if(F.hasChapters&&!G.paused){F.chapters.fadeOut(200,function(){A(this).css("visibility","hidden");
A(this).css("display","block")
})
}});
if(F.node.getAttribute("autoplay")!==null){F.chapters.css("visibility","hidden")
}},loadNextTrack:function(){var B=this;
B.trackToLoad++;
if(B.trackToLoad<B.tracks.length){B.isLoadingTrack=true;
B.loadTrack(B.trackToLoad)
}else{B.isLoadingTrack=false
}},loadTrack:function(C){var D=this,B=D.tracks[C],E=function(){B.isLoaded=true;
D.enableTrackButton(B.srclang,B.label);
D.loadNextTrack()
};
if(B.isTranslation){mejs.TrackFormatParser.translateTrackText(D.tracks[0].entries,D.tracks[0].srclang,B.srclang,D.options.googleApiKey,function(F){B.entries=F;
E()
})
}else{A.ajax({url:B.src,success:function(F){B.entries=mejs.TrackFormatParser.parse(F);
E();
if(B.kind=="chapters"&&D.media.duration>0){D.drawChapters(B)
}},error:function(){D.loadNextTrack()
}})
}},enableTrackButton:function(D,B){var C=this;
if(B===""){B=mejs.language.codes[D]||D
}C.captionsButton.find("input[value="+D+"]").prop("disabled",false).siblings("label").html(B);
if(C.options.startLanguage==D){A("#"+C.id+"_captions_"+D).click()
}C.adjustLanguageBox()
},addTrackButton:function(D,B){var C=this;
if(B===""){B=mejs.language.codes[D]||D
}C.captionsButton.find("ul").append(A('<li><input type="radio" name="'+C.id+'_captions" id="'+C.id+"_captions_"+D+'" value="'+D+'" disabled="disabled" /><label for="'+C.id+"_captions_"+D+'">'+B+" (loading)</label></li>"));
C.adjustLanguageBox();
C.container.find(".mejs-captions-translations option[value="+D+"]").remove()
},adjustLanguageBox:function(){var B=this;
B.captionsButton.find(".mejs-captions-selector").height(B.captionsButton.find(".mejs-captions-selector ul").outerHeight(true)+B.captionsButton.find(".mejs-captions-translations").outerHeight(true))
},displayCaptions:function(){if(typeof this.tracks=="undefined"){return 
}var D=this,C,B=D.selectedTrack;
if(B!=null&&B.isLoaded){for(C=0;
C<B.entries.times.length;
C++){if(D.media.currentTime>=B.entries.times[C].start&&D.media.currentTime<=B.entries.times[C].stop){D.captionsText.html(B.entries.text[C]);
D.captions.show();
return 
}}D.captions.hide()
}else{D.captions.hide()
}},displayChapters:function(){var C=this,B;
for(B=0;
B<C.tracks.length;
B++){if(C.tracks[B].kind=="chapters"&&C.tracks[B].isLoaded){C.drawChapters(C.tracks[B]);
C.hasChapters=true;
break
}}},drawChapters:function(F){var C=this,B,D,E=0,G=0;
C.chapters.empty();
for(B=0;
B<F.entries.times.length;
B++){D=F.entries.times[B].stop-F.entries.times[B].start;
E=Math.floor(D/C.media.duration*100);
if(E+G>100||B==F.entries.times.length-1&&E+G<100){E=100-G
}C.chapters.append(A('<div class="mejs-chapter" rel="'+F.entries.times[B].start+'" style="left: '+G.toString()+"%;width: "+E.toString()+'%;"><div class="mejs-chapter-block'+((B==F.entries.times.length-1)?" mejs-chapter-block-last":"")+'"><span class="ch-title">'+F.entries.text[B]+'</span><span class="ch-time">'+mejs.Utility.secondsToTimeCode(F.entries.times[B].start)+"&ndash;"+mejs.Utility.secondsToTimeCode(F.entries.times[B].stop)+"</span></div></div>"));
G+=E
}C.chapters.find("div.mejs-chapter").click(function(){C.media.setCurrentTime(parseFloat(A(this).attr("rel")));
if(C.media.paused){C.media.play()
}});
C.chapters.show()
}});
mejs.language={codes:{af:"Afrikaans",sq:"Albanian",ar:"Arabic",be:"Belarusian",bg:"Bulgarian",ca:"Catalan",zh:"Chinese","zh-cn":"Chinese Simplified","zh-tw":"Chinese Traditional",hr:"Croatian",cs:"Czech",da:"Danish",nl:"Dutch",en:"English",et:"Estonian",tl:"Filipino",fi:"Finnish",fr:"French",gl:"Galician",de:"German",el:"Greek",ht:"Haitian Creole",iw:"Hebrew",hi:"Hindi",hu:"Hungarian",is:"Icelandic",id:"Indonesian",ga:"Irish",it:"Italian",ja:"Japanese",ko:"Korean",lv:"Latvian",lt:"Lithuanian",mk:"Macedonian",ms:"Malay",mt:"Maltese",no:"Norwegian",fa:"Persian",pl:"Polish",pt:"Portuguese",ro:"Romanian",ru:"Russian",sr:"Serbian",sk:"Slovak",sl:"Slovenian",es:"Spanish",sw:"Swahili",sv:"Swedish",tl:"Tagalog",th:"Thai",tr:"Turkish",uk:"Ukrainian",vi:"Vietnamese",cy:"Welsh",yi:"Yiddish"}};
mejs.TrackFormatParser={pattern_identifier:/^([a-zA-z]+-)?[0-9]+$/,pattern_timecode:/^([0-9]{2}:[0-9]{2}:[0-9]{2}([,.][0-9]{1,3})?) --\> ([0-9]{2}:[0-9]{2}:[0-9]{2}([,.][0-9]{3})?)(.*)$/,split2:function(C,B){return C.split(B)
},parse:function(G){var E=0,D=this.split2(G,/\r?\n/),C={text:[],times:[]},B,F;
for(;
E<D.length;
E++){if(this.pattern_identifier.exec(D[E])){E++;
B=this.pattern_timecode.exec(D[E]);
if(B&&E<D.length){E++;
F=D[E];
E++;
while(D[E]!==""&&E<D.length){F=F+"\n"+D[E];
E++
}C.text.push(F);
C.times.push({start:mejs.Utility.timeCodeToSeconds(B[1]),stop:mejs.Utility.timeCodeToSeconds(B[3]),settings:B[5]})
}}}return C
}};
if("x\n\ny".split(/\n/gi).length!=3){mejs.TrackFormatParser.split2=function(F,D){var E=[],B="",C;
for(C=0;
C<F.length;
C++){B+=F.substring(C,C+1);
if(D.test(B)){E.push(B.replace(D,""));
B=""
}}E.push(B);
return E
}
}})(mejs.$);
(function(A){A.extend(mejs.MepDefaults,contextMenuItems=[{render:function(B){if(typeof B.enterFullScreen=="undefined"){return null
}if(B.isFullScreen){return"Turn off Fullscreen"
}else{return"Go Fullscreen"
}},click:function(B){if(B.isFullScreen){B.exitFullScreen()
}else{B.enterFullScreen()
}}},{render:function(B){if(B.media.muted){return"Unmute"
}else{return"Mute"
}},click:function(B){if(B.media.muted){B.setMuted(false)
}else{B.setMuted(true)
}}},{isSeparator:true},{render:function(B){return"Download Video"
},click:function(B){window.location.href=B.media.currentSrc
}}]);
A.extend(MediaElementPlayer.prototype,{buildcontextmenu:function(C,B,E,D){C.contextMenu=A('<div class="mejs-contextmenu"></div>').appendTo(A("body")).hide();
C.container.bind("contextmenu",function(F){if(C.isContextMenuEnabled){F.preventDefault();
C.renderContextMenu(F.clientX-1,F.clientY-1);
return false
}});
C.container.bind("click",function(){C.contextMenu.hide()
});
C.contextMenu.bind("mouseleave",function(){C.startContextMenuTimer()
})
},isContextMenuEnabled:true,enableContextMenu:function(){this.isContextMenuEnabled=true
},disableContextMenu:function(){this.isContextMenuEnabled=false
},contextMenuTimeout:null,startContextMenuTimer:function(){var B=this;
B.killContextMenuTimer();
B.contextMenuTimer=setTimeout(function(){B.hideContextMenu();
B.killContextMenuTimer()
},750)
},killContextMenuTimer:function(){var B=this.contextMenuTimer;
if(B!=null){clearTimeout(B);
delete B;
B=null
}},hideContextMenu:function(){this.contextMenu.hide()
},renderContextMenu:function(B,I){var G=this,F="",D=G.options.contextMenuItems;
for(var E=0,C=D.length;
E<C;
E++){if(D[E].isSeparator){F+='<div class="mejs-contextmenu-separator"></div>'
}else{var H=D[E].render(G);
if(H!=null){F+='<div class="mejs-contextmenu-item" data-itemindex="'+E+'" id="element-'+(Math.random()*1000000)+'">'+H+"</div>"
}}}G.contextMenu.empty().append(A(F)).css({top:I,left:B}).show();
G.contextMenu.find(".mejs-contextmenu-item").each(function(){var J=A(this),K=parseInt(J.data("itemindex"),10),L=G.options.contextMenuItems[K];
if(typeof L.show!="undefined"){L.show(J,G)
}J.click(function(){if(typeof L.click!="undefined"){L.click(G)
}G.contextMenu.hide()
})
});
setTimeout(function(){G.killControlsTimer("rev3")
},100)
}})
})(mejs.$);
(function(A){A.fn.slides=function(B){return B=A.extend({},A.fn.slides.option,B),this.each(function(){function F(c,b,a){if(!M&&N){M=!0,B.animationStart(O+1);
switch(c){case"next":Q=O,R=O+1,R=X===R?0:R,K=W*2,c=-W*2,O=R;
break;
case"prev":Q=O,R=O-1,R=R===-1?X-1:R,K=0,c=0,O=R;
break;
case"pagination":R=parseInt(a,10),Q=A("."+B.paginationClass+" li."+B.currentClass+" a",Z).attr("href").match("[^#/]+$"),R>Q?(K=W*2,c=-W*2):(K=0,c=0),O=R
}b==="fade"?B.crossfade?Y.children(":eq("+R+")",Z).css({zIndex:10}).fadeIn(B.fadeSpeed,B.fadeEasing,function(){B.autoHeight?Y.animate({height:Y.children(":eq("+R+")",Z).outerHeight()},B.autoHeightSpeed,function(){Y.children(":eq("+Q+")",Z).css({display:"none",zIndex:0}),Y.children(":eq("+R+")",Z).css({zIndex:0}),B.animationComplete(R+1),M=!1
}):(Y.children(":eq("+Q+")",Z).css({display:"none",zIndex:0}),Y.children(":eq("+R+")",Z).css({zIndex:0}),B.animationComplete(R+1),M=!1)
}):Y.children(":eq("+Q+")",Z).fadeOut(B.fadeSpeed,B.fadeEasing,function(){B.autoHeight?Y.animate({height:Y.children(":eq("+R+")",Z).outerHeight()},B.autoHeightSpeed,function(){Y.children(":eq("+R+")",Z).fadeIn(B.fadeSpeed,B.fadeEasing)
}):Y.children(":eq("+R+")",Z).fadeIn(B.fadeSpeed,B.fadeEasing,function(){A.browser.msie&&A(this).get(0).style.removeAttribute("filter")
}),B.animationComplete(R+1),M=!1
}):(Y.children(":eq("+R+")").css({left:K,display:"block"}),B.autoHeight?Y.animate({left:c,height:Y.children(":eq("+R+")").outerHeight()},B.slideSpeed,B.slideEasing,function(){Y.css({left:-W}),Y.children(":eq("+R+")").css({left:W,zIndex:5}),Y.children(":eq("+Q+")").css({left:W,display:"none",zIndex:0}),B.animationComplete(R+1),M=!1
}):Y.animate({left:c},B.slideSpeed,B.slideEasing,function(){Y.css({left:-W}),Y.children(":eq("+R+")").css({left:W,zIndex:5}),Y.children(":eq("+Q+")").css({left:W,display:"none",zIndex:0}),B.animationComplete(R+1),M=!1
})),B.pagination&&(A("."+B.paginationClass+" li."+B.currentClass,Z).removeClass(B.currentClass),A("."+B.paginationClass+" li:eq("+R+")",Z).addClass(B.currentClass))
}}function E(){clearInterval(Z.data("interval"))
}function D(){B.pause?(clearTimeout(Z.data("pause")),clearInterval(Z.data("interval")),H=setTimeout(function(){clearTimeout(Z.data("pause")),G=setInterval(function(){F("next",T)
},B.play),Z.data("interval",G)
},B.pause),Z.data("pause",H)):E()
}A("."+B.container,A(this)).children().wrapAll('<div class="slides_control"/>');
var Z=A(this),Y=A(".slides_control",Z),X=Y.children().size(),W=Y.children().outerWidth(),V=Y.children().outerHeight(),U=B.start-1,T=B.effect.indexOf(",")<0?B.effect:B.effect.replace(" ","").split(",")[0],S=B.effect.indexOf(",")<0?T:B.effect.replace(" ","").split(",")[1],R=0,Q=0,P=0,O=0,N,M,L,K,J,I,H,G;
if(X<2){return A("."+B.container,A(this)).fadeIn(B.fadeSpeed,B.fadeEasing,function(){N=!0,B.slidesLoaded()
}),A("."+B.next+", ."+B.prev).fadeOut(0),!1
}if(X<2){return 
}U<0&&(U=0),U>X&&(U=X-1),B.start&&(O=U),B.randomize&&Y.randomize(),A("."+B.container,Z).css({overflow:"hidden",position:"relative"}),Y.children().css({position:"absolute",top:0,left:Y.children().outerWidth(),zIndex:0,display:"none"}),Y.css({position:"relative",width:W*3,height:V,left:-W}),A("."+B.container,Z).css({display:"block"}),B.autoHeight&&(Y.children().css({height:"auto"}),Y.animate({height:Y.children(":eq("+U+")").outerHeight()},B.autoHeightSpeed));
if(B.preload&&Y.find("img:eq("+U+")").length){A("."+B.container,Z).css({background:"url("+B.preloadImage+") no-repeat 50% 50%"});
var C=Y.find("img:eq("+U+")").attr("src")+"?"+(new Date).getTime();
A("img",Z).parent().attr("class")!="slides_control"?I=Y.children(":eq(0)")[0].tagName.toLowerCase():I=Y.find("img:eq("+U+")"),Y.find("img:eq("+U+")").attr("src",C).load(function(){Y.find(I+":eq("+U+")").fadeIn(B.fadeSpeed,B.fadeEasing,function(){A(this).css({zIndex:5}),A("."+B.container,Z).css({background:""}),N=!0,B.slidesLoaded()
})
})
}else{Y.children(":eq("+U+")").fadeIn(B.fadeSpeed,B.fadeEasing,function(){N=!0,B.slidesLoaded()
})
}B.bigTarget&&(Y.children().css({cursor:"pointer"}),Y.children().click(function(){return F("next",T),!1
})),B.hoverPause&&B.play&&(Y.bind("mouseover",function(){E()
}),Y.bind("mouseleave",function(){D()
})),B.generateNextPrev&&(A("."+B.container,Z).after('<a href="#" class="'+B.prev+'">Prev</a>'),A("."+B.prev,Z).after('<a href="#" class="'+B.next+'">Next</a>')),A("."+B.next,Z).click(function(b){b.preventDefault(),B.play&&D(),F("next",T)
}),A("."+B.prev,Z).click(function(b){b.preventDefault(),B.play&&D(),F("prev",T)
}),B.generatePagination?(B.prependPagination?Z.prepend("<ul class="+B.paginationClass+"></ul>"):Z.append("<ul class="+B.paginationClass+"></ul>"),Y.children().each(function(){A("."+B.paginationClass,Z).append('<li><a href="#'+P+'">'+(P+1)+"</a></li>"),P++
})):A("."+B.paginationClass+" li a",Z).each(function(){A(this).attr("href","#"+P),P++
}),A("."+B.paginationClass+" li:eq("+U+")",Z).addClass(B.currentClass),A("."+B.paginationClass+" li a",Z).click(function(){return B.play&&D(),L=A(this).attr("href").match("[^#/]+$"),O!=L&&F("pagination",S,L),!1
}),A("a.link",Z).click(function(){return B.play&&D(),L=A(this).attr("href").match("[^#/]+$")-1,O!=L&&F("pagination",S,L),!1
}),B.play&&(G=setInterval(function(){F("next",T)
},B.play),Z.data("interval",G))
})
},A.fn.slides.option={preload:!1,preloadImage:"/img/loading.gif",container:"slides_container",generateNextPrev:!1,next:"next",prev:"prev",pagination:!0,generatePagination:!0,prependPagination:!1,paginationClass:"pagination",currentClass:"current",fadeSpeed:350,fadeEasing:"",slideSpeed:350,slideEasing:"",start:1,effect:"slide",crossfade:!1,randomize:!1,play:0,pause:0,hoverPause:!1,autoHeight:!1,autoHeightSpeed:350,bigTarget:!1,animationStart:function(){},animationComplete:function(){},slidesLoaded:function(){}},A.fn.randomize=function(B){function C(){return Math.round(Math.random())-0.5
}return A(this).each(function(){var G=A(this),F=G.children(),E=F.length;
if(E>1){F.hide();
var D=[];
for(i=0;
i<E;
i++){D[D.length]=i
}D=D.sort(C),A.each(D,function(H,K){var J=F.eq(K),I=J.clone(!0);
I.show().appendTo(G),B!==undefined&&B(J,I),J.remove()
})
}})
}
})(jQuery);
var swfobject=function(){var AQ="undefined",Ac="object",AB="Shockwave Flash",X="ShockwaveFlash.ShockwaveFlash",Ad="application/x-shockwave-flash",AC="SWFObjectExprInst",AW="onreadystatechange",AF=window,Ak=document,Aa=navigator,AA=false,Z=[Am],Af=[],AG=[],AL=[],Ai,AD,AP,AS,AK=false,At=false,Ag,AN,Ah=true,AH=function(){var A=typeof Ak.getElementById!=AQ&&typeof Ak.getElementsByTagName!=AQ&&typeof Ak.createElement!=AQ,E=Aa.userAgent.toLowerCase(),C=Aa.platform.toLowerCase(),H=C?/win/.test(C):/win/.test(E),J=C?/mac/.test(C):/mac/.test(E),G=/webkit/.test(E)?parseFloat(E.replace(/^.*webkit\/(\d+(\.\d+)?).*$/,"$1")):false,D=!+"\v1",F=[0,0,0],K=null;
if(typeof Aa.plugins!=AQ&&typeof Aa.plugins[AB]==Ac){K=Aa.plugins[AB].description;
if(K&&!(typeof Aa.mimeTypes!=AQ&&Aa.mimeTypes[Ad]&&!Aa.mimeTypes[Ad].enabledPlugin)){AA=true;
D=false;
K=K.replace(/^.*\s+(\S+\s+\S+$)/,"$1");
F[0]=parseInt(K.replace(/^(.*)\..*$/,"$1"),10);
F[1]=parseInt(K.replace(/^.*\.(.*)\s.*$/,"$1"),10);
F[2]=/[a-zA-Z]/.test(K)?parseInt(K.replace(/^.*[a-zA-Z]+(.*)$/,"$1"),10):0
}}else{if(typeof AF.ActiveXObject!=AQ){try{var I=new ActiveXObject(X);
if(I){K=I.GetVariable("$version");
if(K){D=true;
K=K.split(" ")[1].split(",");
F=[parseInt(K[0],10),parseInt(K[1],10),parseInt(K[2],10)]
}}}catch(B){}}}return{w3:A,pv:F,wk:G,ie:D,win:H,mac:J}
}(),Aj=function(){if(!AH.w3){return 
}if((typeof Ak.readyState!=AQ&&Ak.readyState=="complete")||(typeof Ak.readyState==AQ&&(Ak.getElementsByTagName("body")[0]||Ak.body))){Ao()
}if(!AK){if(typeof Ak.addEventListener!=AQ){Ak.addEventListener("DOMContentLoaded",Ao,false)
}if(AH.ie&&AH.win){Ak.attachEvent(AW,function(){if(Ak.readyState=="complete"){Ak.detachEvent(AW,arguments.callee);
Ao()
}});
if(AF==top){(function(){if(AK){return 
}try{Ak.documentElement.doScroll("left")
}catch(A){setTimeout(arguments.callee,0);
return 
}Ao()
})()
}}if(AH.wk){(function(){if(AK){return 
}if(!/loaded|complete/.test(Ak.readyState)){setTimeout(arguments.callee,0);
return 
}Ao()
})()
}Ab(Ao)
}}();
function Ao(){if(AK){return 
}try{var B=Ak.getElementsByTagName("body")[0].appendChild(AR("span"));
B.parentNode.removeChild(B)
}catch(A){return 
}AK=true;
var D=Z.length;
for(var C=0;
C<D;
C++){Z[C]()
}}function AJ(A){if(AK){A()
}else{Z[Z.length]=A
}}function Ab(A){if(typeof AF.addEventListener!=AQ){AF.addEventListener("load",A,false)
}else{if(typeof Ak.addEventListener!=AQ){Ak.addEventListener("load",A,false)
}else{if(typeof AF.attachEvent!=AQ){Al(AF,"onload",A)
}else{if(typeof AF.onload=="function"){var B=AF.onload;
AF.onload=function(){B();
A()
}
}else{AF.onload=A
}}}}}function Am(){if(AA){Y()
}else{AM()
}}function Y(){var D=Ak.getElementsByTagName("body")[0];
var B=AR(Ac);
B.setAttribute("type",Ad);
var A=D.appendChild(B);
if(A){var C=0;
(function(){if(typeof A.GetVariable!=AQ){var E=A.GetVariable("$version");
if(E){E=E.split(" ")[1].split(",");
AH.pv=[parseInt(E[0],10),parseInt(E[1],10),parseInt(E[2],10)]
}}else{if(C<10){C++;
setTimeout(arguments.callee,10);
return 
}}D.removeChild(B);
A=null;
AM()
})()
}else{AM()
}}function AM(){var G=Af.length;
if(G>0){for(var H=0;
H<G;
H++){var C=Af[H].id;
var L=Af[H].callbackFn;
var A={success:false,id:C};
if(AH.pv[0]>0){var I=Ar(C);
if(I){if(AO(Af[H].swfVersion)&&!(AH.wk&&AH.wk<312)){AX(C,true);
if(L){A.success=true;
A.ref=AU(C);
L(A)
}}else{if(Af[H].expressInstall&&AT()){var E={};
E.data=Af[H].expressInstall;
E.width=I.getAttribute("width")||"0";
E.height=I.getAttribute("height")||"0";
if(I.getAttribute("class")){E.styleclass=I.getAttribute("class")
}if(I.getAttribute("align")){E.align=I.getAttribute("align")
}var F={};
var D=I.getElementsByTagName("param");
var K=D.length;
for(var J=0;
J<K;
J++){if(D[J].getAttribute("name").toLowerCase()!="movie"){F[D[J].getAttribute("name")]=D[J].getAttribute("value")
}}AE(E,F,C,L)
}else{Ae(I);
if(L){L(A)
}}}}}else{AX(C,true);
if(L){var B=AU(C);
if(B&&typeof B.SetVariable!=AQ){A.success=true;
A.ref=B
}L(A)
}}}}}function AU(B){var D=null;
var C=Ar(B);
if(C&&C.nodeName=="OBJECT"){if(typeof C.SetVariable!=AQ){D=C
}else{var A=C.getElementsByTagName(Ac)[0];
if(A){D=A
}}}return D
}function AT(){return !At&&AO("6.0.65")&&(AH.win||AH.mac)&&!(AH.wk&&AH.wk<312)
}function AE(F,D,H,E){At=true;
AP=E||null;
AS={success:false,id:H};
var A=Ar(H);
if(A){if(A.nodeName=="OBJECT"){Ai=An(A);
AD=null
}else{Ai=A;
AD=H
}F.id=AC;
if(typeof F.width==AQ||(!/%$/.test(F.width)&&parseInt(F.width,10)<310)){F.width="310"
}if(typeof F.height==AQ||(!/%$/.test(F.height)&&parseInt(F.height,10)<137)){F.height="137"
}Ak.title=Ak.title.slice(0,47)+" - Flash Player Installation";
var B=AH.ie&&AH.win?"ActiveX":"PlugIn",C="MMredirectURL="+AF.location.toString().replace(/&/g,"%26")+"&MMplayerType="+B+"&MMdoctitle="+Ak.title;
if(typeof D.flashvars!=AQ){D.flashvars+="&"+C
}else{D.flashvars=C
}if(AH.ie&&AH.win&&A.readyState!=4){var G=AR("div");
H+="SWFObjectNew";
G.setAttribute("id",H);
A.parentNode.insertBefore(G,A);
A.style.display="none";
(function(){if(A.readyState==4){A.parentNode.removeChild(A)
}else{setTimeout(arguments.callee,10)
}})()
}AZ(F,D,H)
}}function Ae(A){if(AH.ie&&AH.win&&A.readyState!=4){var B=AR("div");
A.parentNode.insertBefore(B,A);
B.parentNode.replaceChild(An(A),B);
A.style.display="none";
(function(){if(A.readyState==4){A.parentNode.removeChild(A)
}else{setTimeout(arguments.callee,10)
}})()
}else{A.parentNode.replaceChild(An(A),A)
}}function An(B){var D=AR("div");
if(AH.win&&AH.ie){D.innerHTML=B.innerHTML
}else{var E=B.getElementsByTagName(Ac)[0];
if(E){var A=E.childNodes;
if(A){var F=A.length;
for(var C=0;
C<F;
C++){if(!(A[C].nodeType==1&&A[C].nodeName=="PARAM")&&!(A[C].nodeType==8)){D.appendChild(A[C].cloneNode(true))
}}}}}return D
}function AZ(E,G,C){var D,A=Ar(C);
if(AH.wk&&AH.wk<312){return D
}if(A){if(typeof E.id==AQ){E.id=C
}if(AH.ie&&AH.win){var F="";
for(var I in E){if(E[I]!=Object.prototype[I]){if(I.toLowerCase()=="data"){G.movie=E[I]
}else{if(I.toLowerCase()=="styleclass"){F+=' class="'+E[I]+'"'
}else{if(I.toLowerCase()!="classid"){F+=" "+I+'="'+E[I]+'"'
}}}}}var H="";
for(var J in G){if(G[J]!=Object.prototype[J]){H+='<param name="'+J+'" value="'+G[J]+'" />'
}}A.outerHTML='<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"'+F+">"+H+"</object>";
AG[AG.length]=E.id;
D=Ar(E.id)
}else{var B=AR(Ac);
B.setAttribute("type",Ad);
for(var K in E){if(E[K]!=Object.prototype[K]){if(K.toLowerCase()=="styleclass"){B.setAttribute("class",E[K])
}else{if(K.toLowerCase()!="classid"){B.setAttribute(K,E[K])
}}}}for(var L in G){if(G[L]!=Object.prototype[L]&&L.toLowerCase()!="movie"){Ap(B,L,G[L])
}}A.parentNode.replaceChild(B,A);
D=B
}}return D
}function Ap(B,D,C){var A=AR("param");
A.setAttribute("name",D);
A.setAttribute("value",C);
B.appendChild(A)
}function AV(A){var B=Ar(A);
if(B&&B.nodeName=="OBJECT"){if(AH.ie&&AH.win){B.style.display="none";
(function(){if(B.readyState==4){As(A)
}else{setTimeout(arguments.callee,10)
}})()
}else{B.parentNode.removeChild(B)
}}}function As(A){var B=Ar(A);
if(B){for(var C in B){if(typeof B[C]=="function"){B[C]=null
}}B.parentNode.removeChild(B)
}}function Ar(A){var C=null;
try{C=Ak.getElementById(A)
}catch(B){}return C
}function AR(A){return Ak.createElement(A)
}function Al(A,C,B){A.attachEvent(C,B);
AL[AL.length]=[A,C,B]
}function AO(A){var B=AH.pv,C=A.split(".");
C[0]=parseInt(C[0],10);
C[1]=parseInt(C[1],10)||0;
C[2]=parseInt(C[2],10)||0;
return(B[0]>C[0]||(B[0]==C[0]&&B[1]>C[1])||(B[0]==C[0]&&B[1]==C[1]&&B[2]>=C[2]))?true:false
}function AY(B,F,A,C){if(AH.ie&&AH.mac){return 
}var E=Ak.getElementsByTagName("head")[0];
if(!E){return 
}var G=(A&&typeof A=="string")?A:"screen";
if(C){Ag=null;
AN=null
}if(!Ag||AN!=G){var D=AR("style");
D.setAttribute("type","text/css");
D.setAttribute("media",G);
Ag=E.appendChild(D);
if(AH.ie&&AH.win&&typeof Ak.styleSheets!=AQ&&Ak.styleSheets.length>0){Ag=Ak.styleSheets[Ak.styleSheets.length-1]
}AN=G
}if(AH.ie&&AH.win){if(Ag&&typeof Ag.addRule==Ac){Ag.addRule(B,F)
}}else{if(Ag&&typeof Ak.createTextNode!=AQ){Ag.appendChild(Ak.createTextNode(B+" {"+F+"}"))
}}}function AX(A,C){if(!Ah){return 
}var B=C?"visible":"hidden";
if(AK&&Ar(A)){Ar(A).style.visibility=B
}else{AY("#"+A,"visibility:"+B)
}}function AI(B){var A=/[\\\"<>\.;]/;
var C=A.exec(B)!=null;
return C&&typeof encodeURIComponent!=AQ?encodeURIComponent(B):B
}var Aq=function(){if(AH.ie&&AH.win){window.attachEvent("onunload",function(){var A=AL.length;
for(var B=0;
B<A;
B++){AL[B][0].detachEvent(AL[B][1],AL[B][2])
}var D=AG.length;
for(var C=0;
C<D;
C++){AV(AG[C])
}for(var E in AH){AH[E]=null
}AH=null;
for(var F in swfobject){swfobject[F]=null
}swfobject=null
})
}}();
return{registerObject:function(A,E,C,B){if(AH.w3&&A&&E){var D={};
D.id=A;
D.swfVersion=E;
D.expressInstall=C;
D.callbackFn=B;
Af[Af.length]=D;
AX(A,false)
}else{if(B){B({success:false,id:A})
}}},getObjectById:function(A){if(AH.w3){return AU(A)
}},embedSWF:function(K,E,H,F,C,A,B,I,G,J){var D={success:false,id:E};
if(AH.w3&&!(AH.wk&&AH.wk<312)&&K&&E&&H&&F&&C){AX(E,false);
AJ(function(){H+="";
F+="";
var Q={};
if(G&&typeof G===Ac){for(var O in G){Q[O]=G[O]
}}Q.data=K;
Q.width=H;
Q.height=F;
var N={};
if(I&&typeof I===Ac){for(var P in I){N[P]=I[P]
}}if(B&&typeof B===Ac){for(var L in B){if(typeof N.flashvars!=AQ){N.flashvars+="&"+L+"="+B[L]
}else{N.flashvars=L+"="+B[L]
}}}if(AO(C)){var M=AZ(Q,N,E);
if(Q.id==E){AX(E,true)
}D.success=true;
D.ref=M
}else{if(A&&AT()){Q.data=A;
AE(Q,N,E,J);
return 
}else{AX(E,true)
}}if(J){J(D)
}})
}else{if(J){J(D)
}}},switchOffAutoHideShow:function(){Ah=false
},ua:AH,getFlashPlayerVersion:function(){return{major:AH.pv[0],minor:AH.pv[1],release:AH.pv[2]}
},hasFlashPlayerVersion:AO,createSWF:function(A,B,C){if(AH.w3){return AZ(A,B,C)
}else{return undefined
}},showExpressInstall:function(B,A,D,C){if(AH.w3&&AT()){AE(B,A,D,C)
}},removeSWF:function(A){if(AH.w3){AV(A)
}},createCSS:function(B,A,C,D){if(AH.w3){AY(B,A,C,D)
}},addDomLoadEvent:AJ,addLoadEvent:Ab,getQueryParamValue:function(B){var A=Ak.location.search||Ak.location.hash;
if(A){if(/\?/.test(A)){A=A.split("?")[1]
}if(B==null){return AI(A)
}var C=A.split("&");
for(var D=0;
D<C.length;
D++){if(C[D].substring(0,C[D].indexOf("="))==B){return AI(C[D].substring((C[D].indexOf("=")+1)))
}}}return""
},expressInstallCallback:function(){if(At){var A=Ar(AC);
if(A&&Ai){A.parentNode.replaceChild(Ai,A);
if(AD){AX(AD,true);
if(AH.ie&&AH.win){Ai.style.display="block"
}}if(AP){AP(AS)
}}At=false
}}}
}();
(function($){$.extend({metadata:{defaults:{type:"class",name:"metadata",cre:/({.*})/,single:"metadata"},setType:function(type,name){this.defaults.type=type;
this.defaults.name=name
},get:function(elem,opts){var settings=$.extend({},this.defaults,opts);
if(!settings.single.length){settings.single="metadata"
}var data=$.data(elem,settings.single);
if(data){return data
}data="{}";
if(settings.type=="class"){var m=settings.cre.exec(elem.className);
if(m){data=m[1]
}}else{if(settings.type=="elem"){if(!elem.getElementsByTagName){return undefined
}var e=elem.getElementsByTagName(settings.name);
if(e.length){data=$.trim(e[0].innerHTML)
}}else{if(elem.getAttribute!=undefined){var attr=elem.getAttribute(settings.name);
if(attr){data=attr
}}}}if(data.indexOf("{")<0){data="{"+data+"}"
}data=eval("("+data+")");
$.data(elem,settings.single,data);
return data
}}});
$.fn.metadata=function(opts){return $.metadata.get(this[0],opts)
}
})(jQuery);
/* jQuery UI - v1.10.0 - 2013-01-29
* http://jqueryui.com
* Includes: jquery.ui.core.js, jquery.ui.widget.js, jquery.ui.mouse.js, jquery.ui.slider.js
* Copyright (c) 2013 jQuery Foundation and other contributors Licensed MIT */
(function(B,F){var A=0,E=/^ui-id-\d+$/;
B.ui=B.ui||{};
if(B.ui.version){return 
}B.extend(B.ui,{version:"1.10.0",keyCode:{BACKSPACE:8,COMMA:188,DELETE:46,DOWN:40,END:35,ENTER:13,ESCAPE:27,HOME:36,LEFT:37,NUMPAD_ADD:107,NUMPAD_DECIMAL:110,NUMPAD_DIVIDE:111,NUMPAD_ENTER:108,NUMPAD_MULTIPLY:106,NUMPAD_SUBTRACT:109,PAGE_DOWN:34,PAGE_UP:33,PERIOD:190,RIGHT:39,SPACE:32,TAB:9,UP:38}});
B.fn.extend({_focus:B.fn.focus,focus:function(G,H){return typeof G==="number"?this.each(function(){var I=this;
setTimeout(function(){B(I).focus();
if(H){H.call(I)
}},G)
}):this._focus.apply(this,arguments)
},scrollParent:function(){var G;
if((B.ui.ie&&(/(static|relative)/).test(this.css("position")))||(/absolute/).test(this.css("position"))){G=this.parents().filter(function(){return(/(relative|absolute|fixed)/).test(B.css(this,"position"))&&(/(auto|scroll)/).test(B.css(this,"overflow")+B.css(this,"overflow-y")+B.css(this,"overflow-x"))
}).eq(0)
}else{G=this.parents().filter(function(){return(/(auto|scroll)/).test(B.css(this,"overflow")+B.css(this,"overflow-y")+B.css(this,"overflow-x"))
}).eq(0)
}return(/fixed/).test(this.css("position"))||!G.length?B(document):G
},zIndex:function(J){if(J!==F){return this.css("zIndex",J)
}if(this.length){var H=B(this[0]),G,I;
while(H.length&&H[0]!==document){G=H.css("position");
if(G==="absolute"||G==="relative"||G==="fixed"){I=parseInt(H.css("zIndex"),10);
if(!isNaN(I)&&I!==0){return I
}}H=H.parent()
}}return 0
},uniqueId:function(){return this.each(function(){if(!this.id){this.id="ui-id-"+(++A)
}})
},removeUniqueId:function(){return this.each(function(){if(E.test(this.id)){B(this).removeAttr("id")
}})
}});
function D(I,G){var K,J,H,L=I.nodeName.toLowerCase();
if("area"===L){K=I.parentNode;
J=K.name;
if(!I.href||!J||K.nodeName.toLowerCase()!=="map"){return false
}H=B("img[usemap=#"+J+"]")[0];
return !!H&&C(H)
}return(/input|select|textarea|button|object/.test(L)?!I.disabled:"a"===L?I.href||G:G)&&C(I)
}function C(G){return B.expr.filters.visible(G)&&!B(G).parents().addBack().filter(function(){return B.css(this,"visibility")==="hidden"
}).length
}B.extend(B.expr[":"],{data:B.expr.createPseudo?B.expr.createPseudo(function(G){return function(H){return !!B.data(H,G)
}
}):function(I,H,G){return !!B.data(I,G[3])
},focusable:function(G){return D(G,!isNaN(B.attr(G,"tabindex")))
},tabbable:function(I){var G=B.attr(I,"tabindex"),H=isNaN(G);
return(H||G>=0)&&D(I,!H)
}});
if(!B("<a>").outerWidth(1).jquery){B.each(["Width","Height"],function(I,G){var H=G==="Width"?["Left","Right"]:["Top","Bottom"],J=G.toLowerCase(),L={innerWidth:B.fn.innerWidth,innerHeight:B.fn.innerHeight,outerWidth:B.fn.outerWidth,outerHeight:B.fn.outerHeight};
function K(O,N,M,P){B.each(H,function(){N-=parseFloat(B.css(O,"padding"+this))||0;
if(M){N-=parseFloat(B.css(O,"border"+this+"Width"))||0
}if(P){N-=parseFloat(B.css(O,"margin"+this))||0
}});
return N
}B.fn["inner"+G]=function(M){if(M===F){return L["inner"+G].call(this)
}return this.each(function(){B(this).css(J,K(this,M)+"px")
})
};
B.fn["outer"+G]=function(M,N){if(typeof M!=="number"){return L["outer"+G].call(this,M)
}return this.each(function(){B(this).css(J,K(this,M,true,N)+"px")
})
}
})
}if(!B.fn.addBack){B.fn.addBack=function(G){return this.add(G==null?this.prevObject:this.prevObject.filter(G))
}
}if(B("<a>").data("a-b","a").removeData("a-b").data("a-b")){B.fn.removeData=(function(G){return function(H){if(arguments.length){return G.call(this,B.camelCase(H))
}else{return G.call(this)
}}
})(B.fn.removeData)
}B.ui.ie=!!/msie [\w.]+/.exec(navigator.userAgent.toLowerCase());
B.support.selectstart="onselectstart" in document.createElement("div");
B.fn.extend({disableSelection:function(){return this.bind((B.support.selectstart?"selectstart":"mousedown")+".ui-disableSelection",function(G){G.preventDefault()
})
},enableSelection:function(){return this.unbind(".ui-disableSelection")
}});
B.extend(B.ui,{plugin:{add:function(H,I,K){var G,J=B.ui[H].prototype;
for(G in K){J.plugins[G]=J.plugins[G]||[];
J.plugins[G].push([I,K[G]])
}},call:function(G,I,H){var J,K=G.plugins[I];
if(!K||!G.element[0].parentNode||G.element[0].parentNode.nodeType===11){return 
}for(J=0;
J<K.length;
J++){if(G.options[K[J][0]]){K[J][1].apply(G.element,H)
}}}},hasScroll:function(J,H){if(B(J).css("overflow")==="hidden"){return false
}var G=(H&&H==="left")?"scrollLeft":"scrollTop",I=false;
if(J[G]>0){return true
}J[G]=1;
I=(J[G]>0);
J[G]=0;
return I
}})
})(jQuery);
(function(B,E){var A=0,D=Array.prototype.slice,C=B.cleanData;
B.cleanData=function(F){for(var G=0,H;
(H=F[G])!=null;
G++){try{B(H).triggerHandler("remove")
}catch(I){}}C(F)
};
B.widget=function(F,G,N){var K,L,I,M,H={},J=F.split(".")[0];
F=F.split(".")[1];
K=J+"-"+F;
if(!N){N=G;
G=B.Widget
}B.expr[":"][K.toLowerCase()]=function(O){return !!B.data(O,K)
};
B[J]=B[J]||{};
L=B[J][F];
I=B[J][F]=function(O,P){if(!this._createWidget){return new I(O,P)
}if(arguments.length){this._createWidget(O,P)
}};
B.extend(I,L,{version:N.version,_proto:B.extend({},N),_childConstructors:[]});
M=new G();
M.options=B.widget.extend({},M.options);
B.each(N,function(P,O){if(!B.isFunction(O)){H[P]=O;
return 
}H[P]=(function(){var Q=function(){return G.prototype[P].apply(this,arguments)
},R=function(S){return G.prototype[P].apply(this,S)
};
return function(){var U=this._super,S=this._superApply,T;
this._super=Q;
this._superApply=R;
T=O.apply(this,arguments);
this._super=U;
this._superApply=S;
return T
}
})()
});
I.prototype=B.widget.extend(M,{widgetEventPrefix:L?M.widgetEventPrefix:F},H,{constructor:I,namespace:J,widgetName:F,widgetFullName:K});
if(L){B.each(L._childConstructors,function(P,Q){var O=Q.prototype;
B.widget(O.namespace+"."+O.widgetName,I,Q._proto)
});
delete L._childConstructors
}else{G._childConstructors.push(I)
}B.widget.bridge(F,I)
};
B.widget.extend=function(K){var G=D.call(arguments,1),J=0,F=G.length,H,I;
for(;
J<F;
J++){for(H in G[J]){I=G[J][H];
if(G[J].hasOwnProperty(H)&&I!==E){if(B.isPlainObject(I)){K[H]=B.isPlainObject(K[H])?B.widget.extend({},K[H],I):B.widget.extend({},I)
}else{K[H]=I
}}}}return K
};
B.widget.bridge=function(G,F){var H=F.prototype.widgetFullName||G;
B.fn[G]=function(K){var I=typeof K==="string",J=D.call(arguments,1),L=this;
K=!I&&J.length?B.widget.extend.apply(null,[K].concat(J)):K;
if(I){this.each(function(){var N,M=B.data(this,H);
if(!M){return B.error("cannot call methods on "+G+" prior to initialization; attempted to call method '"+K+"'")
}if(!B.isFunction(M[K])||K.charAt(0)==="_"){return B.error("no such method '"+K+"' for "+G+" widget instance")
}N=M[K].apply(M,J);
if(N!==M&&N!==E){L=N&&N.jquery?L.pushStack(N.get()):N;
return false
}})
}else{this.each(function(){var M=B.data(this,H);
if(M){M.option(K||{})._init()
}else{B.data(this,H,new F(K,this))
}})
}return L
}
};
B.Widget=function(){};
B.Widget._childConstructors=[];
B.Widget.prototype={widgetName:"widget",widgetEventPrefix:"",defaultElement:"<div>",options:{disabled:false,create:null},_createWidget:function(F,G){G=B(G||this.defaultElement||this)[0];
this.element=B(G);
this.uuid=A++;
this.eventNamespace="."+this.widgetName+this.uuid;
this.options=B.widget.extend({},this.options,this._getCreateOptions(),F);
this.bindings=B();
this.hoverable=B();
this.focusable=B();
if(G!==this){B.data(G,this.widgetFullName,this);
this._on(true,this.element,{remove:function(H){if(H.target===G){this.destroy()
}}});
this.document=B(G.style?G.ownerDocument:G.document||G);
this.window=B(this.document[0].defaultView||this.document[0].parentWindow)
}this._create();
this._trigger("create",null,this._getCreateEventData());
this._init()
},_getCreateOptions:B.noop,_getCreateEventData:B.noop,_create:B.noop,_init:B.noop,destroy:function(){this._destroy();
this.element.unbind(this.eventNamespace).removeData(this.widgetName).removeData(this.widgetFullName).removeData(B.camelCase(this.widgetFullName));
this.widget().unbind(this.eventNamespace).removeAttr("aria-disabled").removeClass(this.widgetFullName+"-disabled ui-state-disabled");
this.bindings.unbind(this.eventNamespace);
this.hoverable.removeClass("ui-state-hover");
this.focusable.removeClass("ui-state-focus")
},_destroy:B.noop,widget:function(){return this.element
},option:function(I,J){var F=I,K,H,G;
if(arguments.length===0){return B.widget.extend({},this.options)
}if(typeof I==="string"){F={};
K=I.split(".");
I=K.shift();
if(K.length){H=F[I]=B.widget.extend({},this.options[I]);
for(G=0;
G<K.length-1;
G++){H[K[G]]=H[K[G]]||{};
H=H[K[G]]
}I=K.pop();
if(J===E){return H[I]===E?null:H[I]
}H[I]=J
}else{if(J===E){return this.options[I]===E?null:this.options[I]
}F[I]=J
}}this._setOptions(F);
return this
},_setOptions:function(F){var G;
for(G in F){this._setOption(G,F[G])
}return this
},_setOption:function(F,G){this.options[F]=G;
if(F==="disabled"){this.widget().toggleClass(this.widgetFullName+"-disabled ui-state-disabled",!!G).attr("aria-disabled",G);
this.hoverable.removeClass("ui-state-hover");
this.focusable.removeClass("ui-state-focus")
}return this
},enable:function(){return this._setOption("disabled",false)
},disable:function(){return this._setOption("disabled",true)
},_on:function(I,H,G){var J,F=this;
if(typeof I!=="boolean"){G=H;
H=I;
I=false
}if(!G){G=H;
H=this.element;
J=this.widget()
}else{H=J=B(H);
this.bindings=this.bindings.add(H)
}B.each(G,function(P,O){function M(){if(!I&&(F.options.disabled===true||B(this).hasClass("ui-state-disabled"))){return 
}return(typeof O==="string"?F[O]:O).apply(F,arguments)
}if(typeof O!=="string"){M.guid=O.guid=O.guid||M.guid||B.guid++
}var N=P.match(/^(\w+)\s*(.*)$/),L=N[1]+F.eventNamespace,K=N[2];
if(K){J.delegate(K,L,M)
}else{H.bind(L,M)
}})
},_off:function(G,F){F=(F||"").split(" ").join(this.eventNamespace+" ")+this.eventNamespace;
G.unbind(F).undelegate(F)
},_delay:function(I,H){function G(){return(typeof I==="string"?F[I]:I).apply(F,arguments)
}var F=this;
return setTimeout(G,H||0)
},_hoverable:function(F){this.hoverable=this.hoverable.add(F);
this._on(F,{mouseenter:function(G){B(G.currentTarget).addClass("ui-state-hover")
},mouseleave:function(G){B(G.currentTarget).removeClass("ui-state-hover")
}})
},_focusable:function(F){this.focusable=this.focusable.add(F);
this._on(F,{focusin:function(G){B(G.currentTarget).addClass("ui-state-focus")
},focusout:function(G){B(G.currentTarget).removeClass("ui-state-focus")
}})
},_trigger:function(F,G,H){var K,J,I=this.options[F];
H=H||{};
G=B.Event(G);
G.type=(F===this.widgetEventPrefix?F:this.widgetEventPrefix+F).toLowerCase();
G.target=this.element[0];
J=G.originalEvent;
if(J){for(K in J){if(!(K in G)){G[K]=J[K]
}}}this.element.trigger(G,H);
return !(B.isFunction(I)&&I.apply(this.element[0],[G].concat(H))===false||G.isDefaultPrevented())
}};
B.each({show:"fadeIn",hide:"fadeOut"},function(G,F){B.Widget.prototype["_"+G]=function(J,I,L){if(typeof I==="string"){I={effect:I}
}var K,H=!I?G:I===true||typeof I==="number"?F:I.effect||F;
I=I||{};
if(typeof I==="number"){I={duration:I}
}K=!B.isEmptyObject(I);
I.complete=L;
if(I.delay){J.delay(I.delay)
}if(K&&B.effects&&B.effects.effect[H]){J[G](I)
}else{if(H!==G&&J[H]){J[H](I.duration,I.easing,L)
}else{J.queue(function(M){B(this)[G]();
if(L){L.call(J[0])
}M()
})
}}}
})
})(jQuery);
(function(B,C){var A=false;
B(document).mouseup(function(){A=false
});
B.widget("ui.mouse",{version:"1.10.0",options:{cancel:"input,textarea,button,select,option",distance:1,delay:0},_mouseInit:function(){var D=this;
this.element.bind("mousedown."+this.widgetName,function(E){return D._mouseDown(E)
}).bind("click."+this.widgetName,function(E){if(true===B.data(E.target,D.widgetName+".preventClickEvent")){B.removeData(E.target,D.widgetName+".preventClickEvent");
E.stopImmediatePropagation();
return false
}});
this.started=false
},_mouseDestroy:function(){this.element.unbind("."+this.widgetName);
if(this._mouseMoveDelegate){B(document).unbind("mousemove."+this.widgetName,this._mouseMoveDelegate).unbind("mouseup."+this.widgetName,this._mouseUpDelegate)
}},_mouseDown:function(F){if(A){return 
}(this._mouseStarted&&this._mouseUp(F));
this._mouseDownEvent=F;
var E=this,G=(F.which===1),D=(typeof this.options.cancel==="string"&&F.target.nodeName?B(F.target).closest(this.options.cancel).length:false);
if(!G||D||!this._mouseCapture(F)){return true
}this.mouseDelayMet=!this.options.delay;
if(!this.mouseDelayMet){this._mouseDelayTimer=setTimeout(function(){E.mouseDelayMet=true
},this.options.delay)
}if(this._mouseDistanceMet(F)&&this._mouseDelayMet(F)){this._mouseStarted=(this._mouseStart(F)!==false);
if(!this._mouseStarted){F.preventDefault();
return true
}}if(true===B.data(F.target,this.widgetName+".preventClickEvent")){B.removeData(F.target,this.widgetName+".preventClickEvent")
}this._mouseMoveDelegate=function(H){return E._mouseMove(H)
};
this._mouseUpDelegate=function(H){return E._mouseUp(H)
};
B(document).bind("mousemove."+this.widgetName,this._mouseMoveDelegate).bind("mouseup."+this.widgetName,this._mouseUpDelegate);
F.preventDefault();
A=true;
return true
},_mouseMove:function(D){if(B.ui.ie&&(!document.documentMode||document.documentMode<9)&&!D.button){return this._mouseUp(D)
}if(this._mouseStarted){this._mouseDrag(D);
return D.preventDefault()
}if(this._mouseDistanceMet(D)&&this._mouseDelayMet(D)){this._mouseStarted=(this._mouseStart(this._mouseDownEvent,D)!==false);
(this._mouseStarted?this._mouseDrag(D):this._mouseUp(D))
}return !this._mouseStarted
},_mouseUp:function(D){B(document).unbind("mousemove."+this.widgetName,this._mouseMoveDelegate).unbind("mouseup."+this.widgetName,this._mouseUpDelegate);
if(this._mouseStarted){this._mouseStarted=false;
if(D.target===this._mouseDownEvent.target){B.data(D.target,this.widgetName+".preventClickEvent",true)
}this._mouseStop(D)
}return false
},_mouseDistanceMet:function(D){return(Math.max(Math.abs(this._mouseDownEvent.pageX-D.pageX),Math.abs(this._mouseDownEvent.pageY-D.pageY))>=this.options.distance)
},_mouseDelayMet:function(){return this.mouseDelayMet
},_mouseStart:function(){},_mouseDrag:function(){},_mouseStop:function(){},_mouseCapture:function(){return true
}})
})(jQuery);
(function(B,C){var A=5;
B.widget("ui.slider",B.ui.mouse,{version:"1.10.0",widgetEventPrefix:"slide",options:{animate:false,distance:0,max:100,min:0,orientation:"horizontal",range:false,step:1,value:0,values:null,change:null,slide:null,start:null,stop:null},_create:function(){var F,D,I=this.options,H=this.element.find(".ui-slider-handle").addClass("ui-state-default ui-corner-all"),G="<a class='ui-slider-handle ui-state-default ui-corner-all' href='#'></a>",E=[];
this._keySliding=false;
this._mouseSliding=false;
this._animateOff=true;
this._handleIndex=null;
this._detectOrientation();
this._mouseInit();
this.element.addClass("ui-slider ui-slider-"+this.orientation+" ui-widget ui-widget-content ui-corner-all");
this.range=B([]);
if(I.range){if(I.range===true){if(!I.values){I.values=[this._valueMin(),this._valueMin()]
}else{if(I.values.length&&I.values.length!==2){I.values=[I.values[0],I.values[0]]
}else{if(B.isArray(I.values)){I.values=I.values.slice(0)
}}}}this.range=B("<div></div>").appendTo(this.element).addClass("ui-slider-range ui-widget-header"+((I.range==="min"||I.range==="max")?" ui-slider-range-"+I.range:""))
}D=(I.values&&I.values.length)||1;
for(F=H.length;
F<D;
F++){E.push(G)
}this.handles=H.add(B(E.join("")).appendTo(this.element));
this.handle=this.handles.eq(0);
this.handles.add(this.range).filter("a").click(function(J){J.preventDefault()
}).mouseenter(function(){if(!I.disabled){B(this).addClass("ui-state-hover")
}}).mouseleave(function(){B(this).removeClass("ui-state-hover")
}).focus(function(){if(!I.disabled){B(".ui-slider .ui-state-focus").removeClass("ui-state-focus");
B(this).addClass("ui-state-focus")
}else{B(this).blur()
}}).blur(function(){B(this).removeClass("ui-state-focus")
});
this.handles.each(function(J){B(this).data("ui-slider-handle-index",J)
});
this._setOption("disabled",I.disabled);
this._on(this.handles,this._handleEvents);
this._refreshValue();
this._animateOff=false
},_destroy:function(){this.handles.remove();
this.range.remove();
this.element.removeClass("ui-slider ui-slider-horizontal ui-slider-vertical ui-widget ui-widget-content ui-corner-all");
this._mouseDestroy()
},_mouseCapture:function(F){var J,M,E,H,L,N,I,D,K=this,G=this.options;
if(G.disabled){return false
}this.elementSize={width:this.element.outerWidth(),height:this.element.outerHeight()};
this.elementOffset=this.element.offset();
J={x:F.pageX,y:F.pageY};
M=this._normValueFromMouse(J);
E=this._valueMax()-this._valueMin()+1;
this.handles.each(function(O){var P=Math.abs(M-K.values(O));
if((E>P)||(E===P&&(O===K._lastChangedValue||K.values(O)===G.min))){E=P;
H=B(this);
L=O
}});
N=this._start(F,L);
if(N===false){return false
}this._mouseSliding=true;
this._handleIndex=L;
H.addClass("ui-state-active").focus();
I=H.offset();
D=!B(F.target).parents().addBack().is(".ui-slider-handle");
this._clickOffset=D?{left:0,top:0}:{left:F.pageX-I.left-(H.width()/2),top:F.pageY-I.top-(H.height()/2)-(parseInt(H.css("borderTopWidth"),10)||0)-(parseInt(H.css("borderBottomWidth"),10)||0)+(parseInt(H.css("marginTop"),10)||0)};
if(!this.handles.hasClass("ui-state-hover")){this._slide(F,L,M)
}this._animateOff=true;
return true
},_mouseStart:function(){return true
},_mouseDrag:function(F){var D={x:F.pageX,y:F.pageY},E=this._normValueFromMouse(D);
this._slide(F,this._handleIndex,E);
return false
},_mouseStop:function(D){this.handles.removeClass("ui-state-active");
this._mouseSliding=false;
this._stop(D,this._handleIndex);
this._change(D,this._handleIndex);
this._handleIndex=null;
this._clickOffset=null;
this._animateOff=false;
return false
},_detectOrientation:function(){this.orientation=(this.options.orientation==="vertical")?"vertical":"horizontal"
},_normValueFromMouse:function(E){var D,H,G,F,I;
if(this.orientation==="horizontal"){D=this.elementSize.width;
H=E.x-this.elementOffset.left-(this._clickOffset?this._clickOffset.left:0)
}else{D=this.elementSize.height;
H=E.y-this.elementOffset.top-(this._clickOffset?this._clickOffset.top:0)
}G=(H/D);
if(G>1){G=1
}if(G<0){G=0
}if(this.orientation==="vertical"){G=1-G
}F=this._valueMax()-this._valueMin();
I=this._valueMin()+G*F;
return this._trimAlignValue(I)
},_start:function(F,E){var D={handle:this.handles[E],value:this.value()};
if(this.options.values&&this.options.values.length){D.value=this.values(E);
D.values=this.values()
}return this._trigger("start",F,D)
},_slide:function(H,G,F){var D,E,I;
if(this.options.values&&this.options.values.length){D=this.values(G?0:1);
if((this.options.values.length===2&&this.options.range===true)&&((G===0&&F>D)||(G===1&&F<D))){F=D
}if(F!==this.values(G)){E=this.values();
E[G]=F;
I=this._trigger("slide",H,{handle:this.handles[G],value:F,values:E});
D=this.values(G?0:1);
if(I!==false){this.values(G,F,true)
}}}else{if(F!==this.value()){I=this._trigger("slide",H,{handle:this.handles[G],value:F});
if(I!==false){this.value(F)
}}}},_stop:function(F,E){var D={handle:this.handles[E],value:this.value()};
if(this.options.values&&this.options.values.length){D.value=this.values(E);
D.values=this.values()
}this._trigger("stop",F,D)
},_change:function(F,E){if(!this._keySliding&&!this._mouseSliding){var D={handle:this.handles[E],value:this.value()};
if(this.options.values&&this.options.values.length){D.value=this.values(E);
D.values=this.values()
}this._lastChangedValue=E;
this._trigger("change",F,D)
}},value:function(D){if(arguments.length){this.options.value=this._trimAlignValue(D);
this._refreshValue();
this._change(null,0);
return 
}return this._value()
},values:function(E,H){var G,D,F;
if(arguments.length>1){this.options.values[E]=this._trimAlignValue(H);
this._refreshValue();
this._change(null,E);
return 
}if(arguments.length){if(B.isArray(arguments[0])){G=this.options.values;
D=arguments[0];
for(F=0;
F<G.length;
F+=1){G[F]=this._trimAlignValue(D[F]);
this._change(null,F)
}this._refreshValue()
}else{if(this.options.values&&this.options.values.length){return this._values(E)
}else{return this.value()
}}}else{return this._values()
}},_setOption:function(E,F){var D,G=0;
if(B.isArray(this.options.values)){G=this.options.values.length
}B.Widget.prototype._setOption.apply(this,arguments);
switch(E){case"disabled":if(F){this.handles.filter(".ui-state-focus").blur();
this.handles.removeClass("ui-state-hover");
this.handles.prop("disabled",true)
}else{this.handles.prop("disabled",false)
}break;
case"orientation":this._detectOrientation();
this.element.removeClass("ui-slider-horizontal ui-slider-vertical").addClass("ui-slider-"+this.orientation);
this._refreshValue();
break;
case"value":this._animateOff=true;
this._refreshValue();
this._change(null,0);
this._animateOff=false;
break;
case"values":this._animateOff=true;
this._refreshValue();
for(D=0;
D<G;
D+=1){this._change(null,D)
}this._animateOff=false;
break;
case"min":case"max":this._animateOff=true;
this._refreshValue();
this._animateOff=false;
break
}},_value:function(){var D=this.options.value;
D=this._trimAlignValue(D);
return D
},_values:function(D){var G,F,E;
if(arguments.length){G=this.options.values[D];
G=this._trimAlignValue(G);
return G
}else{F=this.options.values.slice();
for(E=0;
E<F.length;
E+=1){F[E]=this._trimAlignValue(F[E])
}return F
}},_trimAlignValue:function(G){if(G<=this._valueMin()){return this._valueMin()
}if(G>=this._valueMax()){return this._valueMax()
}var D=(this.options.step>0)?this.options.step:1,F=(G-this._valueMin())%D,E=G-F;
if(Math.abs(F)*2>=D){E+=(F>0)?D:(-D)
}return parseFloat(E.toFixed(5))
},_valueMin:function(){return this.options.min
},_valueMax:function(){return this.options.max
},_refreshValue:function(){var I,H,L,J,M,G=this.options.range,F=this.options,K=this,E=(!this._animateOff)?F.animate:false,D={};
if(this.options.values&&this.options.values.length){this.handles.each(function(N){H=(K.values(N)-K._valueMin())/(K._valueMax()-K._valueMin())*100;
D[K.orientation==="horizontal"?"left":"bottom"]=H+"%";
B(this).stop(1,1)[E?"animate":"css"](D,F.animate);
if(K.options.range===true){if(K.orientation==="horizontal"){if(N===0){K.range.stop(1,1)[E?"animate":"css"]({left:H+"%"},F.animate)
}if(N===1){K.range[E?"animate":"css"]({width:(H-I)+"%"},{queue:false,duration:F.animate})
}}else{if(N===0){K.range.stop(1,1)[E?"animate":"css"]({bottom:(H)+"%"},F.animate)
}if(N===1){K.range[E?"animate":"css"]({height:(H-I)+"%"},{queue:false,duration:F.animate})
}}}I=H
})
}else{L=this.value();
J=this._valueMin();
M=this._valueMax();
H=(M!==J)?(L-J)/(M-J)*100:0;
D[this.orientation==="horizontal"?"left":"bottom"]=H+"%";
this.handle.stop(1,1)[E?"animate":"css"](D,F.animate);
if(G==="min"&&this.orientation==="horizontal"){this.range.stop(1,1)[E?"animate":"css"]({width:H+"%"},F.animate)
}if(G==="max"&&this.orientation==="horizontal"){this.range[E?"animate":"css"]({width:(100-H)+"%"},{queue:false,duration:F.animate})
}if(G==="min"&&this.orientation==="vertical"){this.range.stop(1,1)[E?"animate":"css"]({height:H+"%"},F.animate)
}if(G==="max"&&this.orientation==="vertical"){this.range[E?"animate":"css"]({height:(100-H)+"%"},{queue:false,duration:F.animate})
}}},_handleEvents:{keydown:function(H){var I,F,E,G,D=B(H.target).data("ui-slider-handle-index");
switch(H.keyCode){case B.ui.keyCode.HOME:case B.ui.keyCode.END:case B.ui.keyCode.PAGE_UP:case B.ui.keyCode.PAGE_DOWN:case B.ui.keyCode.UP:case B.ui.keyCode.RIGHT:case B.ui.keyCode.DOWN:case B.ui.keyCode.LEFT:H.preventDefault();
if(!this._keySliding){this._keySliding=true;
B(H.target).addClass("ui-state-active");
I=this._start(H,D);
if(I===false){return 
}}break
}G=this.options.step;
if(this.options.values&&this.options.values.length){F=E=this.values(D)
}else{F=E=this.value()
}switch(H.keyCode){case B.ui.keyCode.HOME:E=this._valueMin();
break;
case B.ui.keyCode.END:E=this._valueMax();
break;
case B.ui.keyCode.PAGE_UP:E=this._trimAlignValue(F+((this._valueMax()-this._valueMin())/A));
break;
case B.ui.keyCode.PAGE_DOWN:E=this._trimAlignValue(F-((this._valueMax()-this._valueMin())/A));
break;
case B.ui.keyCode.UP:case B.ui.keyCode.RIGHT:if(F===this._valueMax()){return 
}E=this._trimAlignValue(F+G);
break;
case B.ui.keyCode.DOWN:case B.ui.keyCode.LEFT:if(F===this._valueMin()){return 
}E=this._trimAlignValue(F-G);
break
}this._slide(H,D,E)
},keyup:function(E){var D=B(E.target).data("ui-slider-handle-index");
if(this._keySliding){this._keySliding=false;
this._stop(E,D);
this._change(E,D);
B(E.target).removeClass("ui-state-active")
}}}})
}(jQuery));
(function(C){function B(F,E){return(typeof F=="function")?(F.call(E)):F
}function D(E){while(E=E.parentNode){if(E==document){return true
}}return false
}function A(F,E){this.$element=C(F);
this.options=E;
this.enabled=true;
this.fixTitle()
}A.prototype={show:function(){var H=this.getTitle();
if(H&&this.enabled){var G=this.tip();
G.find(".tipsy-inner")[this.options.html?"html":"text"](H);
G[0].className="tipsy";
G.remove().css({top:0,left:0,visibility:"hidden",display:"block"}).prependTo(document.body);
var K=C.extend({},this.$element.offset(),{width:this.$element[0].offsetWidth,height:this.$element[0].offsetHeight});
var E=G[0].offsetWidth,J=G[0].offsetHeight,I=B(this.options.gravity,this.$element[0]);
var F;
switch(I.charAt(0)){case"n":F={top:K.top+K.height+this.options.offset,left:K.left+K.width/2-E/2};
break;
case"s":F={top:K.top-J-this.options.offset,left:K.left+K.width/2-E/2};
break;
case"e":F={top:K.top+K.height/2-J/2,left:K.left-E-this.options.offset};
break;
case"w":F={top:K.top+K.height/2-J/2,left:K.left+K.width+this.options.offset};
break
}if(I.length==2){if(I.charAt(1)=="w"){F.left=K.left+K.width/2-15
}else{F.left=K.left+K.width/2-E+15
}}G.css(F).addClass("tipsy-"+I);
G.find(".tipsy-arrow")[0].className="tipsy-arrow tipsy-arrow-"+I.charAt(0);
if(this.options.className){G.addClass(B(this.options.className,this.$element[0]))
}if(this.options.fade){G.stop().css({opacity:0,display:"block",visibility:"visible"}).animate({opacity:this.options.opacity})
}else{G.css({visibility:"visible",opacity:this.options.opacity})
}}},hide:function(){if(this.options.fade){this.tip().stop().fadeOut(function(){C(this).remove()
})
}else{this.tip().remove()
}},fixTitle:function(){var E=this.$element;
if(E.attr("title")||typeof (E.attr("original-title"))!="string"){E.attr("original-title",E.attr("title")||"").removeAttr("title")
}},getTitle:function(){var G,E=this.$element,F=this.options;
this.fixTitle();
var G,F=this.options;
if(typeof F.title=="string"){G=E.attr(F.title=="title"?"original-title":F.title)
}else{if(typeof F.title=="function"){G=F.title.call(E[0])
}}G=(""+G).replace(/(^\s*|\s*$)/,"");
return G||F.fallback
},tip:function(){if(!this.$tip){this.$tip=C('<div class="tipsy"></div>').html('<div class="tipsy-arrow"></div><div class="tipsy-inner"></div>');
this.$tip.data("tipsy-pointee",this.$element[0])
}return this.$tip
},validate:function(){if(!this.$element[0].parentNode){this.hide();
this.$element=null;
this.options=null
}},enable:function(){this.enabled=true
},disable:function(){this.enabled=false
},toggleEnabled:function(){this.enabled=!this.enabled
}};
C.fn.tipsy=function(I){if(I===true){return this.data("tipsy")
}else{if(typeof I=="string"){var K=this.data("tipsy");
if(K){K[I]()
}return this
}}I=C.extend({},C.fn.tipsy.defaults,I);
function H(M){var N=C.data(M,"tipsy");
if(!N){N=new A(M,C.fn.tipsy.elementOptions(M,I));
C.data(M,"tipsy",N)
}return N
}function L(){var M=H(this);
M.hoverState="in";
if(I.delayIn==0){M.show()
}else{M.fixTitle();
setTimeout(function(){if(M.hoverState=="in"){M.show()
}},I.delayIn)
}}function G(){var M=H(this);
M.hoverState="out";
if(I.delayOut==0){M.hide()
}else{setTimeout(function(){if(M.hoverState=="out"){M.hide()
}},I.delayOut)
}}if(!I.live){this.each(function(){H(this)
})
}if(I.trigger!="manual"){var E=I.live?"live":"bind",J=I.trigger=="hover"?"mouseenter":"focus",F=I.trigger=="hover"?"mouseleave":"blur";
this[E](J,L)[E](F,G)
}return this
};
C.fn.tipsy.defaults={className:null,delayIn:0,delayOut:0,fade:false,fallback:"",gravity:"n",html:false,live:false,offset:0,opacity:0.8,title:"title",trigger:"hover"};
C.fn.tipsy.revalidate=function(){C(".tipsy").each(function(){var E=C.data(this,"tipsy-pointee");
if(!E||!D(E)){C(this).remove()
}})
};
C.fn.tipsy.elementOptions=function(F,E){return C.metadata?C.extend({},E,C(F).metadata()):E
};
C.fn.tipsy.autoNS=function(){return C(this).offset().top>(C(document).scrollTop()+C(window).height()/2)?"s":"n"
};
C.fn.tipsy.autoWE=function(){return C(this).offset().left>(C(document).scrollLeft()+C(window).width()/2)?"e":"w"
};
C.fn.tipsy.autoBounds=function(F,E){return function(){var G={ns:E[0],ew:(E.length>1?E[1]:false)},J=C(document).scrollTop()+F,H=C(document).scrollLeft()+F,I=C(this);
if(I.offset().top<J){G.ns="n"
}if(I.offset().left<H){G.ew="w"
}if(C(window).width()+C(document).scrollLeft()-I.offset().left<F){G.ew="e"
}if(C(window).height()+C(document).scrollTop()-I.offset().top<F){G.ns="s"
}return G.ns+(G.ew?G.ew:"")
}
}
})(jQuery);
/*
 * jQuery Cookie Plugin v1.3
 * https://github.com/carhartl/jquery-cookie
 *
 * Copyright 2011, Klaus Hartl
 * Dual licensed under the MIT or GPL Version 2 licenses.
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.opensource.org/licenses/GPL-2.0
 */
(function(F,B,G){var A=/\+/g;
function E(H){return H
}function C(H){return decodeURIComponent(H.replace(A," "))
}var D=F.cookie=function(N,M,R){if(M!==G){R=F.extend({},D.defaults,R);
if(M===null){R.expires=-1
}if(typeof R.expires==="number"){var O=R.expires,Q=R.expires=new Date();
Q.setDate(Q.getDate()+O)
}M=D.json?JSON.stringify(M):String(M);
return(B.cookie=[encodeURIComponent(N),"=",D.raw?M:encodeURIComponent(M),R.expires?"; expires="+R.expires.toUTCString():"",R.path?"; path="+R.path:"",R.domain?"; domain="+R.domain:"",R.secure?"; secure":""].join(""))
}var H=D.raw?E:C;
var P=B.cookie.split("; ");
for(var L=0,J=P.length;
L<J;
L++){var K=P[L].split("=");
if(H(K.shift())===N){var I=H(K.join("="));
return D.json?JSON.parse(I):I
}}return null
};
D.defaults={};
F.removeCookie=function(I,H){if(F.cookie(I)!==null){F.cookie(I,null,H);
return true
}return false
}
})(jQuery,document);
(function(A){A.fn.adipoli=function(B){var E=A.extend({startEffect:"transparent",hoverEffect:"normal",imageOpacity:0.5,animSpeed:300,fillColor:"#000",textColor:"#fff",overlayText:"",slices:10,boxCols:5,boxRows:3,popOutMargin:10,popOutShadow:10},B);
A(this).one("load",function(){A(this).wrap(function(){return'<div class="adipoli-wrapper '+A(this).attr("class")+'" style="width:'+A(this).width()+"px; height:"+A(this).height()+'px;"/>'
});
A(this).parent().append('<div class="adipoli-before '+A(this).attr("class")+'" style="display:none;width:'+A(this).width()+"px; height:"+A(this).height()+'px;"><img src="'+A(this).attr("src")+'"/></div>');
A(this).parent().append('<div class="adipoli-after '+A(this).attr("class")+'" style="display:none;width:'+A(this).width()+"px; height:"+A(this).height()+'px;"></div>');
if(E.startEffect=="transparent"){A(this).hide();
A(this).siblings(".adipoli-before").css({"-ms-filter":'"progid:DXImageTransform.Microsoft.Alpha(Opacity='+E.imageOpacity*100+')"',filter:"alpha(opacity="+E.imageOpacity*100+")","-moz-opacity":E.imageOpacity,"-khtml-opacity":E.imageOpacity,opacity:E.imageOpacity}).show()
}else{if(E.startEffect=="grayscale"){var H=A(this);
H.hide();
H.siblings(".adipoli-before").show();
H.siblings(".adipoli-before").children("img").each(function(){this.src=F(this.src)
})
}else{if(E.startEffect=="normal"){A(this).hide();
A(this).siblings(".adipoli-before").show()
}else{if(E.startEffect=="overlay"){H=A(this);
H.hide();
A(this).siblings(".adipoli-before").html(E.overlayText).css({"-ms-filter":'"progid:DXImageTransform.Microsoft.Alpha(Opacity='+E.imageOpacity*100+')"',filter:"alpha(opacity="+E.imageOpacity*100+")","-moz-opacity":E.imageOpacity,"-khtml-opacity":E.imageOpacity,opacity:E.imageOpacity,background:E.fillColor,color:E.textColor}).fadeIn();
H.show()
}}}}A(this).parent().bind("mouseenter",function(){if(E.hoverEffect=="normal"){var M=A(this);
M.children(".adipoli-after").html('<img src="'+M.children("img").attr("src")+'"/>').fadeIn(E.animSpeed)
}else{if(E.hoverEffect=="popout"){M=A(this);
var I=M.children("img").width();
var J=M.children("img").height();
M.children(".adipoli-after").html('<img src="'+M.children("img").attr("src")+'"/>');
var P=M.children(".adipoli-after").children("img");
P.width(I+2*E.popOutMargin);
P.height(J+2*E.popOutMargin);
M.children(".adipoli-after").width(I+2*E.popOutMargin);
M.children(".adipoli-after").height(J+2*E.popOutMargin);
M.children(".adipoli-after").css({left:"-"+E.popOutMargin+"px",top:"-"+E.popOutMargin+"px","box-shadow":"0px 0px "+E.popOutShadow+"px #000"}).show()
}else{if(E.hoverEffect=="sliceDown"||E.hoverEffect=="sliceDownLeft"||E.hoverEffect=="sliceUp"||E.hoverEffect=="sliceUpLeft"||E.hoverEffect=="sliceUpRandom"||E.hoverEffect=="sliceDownRandom"){A(this).children(".adipoli-after").show();
G(A(this),E);
var K=0;
var N=0;
var U=A(".adipoli-slice",A(this));
if(E.hoverEffect=="sliceDownLeft"||E.hoverEffect=="sliceUpLeft"){U=A(".adipoli-slice",A(this))._reverse()
}if(E.hoverEffect=="sliceUpRandom"||E.hoverEffect=="sliceDownRandom"){U=C(A(".adipoli-slice",A(this)))
}U.each(function(){var Y=A(this);
if(E.hoverEffect=="sliceDown"||E.hoverEffect=="sliceDownLeft"){Y.css({top:"0px"})
}else{if(E.hoverEffect=="sliceUp"||E.hoverEffect=="sliceUpLeft"){Y.css({bottom:"0px"})
}}if(N==E.slices-1){setTimeout(function(){Y.animate({height:"100%",opacity:"1.0"},E.animSpeed,"",function(){})
},(100+K))
}else{setTimeout(function(){Y.animate({height:"100%",opacity:"1.0"},E.animSpeed)
},(100+K))
}K+=50;
N++
})
}else{if(E.hoverEffect=="sliceUpDown"||E.hoverEffect=="sliceUpDownLeft"){A(this).children(".adipoli-after").show();
G(A(this),E);
K=0;
N=0;
var V=0;
U=A(".adipoli-slice",A(this));
if(E.hoverEffect=="sliceUpDownLeft"){U=A(".adipoli-slice",A(this))._reverse()
}U.each(function(){var Y=A(this);
if(N==0){Y.css("top","0px");
N++
}else{Y.css("bottom","0px");
N=0
}if(V==E.slices-1){setTimeout(function(){Y.animate({height:"100%",opacity:"1.0"},E.animSpeed,"",function(){})
},(100+K))
}else{setTimeout(function(){Y.animate({height:"100%",opacity:"1.0"},E.animSpeed)
},(100+K))
}K+=50;
V++
})
}else{if(E.hoverEffect=="fold"||E.hoverEffect=="foldLeft"){A(this).children(".adipoli-after").show();
M=A(this);
G(M,E);
K=0;
N=0;
U=A(".adipoli-slice",M);
if(E.hoverEffect=="foldLeft"){U=A(".adipoli-slice",A(this))._reverse()
}U.each(function(){var Y=A(this);
var Z=Y.width();
Y.css({top:"0px",height:"100%",width:"0px"});
if(N==E.slices-1){setTimeout(function(){Y.animate({width:Z,opacity:"1.0"},E.animSpeed,"",function(){})
},(100+K))
}else{setTimeout(function(){Y.animate({width:Z,opacity:"1.0"},E.animSpeed)
},(100+K))
}K+=50;
N++
})
}else{if(E.hoverEffect=="boxRandom"){A(this).children(".adipoli-after").show();
M=A(this);
D(M,E);
var S=E.boxCols*E.boxRows;
N=0;
K=0;
var O=C(A(".adipoli-box",M));
O.each(function(){var Y=A(this);
if(N==S-1){setTimeout(function(){Y.animate({opacity:"1"},E.animSpeed,"",function(){})
},(100+K))
}else{setTimeout(function(){Y.animate({opacity:"1"},E.animSpeed)
},(100+K))
}K+=20;
N++
})
}else{if(E.hoverEffect=="boxRain"||E.hoverEffect=="boxRainReverse"||E.hoverEffect=="boxRainGrow"||E.hoverEffect=="boxRainGrowReverse"){A(this).children(".adipoli-after").show();
M=A(this);
D(M,E);
S=E.boxCols*E.boxRows;
N=0;
K=0;
var R=0;
var T=0;
var W=new Array();
W[R]=new Array();
O=A(".adipoli-box",M);
if(E.hoverEffect=="boxRainReverse"||E.hoverEffect=="boxRainGrowReverse"){O=A(".adipoli-box",M)._reverse()
}O.each(function(){W[R][T]=A(this);
T++;
if(T==E.boxCols){R++;
T=0;
W[R]=new Array()
}});
for(var Q=0;
Q<(E.boxCols*2);
Q++){var L=Q;
for(var X=0;
X<E.boxRows;
X++){if(L>=0&&L<E.boxCols){(function(e,Z,d,a,f){var c=A(W[e][Z]);
var Y=c.width();
var b=c.height();
if(E.hoverEffect=="boxRainGrow"||E.hoverEffect=="boxRainGrowReverse"){c.width(0).height(0)
}if(a==f-1){setTimeout(function(){c.animate({opacity:"1",width:Y,height:b},E.animSpeed/1.3,"",function(){})
},(100+d))
}else{setTimeout(function(){c.animate({opacity:"1",width:Y,height:b},E.animSpeed/1.3)
},(100+d))
}})(X,L,K,N,S);
N++
}L--
}K+=100
}}}}}}}}});
A(this).parent().bind("mouseleave",function(){A(this).children(".adipoli-after").html("").hide()
})
}).each(function(){if(this.complete){A(this).load()
}});
return A(this);
function G(I,J){for(var H=0;
H<J.slices;
H++){var K=Math.round(I.width()/J.slices);
if(H==J.slices-1){I.children(".adipoli-after").append(A('<div class="adipoli-slice"></div>').css({left:(K*H)+"px",width:(I.width()-(K*H))+"px",height:"0px",opacity:"0",background:'url("'+I.children("img").attr("src")+'") no-repeat -'+((K+(H*K))-K)+"px 0%"}))
}else{I.children(".adipoli-after").append(A('<div class="adipoli-slice"></div>').css({left:(K*H)+"px",width:K+"px",height:"0px",opacity:"0",background:'url("'+I.children("img").attr("src")+'") no-repeat -'+((K+(H*K))-K)+"px 0%"}))
}}}function D(H,I){var J=Math.round(H.width()/I.boxCols);
var M=Math.round(H.height()/I.boxRows);
for(var K=0;
K<I.boxRows;
K++){for(var L=0;
L<I.boxCols;
L++){if(L==I.boxCols-1){H.children(".adipoli-after").append(A('<div class="adipoli-box"></div>').css({opacity:0,left:(J*L)+"px",top:(M*K)+"px",width:(H.width()-(J*L))+"px",height:M+"px",background:'url("'+H.children("img").attr("src")+'") no-repeat -'+((J+(L*J))-J)+"px -"+((M+(K*M))-M)+"px"}))
}else{H.children(".adipoli-after").append(A('<div class="adipoli-box"></div>').css({opacity:0,left:(J*L)+"px",top:(M*K)+"px",width:J+"px",height:M+"px",background:'url("'+H.children("img").attr("src")+'") no-repeat -'+((J+(L*J))-J)+"px -"+((M+(K*M))-M)+"px"}))
}}}}function C(I){for(var J,H,K=I.length;
K;
J=parseInt(Math.random()*K),H=I[--K],I[K]=I[J],I[J]=H){}return I
}function F(H){var J=document.createElement("canvas");
var P=J.getContext("2d");
var K=new Image();
K.src=H;
J.width=K.width;
J.height=K.height;
P.drawImage(K,0,0);
var I=P.getImageData(0,0,J.width,J.height);
for(var N=0;
N<I.height;
N++){for(var O=0;
O<I.width;
O++){var L=(N*4)*I.width+O*4;
var M=(I.data[L]+I.data[L+1]+I.data[L+2])/3;
I.data[L]=M;
I.data[L+1]=M;
I.data[L+2]=M
}}P.putImageData(I,0,0,0,0,I.width,I.height);
return J.toDataURL()
}};
A.fn._reverse=[].reverse
})(jQuery);
/*
 * jScrollPane - v2.0.14 - 2013-05-01
 * http://jscrollpane.kelvinluck.com/
 *
 * Copyright (c) 2010 Kelvin Luck
 * Dual licensed under the MIT or GPL licenses.
 */
(function(B,A,C){B.fn.jScrollPane=function(E){function D(c,o){var AY,q=this,z,AK,U,AM,u,AA,X,Q,AZ,Ae,AU,I,h,H,J,AB,v,AQ,y,S,Z,AR,AG,AN,f,L,AT,AX,W,AV,Ah,F,l,AJ=true,p=true,Ag=false,K=false,AP=c.clone(false,false).empty(),AD=B.fn.mwheelIntent?"mwheelIntent.jsp":"mousewheel.jsp";
Ah=c.css("paddingTop")+" "+c.css("paddingRight")+" "+c.css("paddingBottom")+" "+c.css("paddingLeft");
F=(parseInt(c.css("paddingLeft"),10)||0)+(parseInt(c.css("paddingRight"),10)||0);
function AS(Aq){var Al,An,Am,Aj,Ai,Ap,Ao=false,Ak=false;
AY=Aq;
if(z===C){Ai=c.scrollTop();
Ap=c.scrollLeft();
c.css({overflow:"hidden",padding:0});
AK=c.innerWidth()+F;
U=c.innerHeight();
c.width(AK);
z=B('<div class="jspPane" />').css("padding",Ah).append(c.children());
AM=B('<div class="jspContainer" />').css({width:AK+"px",height:U+"px"}).append(z).appendTo(c)
}else{c.css("width","");
Ao=AY.stickToBottom&&k();
Ak=AY.stickToRight&&a();
Aj=c.innerWidth()+F!=AK||c.outerHeight()!=U;
if(Aj){AK=c.innerWidth()+F;
U=c.innerHeight();
AM.css({width:AK+"px",height:U+"px"})
}if(!Aj&&l==u&&z.outerHeight()==AA){c.width(AK);
return 
}l=u;
z.css("width","");
c.width(AK);
AM.find(">.jspVerticalBar,>.jspHorizontalBar").remove().end()
}z.css("overflow","auto");
if(Aq.contentWidth){u=Aq.contentWidth
}else{u=z[0].scrollWidth
}AA=z[0].scrollHeight;
z.css("overflow","");
X=u/AK;
Q=AA/U;
AZ=Q>1;
Ae=X>1;
if(!(Ae||AZ)){c.removeClass("jspScrollable");
z.css({top:0,width:AM.width()-F});
N();
d();
r();
V()
}else{c.addClass("jspScrollable");
Al=AY.maintainPosition&&(h||AB);
if(Al){An=Ac();
Am=Aa()
}Af();
Y();
e();
if(Al){n(Ak?(u-AK):An,false);
m(Ao?(AA-U):Am,false)
}j();
AH();
AO();
if(AY.enableKeyboardNavigation){t()
}if(AY.clickOnTrack){P()
}b();
if(AY.hijackInternalLinks){M()
}}if(AY.autoReinitialise&&!AV){AV=setInterval(function(){AS(AY)
},AY.autoReinitialiseDelay)
}else{if(!AY.autoReinitialise&&AV){clearInterval(AV)
}}Ai&&c.scrollTop(0)&&m(Ai,false);
Ap&&c.scrollLeft(0)&&n(Ap,false);
c.trigger("jsp-initialised",[Ae||AZ])
}function Af(){if(AZ){AM.append(B('<div class="jspVerticalBar" />').append(B('<div class="jspCap jspCapTop" />'),B('<div class="jspTrack" />').append(B('<div class="jspDrag" />').append(B('<div class="jspDragTop" />'),B('<div class="jspDragBottom" />'))),B('<div class="jspCap jspCapBottom" />')));
v=AM.find(">.jspVerticalBar");
AQ=v.find(">.jspTrack");
AU=AQ.find(">.jspDrag");
if(AY.showArrows){AR=B('<a class="jspArrow jspArrowUp" />').bind("mousedown.jsp",Ad(0,-1)).bind("click.jsp",Ab);
AG=B('<a class="jspArrow jspArrowDown" />').bind("mousedown.jsp",Ad(0,1)).bind("click.jsp",Ab);
if(AY.arrowScrollOnHover){AR.bind("mouseover.jsp",Ad(0,-1,AR));
AG.bind("mouseover.jsp",Ad(0,1,AG))
}AL(AQ,AY.verticalArrowPositions,AR,AG)
}S=U;
AM.find(">.jspVerticalBar>.jspCap:visible,>.jspVerticalBar>.jspArrow").each(function(){S-=B(this).outerHeight()
});
AU.hover(function(){AU.addClass("jspHover")
},function(){AU.removeClass("jspHover")
}).bind("mousedown.jsp",function(Aj){B("html").bind("dragstart.jsp selectstart.jsp",Ab);
AU.addClass("jspActive");
var Ai=Aj.pageY-AU.position().top;
B("html").bind("mousemove.jsp",function(Ak){w(Ak.pageY-Ai,false)
}).bind("mouseup.jsp mouseleave.jsp",AW);
return false
});
O()
}}function O(){AQ.height(S+"px");
h=0;
y=AY.verticalGutter+AQ.outerWidth();
z.width(AK-y-F);
try{if(v.position().left===0){z.css("margin-left",y+"px")
}}catch(Ai){}}function Y(){if(Ae){AM.append(B('<div class="jspHorizontalBar" />').append(B('<div class="jspCap jspCapLeft" />'),B('<div class="jspTrack" />').append(B('<div class="jspDrag" />').append(B('<div class="jspDragLeft" />'),B('<div class="jspDragRight" />'))),B('<div class="jspCap jspCapRight" />')));
AN=AM.find(">.jspHorizontalBar");
f=AN.find(">.jspTrack");
H=f.find(">.jspDrag");
if(AY.showArrows){AX=B('<a class="jspArrow jspArrowLeft" />').bind("mousedown.jsp",Ad(-1,0)).bind("click.jsp",Ab);
W=B('<a class="jspArrow jspArrowRight" />').bind("mousedown.jsp",Ad(1,0)).bind("click.jsp",Ab);
if(AY.arrowScrollOnHover){AX.bind("mouseover.jsp",Ad(-1,0,AX));
W.bind("mouseover.jsp",Ad(1,0,W))
}AL(f,AY.horizontalArrowPositions,AX,W)
}H.hover(function(){H.addClass("jspHover")
},function(){H.removeClass("jspHover")
}).bind("mousedown.jsp",function(Aj){B("html").bind("dragstart.jsp selectstart.jsp",Ab);
H.addClass("jspActive");
var Ai=Aj.pageX-H.position().left;
B("html").bind("mousemove.jsp",function(Ak){x(Ak.pageX-Ai,false)
}).bind("mouseup.jsp mouseleave.jsp",AW);
return false
});
L=AM.innerWidth();
AI()
}}function AI(){AM.find(">.jspHorizontalBar>.jspCap:visible,>.jspHorizontalBar>.jspArrow").each(function(){L-=B(this).outerWidth()
});
f.width(L+"px");
AB=0
}function e(){if(Ae&&AZ){var Aj=f.outerHeight(),Ai=AQ.outerWidth();
S-=Aj;
B(AN).find(">.jspCap:visible,>.jspArrow").each(function(){L+=B(this).outerWidth()
});
L-=Ai;
U-=Ai;
AK-=Aj;
f.parent().append(B('<div class="jspCorner" />').css("width",Aj+"px"));
O();
AI()
}if(Ae){z.width((AM.outerWidth()-F)+"px")
}AA=z.outerHeight();
Q=AA/U;
if(Ae){AT=Math.ceil(1/X*L);
if(AT>AY.horizontalDragMaxWidth){AT=AY.horizontalDragMaxWidth
}else{if(AT<AY.horizontalDragMinWidth){AT=AY.horizontalDragMinWidth
}}H.width(AT+"px");
J=L-AT;
AF(AB)
}if(AZ){Z=Math.ceil(1/Q*S);
if(Z>AY.verticalDragMaxHeight){Z=AY.verticalDragMaxHeight
}else{if(Z<AY.verticalDragMinHeight){Z=AY.verticalDragMinHeight
}}AU.height(Z+"px");
I=S-Z;
AE(h)
}}function AL(Ak,Am,Aj,Ai){var Ao="before",Al="after",An;
if(Am=="os"){Am=/Mac/.test(navigator.platform)?"after":"split"
}if(Am==Ao){Al=Am
}else{if(Am==Al){Ao=Am;
An=Aj;
Aj=Ai;
Ai=An
}}Ak[Ao](Aj)[Al](Ai)
}function Ad(Aj,Ai,Ak){return function(){g(Aj,Ai,this,Ak);
this.blur();
return false
}
}function g(Am,Al,Ap,Ao){Ap=B(Ap).addClass("jspActive");
var An,Ak,Aj=true,Ai=function(){if(Am!==0){q.scrollByX(Am*AY.arrowButtonSpeed)
}if(Al!==0){q.scrollByY(Al*AY.arrowButtonSpeed)
}Ak=setTimeout(Ai,Aj?AY.initialDelay:AY.arrowRepeatFreq);
Aj=false
};
Ai();
An=Ao?"mouseout.jsp":"mouseup.jsp";
Ao=Ao||B("html");
Ao.bind(An,function(){Ap.removeClass("jspActive");
Ak&&clearTimeout(Ak);
Ak=null;
Ao.unbind(An)
})
}function P(){V();
if(AZ){AQ.bind("mousedown.jsp",function(Ao){if(Ao.originalTarget===C||Ao.originalTarget==Ao.currentTarget){var Am=B(this),Ap=Am.offset(),An=Ao.pageY-Ap.top-h,Ak,Aj=true,Ai=function(){var As=Am.offset(),At=Ao.pageY-As.top-Z/2,Aq=U*AY.scrollPagePercent,Ar=I*Aq/(AA-U);
if(An<0){if(h-Ar>At){q.scrollByY(-Aq)
}else{w(At)
}}else{if(An>0){if(h+Ar<At){q.scrollByY(Aq)
}else{w(At)
}}else{Al();
return 
}}Ak=setTimeout(Ai,Aj?AY.initialDelay:AY.trackClickRepeatFreq);
Aj=false
},Al=function(){Ak&&clearTimeout(Ak);
Ak=null;
B(document).unbind("mouseup.jsp",Al)
};
Ai();
B(document).bind("mouseup.jsp",Al);
return false
}})
}if(Ae){f.bind("mousedown.jsp",function(Ao){if(Ao.originalTarget===C||Ao.originalTarget==Ao.currentTarget){var Am=B(this),Ap=Am.offset(),An=Ao.pageX-Ap.left-AB,Ak,Aj=true,Ai=function(){var As=Am.offset(),At=Ao.pageX-As.left-AT/2,Aq=AK*AY.scrollPagePercent,Ar=J*Aq/(u-AK);
if(An<0){if(AB-Ar>At){q.scrollByX(-Aq)
}else{x(At)
}}else{if(An>0){if(AB+Ar<At){q.scrollByX(Aq)
}else{x(At)
}}else{Al();
return 
}}Ak=setTimeout(Ai,Aj?AY.initialDelay:AY.trackClickRepeatFreq);
Aj=false
},Al=function(){Ak&&clearTimeout(Ak);
Ak=null;
B(document).unbind("mouseup.jsp",Al)
};
Ai();
B(document).bind("mouseup.jsp",Al);
return false
}})
}}function V(){if(f){f.unbind("mousedown.jsp")
}if(AQ){AQ.unbind("mousedown.jsp")
}}function AW(){B("html").unbind("dragstart.jsp selectstart.jsp mousemove.jsp mouseup.jsp mouseleave.jsp");
if(AU){AU.removeClass("jspActive")
}if(H){H.removeClass("jspActive")
}}function w(Ai,Aj){if(!AZ){return 
}if(Ai<0){Ai=0
}else{if(Ai>I){Ai=I
}}if(Aj===C){Aj=AY.animateScroll
}if(Aj){q.animate(AU,"top",Ai,AE)
}else{AU.css("top",Ai);
AE(Ai)
}}function AE(Aj){if(Aj===C){Aj=AU.position().top
}AM.scrollTop(0);
h=Aj;
var Am=h===0,Ak=h==I,Al=Aj/I,Ai=-Al*(AA-U);
if(AJ!=Am||Ag!=Ak){AJ=Am;
Ag=Ak;
c.trigger("jsp-arrow-change",[AJ,Ag,p,K])
}T(Am,Ak);
z.css("top",Ai);
c.trigger("jsp-scroll-y",[-Ai,Am,Ak]).trigger("scroll")
}function x(Aj,Ai){if(!Ae){return 
}if(Aj<0){Aj=0
}else{if(Aj>J){Aj=J
}}if(Ai===C){Ai=AY.animateScroll
}if(Ai){q.animate(H,"left",Aj,AF)
}else{H.css("left",Aj);
AF(Aj)
}}function AF(Aj){if(Aj===C){Aj=H.position().left
}AM.scrollTop(0);
AB=Aj;
var Am=AB===0,Al=AB==J,Ak=Aj/J,Ai=-Ak*(u-AK);
if(p!=Am||K!=Al){p=Am;
K=Al;
c.trigger("jsp-arrow-change",[AJ,Ag,p,K])
}R(Am,Al);
z.css("left",Ai);
c.trigger("jsp-scroll-x",[-Ai,Am,Al]).trigger("scroll")
}function T(Aj,Ai){if(AY.showArrows){AR[Aj?"addClass":"removeClass"]("jspDisabled");
AG[Ai?"addClass":"removeClass"]("jspDisabled")
}}function R(Aj,Ai){if(AY.showArrows){AX[Aj?"addClass":"removeClass"]("jspDisabled");
W[Ai?"addClass":"removeClass"]("jspDisabled")
}}function m(Ai,Aj){var Ak=Ai/(AA-U);
w(Ak*I,Aj)
}function n(Aj,Ai){var Ak=Aj/(u-AK);
x(Ak*J,Ai)
}function AC(Aw,Ar,Ak){var Ao,Al,Am,Ai=0,Av=0,Aj,Aq,Ap,At,As,Au;
try{Ao=B(Aw)
}catch(An){return 
}Al=Ao.outerHeight();
Am=Ao.outerWidth();
AM.scrollTop(0);
AM.scrollLeft(0);
while(!Ao.is(".jspPane")){Ai+=Ao.position().top;
Av+=Ao.position().left;
Ao=Ao.offsetParent();
if(/^body|html$/i.test(Ao[0].nodeName)){return 
}}Aj=Aa();
Ap=Aj+U;
if(Ai<Aj||Ar){As=Ai-AY.verticalGutter
}else{if(Ai+Al>Ap){As=Ai-U+Al+AY.verticalGutter
}}if(As){m(As,Ak)
}Aq=Ac();
At=Aq+AK;
if(Av<Aq||Ar){Au=Av-AY.horizontalGutter
}else{if(Av+Am>At){Au=Av-AK+Am+AY.horizontalGutter
}}if(Au){n(Au,Ak)
}}function Ac(){return -z.position().left
}function Aa(){return -z.position().top
}function k(){var Ai=AA-U;
return(Ai>20)&&(Ai-Aa()<10)
}function a(){var Ai=u-AK;
return(Ai>20)&&(Ai-Ac()<10)
}function AH(){AM.unbind(AD).bind(AD,function(Am,An,Al,Aj){var Ak=AB,Ai=h;
q.scrollBy(Al*AY.mouseWheelSpeed,-Aj*AY.mouseWheelSpeed,false);
return Ak==AB&&Ai==h
})
}function N(){AM.unbind(AD)
}function Ab(){return false
}function j(){z.find(":input,a").unbind("focus.jsp").bind("focus.jsp",function(Ai){AC(Ai.target,false)
})
}function d(){z.find(":input,a").unbind("focus.jsp")
}function t(){var Ai,Aj,Al=[];
Ae&&Al.push(AN[0]);
AZ&&Al.push(v[0]);
z.focus(function(){c.focus()
});
c.attr("tabindex",0).unbind("keydown.jsp keypress.jsp").bind("keydown.jsp",function(Ao){if(Ao.target!==this&&!(Al.length&&B(Ao.target).closest(Al).length)){return 
}var An=AB,Am=h;
switch(Ao.keyCode){case 40:case 38:case 34:case 32:case 33:case 39:case 37:Ai=Ao.keyCode;
Ak();
break;
case 35:m(AA-U);
Ai=null;
break;
case 36:m(0);
Ai=null;
break
}Aj=Ao.keyCode==Ai&&An!=AB||Am!=h;
return !Aj
}).bind("keypress.jsp",function(Am){if(Am.keyCode==Ai){Ak()
}return !Aj
});
if(AY.hideFocus){c.css("outline","none");
if("hideFocus" in AM[0]){c.attr("hideFocus",true)
}}else{c.css("outline","");
if("hideFocus" in AM[0]){c.attr("hideFocus",false)
}}function Ak(){var An=AB,Am=h;
switch(Ai){case 40:q.scrollByY(AY.keyboardSpeed,false);
break;
case 38:q.scrollByY(-AY.keyboardSpeed,false);
break;
case 34:case 32:q.scrollByY(U*AY.scrollPagePercent,false);
break;
case 33:q.scrollByY(-U*AY.scrollPagePercent,false);
break;
case 39:q.scrollByX(AY.keyboardSpeed,false);
break;
case 37:q.scrollByX(-AY.keyboardSpeed,false);
break
}Aj=An!=AB||Am!=h;
return Aj
}}function r(){c.attr("tabindex","-1").removeAttr("tabindex").unbind("keydown.jsp keypress.jsp")
}function b(){if(location.hash&&location.hash.length>1){var Al,Aj,Ak=escape(location.hash.substr(1));
try{Al=B("#"+Ak+', a[name="'+Ak+'"]')
}catch(Ai){return 
}if(Al.length&&z.find(Ak)){if(AM.scrollTop()===0){Aj=setInterval(function(){if(AM.scrollTop()>0){AC(Al,true);
B(document).scrollTop(AM.position().top);
clearInterval(Aj)
}},50)
}else{AC(Al,true);
B(document).scrollTop(AM.position().top)
}}}}function M(){if(B(document.body).data("jspHijack")){return 
}B(document.body).data("jspHijack",true);
B(document.body).delegate("a[href*=#]","click",function(Ai){var Aj=this.href.substr(0,this.href.indexOf("#")),Al=location.href,Ap,Aq,Ak,An,Am,Ao;
if(location.href.indexOf("#")!==-1){Al=location.href.substr(0,location.href.indexOf("#"))
}if(Aj!==Al){return 
}Ap=escape(this.href.substr(this.href.indexOf("#")+1));
Aq;
try{Aq=B("#"+Ap+', a[name="'+Ap+'"]')
}catch(Ar){return 
}if(!Aq.length){return 
}Ak=Aq.closest(".jspScrollable");
An=Ak.data("jsp");
An.scrollToElement(Aq,true);
if(Ak[0].scrollIntoView){Am=B(A).scrollTop();
Ao=Aq.offset().top;
if(Ao<Am||Ao>Am+B(A).height()){Ak[0].scrollIntoView()
}}Ai.preventDefault()
})
}function AO(){var Ak,Aj,Am,Al,An,Ai=false;
AM.unbind("touchstart.jsp touchmove.jsp touchend.jsp click.jsp-touchclick").bind("touchstart.jsp",function(Ao){var Ap=Ao.originalEvent.touches[0];
Ak=Ac();
Aj=Aa();
Am=Ap.pageX;
Al=Ap.pageY;
An=false;
Ai=true
}).bind("touchmove.jsp",function(Ar){if(!Ai){return 
}var Aq=Ar.originalEvent.touches[0],Ap=AB,Ao=h;
q.scrollTo(Ak+Am-Aq.pageX,Aj+Al-Aq.pageY);
An=An||Math.abs(Am-Aq.pageX)>5||Math.abs(Al-Aq.pageY)>5;
return Ap==AB&&Ao==h
}).bind("touchend.jsp",function(Ao){Ai=false
}).bind("click.jsp-touchclick",function(Ao){if(An){An=false;
return false
}})
}function G(){var Ai=Aa(),Aj=Ac();
c.removeClass("jspScrollable").unbind(".jsp");
c.replaceWith(AP.append(z.children()));
AP.scrollTop(Ai);
AP.scrollLeft(Aj);
if(AV){clearInterval(AV)
}}B.extend(q,{reinitialise:function(Ai){Ai=B.extend({},AY,Ai);
AS(Ai)
},scrollToElement:function(Ak,Aj,Ai){AC(Ak,Aj,Ai)
},scrollTo:function(Ak,Ai,Aj){n(Ak,Aj);
m(Ai,Aj)
},scrollToX:function(Aj,Ai){n(Aj,Ai)
},scrollToY:function(Ai,Aj){m(Ai,Aj)
},scrollToPercentX:function(Aj,Ai){n(Aj*(u-AK),Ai)
},scrollToPercentY:function(Aj,Ai){m(Aj*(AA-U),Ai)
},scrollBy:function(Aj,Ai,Ak){q.scrollByX(Aj,Ak);
q.scrollByY(Ai,Ak)
},scrollByX:function(Ai,Ak){var Aj=Ac()+Math[Ai<0?"floor":"ceil"](Ai),Al=Aj/(u-AK);
x(Al*J,Ak)
},scrollByY:function(Ai,Ak){var Aj=Aa()+Math[Ai<0?"floor":"ceil"](Ai),Al=Aj/(AA-U);
w(Al*I,Ak)
},positionDragX:function(Ai,Aj){x(Ai,Aj)
},positionDragY:function(Aj,Ai){w(Aj,Ai)
},animate:function(Aj,Am,Ai,Al){var Ak={};
Ak[Am]=Ai;
Aj.animate(Ak,{duration:AY.animateDuration,easing:AY.animateEase,queue:false,step:Al})
},getContentPositionX:function(){return Ac()
},getContentPositionY:function(){return Aa()
},getContentWidth:function(){return u
},getContentHeight:function(){return AA
},getPercentScrolledX:function(){return Ac()/(u-AK)
},getPercentScrolledY:function(){return Aa()/(AA-U)
},getIsScrollableH:function(){return Ae
},getIsScrollableV:function(){return AZ
},getContentPane:function(){return z
},scrollToBottom:function(Ai){w(I,Ai)
},hijackInternalLinks:B.noop,destroy:function(){G()
}});
AS(o)
}E=B.extend({},B.fn.jScrollPane.defaults,E);
B.each(["arrowButtonSpeed","trackClickSpeed","keyboardSpeed"],function(){E[this]=E[this]||E.speed
});
return this.each(function(){var F=B(this),G=F.data("jsp");
if(G){G.reinitialise(E)
}else{B("script",F).filter('[type="text/javascript"],:not([type])').remove();
G=new D(F,E);
F.data("jsp",G)
}})
};
B.fn.jScrollPane.defaults={showArrows:false,maintainPosition:true,stickToBottom:false,stickToRight:false,clickOnTrack:true,autoReinitialise:false,autoReinitialiseDelay:500,verticalDragMinHeight:0,verticalDragMaxHeight:99999,horizontalDragMinWidth:0,horizontalDragMaxWidth:99999,contentWidth:C,animateScroll:false,animateDuration:300,animateEase:"linear",hijackInternalLinks:false,verticalGutter:4,horizontalGutter:4,mouseWheelSpeed:0,arrowButtonSpeed:0,arrowRepeatFreq:50,arrowScrollOnHover:false,trackClickSpeed:0,trackClickRepeatFreq:70,verticalArrowPositions:"split",horizontalArrowPositions:"split",enableKeyboardNavigation:true,hideFocus:false,keyboardSpeed:0,initialDelay:300,speed:30,scrollPagePercent:0.8}
})(jQuery,this);
(function(K,M,N,D,F){var B=K("<div>")[0],H=/url\(["']?(.*?)["']?\)/,L=[],J={top:0,left:0,bottom:1,right:1,center:0.5};
if("backgroundSize" in B.style&&!K.debugBGS){return 
}K.cssHooks.backgroundSize={set:function(Q,S){var U=!K.data(Q,"bgsImg"),T,R,P;
K.data(Q,"bgsValue",S);
if(U){L.push(Q);
K.refreshBackgroundDimensions(Q,true);
R=K("<div>").css({position:"absolute",zIndex:-1,top:0,right:0,left:0,bottom:0,overflow:"hidden"});
P=K("<img>").css({position:"absolute"}).appendTo(R),R.prependTo(Q);
K.data(Q,"bgsImg",P[0]);
T=(K.css(Q,"backgroundPosition")||K.css(Q,"backgroundPositionX")+" "+K.css(Q,"backgroundPositionY")).split(" ");
K.data(Q,"bgsPos",[J[T[0]]||parseFloat(T[0])/100,J[T[1]]||parseFloat(T[1])/100]);
K.css(Q,"zIndex")=="auto"&&(Q.style.zIndex=0);
K.css(Q,"position")=="static"&&(Q.style.position="relative");
K.refreshBackgroundImage(Q)
}else{K.refreshBackground(Q)
}},get:function(P){return K.data(P,"bgsValue")||""
}};
K.cssHooks.backgroundImage={set:function(P,Q){return K.data(P,"bgsImg")?K.refreshBackgroundImage(P,Q):Q
}};
K.refreshBackgroundDimensions=function(S,Q){var P=K(S),R={width:P.innerWidth(),height:P.innerHeight()},U=K.data(S,"bgsDim"),T=!U||R.width!=U.width||R.height!=U.height;
K.data(S,"bgsDim",R);
if(T&&!Q){K.refreshBackground(S)
}};
K.refreshBackgroundImage=function(T,U){var R=K.data(T,"bgsImg"),S=(H.exec(U||K.css(T,"backgroundImage"))||[])[1],W=R&&R.src,V=S!=W,Q,P;
if(V){R.style.height=R.style.width="auto";
R.onload=function(){var X={width:R.width,height:R.height};
if(X.width==1&&X.height==1){return 
}K.data(T,"bgsImgDim",X);
K.data(T,"bgsConstrain",false);
K.refreshBackground(T);
R.style.visibility="visible";
R.onload=null
};
R.style.visibility="hidden";
R.src=S;
if(R.readyState||R.complete){R.src="data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///ywAAAAAAQABAAACAUwAOw==";
R.src=S
}T.style.backgroundImage="none"
}};
K.refreshBackground=function(R){var X=K.data(R,"bgsValue"),S=K.data(R,"bgsDim"),T=K.data(R,"bgsImgDim"),P=K(K.data(R,"bgsImg")),W=K.data(R,"bgsPos"),U=K.data(R,"bgsConstrain"),V,Z=S.width/S.height,Q=T.width/T.height,Y;
if(X=="contain"){if(Q>Z){K.data(R,"bgsConstrain",(V="width"));
Y=D.floor((S.height-S.width/Q)*W[1]);
P.css({top:Y});
if(V!=U){P.css({width:"100%",height:"auto",left:0})
}}else{K.data(R,"bgsConstrain",(V="height"));
Y=D.floor((S.width-S.height*Q)*W[0]);
P.css({left:Y});
if(V!=U){P.css({height:"100%",width:"auto",top:0})
}}}else{if(X=="cover"){if(Q>Z){K.data(R,"bgsConstrain",(V="height"));
Y=D.floor((S.height*Q-S.width)*W[0]);
P.css({left:-Y});
if(V!=U){P.css({height:"100%",width:"auto",top:0})
}}else{K.data(R,"bgsConstrain",(V="width"));
Y=D.floor((S.width/Q-S.height)*W[1]);
P.css({top:-Y});
if(V!=U){P.css({width:"100%",height:"auto",left:0})
}}}}};
var A=K.event,C,G={_:0},E=0,I,O;
C=A.special.throttledresize={setup:function(){K(this).on("resize",C.handler)
},teardown:function(){K(this).off("resize",C.handler)
},handler:function(S,P){var R=this,Q=arguments;
I=true;
if(!O){K(G).animate(G,{duration:Infinity,step:function(){E++;
if(E>C.threshold&&I||P){S.type="throttledresize";
A.dispatch.apply(R,Q);
I=false;
E=0
}if(E>9){K(G).stop();
O=false;
E=0
}}});
O=true
}},threshold:1};
K(M).on("throttledresize",function(){K(L).each(function(){K.refreshBackgroundDimensions(this)
})
})
})(jQuery,window,document,Math);
(function(B,C){function A(E){this.$container=E;
this.$letterBar=this.$container.find(".js-letter-bar");
this.$wordList=this.$container.find(".js-wordlist");
this.$filter=this.$container.find(".js-filter");
this.$contentArea=this.$container.find(".js-content");
this.contentUrl=this.$container.attr("data-glossary-url");
this.content={};
this.letters="abcdefghijklmnopqrstuvwxyzäöü".split("");
this.letters.push("0-9");
var D=this;
this.loadContent(function(F){D.parseContent(F);
D.initWordList();
D.paintLetterBar();
D.initLetterBar();
D.initFilter();
B(document).trigger("dom_changed",B(".fancybox-inner"))
})
}A.prototype.loadContent=function(D){B.getJSON(this.contentUrl,function(E){if(D){D(E)
}}).error(function(){alert("Could not load the glossary data")
})
};
A.prototype.parseContent=function(F){F=_.sortBy(F,function(I){return I.title
});
var D={};
for(var E in F){var H=F[E];
var G=H.title;
_.each(H.keys,function(I){var J=I.toLowerCase();
if(!D[J]){D[J]={}
}D[J][G]=H
})
}this.content=D
};
A.prototype.initWordList=function(){var D=this;
this.$wordList.on("click","a",function(){B(this).parents("ul").find("a.active").removeClass("active");
B(this).addClass("active");
var H=B(this).text();
var G=D.word2letter(H);
var F="<h2>"+D.content[G][H].title+"</h2>";
if(B.isArray(D.content[G][H].content)){for(var E=0;
E<D.content[G][H].content.length;
E++){F+="<p>"+D.content[G][H].content[E].text+"</p>"
}}else{F+=D.content[G][H].content
}D.$contentArea.html(F);
B(".verticalScroll").jScrollPane({verticalDragMinHeight:42,verticalDragMaxHeight:42,hideFocus:true});
return false
})
};
A.prototype.paintLetterBar=function(){var D=this;
var G=B('<li><a href="#" class="js-all">All Entries</a></li>');
this.$letterBar.append(G);
for(var E=0;
E<this.letters.length;
E++){var F=this.letters[E];
var G=B('<li><a href="#">'+F+"</a></li>");
if(!this.content[F]){G.find("a").addClass("disabled")
}this.$letterBar.append(G)
}};
A.prototype.initLetterBar=function(){var D=this;
var E=this.$letterBar.find("a");
E.click(function(F){F.preventDefault();
if(B(".intro-glossary").css("display")=="block"){B(".intro-glossary").css("display","none");
B(".left-nav").css("display","block");
B(".main-content").css("display","block");
B(document).trigger("dom_changed",B(".fancybox-inner"))
}if(B(this).is(".disabled")){return false
}D.$letterBar.find("a").removeClass("active");
B(this).addClass("active");
D.populateWordList("");
D.updateFilter();
B(document).trigger("dom_changed",B(".fancybox-inner"));
return false
})
};
A.prototype.populateWordList=function(D){this.$wordList.empty();
this.$filter.val(D);
var G=this.$letterBar.find("a.active");
if(!G.is(".js-all")){var E=this.word2letter(G.text());
for(var F in this.content[E]){this.appendWord(D,this.content[E][F])
}}else{for(var E in this.content){for(var F in this.content[E]){this.appendWord(D,this.content[E][F])
}}}if(D===""){this.$wordList.find("a:first").click()
}};
A.prototype.appendWord=function(D,E){if(D!=""&&!_.contains(E.categories,D)){return 
}var F=B('<li><a href="#">'+E.title+"</a></li>");
this.$wordList.append(F)
};
A.prototype.initFilter=function(){var D=this;
this.$filter.change(function(){D.populateWordList(B(this).val())
})
};
A.prototype.updateFilter=function(){var D=this;
var H=this.$letterBar.find("a.active");
this.$filter.find("option:gt(0)").attr("disabled","disabled");
var E={};
if(!H.is(".js-all")){var F=this.word2letter(H.text());
for(var G in this.content[F]){_.each(this.content[F][G].categories,function(I){if(!E[I]){D.$filter.find("option[value="+I+"]").removeAttr("disabled");
E[I]=true
}})
}return 
}for(var F in this.content){for(var G in this.content[F]){_.each(this.content[F][G].categories,function(I){if(!E[I]){D.$filter.find("option[value="+I+"]").removeAttr("disabled");
E[I]=true
}})
}}};
A.prototype.word2letter=function(D){return D[0].toLowerCase()
};
B.fn.glossary=function(){return this.each(function(){new A(B(this))
})
};
B(document).on("ajax_inserted dom_loaded",function(E,D){B(D).find(".js-glossary").glossary()
})
})(jQuery,window);
(function(A,C,B){function D(F){this.$container=F;
this.contentUrl=this.$container.attr("data-json-url");
this.content={};
this.foldoutsToggle;
var E=this;
this.loadContent(function(G){E.content=G;
E.createFoldoutsToggle();
E.populateSections()
})
}D.prototype.createFoldoutsToggle=function(){this.foldoutsToggle='<form class="frm" novalidate="novalidate">';
this.foldoutsToggle+='<label class="labelbox">';
this.foldoutsToggle+='<input class="btnFoldout checkbox" name="toggle_foldouts" type="checkbox" value="1" />';
this.foldoutsToggle+=this.$container.data("toggle-label");
this.foldoutsToggle+="</label></form>"
};
D.prototype.loadContent=function(E){A.getJSON(this.contentUrl,function(F){if(E){E(F)
}}).error(function(){alert("Could not load the faq data")
})
};
D.prototype.populateSections=function(){this.$container.empty();
for(var J in this.content){var I=A("<section>");
I.append('<h1 class="sectiontitle">'+J+"</h1>");
var F=A('<div class="foldouts" data-component="con_flex_foldout_2col">');
F.append(this.foldoutsToggle);
var G=this.content[J];
for(var H in G){var E=A("<details>").append("<summary>"+H+"</summary>").append('<div class="inner">'+G[H]+"</div>");
F.append(E)
}I.append(F);
this.$container.append(I)
}A(C).trigger("ajax_inserted",this.$container);
A(C).trigger("dom_changed",A(".fancybox-inner"))
};
A.fn.faq=function(){return this.each(function(){new D(A(this))
})
};
A(document).on("ajax_inserted dom_loaded",function(F,E){A(E).find(".js-faq").faq()
})
})(jQuery,document,window);
(function(E,F){var C="js-navdistributor";
var B=true;
var D=200;
function A(H){this.$el=H;
this.$nav=this.$el.find(".js-navlist");
this.$el.data(C,this);
this.contentUrl="/js/data/navdistributor.json";
this.content={};
this.currentUrl="";
var G=this;
this.loadContent(function(J){G.content=J;
var K="/";
var I=E('<ul rel="'+K+'">').appendTo(G.$nav);
G.buildNav(I,J,K);
G.loadForUrl(G.toLoad?G.toLoad:"")
})
}A.prototype.loadContent=function(G){E.getJSON(this.contentUrl,function(H){if(G){G(H)
}}).error(function(){alert("Could not load the navdistributor data")
})
};
A.prototype.treeFromItem=function(H){if(H==="/"){return this.content
}var K=H.split("/");
delete K[0];
var J=this.content;
for(var G in K){var I=K[G];
if(J.pages&&J.pages[I]){J=J.pages[I];
continue
}return false
}return J
};
A.prototype.buildNav=function(K,J,O){var H=J.pages?J.pages:{};
for(var M in H){var N=H[M];
if(!N.teaser){var L=E('<li><a href="'+N.url+'">'+N.label+"</a></li>")
}else{var L=E('<li><a href="#distributor'+N.url+'">'+N.label+"</a></li>")
}K.append(L);
if(N.pages){var I=E('<ul rel="'+O+M+'/">').hide().appendTo(this.$nav);
var G=O.split("/").length-1;
I.css("left",(G*D)+"px");
this.buildNav(I,N,O+M+"/")
}}};
A.prototype.loadForUrl=function(G){var I=G==="";
if(I){G="/"
}var H=this.treeFromItem(G);
if(G==="/"&&window.location.toString().indexOf("#distributor")===-1){B=false;
window.location+="#distributor";
setTimeout(function(){B=true
},1000);
return 
}if(G!=="/"&&H!==false&&!H.teaser){window.location=H.url;
return 
}this.switchNav(G)
};
A.prototype.switchNav=function(G){if(G===this.currentUrl){return 
}var H=-1;
if(this.currentUrl&&G.toString().split("/").length>this.currentUrl.toString().split("/").length){H=2
}if(G==="/"){H=2
}this.$nav.find("ul:visible").animate({left:H*D},1000,function(){E(this).hide()
});
if(G!=="/"){G+="/"
}this.$nav.find('ul[rel="'+G+'"]').show().animate({left:0},1000);
this.currentUrl=G
};
E.fn.navdistributor=function(){return this.each(function(){new A(E(this))
})
};
E(document).on("ajax_inserted dom_loaded",function(H,G){E(G).find("."+C).navdistributor()
});
E(document).on("nav_distributor_update",function(J,I,G){var H=E(I).find("."+C);
if(H.length>0&&B){var K=H.data(C);
K.toLoad=G;
K.loadForUrl(G)
}})
})(jQuery,window);
(function(A,B){A.fn.tabs=function(C){A(this).find(".pane:not(:first-child)").addClass("visuallyhidden");
A(".tabs nav a").eq(0).addClass("current")
};
A(document).on("ajax_inserted dom_loaded",function(D,C){A(C).find(".tabs").each(function(F,G){var E=A(G);
if(!E.data("tabset-mark")){E.data("tabset-mark","true").tabs();
E.find(".tabPanes").removeClass("visuallyhidden")
}})
})
})(jQuery,window);
/* Copyright (c) 2011 Brandon Aaron (http://brandonaaron.net)
 * Licensed under the MIT License (LICENSE.txt).
 *
 * Thanks to: http://adomas.org/javascript-mouse-wheel/ for some pointers.
 * Thanks to: Mathias Bank(http://www.mathias-bank.de) for a scope bug fix.
 * Thanks to: Seamus Leahy for adding deltaX and deltaY
 *
 * Version: 3.0.6
 * 
 * Requires: 1.2.2+
 */
(function(D){var B=["DOMMouseScroll","mousewheel"];
if(D.event.fixHooks){for(var A=B.length;
A;
){D.event.fixHooks[B[--A]]=D.event.mouseHooks
}}D.event.special.mousewheel={setup:function(){if(this.addEventListener){for(var E=B.length;
E;
){this.addEventListener(B[--E],C,false)
}}else{this.onmousewheel=C
}},teardown:function(){if(this.removeEventListener){for(var E=B.length;
E;
){this.removeEventListener(B[--E],C,false)
}}else{this.onmousewheel=null
}}};
D.fn.extend({mousewheel:function(E){return E?this.bind("mousewheel",E):this.trigger("mousewheel")
},unmousewheel:function(E){return this.unbind("mousewheel",E)
}});
function C(J){var H=J||window.event,G=[].slice.call(arguments,1),K=0,I=true,F=0,E=0;
J=D.event.fix(H);
J.type="mousewheel";
if(H.wheelDelta){K=H.wheelDelta/120
}if(H.detail){K=-H.detail/3
}E=K;
if(H.axis!==undefined&&H.axis===H.HORIZONTAL_AXIS){E=0;
F=-1*K
}if(H.wheelDeltaY!==undefined){E=H.wheelDeltaY/120
}if(H.wheelDeltaX!==undefined){F=-1*H.wheelDeltaX/120
}G.unshift(J,K,F,E);
return(D.event.dispatch||D.event.handle).apply(this,G)
}})(jQuery);
window.log=function(){log.history=log.history||[];
log.history.push(arguments);
if(this.console){arguments.callee=arguments.callee.caller;
var A=[].slice.call(arguments);
(typeof console.log==="object"?log.apply.call(console.log,console,A):console.log.apply(console,A))
}};
(function(A){function D(){}for(var C="assert,clear,count,debug,dir,dirxml,error,exception,firebug,group,groupCollapsed,groupEnd,info,log,memoryProfile,memoryProfileEnd,profile,profileEnd,table,time,timeEnd,timeStamp,trace,warn".split(","),B;
B=C.pop();
){A[B]=A[B]||D
}})((function(){try{console.log();
return window.console
}catch(A){return window.console={}
}})());
(function(B,A,C){B(document).ready(function(){var D=B(document);
D.on("dom_loaded ajax_inserted",function(F,E){B(E).find(".js_background_cover").each(function(){B(this).css("background-size","cover")
})
});
D.trigger("dom_loaded",D)
});
window.docRoot=window.location.protocol==="file:"?".":"/"
})(jQuery,window,document);
(function(B,D,C){var A=Backbone.Router.extend({cachedUrls:[],routes:{"overlay/load/*url":"loadOverlay","overlay/close":"closeOverlay","tab/:id/*url":"loadTab","tab/:id":"loadTab","distributor*url":"updateDistributor"},updateDistributor:function(E){B(C).trigger("nav_distributor_update",[C,E])
},loadOverlay:function(G){var F,E;
E=G.indexOf("#")!==0?D.docRoot+G:G;
F=this._overlayCustomSize(G,{href:E,type:"ajax"});
this.$overlay=B.fancybox(F)
},_overlayCustomSize:function(F,E){if(F.indexOf("width=")>0){E.width=this._getSize("width",F)
}if(F.indexOf("width=")>0){E.height=this._getSize("height",F)
}if(F.indexOf("fullscreen=true")>0){E.width="100%";
E.height="100%";
E.wrapCSS="fullscreen"
}if(F.indexOf("tabs=true")>0){E.wrapCSS="tabs"
}if(E.width||E.height){E.autoSize=false;
E.wrapCSS="custom"
}if(F.indexOf("opentab=")>0){E.helpers=B.extend(B.fancybox.defaults.helpers,{openTab:this._getParameter("opentab",F)})
}return E
},_getParameter:function(H,E){var G,F;
F=new RegExp(H+"=[0-9a-z]+");
G=E.match(F)[0].split("=")[1];
return G
},_getSize:function(H,E){var G,F;
F=new RegExp(H+"=[0-9a-z]+");
G=E.match(F)[0].split("=")[1];
G=isNaN(parseInt(G))?G:parseInt(G);
G=G==="full"?"100%":G;
return G
},closeOverlay:function(){B.fancybox.close();
this.navigate("")
},loadTab:function(J,G){var I=B("#"+J);
var F=I.parents(".tabs");
var H=F.find(".tabNavigation a");
H.removeClass("current");
F.find(".pane").addClass("visuallyhidden");
H.filter("[rel="+J+"]").addClass("current");
if(G&&_.indexOf(this.cachedUrls,G)===-1){var E=this;
I.empty().append('<div class="icon-loading">Loading</div>').load(D.docRoot+G,function(M,K,L){if(K!=="error"){E.cachedUrls.push(G)
}})
}I.removeClass("visuallyhidden")
}});
B(function(){D.Overlayer=new A();
Backbone.history.start()
})
})(jQuery,window,document);
var audi_ngw=audi_ngw||{};
var audi_ngw_default_opts={animation:{emointro:{}},api:{iframe:{},flash:{}},breadcrumb:{},flash:{config:{expressInstall:"/cms4i/cms4i/swf/expressInstall.swf",flashSelector:".flashfallback",flashVersion:"9.0.28",idCounter:0},objects:[]},gallery:{},navigation:{},region:{},track:{},videoplayer:{}};
jQuery.extend(audi_ngw,audi_ngw_default_opts);
var audi_vdt=audi_vdt||{};
jQuery.extend(audi_vdt,{video:{}});
var flash={error:function(A){console.log("[ERR flash2js] "+A)
},log:function(A){console.log("[LOG flash2js] "+A)
}};
audi_ngw.flash.idHelper=function(A){return A+"_"+(audi_ngw.flash.config.idCounter++)
},audi_ngw.flash.embedHelper=function(A,F,B,J,H,I,E,C,D){try{swfobject.embedSWF(A,F,B,J,H,I,E,C,D)
}catch(G){console.log(G)
}};
audi_ngw.flash.initiate=function(){if(swfobject.hasFlashPlayerVersion(audi_ngw.flash.config.flashVersion)){$(audi_ngw.flash.config.flashSelector).each(function(){audi_ngw.flash.initiateLocal($(this))
});
$(document).trigger("flash_supported")
}else{$(".flashfallback").css("visibility","visible");
$(document).trigger("flash_not_supported")
}};
audi_ngw.flash.initiateLocal=function(E){E.parent().attr("id",audi_ngw.flash.idHelper(E.parent().attr("id")));
var F={parent_id:E.parent().attr("id"),src:E.data("src"),videoFile:E.data("videofile"),mp3file:E.data("mp3file"),fontClass:typeof (E.data("fontClass"))==="undefined"?"Western":E.data("fontClass"),fontUrl:typeof (E.data("fontUrl"))==="undefined"?"/cms4i/cms4i/swf/fonts/western.swf":E.data("fontUrl"),scale:typeof (E.data("scale"))==="undefined"?"noScale":E.data("scale"),expressInstall:audi_ngw.flash.config.expressInstall,showControls:true};
if(E.data("xmldata")){F.xmldata=E.data("xmldata")
}var D=E.data("flashvars");
if(typeof D==="string"){var A=D.replace(/'/g,'"');
D=JSON.parse(A)
}if(typeof D==="object"){for(var C in D){F[C]=D[C]
}}var G={allowScriptAccess:typeof (E.data("allowScriptAccess"))==="undefined"?"always":E.data("allowScriptAccess"),allowFullScreen:typeof (E.data("allowFullScreen"))==="undefined"?"true":E.data("allowFullScreen"),scale:F.scale,menu:typeof (E.data("menu"))==="undefined"?"false":E.data("menu"),wmode:typeof (E.data("wmode"))==="undefined"?"opaque":E.data("wmode")};
var B={height:typeof (E.data("height"))!=="undefined"?E.data("height"):(typeof (E.attr("height"))!=="undefined"?E.attr("height"):E.height()),width:typeof (E.data("width"))!=="undefined"?E.data("width"):(typeof (E.attr("width"))!=="undefined"?E.attr("width"):E.width()),src:F.src,version:typeof (E.data("flashversion"))==="undefined"?audi_ngw.flash.config.flashVersion:E.data("flashversion")};
audi_ngw.flash.embedHelper(B.src,F.parent_id,B.width,B.height,B.version,F.expressInstall,F,G,B);
audi_ngw.flash.objects.push(F.parent_id)
};
audi_ngw.flash.pageLoaded=function(B){var A=$("#"+B)[0];
$(document).trigger("dom_changed",$(".fancybox-inner"))
};
audi_ngw.flash.pauseAll=function(){jQuery(audi_ngw.flash.objects).each(function(){audi_ngw.flash.pause(String(this))
})
};
audi_ngw.flash.pause=function(B){try{$("#"+B)[0].freeze()
}catch(A){}};
audi_ngw.flash.resumeAll=function(){jQuery(audi_ngw.flash.objects).each(function(){audi_ngw.flash.resume(String(this))
})
};
audi_ngw.flash.resume=function(B){try{$("#"+B)[0].unfreeze()
}catch(A){}};
audi_ngw.flash.allSoundOff=function(){$(audi_ngw.flash.objects).each(function(){audi_ngw.flash.soundOff(String(this))
})
};
audi_ngw.flash.soundOff=function(A){$("#"+A)[0].soundOff()
};
audi_ngw.flash.allSoundOn=function(){$(audi_ngw.flash.objects).each(function(){audi_ngw.flash.soundOn(String(this))
})
};
audi_ngw.flash.soundOn=function(A){$("#"+A)[0].soudnOn()
};
audi_ngw.gallery.clickVideo=function(B,E){var C=$(B).data("videofile");
var A=$(B).closest(".slides").find(".js-flash-gallery object")[0];
try{A.stopPlayback();
A.playVideo(C,"","",false)
}catch(D){}};
audi_vdt.video.onResize=function(B,A){};
audi_ngw.flash.onScroll=function(A){};
audi_ngw.breadcrumb._updateFlash=function(){};
audi_ngw.gallery.clickRingtone=function(A,C){var B=A.data("mp3file")
};
audi_ngw.gallery.click=function(A){var B=$(A).closest(".audi_gallery_items").data("gallerytype");
switch(B){case"video":audi_ngw.gallery.clickVideo($(A),"galleryvideocontainer");
break;
case"ringtone":audi_ngw.gallery.clickRingtone($(A),"galleryvideocontainer");
break;
default:flash.error("Unknown gallery type: "+B)
}};
audi_ngw.api.iframe.updated=function(){};
audi_ngw.api.iframe.height=function(A){};
audi_ngw.api.flash.width=function(B,A){};
audi_ngw.api.flash.height=function(B,A){};
audi_ngw.api.openModal=function(A,B){};
audi_ngw.api.openDetail=function(A,B){};
audi_ngw.api.openAdvice=function(A,B){};
audi_ngw.api.openLogin=function(A,B){};
audi_ngw.api.track=function(A,B,C){};
audi_ngw.videoplayer.onStartPlayback=function(A){};
audi_ngw.videoplayer.onPlaybackComplete=function(A){};
audi_ngw.animation.emointro.onMovieComplete=function(){$(".emointro").data("makefixed","true");
$(".emointro").addClass("open")
};
audi_ngw.region.show=function(){};
audi_ngw.navigation.historyLoad=function(A){};
audi_ngw.track.flashTrack=function(A){};
$(document).on("nav_over",function(B,A){audi_ngw.flash.pauseAll()
});
$(document).on("nav_out",function(B,A){audi_ngw.flash.resumeAll()
});
$(document).on("gallery_click",function(B,A){audi_ngw.gallery.click(A)
});
(function(A,B){A(document).on("dom_loaded ajax_inserted",function(D,C){A("#models > section, #navigation > ul > li, .logo, .emointro").hover(function(){A(document).trigger("nav_over",A(this))
},function(){A(document).trigger("nav_out",A(this))
});
A(".audi_gallery_items a").click(function(F,E){A(document).trigger("gallery_click",A(this));
F.preventDefault()
});
audi_ngw.flash.initiate();
window.setTimeout(function(){A(audi_ngw.flash.objects).each(function(){var E=String(this);
audi_ngw.flash.pageLoaded(E)
})
},2000)
})
})(jQuery,window);
(function(A,B){A(document).on("click","summary",function(C){if(A("html").hasClass("details")){A(this).parent().toggleClass("open")
}});
A(document).on("ajax_inserted dom_loaded",function(E,D){var C=A("details");
A("html").addClass(A.fn.details.support?"details":"no-details");
C.details();
C.filter('[open="open"]').addClass("open")
})
})(jQuery,window);
(function(A,B){A.fn.flyout=function(){var C=A(this);
var E=C.find(".nemo_search #searchstring");
function D(){setTimeout(function(){C.removeClass("active");
C.find("a:first").removeClass("menuItem");
C.find(".flyout").hide()
},20)
}C.on("mouseenter",function(){if(C.parent().children(".active").length>0){C.find(".flyout").show()
}else{C.find(".flyout").slideDown()
}C.find("a:first").addClass("menuItem");
C.addClass("active")
}).on("mouseleave",function(){if(E){if(!E.is(":focus")){D()
}}else{D()
}}).find(".nav a").on("mouseenter",function(){A(this).closest("div.col").next().children("article").addClass("visuallyhidden").eq(A(this).closest("li").index()).removeClass("visuallyhidden")
}).end()
};
A(document).on("dom_loaded",function(D,C){A(C).find(".nestingList").each(function(){A(this).flyout()
})
})
})(jQuery,window);
(function(A,B){A(document).on("click","input.btnFoldout",function(D){var C,E;
C=A(this).closest(".foldouts").find("details");
E=A(this).is(":checked");
if(A("html").hasClass("details")){C.attr("open",E);
if(E){C.addClass("open")
}else{C.removeClass("open")
}}else{if(E){C.find('summary[aria-expanded="false"]').trigger("click")
}else{C.find('summary[aria-expanded="true"]').trigger("click")
}C.find("summary").first().focus()
}});
A(document).on("click","summary",function(C){})
})(jQuery,window);
(function(A,B){A(document).on("click",".teaserNews .toggle, .dealerAddress.teaserNews > .arrow, .teaserNews .js-toggle-slider",function(C){var D;
C.preventDefault();
D=A(this).closest(".teaserNews").find(".list");
D.slideToggle()
})
})(jQuery,window);
(function(A,B){function C(F){var D,E;
D=F.find("li a").clone();
E=A('<div class="newsSlides">');
E.html(A('<div class="slidesContainer">').append(D));
F.hide();
F.after(E);
E.slides({container:"slidesContainer",pagination:false,generatePagination:false,play:5000,slideSpeed:100,hoverPause:false,effect:"fade"})
}A.fn.newsSlider=function(){return this.each(function(){new C(A(this))
})
};
A(document).on("dom_loaded",function(E,D){A(D).find(".teaserNews .list:not(.noSlider)").newsSlider()
})
})(jQuery,window);
(function(A,B){A.fn.activateClickTrack=function(){var C=A(this);
if(!C.data("track-click-activated")){C.on("click",function(){C.trackLink()
}).data("track-click-activated",true)
}};
A(document).on("dom_loaded ajax_inserted",function(D,C){A(C).find(".track-click").each(function(){A(this).activateClickTrack()
})
})
})(jQuery,window);
(function(A,B){A.fn.trackTeasers=function(){function F(M){if(M==null||!M.match("s=[0-9]+;")){return null
}var L=M.split(";")[0].split("=")[1];
var K={s:L,carlines:[],carlinegroups:[]};
A.each(M.split(";")[1].split("|"),function(N,P){var O=P.split("=");
if(O[0].indexOf("carlinegroup")==0){K.carlinegroups.push({name:O[0],value:O[1].split(",")[0],score:parseInt(O[1].split(",")[1])})
}else{if(O[0].indexOf("carline")==0){K.carlines.push({name:O[0],value:O[1].split(",")[0],score:parseInt(O[1].split(",")[1])})
}}});
return K
}function I(L){var K=[];
A(L).find("div.inner").each(function(M,N){A(this).hide();
K.push({carlinegroup:A(N).data("carlinegroup"),carline:A(N).data("carline"),scoreThreshold:A(N).data("scorethreshold"),div:this})
});
return K
}var C=A.cookie("audi_bt");
C=decodeURIComponent(C);
var D=F(C);
var E=I(this);
var H=null;
if(D!=null&&D.s){var J=-1;
A.each(D.carlines,function(K,L){A.each(E,function(N,M){if(L.value===M.carline){if(L.score>J&&L.score>=M.scoreThreshold){H=M;
J=M.scoreThreshold
}}})
});
if(H==null){J=-1;
A.each(D.carlinegroups,function(K,L){A.each(E,function(N,M){if(L.value===M.carlinegroup){if(L.score>J&&L.score>=M.scoreThreshold){H=M;
J=M.scoreThreshold
}}})
})
}}if(H!=null){A(H.div).show()
}else{var G=Math.floor(Math.random()*E.length);
A(E[G].div).show()
}};
A.fn.trackVisibleTeasers=function(){var F=A(this);
var C=new Array();
for(var E=0;
E<F.length;
E++){var G=A(F[E]).data("tracking");
if(G&&G.trackers[0]&&G.trackers[0].tracking_options&&G.trackers[0].tracking_options.lists){var D=G.trackers[0].tracking_options.lists.filter(function(H){if(H.key=="list1"){C.push(H.value)
}})
}}s.list1=C.join(",");
s.events="event32";
/*s.t()*/
};
A(document).on("dom_loaded ajax_inserted",function(D,C){A(C).find(".teaser.personalized").each(function(){A(this).trackTeasers()
});
A(C).find(".teaser:not(.personalized):visible, .teaser.personalized .inner:visible").trackVisibleTeasers()
})
})(jQuery,window);
(function(A,B){A.fn.audibar=function(){var G=A(this);
var F=A("#main");
if(F.length>0){var D=A(window).height();
var H=F.offset().top+F.height();
var E=40;
var C=D-(H+40);
if(C<0){G.removeClass("pos-static").addClass("pos-fixed")
}else{G.removeClass("pos-fixed").addClass("pos-static")
}}};
A(window).resize(function(){A("#footer").audibar()
});
A(document).on("dom_loaded ajax_inserted js-size-change",function(D,C){A("#footer").audibar()
})
})(jQuery,window);
(function(A,B){A.fn.tooltip=function(){var C=A(this);
if(!C.data("tooltip-set")){C.tipsy({gravity:function(){var E=A(this).offset().top>(A(document).scrollTop()+A(window).height()/2)?"s":"n";
var D=A(this).offset().left>(A(document).scrollLeft()+A(window).width()/2)?"e":"w";
return E+D
}});
C.data("tooltip-set","true")
}};
A(document).on("dom_loaded ajax_inserted",function(D,C){A(C).find(".toolTip").each(function(){A(this).tooltip()
})
})
})(jQuery,window);
(function(B){function A(E,H){var C="";
for(var G=0;
G<E.imageList.length;
G++){var F=(G+(E.currentIndex-1))%E.imageList.length;
C+=E.imageList[F]+","
}var D="{'close_button' : 'Schliessen', 'images' : '"+C+"'}";
var I=E.placeholder.clone();
I.find("img").attr("data-flashvars",D);
H.html(I);
audi_ngw.flash.initiateLocal(H.find("img"))
}B.fn.initFullscreen=function(){this.each(function(F,C){var D=this;
this.placeholder=B('<div class="flashfallback"><img/></div>');
var E=B(C).prev();
D.placeholder.attr("id",E.data("flashid"));
D.placeholder.find("img").attr("data-flashversion",E.data("flashversion")).attr("data-src",E.data("src")).attr("data-xmldata",E.data("xmldata")).attr("data-fontclass",E.data("fontclass")).attr("data-fonturl",E.data("fonturl")).attr("data-scale",E.data("scale")).attr("width",E.attr("width")).attr("height",E.attr("height"));
D.imageList=[];
D.currentIndex=1;
B(C).find("img").each(function(G,H){D.imageList.push(B(H).data("fullscreenurl")!=null?B(H).data("fullscreenurl"):B(H).attr("src"))
});
A(D,E)
})
};
B.fn.updateFullscreen=function(C){this.each(function(E,D){this.currentIndex=C;
A(this,B(D).prev())
})
};
B.fn.resetFullscreen=function(){this.each(function(D,C){B(C).prev().html("")
})
}
})(jQuery);
(function(A,B){A.fn.audiPrint=function(){var C=A(this);
C.on("click",function(D){D.preventDefault();
B.print()
})
};
A(document).on("dom_loaded ajax_inserted",function(D,C){A(C).find(".printbar a.print , .printDirectly").each(function(){A(this).audiPrint()
})
})
})(jQuery,window);
(function(C,D){function B(F,G){var I,H,E;
I=F+"_"+G.id;
H='<label for="'+I+'" class="label" data-dealersplit="true">';
H+='<input type="radio" name="'+F+'" id="'+I+'" value="'+G.id+'" />';
H+=G.name;
H+="</label>";
return H
}function A(H,E,G){C(H).html("");
if(G.dealers){for(var F in G.dealers){C(H).append("<li>"+B(E,G.dealers[F])+"</li>")
}C(document).trigger("ajax_inserted",C(H).closest("form"));
C(document).trigger("dom_changed",C(".fancybox-inner"))
}}C(document).on("click","a.js-search-dealer",function(I){var G,H,F,E;
I.preventDefault();
H=C(this).attr("data-target");
E=C("input.js-dealer-zipcode, input.js-dealer-location, input.js-dealer-name").serialize();
G=C(this).attr("href");
if(G.indexOf("?")>0){G+="&"
}else{G+="?"
}G+=E;
F=C(this).attr("data-fieldname");
C.getJSON(G,function(J){A(H,F,J)
}).error(function(J){alert("Could not load the data for the cascading dropdown")
})
})
})(jQuery,window);
var s=s||{};
audi_ngw.track={};
audi_ngw.track.onClick=function(A){if(A.hasClass("track_click")){return audi_ngw.config.onClickTrack(A.metadata().track_options)
}};
audi_ngw.track.flashTrack=function(A){return audi_ngw.config.onClickTrack(A)
};
audi_ngw.track.onAjaxLoad=function(A){if(A.hasClass("track_load")){return audi_ngw.config.onAjaxLoadTrack(A.metadata().track_options)
}};
audi_ngw.track.onClickStub=function(A){audi_ngw.log("## STUB: audi_ngw.track.onClickStub"+A)
};
audi_ngw.track.onAjaxLoadStub=function(A){audi_ngw.log("## STUB: audi_ngw.track.onAjaxLoadStub"+A)
};
audi_ngw.track.onAjaxModalContentReady=function(B,C){if(!audi_ngw.url.hasXHRContent(C,B.timeStamp)){return false
}var A="#";
A+=audi_ngw.url.getContentId();
A+=" .track_load";
$(A).each(function(){audi_ngw.track.onAjaxLoad(jQuery(this))
});
audi_ngw.event.trigger("ajaxModalContentPrepared")
};
audi_ngw.track.onAjaxSnippetReady=function(B,C){var A=C.sId;
A+=" .track_load";
$(A).each(function(){audi_ngw.track.onAjaxLoad(jQuery(this))
});
audi_ngw.event.trigger("ajaxSnippetPrepared")
};
audi_ngw.track.initiate=function(){this.__className="audi_ngw.track";
this.__classVersion="1.0";
audi_ngw.event.bind("ajaxModalContentReady.track",audi_ngw.track.onAjaxModalContentReady);
audi_ngw.event.bind("ajaxSnippetReady",audi_ngw.track.onAjaxSnippetReady)
};
(function(B,D,C){function A(E){this.$link=E;
this.replacements=E.data("replacement");
this.init()
}A.prototype.init=function(){var E=this;
this.$link.on("click",function(F){F.preventDefault();
E.replcaceContents()
})
};
A.prototype.replcaceContents=function(){if(this.replacements){for(var E in this.replacements){var G=this.replacements[E].target;
var F=this.replacements[E].content;
B(G).html(F)
}}};
B.fn.contentReplacment=function(){return this.each(function(){var E=B(this);
new A(E)
})
};
B(document).on("dom_loaded",function(F,E){B(E).find("a.js-contentReplacement").each(function(){B(this).contentReplacment()
})
})
})(jQuery,window,document);
(function(A,B){A.fn.audiAccordion=function(){var C=A(this);
C.find("section:not(.open, .toolbox) ul, li:not(.open) ul").hide().end().find("section:not(.open, .toolbox) h1, section:not(.open, .toolbox) li a").click(function(){A(this).parent().addClass("open").siblings(".open").removeClass("open").find(".current").removeClass("current").end().find("ul:visible").slideToggle();
A(this).addClass("current").siblings("ul").slideToggle()
})
};
A(document).on("dom_loaded ajax_inserted",function(D,C){A(C).find("nav.accordion").each(function(){A(this).audiAccordion()
})
})
})(jQuery,window);
(function(B,A,C){B.fn.languageSelector=function(){var D=B(this);
D.find("a").click(function(E){E.preventDefault();
B(this).parents(".languageselector").toggleClass("open")
}).end().find("select").change(function(){A.location=B(this).val()
})
};
B(document).on("dom_loaded ajax_inserted",function(E,D){B(D).find("footer .languageselector").each(function(){B(this).languageSelector()
})
})
})(jQuery,window,document);
(function(A,B){A.fn.gallerySlides=function(){var C=A(this);
C.slides({container:"slidesContainer",generatePagination:false,effect:"fade",crossfade:true,animationComplete:function(D){A(".fullScreenGallery").updateFullscreen(D)
},animationStart:function(){A(".fullScreenGallery").resetFullscreen()
},slidesLoaded:function(){A(".fullScreenGallery").initFullscreen();
A(document).trigger("slidesLoaded",C.find(".slides_control"))
}})
};
A(document).on("dom_loaded ajax_inserted",function(D,C){A(C).find(".slides").each(function(){A(this).gallerySlides()
});
A(document).trigger("js-size-change")
})
})(jQuery,window);
(function(A,B){A.fn.stageRotator=function(){var C=A(this);
C.slides({container:"slidesContainer",generatePagination:false,play:12000,slideSpeed:100,hoverPause:true,pause:3000,effect:"fade",crossfade:true})
};
A(document).on("dom_loaded ajax_inserted",function(D,C){A(C).find(".dealerStage").each(function(){A(this).stageRotator()
})
})
})(jQuery,window);
(function(A,B){A.fn.soundsPane=function(){var C=A(this);
C.find(".pagination li:first-child").addClass("current").end().find(".pagination a").click(function(D){A(this).parent().siblings(".current").removeClass("current");
A(this).parent().addClass("current");
A(this).parents(".slides").find("h2").text(A(this).attr("title")).end().find("p").text(A(this).attr("content")).end().find("audio").attr("src",A(this).attr("sound"));
D.preventDefault()
})
};
A(document).on("dom_loaded ajax_inserted",function(D,C){A(C).find(".js-sounds").each(function(){A(this).soundsPane()
})
})
})(jQuery,window);
(function(A,B){A.fn.galleryMultipleThumbnails=function(){var C=A(this);
C.find("> li .thumbsPagination").hide().end().find("> li:first-child .thumbsPagination").show().end().find("> li > a").addClass("accordion-closed").end().find("> li:first-child > a").removeClass("accordion-closed").addClass("accordion-open").end().parents(".slides").find(".actions").hide().eq(0).show().end().end().end().find("> li > a").click(function(D){A(this).parents(".galleryNavigation").find("> li .thumbsPagination").hide(400);
A(this).next(".thumbsPagination").show(400);
A(this).parents(".slides").find(".container").hide().end().find(".actions").hide();
A(this).parents(".slides").find(".container."+A(this).attr("rel")).show().end().find(".actions."+A(this).attr("rel")).show();
A(this).parents(".galleryNavigation").find(">li > a").removeClass("accordion-open").addClass("accordion-closed");
A(this).removeClass("accordion-closed").addClass("accordion-open");
D.preventDefault()
}).end().find("> li .pagination li:first-child").addClass("current").end().find("> li .pagination a").click(function(E){var D=parseInt(A(this).attr("href").replace("#",""))+1;
A(this).parent().siblings(".current").removeClass("current");
A(this).parent().addClass("current");
A(this).parents(".slides").find("h2").text(A(this).attr("title")).end().find("p").text(A(this).attr("content")).end().find("audio").attr("src",A(this).attr("sound")).end().find(".preview li").hide().end().find(".preview li:nth-child("+D+")").show();
E.preventDefault()
})
};
A(document).on("scroll_pane_set",function(D,C){A(C).find(".galleryNavigation").each(function(){A(this).galleryMultipleThumbnails()
})
})
})(jQuery,window);
(function(B,C){function A(D){D.slides({pagination:false,generatePagination:false,play:2000,slideSpeed:100,hoverPause:false,effect:"fade"})
}B.fn.rotationContainer=function(){return this.each(function(){new A(B(this))
})
};
B(document).on("ajax_inserted dom_loaded",function(E,D){B(D).find(".rotator").rotationContainer()
})
})(jQuery,window);
(function(B,C){function A(D){D.click(function(){B("video").each(function(){try{this.player.pause()
}catch(E){}});
B(this).closest(".slides").find(".counter span").html(B(this).parent().prevAll("li").length+1)
})
}B.fn.slidesPagination=function(){return this.each(function(){new A(B(this))
})
};
B(document).on("ajax_inserted dom_loaded",function(E,D){B(D).find(".slides .pagination li a").slidesPagination()
})
})(jQuery,window);
(function(B,C){function A(D){D.hover(function(){if(B(this).data("makefixed")!="true"){B(".emointro").toggleClass("open")
}},function(){if(B(this).data("makefixed")!="true"){B(".emointro").toggleClass("open")
}})
}B.fn.emointroHandle=function(){return this.each(function(){new A(B(this))
})
};
B(document).on("ajax_inserted dom_loaded",function(E,D){B(D).find(".emointro").emointroHandle()
})
})(jQuery,window);
(function(A,B){function C(D){D.addClass("open");
setTimeout(function(){D.removeClass("open")
},3000)
}A.fn.emointroShow=function(){return this.each(function(){new C(A(this))
})
};
A(document).on("ajax_inserted dom_loaded",function(E,D){A(D).find(".dealerStage .emointro").emointroShow()
})
})(jQuery,window);
(function(A,B){A(document).on("dom_loaded ajax_inserted",function(D,C){A(C).find(".paginationContainer").jScrollPane({horizontalDragMinWidth:42,horizontalDragMaxWidth:42,hideFocus:true});
A(C).find("body:not(.ar)").children(".verticalScroll").jScrollPane({verticalDragMinHeight:42,verticalDragMaxHeight:42,hideFocus:true});
A(document).trigger("scroll_pane_set",C)
})
})(jQuery,window);
(function(A,B){A.fn.video=function(){return this.each(function(){A(this).css("display","");
var E=A(this),D,C;
D=function(G){if(G.closest(".videostage").length){var I=G.attr("width"),F=G.attr("height"),H=I/F,K=G.closest(".videostage").width(),J=500;
if((K/H)>J){G.attr("height",J).attr("width",J*H)
}else{G.attr("height",K/H).attr("width",K)
}}C=function(){if(A(".ie7").length&&$video.closest(".primarycontent").length){var L=$mejsContainer.find(".mejs-overlay-button");
L.insertAfter($mejsContainer.next());
L.click(function(){mediaElement.play()
});
mediaElement.addEventListener("pause",function(M){L.show()
},false);
mediaElement.addEventListener("play",function(M){L.hide()
},false)
}};
G.mediaelementplayer({autosizeProgress:false,videoVolume:"vertical",startVolume:0.8,pluginPath:"/flash/libs/",success:function(L,M){var N=A(M),P=N.closest(".mejs-container"),O,Q;
O=(L.id)?jQuery("#"+L.id):jQuery(L);
P.find(".mejs-volume-current").css({top:"20%",height:"85px"}).next().css("top","20%");
L.addEventListener("pause",function(R){A(document).trigger("video_pause",[L,M])
},false);
L.addEventListener("play",function(R){A(document).trigger("video_play",[L,M])
},false);
L.addEventListener("ended",function(R){L.setCurrentTime(0);
P.find(".mejs-poster").show();
A(document).trigger("video_ended",[L,M])
},false);
P.find(".mejs-volume-button, .mejs-horizontal-volume-slider, .mejs-fullscreen-button").wrapAll('<span class="mejs-custom-rightcontrols"></span>');
Q=N.attr("data-title");
if(Q&&Q!==""){A('<div class="mejs-custom-title"><span>'+Q+"</span></div>").insertAfter(P.find(".mejs-controls .mejs-playpause-button"))
}C()
}})
};
if(!E.data("video-initialized")){D(E);
E.data("video-initialized",true)
}E.bind("loadeddata",function(){var F=A(this).prop("videoWidth"),G=A(this).prop("videoHeight")
})
})
};
A(document).on("ajax_inserted dom_loaded stage_resized tab_loaded fancybox_visible video_inserted",function(D,C){A("video").video()
})
}(jQuery,window));
(function(A,B){A.extend(A.fancybox.defaults,{margin:0,padding:0,closeBtn:false,fitToView:false,modal:true,openEffect:"fade",closeEffect:"fade",beforeShow:function(){},afterShow:function(){A(document).trigger("ajax_inserted",A(".fancybox-inner"));
A(".fancybox-skin").addClass("show");
A(document).scrollTop(0);
if(this.helpers.openTab){var C="#tab/"+this.helpers.openTab+"-1";
document.location.href=C
}},helpers:{overlay:{opacity:0.6,css:{"background-color":"#000"}}}});
A(document).on("dom_loaded dom_changed ajax_inserted",function(C,D){if(D&&A(D).hasClass("fancybox-inner")){A.fancybox.update();
A.fancybox.reposition()
}})
})(jQuery,window);
(function(A,B){A.fn.pagination=function(){var D=A(this).find("ul > li > a").eq(2).addClass("current");
A(this).find("ul > li > a.prev").hide().end().find("ul > li > a.first").hide();
function C(F){return F.parent().prev().children().eq(0)
}function E(F){return F.parent().next().children().eq(0)
}A(this).on("click","div a",function(I){I.preventDefault();
var H=A(this);
if(H.hasClass("prev")){var G=C(D);
if(G.hasClass("first")){return 
}H=G
}else{if(H.hasClass("next")){var G=E(D);
if(G.hasClass("last")){return 
}H=G
}else{if(H.hasClass("first")){H=E(H)
}else{if(H.hasClass("last")){H=C(H)
}}}}if(H.attr("href")==D.attr("href")){return 
}var F=H.attr("href");
A.ajax({type:"GET",url:F,success:function(J){H.closest("div.pagination").prev().replaceWith(J);
H.closest("ul").find("li > a").removeClass("current");
H.addClass("current");
D=H;
if(C(D).hasClass("first")){A("ul > li > a.prev").hide();
A("ul > li > a.next").show();
A("ul > li > a.first").hide();
A("ul > li > a.last").show()
}else{if(E(D).hasClass("last")){A("ul > li > a.next").hide();
A("ul > li > a.prev").show();
A("ul > li > a.last").hide();
A("ul > li > a.first").show()
}else{A("ul > li > a.prev").show();
A("ul > li > a.next").show();
A("ul > li > a.first").show();
A("ul > li > a.last").show()
}}},error:function(J){}})
})
};
A(document).on("dom_loaded",function(){A("div.pagination").each(function(C,D){A(D).pagination()
})
})
})(jQuery,window);
(function(A,B){A.fn.insertVideo=function(){function C(F){if(A(F).data("video-replaced")==true){return 
}var E=A(F).data("video");
var G=A("<video/>").attr("height",E.height).attr("width",E.width).attr("controls","controls").attr("preload","none").attr("poster",E.poster).append(A("<source/>").attr("src",E.films.mp4).attr("type","video/mp4")).append(A("<source/>").attr("src",E.films.webm).attr("type","video/webm")).append(A("<source/>").attr("src",E.films.ogv).attr("type","video/ogv"));
var D=A(F).closest("li").index();
A(F).closest("div.slides").find(".slidesContainer div.slides_control > div").eq(D).html(G);
A(F).data("video-replaced",true);
A(document).trigger("video_inserted")
}if(A(this).parent().hasClass("current")){C(this)
}else{A(this).on("click",function(E,D){C(this)
})
}};
A(document).on("dom_loaded ajax_inserted",function(D,C){A("a.js-videoReplacement").each(function(E,F){A(F).insertVideo()
})
})
}(jQuery,window));
(function(B,A,C){B.fn.wallpaperSelector=function(){var D=B(this);
D.find("a.commandLink").click(function(E){E.preventDefault();
B(this).next().toggle();
B(this).closest("li.wallpaper").toggleClass("open")
}).end().find("a.icons-close-small").click(function(E){E.preventDefault();
B(this).closest("article").hide().closest("li.wallpaper").removeClass("open")
})
};
B(document).on("dom_loaded ajax_inserted",function(E,D){B(D).find(".downloadselect.wallpaper").each(function(){B(this).wallpaperSelector()
})
})
})(jQuery,window,document);
(function(A,B){A(document).on("dom_loaded",function(D,C){A(C).find("ul.imagehover img").each(function(){A(this).adipoli({startEffect:"normal",hoverEffect:"popout",popOutMargin:25})
})
})
})(jQuery,window);
(function(A,B){A.fn.audio=function(){return this.each(function(){if(!A(this).data("audio-initialized")){A(this).mediaelementplayer({pluginPath:"../../flash/libs/",audioWidth:150,audioHeight:13});
A(this).data("audio-initialized",true)
}})
};
A(document).on("dom_loaded stage_resized tab_loaded fancybox_visible video_inserted",function(D,C){A("audio").audio()
})
}(jQuery,window));
(function(A,B){A.fn.captchaReload=function(){var C=A(this).data("url");
A(this).on("click",function(){A.ajax({url:C,success:function(D){A("#FormInput_CaptchaToken").val(D.token);
A("#FormCaptcha_Image").attr("src","data:image/png;base64,"+D.captcha)
},error:function(D){}})
})
};
A(document).on("ajax_inserted",function(D,C){A(C).find(".refreshCaptcha").each(function(){A(this).captchaReload()
})
})
})(jQuery,window);
(function(B,C){function D(E){if(E.tracker=="Omniture"){if(E.tracking_options){if(E.tracking_options.events){var F="";
B.each(E.tracking_options.events,function(H,G){F+=H>0?","+G:G
});
s.events=F
}if(E.tracking_options.props){B.each(E.tracking_options.props,function(H,G){s[G.key]=G.value
})
}if(E.tracking_options.evars){B.each(E.tracking_options.evars,function(H,G){s[G.key]=G.value
})
}if(E.tracking_options.campaign){s.campaign=E.tracking_options.campaign
}if(E.tracking_options.lists){B.each(E.tracking_options.lists,function(H,G){s[G.key]=G.value
})
}}return true
}return false
}function A(E){if(E.tracking_options){return E.tracking_options.eventTargetUrl
}return null
}B.fn.trackForm=function(){var E=B(this);
var F=E.data("tracking");
if(!(F&&F.trackers)){return 
}B.each(F.trackers,function(G,H){if(D(H)){if(s.t){s.t()
}}})
};
B.fn.trackLink=function(){var E=B(this);
var F=this;
var G=E.data("tracking");
if(!(G&&G.trackers)){return 
}B.each(G.trackers,function(H,I){if(D(I)){if(I.tracking_options.evars){s.t()
}else{if(s.tl){s.tl(F,"o",A(I))
}}}})
}
})(jQuery,window);
(function(A,C,B){A.fn.nemo_carousel=function(){var F=A(B);
var D=A(this);
function E(){var G=A("#header").height();
var H=D.width()/F.height();
if(H<1.5){D.find(".stage").height((D.width()/1.5)-G).width(D.width());
D.find(".js_morelink").hide()
}else{if(H>2){D.find(".stage").height((D.width()/2)-G).width(D.width());
D.find(".js_morelink").hide()
}else{D.find(".stage").height(F.height()-G).width(D.width());
D.find(".js_morelink").show()
}}D.find(".slides_control").height(D.find(".stage").height());
A(document).trigger("nemostage_resized",D)
}E();
F.on("resize",E);
D.slides({generateNextPrev:true,generatePagination:true});
D.find(".pagination").prependTo(D.find(".js_pagination_container")).show();
A(document).on("click",".js_morelink",function(H){H.preventDefault();
var G=A(H.currentTarget);
A("html,body").animate({scrollTop:G.offset().top+G.outerHeight()},400)
})
};
A(document).on("dom_loaded ajax_inserted",function(E,D){A(D).find(".nemo_carousel").each(function(){A(this).nemo_carousel()
})
})
})(jQuery,document,window);
(function(A,B){A(document).on("slidesLoaded",function(D,C){if(A("body").hasClass("ar")){A(C).each(function(){var E=parseInt(A(this).css("left"));
if(E<0){A(this).css("left",-E+"px")
}})
}})
})(jQuery,window);
(function(B,C){function A(D){var E={id:"",action:"",method:"GET","class":"",name:"",containerEl:"li",enableHTML5Validations:false};
this.opts=C.extend({},E,D);
this.fields=[]
}A.fromJSON=function(F){var D=new this({action:F.action,method:F.method,name:F.name,id:F.id,"class":F["class"],enableHTML5Validations:F.enableHTML5Validations,data:F.data});
var E=this;
C.each(F.fields,function(){E._parseFields(D,null,this)
});
return D
};
A._parseFields=function(D,F,H){F=F||D;
var E=this;
if(H.type!="fieldset"){H.containerEl=D.opts.containerEl;
F.addField(A.fieldFromType(H));
return 
}var I=H;
var G=new A.FieldsetField(I);
F.addField(G);
if(!I.fields||I.fields.length===0){throw"No fields for the fieldset provided"
}C.each(I.fields,function(){if(this.type!="fieldset"){this.containerEl=F.opts.containerEl
}E._parseFields(D,G,this)
})
};
A.fieldFromType=function(E){var D=E.type.charAt(0).toUpperCase()+E.type.slice(1)+"Field";
if(typeof A[D]==="undefined"){throw"FormBuilder."+D+" class does not exist"
}return new A[D](E)
};
A.prototype.addField=function(D){this.fields.push(D)
};
A.prototype.render=function(){var E=C("<form>").attr({action:this.opts.action,method:this.opts.method,"class":this.opts["class"],name:this.opts.name,id:this.opts.id,data:this.opts.data});
if(!this.opts.enableHTML5Validations){E.attr("novalidate","novalidate")
}this._appendConfirmMessageDivTo(E);
var D=this;
C.each(this.fields,function(){var F=!this.selfContained?D.opts.containerEl:this.opts.outerContainerEl;
var G=C("<"+F+">");
E.append(G);
this.renderTo(G)
});
this._appendErrorSummaryDivTo(E);
this._addDataAttributes(E);
return E
};
A.prototype._appendConfirmMessageDivTo=function(D){D.append(C('<div class="confirmmsg">').append(C('<div class="icon">'),C('<div class="message">')));
D.on("change",function(E){C(this).find(".confirmmsg").hide()
})
};
A.prototype._appendErrorSummaryDivTo=function(D){D.prepend(C('<div class="errorsummary">').append(C('<div class="error">')))
};
A.prototype._addDataAttributes=function(D){C.each(this.opts.data||{},function(E,F){D.attr("data-"+E,F)
})
};
B.FormBuilder=A
})(window,jQuery);
(function(B,C){var A=B.FormBuilder;
A.InputField=function(D){var E={id:"","class":"",name:"",placeholder:"",title:"",hint:"",tooltip:"",tooltipimage:"",containerEl:"li",data:{}};
this.opts=C.extend({},E,D);
this.formBuilder=null
};
A.InputField.prototype.renderTo=function(D){this._appendLabel(D);
var E=C("<input>").attr({id:this.opts.id,"class":this.opts["class"],name:this.opts.name,placeholder:this.opts.placeholder,title:this.opts.title,type:this.type});
if(this.opts.value){E.val(this.opts.value)
}if(this.opts.disabled){E.attr("disabled","disabled")
}this._addValidationAttributes(E);
this._appendInput(D,E);
this._setMultiClass(D);
D.append(this._extraFields());
this._addDependentFields(D);
this._addDataAttributes(E);
return D
};
A.InputField.prototype._addDependentFields=function(F){if(!this.opts.dependentFields){return 
}var D=this;
var E=this.opts.containerEl;
C.each(this.opts.dependentFields,function(G,J){var I=C("<"+E+">").attr("id","block"+D.opts.id).attr("class",D.opts["class"]+" subfrm hidden");
J.containerEl=E;
var H=A.fieldFromType(J);
I.insertAfter(F);
H.renderTo(I)
})
};
A.InputField.prototype._extraFields=function(){var D=C('<div class="col3">');
this._appendHint(D);
this._appendTooltip(D);
this._appendErrorblock(D);
return D
};
A.InputField.prototype._appendInput=function(D,E){D.append(C('<div class="col2">').append(E))
};
A.InputField.prototype._appendLabel=function(F,D){var G=D||this.opts.id;
if(this.opts.label&&C.trim(this.opts.label)!==""){var E=C("<label>").attr("for",G).text(this.opts.label);
F.append(C('<div class="col1">').append(E))
}};
A.InputField.prototype._appendHint=function(E){if(this.opts.hint!==""){var D=C('<div class="hint">').hide();
D.text(this.opts.hint);
E.append(D)
}};
A.InputField.prototype._appendTooltip=function(F){if(this.opts.tooltip!==""){var D=C('<div class="tooltip">');
D.append(C('<div class="icon-tooltip">'));
var E=C('<div class="content">');
if(this.opts.tooltipimage){E.append(C("<img>").attr("src",this.opts.tooltipimage))
}E.append(C("<p>").text(this.opts.tooltip));
D.append(E);
F.append(D)
}};
A.InputField.prototype._appendErrorblock=function(E){var D=C('<div class="errorblock">');
D.append(C('<div class="icon-error">'));
D.append(C('<div class="content">'));
E.append(D)
};
A.InputField.prototype._setMultiClass=function(D){if(D&&D.length>0&&this.opts.multiple===true){D.addClass("multiple")
}};
A.InputField.prototype._addValidationAttributes=function(D){C.each(this.opts.validations||{},function(E,F){switch(E){case"required":case"number":case"email":if(F){D.attr(E,E).addClass(E)
}break;
case"equalTo":D.attr("equalTo",F.charAt(0)==="#"?F:"#"+F);
break;
case"minlength":case"maxlength":D.attr(E,F);
break
}})
};
A.InputField.prototype._addDataAttributes=function(D){C.each(this.opts.data||{},function(E,F){D.data(E,F);
D.attr("data-"+E,F)
})
}
})(window,jQuery);
(function(B,C){var A=B.FormBuilder;
A.HiddenField=function(D){A.InputField.call(this,D);
this.type="hidden"
};
C.extend(A.HiddenField.prototype,A.InputField.prototype);
A.HiddenField.prototype._appendInput=function(D,E){D.append(E)
};
A.HiddenField.prototype._extraFields=function(){return null
};
A.HiddenField.prototype._appendErrorblock=function(D){}
})(window,jQuery);
(function(B,C){var A=B.FormBuilder;
A.TextField=function(D){A.InputField.call(this,D);
this.type="text"
};
C.extend(A.TextField.prototype,A.InputField.prototype)
})(window,jQuery);
(function(B,C){var A=B.FormBuilder;
A.FieldsetField=function(D){var E={legend:"",description:"","class":"",outerContainerEl:"fieldset",containerEl:"ol",itemContainerEl:"li",data:{}};
this.opts=C.extend({},E,D);
this.selfContained=true;
this.fields=[]
};
C.extend(A.FieldsetField.prototype,A.InputField.prototype);
A.FieldsetField.prototype.addField=function(D){this.fields.push(D)
};
A.FieldsetField.prototype.renderTo=function(G){G.addClass(this.opts["class"]);
if(this.opts.legend!==""){var F=C("<legend>").text(this.opts.legend).appendTo(G);
if(this.opts.description!==""){C("<p>").text(this.opts.description).insertAfter(F)
}}var E=C("<"+this.opts.containerEl+">");
G.append(E);
var D=this;
C.each(this.fields,function(I,K){var J=C("<"+D.opts.itemContainerEl+">");
E.append(J);
if(K.selfContained){var H=C("<"+D.opts.outerContainerEl+">").appendTo(J);
K.renderTo(H)
}else{K.renderTo(J)
}});
this._addDependentFields(E);
this._addDataAttributes(G);
return G
}
})(window,jQuery);
(function(B,C){var A=B.FormBuilder;
A.PasswordField=function(D){A.InputField.call(this,D);
this.type="password"
};
C.extend(A.PasswordField.prototype,A.InputField.prototype)
})(window,jQuery);
(function(B,C){var A=B.FormBuilder;
A.EmailField=function(D){A.InputField.call(this,D);
this.type="email"
};
C.extend(A.EmailField.prototype,A.InputField.prototype)
})(window,jQuery);
(function(B,C){var A=B.FormBuilder;
A.RadioField=function(D){A.InputField.call(this,D);
this.type="radio"
};
C.extend(A.RadioField.prototype,A.InputField.prototype);
A.RadioField.prototype.renderTo=function(I){var H=function(K){return K.id||K.value
};
this._appendLabel(I,H(this.opts.options[0]));
var E=this;
var J=C('<div class="fright">');
if(this.opts["class"]){J.addClass(this.opts["class"])
}var G=false;
var F=false;
C.each(this.opts.options,function(M,P){var O=C('<div class="fleft">');
var Q=H(P);
var L=C("<input>").attr({type:E.type,name:E.opts.name,"class":"radio",value:P.value,id:Q});
if(E.opts.value&&E.opts.value==P.value){L.attr("checked","checked")
}var K=C("<label>").attr({"class":"label","for":Q}).text(P.label);
J.append(O.append(L,K));
if(P.dependentFields){F=true;
if(G===false){G=C('<div class="subfrm">')
}var N=C('<div data-belongsto="'+Q+'">').appendTo(G);
E._addDependentFieldsForOption(N,P.dependentFields)
}E._addDataAttributes(L)
});
if(G!==false){J.append(G)
}J.find(".fleft:last").addClass("last");
var D=!F;
this._appendInput(I,J,D);
this._setMultiClass(J);
this._addDependentFields(I);
return I
};
A.RadioField.prototype._addDependentFieldsForOption=function(F,D){var E=this;
C.each(D,function(G,I){var H=A.fieldFromType(I);
H.renderTo(F);
C('<div class="clearfix">').appendTo(F)
})
};
A.RadioField.prototype._appendInput=function(F,G,E){if(E===undefined){E=true
}var D=G;
if(E){D=C('<div class="col2">').append(G)
}F.append(D)
}
})(window,jQuery);
(function(B,C){var A=B.FormBuilder;
A.SelectField=function(D){A.InputField.call(this,D)
};
C.extend(A.SelectField.prototype,A.InputField.prototype);
A.SelectField.prototype.renderTo=function(E){this._appendLabel(E);
var F=C("<select>").attr({id:this.opts.id,"class":this.opts["class"]+" select",name:this.opts.name});
var D=this;
C.each(this.opts.options,function(G){var H=C("<option>").attr("value",this.value).text(this.label);
if(D.opts.value&&D.opts.value==this.value){H.attr("selected","selected")
}C.each(this.data||{},function(I,J){H.attr("data-"+I,J)
});
F.append(H)
});
this._addValidationAttributes(F);
this._appendInput(E,F);
this._setMultiClass(E);
E.append(this._extraFields());
this._addDependentFields(E);
this._addDataAttributes(F);
return E
}
})(window,jQuery);
(function(B,C){var A=B.FormBuilder;
A.CheckboxField=function(D){A.InputField.call(this,D);
this.type="checkbox"
};
C.extend(A.CheckboxField.prototype,A.InputField.prototype);
A.CheckboxField.prototype.renderTo=function(E){var D=C("<label>").attr({"class":"labelbox","for":this.opts.id}).text(this.opts.label);
var F=C("<input>").attr({type:this.type,name:this.opts.name,"class":"checkbox",value:this.opts.value,id:this.opts.id});
if(this.opts.checked===true){F.attr("checked","checked")
}if(this.opts.disabled){F.attr("disabled","disabled")
}F.prependTo(D);
E.append(D);
this._addValidationAttributes(F);
this._addDependentFields(E);
this._addDataAttributes(F);
this._appendErrorblock(E);
this._setMultiClass(E);
return E
}
})(window,jQuery);
(function(B,C){var A=B.FormBuilder;
A.SubmitField=function(D){A.InputField.call(this,D)
};
C.extend(A.SubmitField.prototype,A.InputField.prototype);
A.SubmitField.prototype.renderTo=function(E){var D=C('<div class="col1-2-3">');
var G=C('<div class="aright">').appendTo(D);
var F=C("<button>").attr({id:this.opts.id,"class":this.opts["class"],name:"submit",type:"submit"}).text(this.opts.label);
if(this.opts["class"]==="btn-more"){C('<span class="icon">').appendTo(F)
}G.append(F);
E.append(D);
this._addDependentFields(E);
this._addDataAttributes(F);
return E
}
})(window,jQuery);
(function(B,C){var A=B.FormBuilder;
A.MultiselectField=function(D){A.InputField.call(this,D)
};
C.extend(A.MultiselectField.prototype,A.InputField.prototype);
A.MultiselectField.prototype.renderTo=function(F){var D=this;
this._appendLabel(F,this.opts.fields[0].id);
var E=C('<div class="fright">');
C.each(this.opts.fields,function(H,I){var G=C('<div class="fleft">');
var J=C("<select>").attr({id:I.id,"class":"select"+(I["class"]?" "+I["class"]:""),name:I.name});
C.each(I.options,function(){var K=C("<option>").text(this.label);
if(this.value){K.val(this.value)
}if(I.value&&I.value==K.val()){K.attr("selected","selected")
}J.append(K)
});
E.append(G.append(J));
D._addDataAttributes(J)
});
E.find(".fleft:last").addClass("last");
this._appendInput(F,E);
this._setMultiClass(F);
F.append(this._extraFields());
this._addDependentFields(F);
return F
}
})(window,jQuery);
(function(B,C){var A=B.FormBuilder;
A.MultitextField=function(D){A.InputField.call(this,D)
};
C.extend(A.MultitextField.prototype,A.InputField.prototype);
A.MultitextField.prototype.renderTo=function(F){var D=this;
this._appendLabel(F,this.opts.fields[0].id);
var E=C('<div class="fright">');
C.each(this.opts.fields,function(H,I){var G=C('<div class="fleft">');
var J=C("<input>").attr({id:I.id,type:I.type,"class":I["class"],name:I.name});
E.append(G.append(J));
D._addDataAttributes(J)
});
E.find(".fleft:last").addClass("last");
this._appendInput(F,E);
this._setMultiClass(F);
F.append(this._extraFields());
this._addDependentFields(F);
return F
}
})(window,jQuery);
(function(B,C){var A=B.FormBuilder;
A.TextareaField=function(D){A.InputField.call(this,D)
};
C.extend(A.TextareaField.prototype,A.InputField.prototype);
A.TextareaField.prototype.renderTo=function(E){this._appendLabel(E);
var F=C("<textarea>").attr({id:this.opts.id,"class":this.opts["class"],name:this.opts.name});
var D=this;
this._addValidationAttributes(F);
this._appendInput(E,F);
E.append(this._extraFields());
this._addDependentFields(E);
this._addDataAttributes(F);
return E
};
A.TextareaField.prototype._appendInput=function(D,E){D.find(".col1-2").append(E)
};
A.TextareaField.prototype._appendLabel=function(F,D){var G=D||this.opts.id;
if(this.opts.label&&C.trim(this.opts.label)!==""){var E=C("<label>").attr("for",G).text(this.opts.label);
F.append(C('<div class="col1-2">').append(E))
}}
})(window,jQuery);
/* http://mths.be/placeholder v1.8.7 by @mathias */
(function(F,H,C){var A="placeholder" in H.createElement("input"),D="placeholder" in H.createElement("textarea"),I=C.fn,J;
if(A&&D){J=I.placeholder=function(){return this
};
J.input=J.textarea=true
}else{J=I.placeholder=function(){return this.filter((A?"textarea":":input")+"[placeholder]").not(".placeholder").bind("focus.placeholder",B).bind("blur.placeholder",E).trigger("blur.placeholder").end()
};
J.input=A;
J.textarea=D;
C(function(){C(H).delegate("form","submit.placeholder",function(){var K=C(".placeholder",this).each(B);
setTimeout(function(){K.each(E)
},10)
})
});
C(F).bind("unload.placeholder",function(){C(".placeholder").val("")
})
}function G(L){var K={},M=/^jQuery\d+$/;
C.each(L.attributes,function(O,N){if(N.specified&&!M.test(N.name)){K[N.name]=N.value
}});
return K
}function B(){var K=C(this);
if(K.val()===K.attr("placeholder")&&K.hasClass("placeholder")){if(K.data("placeholder-password")){K.hide().next().show().focus().attr("id",K.removeAttr("id").data("placeholder-id"))
}else{K.val("").removeClass("placeholder")
}}}function E(){var O,N=C(this),K=N,M=this.id;
if(N.val()===""){if(N.is(":password")){if(!N.data("placeholder-textinput")){try{O=N.clone().attr({type:"text"})
}catch(L){O=C("<input>").attr(C.extend(G(this),{type:"text"}))
}O.removeAttr("name").data("placeholder-password",true).data("placeholder-id",M).bind("focus.placeholder",B);
N.data("placeholder-textinput",O).data("placeholder-id",M).before(O)
}N=N.removeAttr("id").hide().prev().attr("id",M).show()
}N.addClass("placeholder").val(N.attr("placeholder"))
}else{N.removeClass("placeholder")
}}}(this,document,jQuery));
(function(A){A.extend(A.fn,{validate:function(B){if(!this.length){B&&B.debug&&window.console&&console.warn("nothing selected, can't validate, returning nothing");
return 
}var C=A.data(this[0],"validator");
if(C){return C
}this.attr("novalidate","novalidate");
C=new A.validator(B,this[0]);
A.data(this[0],"validator",C);
if(C.settings.onsubmit){var D=this.find("input, button");
D.filter(".cancel").click(function(){C.cancelSubmit=true
});
if(C.settings.submitHandler){D.filter(":submit").click(function(){C.submitButton=this
})
}this.submit(function(E){if(C.settings.debug){E.preventDefault()
}function F(){if(C.settings.submitHandler){if(C.submitButton){var G=A("<input type='hidden'/>").attr("name",C.submitButton.name).val(C.submitButton.value).appendTo(C.currentForm)
}C.settings.submitHandler.call(C,C.currentForm);
if(C.submitButton){G.remove()
}return false
}return true
}if(C.cancelSubmit){C.cancelSubmit=false;
return F()
}if(C.form()){if(C.pendingRequest){C.formSubmitted=true;
return false
}return F()
}else{C.focusInvalid();
return false
}})
}return C
},valid:function(){if(A(this[0]).is("form")){return this.validate().form()
}else{var C=true;
var B=A(this[0].form).validate();
this.each(function(){C&=B.element(this)
});
return C
}},removeAttrs:function(D){var B={},C=this;
A.each(D.split(/\s/),function(E,F){B[F]=C.attr(F);
C.removeAttr(F)
});
return B
},rules:function(E,B){var G=this[0];
if(E){var D=A.data(G.form,"validator").settings;
var I=D.rules;
var J=A.validator.staticRules(G);
switch(E){case"add":A.extend(J,A.validator.normalizeRule(B));
I[G.name]=J;
if(B.messages){D.messages[G.name]=A.extend(D.messages[G.name],B.messages)
}break;
case"remove":if(!B){delete I[G.name];
return J
}var H={};
A.each(B.split(/\s/),function(K,L){H[L]=J[L];
delete J[L]
});
return H
}}var F=A.validator.normalizeRules(A.extend({},A.validator.metadataRules(G),A.validator.classRules(G),A.validator.attributeRules(G),A.validator.staticRules(G)),G);
if(F.required){var C=F.required;
delete F.required;
F=A.extend({required:C},F)
}return F
}});
A.extend(A.expr[":"],{blank:function(B){return !A.trim(""+B.value)
},filled:function(B){return !!A.trim(""+B.value)
},unchecked:function(B){return !B.checked
}});
A.validator=function(B,C){this.settings=A.extend(true,{},A.validator.defaults,B);
this.currentForm=C;
this.init()
};
A.validator.format=function(B,C){if(arguments.length==1){return function(){var D=A.makeArray(arguments);
D.unshift(B);
return A.validator.format.apply(this,D)
}
}if(arguments.length>2&&C.constructor!=Array){C=A.makeArray(arguments).slice(1)
}if(C.constructor!=Array){C=[C]
}A.each(C,function(D,E){B=B.replace(new RegExp("\\{"+D+"\\}","g"),E)
});
return B
};
A.extend(A.validator,{defaults:{messages:{},groups:{},rules:{},errorClass:"error",validClass:"valid",errorElement:"label",focusInvalid:true,errorContainer:A([]),errorLabelContainer:A([]),onsubmit:true,ignore:":hidden",ignoreTitle:false,onfocusin:function(B,C){this.lastActive=B;
if(this.settings.focusCleanup&&!this.blockFocusCleanup){this.settings.unhighlight&&this.settings.unhighlight.call(this,B,this.settings.errorClass,this.settings.validClass);
this.addWrapper(this.errorsFor(B)).hide()
}},onfocusout:function(B,C){if(!this.checkable(B)&&(B.name in this.submitted||!this.optional(B))){this.element(B)
}},onkeyup:function(B,C){if(B.name in this.submitted||B==this.lastElement){this.element(B)
}},onclick:function(B,C){if(B.name in this.submitted){this.element(B)
}else{if(B.parentNode.name in this.submitted){this.element(B.parentNode)
}}},highlight:function(D,B,C){if(D.type==="radio"){this.findByName(D.name).addClass(B).removeClass(C)
}else{A(D).addClass(B).removeClass(C)
}},unhighlight:function(D,B,C){if(D.type==="radio"){this.findByName(D.name).removeClass(B).addClass(C)
}else{A(D).removeClass(B).addClass(C)
}}},setDefaults:function(B){A.extend(A.validator.defaults,B)
},messages:{required:"This field is required.",remote:"Please fix this field.",email:"Please enter a valid email address.",url:"Please enter a valid URL.",date:"Please enter a valid date.",dateISO:"Please enter a valid date (ISO).",number:"Please enter a valid number.",digits:"Please enter only digits.",creditcard:"Please enter a valid credit card number.",equalTo:"Please enter the same value again.",accept:"Please enter a value with a valid extension.",maxlength:A.validator.format("Please enter no more than {0} characters."),minlength:A.validator.format("Please enter at least {0} characters."),rangelength:A.validator.format("Please enter a value between {0} and {1} characters long."),range:A.validator.format("Please enter a value between {0} and {1}."),max:A.validator.format("Please enter a value less than or equal to {0}."),min:A.validator.format("Please enter a value greater than or equal to {0}.")},autoCreateRanges:false,prototype:{init:function(){this.labelContainer=A(this.settings.errorLabelContainer);
this.errorContext=this.labelContainer.length&&this.labelContainer||A(this.currentForm);
this.containers=A(this.settings.errorContainer).add(this.settings.errorLabelContainer);
this.submitted={};
this.valueCache={};
this.pendingRequest=0;
this.pending={};
this.invalid={};
this.reset();
var B=(this.groups={});
A.each(this.settings.groups,function(E,F){A.each(F.split(/\s/),function(H,G){B[G]=E
})
});
var D=this.settings.rules;
A.each(D,function(E,F){D[E]=A.validator.normalizeRule(F)
});
function C(G){var F=A.data(this[0].form,"validator"),E="on"+G.type.replace(/^validate/,"");
F.settings[E]&&F.settings[E].call(F,this[0],G)
}A(this.currentForm).validateDelegate("[type='text'], [type='password'], [type='file'], select, textarea, [type='number'], [type='search'] ,[type='tel'], [type='url'], [type='email'], [type='datetime'], [type='date'], [type='month'], [type='week'], [type='time'], [type='datetime-local'], [type='range'], [type='color'] ","focusin focusout keyup",C).validateDelegate("[type='radio'], [type='checkbox'], select, option","click",C);
if(this.settings.invalidHandler){A(this.currentForm).bind("invalid-form.validate",this.settings.invalidHandler)
}},form:function(){this.checkForm();
A.extend(this.submitted,this.errorMap);
this.invalid=A.extend({},this.errorMap);
if(!this.valid()){A(this.currentForm).triggerHandler("invalid-form",[this])
}this.showErrors();
return this.valid()
},checkForm:function(){this.prepareForm();
for(var B=0,C=(this.currentElements=this.elements());
C[B];
B++){this.check(C[B])
}return this.valid()
},element:function(C){C=this.validationTargetFor(this.clean(C));
this.lastElement=C;
this.prepareElement(C);
this.currentElements=A(C);
var B=this.check(C);
if(B){delete this.invalid[C.name]
}else{this.invalid[C.name]=true
}if(!this.numberOfInvalids()){this.toHide=this.toHide.add(this.containers)
}this.showErrors();
return B
},showErrors:function(C){if(C){A.extend(this.errorMap,C);
this.errorList=[];
for(var B in C){this.errorList.push({message:C[B],element:this.findByName(B)[0]})
}this.successList=A.grep(this.successList,function(D){return !(D.name in C)
})
}this.settings.showErrors?this.settings.showErrors.call(this,this.errorMap,this.errorList):this.defaultShowErrors()
},resetForm:function(){if(A.fn.resetForm){A(this.currentForm).resetForm()
}this.submitted={};
this.lastElement=null;
this.prepareForm();
this.hideErrors();
this.elements().removeClass(this.settings.errorClass)
},numberOfInvalids:function(){return this.objectLength(this.invalid)
},objectLength:function(D){var C=0;
for(var B in D){C++
}return C
},hideErrors:function(){this.addWrapper(this.toHide).hide()
},valid:function(){return this.size()==0
},size:function(){return this.errorList.length
},focusInvalid:function(){if(this.settings.focusInvalid){try{A(this.findLastActive()||this.errorList.length&&this.errorList[0].element||[]).filter(":visible").focus().trigger("focusin")
}catch(B){}}},findLastActive:function(){var B=this.lastActive;
return B&&A.grep(this.errorList,function(C){return C.element.name==B.name
}).length==1&&B
},elements:function(){var C=this,B={};
return A(this.currentForm).find("input, select, textarea").not(":submit, :reset, :image, [disabled]").not(this.settings.ignore).filter(function(){!this.name&&C.settings.debug&&window.console&&console.error("%o has no name assigned",this);
if(this.name in B||!C.objectLength(A(this).rules())){return false
}B[this.name]=true;
return true
})
},clean:function(B){return A(B)[0]
},errors:function(){return A(this.settings.errorElement+"."+this.settings.errorClass,this.errorContext)
},reset:function(){this.successList=[];
this.errorList=[];
this.errorMap={};
this.toShow=A([]);
this.toHide=A([]);
this.currentElements=A([])
},prepareForm:function(){this.reset();
this.toHide=this.errors().add(this.containers)
},prepareElement:function(B){this.reset();
this.toHide=this.errorsFor(B)
},check:function(C){C=this.validationTargetFor(this.clean(C));
var G=A(C).rules();
var D=false;
for(var H in G){var F={method:H,parameters:G[H]};
try{var B=A.validator.methods[H].call(this,C.value.replace(/\r/g,""),C,F.parameters);
if(B=="dependency-mismatch"){D=true;
continue
}D=false;
if(B=="pending"){this.toHide=this.toHide.not(this.errorsFor(C));
return 
}if(!B){this.formatAndAdd(C,F);
return false
}}catch(E){this.settings.debug&&window.console&&console.log("exception occured when checking element "+C.id+", check the '"+F.method+"' method",E);
throw E
}}if(D){return 
}if(this.objectLength(G)){this.successList.push(C)
}return true
},customMetaMessage:function(B,D){if(!A.metadata){return 
}var C=this.settings.meta?A(B).metadata()[this.settings.meta]:A(B).metadata();
return C&&C.messages&&C.messages[D]
},customMessage:function(C,D){var B=this.settings.messages[C];
return B&&(B.constructor==String?B:B[D])
},findDefined:function(){for(var B=0;
B<arguments.length;
B++){if(arguments[B]!==undefined){return arguments[B]
}}return undefined
},defaultMessage:function(B,C){return this.findDefined(this.customMessage(B.name,C),this.customMetaMessage(B,C),!this.settings.ignoreTitle&&B.title||undefined,A.validator.messages[C],"<strong>Warning: No message defined for "+B.name+"</strong>")
},formatAndAdd:function(C,E){var D=this.defaultMessage(C,E.method),B=/\$?\{(\d+)\}/g;
if(typeof D=="function"){D=D.call(this,E.parameters,C)
}else{if(B.test(D)){D=jQuery.format(D.replace(B,"{$1}"),E.parameters)
}}this.errorList.push({message:D,element:C});
this.errorMap[C.name]=D;
this.submitted[C.name]=D
},addWrapper:function(B){if(this.settings.wrapper){B=B.add(B.parent(this.settings.wrapper))
}return B
},defaultShowErrors:function(){for(var C=0;
this.errorList[C];
C++){var B=this.errorList[C];
this.settings.highlight&&this.settings.highlight.call(this,B.element,this.settings.errorClass,this.settings.validClass);
this.showLabel(B.element,B.message)
}if(this.errorList.length){this.toShow=this.toShow.add(this.containers)
}if(this.settings.success){for(var C=0;
this.successList[C];
C++){this.showLabel(this.successList[C])
}}if(this.settings.unhighlight){for(var C=0,D=this.validElements();
D[C];
C++){this.settings.unhighlight.call(this,D[C],this.settings.errorClass,this.settings.validClass)
}}this.toHide=this.toHide.not(this.toShow);
this.hideErrors();
this.addWrapper(this.toShow).show()
},validElements:function(){return this.currentElements.not(this.invalidElements())
},invalidElements:function(){return A(this.errorList).map(function(){return this.element
})
},showLabel:function(C,D){var B=this.errorsFor(C);
if(B.length){B.removeClass(this.settings.validClass).addClass(this.settings.errorClass);
B.attr("generated")&&B.html(D)
}else{B=A("<"+this.settings.errorElement+"/>").attr({"for":this.idOrName(C),generated:true}).addClass(this.settings.errorClass).html(D||"");
if(this.settings.wrapper){B=B.hide().show().wrap("<"+this.settings.wrapper+"/>").parent()
}if(!this.labelContainer.append(B).length){this.settings.errorPlacement?this.settings.errorPlacement(B,A(C)):B.insertAfter(C)
}}if(!D&&this.settings.success){B.text("");
typeof this.settings.success=="string"?B.addClass(this.settings.success):this.settings.success(B)
}this.toShow=this.toShow.add(B)
},errorsFor:function(C){var B=this.idOrName(C);
return this.errors().filter(function(){return A(this).attr("for")==B
})
},idOrName:function(B){return this.groups[B.name]||(this.checkable(B)?B.name:B.id||B.name)
},validationTargetFor:function(B){if(this.checkable(B)){B=this.findByName(B.name).not(this.settings.ignore)[0]
}return B
},checkable:function(B){return/radio|checkbox/i.test(B.type)
},findByName:function(B){var C=this.currentForm;
return A(document.getElementsByName(B)).map(function(D,E){return E.form==C&&E.name==B&&E||null
})
},getLength:function(C,B){switch(B.nodeName.toLowerCase()){case"select":return A("option:selected",B).length;
case"input":if(this.checkable(B)){return this.findByName(B.name).filter(":checked").length
}}return C.length
},depend:function(C,B){return this.dependTypes[typeof C]?this.dependTypes[typeof C](C,B):true
},dependTypes:{"boolean":function(C,B){return C
},string:function(C,B){return !!A(C,B.form).length
},"function":function(C,B){return C(B)
}},optional:function(B){return !A.validator.methods.required.call(this,A.trim(B.value),B)&&"dependency-mismatch"
},startRequest:function(B){if(!this.pending[B.name]){this.pendingRequest++;
this.pending[B.name]=true
}},stopRequest:function(B,C){this.pendingRequest--;
if(this.pendingRequest<0){this.pendingRequest=0
}delete this.pending[B.name];
if(C&&this.pendingRequest==0&&this.formSubmitted&&this.form()){A(this.currentForm).submit();
this.formSubmitted=false
}else{if(!C&&this.pendingRequest==0&&this.formSubmitted){A(this.currentForm).triggerHandler("invalid-form",[this]);
this.formSubmitted=false
}}},previousValue:function(B){return A.data(B,"previousValue")||A.data(B,"previousValue",{old:null,valid:true,message:this.defaultMessage(B,"remote")})
}},classRuleSettings:{required:{required:true},email:{email:true},url:{url:true},date:{date:true},dateISO:{dateISO:true},dateDE:{dateDE:true},number:{number:true},numberDE:{numberDE:true},digits:{digits:true},creditcard:{creditcard:true}},addClassRules:function(B,C){B.constructor==String?this.classRuleSettings[B]=C:A.extend(this.classRuleSettings,B)
},classRules:function(C){var D={};
var B=A(C).attr("class");
B&&A.each(B.split(" "),function(){if(this in A.validator.classRuleSettings){A.extend(D,A.validator.classRuleSettings[this])
}});
return D
},attributeRules:function(C){var E={};
var B=A(C);
for(var F in A.validator.methods){var D;
if(F==="required"&&typeof A.fn.prop==="function"){D=B.prop(F)
}else{D=B.attr(F)
}if(D){E[F]=D
}else{if(B[0].getAttribute("type")===F){E[F]=true
}}}if(E.maxlength&&/-1|2147483647|524288/.test(E.maxlength)){delete E.maxlength
}return E
},metadataRules:function(B){if(!A.metadata){return{}
}var C=A.data(B.form,"validator").settings.meta;
return C?A(B).metadata()[C]:A(B).metadata()
},staticRules:function(C){var D={};
var B=A.data(C.form,"validator");
if(B.settings.rules){D=A.validator.normalizeRule(B.settings.rules[C.name])||{}
}return D
},normalizeRules:function(C,B){A.each(C,function(F,E){if(E===false){delete C[F];
return 
}if(E.param||E.depends){var D=true;
switch(typeof E.depends){case"string":D=!!A(E.depends,B.form).length;
break;
case"function":D=E.depends.call(B,B);
break
}if(D){C[F]=E.param!==undefined?E.param:true
}else{delete C[F]
}}});
A.each(C,function(D,E){C[D]=A.isFunction(E)?E(B):E
});
A.each(["minlength","maxlength","min","max"],function(){if(C[this]){C[this]=Number(C[this])
}});
A.each(["rangelength","range"],function(){if(C[this]){C[this]=[Number(C[this][0]),Number(C[this][1])]
}});
if(A.validator.autoCreateRanges){if(C.min&&C.max){C.range=[C.min,C.max];
delete C.min;
delete C.max
}if(C.minlength&&C.maxlength){C.rangelength=[C.minlength,C.maxlength];
delete C.minlength;
delete C.maxlength
}}if(C.messages){delete C.messages
}return C
},normalizeRule:function(C){if(typeof C=="string"){var B={};
A.each(C.split(/\s/),function(){B[this]=true
});
C=B
}return C
},addMethod:function(B,D,C){A.validator.methods[B]=D;
A.validator.messages[B]=C!=undefined?C:A.validator.messages[B];
if(D.length<3){A.validator.addClassRules(B,A.validator.normalizeRule(B))
}},methods:{required:function(C,B,E){if(!this.depend(E,B)){return"dependency-mismatch"
}switch(B.nodeName.toLowerCase()){case"select":var D=A(B).val();
return D&&D.length>0;
case"input":if(this.checkable(B)){return this.getLength(C,B)>0
}default:return A.trim(C).length>0
}},remote:function(F,C,G){if(this.optional(C)){return"dependency-mismatch"
}var D=this.previousValue(C);
if(!this.settings.messages[C.name]){this.settings.messages[C.name]={}
}D.originalMessage=this.settings.messages[C.name].remote;
this.settings.messages[C.name].remote=D.message;
G=typeof G=="string"&&{url:G}||G;
if(this.pending[C.name]){return"pending"
}if(D.old===F){return D.valid
}D.old=F;
var B=this;
this.startRequest(C);
var E={};
E[C.name]=F;
A.ajax(A.extend(true,{url:G,mode:"abort",port:"validate"+C.name,dataType:"json",data:E,success:function(I){B.settings.messages[C.name].remote=D.originalMessage;
var K=I===true;
if(K){var H=B.formSubmitted;
B.prepareElement(C);
B.formSubmitted=H;
B.successList.push(C);
B.showErrors()
}else{var L={};
var J=I||B.defaultMessage(C,"remote");
L[C.name]=D.message=A.isFunction(J)?J(F):J;
B.showErrors(L)
}D.valid=K;
B.stopRequest(C,K)
}},G));
return"pending"
},minlength:function(C,B,D){return this.optional(B)||this.getLength(A.trim(C),B)>=D
},maxlength:function(C,B,D){return this.optional(B)||this.getLength(A.trim(C),B)<=D
},rangelength:function(D,B,E){var C=this.getLength(A.trim(D),B);
return this.optional(B)||(C>=E[0]&&C<=E[1])
},min:function(C,B,D){return this.optional(B)||C>=D
},max:function(C,B,D){return this.optional(B)||C<=D
},range:function(C,B,D){return this.optional(B)||(C>=D[0]&&C<=D[1])
},email:function(C,B){return this.optional(B)||/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$/i.test(C)
},url:function(C,B){return this.optional(B)||/^(https?|ftp):\/\/(((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:)*@)?(((\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5]))|((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?)(:\d*)?)(\/((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)+(\/(([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)*)*)?)?(\?((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|[\uE000-\uF8FF]|\/|\?)*)?(\#((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|\/|\?)*)?$/i.test(C)
},date:function(C,B){return this.optional(B)||!/Invalid|NaN/.test(new Date(C))
},dateISO:function(C,B){return this.optional(B)||/^\d{4}[\/-]\d{1,2}[\/-]\d{1,2}$/.test(C)
},number:function(C,B){return this.optional(B)||/^-?(?:\d+|\d{1,3}(?:,\d{3})+)(?:\.\d+)?$/.test(C)
},digits:function(C,B){return this.optional(B)||/^\d+$/.test(C)
},creditcard:function(F,C){if(this.optional(C)){return"dependency-mismatch"
}if(/[^0-9 -]+/.test(F)){return false
}var G=0,E=0,B=false;
F=F.replace(/\D/g,"");
for(var H=F.length-1;
H>=0;
H--){var D=F.charAt(H);
var E=parseInt(D,10);
if(B){if((E*=2)>9){E-=9
}}G+=E;
B=!B
}return(G%10)==0
},accept:function(C,B,D){D=typeof D=="string"?D.replace(/,/g,"|"):"png|jpe?g|gif";
return this.optional(B)||C.match(new RegExp(".("+D+")$","i"))
},equalTo:function(C,B,E){var D=A(E).unbind(".validate-equalTo").bind("blur.validate-equalTo",function(){A(B).valid()
});
return C==D.val()
}}});
A.format=A.validator.format
})(jQuery);
(function(C){var A={};
if(C.ajaxPrefilter){C.ajaxPrefilter(function(F,E,G){var D=F.port;
if(F.mode=="abort"){if(A[D]){A[D].abort()
}A[D]=G
}})
}else{var B=C.ajax;
C.ajax=function(E){var F=("mode" in E?E:C.ajaxSettings).mode,D=("port" in E?E:C.ajaxSettings).port;
if(F=="abort"){if(A[D]){A[D].abort()
}return(A[D]=B.apply(this,arguments))
}return B.apply(this,arguments)
}
}})(jQuery);
(function(A){if(!jQuery.event.special.focusin&&!jQuery.event.special.focusout&&document.addEventListener){A.each({focus:"focusin",blur:"focusout"},function(C,B){A.event.special[B]={setup:function(){this.addEventListener(C,D,true)
},teardown:function(){this.removeEventListener(C,D,true)
},handler:function(E){arguments[0]=A.event.fix(E);
arguments[0].type=B;
return A.event.handle.apply(this,arguments)
}};
function D(E){E=A.event.fix(E);
E.type=B;
return A.event.handle.call(this,E)
}})
}A.extend(A.fn,{validateDelegate:function(D,C,B){return this.bind(C,function(E){var F=A(E.target);
if(F.is(D)){return B.apply(F,arguments)
}})
}})
})(jQuery);
(function(B){function A(C,D){this.el=C;
this.$el=B(this.el);
this.$left=B("<span class='decoLeft'>&#160;</span>");
this.$right=B("<span class='decoRight'>&#160;</span>");
this.$caption=B('<strong class="caption"></strong>');
this.nodeType=this.$el.attr("type")||this.el.nodeName.toLowerCase();
this.htmlChecked=this.nodeType==="radio"?"&#9899;":"&#9745;";
this.htmlUnChecked=this.nodeType==="radio"?"&#9898;":"&#9744;";
this.formalClass=D&&D["class"]||"formal";
this.init()
}A.prototype.init=function(){if(this.$el.parent("."+this.formalClass).length!==0){return 
}this.$el.css({opacity:"0.0001",zIndex:2});
this.addWrapElements();
this.updateCaption()
};
A.prototype.updateCaption=function(){switch(this.nodeType){case"select":return this.updateSelectCaption();
case"radio":return this.updateRadioCaption();
case"checkbox":return this.updateCheckboxCaption()
}return this.$caption.html(this.$el.val())
};
A.prototype.updateSelectCaption=function(){this.$caption.html(this.$el.find("> option:selected").text())
};
A.prototype.updateRadioCaption=function(){var D=this;
var E=this.$el.prop("name");
var C=B("input[type=radio][name="+E+"]");
C.not(this.$el).not(":checked").each(function(){var F=B(this).parents("."+D.formalClass).eq(0).removeClass("checked");
F.find("strong").html(D.htmlUnChecked)
});
this.updateCheckboxCaption()
};
A.prototype.updateCheckboxCaption=function(){var D=this.$el.attr("checked")?"checked":false;
this.$el.parents("."+this.formalClass).eq(0).toggleClass("checked",D);
var C=D?this.htmlChecked:this.htmlUnChecked;
this.$caption.html(C)
};
A.prototype.addWrapElements=function(){var C=[this.formalClass,this.nodeType,this.el.className||"",this.el.id?"id_"+this.el.id:""].join(" ");
this.$el.wrap(B("<span>").addClass(C));
switch(this.nodeType){case"radio":case"checkbox":return this.$el.before(this.$caption);
default:return this.$el.before(this.$left.clone(),this.$caption).after(this.$right.clone())
}};
B.fn.formal=function(D){var C=this.selector;
return this.each(function(){if(B(this).data("formal")){return 
}var F=new A(this,D);
B(this).data("formal",F);
var E=B(this).parents("form");
if(!E.length){E=B(this).closest("div.formal-form")
}if(!E.data("formal-bound")){E.data("formal-bound",true);
E.on("change",C,function(G){B(G.target).data("formal").updateCaption()
})
}})
}
})(jQuery);
(function(B,C){function A(D){var E=D.find("input:checked").attr("id");
D.siblings(".subfrm").hide().addClass("hidden");
D.closest("form").find(".subfrm[data-belongsto="+E+"]").show().removeClass("hidden");
if(!D.hasClass("js-no-trigger-fancybox")){B(document).trigger("dom_changed",B(".fancybox-inner"))
}}B("body").on("click",".collapsible",function(){A(B(this))
});
B(document).on("dom_loaded ajax_inserted form_built",function(E,D){B(D).find(".collapsible input:checked").each(function(){A(B(this).closest(".collapsible"))
})
})
})(jQuery,window);
(function(B){function A(C){this.$form=C;
this.tooltips();
this.bindEvents();
this.showRadioElements()
}A.prototype.tooltips=function(){var C=this.$form.find(".tooltip");
this.$form.find("li").each(function(){var F=B(this);
var E=F.find(".hint");
var D=F.find(".errorblock");
F.find("input, select").on({focusin:function(){if(!B(this).hasClass("error")){E.show()
}},focusout:function(){E.hide()
}})
});
C.on({mouseenter:function(){B(this).children(".content").stop(true,true).fadeIn(100)
},mouseleave:function(){B(this).children(".content").delay(500).fadeOut(100)
}})
};
A.prototype.bindEvents=function(){var C=this;
var D=this.$form.find("input:checkbox");
D.change(function(){C._expandSubElements(B(this))
});
D.each(function(){C._expandSubElements(B(this))
})
};
A.prototype._expandSubElements=function(D){var F=D.parents("ol").find("[data-belongsto="+D.attr("id")+"]");
var E=D.attr("checked")=="checked";
F.toggleClass("hidden",!E);
var C=F.find(":input");
C.each(function(){var G=B(this);
G.toggleClass("disabled",!E);
G.closest(".formal").parent().toggleClass("disabled",!E);
if(E){F.find(":input").removeAttr("disabled")
}else{F.find(":input").attr("disabled","disabled")
}})
};
A.prototype.showRadioElements=function(){this.$form.find("input:radio").change(function(){var D=B(this);
var E=D.attr("id");
var C=D.parents("li").attr("id");
D.parents("ol").find("#block-"+E).removeClass("hidden")
})
};
B.fn.formDecorator=function(){return this.each(function(){new A(B(this))
})
}
})(jQuery);
(function(B){function A(C){this.$el=C;
this.$plusBtn=null;
this.$clone=this.$el.clone();
this.count=0;
this._changeNames(this.$el);
this._renderPlusButton();
this._initPlusButton();
this._renderMinusButton(this.$clone);
this._initMinusButton()
}A.prototype._renderPlusButton=function(){this.$plusBtn=B('<a href="#" class="icon icon-plus">+</a>').insertAfter(this.$el)
};
A.prototype._renderMinusButton=function(D){var C=B('<a href="#" class="icon icon-minus js-minus-btn">-</a>');
C.appendTo(D)
};
A.prototype._initPlusButton=function(){var C=this;
this.$plusBtn.on("click",function(E){E.preventDefault();
var D=C.$clone.clone();
C.count++;
C._changeNames(D);
D.insertBefore(B(this));
D.find("input:radio, input:checkbox, select").formal();
D.formDecorator();
B(document).trigger("dom_changed",B(".fancybox-inner"))
})
};
A.prototype._initMinusButton=function(){var C=this;
this.$el.parent().on("click",".js-minus-btn",function(D){D.preventDefault();
B(this).parents(".multiple").remove();
B(document).trigger("dom_changed",B(".fancybox-inner"))
})
};
A.prototype._changeNames=function(D){var C=this;
D.find(":input").each(function(){var E=B(this).attr("name");
B(this).attr("name",E+"["+C.count+"]");
var F=B(this).attr("id");
B(this).attr("id",F+C.count)
});
D.find("label").each(function(){var E=B(this).attr("for");
B(this).attr("for",E+C.count)
})
};
B.fn.multiFormfields=function(){return this.each(function(){new A(B(this))
})
};
B(document).on("ajax_inserted dom_loaded form_built",function(D,C){B(C).find(".multiple").each(function(){new A(B(this))
})
})
})(jQuery);
(function(B,C){function A(E){var D=this;
this.$form=E;
E.find("input:radio, input:checkbox, select").formal();
E.find("input.text").placeholder();
E.formDecorator();
if(E.is("form")&&!E.hasClass("js-noValidate")){E.validate({debug:true,errorPlacement:B.proxy(D.showErrorForField,D),submitHandler:B.proxy(D.handleFormSubmit,D)})
}}A.prototype.showErrorForField=function(D,E){var F=D;
if(!(D instanceof B)){F=B("<label>").attr({"for":E.attr("id"),generated:true,"class":"error"}).text(D)
}if(E.siblings(".errorblock").length){E.siblings(".errorblock").show().html(F)
}else{if(E.is(":checkbox")){E.closest("label").next().show().html(F)
}else{if(E.is(":radio")){E.closest("div").next().addClass("hasError").find(".errorblock").show().html(F)
}else{if(!E.is(":radio")&&!E.is(":checkbox")&&E.closest(".js-group").length>0){E.closest(".col2").next(".col3").addClass("hasError").find(".errorblock").show().html(F)
}else{if(E.is("select")){E.parent(".formal").parent().next().addClass("hasError").find(".errorblock").show().html(F)
}else{E.parent().next().addClass("hasError").find(".errorblock").show().html(F)
}}}}}};
A.prototype.showErrors=function(E){var D=this;
B.each(E,function(){D.showErrorForField(this.errorMessages.join(", "),B("#"+this.field))
})
};
A.prototype.showErrorMessage=function(D){if(D){this.$form.find(".errorsummary > .error").text(D);
this.$form.find(".errorsummary").show()
}};
A.prototype.handleFormSubmit=function(){var D=this;
var E=D.$form.formextractor();
B.ajax({type:D.$form.attr("method").toUpperCase(),url:D.$form.attr("action"),contentType:"application/json",data:JSON.stringify(E),dataType:"json",success:function(F){if(!F){D.$form.find(".btn-more, .btn.cancel").hide();
D.$form.attr("action","");
D.$form.find(".errorsummary > .error").text("");
D.$form.find(".errorsummary").hide();
return 
}if(F.errors||F.errorMessage){D.showErrorMessage(F.errorMessage);
D.showErrors(F.errors)
}else{D.$form.find(".btn-more, .btn.cancel").hide();
D.$form.attr("action","");
D.$form.find(".errorsummary > .error").text("");
D.$form.find(".errorsummary").hide();
D.handleSuccess(F)
}}})
};
A.prototype.handleSuccess=function(D){if(D.callbackUrls&&D.callbackUrls.length>0){this._handleCallbackUrls(D)
}else{this.afterSubmitCallback(D)
}};
A.prototype._handleCallbackUrls=function(F){var D=F.callbackUrls.length;
var G=0;
var E=this;
B.each(F.callbackUrls,function(I,H){B.get(H,function(){G++;
if(G===D){E.afterSubmitCallback(F)
}})
})
};
A.prototype.afterSubmitCallback=function(H){if(this.$form.data("tracking")){try{this.$form.trackForm()
}catch(E){}}if(this.$form.data("js-redirect-success")!=null){C.location=this.$form.data("js-redirect-success")
}if(H.successUrl){C.location=H.successUrl
}if(H.successMessage){var D=this.$form.find(".confirmmsg");
var G=H.successMessage.replace(/[\n]/g,"<br />");
D.find(".message").html(G);
var F=this.$form.closest(".content, .overlay");
F.children().not("h1, .icons-close").hide();
D.appendTo(F);
D.show();
B(document).trigger("dom_changed",B(".fancybox-inner"))
}};
B.fn.audiFormHandler=function(){return this.each(function(){var D=B(this);
D.data("audi-form-handler",new A(D))
})
};
B(document).on("ajax_inserted dom_loaded",function(E,D){if(B(D).hasClass("frm")||B(D).hasClass("js-dynamic-form")){B(D).audiFormHandler()
}else{B(D).find(".frm").audiFormHandler()
}})
})(jQuery,window);
(function(A){A.fn.dynamicForm=function(B){return this.each(function(){var D=A(this);
var C=D.data("form-json-url");
if(typeof C==="undefined"){return 
}A.getJSON(C,function(G){var E=FormBuilder.fromJSON(G);
var F=E.render();
D.replaceWith(F);
if(typeof B==="function"){B(F)
}})
})
};
A(document).on("ajax_inserted dom_loaded contact_filter_set",function(D,C){var B=A(C).find(".dynamic-form");
B=B.add(A(C).filter(".dynamic-form"));
B.dynamicForm(function(E){E.audiFormHandler();
A(document).trigger("form_built",E)
})
})
})(jQuery);
(function(B,C){function A(E){this.$form=E.closest("form");
this.$target=B(E.attr("data-target"));
this.dataUrl;
var D=this;
E.on("change",function(H){var F,G;
F=E.find("option")[this.selectedIndex];
D.dataUrl=B(F).attr("data-url");
if(D.dataUrl){D.loadData()
}else{D.populateTargetDropdown([])
}})
}A.prototype.removeOptions=function(D){D.html("");
this.reInitializeDropdown(D);
if(D.attr("data-target")){this.removeOptions(B(D.attr("data-target")))
}};
A.prototype.loadData=function(){var D=this;
B.getJSON(this.dataUrl,function(E){D.populateTargetDropdown(E)
}).error(function(E){alert("Could not load the data for the cascading dropdown")
})
};
A.prototype.populateTargetDropdown=function(I){var D,H,E;
E=this.$target.clone();
H=this.$target.closest(".js-dynamic-form");
H.html("");
E.html("");
for(var F in I.options){var G=B("<option>").attr("value",I.options[F]["id"]).html(I.options[F]["name"]);
if(I.options[F]["data-url"]){G.attr("data-url",I.options[F]["data-url"])
}if(I.options[F]["selected"]){G.attr("selected","selected")
}E.append(G)
}E.appendTo(H);
this.$target=E;
this.showCountrySelection();
B(document).trigger("ajax_inserted",H);
this.$target.trigger("change")
};
A.prototype.reInitializeDropdown=function(D){B(document).trigger("ajax_inserted",D.closest(".js-dynamic-form"))
};
A.prototype.showCountrySelection=function(){this.$target.closest("li").removeClass("hidden")
};
A.prototype.hideCountrySelection=function(){this.$target.closest("li").addClass("hidden")
};
B.fn.cascadingDropdowns=function(){return this.each(function(){new A(B(this))
})
};
B(document).on("dom_loaded ajax_inserted",function(E,D){B(D).find("select.js-cascading-dropdowns").cascadingDropdowns()
})
})(jQuery,window);
(function(A,B){function C(D){if(A(D).data("multiform-initialized")){return 
}A(D).data("multiform-initialized",true);
this.$form=D;
this.$tabBar=null;
this.$summary=null;
this.subforms={};
this.validateUrl=null;
this.obtainValidateUrl();
this.addSummaryFieldset();
this.breakupForm();
this.buildTabbar();
this.initTabClicks();
this.initNextClicks();
this.toggleSubmitButton();
A(document).trigger("dom_changed",A(".fancybox-inner"))
}C.prototype.obtainValidateUrl=function(){var E=this.$form.attr("action");
var G=".export",F=".validate";
var D=E.lastIndexOf(G);
if(D>=0){this.validateUrl=E.substring(0,D)+F
}};
C.prototype.addSummaryFieldset=function(){this.$summary=A('<div class="summary"></div>');
this.$summary.prependTo(this.$form.find(".js-summary"))
};
C.prototype.breakupForm=function(){var D=this.$form.find("fieldset");
if(D.length<1){return 
}var F=this;
var E=F.$form.find(".btns");
E.hide();
D.each(function(){var H=A(this).data("tablabel");
if(!H){return 
}var J=A(this).nextUntil("fieldset[data-tablabel]");
var I=A(this).add(J);
I.wrapAll("<div>");
var G=I.parent();
if(!A(this).hasClass("js-summary")){A('<a href="#" class="btn js_next">'+F.$form.data("label-next")+"</a>").appendTo(G)
}F.subforms[H]=G
})
};
C.prototype.buildTabbar=function(){if(this.$tabBar){return 
}var D=A('<ul class="tabbar">');
A.each(this.subforms,function(E){var F=A(this).find("fieldset[data-tablabel]").data("tablabel");
var G=A('<li><a href="#">'+F+"</a></li>");
D.append(G)
});
D.addClass("count-"+D.children().length);
D.children().first().addClass("alpha").end().last().addClass("omega");
this.$tabBar=D;
D.prependTo(this.$form)
};
C.prototype.initTabClicks=function(){var D=this;
this.$form.on("click",".tabbar a",function(E){E.preventDefault();
if(!A(this).is(".disabled")){D.showTab(A(this).text());
D.disableNextTabs(A(this));
D.toggleSubmitButton()
}});
this.$tabBar.find("a:first").click()
};
C.prototype.initNextClicks=function(){var D=this;
this.$form.on("click",".js_next",function(K){K.preventDefault();
var E=D.$tabBar.find("a.active");
var G=D.$tabBar.find("a").index(E)+1;
var F=D.$tabBar.find("a:eq("+G+")");
if(F.length>0){var H=D.$form.data("validator").form();
if(H&&D.validateUrl!=null){var J=D.$form.find("div > div:visible > fieldset:not(.js-summary)");
var I=J.formextractor();
A.ajax({type:D.$form.attr("method").toUpperCase(),url:D.validateUrl,contentType:"application/json",data:JSON.stringify(I),success:function(N){if(!N||N.length==0){D.showTab(F.text());
D.toggleSubmitButton();
D.$form.find(".errorsummary > .error").text("");
D.$form.find(".errorsummary").hide();
return 
}var M=JSON.parse(N);
if(M.errors){var L={};
A.each(M.errors,function(O,P){L[P.field]=P.errorMessages[0]
});
D.$form.data("validator").showErrors(L)
}if(M.errorMessage){D.$form.find(".errorsummary > .error").text(M.errorMessage);
D.$form.find(".errorsummary").show()
}}})
}else{if(H){D.showTab(F.text());
D.toggleSubmitButton()
}}}else{D.$form.submit();
$form.find(".btn, .btn-more").hide()
}})
};
C.prototype.showTab=function(G){var E=this;
A.each(this.subforms,function(){A(this).hide()
});
var D=this.$tabBar.find("a");
D.removeClass("active");
var F=0;
D.each(function(){F++;
A(this).removeClass("active");
if(A(this).text()==G){A(this).addClass("active");
E.disableNextTabs(A(this))
}});
if(F===D.length){this.updateSummary()
}this.subforms[G].show();
A(document).trigger("dom_changed",A(".fancybox-inner"))
};
C.prototype.toggleSubmitButton=function(){var E=this;
var D=E.$tabBar.find("a.active");
var F=E.$tabBar.find("a").index(D)+1;
if(F==E.$tabBar.find("a").length){E.$form.find(".js-btns").show();
E.$form.find(".btn.js_next").hide()
}else{E.$form.find(".js-btns").hide();
E.$form.find(".btn.js_next").show()
}};
C.prototype.updateSummary=function(){var D=this;
this.$summary.html("");
this.$form.find("fieldset:not(.js-summary)").each(function(){if(!A(this).children("legend").length||A(this).hasClass("aggregated")||A(this).hasClass("radio_group")){return 
}var J=A(this);
var E=A('<div class="summary-item"></div>');
var I=J.children("legend").text();
if(I.length>0){A("<h2>").text(I).appendTo(E)
}var G=A("<dl>");
var H=0;
var F=0;
J.find("input:text, select, input:radio, input:checkbox:checked, textarea, input.js-hiddenfield").filter(":not(.js-no-summary)").each(function(){var R=A(this);
if(R.parents(".hidden").length){return 
}if(R.get(0).tagName=="SELECT"){R.attr("type","select")
}var P=R.closest("li");
var O="";
var K=P.find("label[for="+R.attr("id")+']:not(".error")').text();
var L=false;
switch(R.attr("type")){case"radio":if(P.parent().hasClass("collapsible")||P.closest("li").hasClass("nosummary")){return 
}if(!R.is(":checked")){if(R.closest("li").index()!=1){return 
}if(!A("input[name="+R.attr("name")+"]:checked").length){P=R.closest(".radio_group");
K=P.find("legend").text();
O=""
}else{return 
}}else{P=R.closest(".radio_group");
if(P.length==0||P.parent().hasClass("nosummary")){return 
}K=P.find("legend").text();
var N=P.find("label[for="+R.attr("id")+"]").clone();
N.find("strong").html("");
O=N.text();
if(N.data("dealersplit")){O=O.replace(/\|/g,"<br/>");
L=true
}}break;
case"checkbox":O="";
break;
case"select":if(R.val()&&R.val()!=""&&R.val()!="9999"){O=R.prev().text()
}else{O=""
}break;
case"textarea":if(P.hasClass("nosummary")){return 
}O=R.text();
default:if(P.hasClass("nosummary")){return 
}if(R.closest("fieldset.aggregated").length>0){if(R.parent().index()==1){var Q=R.closest("fieldset.aggregated");
K=Q.find("legend").text();
R.closest("ol").find("input").each(function(S,T){var U=A.browser.msie?A(T).data("ie-value"):A(T).val();
if(!U){return 
}if(O.length&&U.length){O+="."
}O+=U
})
}else{return 
}}else{if(R.data("customlabel")){O=R.data("customlabel");
var M=R.data("customdescription");
if(M!=null&&M!=""){K=M+" "+(++H)
}}else{O+=A.browser.msie?R.data("ie-value"):R.val()
}}break
}K=K.replace("*","");
K=A.trim(K);
O=A.trim(O);
if(K.length>0){A("<dt>").text(K).appendTo(G);
if(L){A("<dd>").html(O).appendTo(G)
}else{A("<dd>").text(O).appendTo(G)
}F++
}});
if(F>0){G.appendTo(E);
E.appendTo(D.$summary)
}})
};
C.prototype.disableNextTabs=function(D){this.$tabBar.find("a").removeClass("disabled");
D.parent().find("~ li a").addClass("disabled")
};
A.fn.MultistepForm=function(){return this.each(function(){new C(A(this))
})
};
A(document).on("change","select.js-contact-form-filter",function(){var D=A(this).val();
A.get(D,function(E){var F=A(E).find("form.js-contact-form");
var G=A("form.js-contact-form");
F.appendTo(G.parent());
G.remove();
A(document).trigger("ajax_inserted",F)
})
});
A(document).on("ajax_inserted dom_loaded",function(G,F){var D=".js-multistep";
var E=A(F).find(D).closest("form");
E.MultistepForm()
})
})(jQuery,window);
(function(B,D,C){function A(E){this.$select=E.find("select.js-selectCatalog");
this.$errorblock=E.find(".errorblock");
this.$imageContainer=E.find(".js-imageContainer");
this.maxItems=parseInt(this.$select.data("limit"));
this.$catalogList;
this.init()
}A.prototype.init=function(){var E=this;
this.createCatalogList();
this.$select.on("change",function(){var F=E.$select.find("option:selected");
E.$select.val("");
if(E._doAdd(F)){E.changeImage(F);
E.addListItem(F)
}E.$select.removeClass("required");
E.resetErrorMessages()
});
this.$catalogList.on("click",".js-delete",function(F){F.preventDefault();
B(this).closest("li").remove();
if(E.$catalogList.children().length===0){E.$select.addClass("required")
}})
};
A.prototype._doAdd=function(E){return(this.$catalogList.children().length<this.maxItems&&this.$catalogList.children(".js-"+this.escapeSpecialChars(E.attr("value"))).length===0)
};
A.prototype.createCatalogList=function(){this.$catalogList=B("<ul>").addClass("js-catalogList catalogList");
this.$select.parent().before(this.$catalogList)
};
A.prototype.changeImage=function(F){var E=B("<img>").attr("src",F.data("image-url"));
this.$imageContainer.html(E)
};
A.prototype.addListItem=function(H){var F=this.$select.data("item-prefix")+H.attr("value");
var G=this.$select.data("optionlabel")||"";
var E='<li class="js-'+this.escapeSpecialChars(H.attr("value"))+'">';
E+='<input type="hidden" class="js-hiddenfield" name="'+F+'" id="'+F+'" value="'+H.attr("value")+'" data-customlabel="'+H.text()+'" data-customdescription="'+G+'"/>';
E+='<span class="fleft">'+H.text()+"</span>";
E+='<a href="#" class="iconLink delete js-delete">'+this.$select.data("label-delete")+"</a>";
E+="</li>";
this.$catalogList.append(E)
};
A.prototype.resetErrorMessages=function(){this.$errorblock.html("").parent().removeClass("hasError")
};
A.prototype.escapeSpecialChars=function(E){return E.replace(/[^\w]/gi,"")
};
B.fn.catalogSelection=function(){return this.each(function(){new A(B(this))
})
};
B(D).on("dom_loaded ajax_inserted",function(H,G){var E=".js-catalogSelection";
var F=B(G).find(E).add(B(G).filter(E));
F.catalogSelection()
})
})(jQuery,document,window);
(function(A,B){A.fn.formextractor=function(){var D=A(this);
var E={};
D.find("select").each(function(I,J){var H=A(J);
var K=H.val();
var G=H.attr("name");
E[G]=K;
if(A.browser.msie&&parseInt(A.browser.version,10)===8){if(A.isArray(E[G])){E[G]=E[G].length>0?E[G][0]:""
}}});
D.find("textarea, input").each(function(I,J){var H=A(J);
if(H.attr("type")=="checkbox"||H.attr("type")=="radio"){return 
}var K=A.browser.msie?H.data("ie-value"):H.val();
var G=H.attr("name");
E[G]=K;
if(A.browser.msie&&parseInt(A.browser.version,10)===8){if(A.isArray(E[G])){E[G]=E[G].length>0?E[G][0]:""
}}});
var F=[];
D.find("input[type=checkbox]").each(function(H,I){var G=A(I).attr("name");
if(A(I).parents("fieldset.checkbox_group").length>0){if(A(I).is(":checked")){if(!E[G]||E[G]==""){E[G]=A(I).val()
}else{E[G]=E[G]+","+A(I).val()
}}else{if(!E[G]){E[G]=""
}}if(!F[G]){F[G]=G
}}else{E[G]=A(I).is(":checked")?A(I).val():""
}if(A.browser.msie&&parseInt(A.browser.version,10)===8){if(A.isArray(E[G])){E[G]=E[G].length>0?E[G][0]:""
}}});
for(var C in F){E[C]=""+E[C]+""
}D.find("fieldset.radio_group").each(function(H,J){var G=A(J).find("input[type=radio]").eq(0).attr("name");
var I=A(J).find("input[type=radio]:checked");
if(I.length==1){E[G]=I.eq(0).val()
}else{E[G]=""
}if(A.browser.msie&&parseInt(A.browser.version,10)===8){if(A.isArray(E[G])){E[G]=E[G].length>0?E[G][0]:""
}}});
return E
}
})(jQuery,window);
(function(A,B){A.fn.ieplaceholder=function(){if(A(this).data("ieplaceholder-set")){return 
}if(A(this).attr("type")=="hidden"){A(this).data("ie-value",A(this).val());
return 
}var C=this;
A(this).data("ie-value","").keyup(function(D){C.data("ie-value",C.val())
}).data("ieplaceholder-set",true)
};
A(document).on("dom_loaded dom_changed ajax_inserted",function(C,D){if(A.browser.msie){A("input, textarea").each(function(E,F){A(F).ieplaceholder()
})
}})
})(jQuery,window);