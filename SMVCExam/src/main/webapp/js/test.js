$(function() {

	findByPage(1);
});

function nextPage() {
	var page = $("#currentPage").text().substring(4);
	var total = $("#last_page").text();
	alert(page);
	var nextPage = 0;
	if (page == total) {
		nextPage = totalPage;
	} else {
		nextPage = parseInt(page) + 1;
		alert(nextPage)
	}
	findByPage(nextPage);
}

function beforePage() {
	var page = $("#currentPage").text().substring(4);
	var first = 1;
	alert(page);
	var beforePage = 0;
	if (page == first) {
		beforePage = first;
	} else {
		beforePage = parseInt(page) - 1;
		alert(beforePage)
	}
	findByPage(beforePage);
}

function firstPage() {
	findByPage(1);
}
function lastPage() {
	var page = $("#last_page").text();
	alert(page)
	findByPage(page);
}
function jumpPage() {
	var page = $("#page").val();
	alert(page)
	findByPage(page);
}

function findByPage(page) {

	$
			.post(
					"/SMVCExam/customerController/getByPage",
					{
						"page" : page
					},
					function(data) {

						$("#tbody").empty();
						var json0 = JSON.parse(data);
						var total = json0.total;
						var json = json0.list;
						for (var i = 0; i < 10; i++) {
							var customer = json[i];
							var first_name = customer.first_name;
							var last_name = customer.last_name;
							var email = customer.email;
							var customer_id = customer.customer_id;
							var last_update = customer.last_update
							var $tr = "<tr><td><button type='button' class='btn btn-default'>添加</button>"
									+ "<button type='button' class='btn btn-default' onclick='deleteById("
									+ customer_id
									+ ");'>删除</button>"
									+ "</td><td>"
									+ first_name
									+ "</td><td>"
									+ last_name
									+ "</td><td>"
									+ email
									+ "</td><td>"
									+ customer_id
									+ "</td><td>"
									+ last_update
									+ "</td></tr>";
							$("#tbody").append($tr);
							$($tr).data("id", customer_id);
							$("#currentPage").text("当前页：" + page);
							$("#last_page").text(Math.ceil(total / 10));
						}
					});
}
function deleteById(id) {
	alert("id:" + id);
	alert("删除成功")
}

function openAdd() {
	$("#add").show();
}
function quxiao() {
	$("#add").hide();
	$("#addForm").get(0).reset();
}
function insert() {
	var name = $("#name").text();
	alert("添加成功");
	$("#add").hide();
	$("#addForm").get(0).reset();
}
