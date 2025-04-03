Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2041.outbound.protection.outlook.com [40.107.247.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3291F4C84;
	Thu,  3 Apr 2025 10:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743674511; cv=fail; b=nz3YTolAA7RWrqP3H1CoF1WdWe6LZ5pL9TQzkvR4d+bFYrmxjYD8D6tI8FMLyx5u7HYWgvcvMOj0aedlN07yIecTyaWsikyFF2cuLMFIJBj3zlaMlsnQPtaRfxlb666+6l+jUEAVsmNAHxDD8Cio2bMFwl1VzIBUM1cTts6MmeM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743674511; c=relaxed/simple;
	bh=qAtlCni6EUlBXo23Hz8YcSGqeRx+EVvZRcRLp5hfH88=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=B1ObHw2+kmbs7Kuiso4iSt6l1SOZCLeyqfq3M4EPlux1Vuc5j+5/cL3ZdbjCRPu4NswmKkbREGUaix52u4onrKO22tpzBVsMZUy3yKjrreyvBFHlzll1HpAFNRuKyyFCkRAAxt4NBGqTnmpoVUpKOUf8tL2LSIG+rtVLdamxlA4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=kRY7RTVX; arc=fail smtp.client-ip=40.107.247.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="kRY7RTVX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v2vRp9mc3oaJI+iKGLxjbrukPxQzLowGxFThcQvM3YRfTZ+BEqzfPrbEPpwZfLPLhaN46fxAz1zKt0fWRbbZ+F7C9q00We3kGt6Jvx8m0UjUU5B8Ohi6dZhnOGIpzk7Mlw8vMWtA4NLDKYk3xO4zpksEOzXgATFAkJxKsWALknWlYvz64n32qwyLksYQ0IjldF/7v8uk1o2ndjkiuGI7fMtOXDCRmrqWlCCVEbai5QtRNlaot9eJvnITtJbnuwOBYgj6Gq1jiawXcS8k0Q9mzoTZ1DxwKHufqF68gQbauKGxFCscfOZ9o8tK1bKIbHgn0LAtuObHupr10dtAOYLOmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+vLYhNb75a0yR+pHY9OuPswGCnqKWoDNYFFD6tgfWyI=;
 b=e3m1Vt6NOPwnWVCBCyT+eoYS+9dOswFxhsOuJol4gYlmFrjUVGqdnRKTS031WuJRw1zTAj6ZeG2ne3FqKuc97zzHy+5XuYGATe88sbz0X+jwdlIjpLoeB7vcR7ojKQ/GT3z7Xhs0dBdND9n9QTYdgOT4Mff6UO/kDOuxqF36XnQPAeT5dKr2BsQ/JakshrMcO6o9S1soBTPrAOWYo+qh9A6ckzhDgEFi/V++tcKGs3LZ177IIumF+ku/Orzrm4W+44OJNlgXiGGrO1CjC1/S4+7j7/8jFvRfyIEY8Va44lA+jzGlS3K0C0OGahRdalPSvnKu476tvZTRqQ1F5u7b9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+vLYhNb75a0yR+pHY9OuPswGCnqKWoDNYFFD6tgfWyI=;
 b=kRY7RTVXzBE97Fnq9vkiTh0Trpua8uQsBAq/CEq/oJ0ivYbgJLM+7DEjxXv7sqYRIp0yAsPP/sDI0XR7Qws+Eye1MrYKNgWLGIP8umEd7bP0OhOaredW4F4iX0r6aPwT+8gIu5e6h6zYuLOJBvBuvqTow6oPzFbHK47n94TAB/4LJEGJ++jYzbLIQASTAwibz1xqemP++xfQ2aT1Cd6DAsdJzvcIMt0FpUUA+RW7IUyJGk5Ri+gsYNtdvGbMY4SFOuGjjg1VxvRJ7+6hYQ5nVcGn1s/VbV1fGZ/YmA4l4LU0FRcSM28v219XwyXbPR5M4YAwslI6k/9cAn82OaFYkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com (2603:10a6:10:2e1::21)
 by PAXPR04MB9641.eurprd04.prod.outlook.com (2603:10a6:102:23f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.49; Thu, 3 Apr
 2025 10:01:44 +0000
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::88b8:8584:24dc:e2a1]) by DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::88b8:8584:24dc:e2a1%7]) with mapi id 15.20.8534.045; Thu, 3 Apr 2025
 10:01:44 +0000
