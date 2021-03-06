Return-Path: <SRS0=jP1a=IE=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D25FC432C3
	for <linux-remoteproc@archiver.kernel.org>; Sat,  6 Mar 2021 11:38:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 23C6A65009
	for <linux-remoteproc@archiver.kernel.org>; Sat,  6 Mar 2021 11:38:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230432AbhCFLiM (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 6 Mar 2021 06:38:12 -0500
Received: from mail-eopbgr30064.outbound.protection.outlook.com ([40.107.3.64]:49798
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230259AbhCFLiE (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 6 Mar 2021 06:38:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aUMI75vlkOKNmMkiBh+nnBu3waADfpQ/OUXo8M1iYKKZdOiIglqsdDM9K8hXT1AHGpKBh5vk/7YXUyOHKaUaOooE6LAv3QSJ231C0sGCvTEzB06fkETbMJwCoE+cWEv2zvlcCHTtVKUzTxPaHgZOh4Phs2N3pnpJOrg4IDfHZvvdTPQK/5lXgFAzcCk6W4bNeoB4htNZeXob9PrzHWeoMRlHnbyB1Gxi6I/fHk2aZ7ROvHF9SZmPyPxiLVqKEnCSh1rGJUjjT7iUBWmDrNp9ScrGBjPlXHlcBIrXxq+ALHXiII6E6z/JamH3DdiqNTCaeoo8GddkxReNZTcx+M8Gdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ol6QVuaOBP3qc6nPs/N46uXd+XvZRg7dwF69dRfDEuw=;
 b=R4G8V0Tp6snZth847owpbWkY8hH/TDFKe6FW+9HTOgAGXcJqLpmSWJ+8fLXN641VLWjYey5JCchTMGzCUAAXjy1oGR0ZEi7StRXk8Pwg6ry8L69VDINKFoqPzcRB2Wf+cuI8ZCRJjL+9xbQG+NyCrooLirkAxGy3rJ8s86GBYcObaGecEyD0ELHZ1GpdRldAu0B6BZPKnFEFxNsXmLO3r+VCigoJ58RgzC3PBf1weWRs/13JfaSJ5QAc1v0ktT7w5kT51YeEUBQtzyW78akO9ybUK83RycnsGPvp8WfhLHYXzkFsSHBoSUV7IQBUEeg8kjeAueZQ5ZlM0YdwssVw3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ol6QVuaOBP3qc6nPs/N46uXd+XvZRg7dwF69dRfDEuw=;
 b=ChZoePIFrhSopj4DgqNrB9Jwd3C0Bif6Q1wcQ62TIQBhrvdxBGdZ0eazHPnpELf+m/+cJOqSw656R+ZVXxsYgHxa3Je4sYPdL/3iZXIdcM/hKhydXS+Gka7aVT9LSeLjU5Sb3wOaqDlkGKGL3DI1ixyGF+wvJWssGkDX1aCT/d4=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB8PR04MB6618.eurprd04.prod.outlook.com (2603:10a6:10:10e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Sat, 6 Mar
 2021 11:38:01 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3846.054; Sat, 6 Mar 2021
 11:38:01 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V13 04/10] remoteproc: add is_iomem to da_to_va
Date:   Sat,  6 Mar 2021 19:24:19 +0800
Message-Id: <1615029865-23312-5-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615029865-23312-1-git-send-email-peng.fan@oss.nxp.com>
References: <1615029865-23312-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR04CA0047.apcprd04.prod.outlook.com
 (2603:1096:202:14::15) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HK2PR04CA0047.apcprd04.prod.outlook.com (2603:1096:202:14::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3912.17 via Frontend Transport; Sat, 6 Mar 2021 11:37:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: dffd47d9-1b5a-4104-11c1-08d8e0944c06
X-MS-TrafficTypeDiagnostic: DB8PR04MB6618:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB6618A0F4E7777172AE241383C9959@DB8PR04MB6618.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6IGWjybrZJvOhp4gXhfi5pTEE/nL7Cx65FhlwhDvKeZ+fVOdKWyCQtptr1WhvWFejW4XH2rjsPL13W3rJfRXs2WnTPajueXRkDLMjAptvMWT6/v2fPgMzcag53A+z7OKZ6uS0e2J88SW9faZr/pyFjlT2iUa3ms/jOLhsUa0lGPTFKwzWDWrcm8Nc/1zseaKy6y5X6q82il6vrgtsG8pcLmd+X3It8WMV/E6XWKLKIGd+mescXalZ+5QhHNK6EOfAFlWLQosVbyTRCeVZSa9tyc6odQvQAOyOaiQQ+jEzEY0LBxpnoBvLBYl5wepJaOa5wtHCDj+94jy8lP5NXexuFuJmFn67ESpXEJvhVKJBUKLJSF0fxtU/xvutcH7wpZ3uddNqVeeQGXmm6h6tX494VDXs+TXV8tC7EgBwscBr6WVmP7y2/jGuA0pQrc3skR6G/KiWLtuB4bUVQlt+wOWNRQszxkl/xtzk8aMRpmaE+m43FB+Wv3fC5tWiCJHSp2Ao7myzo3dFtZwZrHBENQpkxqQBkZO4QGTFVmUW3kv3QqxNsBS7zfutfHWk1TPWWW4FZhFqKZ5+DrKpalWZdvZuQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(346002)(376002)(39860400002)(136003)(83380400001)(6486002)(9686003)(6512007)(2616005)(956004)(8676002)(6666004)(69590400012)(86362001)(4326008)(66946007)(6506007)(7416002)(30864003)(2906002)(52116002)(186003)(16526019)(26005)(8936002)(66476007)(66556008)(5660300002)(316002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?HQHkPehqLgTVVT/SN8kmh7ZDLomRUTVG8GfSgaQrEAmrwVt9UqPMnpfEvdvN?=
 =?us-ascii?Q?rLzT9o+SPEAiqMY0r+LsOC99ZYUKVAPr3kfK8YLgN3l+NaGYDitLCIRVnEUn?=
 =?us-ascii?Q?+Kp6QDM7zI3stdlVVE+hq0IgIYKhn6I2sUhuPS5VhYXpm7O2mWdq+zOhaM6g?=
 =?us-ascii?Q?327zU0pLAEMYOY0CkDMYzaRcrPCiQs/YYvRxvTuFcq+gIRdx7MfdwzNg06S8?=
 =?us-ascii?Q?kFHadwRkhzXHAHCYt0rYAqc86XRP+5jk5nNCWpojv3Yv8nQYLeIJhpLCHyv+?=
 =?us-ascii?Q?qRx3Wm5wekRWQqogmWyb8zIYiq1qqskbeGXLLB81i1Q4aOTz+6PAqUYe2b78?=
 =?us-ascii?Q?OsUVjJ9Ck45F94SlVwtom7XqsHMkTnKopYL4hcc+gkC0znACS9I99uC3Vg1O?=
 =?us-ascii?Q?xD6q+L/98QF2RAIitdGAPqcJOe5r8QjnXKtBqA5FQ9YEAily39bst/gKWNcu?=
 =?us-ascii?Q?AOuZV6eaKXffE3PoXCH1HC1g0HNgOLHc5nH2WpCznKqh3sM8SCvmX01z9kfd?=
 =?us-ascii?Q?dz8ZtMkmxcpMLpJhHhUAv+WjYN/GiwOOsWEzsQMsR3OxgYdFAz0H78ZEsQJp?=
 =?us-ascii?Q?xHhAY/oY/ShVcrp2futWs/z5U9ik5eXtsg/bj+eOS23WC30/S2UiHqVvyYX+?=
 =?us-ascii?Q?JvlsIlroYtMg2ReBRp1SGJa/7kjl4b2dHM0GhpYQgPR1mZYW2b5rESZpVbcK?=
 =?us-ascii?Q?5Iw+YE3AjxBl4lQ6TqUKZhYd9/bD2TkRrmfkjTgBb4DnBzISdNCoBl7FsaYk?=
 =?us-ascii?Q?iHAN/HC4+Urj78oZvCqnami4Za4CxfngRjL4zjkU6NBeyRFVV69APm0RQm8/?=
 =?us-ascii?Q?kDRzBCJ9wtS9t5KTXbfvlk0T0ydUJBpthaJRVoRzIH4bwUxSwgrSl2g795jc?=
 =?us-ascii?Q?BuLKfZarLrxGqHVseSqQ/oa1OCXYpkHomzj+569lYKR8YlkyQJP3CL0NN9KD?=
 =?us-ascii?Q?wLwgE1AZYhP67JYiDo1ucGNSKKSiHgBDeNV3dokwwiaEE2pFPqvTVPbWjsCe?=
 =?us-ascii?Q?0ssM/D1SdALm786L/Crf8ffm8RaoG3FnF8iw2E0/2fygjAAV6pNOGuepmTnB?=
 =?us-ascii?Q?6BOxnbcdfrjRG0A0ZnQYMQ/4xEirArSNwYxecIHZKtwMLP6xkG1mSGcZpQko?=
 =?us-ascii?Q?Z5zYXXNfadyuESWkPaDi0UDyZkf7nFPAvGS8/WzUfCA6osVzzySaqS5nO3k8?=
 =?us-ascii?Q?rzyUjxgzlc0H/NlcmQlTpHBXgsBTYw6PJR9ktKsi/ZZNaxTi2bkQMi7MQHqf?=
 =?us-ascii?Q?W/G8+d5Ly3ZHcALnKNcHb2zJlpPDDPpPOLF6a07lFDmFyN0nQfR21J/8h1PV?=
 =?us-ascii?Q?wGCJUaols1GIvDoMcJNVMtk0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dffd47d9-1b5a-4104-11c1-08d8e0944c06
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2021 11:38:01.0651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +d2rJeK8418RBkKkUpo2flHbxjdo29HRoyfN4U/6s0WAPstH8NWhMbnAAe1bjtPN+KB3FFue0jqd1+X+/Hmkvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6618
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
index e2618c36eaab..a356738160a4 100644
--- a/drivers/remoteproc/ingenic_rproc.c
+++ b/drivers/remoteproc/ingenic_rproc.c
@@ -121,7 +121,7 @@ static void ingenic_rproc_kick(struct rproc *rproc, int vqid)
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
index ce727598c41c..9679cc26895e 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -272,7 +272,7 @@ static int scp_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
 		}
 
 		/* grab the kernel address for this device address */
-		ptr = (void __iomem *)rproc_da_to_va(rproc, da, memsz);
+		ptr = (void __iomem *)rproc_da_to_va(rproc, da, memsz, NULL);
 		if (!ptr) {
 			dev_err(dev, "bad phdr da 0x%x mem 0x%x\n", da, memsz);
 			ret = -EINVAL;
@@ -509,7 +509,7 @@ static void *mt8192_scp_da_to_va(struct mtk_scp *scp, u64 da, size_t len)
 	return NULL;
 }
 
-static void *scp_da_to_va(struct rproc *rproc, u64 da, size_t len)
+static void *scp_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
 {
 	struct mtk_scp *scp = (struct mtk_scp *)rproc->priv;
 
@@ -627,7 +627,7 @@ void *scp_mapping_dm_addr(struct mtk_scp *scp, u32 mem_addr)
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
index e635454d6170..ef85b5511dc9 100644
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
index 2a6a23cb14ca..3a131163064c 100644
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
index ab150765d124..a1df4d7e5323 100644
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
2.30.0

