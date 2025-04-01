Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2063.outbound.protection.outlook.com [40.107.105.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2CD2036F0;
	Tue,  1 Apr 2025 14:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743516326; cv=fail; b=tmT60ahW7JMoq4j4MiQpT7vY0PHzUoYUHmD9o0PmwoR7cjxckoOKPR8Ep9HKSsUPQW+pBui1Do7omCiLmsywEeO1zApbMSaCalzP4YPTiDQgES/9PczlrHfzsIxik8TXqUx1BKMDTZ7vNVXG6LWkWiP3guUZYhRZA5ltuS9zbUc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743516326; c=relaxed/simple;
	bh=7neXmIRwyOLPOL5T7t7EsJacKM49FVgVYgcR71a91Sg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=XXaJwQm8r1o8sbk6/LBxVqrIz2Evbo6ZUB4UPe/cpOuYjTjDZUrCjZ2SG3hpfLZEK1ChVQQZmyrPDdKKe0Tt401oWoA42y47y66l3lNiYXIH1OgN/FxIjM4mlmxPMQvJDZNy3Wx5o+go0M+5pDvlsaSN3D+z6BAXddxAV2V4vik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=PUMdXOsW; arc=fail smtp.client-ip=40.107.105.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="PUMdXOsW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HTansKIpT+oqQvypMeFD4x3ZiSCVZafcEpjo9rz/256MpaIq4AAeUXSAe1VpKCNbpbucu/fYhNoaJcI8+uU3JcwD4x4jxrbNWGWVeeFuP4+248U59rGAIUeoiIGhWY5pcURZnpbGAyv1waWePzsDWwhR4NzVhRBCFIfONf7jw6IqysQTv8y9TWsg35q/KngrGgI3YAvSPaWpcDijD4y4iJbZpscz+qo/nZ1LPHQobunAJe88bReAmPHUOLDzTd2EdvhTM7nAdv6OKh++pOyV+qfw5AaEpolJCq/iVI3gUzxhER5jXLmjbI9ZmCyHvvolgsqfCVJiHr5ouYAcyHDCgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kv1MdOZz9W6G8ZWkf+Wwr0HmeQ5BqW7PQowU/52ty/o=;
 b=r5/xi81RFPPNKBwRN/fPHCCcxo1cWsAl354saqNRhfeC5oY9+hoLas92PzARggmscso6v3nm2rZETlPPtJnMXbCwch94rXXaB4vDS+DdN2htq+3Kz8LX0Ntj/j8iYbLEFLK1Yk0ZC3IJ6IVscfIu7m3cxexDnu3cZ55NJYQk3Rgr6OTbLTyj5DE1F0PeOeXNuOWgrfxrKyZDhJGr6iqp5/iJN5jWygBIVi90gkabfvic5uCf8S/fkcM1ejZcx+5yS9bwB4Gx6iM9K4/j+eXapD2lm+M+rtr8smNcp33y+SKGokpGy+Basov2n86KB/sokeBM/NqvkkMryslNcpQyXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kv1MdOZz9W6G8ZWkf+Wwr0HmeQ5BqW7PQowU/52ty/o=;
 b=PUMdXOsW1/VzcsNQUdNlv20EZSwg9cz7XQ4Sfdj7ACaTlShUYR6/UB6ZsucnySGhSs2yfnbWJGoeMZ4yRMe+e5wPBYJzVFwf7Q2Dp3rjO2fbvCBuh+MFfsEirLbFJmy0IOuq7wHi+sLDwoA7gHExqplBuyrK4Fd444UVZypaNhnlfDytJ+lu3AeeUgn6Mc9eKBNwm9KZYtIX3dwmdhYOg265FLxqjA++skfC21rqZF+5i6gxDupWOLopIQYUgKlaVuJd8m0KojJFFZzmIE+tRQ08qeziqGXF1yKCnjNQGa9NUB07q+FW36yoNNRmFz+BmTME3VpXYhsCSQAkBi4MQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI1PR04MB9906.eurprd04.prod.outlook.com (2603:10a6:800:1e1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 14:05:20 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8534.048; Tue, 1 Apr 2025
 14:05:20 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org (open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: Peng Fan <peng.fan@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH V2] remoteproc: imx_rproc: Add mutex protection for workqueue
Date: Tue,  1 Apr 2025 22:04:02 +0800
Message-Id: <20250401140402.3676049-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0001.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::13)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI1PR04MB9906:EE_
X-MS-Office365-Filtering-Correlation-Id: 85707e17-1c9e-403e-37de-08dd71263caf
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rOJoV2+fs/mtBkjW1J9nOWJyWX+PbdG2TIW27FRAto+v2Sw7n+1+V3ml+Rjk?=
 =?us-ascii?Q?GuUhZhnkFgRonWk5LYWQkxxCjUf3CX2kgoOPw1ZNPGJde3c+N0YBAZKMqQjC?=
 =?us-ascii?Q?UqXXIBm6E3VekpntlO5F8hOEzAQvafPsXGLPFgvq8rK5aLQmFEt9/LhdTw48?=
 =?us-ascii?Q?W2pWAJvOzYm4ZpKq3fGz/lcJHSh3fSgIZIxHQRcrBLVDtd5ItsLJP/+3ao00?=
 =?us-ascii?Q?qt4o+HbMNiCxDY9nJSkGlI92hv6i/ElxCh3yrKAykWuQ2jVqzc7YEOZyCeDW?=
 =?us-ascii?Q?JWjdMFto2t9QOgAqbMeBXPvf76jSTWp8ke78mjhc0ELFPr3iCLQthImCU7S3?=
 =?us-ascii?Q?MF/M3RwcdPwhSo2pZnZ0YEsXy46L0DVlTK6PTlJKTpJnXCMaGWm6HZ+kv53X?=
 =?us-ascii?Q?8GbLk4AWC3kR+U8+KKqvMPgcNKTDsW6LV7PnGmcrhuxDMmqoTRyoL9elt1eg?=
 =?us-ascii?Q?OEqcydmHv23CdVthSf50VAyOej0EJlF7G8b0fT0y29IIkmauMrq7Sr2ejLiI?=
 =?us-ascii?Q?v8wS3hE0LxmThUBJIdSseKw6SOrOjHVcgw6HDUaW4uW+Kw+J26P+6NnESkbA?=
 =?us-ascii?Q?0OdAP8/eL62XwOd/k1GXLoe/UnQ70Vcl5/K1DlRSgxnDTaGXUekZDrpRBKgN?=
 =?us-ascii?Q?M7CrtYubG3/T8UlE30fj8L1jVlsN+CWlMW+ZwMnBHf7AjXnUxtEABglb+H1q?=
 =?us-ascii?Q?xL6xBOJpBBmNmylmmfK11fdR4l838lEHh/kL3Pj4LnBwp5WU8X1JslSRJYRr?=
 =?us-ascii?Q?b4mV1U6RmnTh9WWmTLR/fD3iNXCV5M9Ypy1thstlgqW71q4lICM72syZ18OQ?=
 =?us-ascii?Q?oNMehcLdFjXfTwjljVIb7JffSm1fHvNExlrTxdylu5Drk1hYD+PAEB5Pe9t2?=
 =?us-ascii?Q?0aJmI2BoxgYUp3xslttKeggxZuQ2HnF+gu7JTyNIafevren1PvSKyzdjl8X4?=
 =?us-ascii?Q?IttttIKhdVLCv1nZI9vJjL7y6VZivRvB2D50r23T3m5XvQ0BH9/TpgsmUD1d?=
 =?us-ascii?Q?0zElBisStrXlcR00dYfLk2s7hT343p+pgjj99yIR6RGVcj8V7rntYO1XCynU?=
 =?us-ascii?Q?fqeI9jZcYgSMMbt/rhuTgzaokLy7AxCtZw2rB7+RSpwP06Zl9w6gYXf5PeUN?=
 =?us-ascii?Q?2yf19AgpML771F7WUL/siQmivJ/fuTGvgx1VjSD3cm2593/MCRs/ucXZ4zVs?=
 =?us-ascii?Q?F4Vx2CpSkYAVh2nOHr50yG4Oil68xsqE29afCwaxvZPrU9k8Od6SF9Ehcg4V?=
 =?us-ascii?Q?nvLPS0nJM/2uiukW8cCupgWj+0Ld61xIGep8iqz4FJx20X1wrCtLDsIE0XtX?=
 =?us-ascii?Q?BAfJCbtfOWv3rN8n6hmy8dr4Lx3VOD1nq2/njiVoNK+e550O/RLQKtBr51Ih?=
 =?us-ascii?Q?yY0Iwb6w1ToxxBLfU+TTrm6uwZyLJ15VoltjtBkT96+Ob2TL1QErPwY4neQw?=
 =?us-ascii?Q?JdBtpgwktEocz4aqI/aEEHqDwRvqB9LlZH/Qm0oavJSDAfK1XSU3XO3FMMzj?=
 =?us-ascii?Q?L+kpQw4AOs1kkWw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3v9nFL+MX5Qf6OmxDg2OU9KShfBu8NVDVMZFCOvbXz7L4USVe1kBtTCFA/8k?=
 =?us-ascii?Q?ph2OndEjizNnIROxNB6LbzUrIk4q8vc5npI/tC6ahmRqrSCZBgjjZI2tfsEO?=
 =?us-ascii?Q?SGq3k2MolvlSnfghfFpXGko8tAqHoKKjoIY6G8cM/c9fEw7bw1yV0I2W+xxg?=
 =?us-ascii?Q?dLBNgKa5V3spy99yUgs3IToCLb7xrhseTRDRaZRCzfODEeACQdz5+nCxrhmE?=
 =?us-ascii?Q?D5WVcPVqRTihZvNJiQ6/MLKVbCTc59HpWM4Ua0Oi6omgRtZIBwmznoft1nAt?=
 =?us-ascii?Q?fgO9zF4yyl15mFARj/+KNNVxuSkNwUY5GN21RmTKqa/QZxOyDRdOVuqt7cdA?=
 =?us-ascii?Q?Wr6dOXfk+xSqvaptVFYWGBPDwtoxp2FPxDVlI5pqCyzK743c/hZTfOC/Yesw?=
 =?us-ascii?Q?INUWFksaFDvax+uBwm35SdC8RDE5sxn/Kbdjzm2XMJ2n9VTF4UNBLxUFaMMb?=
 =?us-ascii?Q?276INt5r+utzwESuPOEEWDPAo+er3MHATgCshpmLRNbRFJVC17IwuzGTWVSQ?=
 =?us-ascii?Q?cLooal+pR8n5oeegiai0XdzpfJRyyfc+yT8WsXRyCkbxb3HlcUsdjxgyBJDw?=
 =?us-ascii?Q?bOftdGsbZt3Ur22XOaDIFZFikljo/lrd7ZSGRyp3a1QGiw06t4rPgqG9Iqyn?=
 =?us-ascii?Q?2I/N/EymLHj6xQKfpjEZMkWvXcFqxtwrWWydC3U25cTXUJzMHtqRsv2YFWs5?=
 =?us-ascii?Q?qJbZBrKXmuuybHtp9zluU7PRoXF2d2ZKHBgk+8pvBh+K0ov1Qc77yo6MR8Yd?=
 =?us-ascii?Q?ZPliD9Py9K6CnNogKdgVfBIXF7+nHmugN+Fo3eN2qlP7owcCTILwMmQYXeMO?=
 =?us-ascii?Q?ziZ8Th4n48kveWe+y+A1ZpDWPEj49jnRyHfhxI66XlmNqQ7DeG0nlpyi8t/N?=
 =?us-ascii?Q?rHUH3Bo6SFpV2XSwTWsYrD9HLBDb4N1rnYgTd29vKNFtMRsYP/r4oRXp981b?=
 =?us-ascii?Q?Xci+uDoqdEZnUFTtvYOrrrLzWQ8HuMspbutc19lnTJcZuUR20P+WVveP178C?=
 =?us-ascii?Q?6DKd2zE4/ZOtzrWgZczFUDKXlvw5wnLWwisPKhUiFTL4j2ObatkRSbUQztVg?=
 =?us-ascii?Q?h5QsGjOlYy35OzE/mqbIIX8hUGuFB/5EJiGKsiT5CWkz8TH00GybOnGF0wZx?=
 =?us-ascii?Q?ewv1afmeM4f5Hp5QLRpCHTy5Srv+A3CdmwLAicE0XQ13PtPoa7076tBkHL/8?=
 =?us-ascii?Q?D0gipQjofQ1A1EuFlW585PPy+tHJ2FkXa12DzSMoMGx/KFY9cwmFTG1t+RpG?=
 =?us-ascii?Q?6EsEFBJDB4rGIs+IOAg21hE0D8AqbOCHCnpHWHz/5Iu3e8xrmAjCMxCBDbeM?=
 =?us-ascii?Q?v1LO3bcBn2ciLogbu6VxWJ52vPpeTSWzvIx1zQrfanzngMu6JB6kzzxuTMVn?=
 =?us-ascii?Q?qYR1mFKy4LMTvmYvsx9lq94q+z+yAsJ5FnBGvNYqkb6oaCr81Fpr5HpQqTyX?=
 =?us-ascii?Q?8wTJRpRyoXrkCVNLUjwa1WmMjMqFXW6B+x7rNeCFqrtH5HHqtAiIk4AaWY8l?=
 =?us-ascii?Q?Iot1YJXXIkrdEfZtQ584GyUFsu1hct71VC/50zmU37AsGi2HGwdER+83O4Yk?=
 =?us-ascii?Q?+mEOL4i6ZUwEgnnYoEpJGyksTS+qaM/WcreMQpIS?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85707e17-1c9e-403e-37de-08dd71263caf
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 14:05:20.1852
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rM0qi0JDg8Z4CompRh9tu3FLr9ezPDz4CVB/C+axiCqZ5gTHmdCL3vxKMZGC/ud86Beky1s7T6zOLgY5kEkO2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9906

From: Peng Fan <peng.fan@nxp.com>

Same as commit 47e6ab07018e ("remoteproc: imx_dsp_rproc: Add mutex
protection for workqueue") and commit 35bdafda40cc ("remoteproc:
stm32_rproc: Add mutex protection for workqueue"), imx_rproc driver
also has similar issue, although no issue reported until now.

The workqueue may execute late even after remoteproc is stopped or
stopping, some resources (rpmsg device and endpoint) have been
released in rproc_stop_subdevices(), then rproc_vq_interrupt()
accessing these resources will cause kennel dump.

Call trace:
 virtqueue_add_split
 virtqueue_add_inbuf
 rpmsg_recv_done
 vring_interrupt
 rproc_vq_interrupt
 imx_rproc_vq_work
 process_one_work
 worker_thread
 kthread
 ret_from_fork

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---

V2:
 Add RPROC_ATTACHED check, because i.MX supports remote cores started by
 bootloader.
 Update commit and add R-b from Frank

 drivers/remoteproc/imx_rproc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 74299af1d7f1..4819a9e57543 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/firmware/imx/rsrc.h>
 #include <linux/arm-smccc.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/firmware/imx/sci.h>
@@ -785,6 +786,11 @@ static void imx_rproc_vq_work(struct work_struct *work)
 					      rproc_work);
 	struct rproc *rproc = priv->rproc;
 
+	guard(mutex)(&rproc->lock);
+
+	if (rproc->state != RPROC_RUNNING && rproc->state != RPROC_ATTACHED)
+		return;
+
 	idr_for_each(&rproc->notifyids, imx_rproc_notified_idr_cb, rproc);
 }
 
-- 
2.37.1

