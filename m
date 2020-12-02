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
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0D9AC64E8A
	for <linux-remoteproc@archiver.kernel.org>; Wed,  2 Dec 2020 04:47:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 976A222202
	for <linux-remoteproc@archiver.kernel.org>; Wed,  2 Dec 2020 04:47:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726664AbgLBErA (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 1 Dec 2020 23:47:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725902AbgLBErA (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 1 Dec 2020 23:47:00 -0500
Received: from mail-qv1-xf4a.google.com (mail-qv1-xf4a.google.com [IPv6:2607:f8b0:4864:20::f4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CC46C061A04
        for <linux-remoteproc@vger.kernel.org>; Tue,  1 Dec 2020 20:46:16 -0800 (PST)
Received: by mail-qv1-xf4a.google.com with SMTP id e13so315885qvl.19
        for <linux-remoteproc@vger.kernel.org>; Tue, 01 Dec 2020 20:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=EJIkGbMwGweiA8accuD7cTOgHJm9UvrQYFz8KGV9AuU=;
        b=WjwJudTOz7CcjKxhs1e1IIacD2HC6PYCVI4DBZona+Y59Gai0iCACyFNrR7AJo3K1M
         5uSfunL3WwVnaf3h70o/9O4gJB9NWAdnOtSP3Aoo8y8yZKwBHlZHUAR5w4EZ5mW6PfnW
         8TxKwXs4BzeBMnyL+Hoz3sXuhJYvR8NPHtS1C3MDsSiJDAa1KjWzvrY5YZdH95QGaSCQ
         rXAt6FzPe5fmC+R2HFnYGjSoepEMgYNhwx5KV5GL9xkzSTiNRPF3nii7LJFZHMJcoQFs
         h5p25j/s7Hmzt+v87NTATbSX+UhAHm+7HLoBnCA67J9baJP45Frobjk4JFohqpn2fNyU
         qmiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=EJIkGbMwGweiA8accuD7cTOgHJm9UvrQYFz8KGV9AuU=;
        b=XQzJmTf9H1ml3tZFjZgTInmA+FP0r29l1QErwTkgZiH5VmBV5E2/d44x4NF+1aw1zU
         c7Gj/yCQaI7ofebqHlpJT79SRGbHc8//wqg8E7ypORstUI+gXEd/qCBBkKGc/2zaLayj
         ftSPZ42D43aX5v3LiriO5SXBrF2HkIJhlAX2Hiq/9jjPr/DT1kyotKeNTNyCLvqdPK8K
         7p+JYyueejeTz7gkRkc1a+uci1YN8j0CBvOtJs6StiVisdPBWRZ0SZXxFeon6+x3VzvB
         19pHE4c3VZjJMN4iBFNjYx6Iko3Xd742k0VwXEq2kfHhRvMYZ6eWpbwVYEGZ3nq/wD1t
         n65Q==
X-Gm-Message-State: AOAM5304+3uCtTW+7dhHX01GWFIMvGX4tAt3KBTYqrstGu0XCP71CjW/
        z3cogg6GUsDr7wDW32nX0J1WTeElnNp1
X-Google-Smtp-Source: ABdhPJxT8BPsXuU2maHNlokyO3UDZdEnif0Ynm/I6r45fPTrCJGU++ch1LnND0AA4UcZsA2OvMQ4PcIc2y/2
Sender: "tzungbi via sendgmr" <tzungbi@tzungbi-z840.tpe.corp.google.com>
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a0c:9026:: with SMTP id
 o35mr932832qvo.6.1606884375469; Tue, 01 Dec 2020 20:46:15 -0800 (PST)
Date:   Wed,  2 Dec 2020 12:46:09 +0800
Message-Id: <20201202044609.2501913-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: [PATCH v4] remoteproc/mediatek: read IPI buffer offset from FW
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, matthias.bgg@gmail.com,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, mathieu.poirier@linaro.org,
        pihsun@chromium.org, tzungbi@google.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Reads the IPI buffer offset from the FW binary.  The information resides
in addr of .ipi_buffer section.

Moves scp_ipi_init() to rproc_ops::parse_fw() phase.  The IPI buffer can
be initialized only if the offset is clear.

To backward compatible to MT8183 SCP, specify the offset in the board
specific mtk_scp_of_data.  Reads the default offset if the firmware
doesn't have it.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
Changes from v3[2]:
- move scp_ipi_init() to rproc_ops::parse_fw()
- separate error handling fixing if scp_before_load() fails to standalone
  patch

Changes from v2[1]:
- to backward-compatible, reads the default offset if the firmware doesn't
  have it

[1]: https://patchwork.kernel.org/project/linux-remoteproc/patch/20201127092941.1646260-1-tzungbi@google.com/
[2]: https://patchwork.kernel.org/project/linux-remoteproc/patch/20201130034025.3232229-1-tzungbi@google.com/

 drivers/remoteproc/mtk_common.h |  2 +
 drivers/remoteproc/mtk_scp.c    | 89 +++++++++++++++++++++++++--------
 2 files changed, 69 insertions(+), 22 deletions(-)

diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
index b3397d327786..5169ddce2dc7 100644
--- a/drivers/remoteproc/mtk_common.h
+++ b/drivers/remoteproc/mtk_common.h
@@ -78,6 +78,8 @@ struct mtk_scp_of_data {
 
 	u32 host_to_scp_reg;
 	u32 host_to_scp_int_bit;
+
+	size_t ipi_buf_offset;
 };
 
 struct mtk_scp {
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index c7d49c861adb..7c2dd1b5dd12 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -21,7 +21,7 @@
 #include "remoteproc_internal.h"
 
 #define MAX_CODE_SIZE 0x500000
-#define SCP_FW_END 0x7C000
+#define SECTION_NAME_IPI_BUFFER ".ipi_buffer"
 
 /**
  * scp_get() - get a reference to SCP.
@@ -119,16 +119,29 @@ static void scp_ipi_handler(struct mtk_scp *scp)
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
+	/* read the ipi buf addr from FW itself first */
+	ret = scp_elf_read_ipi_buf_addr(scp, fw, &offset);
+	if (ret) {
+		/* use default ipi buf addr if the FW doesn't have it */
+		offset = scp->data->ipi_buf_offset;
+		if (!offset)
+			return ret;
+	}
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
 
@@ -271,6 +284,32 @@ static int scp_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
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
@@ -358,6 +397,23 @@ static int scp_load(struct rproc *rproc, const struct firmware *fw)
 	return ret;
 }
 
+static int scp_parse_fw(struct rproc *rproc, const struct firmware *fw)
+{
+	struct mtk_scp *scp = rproc->priv;
+	struct device *dev = scp->dev;
+	int ret;
+
+	ret = clk_prepare_enable(scp->clk);
+	if (ret) {
+		dev_err(dev, "failed to enable clocks\n");
+		return ret;
+	}
+
+	ret = scp_ipi_init(scp, fw);
+	clk_disable_unprepare(scp->clk);
+	return ret;
+}
+
 static int scp_start(struct rproc *rproc)
 {
 	struct mtk_scp *scp = (struct mtk_scp *)rproc->priv;
@@ -461,6 +517,7 @@ static const struct rproc_ops scp_ops = {
 	.stop		= scp_stop,
 	.load		= scp_load,
 	.da_to_va	= scp_da_to_va,
+	.parse_fw	= scp_parse_fw,
 };
 
 /**
@@ -680,19 +737,6 @@ static int scp_probe(struct platform_device *pdev)
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
@@ -760,6 +804,7 @@ static const struct mtk_scp_of_data mt8183_of_data = {
 	.scp_stop = mt8183_scp_stop,
 	.host_to_scp_reg = MT8183_HOST_TO_SCP,
 	.host_to_scp_int_bit = MT8183_HOST_IPC_INT_BIT,
+	.ipi_buf_offset = 0x7bdb0,
 };
 
 static const struct mtk_scp_of_data mt8192_of_data = {
-- 
2.29.2.454.gaff20da3a2-goog

