Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D1F1C433DB
	for <linux-remoteproc@archiver.kernel.org>; Tue, 19 Jan 2021 07:49:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CE5DB20702
	for <linux-remoteproc@archiver.kernel.org>; Tue, 19 Jan 2021 07:49:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731245AbhASHsx (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 19 Jan 2021 02:48:53 -0500
Received: from mail-eopbgr40080.outbound.protection.outlook.com ([40.107.4.80]:64958
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731380AbhASHrd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 19 Jan 2021 02:47:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NtvNSqCcjOhpkI2qWhuRiEq8EJ1CcxSNg+PjvPpWFTerHPh1VNJE96X14YuwwAC3q9t0tbDGq0BHEbV7VKnTgJXh4GaGHEr0bbN2EphEyG2cYYzFZFvMMkGpJJq9UNhE6NCwKS3Rg+JkbnYMp8kuWkAJyxiWQ4SJz4TWWhLVTM+ovu3m96mfWMxvgFt222bHbPwR7bNA639ZlsfbjWSTx/DdNfFDoFUmjLIn7nnJ/bAnelpxuDLTlAeslojkjs1okby8E961/6w4BOMC5Hs+fCOvM5o3HY93pJeuWXRChSSx9Nw4/xGIOwnttDnAWndN3KL+yUBj34GrsQpGon7RXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fa48VS7cmiROA2onEOhrclcughxuxdqJL9kijwG9m3A=;
 b=MQMMM3VZJDYE8krFpcoaCbtt3U6lVsazCzxUICwtlgu4kFMn1XABAGI2de7hNH4Kh1/UbhomnDzS1pkEG3KvrA2LeBqotOWvCgA431wieV91hkpaefKyYMJNHW8mcykBGSwQIyVO7cqNPYfk8b+ZTGl68UkS4ssJbxlBtbblMDr5isJyoj/m9VMQ4G3T4qGH8h1wouk1W82e5jzavp7yttupytZ97ZO5exId7G0zlTlmB74w6VjBX/mwUpg9xlxc57Doswe8umM6DMxG45Yujk46Fq+wiqalYwg2ZHkfg6LJuF+EX/10228k7SP+sV0ph9WaRUJcUBhGnfk5JrDhnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fa48VS7cmiROA2onEOhrclcughxuxdqJL9kijwG9m3A=;
 b=Qqd26gPkd5hiR8tNVerh2nXJeO4w1VuMzgOJNYR4qgr2vMf0AerROGehQXCyiSsBOXYPs06j5O0btVy4exAHA5pV8ONvoOxygImoRi8Rzkxk6C8zhw4A1/JJtSj+oanzDYVIIZjzgl4v38fbuoXLFu75vVU70MkbwdzdGxIx8iw=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4492.eurprd04.prod.outlook.com (2603:10a6:5:39::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Tue, 19 Jan
 2021 07:45:58 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 07:45:58 +0000
From:   peng.fan@nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V8 04/10] remoteproc: add is_iomem to da_to_va
Date:   Tue, 19 Jan 2021 15:35:05 +0800
Message-Id: <1611041711-15902-5-git-send-email-peng.fan@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611041711-15902-1-git-send-email-peng.fan@nxp.com>
References: <1611041711-15902-1-git-send-email-peng.fan@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR04CA0161.apcprd04.prod.outlook.com (2603:1096:4::23)
 To DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR04CA0161.apcprd04.prod.outlook.com (2603:1096:4::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3763.9 via Frontend Transport; Tue, 19 Jan 2021 07:45:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 79e5d094-f551-429a-d241-08d8bc4e426e
X-MS-TrafficTypeDiagnostic: DB7PR04MB4492:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB4492E79FA15E67035118090188A30@DB7PR04MB4492.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WpoxA2KPXtrnUGZQThWUK0PGJjPdcmtPy7x+LBFlNBL8nS9o6Lk8QeSek7QGwKDveE4F3vXohx8hPPHRt1Fnf1f32ZBXzaH1Kb16Ws9ctoIio8ORciHKPAKFMjI32KfIGPaeyrbYQpyOvuYncZOpbdx5+wOb5zDQ2Wf/MIDUCKpidLhLG7dtgShdju7AId/EKfGL7dZ8i8z3yLBhuW/jxjooOSGP7PUhkqBQqF38P0q/GTzP5LEd80P5/BqY0wRyy2OzoB6d0MpPh1UHSDzbluaDBhd5oh1W2wxar7HLiOYL818XWGhks98wEkQheDWbHm1ckUzzCR0QLRKj76Yf1anq+Hxi0b4jj5uJ032vLzK2oyzPjsmHfjES+cYnC5QAsBTkcO6msFzl4rrNd7g2DAIEQZCI+EDoof9sa2qPVmIy7pj0nXYH3NTu82JshAofaK1wLjtMDHXwt0PXSFnlDg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(30864003)(5660300002)(2906002)(66476007)(26005)(69590400011)(4326008)(6666004)(66946007)(186003)(83380400001)(6486002)(6512007)(2616005)(86362001)(36756003)(52116002)(8676002)(6506007)(498600001)(7416002)(9686003)(16526019)(8936002)(66556008)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?EqdQ7K8a4z13bYl4a6pwR2zO6hrjZdhwzYNOVvN/FFpJPTLZm4MWOGcBVtaN?=
 =?us-ascii?Q?2dym/dkCMmm6J9y6Rx5unGWnvw0TsffXVKye8wYnWWtlBwJ9f6uOXDT8RCbO?=
 =?us-ascii?Q?anStAe+1z8O4ST5hYUeMn5N3hX4bUjPSE2fWoD7LMRlwt9JKKrYV4IbajM9g?=
 =?us-ascii?Q?nUW0UlaIOM5NBYColiaW5ZhQE2Lm3Vj7dTjsAmjwQ6kdgkvrH4dVbfa+9xbm?=
 =?us-ascii?Q?mzcg2cJ6DicEhyAKKY2doSjJWWZ2m1MvdX2un0vfjZsDyv1aCTHs5T97NB1E?=
 =?us-ascii?Q?3A1EdUXubxyqgOCdIfoS4RwoBRnz1bHdGl5B38855PVkJl/4Wp04+PogSwt/?=
 =?us-ascii?Q?IJ1N3IYsEkuITh5eDowAxGaufXZgW8CuR9X8Mquug5q6VMd/U84MxvFFGAOd?=
 =?us-ascii?Q?76NueT1HAj0kxdBeQmlFWo1pqWtaLp89WMXmoW7y/S3ToRJm9qNgXfSCkLzl?=
 =?us-ascii?Q?4S3/jXQ7U1US22CuA01ok2RGHWGHYdoJE9sR2rcn3/+eOZqwOO0hqVJR2sHU?=
 =?us-ascii?Q?Y6+BqDS5juliKQ+M22ANFRO8A2LQg465KJJufl3EkBDV5VvuLhy/bBQDEOk2?=
 =?us-ascii?Q?ZD8SiRRSTwT/pJT7/pRcOX9hw3nItebrITdjtggFwxGvxTVIU/xr5nb52eMy?=
 =?us-ascii?Q?884IYXe2RXzIpUoWL1jd6zjISpFHGMpavdMsdf9k0qIWaPGsfeaUmbERWbp8?=
 =?us-ascii?Q?TrQUCENyNjDIfAmPoXY+CjZC/0AyrSCVj0vAGIE1BrPT9XwEf+/ucu6syVY5?=
 =?us-ascii?Q?cvtq0u2eAuRQjWU09jaKCwJhTz8a8SlEbj8OfDZz3Ye8mg5O5WtQTsoH7Tpl?=
 =?us-ascii?Q?HKX3FeHo084ob/MWduSEYTCaLCR5V/TWNrKXkJshHYYh6XQVeIXwFvBg1xIN?=
 =?us-ascii?Q?aMs8ruHkmw+DwjVePURWilJ3NHkWL3yeD9AvYUXUy4SFpWH7YPDetJscHSBx?=
 =?us-ascii?Q?ahxgiDDLqcyzZEX7oJ4CjL2f4tZIArLIjH9BoW5cun4F1OtdyRy3gqalMQGX?=
 =?us-ascii?Q?KomL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79e5d094-f551-429a-d241-08d8bc4e426e
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 07:45:58.6792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5+wEP6X8QtYNZOa9kXr53U9Zomp9PB++rObGWUHl00doXJ7KM0yN9ojVv2mzyYZJdqoWgch7InMlRWb4DhXjBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4492
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Introduce an extra parameter is_iomem to da_to_va, then the caller
could take the memory as normal memory or io mapped memory.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
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
index 5fad787ba012..8df99318f18a 100644
--- a/drivers/remoteproc/pru_rproc.c
+++ b/drivers/remoteproc/pru_rproc.c
@@ -483,7 +483,7 @@ static void *pru_i_da_to_va(struct pru_rproc *pru, u32 da, size_t len)
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
index df68d87752e4..11423588965a 100644
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
+				memcpy_fromio(ptr, (void __iomem *)(elf_data + offset), filesz);
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
+				memset_io((void __iomem *)(ptr + filesz), 0, memsz - filesz);
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