From: "Iuliana Prodan (OSS)" <iuliana.prodan@oss.nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	"S.J. Wang" <shengjiu.wang@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Mpuaudiosw <Mpuaudiosw@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: imx@lists.linux.dev,
	linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v3] remoteproc: imx_dsp_rproc: Add support for DSP-specific features
Date: Thu,  3 Apr 2025 13:01:24 +0300
Message-Id: <20250403100124.637889-1-iuliana.prodan@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR03CA0052.eurprd03.prod.outlook.com (2603:10a6:208::29)
 To DU2PR04MB8774.eurprd04.prod.outlook.com (2603:10a6:10:2e1::21)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8774:EE_|PAXPR04MB9641:EE_
X-MS-Office365-Filtering-Correlation-Id: e7a7b7f0-df19-4153-231e-08dd729689cd
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ODQ9B43Nq3fdYJUjrFbx6LQgx3wsq4tQAWIi9E1PzC9AySmntSXiO8yPyK08?=
 =?us-ascii?Q?OGjiGP7ZreqsSCYx4Z3l+Mz1Ax5Jd9Hq6QXcLcc17jRbTaqv5D4uv9PM2FmA?=
 =?us-ascii?Q?5280YieQoNpRlmBMfBOmxbBWj6GGu0CRftfjFIHthYP+1wH0EbIBSW/oK4jG?=
 =?us-ascii?Q?GyAKT0gHE4U6xbVTaSTwMSaHZTkszsymTJoq/3MHHKKlALbd0v/PwEpq2l6L?=
 =?us-ascii?Q?naqqLPaOO8ZRpscViZCXDGtgws3Fro1m0zktEjokE5r2ZHGMqkPJyorSvolt?=
 =?us-ascii?Q?XkWYEkIYZ4VYhUOrz3wVaaRt0/a+jlyFUNYU+iSBJ6/pfEx3EXyXvzcrStLd?=
 =?us-ascii?Q?8SXlDkjVlllLC4/p/N67abnim7T+1gXznXcfU7IjU5R6thecZxnFs3QIEcey?=
 =?us-ascii?Q?oY/Zt1V1TkH9BQMBdjphuUiRKmbs5AgSkjsIa2Tq3BKdsx13eFs+IjItt38p?=
 =?us-ascii?Q?IWEOzkanx+HiJVxNrA9q5ViYroPiti3KYwWS4mKpWIhpdtk8wBvEORJMFkYo?=
 =?us-ascii?Q?jtoD4SO/IMgNHxBwIk+LwZ1BOFKGaIg7l/Duo2aNkn+wEIocsJNNxeS09NHR?=
 =?us-ascii?Q?bzi9CkRrMZdCMFxi/6x0tXw3SHD5qhdA6YPAzQSSneBazZN5cXnAoU/enXWs?=
 =?us-ascii?Q?7BThfwbJLGZ5BpS+KYLTvs/445XOtK2YLqzfNSIJNI6+oRiKZRvWY3t/Mk3S?=
 =?us-ascii?Q?AirhX7NVbBnuWC4Sqmok0rPOLkziVqqhwPgbGUecvAscnUa4cUHpKxf/u/nC?=
 =?us-ascii?Q?iJziSaojJzmqpZJkQNIrsZR+GVhXrulD7760XzPwHmpbweAmaxO79MBWsfFF?=
 =?us-ascii?Q?KusfaU0kgetG5Wqfb4YFSA2gfYccUnU123nCc53uXIXRFtQcxbBwYSOxUrxo?=
 =?us-ascii?Q?BMx8ykIShg6YgK1ST9rgvCV1S9V9JwULZ3UQxD5Gm98OWcC1S4chFCsqSDA0?=
 =?us-ascii?Q?xO/XkVxDPJomZ0tOBT6v6gmGVs/FvklnT+xxY/8DKVvOJpLvhtOPQvahXFcC?=
 =?us-ascii?Q?L4WhBcGH3lPTkUIzBHbbVZdm8Z89edwLf3nmgJHJD/kwZfTdvAR/aO5rD6a4?=
 =?us-ascii?Q?31bDv0eKu7pzvgi4pI92iQ9ltLB/DW70pRieD+8B7bxmnXHa8Ci81r5G3X4T?=
 =?us-ascii?Q?/OPLqLgb6rNlzX7URQrGLyBFKf7/nmfWI+vDkBUQgHSbUCq5eMo+sNpu+eBV?=
 =?us-ascii?Q?lVdvZviO4H9Z/UTlsXYVEdyCC1SwWtRFbbhCP8dDsc7HFhhBZSCinxztuFuj?=
 =?us-ascii?Q?Spo7BjvtWPteKTJblth0r6CWYUunGHeSamI520zKNwaRlSB0mz/P4JjGY1oz?=
 =?us-ascii?Q?wqKk4/uYBEwvM893EuCSmILcwqbjIccN+retDQfgBdcqsQjwmdSyUvdjRh/H?=
 =?us-ascii?Q?Ci3dV2Cv5mqe56Ev3o+S70+a9iAHmKiBXBzX3jGoZ0g8Km3UCHohuiOSS6TP?=
 =?us-ascii?Q?2nsB/hlfZzIgIaFCGR7y0FM9Owzuq45t1GDHHnRC/hFc1Pb2spNCBw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8774.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/ymXKP70kiTJD+vIEbDhp+NfTfS+ci1OsiaWB+iEx5NwVP3Uy9XZDQqgDkDk?=
 =?us-ascii?Q?ROmfoaSw1RmkyvC3QXgVGNELYtDLHTDR68IgJ7HeKJavdSN1EQEusn1DkHvp?=
 =?us-ascii?Q?jR8AS6zPjG5ZcAzva0SfLyEPg/qNRVCD4P9EkV5bdMT1R/jhTCq8/DIQFPP4?=
 =?us-ascii?Q?y/iMk76l+sMd+LnjdTzl3EGvWd7kKtrh7mAXYGs9Z/6F4R04OxdFMC3g03zj?=
 =?us-ascii?Q?CmaK9ushgiRcVyP+uBlgScIURshb2yaXumnOwp/TEkT5zxNH5NA70mN0aWcu?=
 =?us-ascii?Q?nGgx5jbyB2jBBf3RJPRl0GxGJcEE2/Y5Se4doQ+x2OdPZo0ZvQanQVBO0KHH?=
 =?us-ascii?Q?QAAJYXYKJef6Wn1VKf+9nqP6tHw9XLhZN9CKLAJ5ZsNvqynjywR5Op8OWTZl?=
 =?us-ascii?Q?w6ML4XFT9Jy16EH4CQ9SXVZn2WpYLSLY8Bnj+kJstZJgjK8OgZ1WPSJoGVZC?=
 =?us-ascii?Q?qbACYhADZMrfH+XtXCKae0iR2X/6TycbAetBTbjiQ+djuaVO4dnmbBBRKpKd?=
 =?us-ascii?Q?MMw9iAllk+UDEWg7g1BgSCNPj4QjvMXV0mLUprgRpi6gc8AzsMf/9dtAVjLC?=
 =?us-ascii?Q?WoTeDAoFFoUN7ZkDQf4ibVh4prP9stkDksme6VEqu81rTn720wEw+hMZ51s4?=
 =?us-ascii?Q?dN2Bj6MNJZuYIRfuJt9v6+XuK+Me99FVRIID1QDaKS/cr9FFJgX+2/e9+8/z?=
 =?us-ascii?Q?2A2ijBo9ImvAN83iXxXMFvWCGWCPB4zboLDiffthpFq4P6uG1rtfXt9eazT+?=
 =?us-ascii?Q?prKxvLW7OHB4rxqEqd+RVfFetq/7/n3I0jTTiJgFMP2ALAGoj80iFTqpX1ny?=
 =?us-ascii?Q?v3oaB/RE3LO+WwCf0IRSW1JpwYqUTgTLApkYmVXGfW/oQi4SESw2WtaG7XX5?=
 =?us-ascii?Q?zFZ1lUCNQg6nl2ipSr7jxACEpeNTzFtZ9JhjB9Yz7ESf5eOR4Alyfr5uE1Pn?=
 =?us-ascii?Q?cUyCPtPiwv0qBQj7mQoA3iAJoCFiVdr2vD/P3ywlB3PkRVFOakSxGgAAIm5d?=
 =?us-ascii?Q?aSLwQ/BybrFK6MKJVFgEey8/se/bT/EyMCtZvhp3oRDopTpbf23/EEMdCtMN?=
 =?us-ascii?Q?dvCOP8mLsHHfLYAY/eUWvpyuIgWCLiLy+PTowyFhjzbJYgLi8Lww57/9Pa4x?=
 =?us-ascii?Q?ds9xdsu1APK5rNtXIWWiDMsXrwYxCeDCIULOBE8RZ5SaytZ59yiie6ShmSzC?=
 =?us-ascii?Q?yUNFN9dYGNqA5XTuoqY/+WczQ3FJqybjmCI/5uA318sI9qt70jo9X+028wRo?=
 =?us-ascii?Q?A2cQIejCrX+LhziILbe5myAHBH6Wtas1lFx6mhQNZZiSzEjFFlw++3NU9ci3?=
 =?us-ascii?Q?+VoQNBAw1WBTzibit1lJ3wwKUIO9Rjk5F09BqcC1yIMoSpHtZ3N5Ln46ENYU?=
 =?us-ascii?Q?bWYk/ImMHf8dJLIK2UwQzRuh6nBMI+zDA+vxmkKb8+LfGY24IXwwYHIG4T3+?=
 =?us-ascii?Q?Bni+8xDVtvvbQmEdewmlaFT+qpjrd7ylw9mesA3p1WkvkS27co08/vtfeDVb?=
 =?us-ascii?Q?pjS/DrsBE7kL4cG5l/g9ElAvydJ1MWHaK275Ff4/0q8vCgwu1jt1FoYoMT6T?=
 =?us-ascii?Q?Teu+4GRhGK29Vt2nKNmFhYLpVgTn7BOM1zvcZphXuUbE2EY3MKE+cRvHUqRJ?=
 =?us-ascii?Q?FA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7a7b7f0-df19-4153-231e-08dd729689cd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8774.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 10:01:44.1262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AItXNp5hzMJNbN9Dd40Q+5Rg+N5h6FPSAS381a2n7Hj7Cz6SyFtPbHl3NLfwyBkvD/gkWkKyVmJFX/xupR0Ofg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9641

