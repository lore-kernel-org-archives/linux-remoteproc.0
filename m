Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25B89C433E0
	for <linux-remoteproc@archiver.kernel.org>; Mon, 21 Dec 2020 09:55:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EEBFD22CE3
	for <linux-remoteproc@archiver.kernel.org>; Mon, 21 Dec 2020 09:55:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726200AbgLUJyy (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 21 Dec 2020 04:54:54 -0500
Received: from mail-vi1eur05on2046.outbound.protection.outlook.com ([40.107.21.46]:24288
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726221AbgLUJyw (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 21 Dec 2020 04:54:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ToXlMF7jYFaI7twmI+lUa0NquOd7+50vg1HOjv2fV+1O23npn5kFm6gJaSBdA9V8aVpykkqrlTdE3Ai6L7UT82WS0uNHWSe8FlYa64Ldc7RcfPoT4krVgGrXQ96RXAP6B4XfZPMdBhgr7Rhk3EGR857ylFM4KdCT76G/KSZa2kF2WAJtfqh121eYm8sxsA6jl3JGH7+tg21mIobbfosB1uCvU2B4bWr/0IvmC07vXpN70g+4BtWZoTwvRbmBzDSSO9xK/mrs1jVGkncSsbYEnpDja+sL4KFrFiaZcdXWDbA3YpJWrUustWq6f6C91a5LSJsMw//4FawE8DnGvDpICA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FLB7dQI0gPw6b3B/tyn+mvXA1ZMvuTLuZuPuKmNPD2k=;
 b=LNSChQaI6fnrmieLF+fGBPN4B6M+IV1qg2VJJ+zdSxHWP+DxX1hNdeo+1PrFD3YIq7SsQnvbAHLz+MkadmrJsVpwIVeow3+do6zcN+aKsZqwzXDp810XZC8K1krAQpzli0ZgQA1/+KJnPAr5aCsIed579J7Do19ZnK5q/OpQ0aFy1FwiZYAa+QVtEDqDgdD/pf+YLCVN3+hdUXj9N6cESTqT9IQqo82HCYO5oSN1s4se5QXnvGel6saGw80ZgxqNZKaDZsZAQJzUOzT+5w8uM9UXmHF26qK0uOOOSaVlz5CY4wvLp273FEPnGkapthHGiMcxvMRjfljm3+YVel22aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FLB7dQI0gPw6b3B/tyn+mvXA1ZMvuTLuZuPuKmNPD2k=;
 b=jCSZKGmLc2lw1IJ25Z9JlSwLpsTc9tKuPEk88o+806Di+nn0T57DpOTl9fGECA6/VtDWk+au5yMsqHT5VebgLc9NBqYq4T0diXPr7k9aXhdNHOQrkwlCFopNfa+gJWdYAXnLoj9KsnxfU5jpYDhsuNRanG398AIag/SqHqCtc1I=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DBBPR04MB7930.eurprd04.prod.outlook.com (2603:10a6:10:1ea::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.33; Mon, 21 Dec
 2020 09:38:22 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3676.033; Mon, 21 Dec 2020
 09:38:22 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 2/8] remoteproc: add is_iomem to da_to_va
Date:   Mon, 21 Dec 2020 18:06:26 +0800
Message-Id: <20201221100632.7197-3-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201221100632.7197-1-peng.fan@oss.nxp.com>
References: <20201221100632.7197-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: SG2PR02CA0110.apcprd02.prod.outlook.com
 (2603:1096:4:92::26) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SG2PR02CA0110.apcprd02.prod.outlook.com (2603:1096:4:92::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.28 via Frontend Transport; Mon, 21 Dec 2020 09:38:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 06547764-fb16-40b5-7b63-08d8a59428a1
X-MS-TrafficTypeDiagnostic: DBBPR04MB7930:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBBPR04MB7930A662657A90B79306D3D5C9C00@DBBPR04MB7930.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nfI9DmRxY1+K6TGmD3j/Q1gyr8SixVuxKYNJnLhI5DeeouaKnTaQdulBgmXaYNsG7VK2BHH2Hez/1qE6gsfZC1v9eonA47tI969NMjGc1gBlsCqVUPWtFmVD3uSwtZqGGECjYPikLjR7WMHaF2IiQ8RBpG/KB0PS8M+CN+KKJYx10OFOprZKhMz8ZEzGK3lhxY5YSDHtNzVjJ+MS5wXEA7H1x0X42mTsOBMPmwzf4oaAh4dTXwsIPK5io2cZozMnWE7CxScxhGHmorLlTobqXdspXVpIdYk6in30HAS7GMjzpb8ufXzF41Snw/h31M+/a8s+iTBzKxW2C01cl5i7B/1hAU/MqnR07FTQ7acf9za9h3JBIzvXO4FlG9xqPwijbD1IQ+1CQ4zmWb1rfVIaBA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(39860400002)(346002)(366004)(5660300002)(66946007)(478600001)(6486002)(66556008)(52116002)(66476007)(7416002)(83380400001)(8936002)(6506007)(6512007)(6666004)(26005)(316002)(956004)(30864003)(186003)(86362001)(1076003)(16526019)(2906002)(8676002)(4326008)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?AMxobkvuWmjEb6CRSr7by7LPhdAxkX23rF/WFRqjLe04CM0jBXmCagDIGGMg?=
 =?us-ascii?Q?BAC/9zWjuqXjI1XLZUcaiCSngYeF2lIf5TomyBxq3Jh8wehZrOSaBiFdTnBi?=
 =?us-ascii?Q?B3e8KA7yVjycNZsIqVecTvj40z+dnJj7G1tNKLF0NKoxBk1Be5X9CllqGGYz?=
 =?us-ascii?Q?T6g5VrzWLZy9PfZPpm/z5CD+S59B7sacbczUsDpoH9+l51cfjN2xlqgkiRAb?=
 =?us-ascii?Q?45Q3j88OncQHyWulO7HO5FRRQ064dnoZgMSNABGQ9Xd5KkCuNlRyFpeKrlVO?=
 =?us-ascii?Q?c9cInOKbFPvfOotL7trdGQyXN3Dyl1J/Om1Jh71BEL3QCjV42sTXn9U3fJBM?=
 =?us-ascii?Q?YeWjNCbZcQ+mAshEGvAtbBj/OPUxCeM6HJVv6RLgkxome+o9pn8v1SDIm8Ep?=
 =?us-ascii?Q?1FYmTjlQoTZTIq/k1z9fvoCL+A4mPmdTnpEP6EiwkQaWcw3xqS03qnKXMmHw?=
 =?us-ascii?Q?A2ZZ5r23y4KujRwJqAQ8C8ABmL2vWtZ04FCL3+pazaWcTW9cMutyvVbKI/6+?=
 =?us-ascii?Q?Yxq+7d1QrCaig7sDvIjvhxWz+JusUkP/baticbMZqnvW57k7JHIIr3CMDqpI?=
 =?us-ascii?Q?NYVBwNY6BXGc+GmJsfcr2TTmEeixASIC+f24Y1xBw/ALiGQ+1dqUAX82Xb9W?=
 =?us-ascii?Q?TEZWNHQS2th+jYCPX21Oj/PrhJNfi1pwNDIATBj0u2uk2ev4bLyQPQ0GwtRu?=
 =?us-ascii?Q?rve6zTh4gxqSzk/JMrQS6YhY16nC5Hysu/t2bFwCqV6wl/+QPISoszy+vuYW?=
 =?us-ascii?Q?CiGYPH3WP8sQklRd5T+rAfgrnB9i7OKAeVJ9WjSkjg68vafw+v/JvS/U+3JP?=
 =?us-ascii?Q?P/ABq0dsCzhtLk67ODfJZOt+XzgatYFTi3Q8MTTaI4fTZn9QKA5/ahwmC5S0?=
 =?us-ascii?Q?ZNSL6zmER28sAsW67iIfb87mS5Zc9pdofsJPkMi4NtWUdWUWnYxOmSV3piid?=
 =?us-ascii?Q?OKCwhiH2Dv0XKyz6qJ2asxU7dPlpN+mm/LzOJGvRj3uQ+fNw4Rh+p+lWH7Sv?=
 =?us-ascii?Q?tALi?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2020 09:38:22.6950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 06547764-fb16-40b5-7b63-08d8a59428a1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +8LxVerDgm4MgVgfnXFKyWbj2GswGit3Vl9JDv2zjn1qzvWqIQr2sBgCHxUaIoPgZ3zBt3jtwA+an9fOkWNESg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7930
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Introduce an extra parameter is_iomem to da_to_va, then the caller
could take the memory as normal memory or io mapped memory.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---

V4:
 New patch

 drivers/remoteproc/imx_rproc.c             |  2 +-
 drivers/remoteproc/ingenic_rproc.c         |  2 +-
 drivers/remoteproc/keystone_remoteproc.c   |  2 +-
 drivers/remoteproc/mtk_scp.c               |  6 +++---
 drivers/remoteproc/omap_remoteproc.c       |  2 +-
 drivers/remoteproc/pru_rproc.c             |  2 +-
 drivers/remoteproc/qcom_q6v5_adsp.c        |  2 +-
 drivers/remoteproc/qcom_q6v5_pas.c         |  2 +-
 drivers/remoteproc/qcom_q6v5_wcss.c        |  2 +-
 drivers/remoteproc/qcom_wcnss.c            |  2 +-
 drivers/remoteproc/remoteproc_core.c       |  7 +++++--
 drivers/remoteproc/remoteproc_coredump.c   |  8 ++++++--
 drivers/remoteproc/remoteproc_debugfs.c    |  2 +-
 drivers/remoteproc/remoteproc_elf_loader.c | 21 +++++++++++++++------
 drivers/remoteproc/remoteproc_internal.h   |  2 +-
 drivers/remoteproc/st_slim_rproc.c         |  2 +-
 drivers/remoteproc/ti_k3_dsp_remoteproc.c  |  2 +-
 drivers/remoteproc/ti_k3_r5_remoteproc.c   |  2 +-
 drivers/remoteproc/wkup_m3_rproc.c         |  2 +-
 include/linux/remoteproc.h                 |  2 +-
 20 files changed, 45 insertions(+), 29 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 8957ed271d20..6603e00bb6f4 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -208,7 +208,7 @@ static int imx_rproc_da_to_sys(struct imx_rproc *priv, u64 da,
 	return -ENOENT;
 }
 
-static void *imx_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len)
+static void *imx_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
 {
 	struct imx_rproc *priv = rproc->priv;
 	void *va = NULL;
diff --git a/drivers/remoteproc/ingenic_rproc.c b/drivers/remoteproc/ingenic_rproc.c
index 26e19e6143b7..bb5049295576 100644
--- a/drivers/remoteproc/ingenic_rproc.c
+++ b/drivers/remoteproc/ingenic_rproc.c
@@ -116,7 +116,7 @@ static void ingenic_rproc_kick(struct rproc *rproc, int vqid)
 	writel(vqid, vpu->aux_base + REG_CORE_MSG);
 }
 
-static void *ingenic_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len)
+static void *ingenic_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
 {
 	struct vpu *vpu = rproc->priv;
 	void __iomem *va = NULL;
diff --git a/drivers/remoteproc/keystone_remoteproc.c b/drivers/remoteproc/keystone_remoteproc.c
index cd266163a65f..54781f553f4e 100644
--- a/drivers/remoteproc/keystone_remoteproc.c
+++ b/drivers/remoteproc/keystone_remoteproc.c
@@ -246,7 +246,7 @@ static void keystone_rproc_kick(struct rproc *rproc, int vqid)
  * can be used either by the remoteproc core for loading (when using kernel
  * remoteproc loader), or by any rpmsg bus drivers.
  */
-static void *keystone_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len)
+static void *keystone_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
 {
 	struct keystone_rproc *ksproc = rproc->priv;
 	void __iomem *va = NULL;
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index e0c235690361..535175f013e4 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -270,7 +270,7 @@ static int scp_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
 		}
 
 		/* grab the kernel address for this device address */
-		ptr = (void __iomem *)rproc_da_to_va(rproc, da, memsz);
+		ptr = (void __iomem *)rproc_da_to_va(rproc, da, memsz, NULL);
 		if (!ptr) {
 			dev_err(dev, "bad phdr da 0x%x mem 0x%x\n", da, memsz);
 			ret = -EINVAL;
@@ -458,7 +458,7 @@ static int scp_start(struct rproc *rproc)
 	return ret;
 }
 
-static void *scp_da_to_va(struct rproc *rproc, u64 da, size_t len)
+static void *scp_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
 {
 	struct mtk_scp *scp = (struct mtk_scp *)rproc->priv;
 	int offset;
@@ -587,7 +587,7 @@ void *scp_mapping_dm_addr(struct mtk_scp *scp, u32 mem_addr)
 {
 	void *ptr;
 
-	ptr = scp_da_to_va(scp->rproc, mem_addr, 0);
+	ptr = scp_da_to_va(scp->rproc, mem_addr, 0, NULL);
 	if (!ptr)
 		return ERR_PTR(-EINVAL);
 
diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
index d94b7391bf9d..43531caa1959 100644
--- a/drivers/remoteproc/omap_remoteproc.c
+++ b/drivers/remoteproc/omap_remoteproc.c
@@ -728,7 +728,7 @@ static int omap_rproc_stop(struct rproc *rproc)
  * Return: translated virtual address in kernel memory space on success,
  *         or NULL on failure.
  */
-static void *omap_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len)
+static void *omap_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
 {
 	struct omap_rproc *oproc = rproc->priv;
 	int i;
diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
index 2667919d76b3..2dcaa274e266 100644
--- a/drivers/remoteproc/pru_rproc.c
+++ b/drivers/remoteproc/pru_rproc.c
@@ -465,7 +465,7 @@ static void *pru_i_da_to_va(struct pru_rproc *pru, u32 da, size_t len)
  * core for any PRU client drivers. The PRU Instruction RAM access is restricted
  * only to the PRU loader code.
  */
-static void *pru_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len)
+static void *pru_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
 {
 	struct pru_rproc *pru = rproc->priv;
 
diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index e02450225e4a..8b0d8bbacd2e 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -281,7 +281,7 @@ static int adsp_stop(struct rproc *rproc)
 	return ret;
 }
 
-static void *adsp_da_to_va(struct rproc *rproc, u64 da, size_t len)
+static void *adsp_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
 {
 	struct qcom_adsp *adsp = (struct qcom_adsp *)rproc->priv;
 	int offset;
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index ee586226e438..333a1e389fcd 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -242,7 +242,7 @@ static int adsp_stop(struct rproc *rproc)
 	return ret;
 }
 
-static void *adsp_da_to_va(struct rproc *rproc, u64 da, size_t len)
+static void *adsp_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
 {
 	struct qcom_adsp *adsp = (struct qcom_adsp *)rproc->priv;
 	int offset;
diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index 78ebe1168b33..704cd63c9af4 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -410,7 +410,7 @@ static int q6v5_wcss_stop(struct rproc *rproc)
 	return 0;
 }
 
-static void *q6v5_wcss_da_to_va(struct rproc *rproc, u64 da, size_t len)
+static void *q6v5_wcss_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
 {
 	struct q6v5_wcss *wcss = rproc->priv;
 	int offset;
diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index f95854255c70..1bf60dc84f69 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -320,7 +320,7 @@ static int wcnss_stop(struct rproc *rproc)
 	return ret;
 }
 
-static void *wcnss_da_to_va(struct rproc *rproc, u64 da, size_t len)
+static void *wcnss_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
 {
 	struct qcom_wcnss *wcnss = (struct qcom_wcnss *)rproc->priv;
 	int offset;
diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 2394eef383e3..9bec422ccce3 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -189,13 +189,13 @@ EXPORT_SYMBOL(rproc_va_to_pa);
  * here the output of the DMA API for the carveouts, which should be more
  * correct.
  */
-void *rproc_da_to_va(struct rproc *rproc, u64 da, size_t len)
+void *rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
 {
 	struct rproc_mem_entry *carveout;
 	void *ptr = NULL;
 
 	if (rproc->ops->da_to_va) {
-		ptr = rproc->ops->da_to_va(rproc, da, len);
+		ptr = rproc->ops->da_to_va(rproc, da, len, is_iomem);
 		if (ptr)
 			goto out;
 	}
@@ -217,6 +217,9 @@ void *rproc_da_to_va(struct rproc *rproc, u64 da, size_t len)
 
 		ptr = carveout->va + offset;
 
+		if (is_iomem)
+			*is_iomem = carveout->is_iomem;
+
 		break;
 	}
 
diff --git a/drivers/remoteproc/remoteproc_coredump.c b/drivers/remoteproc/remoteproc_coredump.c
index 81ec154a6a5e..aee657cc08c6 100644
--- a/drivers/remoteproc/remoteproc_coredump.c
+++ b/drivers/remoteproc/remoteproc_coredump.c
@@ -153,18 +153,22 @@ static void rproc_copy_segment(struct rproc *rproc, void *dest,
 			       size_t offset, size_t size)
 {
 	void *ptr;
+	bool is_iomem;
 
 	if (segment->dump) {
 		segment->dump(rproc, segment, dest, offset, size);
 	} else {
-		ptr = rproc_da_to_va(rproc, segment->da + offset, size);
+		ptr = rproc_da_to_va(rproc, segment->da + offset, size, &is_iomem);
 		if (!ptr) {
 			dev_err(&rproc->dev,
 				"invalid copy request for segment %pad with offset %zu and size %zu)\n",
 				&segment->da, offset, size);
 			memset(dest, 0xff, size);
 		} else {
-			memcpy(dest, ptr, size);
+			if (is_iomem)
+				memcpy_fromio(dest, ptr, size);
+			else
+				memcpy(dest, ptr, size);
 		}
 	}
 }
diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
index 7e5845376e9f..b5a1e3b697d9 100644
--- a/drivers/remoteproc/remoteproc_debugfs.c
+++ b/drivers/remoteproc/remoteproc_debugfs.c
@@ -132,7 +132,7 @@ static ssize_t rproc_trace_read(struct file *filp, char __user *userbuf,
 	char buf[100];
 	int len;
 
-	va = rproc_da_to_va(data->rproc, trace->da, trace->len);
+	va = rproc_da_to_va(data->rproc, trace->da, trace->len, NULL);
 
 	if (!va) {
 		len = scnprintf(buf, sizeof(buf), "Trace %s not available\n",
diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
index df68d87752e4..c02d4fec93a9 100644
--- a/drivers/remoteproc/remoteproc_elf_loader.c
+++ b/drivers/remoteproc/remoteproc_elf_loader.c
@@ -175,6 +175,7 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
 		u64 offset = elf_phdr_get_p_offset(class, phdr);
 		u32 type = elf_phdr_get_p_type(class, phdr);
 		void *ptr;
+		bool is_iomem;
 
 		if (type != PT_LOAD)
 			continue;
@@ -204,7 +205,7 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
 		}
 
 		/* grab the kernel address for this device address */
-		ptr = rproc_da_to_va(rproc, da, memsz);
+		ptr = rproc_da_to_va(rproc, da, memsz, &is_iomem);
 		if (!ptr) {
 			dev_err(dev, "bad phdr da 0x%llx mem 0x%llx\n", da,
 				memsz);
@@ -213,8 +214,12 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
 		}
 
 		/* put the segment where the remote processor expects it */
-		if (filesz)
-			memcpy(ptr, elf_data + offset, filesz);
+		if (filesz) {
+			if (is_iomem)
+				memcpy_fromio(ptr, elf_data + offset, filesz);
+			else
+				memcpy(ptr, elf_data + offset, filesz);
+		}
 
 		/*
 		 * Zero out remaining memory for this segment.
@@ -223,8 +228,12 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
 		 * did this for us. albeit harmless, we may consider removing
 		 * this.
 		 */
-		if (memsz > filesz)
-			memset(ptr + filesz, 0, memsz - filesz);
+		if (memsz > filesz) {
+			if (is_iomem)
+				memset_io(ptr + filesz, 0, memsz - filesz);
+			else
+				memset(ptr + filesz, 0, memsz - filesz);
+		}
 	}
 
 	return ret;
@@ -377,6 +386,6 @@ struct resource_table *rproc_elf_find_loaded_rsc_table(struct rproc *rproc,
 		return NULL;
 	}
 
-	return rproc_da_to_va(rproc, sh_addr, sh_size);
+	return rproc_da_to_va(rproc, sh_addr, sh_size, NULL);
 }
 EXPORT_SYMBOL(rproc_elf_find_loaded_rsc_table);
diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index c34002888d2c..9ea37aa687d2 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -84,7 +84,7 @@ static inline void  rproc_char_device_remove(struct rproc *rproc)
 void rproc_free_vring(struct rproc_vring *rvring);
 int rproc_alloc_vring(struct rproc_vdev *rvdev, int i);
 
-void *rproc_da_to_va(struct rproc *rproc, u64 da, size_t len);
+void *rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem);
 phys_addr_t rproc_va_to_pa(void *cpu_addr);
 int rproc_trigger_recovery(struct rproc *rproc);
 
diff --git a/drivers/remoteproc/st_slim_rproc.c b/drivers/remoteproc/st_slim_rproc.c
index 09bcb4d8b9e0..22096adc1ad3 100644
--- a/drivers/remoteproc/st_slim_rproc.c
+++ b/drivers/remoteproc/st_slim_rproc.c
@@ -174,7 +174,7 @@ static int slim_rproc_stop(struct rproc *rproc)
 	return 0;
 }
 
-static void *slim_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len)
+static void *slim_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
 {
 	struct st_slim_rproc *slim_rproc = rproc->priv;
 	void *va = NULL;
diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index 863c0214e0a8..fd4eb67a6681 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -354,7 +354,7 @@ static int k3_dsp_rproc_stop(struct rproc *rproc)
  * can be used either by the remoteproc core for loading (when using kernel
  * remoteproc loader), or by any rpmsg bus drivers.
  */
-static void *k3_dsp_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len)
+static void *k3_dsp_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
 {
 	struct k3_dsp_rproc *kproc = rproc->priv;
 	void __iomem *va = NULL;
diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index 62b5a4c29456..5cf8d030a1f0 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -590,7 +590,7 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
  * present in a DSP or IPU device). The translated addresses can be used
  * either by the remoteproc core for loading, or by any rpmsg bus drivers.
  */
-static void *k3_r5_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len)
+static void *k3_r5_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
 {
 	struct k3_r5_rproc *kproc = rproc->priv;
 	struct k3_r5_core *core = kproc->core;
diff --git a/drivers/remoteproc/wkup_m3_rproc.c b/drivers/remoteproc/wkup_m3_rproc.c
index 92d387dfc03b..484f7605823e 100644
--- a/drivers/remoteproc/wkup_m3_rproc.c
+++ b/drivers/remoteproc/wkup_m3_rproc.c
@@ -89,7 +89,7 @@ static int wkup_m3_rproc_stop(struct rproc *rproc)
 	return error;
 }
 
-static void *wkup_m3_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len)
+static void *wkup_m3_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
 {
 	struct wkup_m3_rproc *wkupm3 = rproc->priv;
 	void *va = NULL;
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index a5f6d2d9cde2..1b7d56c7a453 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -386,7 +386,7 @@ struct rproc_ops {
 	int (*stop)(struct rproc *rproc);
 	int (*attach)(struct rproc *rproc);
 	void (*kick)(struct rproc *rproc, int vqid);
-	void * (*da_to_va)(struct rproc *rproc, u64 da, size_t len);
+	void * (*da_to_va)(struct rproc *rproc, u64 da, size_t len, bool *is_iomem);
 	int (*parse_fw)(struct rproc *rproc, const struct firmware *fw);
 	int (*handle_rsc)(struct rproc *rproc, u32 rsc_type, void *rsc,
 			  int offset, int avail);
-- 
2.28.0

