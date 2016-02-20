$(function() {
	var userName = localStorage.getItem("user_name");
	if (!userName) {
		inputUserName();
	} else {
		setUserName(userName);
	}

	$("#reset-user-name").click(function() {
		inputUserName();
		return false;
	});

	function inputUserName() {
		sweetAlert({
				title: "名前をいれて!",
				text: "あなたの名前を決めて。",
				type: "input",
				showCancelButton: true,
				closeOnConfirm: false,
				animation: "slide-from-top",
				inputPlaceholder: "Write something"
			}, function(inputValue){
				if (inputValue === false)
					return false;
				if (inputValue === "") {
					swal.showInputError("何か入れて！");
					return false
				}
				swal("うけつけたよ！", inputValue + " でいいんだね！", "success");
				localStorage.setItem("user_name", inputValue);
				setUserName(inputValue);
			});
	}

	function setUserName(name) {
		$("#hello-message").text(getGreeting() + "、 " + name + " さん。");
		$(".user-name").val(name);
	}

	function getGreeting() {
		var text;
		var hours = new Date().getHours();
		if (4 <= hours && hours < 11) {
			text = "おはよう";
		} else if (11 <= hours && hours < 17) {
			text = "こんにちは";
		} else {
			text = "こんばんは";
		}
		return text;
	}
})