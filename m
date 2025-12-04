Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010045.outbound.protection.outlook.com [52.101.84.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0741A3165;
	Thu,  4 Dec 2025 12:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764851340; cv=fail; b=SmjqbQaH3uv2F2FQ3T9CM5oRYb/UMTvhwuPPaSYUUc6sGYexUeb7AzQhxoYdwjcmLmz3fs6umJtA4JgXo5ldFshaLllIePAJH3L6DWI0mbxZ8IZesIP7JWfCY62T1HnF330hdvXUrW6H7jv4rZY2T8KA8ErW4fdEGJDI8mpZnOM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764851340; c=relaxed/simple;
	bh=jllfW8a2K7PIDr84y8H6Rm4pae3aH6EoTxG6McGA3KQ=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=CltfNc3uyZQm2tf7QURtQwADgrqZ1ohziNb5RqT60QerjGAbwZdrNSn9qYdRpCRyn98YANZ74wPX3/NAcUH5GUiqc6GMRupKtbafpqFJqffCPufpe7Jj7kYQSary62cx6LtR87HMzWNjP42qUcjCULwE8tVxR9o99oBeiyVtIp8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=s9n+bnbm; arc=fail smtp.client-ip=52.101.84.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="s9n+bnbm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XA0wuhq0TwCEx6ozYbNNm4S7kIpJSbf68DxZ9YEnDSZwY3LhSDV1Orz0+8OE/dHqIwer1/pKZKEfYtCmJwvknmFHCzOYO/SXv8K5IZ9KZRn1G3ssVISAsaUP6SwGwT6AETsG/F4CNLONlQGwWCQWbV8gJLO5X+aFWvypjOmpEudNiwjAOzvuIEOscArmnuoRBAdbOYeK6bA2STnK2GHyO56YATBGZiSOw1d2d/t5hXDoS4bjr1vRo9fcUvgo52VDPlrdt0tIyA+J4Q/TLexWxVv5k1eRbMRz3sH/tQdt4otKjGMJfoEkd/H9ZMYufVN0ZxslShHavxoz7GSZiyGQXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g8eQJcxuAhFRKdXmwefDcAXK2wiFcqqUOeI0PcelzJY=;
 b=INcpzT0ZZMFE3ePQkDtNtNauVT3T1MZRHc/JXWof1Yhv33VIK7w/fLfM9uqjZOg/9+QTDrb72GgxfU15UhtD0GzjPk/EAA3YoPSysA4vK71N9nQyYasgWMxuqyDnMV8j5oucGkq0wnNPeh3idlwa2x3TiF6POdlbFjQdTaPPSGzxUh4ebvul9upavx/FYmtFu1ETqbEAr2lh8iBJZ6q/ikSmZ+c4aGA0uSfJizjkmcXep3i7Vg/mQfuIkcxp+10nVxDxAzUZgNn8TJaEKC7bqWc2zltHQvVn1oCoFBBmCUWriv3R7MNVwH7ca21rODmakiTkxziqi8uBAU/aMu5Rlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g8eQJcxuAhFRKdXmwefDcAXK2wiFcqqUOeI0PcelzJY=;
 b=s9n+bnbmDt9EdLXgNWaQ2UUBBqV07tPS23zdQIcjZVqnqICxjHXPQHI3pA0W0lBniYVWf8SZCiMgvtrI/PJEcDluy6PeumcB10/e46KllMYf0sfhvY8HZ5Qv51Z+WS7ZL46OIZH5cL4MZDzYaoEcMmHphtERP+hoZWw/V9idXfc4vSS5EQPOnMttpCIwbw+dn+tXAGhWtq4erPPX6J3K2ihsmjsFV+ohydhzYo+ppqrXe+WT5//ZI5SQll+cJWYAQYoc/SUtsDbwmyObVqFqAc0jPhVcp1+aqk6Q8JV2YbZ6qmue3cuKUBBJR4r/vdZG+hKjTN7jqQIhs6OLc3h1dg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8907.eurprd04.prod.outlook.com (2603:10a6:20b:40a::22)
 by AS8PR04MB7782.eurprd04.prod.outlook.com (2603:10a6:20b:28a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 12:28:53 +0000
Received: from AM9PR04MB8907.eurprd04.prod.outlook.com
 ([fe80::a361:2618:7785:3bc9]) by AM9PR04MB8907.eurprd04.prod.outlook.com
 ([fe80::a361:2618:7785:3bc9%4]) with mapi id 15.20.9388.003; Thu, 4 Dec 2025
 12:28:53 +0000
From: "Iuliana Prodan (OSS)" <iuliana.prodan@oss.nxp.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	"S.J. Wang" <shengjiu.wang@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: imx@lists.linux.dev,
	linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v2 1/3] remoteproc: imx_dsp_rproc: Skip RP_MBOX_SUSPEND_SYSTEM when mailbox TX channel is uninitialized
Date: Thu,  4 Dec 2025 14:28:23 +0200
Message-Id: <20251204122825.756106-1-iuliana.prodan@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P250CA0003.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5df::19) To AM9PR04MB8907.eurprd04.prod.outlook.com
 (2603:10a6:20b:40a::22)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8907:EE_|AS8PR04MB7782:EE_
