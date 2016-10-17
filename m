Return-Path: <Matt.Redfearn@imgtec.com>
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [PATCH v2 2/4] remoteproc: Make rproc_add_virtio_devices non-static
Date: Mon, 17 Oct 2016 16:48:59 +0100
Message-ID: <1476719341-11651-3-git-send-email-matt.redfearn@imgtec.com>
In-Reply-To: <1476719341-11651-1-git-send-email-matt.redfearn@imgtec.com>
References: <1476719341-11651-1-git-send-email-matt.redfearn@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Matt
List-ID: <linux-remoteproc@vger.kernel.org>

This function will be required in pther files by the next patch in the
series.

Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
---

Changes in v2:
New patch to allow access to firmware loading from remoteproc_sysfs.c

 drivers/remoteproc/remoteproc_core.c     | 2 +-
 drivers/remoteproc/remoteproc_internal.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index ccc2a73e94dd..d86b4be956a9 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -916,7 +916,7 @@ static void rproc_fw_config_virtio(const struct firmware *fw, void *context)
 	complete_all(&rproc->firmware_loading_complete);
 }
 
-static int rproc_add_virtio_devices(struct rproc *rproc)
+int rproc_add_virtio_devices(struct rproc *rproc)
 {
 	int ret;
 
diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index 4cf93ca2816e..82345930ecbd 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -49,6 +49,7 @@ struct rproc_fw_ops {
 void rproc_release(struct kref *kref);
 irqreturn_t rproc_vq_interrupt(struct rproc *rproc, int vq_id);
 int rproc_boot_nowait(struct rproc *rproc);
+int rproc_add_virtio_devices(struct rproc *rproc);
 
 /* from remoteproc_virtio.c */
 int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id);
-- 
2.7.4
