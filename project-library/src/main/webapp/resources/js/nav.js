/* ----------------------------------------
	nav.js (�ㅺ뎅�� 怨듯넻)
---------------------------------------- */

var dep1;
var dep2;

jQuery(function($){
	$gnbList = $("#gnb > ul");
	
	gnb_on();
	function gnb_on () {
		/* �몃뜳�ㅺ� �꾨땺寃쎌슦 */
		if ( dep1> 0 && dep2> 0 ) {
			//$gnbList.children("li").eq(dep1-1).addClass("on");
			//$(".sidebar").children("li").eq(dep2-1).children("a").addClass("on");		// �쒕툕�섏씠吏� �ъ씠�쒕컮 on
		}
		
		$gnbList.children("li").on("mouseenter focus",function  () {
			$gnbList.children("li").removeClass("on").children(".gnb-2dep").hide();
			$(this).addClass("on").children(".gnb-2dep").stop().fadeIn(400);
		})
	
		$gnbList.children("li").on("mouseleave",gnb_return);
		$gnbList.find("a").last().on("focusout",gnb_return);
		
		function gnb_return () {
			$gnbList.children("li").removeClass("on").children(".gnb-2dep").hide();
			/*
			if ( dep1 > 0 && dep2 ) {
				$gnbList.children("li").eq(dep1-1).addClass("on");
			}
			*/
		}
	}
	
	/*  �ㅻ쾭�섍굅�� �ъ빱�ㅺ� �덉쓣寃쎌슦 �쒖꽦�� */
	$gnbList.children("li").on("mouseenter focusin",function(){
		$(this).addClass("on");
	}).on("mouseleave focusout", function(){
		$(this).removeClass("on");
	})
	
	/* �댁쟾�섏씠吏�,�ㅼ쓬�섏씠吏� 留곹겕嫄멸린 */
	// 1depth �대룞
	var menu_lang1 = $gnbList.children("li").length;
	$(".prev-page-btn").attr("href",$("#gnb > ul > li").eq(dep1-2).children("a").attr("href"));
	$(".next-page-btn").attr("href",$("#gnb > ul > li").eq(dep1).children("a").attr("href"));
	if ( dep1 == menu_lang1 ) {
		$(".next-page-btn").attr("href",$("#gnb > ul > li").eq(0).children("a").attr("href"));
	}else if ( dep1 == 1 ) {
		$(".prev-page-btn").attr("href",$("#gnb > ul > li").eq(menu_lang1-1).children("a").attr("href"));
	}
	// 2depth �대룞
	var menu_lang2 = $gnbList.children("li").eq(dep1-1).find("li").length;
	$(".sub-prev-btn").attr("href",$gnbList.children("li").eq(dep1-1).find("li").eq(dep2-2).children("a").attr("href"));
	$(".sub-next-btn").attr("href",$gnbList.children("li").eq(dep1-1).find("li").eq(dep2).children("a").attr("href"));
	if ( dep2 == menu_lang2 ) {
		$(".sub-next-btn").attr("href",$gnbList.children("li").eq(dep1-1).find("li").eq(0).children("a").attr("href"));
	}else if ( dep2 == 1 ) {
		$(".sub-prev-btn").attr("href",$gnbList.children("li").eq(dep1-1).find("li").eq(menu_lang2-1).children("a").attr("href"));
	}

	/* ===================
		### 怨듯넻 �쒖씠荑쇰━  ### 
	====================*/ 
	/* �ㅻⅨ履� GNB �ㅽ뵂 */ 
	var menu = "close";
	/* GNB Menu Animation Delay */ 
	$("#gnbNavigation > ul > li").each(function( index ) {
  		$( this ).css({'animation-delay': (index*80)+'ms'});
	});

	$(".gnb-open-btn").click(function  () {
		if ( menu == "open" ) {
			menuClose();
			menu = "close";
		}else {
			menuOpen();
			menu = "open";
		}
		return false;
	});

	$("#gnbMenuBg,.close-box").click(function  () {
		menuClose();
		menu = "close";
	});
	function menuOpen () {
		$('#gnbM').show().addClass("open");
		$('#gnbMenuBg').fadeIn();
		//$("body").css({'height':$(window).height(), 'overflow':'hidden'});
	}

	function menuClose () {
		$('#gnbM').stop().removeClass("open");
		$('#gnbMenuBg').hide();
		//$("body").css({'height':'auto', 'overflow':'auto'});
	}

	/* GNB 2DEPTH �ㅽ뵂�섍린 */ 
	$("#gnbNavigation > ul > li:has('ul')").children("a").click(function(event){
		/* 2dep媛� �대젮�덉쓣�� */		
		if ( $(this).parent("li").hasClass("active") ){
			$(this).parent("li").removeClass("active");
			$(this).siblings("ul").slideUp(400);					
		}
		/* 2dep媛� �ロ��덉쓣�� */ 
		else{	  
			$("#gnbNavigation > ul > li").has("ul").each(function() {
				if ( $(this).hasClass("active") ){
					$(this).removeClass("active");
					$(this).children("ul").slideUp(400);
				}
			});	
			$(this).parent("li").addClass("active");
			$(this).siblings("ul").slideDown(400);
		}
		return false;
	});
	

});
