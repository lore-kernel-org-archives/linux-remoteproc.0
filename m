Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v2 1/6] rpmsg: virtio_rpmsg: set rpmsg_buf_size customizable
Date: Tue, 31 Jan 2017 13:51:32 +0100
Message-ID: <1485867097-6960-2-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1485867097-6960-1-git-send-email-loic.pallardy@st.com>
References: <1485867097-6960-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com, lee.jones@linaro.org
Cc: loic.pallardy@st.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, patrice.chotard@st.com, hugues.fruchet@st.com, peter.griffin@linaro.org
List-ID: <linux-remoteproc@vger.kernel.org>

Rpmsg buffer size is currently fixed to 512 bytes.
This patch introduces a new capability in struct virtproc_info
to tune shared buffer size between host and coprocessor
according to the needs.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
Changes since V1:
- Initialize vrp->num_bufs before use.
- Alignment with open parenthesis.
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 3090b0d..d387589 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -45,6 +45,7 @@
  * @rbufs:	kernel address of rx buffers
  * @sbufs:	kernel address of tx buffers
  * @num_bufs:	total number of buffers for rx and tx
+ * @buf_size:   size of one rx or tx buffer
  * @last_sbuf:	index of last tx buffer used
  * @bufs_dma:	dma base addr of the buffers
  * @tx_lock:	protects svq, sbufs and sleepers, to allow concurrent senders.
@@ -65,6 +66,7 @@ struct virtproc_info {
 	struct virtqueue *rvq, *svq;
 	void *rbufs, *sbufs;
 	unsigned int num_bufs;
+	unsigned int buf_size;
 	int last_sbuf;
 	dma_addr_t bufs_dma;
 	struct mutex tx_lock;
@@ -158,7 +160,7 @@ struct virtio_rpmsg_channel {
  * processor.
  */
 #define MAX_RPMSG_NUM_BUFS	(512)
-#define RPMSG_BUF_SIZE		(512)
+#define MAX_RPMSG_BUF_SIZE	(512)
 
 /*
  * Local addresses are dynamically allocated on-demand.
@@ -429,7 +431,7 @@ static void *get_a_tx_buf(struct virtproc_info *vrp)
 	 * (half of our buffers are used for sending messages)
 	 */
 	if (vrp->last_sbuf < vrp->num_bufs / 2)
-		ret = vrp->sbufs + RPMSG_BUF_SIZE * vrp->last_sbuf++;
+		ret = vrp->sbufs + vrp->buf_size * vrp->last_sbuf++;
 	/* or recycle a used one */
 	else
 		ret = virtqueue_get_buf(vrp->svq, &len);
@@ -555,7 +557,7 @@ static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
 	 * messaging), or to improve the buffer allocator, to support
 	 * variable-length buffer sizes.
 	 */
-	if (len > RPMSG_BUF_SIZE - sizeof(struct rpmsg_hdr)) {
+	if (len > vrp->buf_size - sizeof(struct rpmsg_hdr)) {
 		dev_err(dev, "message is too big (%d)\n", len);
 		return -EMSGSIZE;
 	}
@@ -696,7 +698,7 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
 	 * We currently use fixed-sized buffers, so trivially sanitize
 	 * the reported payload length.
 	 */
-	if (len > RPMSG_BUF_SIZE ||
+	if (len > vrp->buf_size ||
 	    msg->len > (len - sizeof(struct rpmsg_hdr))) {
 		dev_warn(dev, "inbound msg too big: (%d, %d)\n", len, msg->len);
 		return -EINVAL;
@@ -729,7 +731,7 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
 		dev_warn(dev, "msg received with no recipient\n");
 
 	/* publish the real size of the buffer */
-	sg_init_one(&sg, msg, RPMSG_BUF_SIZE);
+	sg_init_one(&sg, msg, vrp->buf_size);
 
 	/* add the buffer back to the remote processor's virtqueue */
 	err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, msg, GFP_KERNEL);
@@ -886,7 +888,9 @@ static int rpmsg_probe(struct virtio_device *vdev)
 	else
 		vrp->num_bufs = MAX_RPMSG_NUM_BUFS;
 
-	total_buf_space = vrp->num_bufs * RPMSG_BUF_SIZE;
+	vrp->buf_size = MAX_RPMSG_BUF_SIZE;
+
+	total_buf_space = vrp->num_bufs * vrp->buf_size;
 
 	/* allocate coherent memory for the buffers */
 	bufs_va = dma_alloc_coherent(vdev->dev.parent->parent,
@@ -909,9 +913,9 @@ static int rpmsg_probe(struct virtio_device *vdev)
 	/* set up the receive buffers */
 	for (i = 0; i < vrp->num_bufs / 2; i++) {
 		struct scatterlist sg;
-		void *cpu_addr = vrp->rbufs + i * RPMSG_BUF_SIZE;
+		void *cpu_addr = vrp->rbufs + i * vrp->buf_size;
 
-		sg_init_one(&sg, cpu_addr, RPMSG_BUF_SIZE);
+		sg_init_one(&sg, cpu_addr, vrp->buf_size);
 
 		err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, cpu_addr,
 					  GFP_KERNEL);
@@ -976,7 +980,7 @@ static int rpmsg_remove_device(struct device *dev, void *data)
 static void rpmsg_remove(struct virtio_device *vdev)
 {
 	struct virtproc_info *vrp = vdev->priv;
-	size_t total_buf_space = vrp->num_bufs * RPMSG_BUF_SIZE;
+	size_t total_buf_space = vrp->num_bufs * vrp->buf_size;
 	int ret;
 
 	vdev->config->reset(vdev);
-- 
1.9.1
