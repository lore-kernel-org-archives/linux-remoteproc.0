Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010027.outbound.protection.outlook.com [52.101.84.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE2E2F998D;
	Thu,  6 Nov 2025 07:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762415762; cv=fail; b=qM+kbU8Tj/sN9hJSa4JKcNXHhzrJk+/tSv8DKR195dqGy/Q/4DnAYO8XPOu+AR5ba4vo6aqjyk4+Ve4p7hr0zoniB3gHnoD0YLaPkGEIQM3AAmnr8HbbaXBFz0SSVCiYrDpnOE2gOTedE6Y7uMAsxaVrJeOnRuZ4OYyKLIqutEc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762415762; c=relaxed/simple;
	bh=aI+GvRt47RY7eBci6ntF4ji+bIeAj7RVswYGC+LlSiE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Px9b/WxagF2F4KKMp4yWt+fffYI9cFTaUUQy9VeK2lUWNrWg9reoWoOOskBA2nb1ibTQyLDo6mWG8Y5ZQtUmUDCUfjBelK73lqlJR/+ERoohw+8U7TzoqSdK+NexpWLZVN47xH/YQ5sozNy9I0RfkAXCE7iAF9e5i7lhyWrE73E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=u9qc0e7i; arc=fail smtp.client-ip=52.101.84.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="u9qc0e7i"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q8O/K2loK3FZEqzkGYqaf8ITlu4HBE08pE2lc1gLz0LoVlpd4qdZqECyllQx6GdjVZ3MuJo4dJ6ZbDlKu4/44znYWxc1VhPKKzAUvBH+HPQsl9gGHXgmLyjgd6KTZAZvBp/mXDfaSKgg/zQWvU3XuhE2UP7DGOxsJFUCV+pYvVynZA8qxn/T9nJE50rMnY1rExLhDVf7wTXcyv9XDW03T58w1fYpyCidPtf9FiKnEHVW9QgM/xCmm9i9IqY2rYRfwJ0oXnhmGV9pjK4UFz3Y2V2/1y+/wk9LupcXDkK9pHJB1i5jk595TUcxL0eHLGVGRcmI1HAIXlSLWu33zHdJfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o7SzgcoiXFRUONXhFf2CUmb47KrynASCIhPoJucjRuk=;
 b=pfeM1v22OlkewCxBRT5YFnW2zps4cTvxw84gSEVxU40payIqCZQNfyK8exmi/hnjzQStDbVMq64aXcMuzMgCsO5nMbboY9lAroOIoXoiq2wg2EA/pcapO+j+rAsDtb7xEQU4IS51sOAtAxunwyIqZSP2bFvlWiHjuPlveByNlNbZBW87/O/ulVWDUxxKcBsI+NwdGeRrtW6Bed310p578WhLtHS2sx7EoyB5El9kHng5d2+yGkr6DMHdjyhfcmOWf8VidHo5QnUprXwahLlTQ+OTFD2b2k4zTOAI/JYRxHSo0vBjGD9db3PA94cXTwBOvc4GCpnPLaNHJQ/12fKFIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o7SzgcoiXFRUONXhFf2CUmb47KrynASCIhPoJucjRuk=;
 b=u9qc0e7ifHWpH9Ke3JIYYPseWKUNkc5C0xUu9SHk0RCbV2q1vUGteRW2F/41dNgl16N+/BgUiyqeepW2GRNqo+wnRDUWgYqrd86a41WG0bRU5hlTdCMqQuPwrkRpURpdY1DQG1KhX5v0d3dCzBSdfpQ4RdWR40WcCWB44N/DeXEia9YWkx99KFnVVhvisoP5hYOPDxfvYLoaeHdgDfyUPr1it38yaMRAeznGk+1kAu/6Ua63cfPL3ZnhBjLOe2VKocj9IGeX0yeEzjH+KPTJFzOR+w6qnz9oyOAXNirrhPUx7inETvrGSxp+Rgdo3on139glRSMpIHTMuKXIFLYedg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU0PR04MB9323.eurprd04.prod.outlook.com (2603:10a6:10:356::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.9; Thu, 6 Nov
 2025 07:55:55 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 07:55:55 +0000
Date: Thu, 6 Nov 2025 15:56:38 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-imx@nxp.com
Subject: Re: [PATCH v5 2/5] remoteproc: imx_rproc: Populate devices under
 "rpmsg" subnode
Message-ID: <aQxUtqkvcH0ob2yq@shlinux89>
References: <20251104203315.85706-1-shenwei.wang@nxp.com>
 <20251104203315.85706-3-shenwei.wang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104203315.85706-3-shenwei.wang@nxp.com>
X-ClientProxiedBy: SI2PR02CA0037.apcprd02.prod.outlook.com
 (2603:1096:4:196::8) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU0PR04MB9323:EE_
X-MS-Office365-Filtering-Correlation-Id: beb0b09e-e02e-4240-c644-08de1d09e9b8
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+meb8kpxXMlotwdnPh+SuxZay/tMcobt/Jp72BMA5yVwLSiMMJ99YFcXfx/l?=
 =?us-ascii?Q?G9waSLEAS7Ml0hdgApheeCKY8IR40q5PbLm7uBiF5P1TDsClAEJO4cOtcsyu?=
 =?us-ascii?Q?wwLkI69WB71ZrVcIBiEQtMBLZGlw2YFLUTtFOwXXiLhip8PIdMCLtVGd5kAt?=
 =?us-ascii?Q?+pHWqVDCq832soQZZMfckTAGqgyJlFs31Sk7P8PFj7z/SLDsTE7MYozKTgyq?=
 =?us-ascii?Q?9vq5c/y6gd824CX1Dn3OsWnnYQo/Yql+uRkQ2FeRsezldmsrQOuLiVRLDndg?=
 =?us-ascii?Q?G7VXo91ldboKMbUIVzEIGZAL2+0wyu2pgod/Z8VODw3eDMHPq3/7dFx+hZr0?=
 =?us-ascii?Q?RL80vStpaeD4a/5JGsaqfwfuZx7d5oDG/Uu8W8RBOQX0fv7WyxIRKpShl9p8?=
 =?us-ascii?Q?ULn4eqNJRf9EDXE1+WWVijZoJpY/0d/fTSuzwWtRmsh3v+w8oGT0bdjl+Cm7?=
 =?us-ascii?Q?DiTBb9DJ7z5rZi3ai/q5ZFhxoavKAmwXdFu1ohWYMHbOEsBjj7ZsJwrLsyao?=
 =?us-ascii?Q?A7WyNpaEvGEL42qJz6UIvk4bvXzewPwy3i05RMkAWaBZqgvswaUb+d3tAa87?=
 =?us-ascii?Q?cnRB70h/tD4eJQ/r76mrxGLzf5+EVcxrduUSB6IpcAITZfm073ADwpNqMraX?=
 =?us-ascii?Q?yCx0mJkov7dh3VRa77DrBPyN55E7mZnq3wvZqN6CoF9RIMxZU3NUoWOzg2mF?=
 =?us-ascii?Q?jhxEzKmSKGfjCYh1bwZv8tQJxaqCuQcGZQZqz9MBcFUH0jQhbp1Msx5XZY3f?=
 =?us-ascii?Q?nAKdC/at6f2nt24Cx33lZkWIAHJMjm2UgxsJXh7Tdm2S6PNKHpuq63wXTBAt?=
 =?us-ascii?Q?vGIxFrU+9PZa3vm6eyOdD3wbBA1bywUlOxqETPpMx9jtBN+ecqpgqEZj0EUY?=
 =?us-ascii?Q?o2YIFb0BeZ1ObomE17wDF1paNF7RtOuHVjjVuYaBKHjcjq1hJKyCF7nySLdS?=
 =?us-ascii?Q?q15VDb0oZXNKdLpllZWQl0ccAqgAmvds46dxksajFI5nbyR2X5Vrqt7sWWx3?=
 =?us-ascii?Q?X/LBB+n8Uy0RG71a3+10AWLdmI96KLAgujKuwAWHHmwvih3eTM5vWibHXr9P?=
 =?us-ascii?Q?Nv5vlin7IubekB1tGqNBr9jKgbh4ikMQ7UqialIhrnLr3qNHO8XAXv7nGIKh?=
 =?us-ascii?Q?485TgS7vFqe1C2z6PuIcyRhq8ttfSYTi9fGacDExVc/vwr4Rojri0jOKnNRW?=
 =?us-ascii?Q?QotBgLktukiFSJ1N/B6TbPchVCkOnqKCP4VIRyEaHNoYFvgiSphEPZ7AgNcn?=
 =?us-ascii?Q?tGAW8NwZJ7X0u3Wf2xn2jjshV2uNaKRDIKx74vDV+AUKmJMrgiP0uD+mvlb9?=
 =?us-ascii?Q?hmbMgvvq802YPEhJ1bqxV0s16d3nEwgua0e6BKvjfQrRBO/v6NsctM5lgqta?=
 =?us-ascii?Q?HsZAoz44KmaFzFScbgkFR+7Fj075OMUEIbOxIHYmPocQ23HdNjDjVcsPbya4?=
 =?us-ascii?Q?xr2jrDMkFM0oQ6JygOl/LU5NEnG0OQ2cxbFsCM/EX+/CDMHrLfAqDLueuaW9?=
 =?us-ascii?Q?N4V5uqk5e2s9dM4DdnG96tagzeb4zRr9k0BR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nd986MzIv2ZE/f8+cHCjs9dz7cCYCleO62og2wbIitZleejKgOpKuSmOefmA?=
 =?us-ascii?Q?mYHtScJLUCLAAqSZDEwlKWz8gke/9Fyk8TUeChZe/690h2KR7ifZ+LTA9Fcn?=
 =?us-ascii?Q?tgk2msydo5rZaLQx+gg9ajTApSdNsh+BEAIBW1yupg9VJxGZPLa1tuRngmHB?=
 =?us-ascii?Q?GB8IVQfoGd86Pxr2hBHPtdWsZykh7BnrDMpoOc8u9A+A3uT9iydGstdAci/S?=
 =?us-ascii?Q?HlFKBDh0aJ+MFGV55paWBceluMBrunLZhgWFpf0/RwYHPlP4BhXBnrO/4Sbc?=
 =?us-ascii?Q?08qFOPDuO5e/lVZvu72hRWmqdSl0kT7gTbSN3VwdsxUpul2NJgYCJdDl5MSN?=
 =?us-ascii?Q?4xQNmSpX+6HCGnE7SBWRgm/hf66u4aH7uq42DLvy6mGenId473DeI5w5u0MU?=
 =?us-ascii?Q?vXBRCtG+k6UsmsxN/NLWqVqnfw44SM7BtpJ2+AyY7U+ilQ7MIbCFcgwWbbM8?=
 =?us-ascii?Q?rGYa1id10FDWyohe0ecRHxOS+cJ2IXluP6XOhkgszQXBwShrS86mQgnvYZ0N?=
 =?us-ascii?Q?0iAYgDhw0dbYdP6+2ZOXwKfnE+6AQBfOCj5wEcLt5YKyxyI1rAalomPzupIl?=
 =?us-ascii?Q?e1D0w4adRyiTek+Hc1/wt70gUiLQZsq0m1VkLcYLj2pxHHkE+nnD8X9wJKGk?=
 =?us-ascii?Q?fnNm3vUhg5A/zGdHoZ52c62CzktlY9HNWg3lRr5jsYAv7CuJqw2kuSwhYvCL?=
 =?us-ascii?Q?uF00y3N98qdBZXU52usanzPuFoTccbJJP6Wfth9IedgShsnlUSotU4tU3iNa?=
 =?us-ascii?Q?Gz5TBbmDlYiR5oE3XaRzXHWNL8ay1Ae0BxNxBbUYJlgUvak8+ahl788Qj+WA?=
 =?us-ascii?Q?6Ql6W55mR+IdaglrRCbxkVCwQGQPzNywDk+jVKosBaXrxNp9Tng7OGdIXdQS?=
 =?us-ascii?Q?OuIxYyoDA79g6p2IFgKoGdByq3hJIWMDB7rSBqgMp4+gUprmPIjCL6nJ9Ldl?=
 =?us-ascii?Q?ME5LR9HOYHYtAUE4BwKgz2nI3LCS8O8w44z3e22Fs5gaq/a5XtfIdgkw6BPg?=
 =?us-ascii?Q?fzLQhrEEmkmJIcr/quNUa6ViWojrt8icvvTnrsKwjP1J6J4QPmvB/KItKJ2N?=
 =?us-ascii?Q?4fZbFA73zSxy5+HYnYkoPhwMGTKtKXRNaEiGu0mJRym1RtGXaUzR6kwYrU0L?=
 =?us-ascii?Q?4t4wuU6y1+KdfzFWIfWfRk/ekOts0FK9u8iFNUuE7C35i76Y4ro1iyO7PBxB?=
 =?us-ascii?Q?fJ5YnB8IQzqYQwpeZVvWP6hoLJL279ZpA+vKZ/iNjmFuTooV9YiF0JoDHbFG?=
 =?us-ascii?Q?gv2oKsEPjYtRMlEcQOEyVoqb/NNWhsjLSqhLQjvWv25c5wE+DqohHN8E76TR?=
 =?us-ascii?Q?3H3HAJPq8VpShFA6UfG1wEVZLVWLoJUgDtZMsd7B2YjCOcymhW1xN72A8jHS?=
 =?us-ascii?Q?xUiOk/+hda/O7/g1gYdGLig/RkFox2z3xq2qkaCmW/wCpA2wBeFq7d6lWRc3?=
 =?us-ascii?Q?+K0pcFW7oSyiKY5gNKC5hknHbIEIsSNM6VLZOi92NWGTnjEOfD+bEFr7cMWf?=
 =?us-ascii?Q?fY5RNlIm3WiSCVQ4GogcJco9bN5UUkhNGP8odjeQ9shfE1u/JVxqAb4jMKUu?=
 =?us-ascii?Q?1FqFC5jRK7J5xe6DmGSYB0/p5Ah3bkK7wDYzPv26?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: beb0b09e-e02e-4240-c644-08de1d09e9b8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 07:55:55.1856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OSBj+DYVv9+8+TJDhd3UqL98DIq+RjGuqHh/NIVf1g/k20MGkTbKTKCR/VHoVuqJZS5Ps7swviA88I9CPN0DOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9323

Hi Shenwei,

It looks good to me, only a few minor comments.

On Tue, Nov 04, 2025 at 02:33:12PM -0600, Shenwei Wang wrote:
>Register the RPMsg channel driver and populate remote devices defined
>under the "rpmsg" subnode upon receiving their notification messages.
>
>The following illustrates the expected DTS layout structure:
>
>	cm33: remoteproc-cm33 {
>		compatible = "fsl,imx8ulp-cm33";
>
>		rpmsg {
>			rpmsg-io-channel {
>				gpio@0 {
>					compatible = "fsl,imx-rpmsg-gpio";
>					reg = <0>;
>				};
>
>				gpio@1 {
>					compatible = "fsl,imx-rpmsg-gpio";
>					reg = <1>;
>				};

I think better drop "imx" 

>
>				...
>			};
>
>			rpmsg-i2c-channel {
>				i2c@0 {
>					compatible = "fsl,imx-rpmsg-i2c";
>					reg = <0>;

i2c channel could be removed, it is not included in this patchset.

>				};
>			};
>
>			...
>+

....

>+static char *channel_device_map[][2] = {
>+	{"rpmsg-io-channel", "fsl,imx-rpmsg-gpio"},
>+	{"rpmsg-i2c-channel", "fsl,imx-rpmsg-i2c"},

only keep gpio and drop imx.

>+};
>+
>+static int imx_rpmsg_endpoint_cb(struct rpmsg_device *rpdev, void *data,
>+				 int len, void *priv, u32 src)
>+{
>+	struct imx_rpmsg_driver_data *drvdata;
>+
>+	drvdata = dev_get_drvdata(&rpdev->dev);
>+	if (drvdata && drvdata->rx_callback)
>+		return drvdata->rx_callback(rpdev, data, len, priv, src);
>+
>+	return 0;
>+}
>+
>+static void imx_rpmsg_endpoint_remove(struct rpmsg_device *rpdev)
>+{
>+	of_platform_depopulate(&rpdev->dev);
>+}
>+
>+static int imx_rpmsg_endpoint_probe(struct rpmsg_device *rpdev)
>+{
>+	struct imx_rpmsg_driver_data *drvdata;
>+	struct imx_rpmsg_driver *imx_rpdrv;
>+	struct device *dev = &rpdev->dev;
>+	struct of_dev_auxdata *auxdata;
>+	struct rpmsg_driver *rpdrv;
>+	int i;
>+
>+	rpdrv = container_of(dev->driver, struct rpmsg_driver, drv);
>+	imx_rpdrv = container_of(rpdrv, struct imx_rpmsg_driver, rpdrv);
>+
>+	if (!imx_rpdrv->driver_data)
>+		return -EINVAL;
>+
>+	drvdata = devm_kmemdup(dev, imx_rpdrv->driver_data, sizeof(*drvdata), GFP_KERNEL);
>+	if (!drvdata)
>+		return -ENOMEM;
>+
>+	i = drvdata->map_idx;
>+	if (i >= ARRAY_SIZE(channel_device_map))
>+		return -ENODEV;
>+
>+	auxdata = devm_kzalloc(dev, sizeof(*auxdata) * 2, GFP_KERNEL);
>+	if (!auxdata)
>+		return -ENOMEM;
>+
>+	drvdata->rpdev = rpdev;
>+	auxdata[0].compatible = channel_device_map[i][1];
>+	auxdata[0].platform_data = drvdata;
>+	dev_set_drvdata(dev, drvdata);
>+
>+	of_platform_populate(drvdata->channel_node, NULL, auxdata, dev);
>+	of_node_put(drvdata->channel_node);
>+
>+	return 0;
>+}
>+
>+static int imx_of_rpmsg_is_in_map(const char *name)
>+{
>+	int i;
>+
>+	for (i = 0; i < ARRAY_SIZE(channel_device_map); i++) {
>+		if (strcmp(name, channel_device_map[i][0]) == 0)
>+			return i;
>+	}
>+
>+	return -1;
>+}
>+
>+static int imx_of_rpmsg_register_rpdriver(struct device_node *channel,
>+					  struct device *dev, int idx)
>+{
>+	struct imx_rpmsg_driver_data *driver_data;
>+	struct imx_rpmsg_driver *rp_driver;
>+	struct rpmsg_device_id *rpdev_id;
>+
>+	rpdev_id = devm_kzalloc(dev, sizeof(*rpdev_id) * 2, GFP_KERNEL);
>+	if (!rpdev_id)
>+		return -ENOMEM;
>+
>+	strscpy(rpdev_id[0].name, channel_device_map[idx][0], RPMSG_NAME_SIZE);
>+
>+	rp_driver = devm_kzalloc(dev, sizeof(*rp_driver), GFP_KERNEL);
>+	if (!rp_driver)
>+		return -ENOMEM;
>+
>+	driver_data = devm_kzalloc(dev, sizeof(*driver_data), GFP_KERNEL);
>+	if (!driver_data)
>+		return -ENOMEM;
>+
>+	driver_data->rproc_name = dev->of_node->name;
>+	driver_data->channel_node = channel;
>+	driver_data->map_idx = idx;
>+
>+	rp_driver->rpdrv.drv.name = channel_device_map[idx][0];
>+	rp_driver->rpdrv.id_table = rpdev_id;
>+	rp_driver->rpdrv.probe = imx_rpmsg_endpoint_probe;
>+	rp_driver->rpdrv.remove = imx_rpmsg_endpoint_remove;
>+	rp_driver->rpdrv.callback = imx_rpmsg_endpoint_cb;
>+	rp_driver->driver_data = driver_data;
>+
>+	register_rpmsg_driver(&rp_driver->rpdrv);
>+
>+	return 0;
>+}
>+
>+static int imx_of_rpmsg_node_init(struct platform_device *pdev)
>+{
>+	struct device_node *np __free(device_node);
>+	struct device *dev = &pdev->dev;
>+	int idx, ret;
>+
>+	np = of_get_child_by_name(dev->of_node, "rpmsg");
>+	if (!np)
>+		return 0;
>+
>+	for_each_child_of_node_scoped(np, child) {
>+		idx = imx_of_rpmsg_is_in_map(child->name);
>+		if (idx < 0)
>+			ret = of_platform_default_populate(child, NULL, dev);
>+		else
>+			ret = imx_of_rpmsg_register_rpdriver(child, dev, idx);
>+
>+		if (ret < 0)
>+			return ret;
>+	}
>+
>+	return 0;
>+}
>+
> static int imx_rproc_probe(struct platform_device *pdev)
> {
> 	struct device *dev = &pdev->dev;
>@@ -1177,6 +1319,10 @@ static int imx_rproc_probe(struct platform_device *pdev)
> 		goto err_put_clk;
> 	}
> 
>+	ret = imx_of_rpmsg_node_init(pdev);
>+	if (ret < 0)
>+		dev_info(dev, "populating 'rpmsg' node failed\n");

In best case to make this generic enough, an generic function
could be provided saying rproc_of_rpmsg_node_init() in remoteproc core
or rpmsg core. But for now, it should be ok to keep it in imx_rproc.c.

Regards
Peng
