$(function() {
			$.fn.editableform.buttons = '<button type="submit" id="editable-btn" class="btn btn-primary editable-submit btn-sm waves-effect waves-light"><i class="mdi mdi-check"></i></button><button type="button" class="btn btn-danger editable-cancel btn-sm waves-effect"><i class="mdi mdi-close"></i></button>',
			$("#inline-username").editable({
				type : "text",
				pk : 1,
				name : "username",
				title : "Enter username",
				mode : "inline",
				inputclass : "form-control-sm"
			}), $("#inline-firstname").editable({
				validate : function(e) {
					if ("" == $.trim(e))
						return "This field is required"
				},
				mode : "inline",
				inputclass : "form-control-sm"
			}), $(".inline-select").editable({
				prepend : "선택",
				mode : "inline",
				inputclass : "form-control-sm",
				source : [ {
					value : 1,
					text : "주문완료"
				}, {
					value : 2,
					text : "입금완료"
				}, {
					value : 3,
					text : "배송준비중"
				}, {
					value : 4,
					text : "배송중"
				}, {
					value : 5,
					text : "배송완료"
				}, {
					value : 6,
					text : "취소처리중"
				}, {
					value : 7,
					text : "교환처리중"
				}, {
					value : 8,
					text : "환불처리중"
				}, {
					value : 9,
					text : "처리완료"
				} ],
				display : function(t, e) {
					var n = $.grep(e, function(e) {
						return e.value == t
					});
					n.length ? $(this).text(n[0].text).css("color", {
						"" : "gray",
						1 : "green",
						2 : "green",
						3 : "blue",
						4 : "blue",
						5 : "green",
						6 : "red",
						7 : "red",
						8 : "red",
						9 : "green"
					}[t]) : $(this).empty()
				}
			}), $("#inline-group").editable({
				showbuttons : !1,
				mode : "inline",
				inputclass : "form-control-sm"
			}), $("#inline-status").editable({
				mode : "inline",
				inputclass : "form-control-sm"
			}), $("#inline-dob").editable({
				mode : "inline",
				inputclass : "form-control-sm"
			}), $("#inline-event").editable({
				placement : "right",
				mode : "inline",
				combodate : {
					firstItem : "name"
				},
				inputclass : "form-control-sm"
			}), $("#inline-comments").editable({
				showbuttons : "bottom",
				mode : "inline",
				inputclass : "form-control-sm"
			}), $("#inline-fruits").editable({
				pk : 1,
				limit : 3,
				mode : "inline",
				inputclass : "form-control-sm",
				source : [ {
					value : 1,
					text : "Banana"
				}, {
					value : 2,
					text : "Peach"
				}, {
					value : 3,
					text : "Apple"
				}, {
					value : 4,
					text : "Watermelon"
				}, {
					value : 5,
					text : "Orange"
				} ]
			})
});