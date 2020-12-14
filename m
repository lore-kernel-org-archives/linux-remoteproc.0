Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-26.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D795AC4361B
	for <linux-remoteproc@archiver.kernel.org>; Mon, 14 Dec 2020 05:06:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8A6DB2085B
	for <linux-remoteproc@archiver.kernel.org>; Mon, 14 Dec 2020 05:06:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727632AbgLNFGc (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 14 Dec 2020 00:06:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726030AbgLNFGc (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 14 Dec 2020 00:06:32 -0500
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7C69C061794
        for <linux-remoteproc@vger.kernel.org>; Sun, 13 Dec 2020 21:05:51 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id e74so19504683ybh.19
        for <linux-remoteproc@vger.kernel.org>; Sun, 13 Dec 2020 21:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=O8AQ7ej0ikQ65amEV9o8gcBkhCb1EY1FP1shGPZnluE=;
        b=gAlYmzUImi7M03yomHNsSVy3NExu5+4A/Qrw7vRXcVwz//y+DBgdvi57zqhwy5g+Od
         aq5Q688wbUQL/1Wdei7DG/nb58SUqAvCceYqYyyrv0BCqkOLpq/btHVrwq3Ngzz+8em1
         QMKh3ro0T4cLY3VLJ0emN/yQtyaHhx+ClZ/f5GNCqOc7Nth25qSgtlQX7T/3sxBfN8Jr
         HpjD7aFSaU+r3BJA9E9QQdz1R7cw0Jfa2ffcb6WBvdCTJm56ZMexzMTx8HauMpUo7K5a
         VCneyUB+qlM6t6jjqJAk7ri3OZVes/P6eGoKjpcLt+RdUXRat9ej/0HgsIENeM1xj5ja
         PuGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=O8AQ7ej0ikQ65amEV9o8gcBkhCb1EY1FP1shGPZnluE=;
        b=HZceG9rdiu3Z89LNLhTiKhmWhmeAh8VRd4STTOTqPZjig6w0rAW5DfhxtUnt93B49P
         +AG+kGZiZnFffvAzkfTOot9T+dkWZbyy9pqh/P9oJfsJDPCkHtev/ZcFlGfFRk1cPY86
         kEtg/XgHRJFnQhqNWu/eXjInaD3Zw3KaVNrwRSdywpLtWkefUg+uXDtD0ird40J/Rrdg
         1/OLIU4584KGoNHqXunjB1JuN7vc4H89cLjX5Tyfuk8BO6uTHT+Qblz5R5LoWL04FRSP
         iv5YS0Z564Mx+dBP8ecwPu2lsZ+1Z/nTBrDlevFGz3i85HqmAOCoJ8Dss/UwWHWK3uMJ
         u6UQ==
X-Gm-Message-State: AOAM530PY6i07P+QUJt/5Lota1fODNiR970x+A93iDywo1aNsugWxwvY
        cidK36Qd70fDu66qud03NN7/rxw6wLhb
X-Google-Smtp-Source: ABdhPJzYd4yzUs4s/dbBiPexbPY/mAOMAuQC9Ou4EpN65HOJGafhsgMH0K2WpP+bNPDuHLaSPs8tULOfD93H
Sender: "tzungbi via sendgmr" <tzungbi@tzungbi-z840.tpe.corp.google.com>
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a25:d92:: with SMTP id 140mr35243043ybn.101.1607922350995;
 Sun, 13 Dec 2020 21:05:50 -0800 (PST)
Date:   Mon, 14 Dec 2020 13:05:21 +0800
In-Reply-To: <20201214050521.845396-1-tzungbi@google.com>
Message-Id: <20201214050521.845396-3-tzungbi@google.com>
Mime-Version: 1.0
References: <20201214050521.845396-1-tzungbi@google.com>
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
Subject: [PATCH 2/2] remoteproc/mediatek: support L1TCM
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-remoteproc@vger.kernel.org, matthias.bgg@gmail.com,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        tzungbi@google.com
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
 drivers/remoteproc/mtk_common.h |  5 +++
 drivers/remoteproc/mtk_scp.c    | 54 +++++++++++++++++++++++++++++++--
 2 files changed, 57 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
index 988edb4977c3..94bc54b224ee 100644
--- a/drivers/remoteproc/mtk_common.h
+++ b/drivers/remoteproc/mtk_common.h
@@ -75,6 +75,7 @@ struct mtk_scp_of_data {
 	void (*scp_reset_assert)(struct mtk_scp *scp);
 	void (*scp_reset_deassert)(struct mtk_scp *scp);
 	void (*scp_stop)(struct mtk_scp *scp);
+	void *(*scp_da_to_va)(struct mtk_scp *scp, u64 da, size_t len);
 
 	u32 host_to_scp_reg;
 	u32 host_to_scp_int_bit;
@@ -89,6 +90,10 @@ struct mtk_scp {
 	void __iomem *reg_base;
 	void __iomem *sram_base;
 	size_t sram_size;
+	phys_addr_t sram_phys;
+	void __iomem *l1tcm_base;
+	size_t l1tcm_size;
+	phys_addr_t l1tcm_phys;
 
 	const struct mtk_scp_of_data *data;
 
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index e0c235690361..f025aba67abc 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -458,9 +458,8 @@ static int scp_start(struct rproc *rproc)
 	return ret;
 }
 
-static void *scp_da_to_va(struct rproc *rproc, u64 da, size_t len)
+static void *mt8183_scp_da_to_va(struct mtk_scp *scp, u64 da, size_t len)
 {
-	struct mtk_scp *scp = (struct mtk_scp *)rproc->priv;
 	int offset;
 
 	if (da < scp->sram_size) {
@@ -476,6 +475,42 @@ static void *scp_da_to_va(struct rproc *rproc, u64 da, size_t len)
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
@@ -714,6 +749,19 @@ static int scp_probe(struct platform_device *pdev)
 		goto free_rproc;
 	}
 	scp->sram_size = resource_size(res);
+	scp->sram_phys = res->start;
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "l1tcm");
+	if (res) {
+		scp->l1tcm_base = devm_ioremap_resource(dev, res);
+		if (IS_ERR((__force void *)scp->l1tcm_base)) {
+			dev_err(dev, "Failed to parse and map l1tcm memory\n");
+			ret = PTR_ERR((__force void *)scp->l1tcm_base);
+			goto free_rproc;
+		}
+		scp->l1tcm_size = resource_size(res);
+		scp->l1tcm_phys = res->start;
+	}
 
 	mutex_init(&scp->send_lock);
 	for (i = 0; i < SCP_IPI_MAX; i++)
@@ -803,6 +851,7 @@ static const struct mtk_scp_of_data mt8183_of_data = {
 	.scp_reset_assert = mt8183_scp_reset_assert,
 	.scp_reset_deassert = mt8183_scp_reset_deassert,
 	.scp_stop = mt8183_scp_stop,
+	.scp_da_to_va = mt8183_scp_da_to_va,
 	.host_to_scp_reg = MT8183_HOST_TO_SCP,
 	.host_to_scp_int_bit = MT8183_HOST_IPC_INT_BIT,
 	.ipi_buf_offset = 0x7bdb0,
@@ -814,6 +863,7 @@ static const struct mtk_scp_of_data mt8192_of_data = {
 	.scp_reset_assert = mt8192_scp_reset_assert,
 	.scp_reset_deassert = mt8192_scp_reset_deassert,
 	.scp_stop = mt8192_scp_stop,
+	.scp_da_to_va = mt8192_scp_da_to_va,
 	.host_to_scp_reg = MT8192_GIPC_IN_SET,
 	.host_to_scp_int_bit = MT8192_HOST_IPC_INT_BIT,
 };
-- 
2.29.2.684.gfbc64c5ab5-goog

