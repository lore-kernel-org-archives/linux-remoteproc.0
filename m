Return-Path: <s-anna@ti.com>
From: Suman Anna <s-anna@ti.com>
Subject: [PATCH 2/2] remoteproc: Use a local copy for the name field
Date: Thu, 16 Apr 2020 19:20:36 -0500
Message-ID: <20200417002036.24359-3-s-anna@ti.com>
In-Reply-To: <20200417002036.24359-1-s-anna@ti.com>
References: <20200417002036.24359-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Suman Anna <s-anna@ti.com>
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
v1:
 - Patch baselined on top of Mathieu's rproc_alloc() refactor
   series, and so addresses Bjorn's simplified cleanup comments
 - Switch to {kstrdup/kfree}_const variants
v0: https://patchwork.kernel.org/patch/11456385/

 drivers/remoteproc/remoteproc_core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index e38f627059ac..3cebface3f26 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1984,6 +1984,7 @@ static void rproc_type_release(struct device *dev)
 
 	kfree(rproc->firmware);
 	kfree(rproc->ops);
+	kfree_const(rproc->name);
 	kfree(rproc);
 }
 
@@ -2069,7 +2070,6 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 	if (!rproc)
 		return NULL;
 
-	rproc->name = name;
 	rproc->priv = &rproc[1];
 	rproc->auto_boot = true;
 	rproc->elf_class = ELFCLASS32;
@@ -2081,6 +2081,10 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 	rproc->dev.driver_data = rproc;
 	idr_init(&rproc->notifyids);
 
+	rproc->name = kstrdup_const(name, GFP_KERNEL);
+	if (!rproc->name)
+		goto put_device;
+
 	if (rproc_alloc_firmware(rproc, name, firmware))
 		goto put_device;
 
-- 
2.26.0
