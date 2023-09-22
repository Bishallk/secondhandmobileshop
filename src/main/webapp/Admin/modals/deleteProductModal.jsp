<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!--delete product modal----->
<div class="modal fade" id="deleteProductModal" tabindex="-1" aria-labelledby="" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header bg-danger">
                <span class="text-white me-2">
                    <i class="bi bi-exclamation-triangle"></i>
                </span>
                <p class="modal-title text-white">
                    Product delete
                </p>

                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="${pageContext.request.contextPath}/deleteProduct" method="POST">
                <div class="modal-body">
                    <input value="" name="deleteIdInput" type="hidden" id="idForDelete">
                    <p class="">Do you want to delete this product?</p>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-danger ">Delete</button>
                    <button type="button" class="btn btn-success" data-bs-dismiss="modal">Cancel</button>
                </div>
            </form>
        </div>
    </div>
</div>
