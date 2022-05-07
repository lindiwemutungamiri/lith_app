(self.webpackChunk_N_E=self.webpackChunk_N_E||[]).push([[999],{633:function(n,t,e){"use strict";e.d(t,{rj:function(){return a},ck:function(){return d},pU:function(){return s},VY:function(){return c},vf:function(){return l}});var i=e(9163),o=e(6849),r=e(7229),a=i.ZP.div.withConfig({displayName:"ClassicGrid__Grid",componentId:"sc-td9pmq-0"})(["display:grid;padding-bottom:64px;grid-row-gap:40px;max-width:280px;margin:0 auto;@media ","{grid-template-columns:repeat(3,1fr);grid-column-gap:48px;grid-row-gap:40px;max-width:var(--container-max);}@media ","{grid-template-columns:repeat(5,1fr);grid-column-gap:40px;grid-row-gap:56px;margin-bottom:64px;}"],o.U.tablet,o.U.desktop),d=i.ZP.div.withConfig({displayName:"ClassicGrid__Item",componentId:"sc-td9pmq-1"})(["border:1px solid var(--line);background-color:var(--bg-alt);border-radius:var(--radius);cursor:pointer;"]),s=(0,i.ZP)(r.f).withConfig({displayName:"ClassicGrid__Media",componentId:"sc-td9pmq-2"})(["display:flex;align-items:center;justify-content:center;transition:0.3s;@media ","{:hover{transform:scale(1.04);}}"],o.U.desktop),c=i.ZP.div.withConfig({displayName:"ClassicGrid__Content",componentId:"sc-td9pmq-3"})(["font-size:14px;padding-bottom:16px;padding-left:16px;padding-right:16px;text-align:center;"]),l=i.ZP.div.withConfig({displayName:"ClassicGrid__ImageFile",componentId:"sc-td9pmq-4"})(["max-height:61.8%;max-width:66%;"])},6826:function(n,t,e){"use strict";var i=e(7294),o=e(9163),r=e(1528),a=e(2469),d=e(6849),s=e(3613),c=e(5893),l=(0,o.ZP)(r.aV).withConfig({displayName:"DownloadModal__Overlay",componentId:"sc-p17csy-0"})(["background-color:rgba(43,46,56,.9);top:0;left:0;right:0;bottom:0;position:fixed;"]),p=(0,o.ZP)(r.VY).withConfig({displayName:"DownloadModal__Content",componentId:"sc-p17csy-1"})(["position:fixed;top:50%;left:50%;transform:translate(-50%,-50%);background-color:#fff;border-radius:var(--radius);padding:16px 24px;outline:none;margin-top:-40px;width:var(--container);max-width:800px;@media ","{padding:24px 40px;}@media ","{padding:32px 56px;}"],d.U.tablet,d.U.tablet),u=o.ZP.div.withConfig({displayName:"DownloadModal__Header",componentId:"sc-p17csy-2"})(["text-align:right;button{cursor:pointer;background-color:transparent;border:none;padding:0;}svg{height:16px;width:16px;}"]),g=o.ZP.div.withConfig({displayName:"DownloadModal__Main",componentId:"sc-p17csy-3"})(["padding-top:16px;align-items:center;overflow:auto;@media ","{display:flex;justify-content:space-between;flex-direction:row;padding-top:24px;align-items:flex-start;}"],d.U.tablet),m=o.ZP.div.withConfig({displayName:"DownloadModal__Media",componentId:"sc-p17csy-4"})(["flex-shrink:1;@media ","{width:calc(40% - 24px);}@media ","{width:calc(50% - 40px);}"],d.U.tablet,d.U.desktop),h=o.ZP.div.withConfig({displayName:"DownloadModal__ImageFile",componentId:"sc-p17csy-5"})(["{}object-fit:cover;{}max-width:100%;max-height:224px;padding-bottom:16px;@media ","{{}{}max-width:100%;max-height:240px;padding-top:0;}"],d.U.tablet),x=o.ZP.div.withConfig({displayName:"DownloadModal__Actions",componentId:"sc-p17csy-6"})(["display:flex;flex-direction:column;max-height:290px;margin-top:32px;overflow:auto;justify-content:center;@media ","{width:calc(60% - 24px);margin-top:0;max-height:auto;}@media ","{width:calc(50% - 40px);}"],d.U.tablet,d.U.desktop),f=o.ZP.h2.withConfig({displayName:"DownloadModal__Title",componentId:"sc-p17csy-7"})(["margin:0;margin-bottom:24px;@media ","{margin-bottom:40px;}"],d.U.desktop),w=o.ZP.button.withConfig({displayName:"DownloadModal__DownloadBtn",componentId:"sc-p17csy-8"})(["width:320px;max-width:100%;height:40px;background-color:",";color:var(--text-dark);outline:none;border:",";border-radius:var(--radius);font-size:",";cursor:pointer;font-weight:",";transition:background-color 0.3s,border-color 0.3s;margin-bottom:24px;@media ","{margin-bottom:32px;:hover{background-color:",";border-color:","}}"],(function(n){return n.main?"#57e1bd":"var(--bg)"}),(function(n){return n.main?"none":"1px solid var(--line)"}),(function(n){return n.main?"0.85rem":"0.825rem"}),(function(n){return n.main?"var(--weight-semi)":"var(--weight)"}),d.U.desktop,(function(n){return n.main?"#2cd9ac":"var(--bg-alt)"}),(function(n){return n.main?"transparent":"#cacaca"}));t.Z=function(n){var t=n.modalOpen,e=n.illustration,o=n.toggleModal,d=n.currentColor,v=n.downloadSvg,b=n.downloadPng;if(!e)return null;(0,i.useEffect)((function(){(0,s.$o)(d)}));return(0,c.jsxs)(r.fC,{open:t,onOpenChange:function(){return o()},children:[(0,c.jsx)(l,{}),(0,c.jsxs)(p,{onOpenAutoFocus:function(n){return n.preventDefault()},children:[(0,c.jsx)(u,{children:(0,c.jsx)(r.x8,{children:(0,c.jsx)(a.ypG,{})})}),(0,c.jsxs)(g,{children:[(0,c.jsx)(m,{children:(0,c.jsx)(h,{id:"currentIllo",className:"grid_media","data-src":e.image})}),(0,c.jsxs)(x,{children:[(0,c.jsx)(f,{children:e.title}),(0,c.jsx)(w,{main:!0,onClick:function(){var n=document.getElementById("currentIllo");n.removeAttribute("id"),n.removeAttribute("class");var t=(0,s.x1)(n),i="undraw_".concat(e.slug.replace("illustrations-",""));v(t,i)},children:"Download SVG for your projects"}),(0,c.jsx)(w,{onClick:function(){b(e.image)},children:"Download PNG for your blog / social"})]})]})]})]})}},6504:function(n,t,e){"use strict";e.r(t),e.d(t,{__N_SSP:function(){return Z},default:function(){return P}});var i=e(266),o=e(809),r=e.n(o),a=e(7294),d=e(1664),s=(e(6849),e(9241)),c=e(5500),l=e(4128),p=e(8533),u=e(633),g=e(3613),m=e(9077),h=e(6826),x=e(3729),f=e.n(x),w=e(2978),v=e(1234),b=e(100),_=e(6371),j=e(2469),y=e(9163);var C=e(5893),k=(y.ZP.a.withConfig({displayName:"Announcement__Wrapper",componentId:"sc-1wkaw6w-0"})(["margin:0 auto;margin-top:-36px;margin-bottom:40px;height:40px;background-color:var(--bg-alt);border:1px solid var(--line);border-radius:var(--radius);max-width:640px;padding:0 24px;display:flex;align-items:center;justify-content:center;font-size:14px;transition:border-color 0.3s;u{color:var(--primary);}&:hover{border-color:#ccc;}"]),y.ZP.div.withConfig({displayName:"Announcement__Logo",componentId:"sc-1wkaw6w-1"})(["background-color:var(--bg);height:24px;width:24px;border-radius:999px;border:1px solid var(--text-dark);display:flex;align-items:center;justify-content:center;margin-right:12px;svg{width:16px;height:16px;}"]),y.ZP.p.withConfig({displayName:"Announcement__Text",componentId:"sc-1wkaw6w-2"})([""]),function(n){return(0,g.iW)()}),Z=!0,P=function(n){var t=(0,a.useState)(n.illustrations),e=t[0],o=t[1],x=(0,a.useState)(n.hasMore),y=x[0],Z=x[1],P=(0,a.useState)(n.nextPage),N=P[0],I=P[1],M=(0,a.useState)("#6c63ff"),S=M[0],U=M[1],D=(0,a.useState)(null),E=(D[0],D[1]),q=(0,a.useState)(!1),G=q[0],A=q[1],O=(0,a.useState)(null),T=O[0],V=O[1],z=(0,a.useRef)(),H=(0,b.Z)(z);(0,a.useEffect)((function(){(0,_.Nc)()}),[]),(0,a.useEffect)((function(){return window.addEventListener("pagehide",k),function(){window.removeEventListener("pagehide",k)}}),[k]),(0,a.useEffect)((function(){var n=(0,g.St)();if(n&&n.length>5)return E(S),U(n),(0,g.$o)(n);(0,g.$o)(S)}),[e]);var L=function(n){E(S),U(n),(0,g.qt)(S,n),(0,g.gp)(n)},B=function(n){V(n),A(!G)},F=function(){var n=(0,i.Z)(r().mark((function n(t){var e,i,o;return r().wrap((function(n){for(;;)switch(n.prev=n.next){case 0:return n.prev=0,n.next=3,(0,c.Sq)(t,S);case 3:return e=n.sent,n.next=6,e.json();case 6:i=n.sent,o=(0,g.kq)(i.image,"image/png"),f()(o,i.title,"image/png"),(0,_.Kz)("png_download",T.title,"illustrations"),V(null),A(!1),n.next=17;break;case 14:n.prev=14,n.t0=n.catch(0),console.log(n.t0);case 17:case"end":return n.stop()}}),n,null,[[0,14]])})));return function(t){return n.apply(this,arguments)}}();return(0,C.jsxs)(l.T3,{children:[(0,C.jsx)(s.Z,{title:"Illustrations | unDraw",url:"https://undraw.co/illustrations"}),(0,C.jsxs)(v.Z,{isVisible:H,children:[(0,C.jsx)(m.ZP,{pickerColor:S,handleColorChange:L}),(0,C.jsx)(d.default,{href:"/search",passHref:!0,children:(0,C.jsx)("a",{children:"Search"})}),(0,C.jsx)(w.Z,{})]}),(0,C.jsxs)(l.h4,{children:[(0,C.jsx)(d.default,{href:"/",children:(0,C.jsx)("h1",{children:"unDraw"})}),(0,C.jsxs)(l.y7,{children:[(0,C.jsx)(m.ZP,{pickerColor:S,handleColorChange:L}),(0,C.jsx)(d.default,{href:"/handcrafts",passHref:!0,children:(0,C.jsx)(l.h1,{children:"Handcrafts"})}),(0,C.jsx)(d.default,{href:"/search",passHref:!0,children:(0,C.jsxs)(l.h1,{children:[(0,C.jsx)(l.Eq,{children:"Search"}),(0,C.jsx)(l.ft,{children:(0,C.jsx)(j._Ve,{})})]})}),(0,C.jsx)(w.Z,{}),(0,C.jsx)("div",{ref:z})]})]}),(0,C.jsxs)(l.fi,{children:[(0,C.jsx)(l.Ck,{children:"/illustrations"}),(0,C.jsx)("p",{children:"Browse to find the images that fit your needs and click to download. Use the on-the-fly color image generation to match your brand identity."})]}),(0,C.jsx)(p.Z,{dataLength:e.length,next:function(){(0,c.Cd)(N).then(function(){var n=(0,i.Z)(r().mark((function n(t){var i;return r().wrap((function(n){for(;;)switch(n.prev=n.next){case 0:return n.next=2,t.json();case 2:i=n.sent,o(e.concat(i.illos)),Z(i.hasMore),I(i.nextPage),(0,_.Kz)("load_more","illustrations_scroll",i.nextPage);case 7:case"end":return n.stop()}}),n)})));return function(t){return n.apply(this,arguments)}}()).catch((function(n){return console.log(n)}))},hasMore:y,loader:(0,C.jsx)("p",{style:{textAlign:"center"},children:"Loading..."}),scrollThreshold:.9,children:(0,C.jsx)(u.rj,{children:e.map((function(n,t){return(0,C.jsxs)(u.ck,{onClick:function(){return B(n)},children:[(0,C.jsx)(u.pU,{ratio:4/3,children:(0,C.jsx)(u.vf,{className:"grid_media","data-src":n.image})}),(0,C.jsx)(u.VY,{children:n.title})]},n._id||t)}))})}),(0,C.jsx)(h.Z,{modalOpen:G,illustration:T,toggleModal:B,currentColor:S,downloadSvg:function(n,t){try{f()(n,t,"image/svg"),(0,_.Kz)("svg_download",T.title,"illustrations"),(0,c.Ty)(T._id),V(null),A(!1)}catch(e){console.log(e)}},downloadPng:F})]})}},4840:function(n,t,e){(window.__NEXT_P=window.__NEXT_P||[]).push(["/illustrations",function(){return e(6504)}])}},function(n){n.O(0,[774,409,5,342,117,533,722,888,179],(function(){return t=4840,n(n.s=t);var t}));var t=n.O();_N_E=t}]);