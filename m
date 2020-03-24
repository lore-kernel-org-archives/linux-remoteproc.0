Return-Path: <s-anna@ti.com>
From: Suman Anna <s-anna@ti.com>
Subject: [PATCH 2/7] remoteproc: use a local copy for the name field
Date: Tue, 24 Mar 2020 15:18:14 -0500
Message-ID: <20200324201819.23095-3-s-anna@ti.com>
In-Reply-To: <20200324201819.23095-1-s-anna@ti.com>
References: <20200324201819.23095-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: Lokesh Vutla <lokeshvutla@ti.com>, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

The current name field used in the remoteproc structure is simply
a pointer to a name field supplied during the rproc_alloc() call.
The pointer passed in by remoteproc drivers during registration is
typically a dev_name pointer, but it is possible that the pointer
will no longer remain valid if the devices themselves were created
at runtime like in the case of of_platform_populate(), and were
deleted upon any failures within the respective remoteproc driver
probe function.

So, allocate and maintain a local copy for this name field to
keep it agnostic of the logic used in the remoteproc drivers.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 drivers/remoteproc/remoteproc_core.c | 9 ++++++++-
 include/linux/remoteproc.h           | 2 +-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index aca6d022901a..6e0b91fa6f11 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1989,6 +1989,7 @@ static void rproc_type_release(struct device *dev)
 
 	kfree(rproc->firmware);
 	kfree(rproc->ops);
+	kfree(rproc->name);
 	kfree(rproc);
 }
 
@@ -2061,7 +2062,13 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 	}
 
 	rproc->firmware = p;
-	rproc->name = name;
+	rproc->name = kstrdup(name, GFP_KERNEL);
+	if (!rproc->name) {
+		kfree(p);
+		kfree(rproc->ops);
+		kfree(rproc);
+		return NULL;
+	}
 	rproc->priv = &rproc[1];
 	rproc->auto_boot = true;
 	rproc->elf_class = ELFCLASS32;
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index ddce7a7775d1..77788a4bb94e 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -490,7 +490,7 @@ struct rproc_dump_segment {
 struct rproc {
 	struct list_head node;
 	struct iommu_domain *domain;
-	const char *name;
+	char *name;
 	char *firmware;
 	void *priv;
 	struct rproc_ops *ops;
-- 
2.23.0
