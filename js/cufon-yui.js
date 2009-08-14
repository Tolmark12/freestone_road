/*
 * Copyright (c) 2008 Simo Kinnunen.
 * Licensed under the MIT license.
 */
var Cufon=(function(){var J=function(){return J.replace.apply(null,arguments)};var Q=J.DOM={ready:(function(){var V=false,X={loaded:1,complete:1};var U=[],W=function(){if(V){return}V=true;for(var Y;Y=U.shift();Y()){}};if(document.addEventListener){document.addEventListener("DOMContentLoaded",W,false);window.addEventListener("pageshow",W,false)}if(!window.opera&&document.readyState){(function(){X[document.readyState]?W():setTimeout(arguments.callee,10)})()}if(document.readyState&&document.createStyleSheet){(function(){try{document.body.doScroll("left");W()}catch(Y){setTimeout(arguments.callee,1)}})()}M(window,"load",W);return function(Y){if(!arguments.length){W()}else{V?Y():U.push(Y)}}})()};var K=J.CSS={Size:function(V,U){this.value=parseFloat(V);this.unit=String(V).match(/[a-z%]*$/)[0]||"px";this.convert=function(W){return W/U*this.value};this.convertFrom=function(W){return W/this.value*U};this.toString=function(){return this.value+this.unit}},getStyle:function(V){var U=document.defaultView;if(U&&U.getComputedStyle){return new A(U.getComputedStyle(V,null))}if(V.currentStyle){return new A(V.currentStyle)}return new A(V.style)},ready:(function(){var W=false;var V=[],X=function(){W=true;for(var Z;Z=V.shift();Z()){}};var U=Object.prototype.propertyIsEnumerable?E("style"):{length:0};var Y=E("link");Q.ready(function(){var c=0,b;for(var a=0,Z=Y.length;b=Y[a],a<Z;++a){if(!b.disabled&&b.rel.toLowerCase()=="stylesheet"){++c}}if(document.styleSheets.length>=U.length+c){X()}else{setTimeout(arguments.callee,10)}});return function(Z){if(W){Z()}else{V.push(Z)}}})(),supports:function(W,V){var U=document.createElement("span").style;if(U[W]===undefined){return false}U[W]=V;return U[W]===V},textAlign:function(X,W,U,V){if(W.get("textAlign")=="right"){if(U>0){X=" "+X}}else{if(U<V-1){X+=" "}}return X},textDecoration:function(Z,Y){if(!Y){Y=this.getStyle(Z)}var V={underline:null,overline:null,"line-through":null};for(var U=Z;U.parentNode&&U.parentNode.nodeType==1;){var X=true;for(var W in V){if(V[W]){continue}if(Y.get("textDecoration").indexOf(W)!=-1){V[W]=Y.get("color")}X=false}if(X){break}Y=this.getStyle(U=U.parentNode)}return V},textShadow:H(function(Y){if(Y=="none"){return null}var X=[],Z={},U,V=0;var W=/(#[a-f0-9]+|[a-z]+\(.*?\)|[a-z]+)|(-?[\d.]+[a-z%]*)|,/ig;while(U=W.exec(Y)){if(U[0]==","){X.push(Z);Z={},V=0}else{if(U[1]){Z.color=U[1]}else{Z[["offX","offY","blur"][V++]]=U[2]}}}X.push(Z);return X}),color:H(function(V){var U={};U.color=V.replace(/^rgba\((.*?),\s*([\d.]+)\)/,function(X,W,Y){U.opacity=parseFloat(Y);return"rgb("+W+")"});return U}),textTransform:function(V,U){return V[{uppercase:"toUpperCase",lowercase:"toLowerCase"}[U.get("textTransform")]||"toString"]()}};J.VML={parsePath:function(X){var U=[],W=/([mrvxe])([^a-z]*)/g,V;while(V=W.exec(X)){U.push({type:V[1],coords:V[2].split(",")})}return U}};function N(V){var U=this.face=V.face;this.glyphs=V.glyphs;this.w=V.w;this.baseSize=parseInt(U["units-per-em"],10);this.family=U["font-family"].toLowerCase();this.weight=U["font-weight"];this.style=U["font-style"]||"normal";this.viewBox=(function(){var W=U.bbox.split(/\s+/);return{minX:parseInt(W[0],10),minY:parseInt(W[1],10),width:parseInt(W[2],10)-parseInt(W[0],10),height:parseInt(W[3],10)-parseInt(W[1],10),toString:function(){return[this.minX,this.minY,this.width,this.height].join(" ")}}})();this.ascent=-parseInt(U.ascent,10);this.descent=-parseInt(U.descent,10);this.height=-this.ascent+this.descent}function D(){this.styles={};this.add=function(U){(this.styles[U.style]||(this.styles[U.style]={}))[U.weight]=U};this.get=function(V,X){var U=this.styles[V],W;if(!U){return null}X={normal:400,bold:700}[X]||parseInt(X,10);if(U[X]){return U[X]}for(var Y in U){Y=parseInt(Y,10);if(!W||(Y<X&&Y>W)){W=Y}}return U[W]}}function T(){var W={},U=0;function V(X){return X.cufid||(X.cufid=++U)}this.get=function(X){var Y=V(X);return W[Y]||(W[Y]={})}}function A(U){var W={},V={};this.get=function(X){return W[X]!=undefined?W[X]:U[X]};this.getSize=function(Y,X){return V[Y]||(V[Y]=new K.Size(this.get(Y),X))};this.extend=function(X){for(var Y in X){W[Y]=X[Y]}return this}}function M(V,U,W){if(V.addEventListener){V.addEventListener(U,W,false)}else{if(V.attachEvent){V.attachEvent("on"+U,function(){return W.apply(V,arguments)})}}}function H(U){var V={};return function(W){if(!V.hasOwnProperty(W)){V[W]=U.apply(null,arguments)}return V[W]}}function B(Z,Y){if(!Y){Y=K.getStyle(Z)}var V=Y.get("fontFamily").split(/\s*,\s*/),X;for(var W=0,U=V.length;W<U;++W){X=V[W].toLowerCase();if(X[0]=='"'||X[0]=="'"){X=X.substring(1,X.length-1)}if(G[X]){return G[X].get(Y.get("fontStyle"),Y.get("fontWeight"))}}return null}function E(U){return document.getElementsByTagName(U)}function F(){var U={},X;for(var W=0,V=arguments.length;W<V;++W){for(X in arguments[W]){U[X]=arguments[W][X]}}return U}function L(W,d,U,e,X,V){if(e.separateWords){var b=document.createDocumentFragment(),Z;var c=d.split(/\s+/);if(O){if(/^\s/.test(d)){c.unshift("")}if(/\s$/.test(d)){c.push("")}}for(var a=0,Y=c.length;a<Y;++a){Z=S[e.engine](W,K.textAlign(c[a],U,a,Y),U,e,X,V,a<Y-1);if(Z){b.appendChild(Z)}}return b}return S[e.engine].apply(null,arguments)}function I(V,c){var a=C.get(V);if(!c){c=a.options}var W,U,Z;for(var X=V.firstChild;X;X=Z){Z=X.nextSibling;if(X.nodeType==1){if(!X.firstChild){continue}if(!/cufon/.test(X.className)){arguments.callee(X,c);continue}}var b=X.nodeType==3?X.data:X.alt;if(b===""){continue}if(!U){U=K.getStyle(V).extend(c)}if(!W){W=B(V,U)}if(!W){continue}var Y=L(W,b,U,c,X,V);if(Y){X.parentNode.replaceChild(Y,X)}else{X.parentNode.removeChild(X)}}if(!a.options){a.options=c}}var O=" ".split(/\s+/).length==0;var C=new T();var R=[];var S={},G={},P={enableTextDecoration:false,engine:null,printable:true,selector:(window.Sizzle||(window.$$&&function(U){return $$(U)})||window.$||(document.querySelectorAll&&function(U){return document.querySelectorAll(U)})||E),separateWords:true,textShadow:"none"};J.now=function(){Q.ready();return J};J.refresh=function(){var W=R.splice(0,R.length);for(var V=0,U=W.length;V<U;++V){J.replace.apply(null,W[V])}return J};J.registerEngine=function(V,U){if(!U){return J}S[V]=U;return J.set("engine",V)};J.registerFont=function(W){var U=new N(W),V=U.family;if(!G[V]){G[V]=new D()}G[V].add(U);return J.set("fontFamily",V)};J.replace=function(W,V,U){V=F(P,V);if(!V.engine){return J}if(typeof V.textShadow=="string"){V.textShadow=K.textShadow(V.textShadow)}if(!U){R.push(arguments)}if(W.nodeType||typeof W=="string"){W=[W]}K.ready(function(){for(var Y=0,X=W.length;Y<X;++Y){var Z=W[Y];if(typeof Z=="string"){J.replace(V.selector(Z),V,true)}else{I(Z,V)}}});return J};J.set=function(U,V){P[U]=V;return J};return J})();Cufon.registerEngine("canvas",(function(){var B=document.createElement("canvas");if(!B||!B.getContext||!B.getContext.apply){return null}B=null;var A=Cufon.CSS.supports("display","inline-block");var E=document.createElement("style");E.type="text/css";E.appendChild(document.createTextNode("@media screen,projection{.cufon-canvas{display:inline;display:inline-block;position:relative;vertical-align:middle;font-size:1px;line-height:1px}"+(A?".cufon-canvas canvas{position:relative}":".cufon-canvas canvas{position:absolute}")+".cufon-canvas .cufon-alt{display:none}}@media print{.cufon-canvas{padding:0 !important}.cufon-canvas canvas{display:none}.cufon-canvas .cufon-alt{display:inline}}"));document.getElementsByTagName("head")[0].appendChild(E);function D(N,H){var M=0,L=0;var F=Cufon.VML.parsePath(N);var G=new Array(F.length-1);generate:for(var J=0,I=F.length;J<I;++J){var K=F[J].coords;switch(F[J].type){case"v":G[J]={m:"bezierCurveTo",a:[M+Number(K[0]),L+Number(K[1]),M+Number(K[2]),L+Number(K[3]),M+=Number(K[4]),L+=Number(K[5])]};break;case"r":G[J]={m:"lineTo",a:[M+=Number(K[0]),L+=Number(K[1])]};break;case"m":G[J]={m:"moveTo",a:[M=Number(K[0]),L=Number(K[1])]};break;case"x":G[J]={m:"closePath"};break;case"e":break generate}H[G[J].m].apply(H,G[J].a)}return G}function C(J,I){for(var H=0,G=J.length;H<G;++H){var F=J[H];I[F.m].apply(I,F.a)}}return function(o,R,h,N,V,p){var T=o.viewBox;var H=h.getSize("fontSize",o.baseSize);var e=h.get("letterSpacing");e=(e=="normal")?0:H.convertFrom(parseInt(e,10));var U=0,f=0,d=0,P=0;var S=N.textShadow,b=[];if(S){for(var n=0,j=S.length;n<j;++n){var X=S[n];var a=H.convertFrom(parseFloat(X.offX));var Z=H.convertFrom(parseFloat(X.offY));b[n]=[a,Z];if(Z<U){U=Z}if(a>f){f=a}if(Z>d){d=Z}if(a<P){P=a}}}var s=Cufon.CSS.textTransform(R,h).split("");var F=0,Q=null;for(var n=0,j=s.length;n<j;++n){var O=o.glyphs[s[n]]||o.missingGlyph;if(!O){continue}F+=Q=Number(O.w||o.w)+e}if(Q===null){return null}f+=(T.width-Q);P+=T.minX;var M=document.createElement("span");M.className="cufon cufon-canvas";M.alt=R;var I=document.createElement("canvas");var t=M.style;var Y=I.style;var G=H.convert(T.height-U+d);var r=Math.ceil(G);var c=r/G;I.width=Math.ceil(H.convert(F+f-P)*c);I.height=r;U+=T.minY;Y.top=Math.round(H.convert(U-o.ascent))+"px";Y.left=Math.round(H.convert(P))+"px";var L=Math.ceil(H.convert(F*c))+"px";if(A){t.width=L;t.height=H.convert(o.height)+"px"}else{t.paddingLeft=L;t.paddingBottom=(H.convert(o.height)-1)+"px"}var q=I.getContext("2d"),W=r/T.height;q.scale(W,W);q.translate(-P,-U);q.lineWidth=o.face["underline-thickness"];q.save();function J(i,g){q.strokeStyle=g;q.beginPath();q.moveTo(0,i);q.lineTo(F,i);q.stroke()}var K=N.enableTextDecoration?Cufon.CSS.textDecoration(p,h):{};if(K.underline){J(-o.face["underline-position"],K.underline)}if(K.overline){J(o.ascent,K.overline)}q.fillStyle=h.get("color");function m(){for(var u=0,g=s.length;u<g;++u){var v=o.glyphs[s[u]]||o.missingGlyph;if(!v){continue}q.beginPath();if(v.d){if(v.code){C(v.code,q)}else{v.code=D("m"+v.d,q)}}q.fill();q.translate(Number(v.w||o.w)+e,0)}}if(S){for(var n=0,j=S.length;n<j;++n){var X=S[n];q.save();q.fillStyle=X.color;q.translate.apply(q,b[n]);m();q.restore()}}m();q.restore();if(K["line-through"]){J(-o.descent,K["line-through"])}M.appendChild(I);if(N.printable){var k=document.createElement("span");k.className="cufon-alt";k.appendChild(document.createTextNode(R));M.appendChild(k)}return M}})());Cufon.registerEngine("vml",(function(){if(!document.namespaces){return}document.write('<!--[if vml]><script type="text/javascript">Cufon.vmlEnabled=true;<\/script><![endif]-->');if(!Cufon.vmlEnabled){return}if(document.namespaces.cvml==null){document.namespaces.add("cvml","urn:schemas-microsoft-com:vml");document.write('<style type="text/css">@media screen{cvml\\:shape,cvml\\:group,cvml\\:shapetype,cvml\\:fill{behavior:url(#default#VML);display:inline-block;antialias:true;position:absolute}.cufon-vml{display:inline-block;position:relative;vertical-align:middle}.cufon-vml .cufon-alt{display:none}a .cufon-vml{cursor:pointer}}@media print{.cufon-vml *{display:none}.cufon-vml .cufon-alt{display:inline}}</style>')}var C=0;function B(E,F){return A(E,/(?:em|ex|%)$/i.test(F)?"1em":F)}function A(H,I){if(/px$/i.test(I)){return parseFloat(I)}var G=H.style.left,F=H.runtimeStyle.left;H.runtimeStyle.left=H.currentStyle.left;H.style.left=I;var E=H.style.pixelLeft;H.style.left=G;H.runtimeStyle.left=F;return E}function D(F,H){var E=document.createElement("cvml:shapetype");E.id="cufon-glyph-"+C++;F.typeRef="#"+E.id;E.stroked="f";E.coordsize=H.width+","+H.height;E.coordorigin=H.minX+","+H.minY;var G="m"+H.minX+","+H.minY+" r"+H.width+","+H.height;E.path=(F.d?"m"+F.d+"x":"")+G;document.body.insertBefore(E,document.body.firstChild)}return function(j,R,e,O,V,k,c){var U=j.viewBox;var G=e.computedFontSize||(e.computedFontSize=new Cufon.CSS.Size(B(k,e.get("fontSize"))+"px",j.baseSize));var b=e.computedLSpacing;if(b==undefined){b=e.get("letterSpacing");e.computedLSpacing=b=(b=="normal")?0:G.convertFrom(A(k,b))}var N=document.createElement("span");N.className="cufon cufon-vml";N.alt=R;var H=document.createElement("cvml:group");var r=N.runtimeStyle;var X=H.runtimeStyle;var F=G.convert(U.height);X.height=Math.ceil(F);X.top=Math.round(G.convert(U.minY-j.ascent));X.left=Math.round(G.convert(U.minX));var a=parseInt(X.height,10)/F;r.height=G.convert(-j.ascent+j.descent)+"px";var J=O.enableTextDecoration?Cufon.CSS.textDecoration(k,e):{};var Q=e.get("color");var o=Cufon.CSS.textTransform(R,e).split("");var E=0,Z=0,K=null;var T=O.textShadow;for(var h=0,f=o.length;h<f;++h){var P=j.glyphs[o[h]]||j.missingGlyph;if(!P){continue}if(!P.typeRef){D(P,U)}var L=document.createElement("cvml:shape");L.type=P.typeRef;var m=L.runtimeStyle;m.width=U.width;m.height=U.height;m.top=0;m.left=Z;m.zIndex=1;L.fillcolor=Q;H.appendChild(L);if(T){for(var Y=0,d=T.length;Y<d;++Y){var W=T[Y];var q=Cufon.CSS.color(W.color);var I=L.cloneNode(false),S=I.runtimeStyle;S.top=G.convertFrom(parseFloat(W.offY));S.left=Z+G.convertFrom(parseFloat(W.offX));S.zIndex=0;I.fillcolor=q.color;if(q.opacity){var n=document.createElement("cvml:fill");n.opacity=q.opacity;I.appendChild(n)}H.appendChild(I)}}K=Number(P.w||j.w)+b;E+=K;Z+=K}if(K===null){return null}var M=-U.minX+E+(U.width-K);H.coordsize=M+","+U.height;X.width=G.convert(M*a);r.width=Math.max(Math.ceil(G.convert(E*a)),0);N.appendChild(H);if(O.printable){var g=document.createElement("span");g.className="cufon-alt";g.innerText=R;N.appendChild(g)}if(!c){N.appendChild(document.createElement("cvml:group"))}return N}})());