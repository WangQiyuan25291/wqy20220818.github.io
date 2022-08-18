/**
 * 提示框
 * @param text
 * @param icon
 * @param hideAfter
 */
function showMsg(text, icon, hideAfter) {
    if (heading == undefined) {
        var heading = "提示";
    }
    $.toast({
        text: text,
        heading: heading,
        icon: icon,
        showHideTransition: 'fade',
        allowToastClose: true,
        hideAfter: hideAfter,
        stack: 1,
        position: 'top-center',
        textAlign: 'left',
        loader: true,
        loaderBg: '#ffffff'
    });
}

function showMsgAndReload(text, icon, hideAfter) {
    if (heading == undefined) {
        var heading = "提示";
    }
    $.toast({
        text: text,
        heading: heading,
        icon: icon,
        showHideTransition: 'fade',
        allowToastClose: true,
        hideAfter: hideAfter,
        stack: 1,
        position: 'top-center',
        textAlign: 'left',
        loader: true,
        loaderBg: '#ffffff',
        afterHidden: function () {
            window.location.reload();
        }
    });
}

function showMsgAndRedirect(text, icon, hideAfter, redirectUrl) {
    if (heading == undefined) {
        var heading = "提示";
    }
    $.toast({
        text: text,
        heading: heading,
        icon: icon,
        showHideTransition: 'fade',
        allowToastClose: true,
        hideAfter: hideAfter,
        stack: 1,
        position: 'top-center',
        textAlign: 'left',
        loader: true,
        loaderBg: '#ffffff',
        afterHidden: function () {
            window.location.href = redirectUrl;
        }
    });
}


/**
 * 回复
 */
$('#comment-btn').click(function () {
    const content = $('#commentContent').val();
    const commentId = $('#commentId').val();
    const postId = $('#postId').val();
    if (content.length < 3) {
        showMsg('多写一点吧', "error", 1000);
        return;
    }
    $.ajax({
        type: 'POST',
        url: '/comment',
        async: false,
        data: {
            'postId': postId,
            'commentId': commentId,
            'commentContent': content
        },
        success: function (data) {
            if (data.code == 1) {
                showMsgAndReload(data.msg, "success", 1000);
            } else {
                showMsg(data.msg, "error", 1000);
            }
        }
    });
});

/**
 * 触发按钮
 */
$('.reply-btn').click(function () {
    const commentId = $(this).attr('data-id');
    const userDisplayName = $('#comment-' + commentId + '-user').text();
    $('#commentId').val(commentId);
    $('#commentContent').attr('placeholder', '@' + userDisplayName + ': ');
    $('#comment-cancel-btn').show();
});

/**
 * 取消回复
 */
$('#comment-cancel-btn').click(function () {
    $('#commentId').val('');
    $('#commentContent').val('');
    $('#comment-cancel-btn').hide();
});

/**
 * 评论点赞
 */
$('.comment-like').click(function () {
    const a = $(this);
    const commentId = $(this).attr('data-id');
    const item = localStorage.getItem("comment-like-" + commentId);
    if (item != null) {
        showMsg('您已经点过赞了！', "info", 1000);
        return;
    }

    $.ajax({
        type: 'POST',
        url: '/comment/like',
        async: false,
        data: {
            'commentId': commentId
        },
        success: function (data) {
            if (data.code == 1) {
                const count = parseInt(a.find('.tt-text').text()) + 1;
                a.find('.tt-text').text(count);
                a.attr('style', 'color: #2172cda;pointer-events: none;');
                localStorage.setItem("comment-like-" + commentId, count);
            } else {
                showMsg(data.msg, "error", 1000);
            }
        }
    });
});

/**
 * 评论点踩
 */
$('.comment-dislike').click(function () {
    const a = $(this);
    const commentId = $(this).attr('data-id');
    const item = localStorage.getItem("comment-dislike-" + commentId);
    if (item != null) {
        showMsg('您已经点过踩了！', "info", 1000);
        return;
    }
    $.ajax({
        type: 'POST',
        url: '/comment/dislike',
        async: false,
        data: {
            'commentId': commentId
        },
        success: function (data) {
            if (data.code == 1) {
                const count = parseInt(a.find('.tt-text').text()) + 1;
                a.find('.tt-text').text(count);
                a.attr('style', 'color: #2172cda;pointer-events: none;');
                localStorage.setItem("comment-dislike-" + commentId, count);
            } else {
                showMsg(data.msg, "error", 1000);
            }
        }
    });
});


/**
 * 文章点赞
 */
