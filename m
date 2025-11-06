Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011057.outbound.protection.outlook.com [52.101.70.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD743009E2;
	Thu,  6 Nov 2025 08:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762416685; cv=fail; b=RpLA6JzGtC13VRKyHBtLSzh8W4K0rl5uWfRYypDgD1XdeZIUArdkDfkn07NlsCULa01ISvr1MW8/IvutxYL0mKAL3Xk/aCPqqslW6IrdExoZdfa+p6WTY5gw3xkskr0+Or0W5bfG1DpcBd72Vxw9jb1jT8QRdfkS/k0uUbIV0Ko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762416685; c=relaxed/simple;
	bh=CWiFC+mlVsZIaCxPUB5IXAJ69D+1oTFmZzWQO2eBH/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lX9heEcG6mN95kP1GeVba/9hYl4RYYVlCAWDvbsDVdZI8OyZCeyPwB1fMNyVJp4WH3+8S9MXpAkhdqMmrsf5Hn5JIhO89uGsBBOJtd7RcnAagAx1ad8w6vtv4D0j1nbBLX+N4+QWIu0ddls0SjAc1xQZ6wrxwDHnnDe29gIz7CQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CWm0QPK9; arc=fail smtp.client-ip=52.101.70.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CWm0QPK9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=epvA3VlrCqJAcxq1HHShqwnkMIDeLVCxPZ5mf2NgF2pHm4H8P2h4BlGOSovrOtUHyBNYuZFbUHLbJd+X0ZxZZ0KuYfG7BIzmUEhCBwTOUrvOvZhstWgNMQqre5kmpfkENHHPJK4pMs9ADjyZB/tBnHi2rfzIQsbMseutlAhb2zajdseNN3Oor7e8skP6rmeQyuMBZV3pHrYoapOC1G4sKnVxe1Zcfm701y7scSN1N3ZWJU7c5mgPse1qhDQH6aG2HDJbO9t/7OctU9Br5MOD28NKXuyMZmJ8+9l6KnvOWCCJ7c5jV09Nnb0GFOlAaGW6W3yJnfNGfoUdQ+clvDrY4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eSvqKvuRYnnqc0g1AAY5YP/eDbwIrO8ljMhMS7PfyhQ=;
 b=F2IUcC2BzWn67JkN7V4PEEz/LpyeCp/lu35cqJggXxD3iQy7E3FN7xRL1yELzKxVFgVUSYjNmTsbNOTo+4vef/3sNkfUfxHd9DuaVa19/y6uUQljh2C7Q+DSxKSjp1+RJq72JV6zhU/IxsZ0131NVLU2bn2r0Grdzsb3mZ/u29w+MgAmbI+/9yVCCUCJSa37ghpuUJfuROIBLWsVh3NyqcFcrafZ5JaD9GNg/znVvKhEQcnBby/gCvFlAzJ/H/zHv9oxXX5AM6+ycc8d2dRgurYPnwlkYKFjeSzn229nzdN9Yxlg6OPgyUGT9G7Va+8cQRj7HitUYQGc0hNfHZMxWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eSvqKvuRYnnqc0g1AAY5YP/eDbwIrO8ljMhMS7PfyhQ=;
 b=CWm0QPK9QKsk0PA7LEHdI0B3P5Oxj43pYajUHLiEIwRgWERSCcxV9XHX7j/uS9pVRl/yODjzlK4mMzwdVFVtG6oxxSBpoxrrnJ3u5COQ99TqcgqZjJ4hEWwAEafGNG+WN1I2osuh/VS8yKMFSfMDa4uuuOMednwXkVYg+fLXeK0tArl2mSONx5uHYc97iNW+8cUl21H5V3od5xjzKbhaB0JPnJpyvAIv566k+ePdFY3rmiKPkS6nrR7vkoxu1IICumc/zpUhrctF7TPJaksdP1FOmFN6FZbi6VQN6hdJBvSLU3fpathhP3wkoBNSf34QEp4oyeXW9mLqCRj58A/VZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB8396.eurprd04.prod.outlook.com (2603:10a6:10:24a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 08:11:20 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 08:11:20 +0000
Date: Thu, 6 Nov 2025 16:12:03 +0800
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
	linux-imx@nxp.com, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v5 4/5] gpio: imx-rpmsg: add imx-rpmsg GPIO driver
Message-ID: <aQxYU+QN+8hLZC7n@shlinux89>
References: <20251104203315.85706-1-shenwei.wang@nxp.com>
 <20251104203315.85706-5-shenwei.wang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104203315.85706-5-shenwei.wang@nxp.com>
X-ClientProxiedBy: SI2PR01CA0048.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::17) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB9PR04MB8396:EE_
X-MS-Office365-Filtering-Correlation-Id: 6aa1f7c9-578d-4cf9-b9c7-08de1d0c1148
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xq+q+InOCS3+rEfq7kO4l0pJHotmrRuVTdKRCj+KFkbRcYlqAQHip2RMgXiI?=
 =?us-ascii?Q?i06SyHgxD6mcELyKO0/KgdXOGPsUtdSBEcPuChAFnH9K5Cf94JxpTq691C0y?=
 =?us-ascii?Q?FTl/Ybc/cThFQ2UGZil3epdfev/HUfhdYTlFR8YeuKaBbnixB4cEV/+UBSaJ?=
 =?us-ascii?Q?nlE5IWzqlVh7Zt7Wn3gVrOOEp0+1M9FjHshu49lkNLZfNbjgpOrrExG7gir5?=
 =?us-ascii?Q?cEqa5iYiebIDtgHAIuKdYBSrbWl1xMPYhiKCQExzsN0LIJt7rSy6TYJq/HHr?=
 =?us-ascii?Q?N/xNytn0FSgaw0Iv6g3PXT3zuc6YA0xjxEX80V//spmJzmuYP0p5ZMe4Kaq3?=
 =?us-ascii?Q?ayEJxb1pm+uHwxO0OvrvVQAwWGbZpCTuVOdRqFSCYKAp1EAivd6TiyBoUsPs?=
 =?us-ascii?Q?XiRn/oRfr0WBO6pGR+O5QsrUe7quSi0s6u69hFsqv9kroPk4yUdp0v88ZorW?=
 =?us-ascii?Q?AH/L9oGRLxsCQAo1oXDYIj4ks42Y5T4TNwqtoARukPay1+Ygvrz9x094DdUD?=
 =?us-ascii?Q?eBPsAZn2kTdMoHphdPnu1wNxa3gQpjzWFniDa7wdj2fy9YlF2p39ILgxzKSn?=
 =?us-ascii?Q?qwlpVVTyqKILxKb6aFiUsL6esf4xPXp43C0AmfTKjySoKH23vXjrKg6sTOQJ?=
 =?us-ascii?Q?27Q98TOdKhxkpekkA+KcnbR+MU/a4++yEqu43asPP92WNQKNOX5nDx92ReqW?=
 =?us-ascii?Q?3PglslxRlwfhtzPJ5Oxm6kFuisnQ9FwFxxIZFSYoImeleCdV6eKZipjmFpXR?=
 =?us-ascii?Q?+iQ6FKWpTFn4IiBJOWF/akCW+Gzpea5lu4EqTS/W0krvF5Q437GYY77KdgKW?=
 =?us-ascii?Q?8ulSwJPLsXr0SkQhE0wN51ZdAhOXwpmWQunffsOaEq/8kd6oMmgXy2uYQKiA?=
 =?us-ascii?Q?2rwXv/cvgpDGOfWpLerAFvfHVUEB17IzUSAhU2+rBPg8sNIA9rmVfAe9pti8?=
 =?us-ascii?Q?8ZXpzqAnocjIO5lB9RJGymjJHM7GorY4rlx8VI0Ag6GVwzddUfQWs72NwVKL?=
 =?us-ascii?Q?4T/YlgLFd3oiS+X3SA6uEzw76TETlRoXB8KVjD9CSkq+vaQAOwS9pkHELNKo?=
 =?us-ascii?Q?/5RVSVUuQCAKbsgGQ2V/lnOnmNmh5uuFwioX45r+8EtEXNOvGEzvUQpVVVfb?=
 =?us-ascii?Q?ZCavCu9saHKc0izY7v+X7XrZ9PEHVVfXejLl7KqFf7lQjgNps86MPrRp/ixh?=
 =?us-ascii?Q?VVd6Wei5L8S6t13lEg7Ep1t17dgUuJ90tSra6uHWA1YjLgQt2b8U+2gzsOSS?=
 =?us-ascii?Q?V8utEEz8Advn26gjHYQekbVwYH4gf6Nm3DM3390TCxvXXnfpiOiOIkihFz7i?=
 =?us-ascii?Q?rwgiqVHkzP1eymmGai3TKP1Sab/3Gq4+bJvDGBKN0uWtnCmTD27OyykROcRF?=
 =?us-ascii?Q?ORg4o8OKjUrfuWbryBiL0hwENgI1/6s3wbek5gn1uQur1ytnhV+pTt5tkELF?=
 =?us-ascii?Q?ShNDGF0XnqCQxkDwNDzPH0NH4N8YfoTxGKr37s7KNFGj8e7Lb91h1mUqm3JV?=
 =?us-ascii?Q?57m4d8eQpOeEgpKpnFMpDX95cBdhTG7K3jXx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(52116014)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GkydEkXo/N0Hhe3SF4un+5xfPrGxpJ8YRMIlJukAvKVVnFjuxLAyhLXzMZnc?=
 =?us-ascii?Q?LTEn0w5BzzDSPHdM9Ib1jAKl611iDbR1DbUjrk3BR19FaZbF9xBP0mqg69P8?=
 =?us-ascii?Q?I7Ry0ZD4GIdLoeah95tSwrM+3xp1oKl5TzE0wNTLrRz6/fsdWYfL4suD1jQN?=
 =?us-ascii?Q?tpiP6UQXxr/I/DSuSbrzX301iWwzENXYgNt9/w8DHZAx/ZDfsL03b5KTny77?=
 =?us-ascii?Q?/J3OnmJc4B1aFF/r4r2Som6yA7XPWJSTbXL49MlH2hPC5YcQdk+G7H71MJqM?=
 =?us-ascii?Q?bqV+EBF1Ceqx0pPySDLorWaTPhCK2ke4ndDlK/1Ki/olAOJESjzNkWrgN5Lg?=
 =?us-ascii?Q?9xAlvh8l5PNp8Y7AsgRRVr4oc6MGZcPagkO/WnAhcN/8bMuSLLvR9VHBvnnm?=
 =?us-ascii?Q?sCg/4cVxTRrXKpX4PlVKTsPyRUrjFkF7QXo1bKqNmfA2Oshm9q7r8NdmRwFB?=
 =?us-ascii?Q?MVfbOApNuXPWUnkWyO8K3WEtxO52ixhvT4CdH+nEPKCPchOxzM9y55LKxPxf?=
 =?us-ascii?Q?TvwQMhRbpw635v4Pz/EIRnQpKs5dU9Bv8DtMdJBT70GxdCfm02bhWOD5VHzY?=
 =?us-ascii?Q?/mlxC/47TAA+LLfv9XcEvCR/JQnSae/dMEhuwQ/tq3gU+JMak2pEjY1g95cM?=
 =?us-ascii?Q?OGa3ob6W9dRxZkGbyuNBlRS1tom9oQUDM28X1kWqNPCKKgzfY8adepIlt8Mm?=
 =?us-ascii?Q?nFd7agewItFRl6keBvSoYDdZhkzMsgHYvVqRWtXymqNldm66x1ufGoT506xX?=
 =?us-ascii?Q?uVk+CZdb3sFgJyM+SkHZMUVA4GB2+QQmpxxZisk50PrOH8mRiU+iAzNMjDKl?=
 =?us-ascii?Q?4cRwLebT8oGvE1Pp2XPeqLESc+vmpfTcNlPN4SbuYcNKKV7wVcLq7yH10sVG?=
 =?us-ascii?Q?78vKM2tTxbg67iTeWna6XmBOmEzOZN5PYONpEh19BwSpkarQyjFyVMXZWZm+?=
 =?us-ascii?Q?LNSaPyx1jCDMGtQFT24nChgLjDwG9cUQ3Y5KTjIIyDkjAMhLMcUzwvoFrJKV?=
 =?us-ascii?Q?LMLWb3PE8rYq+gtG4JuChVsNP8/AyqOOBz793CnfMh45x1B5yyWNpDsGblT9?=
 =?us-ascii?Q?6jbjULY1vItm7qXIUz/hymSeZDdtiQJCyV74GgbAWFr9rvTYxH0l8U3W+QW8?=
 =?us-ascii?Q?yWhrbR3i9FzDxsBPCLRo/A3tt+zF2VSuRNh2slUQfnZF5KNXU4tR6pCtHHjv?=
 =?us-ascii?Q?CzYE4Y/gmWO8l9/nLfWPzSidRQuDSAR8KItiZKSzU2kuAVzbU2L3O9aEdWb7?=
 =?us-ascii?Q?D+ZXX5GkaIhP1eEFlZiEsb2c6mY6UoeEPVuPvTLi05eHEBqxchC+ifSs+759?=
 =?us-ascii?Q?kzust5qz6rIa8UbBopxG84aZ1kMHHBmkCOMQcAHjParWypHJsLLWlduNZmFX?=
 =?us-ascii?Q?N3lBh5UY/B79xtddSeR4/htDsOKeeAIva0hwGr/iNxu7OFA53ZwYShxw4WB3?=
 =?us-ascii?Q?4TMmNtW9MDWeSkjXanZzvEibBLiBmhbGsECQLeOfd600Ekjlxw3upaZ/A+F1?=
 =?us-ascii?Q?SgijUHM9jY5eU/32fMHpVMGiKZ15tDJ//erKhHrSoE0RCfRlgtLHTLVKbHfo?=
 =?us-ascii?Q?V9dCfwWmmha1H9p6a6NAO2Z6ioEu4lu2qxD/yqzb?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aa1f7c9-578d-4cf9-b9c7-08de1d0c1148
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 08:11:20.3571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7V+W7zJLxp/ojyS8+dXsbRSZ/NCMvx7WT7M8Bo4rknNhlHRuFO++3Z9Ir6EkBToHK0jJEU3q84fmPDBzeTnXWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8396

Hi Shenwei,

On Tue, Nov 04, 2025 at 02:33:14PM -0600, Shenwei Wang wrote:
>On i.MX SoCs, the system may include two processors:
>	- An MCU running an RTOS
>	- An MPU running Linux
>
>These processors communicate via the RPMSG protocol.
>The driver implements the standard GPIO interface, allowing
>the Linux side to control GPIO controllers which reside in
>the remote processor via RPMSG protocol.
>
>Cc: Bartosz Golaszewski <brgl@bgdev.pl>
>Cc: Andrew Lunn <andrew@lunn.ch>
>Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
>---
> drivers/gpio/Kconfig          |  17 ++
> drivers/gpio/Makefile         |   1 +
> drivers/gpio/gpio-imx-rpmsg.c | 475 ++++++++++++++++++++++++++++++++++

The patch looks good to me, but since the protocol is already generic
enough, I would prefer to drop "imx" in this patch.

Thanks,
Peng
