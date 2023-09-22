<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!--add brand modal----->
<div class="modal fade" id="addBrandModal" tabindex="-1" aria-labelledby="" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <p class="modal-title fw-bold">Brand Registration</p>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <jsp:include page="../forms/addBrandForm.jsp"/>
      </div>
    </div>
  </div>
</div>
