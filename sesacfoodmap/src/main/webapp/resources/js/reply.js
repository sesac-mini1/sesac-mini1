/**
 * reply module
 */
 
 console.log("Reply Module.......");
 
 let replyService = (function(){
 	function add(reply, callback, error) {
 		console.log("add reply.........");
 		$.ajax({
 			type : 'post',
 			url : '/replies/new',
 			data : JSON.stringify(reply),
 			contentType : "application/json; charset=utf-8",
 			success : function(result, status, xhr) {
 				if (callback) {
 					callback(result);
 				}
 			},
 			error : function(xhr, status, er) {
 				if (error) {
 					error(er);
 				}
 			}
 		})
 	}
 	
 	function getList(param, callback, error) {
 		let bno = param.bno;
 		let page = param.page || 1;
 		
 		$.getJSON(`/replies/pages/${bno}/${page}.json`,
 			function(data) {
 				if (callback) {
 					callback(data);
 				}
 			}
 		).fail(function(xhr, status, err) {
 			if (error) {
 				error();
 			}
 		});	
 	}

 	function remove(param, callback, error) {
 		let cno = param.cno;
 		console.log(cno + " " + param.password);
 		$.ajax({
 			type : 'delete',
 			url : '/replies/' + cno,
 			data : JSON.stringify(param),
 			contentType : "application/json; charset=utf-8",
 			success : function(deleteResult, status, xhr) {
 				if (callback) {
 					callback(deleteResult);
 				}
 			},
 			error : function(xhr, status, er) {
	 			if (error) {
	 				error(er);
	 			}
 			}
 		});
 	}
 	
 	function update(reply, callback, error) {
 		console.log("cno: " + reply.cno);
 		
 		$.ajax({
 			type : 'put',
 			url : '/replies/' + reply.cno,
 			data : JSON.stringify(reply),
 			contentType : "application/json; charset=utf-8",
 			success : function(result, status, xhr) {
 				if (callback) {
 					callback(result);
 				}
 			},
 			error : function(xhr, status, er) {
 				if (error) {
 					error(er);
 				}
 			}
 		});
 	}
 	
 	function get(cno, callback, error) {
 		$.get(`/replies/${cno}.json`, function(result) {
 			if (callback) {
 				callback(result);
 			}
 		}).fail(function(xhr, status, err) {
 			if (error) {
 				error();
 			}
 		});
 	}
 	
 	function displayTime(timeValue) {
 		let today = new Date();
 		let gap = today.getTime() - timeValue;
 		
 		let dateObj = new Date(timeValue);
 		let str = "";
 		
 		if (gap < (1000 * 60 * 60 * 24)) {
 			let hh = dateObj.getHours();
 			let mi = dateObj.getMinutes();
 			let ss = dateObj.getSeconds();
 			
 			return [ (hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi,
 						':', (ss > 9 ? '' : '0') + ss ].join('');
 		} else {
 			let yy = dateObj.getFullYear();
 			let mm = dateObj.getMonth() + 1;
 			let dd = dateObj.getDate();
 			
 			return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/', 
 						(dd > 9 ? '' : '0') + dd ].join('');
 		}
 	}
 	
 	return {
 		add : add,
 		get : get,
 		getList : getList,	
 		remove : remove,
 		update : update,
 		displayTime : displayTime
 	};
 })();