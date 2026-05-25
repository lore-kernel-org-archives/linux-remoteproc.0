Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011017.outbound.protection.outlook.com [40.107.130.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF05225A321;
	Mon, 25 May 2026 02:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779675335; cv=fail; b=d7sV+BMtlx6+fDVvjQqciKmHJNfbWB6NDvCoVCDqOePOzAsY5FzN8ywjUDQK4ypAj/PfxcM8A1CTPhMy/W/elgvtUKemLRDVtjQvk2ea5xsuxCooKmcA8MWPnHSnHuHyUric7TQLKiMfeQqU0qlIXKBHRptXkueGY1zocchbso4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779675335; c=relaxed/simple;
	bh=0EJX0R+1hR7xDuWlu0j5IsKQnAT01/X6RZV4V+p0+tk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ezRNpRnGJg0zj3x8rILHm4l4aTaalzyt9XWOM5YplJY7C62AZM3I5YZaFHz1A/5O/pF8g6nN+UpWWy73PmgisxmMwdPZMv/W2W4o+RL8RDqcnbgQkyzC+4eEYX+jdRirL2aaeqRels/n9klV4lW7tWrSbkCVV+XjilU7AO7oALw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bRDy8/+c; arc=fail smtp.client-ip=40.107.130.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bRDy8/+c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gcjgO1QnfRtvCXRrA6wncz9ce8J9GAP/wShEy2sP7qTrYk2EZcfggUUBvZjNd9a3U+XS9t8hbcTh3q9+5FqsP1b43gNO/bzwR1Uiy2CL3gPk9zl7vL6dLH6NEofLQ8r7uFuwcWquKo9k036SbT0W/TBwTVt/dKNdvsbIgzpr6jyO5jwynHGfamFGGIvJ+mthaYQxCA3s1rRYgL2mfqisd5P7q4f/4lKqZ4udOF/7uvksHHp8/4YXzEdhP7ekDi8eBVkhzRcN7RxsgHnMxXvVRYlOuUxuv5N8h4ZW5YQk0iVTLLXT4gx46YPdjthHlpp7LpevBJlU7AV44eiIicwsGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wvjta846qP8qgQGodC5zX4cHipJwcjDKsuWBvxOD0+E=;
 b=m/KSwQhf6KGYvq9Tdnp3/utoo/534QvNlfn476KhFy+o1TGnpqmLp4XkDhIbg7gkpywGYBMc1ae+b0hUw19F+0CwswodHarR/PlOk8RgO+OAZtsP9GxZHMUWUlmZ0dB/XPu8ZTnDVnUmS1kyc8uuZOirAVLC4Ox0asYSeJwqe4gx7GzI9QjbPWvL8/Je04W+hf1pPf1e8t3dea1/VWCvuCFy4PoQ0XNTIfbbERqbxT/gJlj4Hpa1kvR9vYCTFvT03hvIEJg05xFP11UWCvLMt9qB3mC/ARefky/zZLpBg6PbUTQhjYl7L+QFi0SiMjht+0BLFDcTg5CIlrQ6YP6LNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wvjta846qP8qgQGodC5zX4cHipJwcjDKsuWBvxOD0+E=;
 b=bRDy8/+c/0IHGpNDBFhVTYQaRi7VShdE9djKq92kDLcTgUB1DN+zgeI1ShEZPplZMiOS8ecI5m/CBqo05s0nzpFS1zLu7LCzia/e5IwmTDf0srHi20ZoW1Ue7p3DTwC19Oqk7KSAz2BdHTAyxKna/bSV/wdL+4MMIRuHnZKHcfjipdKTQK738wxSdIEHZKAsd/ZmWTb37mA0TnBjP18XtL2elZpDuJVwoAMjWPaLVPUkEjtfyHoP/OJxGaWVb5pJRP4O9Q9pZFEL6P1wB01/sS5qAj8JEaRVQ24vPeV5QOH/UxixkH4wFNm1+mYIUz1+sEWL9Dg9JA9sfPbA7DQ/qw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com (2603:10a6:501:7f::23)
 by AM8PR04MB7346.eurprd04.prod.outlook.com (2603:10a6:20b:1d9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Mon, 25 May
 2026 02:10:23 +0000
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889]) by MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889%6]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 02:10:23 +0000
Date: Mon, 25 May 2026 10:13:15 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] remoteproc: imx_rpoc: fix carveout name parsing
Message-ID: <ahOwO7LBXCYFIngw@shlinux89>
References: <20260522111849.783-1-laurentiumihalcea111@gmail.com>
 <20260522111849.783-3-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522111849.783-3-laurentiumihalcea111@gmail.com>
