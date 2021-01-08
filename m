Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-26.6 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C512C433E0
	for <linux-remoteproc@archiver.kernel.org>; Fri,  8 Jan 2021 08:19:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 36FD623447
	for <linux-remoteproc@archiver.kernel.org>; Fri,  8 Jan 2021 08:19:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727396AbhAHITS (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 8 Jan 2021 03:19:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725793AbhAHITS (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 8 Jan 2021 03:19:18 -0500
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com [IPv6:2607:f8b0:4864:20::84a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5081C0612FE
        for <linux-remoteproc@vger.kernel.org>; Fri,  8 Jan 2021 00:18:08 -0800 (PST)
Received: by mail-qt1-x84a.google.com with SMTP id l7so7744701qth.15
        for <linux-remoteproc@vger.kernel.org>; Fri, 08 Jan 2021 00:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=LPy4kNss0vjaYMzm9yB8ZiYIGPp2YbxLPVEf6yAWf0E=;
        b=svCkAik61y2tqlI8QaAncQGfiqLGdx5ZK5/6jZwHf12GHTZ4tQSTP+82FWBOi0RfRY
         kHHnn5asv2m5TUtnsm/WXAjaf7y6sC8QUobHAXRKLBePbWoFeANyfK4fSDYosMcDQN3q
         fHABjoi4xqsrNzSpz61bjhugyeGHkYg+gxbvjouet+cJsMxu/clNaKRgSaUWSv4Au7nW
         Netk0E+Vw8siXB+M+rQ5K6CWnhaHYi3tdI/64hm9ShUzdauoHMijY/7rtEDf3wBk8yCj
         HyEHrnn1umGjn4zYtKv/ZRXHBTPy7eLsLbsIO/8pfpR4fR/aKzvwk/G7qH49x5i+slcM
         3F0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=LPy4kNss0vjaYMzm9yB8ZiYIGPp2YbxLPVEf6yAWf0E=;
        b=rKQDXkeRa8zZ4/Ts7gJTnyQTqB08wgEdaa1meC5Wvl/kLn6YvuP3AsTdXjlaFHV/UA
         CNVL39AJStLWPxOioYSlHM4Ffmk9oAIccfeE7efcrRj/4juDgX+ZpHnGqc/MDQeYAzmk
         80c8XGkmGTnthXIJzBXlsp6pYK59FSYTOuTKq42xFoEV8H3poVOiR2HaR+1qLOrJ+/xO
         5ruW6PfJ30tSainJDkrLy6cTTzae1Jp2DV0dsuJTO/eEekJ/9aQXTEjggKogwPSD0/0S
         OfaAMDQMWlbVG3UPfERY75qmjD+CgrqgEw9466R3JVcAp2yPCsTPnq3CBHtt0TxKDtfz
         L/jw==
X-Gm-Message-State: AOAM5316Mg7pO4p1bW8k9PX92Nu+bH2UVCdI4t/40psj/P3cpfzEDEBe
        SQjs4MXm7+4P/rj8gYh/lsXc1hfyTwhM
X-Google-Smtp-Source: ABdhPJwCuBbyszBJxL/WGIggEGfWdYN2ks6dq347se1rJMLcshWX3ZB6Svohs/cFLFVUi1NxZfF6HQDb5DBm
Sender: "tzungbi via sendgmr" <tzungbi@tzungbi-z840.tpe.corp.google.com>
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a0c:8445:: with SMTP id
 l63mr2381601qva.60.1610093887875; Fri, 08 Jan 2021 00:18:07 -0800 (PST)
Date:   Fri,  8 Jan 2021 16:17:38 +0800
In-Reply-To: <20210108081738.2175224-1-tzungbi@google.com>
Message-Id: <20210108081738.2175224-5-tzungbi@google.com>
Mime-Version: 1.0
References: <20210108081738.2175224-1-tzungbi@google.com>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
Subject: [PATCH v2 4/4] remoteproc/mediatek: support L1TCM
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-remoteproc@vger.kernel.org, matthias.bgg@gmail.com,
        linux-mediatek@lists.infradead.org, mathieu.poirier@linaro.org,
        devicetree@vger.kernel.org, tzungbi@google.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

L1TCM is a high performance memory region in MT8192 SCP.

Reads L1TCM memory region from DTS to determine if the machine supports.
Loads L1TCM memory region to SCP sys if the firmware provides.

Starts from MT8192 SCP, the firmware contains physical addresses for
each memory region, for instance:

Program Headers:
  Type   Offset   VirtAddr   PhysAddr   FileSiz MemSiz  Flg Align
  LOAD   0xXXXXXX 0xXXXXXXXX 0x10500000 0xXXXXX 0xXXXXX XXX 0xXXXX
  LOAD   0xXXXXXX 0xXXXXXXXX 0x10700000 0xXXXXX 0xXXXXX XXX 0xXXXX
  LOAD   0xXXXXXX 0xXXXXXXXX 0x50000000 0xXXXXX 0xXXXXX XXX 0xXXXX

Kernel driver can use the "PhysAddr" (i.e. da in the da_to_va callbacks)
to know the ELF segment belongs to which region.

To backward compatible to MT8183 SCP, separates the da_to_va callbacks
for new and legacy version.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
Changes from v1[1]:
- Uses -EINVAL to determine the memory region isn't specified to make
  the intent more clear.

[1]: https://patchwork.kernel.org/project/linux-remoteproc/patch/20201214050521.845396-3-tzungbi@google.com/

 drivers/remoteproc/mtk_common.h |  5 +++
 drivers/remoteproc/mtk_scp.c    | 56 +++++++++++++++++++++++++++++++--
 2 files changed, 59 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
index 661c998288d7..5f7cd2336cef 100644
--- a/drivers/remoteproc/mtk_common.h
+++ b/drivers/remoteproc/mtk_common.h
@@ -76,6 +76,7 @@ struct mtk_scp_of_data {
 	void (*scp_reset_assert)(struct mtk_scp *scp);
 	void (*scp_reset_deassert)(struct mtk_scp *scp);
 	void (*scp_stop)(struct mtk_scp *scp);
+	void *(*scp_da_to_va)(struct mtk_scp *scp, u64 da, size_t len);
 
 	u32 host_to_scp_reg;
 	u32 host_to_scp_int_bit;
@@ -90,6 +91,10 @@ struct mtk_scp {
 	void __iomem *reg_base;
 	void __iomem *sram_base;
 	size_t sram_size;
+	phys_addr_t sram_phys;
+	void __iomem *l1tcm_base;
+	size_t l1tcm_size;
+	phys_addr_t l1tcm_phys;
 
 	const struct mtk_scp_of_data *data;
 
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index c33c41fe54cd..96ee61bf9245 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -461,9 +461,8 @@ static int scp_start(struct rproc *rproc)
 	return ret;
 }
 
-static void *scp_da_to_va(struct rproc *rproc, u64 da, size_t len)
+static void *mt8183_scp_da_to_va(struct mtk_scp *scp, u64 da, size_t len)
 {
-	struct mtk_scp *scp = (struct mtk_scp *)rproc->priv;
 	int offset;
 
 	if (da < scp->sram_size) {
@@ -479,6 +478,42 @@ static void *scp_da_to_va(struct rproc *rproc, u64 da, size_t len)
 	return NULL;
 }
 
+static void *mt8192_scp_da_to_va(struct mtk_scp *scp, u64 da, size_t len)
+{
+	int offset;
+
+	if (da >= scp->sram_phys &&
+	    (da + len) <= scp->sram_phys + scp->sram_size) {
+		offset = da - scp->sram_phys;
+		return (void __force *)scp->sram_base + offset;
+	}
+
+	/* optional memory region */
+	if (scp->l1tcm_size &&
+	    da >= scp->l1tcm_phys &&
+	    (da + len) <= scp->l1tcm_phys + scp->l1tcm_size) {
+		offset = da - scp->l1tcm_phys;
+		return (void __force *)scp->l1tcm_base + offset;
+	}
+
+	/* optional memory region */
+	if (scp->dram_size &&
+	    da >= scp->dma_addr &&
+	    (da + len) <= scp->dma_addr + scp->dram_size) {
+		offset = da - scp->dma_addr;
+		return scp->cpu_addr + offset;
+	}
+
+	return NULL;
+}
+
+static void *scp_da_to_va(struct rproc *rproc, u64 da, size_t len)
+{
+	struct mtk_scp *scp = (struct mtk_scp *)rproc->priv;
+
+	return scp->data->scp_da_to_va(scp, da, len);
+}
+
 static void mt8183_scp_stop(struct mtk_scp *scp)
 {
 	/* Disable SCP watchdog */
@@ -717,6 +752,21 @@ static int scp_probe(struct platform_device *pdev)
 		goto free_rproc;
 	}
 	scp->sram_size = resource_size(res);
+	scp->sram_phys = res->start;
+
+	/* l1tcm is an optional memory region */
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "l1tcm");
+	scp->l1tcm_base = devm_ioremap_resource(dev, res);
+	if (IS_ERR((__force void *)scp->l1tcm_base)) {
+		ret = PTR_ERR((__force void *)scp->l1tcm_base);
+		if (ret != -EINVAL) {
+			dev_err(dev, "Failed to map l1tcm memory\n");
+			goto free_rproc;
+		}
+	} else {
+		scp->l1tcm_size = resource_size(res);
+		scp->l1tcm_phys = res->start;
+	}
 
 	mutex_init(&scp->send_lock);
 	for (i = 0; i < SCP_IPI_MAX; i++)
@@ -805,6 +855,7 @@ static const struct mtk_scp_of_data mt8183_of_data = {
 	.scp_reset_assert = mt8183_scp_reset_assert,
 	.scp_reset_deassert = mt8183_scp_reset_deassert,
 	.scp_stop = mt8183_scp_stop,
+	.scp_da_to_va = mt8183_scp_da_to_va,
 	.host_to_scp_reg = MT8183_HOST_TO_SCP,
 	.host_to_scp_int_bit = MT8183_HOST_IPC_INT_BIT,
 	.ipi_buf_offset = 0x7bdb0,
@@ -816,6 +867,7 @@ static const struct mtk_scp_of_data mt8192_of_data = {
 	.scp_reset_assert = mt8192_scp_reset_assert,
 	.scp_reset_deassert = mt8192_scp_reset_deassert,
 	.scp_stop = mt8192_scp_stop,
+	.scp_da_to_va = mt8192_scp_da_to_va,
 	.host_to_scp_reg = MT8192_GIPC_IN_SET,
 	.host_to_scp_int_bit = MT8192_HOST_IPC_INT_BIT,
 };
-- 
2.29.2.729.g45daf8777d-goog

