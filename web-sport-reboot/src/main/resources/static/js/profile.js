function remove(id) {
    document.getElementById(id).remove();
}

function delete_from_db(obj_id, obj_type) {
    $.ajax({
        type: "POST",
        url: "/delete_article",
        data: {
            type: obj_type,
            id: obj_id
        }
    })
}