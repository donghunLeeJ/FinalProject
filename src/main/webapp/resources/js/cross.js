/**
 * 
 */
function removeXSS (str, id) {
	//	console.log(str);
	//	console.log(id);
	//	alert("XSS");
		var str_low = "";
		//var str = str1;
		// HTML tag를 사용하게 할 경우 부분 허용
		// HTML tag를 모두 제거
		str = str.replace("<", "");
		str = str.replace("<", "");
		str = str.replace("<", "");
		str = str.replace("<", "");
		str = str.replace(">", "");
		str = str.replace(">", "");
		str = str.replace(">", "");
		str = str.replace(">", "");
		// 특수 문자 제거
		str = str.replace("\"", "&gt;");
		str = str.replace("&", "&amp;");
		str = str.replace("%00", null);
		str = str.replace("\"", "&#34;");
		str = str.replace("\'", "&#39;");
		str = str.replace("%", "&#37;");
		str = str.replace("../", "");
		str = str.replace("..\\\\", "");
		str = str.replace("./", "");
		str = str.replace("%2F", "");
		// 허용할 HTML tag만 변경
		str = str.replace("&lt;p&gt;", "<p>");
		str = str.replace("&lt;P&gt;", "<P>");
		str = str.replace("&lt;br&gt;", "<br>");
		str = str.replace("&lt;BR&gt;", "<BR>");
		// 스크립트 문자열 필터링 (선별함 - 필요한 경우 보안가이드에 첨부된 구문 추가)
		str_low = str.toLowerCase();
		if (str_low.includes("javascript") || str_low.includes("script")
				|| str_low.includes("div") || str_low.includes("iframe")
				|| str_low.includes("src") || str_low.includes("href")
				|| str_low.includes("url") || str_low.includes("ajax")
				|| str_low.includes("data") || str_low.includes("img")
				|| str_low.includes("code") || str_low.includes("ript")
				|| str_low.includes("for") || str_low.includes("json")
				|| str_low.includes("document")
				|| str_low.includes("vbscript")
				|| str_low.includes("applet") || str_low.includes("embed")
				|| str_low.includes("object") || str_low.includes("frame")
				|| str_low.includes("grameset")
				|| str_low.includes("layer") || str_low.includes("bgsound")
				|| str_low.includes("alert") || str_low.includes("onblur")
				|| str_low.includes("onchange")
				|| str_low.includes("onclick")
				|| str_low.includes("ondblclick")
				|| str_low.includes("enerror")
				|| str_low.includes("onfocus")
				|| str_low.includes("onload")
				|| str_low.includes("onmouse")
				|| str_low.includes("onscroll")
				|| str_low.includes("onsubmit")
				|| str_low.includes("onunload")) 
		{
			str = str_low;
			str = str.replace("jav", "----");
			str = str.replace("scr", "----");
			str = str.replace("tmp", "----");
			str = str.replace("\")", "----");
			str = str.replace("docu", "----");
			str = str.replace("leng", "----");
			str = str.replace("pt", "----");
			str = str.replace("url", "----");
			str = str.replace("<sc", "---");
			str = str.replace("cr", "---");
			str = str.replace("ri", "---");
			str = str.replace("it", "---");
			str = str.replace("ip", "----");
			str = str.replace("img", "---");
			str = str.replace("im", "---");
			str = str.replace("al", "---");
			str = str.replace("er", "---");
			str = str.replace("rt>", "---");
			str = str.replace("ajax", "---");
			str = str.replace("aj", "---");
			str = str.replace("href", "-----");
			str = str.replace("div", "x-div");
			str = str.replace("json", "14dd2");
			str = str.replace("for", "world");
			str = str.replace("ript", "");
			str = str.replace("code", "x-c-o-d-e");
			str = str.replace("src", "x-src");
			str = str.replace("href", "x-href");
			str = str.replace("javascript", "x-javascript");
			str = str.replace("script", "x-script");
			str = str.replace("iframe", "x-iframe");
			str = str.replace("document", "x-document");
			str = str.replace("vbscript", "x-vbscript");
			str = str.replace("applet", "x-applet");
			str = str.replace("embed", "x-embed");
			str = str.replace("object", "x-object");
			str = str.replace("frame", "x-frame");
			str = str.replace("grameset", "x-grameset");
			str = str.replace("layer", "x-layer");
			str = str.replace("bgsound", "x-bgsound");
			str = str.replace("alert", "x-alert");
			str = str.replace("onblur", "x-onblur");
			str = str.replace("onchange", "x-onchange");
			str = str.replace("onclick", "x-onclick");
			str = str.replace("ondblclick", "x-ondblclick");
			str = str.replace("enerror", "x-enerror");
			str = str.replace("onfocus", "x-onfocus");
			str = str.replace("onload", "x-onload");
			str = str.replace("onmouse", "x-onmouse");
			str = str.replace("onscroll", "x-onscroll");
			str = str.replace("onsubmit", "x-onsubmit");
			str = str.replace("onunload", "x-onunload");
			//console.log("함수"+str);
			$("#"+id).val(str);
		}
		
	}