X-ClientProxiedBy: SI2PR02CA0053.apcprd02.prod.outlook.com
 (2603:1096:4:196::16) To MRWPR04MB12330.eurprd04.prod.outlook.com
 (2603:10a6:501:7f::23)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWPR04MB12330:EE_|AM8PR04MB7346:EE_
X-MS-Office365-Filtering-Correlation-Id: b69a8b09-2f93-429f-9c98-08deba02c74c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|7416014|376014|52116014|366016|4143699003|11063799006|18002099003|22082099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	7iQ+CwhOjvXEjCrngJOoqbMmDtJDswvLFAUcJZzmJk+Ifp1pRDKQNvSROBzngCHm86YR9wWerbGinbZwZNmPmrv+BDHMX6fN7RhmvwzA4+wlsw1zeH3KAohcD5h/cNRL/BPtdDYdrxe2tlG7FApRmqn039e4Th0zlrRe/QnBJi4kKeEvR+52z7FcoGtLehe7PMUmHtQS/eAHcfRQqHs7nCc00HieVif97Lo//VfayfueLN/mUm4nx18GBunzSPZyJlbsZuJd+d3IWRCSIbNaLkAsffgFB6NCSaAIvJV6oso8idxgs4HJ12fBDdjqBi7A+lzHhESpMYrCCecRT1j0i3guWAaAII1DrWE/7jRkYw3399N9YrAV791dNXEseNSlZObOocDj4geahCs7qZZIskWNlWn6uIESdbqmemF87Q0ALQwroQlOstgiobhhbZyFiXHZlaSAcZddL7ElC7g4UibYu2gcBnxd3jnjjm30Ym5SLo969y9aEpGaw8U3o3zxpX5G+YX7osQHiR/C9cUSbilc3NtEGdPL7ZG2Gi1KGjlQ3vjfaODCXJ/V+SBecq3s9MaWYbpheCGr/Wvvkk3hxaEY8uj0wM4k3+wm1bF3cz7JotVdlk7laoyvXmdCVe09jCblwDF8OU5eAVcliihr3eRvzZDzR7Aot3f/d7zwBx3zVOA6a6qXw3D6+mfMv98dkMpH7MddNAbWc6zR4Rl+NgyHeXIQUkTMnWWj92fOG7HrzrmcD+vKorh7lrcvwHVC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12330.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(376014)(52116014)(366016)(4143699003)(11063799006)(18002099003)(22082099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dqXYdNLMxyrIU7S3RZlTb2otnkuNQwm+w0MFXkGOt81kBuQ+VmlIx9v0WmY9?=
 =?us-ascii?Q?jnt5C5JQXrTvu6EFYsfV5/bZYCF2uRH6y6F5i9lSmEnmnlqLsJq6bvp2jQ0R?=
 =?us-ascii?Q?KXHG4SeHH3YtBx5fEYyrfOsaas69m4qDXUYKtIECTAwftHCLnLfGfBfwIN6b?=
 =?us-ascii?Q?WlA+CIETtadORE4JnCG2EqEYg3eEQFzNFKV1tktCVR9EAl7g4estk9ZckJya?=
 =?us-ascii?Q?SBwZP+zbxtM+Nzo9oQB0kPxkFcQq9eN35CwAgpo2s24GpbWfx/+4x01t8hVC?=
 =?us-ascii?Q?VmY69UVxseNGwJkkJjx5rlRDX/wXDI0DtZd+8d4KUOeP3lALZBfvCQJMaRM1?=
 =?us-ascii?Q?OzQ8T74Ayqv0lLwvpzuOaT3LcUTJz9F+JgorKSNlhhnfzYEVOm2oDDFr2aGg?=
 =?us-ascii?Q?SniUSyT9QoMUb3f1ee0j/+zgyfk7w3ifgRIXPQOoOlurG4BLNAWxOvNDYGMK?=
 =?us-ascii?Q?cBdOPINGHgL9l9dTIzH/fSZpaE9fW5PZGIJFkk86KIizHmJn8sVKnit2aNlV?=
 =?us-ascii?Q?KG7q4NiOuK502YcGtJH5sz2ZZ7IxFIhwxUg9fYMrAYZCCmMi9FCq6HGqua8x?=
 =?us-ascii?Q?2+XLfvjELeiEJQh77aYctbtzwvLVCxLvp1Ib4hx2NXq88RrZubrQ+Oh6dTBe?=
 =?us-ascii?Q?qhlNMVj52zKUELkuUSGsrLmKIOjxSPET68rD6xhqwCGGLi/NWjc1cDMo8pVG?=
 =?us-ascii?Q?r5crAhQ2V5+InOeKS9oPtQ+uq+iMtV8QQd2WYHePeB2B4EN5ltpkCMg4i/0/?=
 =?us-ascii?Q?gmc4l7Zdi8OY1QFYlioUTppsoqYNJxOSXMkEA60zNX8yrXzjJLgjyO2hooSv?=
 =?us-ascii?Q?IyWd2joHQ9QrbUSc1//rdQtDCBqhdm3h19zW/zQQUdlU1lDZPJ9VSUyZUS4t?=
 =?us-ascii?Q?Z4wfwsdOXgZeJEZ++LllAXZ6AJEl7EV6mV7Bb76+1qKxLf1K5z6F9APFUoLe?=
 =?us-ascii?Q?b7Kwk2yiAZGmi2ONNHupWKC39WIFxIBdDA24v1kw8xRqDsQa7a//71eOCw/i?=
 =?us-ascii?Q?IkJCs0yHu+7kpNsw5zenP9tFh7MHeAkra4OsYw/OdtPPYTzaPFvo4ei/y0t+?=
 =?us-ascii?Q?4rkED1kHebKCnlQiPkCZ8JBPKE3Z5Bhbxc0Wt/GBE3RqSGDe5p8S30Hxr6ha?=
 =?us-ascii?Q?+vhBh6WBzBh+LWpWI/eKjXEewfx98J70legMego/QdaDACPHC1D03HduyKXO?=
 =?us-ascii?Q?Xvelvi/Iq0qnfn1EaikA7+PcS1E1wUGz8KLIeS9aqbRRSona6H/dE7wbnF2H?=
 =?us-ascii?Q?Z9+GdtrgK6AuQzxNXEdfrrnlCTvmn9M4DaOZTOuNYnaOWXkxEv0vzE/JRn7U?=
 =?us-ascii?Q?VJkhWOnV+1efSK/M5EzRCgsccU9tFoD48YU7R7oT+x/mNRWE6wW9ImqTzI40?=
 =?us-ascii?Q?eDVoFpKQ6N+bldsvGMN77fVag5/1RV10BaqYTLa3ykvGSWGO+/jcZ9Z7lxBT?=
 =?us-ascii?Q?/N6rzakxPZeFubdL4a3rbbruv8rVZKZ1wZTuAtXVKmCiY4SuJ6+ynjKRBdET?=
 =?us-ascii?Q?QOxeJV1TCEUIOqG/UbM9KbyQDPFL1AAWOElVjpYhlphjuTVXO0w462+jHMFl?=
 =?us-ascii?Q?fkPnClhVzfChmRzafol/L7+lM2XfwhA7gzXYrDv8p3Fn6rI2wXN9akYudJQk?=
 =?us-ascii?Q?YdtGoFIDU2hUUX25qnKJ5bPuPn+1x4SldGav+ga5K+fMg6mbdkka5XUy6iQ+?=
 =?us-ascii?Q?7Vkn8oduGfJJAGElXvAO2/pM+LS6JHv+/kBFZYTurrPAO1WCPxcxok3oaMiq?=
 =?us-ascii?Q?vaMjPnB3Cw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b69a8b09-2f93-429f-9c98-08deba02c74c
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12330.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 02:10:23.1033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PKNrIw6Wdsq2mtNCM/tr7bQB6+k13c2Y4QnJztVaeZjW86O67LBIEaENZg5SHk9z4lpNN+YEgSDK1Ay8Y2uVgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7346

