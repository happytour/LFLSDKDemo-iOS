(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-f4520ea2"],{"12de":function(module,__webpack_exports__,__webpack_require__){"use strict";var core_js_modules_es_number_constructor_js__WEBPACK_IMPORTED_MODULE_0__=__webpack_require__("a9e3"),core_js_modules_es_number_constructor_js__WEBPACK_IMPORTED_MODULE_0___default=__webpack_require__.n(core_js_modules_es_number_constructor_js__WEBPACK_IMPORTED_MODULE_0__),core_js_modules_es_array_concat_js__WEBPACK_IMPORTED_MODULE_1__=__webpack_require__("99af"),core_js_modules_es_array_concat_js__WEBPACK_IMPORTED_MODULE_1___default=__webpack_require__.n(core_js_modules_es_array_concat_js__WEBPACK_IMPORTED_MODULE_1__),core_js_modules_es_array_join_js__WEBPACK_IMPORTED_MODULE_2__=__webpack_require__("a15b"),core_js_modules_es_array_join_js__WEBPACK_IMPORTED_MODULE_2___default=__webpack_require__.n(core_js_modules_es_array_join_js__WEBPACK_IMPORTED_MODULE_2__),core_js_modules_es_parse_int_js__WEBPACK_IMPORTED_MODULE_3__=__webpack_require__("e25e"),core_js_modules_es_parse_int_js__WEBPACK_IMPORTED_MODULE_3___default=__webpack_require__.n(core_js_modules_es_parse_int_js__WEBPACK_IMPORTED_MODULE_3__),core_js_modules_web_timers_js__WEBPACK_IMPORTED_MODULE_4__=__webpack_require__("4795"),core_js_modules_web_timers_js__WEBPACK_IMPORTED_MODULE_4___default=__webpack_require__.n(core_js_modules_web_timers_js__WEBPACK_IMPORTED_MODULE_4__),_assets_js_dsbridge_js__WEBPACK_IMPORTED_MODULE_5__=__webpack_require__("49fb"),_assets_js_dsbridge_js__WEBPACK_IMPORTED_MODULE_5___default=__webpack_require__.n(_assets_js_dsbridge_js__WEBPACK_IMPORTED_MODULE_5__),infoView;__webpack_exports__["a"]={name:"informationPage",data:function(){return{informationList:[],getInformationConfData:[],roles:{},watchConut:0,ScrollFlag:!0,sum1:1,adList:[]}},watch:{adList:function(t,e){var o=this;for(var s in t){var n=document.getElementsByClassName("infobanner")[s];o.showNativeExpressAd(t[s],n)}}},mounted:function(){var t=this,e=localStorage.getItem("obj");t.obj=JSON.parse(e),t.infoList(10,1),window.addEventListener("scroll",t.handleScroll,!0)},methods:{handleScroll:function(){var t=this,e=document.documentElement.scrollTop||document.body.scrollTop,o=document.documentElement.clientHeight||document.body.clientHeight,s=document.documentElement.scrollHeight||document.body.scrollHeight;Number(e)+Number(o)>Number(s)-200?t.ScrollFlag&&(t.ScrollFlag=!1,console.log("加载。。。"),t.infoList(10,2)):t.ScrollFlag||(t.ScrollFlag=!0,console.log("离开。。。"))},infoList:function infoList(count,operation){var _this=this,exclusiveObj={count:count,operation:operation,scenario:"0x010100"},requestData=Object.assign(_this.obj,exclusiveObj),redata=_this.byte256.byte256.encode(_this.key,JSON.stringify(_this.obj));_this.$axios({method:"post",url:"/info/list",data:redata}).then((function(res){if(console.log(res),200===res.data.code){var reData=JSON.parse(_this.byte256.byte256.decode(_this.reverse_key,res.data.data));if(console.log(reData),_this.informationList=_this.informationList.concat(reData),1==operation)_this.getInformationConf();else if(2==operation){for(var newArr1=[],newArr2=[],randomNum=100*Math.random(),i=Math.floor(randomNum)%_this.getInformationConfData.informationStrategy.length,slotIds=_this.getInformationConfData.informationStrategy[i].slotIds,ss=0;ss<_this.getInformationConfData.informationStrategy[i].roles.length;ss++)newArr1.push(Number(_this.getInformationConfData.informationStrategy[i].roles[ss].informationCount)),newArr2.push(Number(_this.getInformationConfData.informationStrategy[i].roles[ss].adCount));var sum1=eval(newArr1.join("+"));_this.sum1=sum1;var sum2=eval(newArr2.join("+")),arr1=_this.secPageRowFormat(newArr1),arr2=_this.secPageRowFormat(newArr2);for(var ww in _this.informationList)_this.informationList[ww].informationCount=arr1[ww%sum1],_this.informationList[ww].adCount=arr2[ww%sum2],console.log("informationCount===",arr1[ww%sum1]),console.log("adCount===",arr2[ww%sum2]);var counts=0;for(var c in _this.informationList)counts+=_this.informationList[c].adCount;for(var shang=parseInt(counts/slotIds.length),yu=counts%slotIds.length,k=0;k<slotIds.length;k++)k<yu?_this.loadNativeExpressAd(slotIds[k],shang+1):_this.loadNativeExpressAd(slotIds[k],shang)}}}))},getInformationConf:function getInformationConf(){var _this=this,redata=_this.byte256.byte256.encode(_this.key,JSON.stringify(_this.obj));_this.$axios({method:"post",url:"/getInformationConf",data:redata}).then((function(res){if(200===res.data.code){var reData=JSON.parse(_this.byte256.byte256.decode(_this.reverse_key,res.data.data));console.log(reData),_this.getInformationConfData=reData,_this.$store.commit("postRedRewardCount",reData.redRewardCount),_this.$store.commit("postRedRewardAmount",reData.redRewardAmount);for(var newArr1=[],newArr2=[],randomNum=100*Math.random(),i=Math.floor(randomNum)%reData.informationStrategy.length,slotIds=reData.informationStrategy[i].slotIds,ss=0;ss<reData.informationStrategy[i].roles.length;ss++)newArr1.push(Number(reData.informationStrategy[i].roles[ss].informationCount)),newArr2.push(Number(reData.informationStrategy[i].roles[ss].adCount));var sum1=eval(newArr1.join("+")),sum2=eval(newArr2.join("+")),arr1=_this.secPageRowFormat(newArr1),arr2=_this.secPageRowFormat(newArr2);for(var ww in _this.sum1=sum1,_this.informationList)_this.informationList[ww].informationCount=arr1[ww%sum1],_this.informationList[ww].adCount=arr2[ww%sum2];var counts=0;for(var c in _this.informationList)counts+=_this.informationList[c].adCount;for(var shang=parseInt(counts/slotIds.length),yu=counts%slotIds.length,k=0;k<slotIds.length;k++)k<yu?_this.loadNativeExpressAd(slotIds[k],shang+1):_this.loadNativeExpressAd(slotIds[k],shang)}}))},secPageRowFormat:function(t){for(var e={},o=0,s=t,n=0;n<s.length;n++){for(var a=s[n],r=0;r<a;r++)e[o+r]=a;o+=a}return e},toInFo:function(t){var e=this;for(var o in e.adList)e.destroyNativeExpressAd(e.adList[o]);setTimeout((function(){e.$store.commit("clickArticle",1),console.log(e.$store.state.infoCount),e.$router.push({path:"/infomationDetails",query:{item:e.informationList[t]}})}),200)},goBack:function(){var t=this;t.getInformationConfData.readCount-t.$store.state.infoCount>0?t.$toast("再需要浏览"+(t.getInformationConfData.readCount-t.$store.state.infoCount)+"次内容就可以领取奖励了哦～"):t.$router.back()},loadNativeExpressAd:function(t,e){var o=this,s=document.getElementsByClassName("information_list")[0].children[0],n=s.getBoundingClientRect().width,a=s.getBoundingClientRect().height,r={code_id:t,count:e,w:n,h:a};dsBridge.call("lyh5x.fad.nativeexpress.load",r,o.neli)},renderNativeExpressAd:function(t){var e={view:t};dsBridge.call("lyh5x.fad.nativeexpress.render",e)},showNativeExpressAd:function(t,e){var o=e.getBoundingClientRect().width*window.devicePixelRatio,s=e.getBoundingClientRect().height*window.devicePixelRatio,n=0,a=e.offsetTop*window.devicePixelRatio,r={view:t,w:o,h:s,x:n,y:a,fixedOn:!1};dsBridge.call("lyh5x.fad.nativeexpress.show",r)},destroyNativeExpressAd:function(t){var e={ad:"",view:t,views:""};dsBridge.call("lyh5x.fad.nativeexpress.destroy",e)},neli:function(t){var e=this;if("onError"==t.event)console.log("onError====",t.msg);else if("onAdLoad"==t.event)for(var o in console.log("onAdLoad====",t.msg),t.views)e.renderNativeExpressAd(t.views[o]);else if("onRenderSuccess"==t.event)console.log("onRenderSuccess====",t.view),e.adList.push(t.view),console.log(e.adList);else if("onRenderFail"==t.event)console.log("onRenderFail====",t.msg);else if("onAdShow"==t.event)console.log("onAdShow=====",t);else if("onAdClicked"==t.event)t.id;else if("onAdClosed"==t.event)t.id;else if("onAdClosed"==t.event)t.id}},beforeDestroy:function(){var t=this;window.removeEventListener("scroll",t.handleScroll,!0)}}},"2266d":function(t,e,o){},"27fd":function(t,e,o){"use strict";o("2266d")},8028:function(t,e,o){"use strict";o.r(e);var s=function(){var t=this,e=t.$createElement,o=t._self._c||e;return o("div",{staticClass:"informationPage"},[o("div",{staticClass:"informationPage_head"},[o("div",{staticClass:"informationPage_head_box"},[t._m(0),o("p",{staticClass:"informationPage_head_title2"},[o("i",{staticClass:"icon_click"}),t.getInformationConfData.readCount-t.$store.state.infoCount<=0?o("span",[t._v("已获得奖励")]):o("span",[t._v("点击 "+t._s(t.getInformationConfData.readCount-t.$store.state.infoCount<0?0:t.getInformationConfData.readCount-t.$store.state.infoCount)+" 次内容即可领取奖励")])])]),o("p",{class:t.getInformationConfData.readCount-t.$store.state.infoCount>0?"informationPage_head_btn":"informationPage_head_btn act",on:{click:t.goBack}},[t._v("继续赚金币 >")])]),o("ul",{staticClass:"information_list"},t._l(t.informationList,(function(e,s){return o("li",{key:e.content_id,on:{click:function(e){return t.toInFo(s)}}},[o("p",{staticClass:"title"},[t._v(t._s(e.title))]),o("div",{staticClass:"img_list"},t._l(e.list_images,(function(t,e){return o("div",{directives:[{name:"show",rawName:"v-show",value:0==e,expression:"index == 0"}],key:t.surl,staticClass:"img_list_box"},[o("img",{attrs:{src:t.img_url,alt:""}})])})),0),o("p",{staticClass:"source"},[t._v(t._s(e.source+" "+e.read_count+"阅读"))]),(s+e.informationCount)%t.sum1==0?o("div",{staticClass:"infobanner_act"},t._l(e.adCount,(function(t,e){return o("div",{staticClass:"infobanner"})})),0):t._e()])})),0)])},n=[function(){var t=this,e=t.$createElement,o=t._self._c||e;return o("p",{staticClass:"informationPage_head_title1"},[o("i",{staticClass:"icon_bell"}),o("span",[t._v("标题文案标题文案标题文案标")])])}],a=o("12de"),r=a["a"],i=(o("27fd"),o("2877")),_=Object(i["a"])(r,s,n,!1,null,"5cc327ce",null);e["default"]=_.exports}}]);
//# sourceMappingURL=chunk-f4520ea2.a0329757.js.map