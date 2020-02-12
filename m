Return-Path: <arnaud.pouliquen@st.com>
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Subject: [PATCH] remoteproc: fix kernel-doc warnings
Date: Wed, 12 Feb 2020 10:32:11 +0100
Message-ID: <20200212093211.15270-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, arnaud.pouliquen@st.com
List-ID: <linux-remoteproc@vger.kernel.org>

Fix the following warnings when documentation is built:
drivers/remoteproc/remoteproc_virtio.c:330: warning: Function parameter
or member 'id' not described in 'rproc_add_virtio_dev'
drivers/remoteproc/remoteproc_core.c:243: warning: Function parameter
or member 'name' not described in 'rproc_find_carveout_by_name'
drivers/remoteproc/remoteproc_core.c:473: warning: Function parameter
or member 'offset' not described in 'rproc_handle_vdev'
drivers/remoteproc/remoteproc_core.c:604: warning: Function parameter
or member 'offset' not described in 'rproc_handle_trace'
drivers/remoteproc/remoteproc_core.c:678: warning: Function parameter
or member 'offset' not described in 'rproc_handle_devmem'
drivers/remoteproc/remoteproc_core.c:873: warning: Function parameter
or member 'offset' not described in 'rproc_handle_carveout'
drivers/remoteproc/remoteproc_core.c:1029: warning: cannot understand function
prototype: 'rproc_handle_resource_t rproc_loading_handlers[RSC_LAST] = '
drivers/remoteproc/remoteproc_core.c:1693: warning: Function parameter
or member 'work' not described in 'rproc_crash_handler_work'

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/remoteproc_core.c   | 9 +++++++--
 drivers/remoteproc/remoteproc_virtio.c | 1 +
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 097f33e4f1f3..5f9a5812505c 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -224,7 +224,7 @@ EXPORT_SYMBOL(rproc_da_to_va);
 /**
  * rproc_find_carveout_by_name() - lookup the carveout region by a name
  * @rproc: handle of a remote processor
- * @name,..: carveout name to find (standard printf format)
+ * @name: carveout name to find (standard printf format)
  *
  * Platform driver has the capability to register some pre-allacoted carveout
  * (physically contiguous memory regions) before rproc firmware loading and
@@ -445,6 +445,7 @@ static void rproc_rvdev_release(struct device *dev)
  * rproc_handle_vdev() - handle a vdev fw resource
  * @rproc: the remote processor
  * @rsc: the vring resource descriptor
+ * @offset: offset of the resource entry
  * @avail: size of available data (for sanity checking the image)
  *
  * This resource entry requests the host to statically register a virtio
@@ -587,6 +588,7 @@ void rproc_vdev_release(struct kref *ref)
  * rproc_handle_trace() - handle a shared trace buffer resource
  * @rproc: the remote processor
  * @rsc: the trace resource descriptor
+ * @offset: offset of the resource entry
  * @avail: size of available data (for sanity checking the image)
  *
  * In case the remote processor dumps trace logs into memory,
@@ -652,6 +654,7 @@ static int rproc_handle_trace(struct rproc *rproc, struct fw_rsc_trace *rsc,
  * rproc_handle_devmem() - handle devmem resource entry
  * @rproc: remote processor handle
  * @rsc: the devmem resource entry
+ * @offset: offset of the resource entry
  * @avail: size of available data (for sanity checking the image)
  *
  * Remote processors commonly need to access certain on-chip peripherals.
@@ -853,6 +856,7 @@ static int rproc_release_carveout(struct rproc *rproc,
  * rproc_handle_carveout() - handle phys contig memory allocation requests
  * @rproc: rproc handle
  * @rsc: the resource entry
+ * @offset: offset of the resource entry
  * @avail: size of available data (for image validation)
  *
  * This function will handle firmware requests for allocation of physically
@@ -1022,7 +1026,7 @@ rproc_of_resm_mem_entry_init(struct device *dev, u32 of_resm_idx, int len,
 }
 EXPORT_SYMBOL(rproc_of_resm_mem_entry_init);
 
-/**
+/*
  * A lookup table for resource handlers. The indices are defined in
  * enum fw_resource_type.
  */
@@ -1685,6 +1689,7 @@ int rproc_trigger_recovery(struct rproc *rproc)
 
 /**
  * rproc_crash_handler_work() - handle a crash
+ * @work: work treating the crash
  *
  * This function needs to handle everything related to a crash, like cpu
  * registers and stack dump, information to help to debug the fatal error, etc.
diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index 8c07cb2ca8ba..eb817132bc5f 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -320,6 +320,7 @@ static void rproc_virtio_dev_release(struct device *dev)
 /**
  * rproc_add_virtio_dev() - register an rproc-induced virtio device
  * @rvdev: the remote vdev
+ * @id: the device type identification (used to match it with a driver).
  *
  * This function registers a virtio device. This vdev's partent is
  * the rproc device.
-- 
2.17.1
