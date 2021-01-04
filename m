Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E449AC433E0
	for <linux-remoteproc@archiver.kernel.org>; Mon,  4 Jan 2021 21:19:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8FAD0216C4
	for <linux-remoteproc@archiver.kernel.org>; Mon,  4 Jan 2021 21:19:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726021AbhADVTV (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 4 Jan 2021 16:19:21 -0500
Received: from vern.gendns.com ([98.142.107.122]:55818 "EHLO vern.gendns.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725921AbhADVTV (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 4 Jan 2021 16:19:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=lechnology.com; s=default; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=MAAs0Et0zOLLAjw5ZiC/pGBWrPSPuLxzhV1zmsRtIBM=; b=k1RlCd4Vj4heD/1L7dOGKGNivo
        DWDuPTWJfwLdWscrsL0QjCVxdNUSSGy0471Bv0/oNhSK4/fKOMN4bvB2wUUtNlc7+KYVE2J7sbu6I
        f/R6m1Pntw5WdRc/CbFmZTBams7RdS7OeaBRv5pUBiVYe37TGUFmp+fXfVW6g8q4j2pNxBq9Nf8VM
        v93C/0f2BL3MfRKVhyXKJGRxYGLAQLjixsgSoVo+S+qNWSojiUGLKBLlr8FNjByM/x+1xmzu1tm0O
        ncpy5NLYp8tq+k11/wz780Sq4AesDr6ut5mXR9XA4jBVa8zzM7X0XD9QFphtd8HLspts4MRGmYZZZ
        GBwUznjA==;
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net ([108.198.5.147]:56186 helo=freyr.lechnology.com)
        by vern.gendns.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <david@lechnology.com>)
        id 1kwXFN-0004ac-PP; Mon, 04 Jan 2021 16:18:37 -0500
From:   David Lechner <david@lechnology.com>
To:     linux-remoteproc@vger.kernel.org
Cc:     David Lechner <david@lechnology.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        Suman Anna <s-anna@ti.com>, linux-kernel@vger.kernel.org
Subject: [PATCH] remoteproc: pru: future-proof PRU ID matching
Date:   Mon,  4 Jan 2021 15:18:16 -0600
Message-Id: <20210104211816.420602-1-david@lechnology.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id: davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Currently, to determine the ID (0 or 1) of a PRU core, the last 19 bits
of the physical address of the cores IRAM are compared to known values.
However, the PRUs on TI AM18XX have IRAM at 0x01c38000 and 0x01c3c000
respectively. The former conflicts with PRU1_IRAM_ADDR_MASK which could
cause PRU0 to be detected as PRU1. (The latter also conflicts with
TX_PRU1_IRAM_ADDR_MASK but it would still be correctly detected as
PRU1.)

This fixes the problem by moving the address matching offset values to
the device-specific data. This way the compatible string does half of
the work of narrowing down the addresses to two possibilities instead
of checking the address against all possible PRU types. This also lets
us narrow down the scope of the match from 19 bits to 16 bits for all
PRU types.

After this, the TI AM18XX PRUs will be able to be added without running
into the problems stated above.

We can also drop the local ret variable while touching this code.

Signed-off-by: David Lechner <david@lechnology.com>
---
 drivers/remoteproc/pru_rproc.c | 49 ++++++++++++++--------------------
 1 file changed, 20 insertions(+), 29 deletions(-)

diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
index 2667919d76b3..94ce48df2f48 100644
--- a/drivers/remoteproc/pru_rproc.c
+++ b/drivers/remoteproc/pru_rproc.c
@@ -46,15 +46,6 @@
 #define PRU_DEBUG_GPREG(x)	(0x0000 + (x) * 4)
 #define PRU_DEBUG_CT_REG(x)	(0x0080 + (x) * 4)
 
-/* PRU/RTU/Tx_PRU Core IRAM address masks */
-#define PRU_IRAM_ADDR_MASK	0x3ffff
-#define PRU0_IRAM_ADDR_MASK	0x34000
-#define PRU1_IRAM_ADDR_MASK	0x38000
-#define RTU0_IRAM_ADDR_MASK	0x4000
-#define RTU1_IRAM_ADDR_MASK	0x6000
-#define TX_PRU0_IRAM_ADDR_MASK	0xa000
-#define TX_PRU1_IRAM_ADDR_MASK	0xc000
-
 /* PRU device addresses for various type of PRU RAMs */
 #define PRU_IRAM_DA	0	/* Instruction RAM */
 #define PRU_PDRAM_DA	0	/* Primary Data RAM */
@@ -96,10 +87,14 @@ enum pru_type {
 /**
  * struct pru_private_data - device data for a PRU core
  * @type: type of the PRU core (PRU, RTU, Tx_PRU)
+ * @pru0_iram_offset: used to identify PRU core 0
+ * @pru1_iram_offset: used to identify PRU core 1
  * @is_k3: flag used to identify the need for special load handling
  */
 struct pru_private_data {
 	enum pru_type type;
+	u16 pru0_iram_offset;
+	u16 pru1_iram_offset;
 	unsigned int is_k3 : 1;
 };
 
@@ -693,33 +688,21 @@ static int pru_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
 }
 
 /*
- * Compute PRU id based on the IRAM addresses. The PRU IRAMs are
+ * Compute PRU id based on the last 16 bits of IRAM addresses. The PRU IRAMs are
  * always at a particular offset within the PRUSS address space.
  */
 static int pru_rproc_set_id(struct pru_rproc *pru)
 {
-	int ret = 0;
-
-	switch (pru->mem_regions[PRU_IOMEM_IRAM].pa & PRU_IRAM_ADDR_MASK) {
-	case TX_PRU0_IRAM_ADDR_MASK:
-		fallthrough;
-	case RTU0_IRAM_ADDR_MASK:
-		fallthrough;
-	case PRU0_IRAM_ADDR_MASK:
+	u16 offset = pru->mem_regions[PRU_IOMEM_IRAM].pa;
+
+	if (offset == pru->data->pru0_iram_offset)
 		pru->id = 0;
-		break;
-	case TX_PRU1_IRAM_ADDR_MASK:
-		fallthrough;
-	case RTU1_IRAM_ADDR_MASK:
-		fallthrough;
-	case PRU1_IRAM_ADDR_MASK:
+	else if (offset == pru->data->pru1_iram_offset)
 		pru->id = 1;
-		break;
-	default:
-		ret = -EINVAL;
-	}
+	else
+		return -EINVAL;
 
-	return ret;
+	return 0;
 }
 
 static int pru_rproc_probe(struct platform_device *pdev)
@@ -825,20 +808,28 @@ static int pru_rproc_remove(struct platform_device *pdev)
 
 static const struct pru_private_data pru_data = {
 	.type = PRU_TYPE_PRU,
+	.pru0_iram_offset = 0x4000,
+	.pru1_iram_offset = 0x8000,
 };
 
 static const struct pru_private_data k3_pru_data = {
 	.type = PRU_TYPE_PRU,
+	.pru0_iram_offset = 0x4000,
+	.pru1_iram_offset = 0x8000,
 	.is_k3 = 1,
 };
 
 static const struct pru_private_data k3_rtu_data = {
 	.type = PRU_TYPE_RTU,
+	.pru0_iram_offset = 0x4000,
+	.pru1_iram_offset = 0x6000,
 	.is_k3 = 1,
 };
 
 static const struct pru_private_data k3_tx_pru_data = {
 	.type = PRU_TYPE_TX_PRU,
+	.pru0_iram_offset = 0xa000,
+	.pru1_iram_offset = 0xc000,
 	.is_k3 = 1,
 };
 
-- 
2.25.1

