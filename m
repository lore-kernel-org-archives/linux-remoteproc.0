Return-Path: <arnaud.pouliquen@st.com>
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Subject: [RFC 01/18] remoteproc: Store resource table address in rvdev
Date: Thu, 16 Apr 2020 18:13:14 +0200
Message-ID: <20200416161331.7606-2-arnaud.pouliquen@st.com>
In-Reply-To: <20200416161331.7606-1-arnaud.pouliquen@st.com>
References: <20200416161331.7606-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, arnaud.pouliquen@st.com
List-ID: <linux-remoteproc@vger.kernel.org>

Store the resource table address in rvdev struct to be able to
retrieve it from vdev device.
This patch prepares the migration of rdev management in rproc_virtio.
Indeed remoteproc virtio will have to complete the vdev and vrings
resource table structures.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 1 +
 include/linux/remoteproc.h           | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 097f33e4f1f3..2a0425ab82a7 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -504,6 +504,7 @@ static int rproc_handle_vdev(struct rproc *rproc, struct fw_rsc_vdev *rsc,
 
 	kref_init(&rvdev->refcount);
 
+	rvdev->rsc = rsc;
 	rvdev->id = rsc->id;
 	rvdev->rproc = rproc;
 	rvdev->index = rproc->nb_vdev++;
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 16ad66683ad0..a78e28bda962 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -567,6 +567,7 @@ struct rproc_vring {
  * @rproc: the rproc handle
  * @vdev: the virio device
  * @vring: the vrings for this vdev
+ * @rsc: address of the resource table
  * @rsc_offset: offset of the vdev's resource entry
  * @index: vdev position versus other vdev declared in resource table
  */
@@ -580,6 +581,7 @@ struct rproc_vdev {
 	struct list_head node;
 	struct rproc *rproc;
 	struct rproc_vring vring[RVDEV_NUM_VRINGS];
+	struct fw_rsc_vdev *rsc;
 	u32 rsc_offset;
 	u32 index;
 };
-- 
2.17.1