On Fri, May 22, 2026 at 04:18:46AM -0700, Laurentiu Mihalcea wrote:
>From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
>The imx remoteproc driver assumes that the names of the reserved memory
>regions reflect their usage (e.g. "vdevbuffer", "vdev0vring0", etc.). This
>conflicts with the devicetree specification's recommendation, which states
>that the names of the devicetree nodes should be generic.
>
>Therefore, instead of relying on the node names, use the names passed via
>the "memory-region-names" property if present. Otherwise, keep the old
>behavior.
>
>The definition of imx_rproc_rmem_to_resource() is added to a common place
>as imx_dsp_rproc.c can also use it given that it suffers from the same
>aforementioned problem.
>
>Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>---
> drivers/remoteproc/imx_rproc.c |  7 +++++--
> drivers/remoteproc/imx_rproc.h | 19 +++++++++++++++++++
> 2 files changed, 24 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
>index 7f54322244ac..1ee1c658dcc1 100644
>--- a/drivers/remoteproc/imx_rproc.c
>+++ b/drivers/remoteproc/imx_rproc.c
>@@ -672,7 +672,7 @@ static int imx_rproc_prepare(struct rproc *rproc)
> 		int err;
> 		struct resource res;
> 
>-		err = of_reserved_mem_region_to_resource(np, i++, &res);
>+		err = imx_rproc_rmem_to_resource(np, i++, &res);
> 		if (err)
> 			break;
> 
>@@ -850,11 +850,14 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
> 	if (nph <= 0)
> 		return 0;
> 
>+	if (!of_property_present(np, "memory-region-names"))
>+		dev_warn(dev, "using node names for carveouts should be avoided\n");