X-MS-Office365-Filtering-Correlation-Id: 07ded725-b572-4517-ccac-08de3330af76
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mhCfIQxVpiHH7GE6y5Nt4IVx2tj3jGr1rNfkGcqP6GU6VDkwYsNAH2NE+zYn?=
 =?us-ascii?Q?tbdcfBbADc6EfMNtFytzbZ6jsQEZZLnEiJTgsRacbbkhgSejJknztn53u85A?=
 =?us-ascii?Q?/sszJshlouJ5HK2TQeylc2kw0veL8TZrIC17ecS0LB2/cw53CaCHHJJkgVw9?=
 =?us-ascii?Q?3oypSzKqC5cveJf+FBuWmlvnzWNb8iFbS7njvYVnEGReQs2pVH/0OveEOh7d?=
 =?us-ascii?Q?m0/gnpsinln8JUVye3HscpSCtJzEdkZwK6YcVUJVTrtr8lbuyyIlNroPZaAw?=
 =?us-ascii?Q?OwvpDgbSj4TP+pKaOmE0uB/GNDOKg/4FSahaC3J8gGYygDDS91fn9VNba7Wz?=
 =?us-ascii?Q?YLBA1yLWbTHt9eLETu7baqqV2a0e5zolosJxrGbsA73FbK/AGRLHB3qXb/CB?=
 =?us-ascii?Q?Lrxzops5DhYM5OWVwI0Xc+p9puHKNtlp8a2kneko71K3tXP8mZA8zZW5o6M2?=
 =?us-ascii?Q?gstr3wT9MxrnZUfQ71bgydx16YmAUn7bGALGxkxIUkRv7xXwnLfmxtrT2tQg?=
 =?us-ascii?Q?5W+kncKlKnrVwYhfGiN0E6doDBne9P7X9r20gshH9wQaF40ATa5DILGJR4Ib?=
 =?us-ascii?Q?URTC+pg1dqaZni8UTNsdPQBasC1k25siwZ9MPPFy8PG6vMdEUXW+NmrHTxMR?=
 =?us-ascii?Q?0UhryU9/iBFjA25azWUg+C2qxsK5CWVIYS562J0KiQwPZxFSLYvJ05f7Tbwu?=
 =?us-ascii?Q?LUHrZQpcrZXwS8wQc2GPsX+3n3JEQnzKq/Yn9mTw8RKBFdhmtoyMwbOGOA4R?=
 =?us-ascii?Q?QB6A4BQpyfLmmtaHJgk7w2u6E7N/kZtlH2GaxbFXet6nkV9+2XBLUCFwBHQa?=
 =?us-ascii?Q?9kbMWauJHNiCGg0b/ssOqxDeAPi5UBWeaHtPHsNQTh/ULIvWWCRfYpbjKNZC?=
 =?us-ascii?Q?q2ujvmXYki3AbwKARJE7KCAMZFcJDQtYxsjdiw/myrVfD1oxpX4QGG8vB/IZ?=
 =?us-ascii?Q?EZVgYPWHM/keQPQCOAIPswhl400OoIxQIZOUoSVfobDEMEf3tlvMyz9OkQWV?=
 =?us-ascii?Q?GdpgONTiRhINYAa2SyPM5fwKhWs7RfDXhcBOZYbj2aR1XqzMLQxmx9+7/kpM?=
 =?us-ascii?Q?OnOygm7QdfKipuB66iTnwlTwdsB65+mYfRMFei7cSEWrmFfkt9+98ZF7Ahs5?=
 =?us-ascii?Q?f33Qw67bL79hR5G8Pej6uXzrs6SSxsWKNIOkcx4Yf8NH1qbUpg+lMuYyfgAN?=
 =?us-ascii?Q?CK6Ik2tbfMBIsfClG/4B3Wm+0XRO0gkIA93tZLhAr4M/aC+GGTWCWOXkb1p6?=
 =?us-ascii?Q?0J59KzH1GivuJm/Cj3Zn5j0uFYoQXoM0Ygy/uWdGKGm/TnOFWSlq8ET9gyCv?=
 =?us-ascii?Q?nkzrUQuj1yaYF5VEbH/C3d8rc1JzWvf9yPV4EayjzD12BgthBznU1gcgXgcs?=
 =?us-ascii?Q?iBKi6ZBCTAlm7MvD7O4lWV+UgKD+XXPwp1Hh9Kdof2NjgCoYymI6ta5gnsvd?=
 =?us-ascii?Q?CDvzVawN+DkhCiQ6roQnHW/5YL0C0a4qWN/dBN3hV4dc9wUmFaOdynVSX8wE?=
 =?us-ascii?Q?fBMOOfFA4/P5ygdi/Iajc+OV6pClsan775Me?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8907.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LUAJ94bg5iTZa9ld5qRFrtNCMFiAWhiuhGd7f65YDiteXOUZzR7YYo8ODm6o?=
 =?us-ascii?Q?C0U3Vrq4qMfp40GCZA7XAkIgVCPMgSwVLXFnWjPmWOx7k1/2D+MJDfAXWQ6+?=
 =?us-ascii?Q?BgcZOdKiRZBtNusz9HIXAsvyohxG9xRqZFBkIHgTD9W3eItKZDpi29u+VkS0?=
 =?us-ascii?Q?phwrdZsJB/53gazFO3oxnFGUbUHI7hrIwtrcJ/UomibxR1dqknkApC9C0lzb?=
 =?us-ascii?Q?ldA7eYmR+ATRS6Y/V2BS3st9yAzMV2XnYMKlom4JORD31QJevzx11ChCRjL0?=
 =?us-ascii?Q?uAZkYb/Pu1T2/OgCCkLvH8HUj5Z9EB1NJ+yJJGmeeDpmhgx5a5AfZOUfkdem?=
 =?us-ascii?Q?u/lbDQ+4Ak1DB5NBRthCDSqhsANYrlGG2yDnTQMPA/Qq84SnpSmaVfVurAmv?=
 =?us-ascii?Q?K/EjSSbafuJigLmychvI+xBAwaEyORI0m0MyqC6kd0fOEa4eyVY95HpWbr2h?=
 =?us-ascii?Q?VXzW2Q/jzKg9pp+qK4ojaUNRd9s7DfnFKS6SbNm+9AWXn/31P/TRdSfNAJUQ?=
 =?us-ascii?Q?gf55/PLk5P1U2biams4MhdZbInsbYT/GuLyWJiWaQM6hun1w5jF9sWG8y7w1?=
 =?us-ascii?Q?h/eyv7oAtaeSpBrL2qnVz7dsFpvqGL4OL2SCw7RyeRSgWckYWIJRWpbRkJF9?=
 =?us-ascii?Q?7rmRcBAMb/0aBUv+PayqzW5BPoxTkdfPNlD03mReLKC7knTt1HvOQUnKqlbd?=
 =?us-ascii?Q?vxj5xjCdvevnSYWRLQ8YdG5wKIQmGlqh3dtAJuzeOvZSfjWZlgzorW7LLS8A?=
 =?us-ascii?Q?COS/qiASmUldvg6PGULuai1k12fSGPzjCndI1tmzdSkiA/tUSZ/RpskWEuWu?=
 =?us-ascii?Q?G7rTfWVszdRHcxq3TRai8B2EolW1HApu7sgh7Ei0XenkdY3Qz5bb1zdP8hwW?=
 =?us-ascii?Q?sp143D5xs2GOU68hRv2Ib6drbtt1ACeZpkED1qlmhGYY5km6zgBl0iS7P2du?=
 =?us-ascii?Q?RP91kUym2s28l/83JuM5g7WSgin89GEU40VizA1ULdLqLNezF71zp+RzpaTl?=
 =?us-ascii?Q?aWLK55O0uwdQh9HVg6Yo7Hz7GLZqO2J+GHtAAbrNcymeq+NH53QVgyCOJ2b5?=
 =?us-ascii?Q?7wUqDCUXZ3Y4jk2ue/BsTL2kz1GdmKAVI+9V2C6vuwezV4tzOTdonFRWvfOV?=
 =?us-ascii?Q?PUBlT/1w5p8oBYr4eVDVNDrPhkLrVdrNO4Sughb4bqLfuqf8ymHIE/Gc8M2A?=
 =?us-ascii?Q?VDot7509typ+VtxrPdM4L5wHVMJ929YnQSb1+JSrACmEV19iLBsbeoTB7DF+?=
 =?us-ascii?Q?fQjh/IsNO3lAeLaPvyg7aTjBaVkX9ohFlH+JW4rob0cLpmavnUe9xBbgslVI?=
 =?us-ascii?Q?n6IMEsMqGg00VMWnnptZKIF/BosqqUFK3ZAUz9frlva7Fo5XeWTDtWf7YNJs?=
 =?us-ascii?Q?PU4r5wyL3uJsoa9wdVTeWY5xtS0StRp9YqGmvICwB5pypm/5wjCr0zaQwJJT?=
 =?us-ascii?Q?buUHxmKWf6wGRUddrIDQMNUM5C80YXwLqm3YYK3cY4q11gpSPbJdn/8I68Nz?=
 =?us-ascii?Q?AIkiyTz+VfYJ6iNwfJHYTv2kH634xTOLZMcgC4Jb615lMTWs5hrC6BoZ7D+T?=
 =?us-ascii?Q?rjZTzB5CUGAOaXK6edi+F40WmECzROJNk+CMvxqpfZYQmZsGDS4HbS2Comzx?=
 =?us-ascii?Q?Aw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07ded725-b572-4517-ccac-08de3330af76
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8907.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 12:28:53.0483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i2yCIneLI1xCGHZjuFIdiLtqtQs9CnMw5dY7i2ANbLkukoXHhWZCBSt1kRrYR8aFUMBHlBm5EewV6NcWWtCz+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7782

