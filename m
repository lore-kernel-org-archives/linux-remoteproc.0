Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2 3/8] remoteproc: Clone rproc_ops in rproc_alloc()
Date: Fri,  5 Jan 2018 15:58:00 -0800
Message-Id: <20180105235805.9948-4-bjorn.andersson@linaro.org>
In-Reply-To: <20180105235805.9948-1-bjorn.andersson@linaro.org>
References: <20180105235805.9948-1-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

In order to allow rproc_alloc() to, in a future patch, update entries in
the "ops" struct we need to make a local copy of it.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- None

 drivers/remoteproc/remoteproc_core.c | 9 ++++++++-
 include/linux/remoteproc.h           | 2 +-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 208ccf709cad..dbf685dbafcf 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1342,6 +1342,7 @@ static void rproc_type_release(struct device *dev)
 		ida_simple_remove(&rproc_dev_index, rproc->index);
 
 	kfree(rproc->firmware);
+	kfree(rproc->ops);
 	kfree(rproc);
 }
 
@@ -1406,9 +1407,15 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 		return NULL;
 	}
 
+	rproc->ops = kmemdup(ops, sizeof(*ops), GFP_KERNEL);
+	if (!rproc->ops) {
+		kfree(p);
+		kfree(rproc);
+		return NULL;
+	}
+
 	rproc->firmware = p;
 	rproc->name = name;
-	rproc->ops = ops;
 	rproc->priv = &rproc[1];
 	rproc->auto_boot = true;
 
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 6fdc62e29d6f..cc4d30a790b3 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -419,7 +419,7 @@ struct rproc {
 	const char *name;
 	char *firmware;
 	void *priv;
-	const struct rproc_ops *ops;
+	struct rproc_ops *ops;
 	struct device dev;
 	const struct rproc_fw_ops *fw_ops;
 	atomic_t power;
-- 
2.15.0
