/**
 * jQuery Serialize List
 * Copyright (c) 2009 Mike Botsko, Botsko.net LLC
 * Licensed under the MIT (http://www.opensource.org/licenses/mit-license.php)
 * Copyright notice and license must remain intact for legal use
 * Version .2
 *
 * Serialize an unordered or ordered list item. Optional ability
 * to determine which attributes are included. The serialization
 * will be read by PHP as a multidimensional array which you may
 * use for saving state.
 *
 * http://github.com/botskonet/jquery.serialize-list
 */
!function(t){t.fn.serializelist=function(e){var i,n,r,o={attributes:["id"],allow_nest:!0,prepend:"ul",att_regex:!1,is_child:!1},s=t.extend(o,e),a=s.attributes,l="",c=function(t,e){if(!s.att_regex)return e;for(n in s.att_regex)if(s.att_regex[n].att===t)return e.replace(s.att_regex[n].regex,"")};return s.is_child||(s.prepend="&"+s.prepend),this.each(function(e,n){t(n).children().each(function(n,o){if(s.allow_nest||a.length>1)for(var u=0;u<a.length;u++)i=c(a[u],t(o).attr(a[u])),l+=s.prepend+"["+e+"]["+n+"]["+a[u]+"]="+i;else i=c(a[0],t(o).attr(a[0])),l+=s.prepend+"["+e+"]["+n+"]="+i;s.allow_nest&&(r=s.prepend+"["+e+"]["+n+"][children]",t(o).children().each(function(){("UL"==this.tagName||"OL"==this.tagName)&&(l+=t(this).serializelist({prepend:r,is_child:!0}))})),n++})}),l}}(jQuery);