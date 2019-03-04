Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from zimbra2.kalray.eu ([92.103.151.219]:52112 "EHLO
        zimbra2.kalray.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726069AbfCDJlA (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 4 Mar 2019 04:41:00 -0500
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 040BC27E039C
        for <linux-remoteproc@vger.kernel.org>; Mon,  4 Mar 2019 10:40:59 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id jTcVRJkAyar9 for <linux-remoteproc@vger.kernel.org>;
        Mon,  4 Mar 2019 10:40:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 8ADA027E03D8
        for <linux-remoteproc@vger.kernel.org>; Mon,  4 Mar 2019 10:40:58 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id h2Xyf-Gf4mIu for <linux-remoteproc@vger.kernel.org>;
        Mon,  4 Mar 2019 10:40:58 +0100 (CET)
Received: from zimbra2.kalray.eu (zimbra2.kalray.eu [192.168.40.202])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 74EC927E039C
        for <linux-remoteproc@vger.kernel.org>; Mon,  4 Mar 2019 10:40:58 +0100 (CET)
Date: Mon, 4 Mar 2019 10:40:58 +0100 (CET)
From: =?utf-8?Q?Cl=C3=A9ment?= Leger <cleger@kalray.eu>
Message-ID: <2086042421.14120180.1551692458444.JavaMail.zimbra@kalray.eu>
Subject: [RFC PATCH] remoteproc: add per rproc resource handling
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-remoteproc-owner@vger.kernel.org
To: linux-remoteproc <linux-remoteproc@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

In order to allow rproc backend to handle vendor resources, add a
handle_rsc hook. This hook allow the rproc backends to handle vendor
resources as they like. It also allows them to parse standard RSC_*
if needed. The hook should return RSC_HANDLED on successful resource
handling, RSC_IGNORED if resource was ignored, or a negative value on
error.

---
 drivers/remoteproc/remoteproc_core.c     |  7 +++++++
 drivers/remoteproc/remoteproc_internal.h | 11 +++++++++++
 include/linux/remoteproc.h               | 15 +++++++++++++++
 3 files changed, 33 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 54ec38fc5dca..36a0f3c59ac1 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1009,6 +1009,13 @@ static int rproc_handle_resources(struct rproc *rproc,
 
 		dev_dbg(dev, "rsc: type %d\n", hdr->type);
 
+		ret = rproc_handle_rsc(rproc, hdr->type, rsc,
+				       offset + sizeof(*hdr), avail);
+		if (ret == RSC_HANDLED)
+			continue;
+		else if (ret < 0)
+			break;
+
 		if (hdr->type >= RSC_LAST) {
 			dev_warn(dev, "unsupported resource %d\n", hdr->type);
 			continue;
diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index f6cad243d7ca..b02b15f74a5e 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -98,6 +98,17 @@ static inline int rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
 	return 0;
 }
 
+static inline
+int rproc_handle_rsc(struct rproc *rproc, u32 rsc_type, void *rsc, int offset,
+		     int avail)
+{
+	if (rproc->ops->handle_rsc)
+		return rproc->ops->handle_rsc(rproc, rsc_type, rsc, offset,
+					      avail);
+
+	return RSC_IGNORED;
+}
+
 static inline
 struct resource_table *rproc_find_loaded_rsc_table(struct rproc *rproc,
 						   const struct firmware *fw)
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 507a2b524208..fb9751717da7 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -339,12 +339,25 @@ struct rproc_mem_entry {
 
 struct firmware;
 
+/**
+ * enum rsc_handling_status - return status of rproc_ops handle_rsc hook
+ * @RSC_HANDLED:	resource was handled
+ * @RSC_IGNORED:	resource was ignored
+ */
+enum rsc_handling_status {
+	RSC_HANDLED	= 0,
+	RSC_IGNORED	= 1,
+};
+
 /**
  * struct rproc_ops - platform-specific device handlers
  * @start:	power on the device and boot it
  * @stop:	power off the device
  * @kick:	kick a virtqueue (virtqueue id given as a parameter)
  * @da_to_va:	optional platform hook to perform address translations
+ * @handle_rsc:	optional platform hook to handle vendor resources. Should return
+ * RSC_HANDLED if resource was handled, RSC_IGNORED if not handled and a
+ * negative value on error
  * @load_rsc_table:	load resource table from firmware image
  * @find_loaded_rsc_table: find the loaded resouce table
  * @load:		load firmeware to memory, where the remote processor
@@ -358,6 +371,8 @@ struct rproc_ops {
 	void (*kick)(struct rproc *rproc, int vqid);
 	void * (*da_to_va)(struct rproc *rproc, u64 da, int len);
 	int (*parse_fw)(struct rproc *rproc, const struct firmware *fw);
+	int (*handle_rsc)(struct rproc *rproc, u32 rsc_type, void *rsc,
+			  int offset, int avail);
 	struct resource_table *(*find_loaded_rsc_table)(
 				struct rproc *rproc, const struct firmware *fw);
 	int (*load)(struct rproc *rproc, const struct firmware *fw);
-- 
2.15.0.276.g89ea799
