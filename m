Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2089.outbound.protection.outlook.com [40.107.22.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50959191F94;
	Mon, 31 Mar 2025 11:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743420248; cv=fail; b=t61sgPeRyd2TT8jkUwZnCGhM1kiAh6iAH01r0OWl1fte/gvXjMGlehbBotrCDfREYBEdcHJIEtgD9nqe/C1iBwWJT+LevjHNAW2iFqmWxkW/G+uc7IYX8PcISIShNfAzxGznaORW3INvkbpp+F7u5dlHjMPAK6Eck1DIqkBl3X4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743420248; c=relaxed/simple;
	bh=/I1YiUMpQTSqpxrWqDyuWyPuSQUWgLnb4+4PWrRcGKU=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=dI9+s7i40m65aixYxlgWsErTJ8ubkInMdIlI4B1Md+Q/3t5XppB1xIp2VXC9c/C0flsqHlvuPHzQmBj5NOAn+Ebh/Z6p6ohs4XmfN48DQ7pdcvqINqD2FWRXkbsZ1QG6RIwL0yxcsiR3DuEs0pMs79kQ8Iz9qYSeY2i61VhR2HM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=JRbf4NGu; arc=fail smtp.client-ip=40.107.22.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="JRbf4NGu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PEDWlxAJrvxWAHXDZiINMAbgsxQhHEzPSWj3jPNEwhGdzKjN455uDNqTnH6AvsmQX83DCnvCMALIlU8DZjpSZKdXz7wDeE6ZQlCUpO1hzMTg/K8yzAGLdKw2G2j1dSOKuutR/S440eHBGSJ6OV/Laz05j7Gk6OWkVxRYGPlbhPXtHWeBu4bEh0EsbrI7hThdvy/kZG5XJfjs86AZjEDerATDS1ukpJ6ijL9Bg9sgrrV6FaM7kRblcQjUJMHGv4VAV3aFHYEISPVDMgktZbzZzJ1lfG2vSJHEfBjr5oBPxqrrBL02+yV8u4cKlKdWWhNZVqsA8FPUebRMwT9P6+pBlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wpl+zOtvHfhSrvLnU9vwpxlHNgY7HPO5Rwqdt0urMGo=;
 b=dAVkWx8r38GFWijB+NFt+4CCZn/p4saREMRA/DBiRASy/8hkYtGEYoyzfiHgDVNyiZl//lRiDB4Xfnw2DmcUlaTFz+IszGP8DX/vFX2oqTSGGZ0I7ze9N4eXh2J/n/jJCINqjKZKX+kcPL17ugwZFxIt0vK5hPOWZAhLj1rW69IgBMF2/DLlvlgxt9QvwxHDpGt1E2orSOYof4rhyb9xpMkyS6VlAi1YjNXqPHCc+tpQYDQI/nuXHGNKg0tth9GVxzc/A+P4DVsIbEc294OEr/uBHdmA6BIM6F86c7TeUPfCXLg/l8lpzuo3zcsLeuHHcar/vo9YnTkYq9TYjekWcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wpl+zOtvHfhSrvLnU9vwpxlHNgY7HPO5Rwqdt0urMGo=;
 b=JRbf4NGuO/ZOaKj1mKPSkvCNV/KLH7CgXo3xOi7jRA3MdW+R561DNZte4iDbmKOa06UirBLMd11xKyQ8olkoXpx91RA7+Rv0sEi7UVT2kF1POH//y/2rYeOg+5LscCSX2vyasqR/0R465/X41WWhZf7jiZ3VYca+o97ukpcx+ziOIpxqXj6upaH+0odo0bOQLoL8knpmMtJhrtG2hRjuPZHBx9mut+pflNjcdkGPAJPUK4lFCaveyf5MOOpvumz3NRa06JyatixIU8LKKD7+R7tvOOY3yrnaDkhKIgbwugJUobUKy53CgBmYuK8Np0C6lpkrHTWS07NnnBifodbM/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB10476.eurprd04.prod.outlook.com (2603:10a6:150:1e2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Mon, 31 Mar
 2025 11:24:00 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8534.048; Mon, 31 Mar 2025
 11:24:00 +0000
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
Cc: Peng Fan <peng.fan@nxp.com>
Subject: [PATCH] remoteproc: imx_rproc: Add mutex protection for workqueue
Date: Mon, 31 Mar 2025 19:22:45 +0800
Message-Id: <20250331112246.2407276-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0110.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::14) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GVXPR04MB10476:EE_
X-MS-Office365-Filtering-Correlation-Id: e9cc590e-6e46-451b-940b-08dd70468892
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?51zhq02UmDVpVbQ3RghY3VASp2o4oG/6Ix57f4LS2SWJv1OsmriSO1J7+fgU?=
 =?us-ascii?Q?2itlK7ZhVhZ1Ub/78O0VTqELivFPOFjZzAHhIp3t0rKuH4J6zBMqGpslTVCo?=
 =?us-ascii?Q?DS734ubdBpCwCQrg192rC1qycOiNvfBD1uxK6uwcQHXuMj3qn/r2GPJ7YT1r?=
 =?us-ascii?Q?4fQQ2VgFgrg3yNiVIELtW0TRAt+q/qkUpdmOjv6IHRKdIW7GaYtU9C+snv//?=
 =?us-ascii?Q?trPSYDM94DiQcid+RyDZRMkZluVI3ku/RoivEnuRHxrwxyXdRkDkSQ1zZ7SQ?=
 =?us-ascii?Q?aEvaR9ax+1dL9Q3A9jZj7nXitEcw/ysCfEE7C3U8DwL7OIyAk3aHVlVtARSS?=
 =?us-ascii?Q?u6tVgTvRZXPzKGx2ImNhQspo0hn/TQZqF2blr7D7YAk2OPlhw9P364ZfX5c2?=
 =?us-ascii?Q?ezB761xhXMAAa8z9HJs0CLTUr0xoVILTwhigRwO/lRrP4j9en13ByAWe0Leu?=
 =?us-ascii?Q?mYaUwVZRKLYHGzE19bgrz46C9QDkO698QHwp8VEzT+Si2xN0Rebxfx0t9hbF?=
 =?us-ascii?Q?o271Qz4Diqo5zAeM/4nmRrEC67AQdfxzWmp2iIiBVGYdw54fxp4NuqdxqBQV?=
 =?us-ascii?Q?mIQP9pz8+NEKJtmGBzIBjeCrqBRnNtxO4gakC9T8pBXMUCMIxZdgtW2swzec?=
 =?us-ascii?Q?cqedb7JzAIbRnU21o3DHJuHrNG+bRQCuJxEU1Xzs/WZBT/tkxNHnyVm9uQNk?=
 =?us-ascii?Q?0jHprIg4q0WrD6vFY6OfEqj79FChCzPf2N1c4rz+wNDtl68kVASFDDDdOWlN?=
 =?us-ascii?Q?tMZKA084l3kE0A6TIdYIFh59SpWzW39sfFtK0JfdBnNTiQjNwQeHENbHS3Kt?=
 =?us-ascii?Q?2RwH6QUqXyLdhV2gvARRGe2tgCJUiZS3Kae70SLgyM9rlMRmCTpJndA1D5aA?=
 =?us-ascii?Q?d1PAIqaypKG/81hc7yPVhV+ujylwA6XYtCK3bGsXDlGivJdygUHWTjST9FUd?=
 =?us-ascii?Q?lCqqO3Uxb7XZTYWkZF5CiMlM8CLa6502tjiIFJ2ldDxnseaKQsEtsgmPBinm?=
 =?us-ascii?Q?mapcADaOTJS2eXKL4xGs/81WTahM1JXKGJ+dAjOudt4QHPmJHooGR+KiHphH?=
 =?us-ascii?Q?5US045lKs6otjx0EeyiQccgbsTbhIIyS4n5naKbMKb57OTXt+izjTOnjI1m4?=
 =?us-ascii?Q?M1m4usZjmXkHd1EbN9WS57xf4f2IwWYDT34+wdAh3ma2doKFTw+dSfdNrWp7?=
 =?us-ascii?Q?3Wlrk11ZMTlrbWAlhL/J9nVUMfiv2SeTXNVo1jRn4LpYc+R+k98L7W48L2gA?=
 =?us-ascii?Q?7MTReFnix85hrUSpRVucgN03ifgx+GV9ppdMnxdPZETXFbNrK8QAon2bHjyt?=
 =?us-ascii?Q?GkakyGneAHVE5jWIgw+ZIQRi4lakdfHSqcTlndevHu53GS14tV/Ju+DkPJqi?=
 =?us-ascii?Q?CbKEcaLpY+9y8L0A4g82ien/x6tvDpKDHXsBr1LiuaHICOQjz7EJUrj7Tw+u?=
 =?us-ascii?Q?vrrIJESLzpMOVddTgLsZDdN8zTfoSVcv1/ylun628NIHwVrT0yG7Sg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?a/bwNfDJCNz40fzxWLvy6TRs4OtdSlbdGMeS+tBrmElkZSc/FHgkA9a15ilm?=
 =?us-ascii?Q?rVLXCfKthvC/H3KxVl+RiXuF+pSvsG2ozcubOlwwuelqNtQHYMAMaLenP7o+?=
 =?us-ascii?Q?et8QxcEbxN7z+oGrBskBME5h3zSFi7TRGBnVqCSyhH6Ui1m7ipNwrE6Twj8E?=
 =?us-ascii?Q?WHu79MRsYCagDLZVQ+T5Yj/TLY5OJioPbTaac+jDuNQoLNNMRCNzJ4+vUvth?=
 =?us-ascii?Q?qWeTGqoXr8vftGAaGRWU22ISsP9pGQxCbYcMyziGv0XjinoglqCvYyGOVsci?=
 =?us-ascii?Q?7dQQCHhgupRUzctBM/EYPAndApK2pv8+S5NAtfNdnDTyXHied0zzciqUFJbq?=
 =?us-ascii?Q?42lcdYxTQa38QwnuuOi0pSCrhrpLSWuAT4FVWyvAmn89mlFjg5gNgCmSt4na?=
 =?us-ascii?Q?hHzBGlSB5fzW3oj8WtD9dNpg1bIo3bFaoW12IMnTuOeRTOadRL29NBL5dhZ/?=
 =?us-ascii?Q?kWvjWDU2w/GzKGR8E9MvH7Iy5QSNomlpKEXyy2Wn27LlTjNhkfUKV3az18en?=
 =?us-ascii?Q?phV3UF9qeDX0ZYeih3n8x1e/Q6en40H9yj4AORd5pjMFTASjUgLFu69hdTaL?=
 =?us-ascii?Q?PYysjqYQVb0KYmZb1lenA07qCZMq3p4klI9KZOlgZe9R1+3dXyxHHAMWIVj5?=
 =?us-ascii?Q?jx9EeTFwiNQ+K3GpKbMl/jkpmiprOjKcDp6uXyLvnvBAIeyR1lCIemwVSThG?=
 =?us-ascii?Q?3/X9eMvVUj8goazxbB0bubdlx9aQMp7fK3c3kAMpNDwPGuYgVelNou+jORbc?=
 =?us-ascii?Q?fHCtK0VT+k0e5lPM353oBblqWnsOxnZk2FP0eWWjHgpLp72vmfDuOAPZuIo/?=
 =?us-ascii?Q?bvLJK4av8OoGQL2THtX8cOu0w/ty4haBAUqHYKbVgrEPAXCfzGJMP/+a8GmQ?=
 =?us-ascii?Q?4SRMvSG41WxJ4Fn1DXlF2xPPaGekwSivm4Z+f8GpzGuz7uG8ov9StSjaKJzO?=
 =?us-ascii?Q?cTu2ibnaIh5MmgMxQuSliH1QkZu7YacYptnl7H5rEiBojb106evphSuhLEnK?=
 =?us-ascii?Q?sw3+jQsbrLVdXhjeP8dfi5XUBmhqwQBZKSx+s/N3eWzRf7ug8vWUfFpQ2ES2?=
 =?us-ascii?Q?kSckQxhxYoDakUnGyfaB+xhyaVJ9g9rg1AuGaZgZNq8ziNaDN308CrnAAIgo?=
 =?us-ascii?Q?cpWeuwsuaLL7fkSbZx85cUA2KQqoJPy/+e63Ma2/q2glZ9u9zNf9nKlSkAyY?=
 =?us-ascii?Q?LS9/PxAwBHEb9JXreiUMbLKi97MheCnoI0LKecEBEOuu+wRlh7pAjADUVGPt?=
 =?us-ascii?Q?Qo1jrkfmU2Mlub7osQHKLhXAW8Tq2DZtqa6aSLcfCxyUtWKYc2NfJIqADNa9?=
 =?us-ascii?Q?eb03uyAvHENE3CxgeEwIg1zcjls+1AauPN1dsGmSwujY0PJQ/OTklX7qdFOn?=
 =?us-ascii?Q?wmDKMsgT4MDXvUNO/uhaK8B2HM9dw3+hghvBo4LRdRVWzrNYOV5N5dVVGfx+?=
 =?us-ascii?Q?VVZ3pSxoW+EVg8A7x2u9tDQLWL8A3F38LlkAG/0fwqoZXFWS/FqE+davKcn+?=
 =?us-ascii?Q?on7lffRVGWIA4OZKceIEHJvsnAetRrOkO0wv6gozQW/r8lo2+SuYCDLDwDRQ?=
 =?us-ascii?Q?3aWptQsCA3uAxrs0MWSwbPvEQcwNX3hhFeNABtmd?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9cc590e-6e46-451b-940b-08dd70468892
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 11:24:00.2123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pNlo/pwITRVTkV+kMgvfgkqBVEohr6TMRUp6unCDOHWlJtd0BzvNDI2QnpCCtO+SvTBm2+jXTnU7P0O7idiJeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10476

From: Peng Fan <peng.fan@nxp.com>

Same as
commit 47e6ab07018e ("remoteproc: imx_dsp_rproc: Add mutex
protection for workqueue") and commit 35bdafda40cc ("remoteproc:
stm32_rproc: Add mutex protection for workqueue"), imx_rproc driver
also has similar issue, although no issue reported until now.

Reuse the commit log from the fix to imx_dsp_rproc:

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

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 74299af1d7f1..f933c8f4fc8b 100644
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
+	if (rproc->state != RPROC_RUNNING)
+		return;
+
 	idr_for_each(&rproc->notifyids, imx_rproc_notified_idr_cb, rproc);
 }
 
-- 
2.37.1