From: Iuliana Prodan <iuliana.prodan@nxp.com>

Some DSP firmware requires a FW_READY signal before proceeding, while
others do not.
Therefore, add support to handle i.MX DSP-specific features.

Implement handle_rsc callback to handle resource table parsing and to
process DSP-specific resource, to determine if waiting is needed.

Update imx_dsp_rproc_start() to handle this condition accordingly.

Signed-off-by: Iuliana Prodan <iuliana.prodan@nxp.com>
---
Changes in v3:
- Reviews from Mathieu Poirier:
  - Added version and magic number to vendor-specific resource table entry.
  - Updated defines to maintain backward compatibility with a resource table that doesn't have a vendor-specific resource.
    - By default, wait for `fw_ready`, unless specified otherwise.
- Link to v2: https://lore.kernel.org/all/20250318215007.2109726-1-iuliana.prodan@oss.nxp.com

Changes in v2:
- Reviews from Mathieu Poirier:
  - Use vendor-specific resource table entry.
  - Implement resource handler specific to the i.MX DSP.
- Revise commit message to include recent updates.
- Link to v1: https://lore.kernel.org/all/20250305123923.514386-1-iuliana.prodan@oss.nxp.com/

 drivers/remoteproc/imx_dsp_rproc.c | 102 ++++++++++++++++++++++++++++-
 1 file changed, 100 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index b9bb15970966..80d4470cc731 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -35,9 +35,17 @@ module_param_named(no_mailboxes, no_mailboxes, int, 0644);
 MODULE_PARM_DESC(no_mailboxes,
 		 "There is no mailbox between cores, so ignore remote proc reply after start, default is 0 (off).");
 
