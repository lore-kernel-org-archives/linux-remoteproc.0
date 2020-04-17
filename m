Return-Path: <paul@crapouillou.net>
From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v6 2/5] remoteproc: Add device-managed variants of rproc_alloc/rproc_add
Date: Fri, 17 Apr 2020 19:00:37 +0200
Message-Id: <20200417170040.174319-2-paul@crapouillou.net>
In-Reply-To: <20200417170040.174319-1-paul@crapouillou.net>
References: <20200417170040.174319-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Arnaud Pouliquen <arnaud.pouliquen@st.com>
Cc: od@zcrc.me, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-ID: <linux-remoteproc@vger.kernel.org>

Add API functions devm_rproc_alloc() and devm_rproc_add(), which behave
like rproc_alloc() and rproc_add() respectively, but register their
respective cleanup function to be called on driver detach.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v3: New patch
    v4: No change
    v5: - Fix return value documentation
    	- Fix typo in documentation
    v6: No change

 drivers/remoteproc/remoteproc_core.c | 67 ++++++++++++++++++++++++++++
 include/linux/remoteproc.h           |  5 +++
 2 files changed, 72 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index e12a54e67588..a7f96bc98406 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1949,6 +1949,33 @@ int rproc_add(struct rproc *rproc)
 }
 EXPORT_SYMBOL(rproc_add);
 
+static void devm_rproc_remove(void *rproc)
+{
+	rproc_del(rproc);
+}
+
+/**
+ * devm_rproc_add() - resource managed rproc_add()
+ * @dev: the underlying device
+ * @rproc: the remote processor handle to register
+ *
+ * This function performs like rproc_add() but the registered rproc device will
+ * automatically be removed on driver detach.
+ *
+ * Returns: 0 on success, negative errno on failure
+ */
+int devm_rproc_add(struct device *dev, struct rproc *rproc)
+{
+	int err;
+
+	err = rproc_add(rproc);
+	if (err)
+		return err;
+
+	return devm_add_action_or_reset(dev, devm_rproc_remove, rproc);
+}
+EXPORT_SYMBOL(devm_rproc_add);
+
 /**
  * rproc_type_release() - release a remote processor instance
  * @dev: the rproc's device
@@ -2171,6 +2198,46 @@ int rproc_del(struct rproc *rproc)
 }
 EXPORT_SYMBOL(rproc_del);
 
+static void devm_rproc_free(struct device *dev, void *res)
+{
+	rproc_free(*(struct rproc **)res);
+}
+
+/**
+ * devm_rproc_alloc() - resource managed rproc_alloc()
+ * @dev: the underlying device
+ * @name: name of this remote processor
+ * @ops: platform-specific handlers (mainly start/stop)
+ * @firmware: name of firmware file to load, can be NULL
+ * @len: length of private data needed by the rproc driver (in bytes)
+ *
+ * This function performs like rproc_alloc() but the acquired rproc device will
+ * automatically be released on driver detach.
+ *
+ * Returns: new rproc instance, or NULL on failure
+ */
+struct rproc *devm_rproc_alloc(struct device *dev, const char *name,
+			       const struct rproc_ops *ops,
+			       const char *firmware, int len)
+{
+	struct rproc **ptr, *rproc;
+
+	ptr = devres_alloc(devm_rproc_free, sizeof(*ptr), GFP_KERNEL);
+	if (!ptr)
+		return ERR_PTR(-ENOMEM);
+
+	rproc = rproc_alloc(dev, name, ops, firmware, len);
+	if (rproc) {
+		*ptr = rproc;
+		devres_add(dev, ptr);
+	} else {
+		devres_free(ptr);
+	}
+
+	return rproc;
+}
+EXPORT_SYMBOL(devm_rproc_alloc);
+
 /**
  * rproc_add_subdev() - add a subdevice to a remoteproc
  * @rproc: rproc handle to add the subdevice to
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 9c07d7958c53..8c9c0dda03c3 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -599,6 +599,11 @@ int rproc_add(struct rproc *rproc);
 int rproc_del(struct rproc *rproc);
 void rproc_free(struct rproc *rproc);
 
+struct rproc *devm_rproc_alloc(struct device *dev, const char *name,
+			       const struct rproc_ops *ops,
+			       const char *firmware, int len);
+int devm_rproc_add(struct device *dev, struct rproc *rproc);
+
 void rproc_add_carveout(struct rproc *rproc, struct rproc_mem_entry *mem);
 
 struct rproc_mem_entry *
-- 
2.25.1
