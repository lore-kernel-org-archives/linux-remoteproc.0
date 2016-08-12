Return-Path: <s-anna@ti.com>
From: Suman Anna <s-anna@ti.com>
Subject: [PATCH 02/13] remoteproc: fix couple of minor typos
Date: Fri, 12 Aug 2016 18:42:17 -0500
Message-ID: <20160812234228.39731-3-s-anna@ti.com>
In-Reply-To: <20160812234228.39731-1-s-anna@ti.com>
References: <20160812234228.39731-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Fix couple of minor mis-spelled words in all the remoteproc
source files.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 drivers/remoteproc/da8xx_remoteproc.c | 2 +-
 drivers/remoteproc/remoteproc_core.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/da8xx_remoteproc.c b/drivers/remoteproc/da8xx_remoteproc.c
index 009e56f67de2..12823d078e1e 100644
--- a/drivers/remoteproc/da8xx_remoteproc.c
+++ b/drivers/remoteproc/da8xx_remoteproc.c
@@ -147,7 +147,7 @@ static void da8xx_rproc_kick(struct rproc *rproc, int vqid)
 {
 	struct da8xx_rproc *drproc = (struct da8xx_rproc *)rproc->priv;
 
-	/* Interupt remote proc */
+	/* Interrupt remote proc */
 	writel(SYSCFG_CHIPSIG2, drproc->chipsig);
 }
 
diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 3a9982b8e8c2..e1644c992839 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -969,7 +969,7 @@ static int rproc_add_virtio_devices(struct rproc *rproc)
  * rproc_trigger_recovery() - recover a remoteproc
  * @rproc: the remote processor
  *
- * The recovery is done by reseting all the virtio devices, that way all the
+ * The recovery is done by resetting all the virtio devices, that way all the
  * rpmsg drivers will be reseted along with the remote processor making the
  * remoteproc functional again.
  *
-- 
2.9.0