+/* Flag indicating that the remote is up and running */
 #define REMOTE_IS_READY				BIT(0)
+/* Flag indicating that the host should wait for a firmware-ready response */
+#define WAIT_FW_READY				BIT(1)
 #define REMOTE_READY_WAIT_MAX_RETRIES		500
 
+/* This flag is set in the DSP resource table's features field to indicate
+ * that the firmware requires the host NOT to wait for a FW_READY response.
+ */
+#define FEATURE_DONT_WAIT_FW_READY		BIT(0)
+
 /* att flags */
 /* DSP own area */
 #define ATT_OWN					BIT(31)
@@ -72,6 +80,10 @@ MODULE_PARM_DESC(no_mailboxes,
 
 #define IMX8ULP_SIP_HIFI_XRDC			0xc200000e
 
+#define FW_RSC_NXP_S_MAGIC			((uint32_t)'n' << 24 |	\
+						 (uint32_t)'x' << 16 |	\
+						 (uint32_t)'p' << 8 |	\
+						 (uint32_t)'s')
 /*
  * enum - Predefined Mailbox Messages
  *
@@ -136,6 +148,24 @@ struct imx_dsp_rproc_dcfg {
 	int (*reset)(struct imx_dsp_rproc *priv);
 };
 
+/**
+ * struct fw_rsc_imx_dsp - i.MX DSP specific info
+ *
+ * @len: length of the resource entry
+ * @magic_num: 32-bit magic number
+ * @version: version of data structure
+ * @features: feature flags supported by the i.MX DSP firmware
+ *
+ * This represents a DSP-specific resource in the firmware's
+ * resource table, providing information on supported features.
+ */
+struct fw_rsc_imx_dsp {
+	uint32_t len;
+	uint32_t magic_num;
+	uint32_t version;
+	uint32_t features;
+} __packed;
+
 static const struct imx_rproc_att imx_dsp_rproc_att_imx8qm[] = {
 	/* dev addr , sys addr  , size	    , flags */
 	{ 0x596e8000, 0x556e8000, 0x00008000, ATT_OWN },
@@ -300,6 +330,73 @@ static int imx_dsp_rproc_ready(struct rproc *rproc)
 	return -ETIMEDOUT;
 }
 
