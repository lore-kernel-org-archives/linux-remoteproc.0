Return-Path: <mathieu.poirier@linaro.org>
Return-Path: <mathieu.poirier@linaro.org>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [PATCH v2 06/17] remoteproc: Introduce function rproc_alloc_internals()
Date: Tue, 24 Mar 2020 15:45:52 -0600
Message-Id: <20200324214603.14979-7-mathieu.poirier@linaro.org>
In-Reply-To: <20200324214603.14979-1-mathieu.poirier@linaro.org>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org
Cc: ohad@wizery.com, loic.pallardy@st.com, s-anna@ti.com, peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

In preparation to allocate the synchronisation operation and state
machine, spin off a new function in order to keep rproc_alloc() as
clean as possible.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index ee277bc5556c..9da245734db6 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2018,6 +2018,26 @@ static int rproc_alloc_ops(struct rproc *rproc, const struct rproc_ops *ops)
 	return 0;
 }
 
+static int rproc_alloc_internals(struct rproc *rproc, const char *name,
+				 const struct rproc_ops *boot_ops,
+				 const char *firmware, int len)
+{
+	int ret;
+
+	/* We have a boot_ops so allocate firmware name and operations */
+	if (boot_ops) {
+		ret = rproc_alloc_firmware(rproc, name, firmware);
+		if (ret)
+			return ret;
+
+		ret = rproc_alloc_ops(rproc, boot_ops);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 /**
  * rproc_alloc() - allocate a remote processor handle
  * @dev: the underlying device
@@ -2064,10 +2084,8 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 	rproc->dev.class = &rproc_class;
 	rproc->dev.driver_data = rproc;
 
-	if (rproc_alloc_firmware(rproc, name, firmware))
-		goto out;
-
-	if (rproc_alloc_ops(rproc, ops))
+	if (rproc_alloc_internals(rproc, name, ops,
+				  firmware, len))
 		goto out;
 
 	/* Assign a unique device index and name */
-- 
2.20.1