Please check 'memory-regions && !memory-region-names', some demos may not
need to use memory regions.

Regards
Peng

>+
> 	/* remap optional addresses */
> 	for (a = 0; a < nph; a++) {
> 		struct resource res;
> 
>-		err = of_reserved_mem_region_to_resource(np, a, &res);
>+		err = imx_rproc_rmem_to_resource(np, a, &res);
> 		if (err) {
> 			dev_err(dev, "unable to resolve memory region\n");
> 			return err;
>diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
>index 0d7d48352a10..58e9daa41afe 100644
>--- a/drivers/remoteproc/imx_rproc.h
>+++ b/drivers/remoteproc/imx_rproc.h
>@@ -45,4 +45,23 @@ struct imx_rproc_dcfg {
> 	u32				reset_vector_mask;
> };
> 
>+static inline int imx_rproc_rmem_to_resource(struct device_node *np,
>+					     int index,
>+					     struct resource *res)
>+{
>+	int ret;
>+
>+	ret = of_reserved_mem_region_to_resource(np, index, res);
>+	if (ret)
>+		return ret;
>+
>+	/* "memory-region-names" is optional */
>+	ret = of_property_read_string_index(np, "memory-region-names",
>+					    index, &res->name);
>+	if (ret == -EINVAL)
>+		return 0;
>+
>+	return ret;
>+}
>+
> #endif /* _IMX_RPROC_H */
>-- 
>2.43.0
>