$('.post-like').click(function () {
    const a = $(this);
    const postId = $(this).attr('data-id');
    const item = localStorage.getItem("post-like-" + postId);
    if (item != null) {
        showMsg('您已经点过赞了！', "info", 1000);
        return;
    }
    $.ajax({
        type: 'POST',
        url: '/post/like',
        async: false,
        data: {
            'postId': postId
        },
        success: function (data) {
            if (data.code == 1) {
                const count = parseInt(a.find('.tt-text').text()) + 1;
                a.find('.tt-text').text(count);
                a.attr('style', 'color: #2172cda;pointer-events: none;');
                localStorage.setItem("post-like-" + postId, count);
            } else {
                showMsg(data.msg, "error", 1000);
            }
        }
    });
});


/**
 * 关注
 */
$('.follow-btn').click(function () {
    const acceptUserId = $(this).attr('data-id');
    $.ajax({
        type: 'POST',
        url: '/user/follow',
        async: false,
        data: {
            'acceptUserId': acceptUserId
        },
        success: function (data) {
            if (data.code == 1) {
                window.location.reload();
            } else {
                showMsg(data.msg, "error", 1000);
            }
        }
    });
});

/**
 * 取关
 */
$('.unfollow-btn').click(function () {
    const acceptUserId = $(this).attr('data-id');
    $.ajax({
        type: 'POST',
        url: '/user/unfollow',
        async: false,
        data: {
            'acceptUserId': acceptUserId
        },
        success: function (data) {
            if (data.code == 1) {
                window.location.reload();
            } else {
                showMsg(data.msg, "error", 1000);
            }
        }
    });
});



/**
 * 文章点踩
 */
$('.post-dislike').click(function () {
    const a = $(this);
    const postId = $(this).attr('data-id');
    const item = localStorage.getItem("post-dislike-" + postId);
    if (item != null) {
        showMsg('您已经点过踩了！', "error", 1000);
        return;
    }
    $.ajax({
        type: 'POST',
        url: '/post/dislike',
        async: false,
        data: {
            'postId': postId
        },
        success: function (data) {
            if (data.code == 1) {
                const count = parseInt(a.find('.tt-text').text()) + 1;
                a.find('.tt-text').text(count);
                a.attr('style', 'color: #2172cda;pointer-events: none;');
                localStorage.setItem("post-dislike-" + postId, count);
            } else {
                showMsg(data.msg, "error", 1000);
            }
        }
    });
});


/**
 * 文章反馈
 */
$('.post-report').click(function () {
    const postId = $('#reportPostId').val();
    $.ajax({
        type: 'POST',
        url: '/post/report',
        async: false,
        data: {
            'postId': postId,
            'content': $('#reportContent').val()
        },
        success: function (data) {
            if (data.code == 1) {
                showMsgAndReload(data.msg, "success", 1000);
            } else {
                showMsg(data.msg, "error", 1000);
            }
        }
    });
});



/**
 * 收藏
 */
$('.post-mark-btn').click(function () {
    let parent = $(this).parent('.post-mark-box');
    const id = $(this).attr('data-id');
    $.ajax({
        type: 'POST',
        url: '/post/mark',
        async: false,
        data: {
            'id': id
        },
        success: function (data) {
            if (data.code == 1) {
                parent.find('.post-mark-btn').hide();
                parent.find('.post-unmark-btn').show();
            } else {
                showMsg(data.msg, "error", 1000);
            }
        }
    });
});

/**
 * 收藏
 */
$('.post-mark').click(function () {
    const a = $(this);
    const id = $(this).attr('data-id');
    $.ajax({
        type: 'POST',
        url: '/post/mark',
        async: false,
        data: {
            'id': id
        },
        success: function (data) {
            if (data.code == 1) {
                const count = parseInt(a.find('.tt-text').text()) + 1;
                a.find('.tt-text').text(count);
                a.attr('style', 'color: #2172cda;pointer-events: none;');
            } else {
                showMsg(data.msg, "error", 1000);
            }
        }
    });
});

/**
 * 取消收藏
 */
$('.post-unmark-btn').click(function () {
    let parent = $(this).parent('.post-mark-box');
    const id = $(this).attr('data-id');
    $.ajax({
        type: 'POST',
        url: '/post/unmark',
        async: false,
        data: {
            'id': id
        },
        success: function (data) {
            if (data.code == 1) {
                parent.find('.post-mark-btn').show();
                parent.find('.post-unmark-btn').hide();
            } else {
                showMsg(data.msg, "error", 1000);
            }
        }
    });
});
