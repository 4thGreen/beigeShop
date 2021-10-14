function check_ok(){
	
	if(document.form.s_name.value.length ==0){
		alert("상품명을 입력하세요.");
		form.s_name.focus();//유효성 체크라고 함.
		return;
	}
	if(document.form.s_category.value.length == 0){
		alert("제품군을 입력하세요.");
		form.s_category.focus();
		return;
	}

	if(document.form.s_price.value.length == 0){
		alert("가격을 입력하세요.");
		form.s_price.focus();
		return;
	}
	if(document.form.s_stock.value.length == 0){
		alert("재고량를 입력하세요.");
		form.s_stock.focus();
		return;
	}

	document.form.submit();

}