+/**
+ * imx_dsp_rproc_handle_rsc() - Handle DSP-specific resource table entries
+ * @rproc: remote processor instance
+ * @rsc_type: resource type identifier
+ * @rsc: pointer to the resource entry
+ * @offset: offset of the resource entry
+ * @avail: available space in the resource table
+ *
+ * Parse the DSP-specific resource entry and update flags accordingly.
+ * If the WAIT_FW_READY feature is set, the host must wait for the firmware
+ * to signal readiness before proceeding with execution.
+ *
+ * Return: RSC_HANDLED if processed successfully, RSC_IGNORED otherwise.
+ */
+static int imx_dsp_rproc_handle_rsc(struct rproc *rproc, u32 rsc_type,
+				    void *rsc, int offset, int avail)
+{
+	struct imx_dsp_rproc *priv = rproc->priv;
+	struct fw_rsc_imx_dsp *imx_dsp_rsc = rsc;
+	struct device *dev = rproc->dev.parent;
+	size_t expected_size;
+
+	if (!imx_dsp_rsc) {
+		dev_dbg(dev, "Invalid fw_rsc_imx_dsp.\n");
+		goto ignored;
+	}
+
+	/* Make sure resource isn't truncated */
+	expected_size = imx_dsp_rsc->len + sizeof(imx_dsp_rsc->len);
+	if (expected_size < sizeof(struct fw_rsc_imx_dsp)) {
+		dev_dbg(dev, "Resource fw_rsc_imx_dsp is truncated.\n");
+		goto ignored;
+	}
+
+	/*
+	 * If FW_RSC_NXP_S_MAGIC number is not found then
+	 * wait for fw_ready reply (default work flow)
+	 */
+	if (imx_dsp_rsc->magic_num != FW_RSC_NXP_S_MAGIC) {
+		dev_dbg(dev, "Invalid resource table magic number.\n");
+		goto ignored;
+	}
+
+	/*
+	 * For now, in struct fw_rsc_imx_dsp, version 0,
+	 * only FEATURE_DONT_WAIT_FW_READY is valid.
+	 *
+	 * When adding new features, please upgrade version.
+	 */
+	if (imx_dsp_rsc->version > 0) {
+		dev_warn(dev, "Unexpected fw_rsc_imx_dsp version %d.\n",
+			 imx_dsp_rsc->version);
+		goto ignored;
+	}
+
+	if (imx_dsp_rsc->features & FEATURE_DONT_WAIT_FW_READY)
+		priv->flags &= ~WAIT_FW_READY;
+	else
+		priv->flags |= WAIT_FW_READY;
+
+	return RSC_HANDLED;
+
+ignored:
+	priv->flags |= WAIT_FW_READY;
+	return RSC_IGNORED;
+}
+
 /*
  * Start function for rproc_ops
  *
@@ -335,8 +432,8 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
 
 	if (ret)
 		dev_err(dev, "Failed to enable remote core!\n");
-	else
-		ret = imx_dsp_rproc_ready(rproc);
+	else if (priv->flags & WAIT_FW_READY)
+		return imx_dsp_rproc_ready(rproc);
 
 	return ret;
 }
@@ -936,6 +1033,7 @@ static const struct rproc_ops imx_dsp_rproc_ops = {
 	.kick		= imx_dsp_rproc_kick,
 	.load		= imx_dsp_rproc_elf_load_segments,
 	.parse_fw	= imx_dsp_rproc_parse_fw,
+	.handle_rsc	= imx_dsp_rproc_handle_rsc,
 	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
 	.sanity_check	= rproc_elf_sanity_check,
 	.get_boot_addr	= rproc_elf_get_boot_addr,
-- 
2.25.1

