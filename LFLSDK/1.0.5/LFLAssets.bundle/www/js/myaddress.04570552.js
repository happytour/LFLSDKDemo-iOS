(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["myaddress"],{"0277":function(t,s,e){"use strict";e("a482")},5013:function(t,s,e){"use strict";e.r(s);var a=function(){var t=this,s=t.$createElement,e=t._self._c||s;return e("div",{staticClass:"myaddress"},[e("div",{staticClass:"myaddress_header"},[e("i",{staticClass:"icon_arrow_left",on:{click:t.goBack}}),e("p",{staticClass:"myaddress_title"},[t._v("我的收货地址")])]),e("van-address-list",{attrs:{switchable:!1,list:t.list,"default-tag-text":"默认"},on:{add:t.onAdd,edit:t.onEdit,"click-item":t.clickitem}})],1)},d=[],i=(e("b0c0"),{name:"myaddress",data:function(){return{list:[],addList:[]}},mounted:function(){var t=localStorage.getItem("obj");this.obj=JSON.parse(t),this.userAddressList()},methods:{goBack:function(){this.$router.go(-1)},clickitem:function(t,s){if(0==this.$route.query.type){var e=JSON.stringify(t);localStorage.setItem("addressObj",e),this.goBack()}},onAdd:function(){var t=this;t.$router.push({path:"/addAddress"})},onEdit:function(t,s){var e=this;e.$router.push({path:"/addAddress",query:{item:e.addList[s]}})},userAddressList:function(){var t=this,s=t.byte256.byte256.encode(t.key,JSON.stringify(t.obj));t.$axios({method:"post",url:"/user/address/list",data:s}).then((function(s){if(console.log(s),200===s.data.code){var e=JSON.parse(t.byte256.byte256.decode(t.reverse_key,s.data.data));for(var a in console.log(e),t.addList=e,e){var d={};d.id=e[a].id,d.name=e[a].name,d.tel=e[a].phone,d.address=e[a].province+e[a].city+e[a].county+e[a].detailAddress,d.isDefault=!e[a].defaultAddress,t.list.push(d)}}}))}}}),r=i,o=(e("0277"),e("2877")),n=Object(o["a"])(r,a,d,!1,null,"57509794",null);s["default"]=n.exports},a482:function(t,s,e){}}]);
//# sourceMappingURL=myaddress.04570552.js.map