Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32D04C433EF
	for <linux-remoteproc@archiver.kernel.org>; Fri,  6 May 2022 13:51:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1441887AbiEFNz0 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 6 May 2022 09:55:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229713AbiEFNz0 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 6 May 2022 09:55:26 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C3F953717;
        Fri,  6 May 2022 06:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1651845103; x=1683381103;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=3ivlAaKlYcbgS3obWabrrpQ7s1a/tru9izwj6OSDCOs=;
  b=xDmnm2F6OrGafLNAHjfhvQuIRyyKgYIiH8ZMph/N7nabvj+90RZI7HCO
   ni7DCLjwPhiICmAngxqw96/ncuVacSf3/ewucZW9W32yHbgoCAACx4VnN
   eDEHqiwKdWnPQn+IAq3cb5pa3JKKRMdJRNzJSjsggKxNlMNEIULXKcUxj
   E=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 06 May 2022 06:51:43 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2022 06:51:42 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 6 May 2022 06:51:42 -0700
Received: from blr-ubuntu-87.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 6 May 2022 06:51:38 -0700
From:   Sibi Sankar <quic_sibis@quicinc.com>
To:     <bjorn.andersson@linaro.org>, <arnd@arndb.de>
CC:     <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <sboyd@kernel.org>, <agross@kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <mathieu.poirier@linaro.org>,
        <mka@chromium.org>, Sibi Sankar <quic_sibis@quicinc.com>
Subject: [PATCH] remoteproc: qcom_q6v5_mss: map/unmap metadata region before/after use
Date:   Fri, 6 May 2022 19:21:26 +0530
Message-ID: <1651845086-16535-1-git-send-email-quic_sibis@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The application processor accessing the dynamically assigned metadata
region after assigning it to the remote Q6 would lead to an XPU violation.
Fix this by un-mapping the metadata region post firmware header copy. The
metadata region is freed only after the modem Q6 is done with fw header
authentication.

Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 43 +++++++++++++++++++++++++++++++-------
 1 file changed, 35 insertions(+), 8 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index af217de75e4d..eb34a258b67b 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -10,6 +10,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/devcoredump.h>
+#include <linux/dma-map-ops.h>
 #include <linux/dma-mapping.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
@@ -932,27 +933,52 @@ static void q6v5proc_halt_axi_port(struct q6v5 *qproc,
 static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw,
 				const char *fw_name)
 {
-	unsigned long dma_attrs = DMA_ATTR_FORCE_CONTIGUOUS;
+	unsigned long dma_attrs = DMA_ATTR_FORCE_CONTIGUOUS | DMA_ATTR_NO_KERNEL_MAPPING;
+	unsigned long flags = VM_DMA_COHERENT | VM_FLUSH_RESET_PERMS;
+	struct page **pages;
+	struct page *page;
 	dma_addr_t phys;
 	void *metadata;
 	int mdata_perm;
 	int xferop_ret;
 	size_t size;
-	void *ptr;
+	void *vaddr;
+	int count;
 	int ret;
+	int i;
 
 	metadata = qcom_mdt_read_metadata(fw, &size, fw_name, qproc->dev);
 	if (IS_ERR(metadata))
 		return PTR_ERR(metadata);
 
-	ptr = dma_alloc_attrs(qproc->dev, size, &phys, GFP_KERNEL, dma_attrs);
-	if (!ptr) {
-		kfree(metadata);
+	page = dma_alloc_attrs(qproc->dev, size, &phys, GFP_KERNEL, dma_attrs);
+	if (!page) {
 		dev_err(qproc->dev, "failed to allocate mdt buffer\n");
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto free_metadata;
+	}
+
+	count = PAGE_ALIGN(size) >> PAGE_SHIFT;
+	pages = kmalloc_array(count, sizeof(struct page *), GFP_KERNEL);
+	if (!pages) {
+		ret = -ENOMEM;
+		goto free_metadata;
 	}
 
-	memcpy(ptr, metadata, size);
+	for (i = 0; i < count; i++)
+		pages[i] = nth_page(page, i);
+
+	vaddr = vmap(pages, count, flags, dma_pgprot(qproc->dev, PAGE_KERNEL, dma_attrs));
+	kfree(pages);
+	if (!vaddr) {
+		dev_err(qproc->dev, "unable to map memory region: %pa+%zx\n", &phys, size);
+		ret = -EBUSY;
+		goto free_metadata;
+	}
+
+	memcpy(vaddr, metadata, size);
+
+	vunmap(vaddr);
 
 	/* Hypervisor mapping to access metadata by modem */
 	mdata_perm = BIT(QCOM_SCM_VMID_HLOS);
@@ -982,7 +1008,8 @@ static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw,
 			 "mdt buffer not reclaimed system may become unstable\n");
 
 free_dma_attrs:
-	dma_free_attrs(qproc->dev, size, ptr, phys, dma_attrs);
+	dma_free_attrs(qproc->dev, size, page, phys, dma_attrs);
+free_metadata:
 	kfree(metadata);
 
 	return ret < 0 ? ret : 0;
-- 
2.7.4