From: Iuliana Prodan <iuliana.prodan@nxp.com>

Firmwares that do not use mailbox communication (e.g., the hello_world
sample) leave priv->tx_ch as NULL. The current suspend logic
unconditionally sends RP_MBOX_SUSPEND_SYSTEM, which is invalid without
an initialized TX channel.

Detect the no_mailboxes case early and skip sending the suspend
message. Instead, proceed directly to the runtime PM suspend path,
which is the correct behavior for firmwares that cannot respond to
mailbox requests.

Signed-off-by: Iuliana Prodan <iuliana.prodan@nxp.com>
---
Changes since v1:
- Wrapped commit message to 75 characters
- Changed dev_err to dev_dbg since this case is normal behavior
---
 drivers/remoteproc/imx_dsp_rproc.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index 5130a35214c9..f51deaacc700 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -1242,6 +1242,15 @@ static int imx_dsp_suspend(struct device *dev)
 	if (rproc->state != RPROC_RUNNING)
 		goto out;
 
+	/*
+	 * No channel available for sending messages;
+	 * indicates no mailboxes present, so trigger PM runtime suspend
+	 */
+	if (!priv->tx_ch) {
+		dev_dbg(dev, "No initialized mbox tx channel, suspend directly.\n");
+		goto out;
+	}
+
 	reinit_completion(&priv->pm_comp);
 
 	/* Tell DSP that suspend is happening */
-- 
2.25.1

