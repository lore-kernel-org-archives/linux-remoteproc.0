Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v4 2/5] rpmsg: virtio_rpmsg_bus: fix sg_set_buf() when addr is not a valid kernel address
Date: Tue, 28 Mar 2017 13:49:44 +0200
Message-ID: <1490701787-15205-3-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1490701787-15205-1-git-send-email-loic.pallardy@st.com>
References: <1490701787-15205-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com, lee.jones@linaro.org
Cc: loic.pallardy@st.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, patrice.chotard@st.com, hugues.fruchet@st.com, Ludovic Barre <ludovic.barre@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

To specify memory for remoteproc, we declare (dma_declare_coherent_memory())
an area which is ioremap'ed to the vmalloc area.  However, this address is
not a kernel address so virt_addr_valid(buf) fails.

Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
Acked-by: Patrice Chotard <patrice.chotard@st.com>
Tested-by: Suman Anna <s-anna@ti.com>
---
Changes since V1:
- Remove extra line.

No change since v2.

---
 drivers/rpmsg/virtio_rpmsg_bus.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 3f44a03..1c7cde9 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -195,6 +195,28 @@ static int virtio_rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src,
 };
 
 /**
+ * rpmsg_sg_init - initialize scatterlist according to cpu address location
+ * @sg: scatterlist to fill
+ * @cpu_addr: virtual address of the buffer
+ * @len: buffer length
+ *
+ * An internal function filling scatterlist according to virtual address
+ * location (in vmalloc or in kernel).
+ */
+static void
+rpmsg_sg_init(struct scatterlist *sg, void *cpu_addr, unsigned int len)
+{
+	if (is_vmalloc_addr(cpu_addr)) {
+		sg_init_table(sg, 1);
+		sg_set_page(sg, vmalloc_to_page(cpu_addr), len,
+			    offset_in_page(cpu_addr));
+	} else {
+		WARN_ON(!virt_addr_valid(cpu_addr));
+		sg_init_one(sg, cpu_addr, len);
+	}
+}
+
+/**
  * __ept_release() - deallocate an rpmsg endpoint
  * @kref: the ept's reference count
  *
@@ -606,7 +628,7 @@ static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
 			 msg, sizeof(*msg) + msg->len, true);
 #endif
 
-	sg_init_one(&sg, msg, sizeof(*msg) + len);
+	rpmsg_sg_init(&sg, msg, sizeof(*msg) + len);
 
 	mutex_lock(&vrp->tx_lock);
 
@@ -731,7 +753,7 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
 		dev_warn(dev, "msg received with no recipient\n");
 
 	/* publish the real size of the buffer */
-	sg_init_one(&sg, msg, vrp->buf_size);
+	rpmsg_sg_init(&sg, msg, vrp->buf_size);
 
 	/* add the buffer back to the remote processor's virtqueue */
 	err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, msg, GFP_KERNEL);
@@ -915,7 +937,7 @@ static int rpmsg_probe(struct virtio_device *vdev)
 		struct scatterlist sg;
 		void *cpu_addr = vrp->rbufs + i * vrp->buf_size;
 
-		sg_init_one(&sg, cpu_addr, vrp->buf_size);
+		rpmsg_sg_init(&sg, cpu_addr, vrp->buf_size);
 
 		err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, cpu_addr,
 					  GFP_KERNEL);
-- 
1.9.1
