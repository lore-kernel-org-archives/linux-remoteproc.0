Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-31.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22953C2D0E4
	for <linux-remoteproc@archiver.kernel.org>; Fri, 27 Nov 2020 09:30:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C14F4206D9
	for <linux-remoteproc@archiver.kernel.org>; Fri, 27 Nov 2020 09:30:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U7SYomBZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726964AbgK0JaR (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 27 Nov 2020 04:30:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726736AbgK0JaQ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 27 Nov 2020 04:30:16 -0500
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com [IPv6:2607:f8b0:4864:20::849])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A8D9C0613D1
        for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2020 01:30:15 -0800 (PST)
Received: by mail-qt1-x849.google.com with SMTP id o1so2903381qtp.7
        for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2020 01:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=G2nRnTMvMHzL0pssVZ9j+N4BueXIkkDpFiReYAP2EPk=;
        b=U7SYomBZ8bTO5HYsWoJbCSSKduoMS6hJ1d8aQeL6mSnl1W5zAZr+gjanQ3FcI3FLPT
         vOJKP5xZbHJttoOjZdZMclKLPHpcpg0VcYRrfqmzJpdTTLZ8s02s94ObOJyStTrC/TiO
         3EcUk0NLGPhzsobAyr59Br5y4fx1Fr1WRL5UboTKREqOEsHKJaHJNaCUVNQThLfopd8b
         koLF+s4imsdgTrCCySG+qesjIQGneA+6X03ycb6BXSf264JB+UAectiSuIuj/aLlhp5q
         202QAgpUYwAJfkyuTdOsXterzZSBkO3MK/3mO7WzBV11SOPJRayQu7hdWTlEh28uWri2
         7VwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=G2nRnTMvMHzL0pssVZ9j+N4BueXIkkDpFiReYAP2EPk=;
        b=lU/J2crwAtcjeN7HqkBze9pKOzTsdXRa2MER8jB6Ba5not/ruppDII37jQhzOrb1QH
         jW4+vomEazFjlypn0b5rwhZW4LlR++TVhHXEP1/QZz0z4wNG/Ny5Jezzvxw6PHxuV65h
         AkR3CBaOraHUNrJf4ShjnWdstE1UMZjbI8c7VcI/zI7vdVFpZzic3yXsgwM5KCwIpasw
         CyQ6cZs13jLCsgJeZ/JcMLFQKzj4K8d3n747P/zX2tqxJswFRhefPj//G1CPp2PXO8r2
         HuDLFzKl1eD3fTrh0Yt5MPkx5EidiROJ/U3FleXhirK08BZlm0ID8hmi+AgLkuTpEWFf
         /6Mw==
X-Gm-Message-State: AOAM530glzyr5rtwhK7k1o6qKcIUMEiH6eVkdsWhsXA/63bnRN1K8SWs
        N7V7QLwChb/ZF45plNwyQHUBDsWf8RmA
X-Google-Smtp-Source: ABdhPJx6mscbpsH8qZuJ6gMH52Dnivs1BabDL+T3CMBLWtLYD/NXJQ/OxbUCDguG/TDvwJJqlUhF6D0buoIX
Sender: "tzungbi via sendgmr" <tzungbi@tzungbi-z840.tpe.corp.google.com>
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a0c:be02:: with SMTP id
 k2mr7428605qvg.49.1606469414080; Fri, 27 Nov 2020 01:30:14 -0800 (PST)
Date:   Fri, 27 Nov 2020 17:29:41 +0800
Message-Id: <20201127092941.1646260-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: [RESEND PATCH v2] remoteproc/mediatek: read IPI buffer offset from FW
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, matthias.bgg@gmail.com,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, pihsun@chromium.org,
        mathieu.poirier@linaro.org, Tzung-Bi Shih <tzungbi@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Reads the IPI buffer offset from the FW binary.  The information resides
in addr of .ipi_buffer section.

Moves scp_ipi_init() to scp_load() phase.  The IPI buffer can be
initialized only if the offset is clear.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
The patch bases on https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git/log/?h=for-next

The first 2 patches in the series
https://patchwork.kernel.org/project/linux-remoteproc/cover/20201116084413.3312631-1-tzungbi@google.com/
have been merged to remoteproc for-next branch.

Follow up the discussion in
https://patchwork.kernel.org/project/linux-remoteproc/patch/20201116084413.3312631-4-tzungbi@google.com/#23784483

The patch breaks MTK SCP when working with legacy SCP firmware.  We're
aware of it and will upgrade the devices' kernel and SCP firmware
carefully.  Other than that, AFAICT, no other devices in the wild are
using this driver.

 drivers/remoteproc/mtk_scp.c | 73 ++++++++++++++++++++++++------------
 1 file changed, 49 insertions(+), 24 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 7e0f1e1a335b..4467ed646bb1 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -21,7 +21,7 @@
 #include "remoteproc_internal.h"
 
 #define MAX_CODE_SIZE 0x500000
-#define SCP_FW_END 0x7C000
+#define SECTION_NAME_IPI_BUFFER ".ipi_buffer"
 
 /**
  * scp_get() - get a reference to SCP.
@@ -119,16 +119,24 @@ static void scp_ipi_handler(struct mtk_scp *scp)
 	wake_up(&scp->ack_wq);
 }
 
-static int scp_ipi_init(struct mtk_scp *scp)
+static int scp_elf_read_ipi_buf_addr(struct mtk_scp *scp,
+				     const struct firmware *fw,
+				     size_t *offset);
+
+static int scp_ipi_init(struct mtk_scp *scp, const struct firmware *fw)
 {
-	size_t send_offset = SCP_FW_END - sizeof(struct mtk_share_obj);
-	size_t recv_offset = send_offset - sizeof(struct mtk_share_obj);
+	int ret;
+	size_t offset;
+
+	ret = scp_elf_read_ipi_buf_addr(scp, fw, &offset);
+	if (ret)
+		return ret;
+	dev_info(scp->dev, "IPI buf addr %#010zx\n", offset);
 
-	/* shared buffer initialization */
-	scp->recv_buf =
-		(struct mtk_share_obj __iomem *)(scp->sram_base + recv_offset);
-	scp->send_buf =
-		(struct mtk_share_obj __iomem *)(scp->sram_base + send_offset);
+	scp->recv_buf = (struct mtk_share_obj __iomem *)
+			(scp->sram_base + offset);
+	scp->send_buf = (struct mtk_share_obj __iomem *)
+			(scp->sram_base + offset + sizeof(*scp->recv_buf));
 	memset_io(scp->recv_buf, 0, sizeof(*scp->recv_buf));
 	memset_io(scp->send_buf, 0, sizeof(*scp->send_buf));
 
@@ -271,6 +279,32 @@ static int scp_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
 	return ret;
 }
 
+static int scp_elf_read_ipi_buf_addr(struct mtk_scp *scp,
+				     const struct firmware *fw,
+				     size_t *offset)
+{
+	struct elf32_hdr *ehdr;
+	struct elf32_shdr *shdr, *shdr_strtab;
+	int i;
+	const u8 *elf_data = fw->data;
+	const char *strtab;
+
+	ehdr = (struct elf32_hdr *)elf_data;
+	shdr = (struct elf32_shdr *)(elf_data + ehdr->e_shoff);
+	shdr_strtab = shdr + ehdr->e_shstrndx;
+	strtab = (const char *)(elf_data + shdr_strtab->sh_offset);
+
+	for (i = 0; i < ehdr->e_shnum; i++, shdr++) {
+		if (strcmp(strtab + shdr->sh_name,
+			   SECTION_NAME_IPI_BUFFER) == 0) {
+			*offset = shdr->sh_addr;
+			return 0;
+		}
+	}
+
+	return -ENOENT;
+}
+
 static int mt8183_scp_before_load(struct mtk_scp *scp)
 {
 	/* Clear SCP to host interrupt */
@@ -350,11 +384,15 @@ static int scp_load(struct rproc *rproc, const struct firmware *fw)
 
 	ret = scp->data->scp_before_load(scp);
 	if (ret < 0)
-		return ret;
+		goto leave;
 
 	ret = scp_elf_load_segments(rproc, fw);
-	clk_disable_unprepare(scp->clk);
+	if (ret)
+		goto leave;
 
+	ret = scp_ipi_init(scp, fw);
+leave:
+	clk_disable_unprepare(scp->clk);
 	return ret;
 }
 
@@ -680,19 +718,6 @@ static int scp_probe(struct platform_device *pdev)
 		goto release_dev_mem;
 	}
 
-	ret = clk_prepare_enable(scp->clk);
-	if (ret) {
-		dev_err(dev, "failed to enable clocks\n");
-		goto release_dev_mem;
-	}
-
-	ret = scp_ipi_init(scp);
-	clk_disable_unprepare(scp->clk);
-	if (ret) {
-		dev_err(dev, "Failed to init ipi\n");
-		goto release_dev_mem;
-	}
-
 	/* register SCP initialization IPI */
 	ret = scp_ipi_register(scp, SCP_IPI_INIT, scp_init_ipi_handler, scp);
 	if (ret) {
-- 
2.29.2.454.gaff20da3a2-goog

