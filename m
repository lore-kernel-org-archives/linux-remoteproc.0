Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012067.outbound.protection.outlook.com [52.101.66.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88201D63E6;
	Sun, 28 Sep 2025 07:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759044972; cv=fail; b=JCczLG/o8OUF/4KBPpqtENU+PI6H4bgPARXWJ7QFod2EnAnxGvyFywCSm7MmHjK6w6YH8+RfporjCtTQ4NEGCb+uIYOOeTD3kvT7nYGUayvKs10CFIyXegPYDiJP4R/iKcdpAqk6ZjKCg6Y0vCPHUY+CiwBoFwUKzR7noc/H1yc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759044972; c=relaxed/simple;
	bh=4COIR3rmitCcY+zzul8Oq2xzZ6q1nYBYA1m3ksUqSb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kWuDjx3bUJS4rOTrikv0GEC2wmZ/zeFdi/VCKkjJQMWxjMfTE7oT+FcmCKuJQDPmVA2bqcUL7DD7sRDoiT1VxOX2PH9+Ix2jJ8iQulI6akhLJAFlZ2TewJQrjK4lEVMvZ2rUXY5ruifUHBWDHZVP8yHOReED+JZSF45DtCOx4uo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=It9N/KR9; arc=fail smtp.client-ip=52.101.66.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="It9N/KR9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y1hH4nKXErRZBUcYOo8QD7jBWK+jI9hI9JOZWcSzTRphmue5PQ//O+sXz0sBzoANeO+GUZssx6SVx2zojrAqDWkLu4SvrtsgtM4N0c5iQUjDGIT89OA6PorjNAIyiAYzNBYzhQTbhZGhOKMeBBz61fd8s/kjppQaEs8jgV5mjS38Yo+hlfP4gd9owr8SL1QLdyF2uaAA9dg3vVJOVt9DakxQDDk2VYzG638SIckyLCGIn/DnonWGKQsgNLWFkNKXvlD/XBW8qkrKDa37Z/Gy7K10B9cMSMgp+ShyBZpF6zX3N6MlXuGoQBO4iUSG0gD9WJweJqtPWURlVXN7pe9U9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=672smhs3odi8ZHfbJe2wGOj5wkpcrTNfbk+Ik8+YwbM=;
 b=x228lL9OuEM8nNz3RfyyB0Lg/oaFGLq0Xk2N/lumFBGNyxQKeoZxy7pVtbHGYst4Fn4oPcvEsqJqE4Ke1fCNm/iMfIeKS1JyeruxwkcyS3ewAAHhiw4cldHwGUBFPnSq9C72LFQFZ0Oq08P4Tj8Xx2bocdpACx8NpkypdaRE8c1fs9l8OvtInV/M13j4MfVrDvND8vDF0O/rmITMzsanRyQAIS46+P7+ZsppxyT7hW8xJj7ggRvzUYjKv8opWU7NLnFdFjxJZDLP+3I+dTJz7C8eJ+T/BlEbh3xvByyQU1doUIRmNOYtkmDzHqmP/BKexkZFsUtVhIOh6YIWLLTMoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=672smhs3odi8ZHfbJe2wGOj5wkpcrTNfbk+Ik8+YwbM=;
 b=It9N/KR9vxn5uSsaoCAKqa9nuIrKMUQIeoLfCLw6WuuGpcQcObrb0eXKMwo5hscLIDF+tpleD4pASOY5t941/bcsWZu8S6uIfu/6XqXHZLQAdmgio1dxeVVGQa8n4Mo5ramZXXioFUpHlRh27sal2R6OLUbEkxCrX4Psn856JkKcwJNMiDEo88x6/8/PhDFURlnl7jWM3N0HIHSTWKmjLLXKBhlOrtup2j90W0tHgh2B/xVm/oRNFSSQMvrmvksGiegeeOtYR2yUokAykLkQ7k1dQsq6ZGbbuccPsmHKNkqcGSIQoRWEBS5Z8wD6QsouqPWGRtAxfsQonzu+keP16Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by GVXPR04MB10181.eurprd04.prod.outlook.com (2603:10a6:150:1b7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.15; Sun, 28 Sep
 2025 07:36:02 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.9160.015; Sun, 28 Sep 2025
 07:36:02 +0000
Date: Sun, 28 Sep 2025 16:47:52 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-imx@nxp.com
Subject: Re: [PATCH v2 2/4] remoteproc: imx_rproc: Populate devices under
 "rpmsg" subnode
Message-ID: <20250928084752.GB29690@nxa18884-linux.ap.freescale.net>
References: <20250922200413.309707-1-shenwei.wang@nxp.com>
 <20250922200413.309707-3-shenwei.wang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922200413.309707-3-shenwei.wang@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI1PR02CA0041.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::18) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|GVXPR04MB10181:EE_
X-MS-Office365-Filtering-Correlation-Id: b7032b41-1252-499e-ca18-08ddfe61abe0
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|52116014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QjVTw04jwKigUpv49xa18ilOL39nBXUGOSE1qTGEzSjNMY9BNXTHGrPc85E9?=
 =?us-ascii?Q?vE0+7tVMp140gyBPYgT3c0ZjDbZRx4YexV349xpFjPgxs0SNlyC2g9ac1qPA?=
 =?us-ascii?Q?C47iy19xET/acaPd7Rg4kLYJrik/KtM2VlL9tz8EuXIcnLsDyehz4jGBUiM/?=
 =?us-ascii?Q?Qir+GnKVQCgkBwG7fGErEX6pO3cIKUD2W/6KGah3hMlItV9Fc+/YzQT2N4wX?=
 =?us-ascii?Q?P69xd49O3MTGbJv7EKgL13gGEdA7yS+ZDnpGGKsyqVQ8wN+VtRJ0KQrjvphw?=
 =?us-ascii?Q?42MyFukDhOkdWuQ6phB8KvOAhtZshkVf4XkfYUfLsWDSN8tNBTGXU2VC9qqA?=
 =?us-ascii?Q?Yd18hSpgzGQBGxK2x4reXqbR5AxrZbwAPkbeV99iaJgNvO5d6Ls8bI2YAx95?=
 =?us-ascii?Q?07Z+3216i7YPEbA6GBBO2CiA7esi/Nt70WBSzEQ4Tn1oE6cyI7JbsYfpcPXK?=
 =?us-ascii?Q?kj2WDGLq/PHsZNYMNepEcq+EpF9o0d37Hr6Xx3G353f4IFM+BGBa6IK/oxvz?=
 =?us-ascii?Q?ElNPSIeQsaTetOnUnUaQKYaawzft+NWc6kgIF3LqUASePF0Z3cgaGhPKxAR/?=
 =?us-ascii?Q?+7+j0OurQAMDoU4nFFFh4YfCpaYn4dsJ8uwiyXY8krqt42Km2yBqEmY6+hku?=
 =?us-ascii?Q?lfPjIUrVxGtUtg6/wOq3lMB7petWCtTg229Nm58hKpcC+jl0gj08W9T8KG4B?=
 =?us-ascii?Q?ik/fMhImna+xMFs1IjC6hlER7MbVA09Uc8YkBsYnffux6VdFAPUUoFgS3A9K?=
 =?us-ascii?Q?w1ehnES0ASS8seNo3Za/tBCu9kfvYJop8zJsrqLmKZlQY/IBX40ur/g0FFHH?=
 =?us-ascii?Q?5R+1cTaMvG+TWxCFRZTCtEGFcvB9DkPegCAXXDMEF4VsHJH33PCppqzbadaM?=
 =?us-ascii?Q?V5Gy/2OLH1WNS5pfZPKxuRPfYubwW1ZYRmRdtg0lMfDvHuqPjvzg5qnU4+tk?=
 =?us-ascii?Q?gsqXHAqpblkLaDmE0GE5ONosCCY57dUHpjDs8UNfJCJfHWfC8WcRzzH9DUoP?=
 =?us-ascii?Q?4JWt1HsqKbCLbR+FixHPGd80QSAxGxNDtoYNiKxrNJvAuf3YNfPikwxPY8R9?=
 =?us-ascii?Q?hRwf5qU+9yyFEJhLDFMnkC7cPEnBy4DnFD7stpLgUjKdF+cgGQ4GO/T0geeG?=
 =?us-ascii?Q?JPCwVn6CTTuhDypKgxdGnDrUhwkdluAJYcoWGQ1jGcXdQYN8FMa7uNgMXvIP?=
 =?us-ascii?Q?C4+qiwRlAeFrN5Q3tBSviQXyU24yGdYCYqG8k1HgC4av797W8d1OZ9AfCgu+?=
 =?us-ascii?Q?FF3Ms12gGzDplnVIIQTTY0W1mSHIGGigrbraaM1qB1PB4bLkScMN9BSOgLRz?=
 =?us-ascii?Q?eZ7cGQX1zBafb3UzIXK373qXPbxBtzjAbn7OB8Q6ARIz/EHsFccvKAlXA2bE?=
 =?us-ascii?Q?XVo+kRAQqbADo3JN5jhrBID7KWP0ELirarnqqIQrSNprLjZdCrcU4wNQGjFl?=
 =?us-ascii?Q?b26REEN3t/nG5zNRz6rrqPUIkvsflYwuL9fQZmPTwujvJ9ad6IKUz2B5CobN?=
 =?us-ascii?Q?d7UBTFl1ogin01S+ahftsjCfHQManD6Q6Kwf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(52116014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FbRtgapzSRYFZZDE2eBvxKVB5rF4EcEE8MMy4JMQNtlnJNMMhkhJc8qL3vPR?=
 =?us-ascii?Q?Dl3HXStTKSCBqKrR4HwTJX6Cc5NVCQoCzQtRubAo+zNHo8wRM/O2oxp69QrY?=
 =?us-ascii?Q?08bC+u/h8Z456lIsQpBy2hVlz+wcd+cm4PRen1MEmm+R9KTb4Sdi+vYjUShJ?=
 =?us-ascii?Q?XZFvlWkRKCsT1z+VVpBRfUxtVOGC8qM4JRKevvL9Tu4zKNZUr2JhWAC1twhI?=
 =?us-ascii?Q?k5FDcJQYefRdBeSEG/kpTD8wVr9McedVN7zm6HjiDX0dEE5Nb8lXhYzQx3WC?=
 =?us-ascii?Q?GHegUTdmyyzWlE+TIwgbXOpJin7AUkgSfQQrQuoNdsbPn+matbJHU/CckbZ8?=
 =?us-ascii?Q?UB62ie4z7jEkY2VvDkICgnmeiVlI34qi/RWYHK7HWvWAWmk7n6WhmEQ6N/AC?=
 =?us-ascii?Q?2Lk3qGZxwzB/ZSeUJ7yHXptvsMceGrlUgAAk58cHzTsokLW/mUV/zVWmD3WZ?=
 =?us-ascii?Q?CUdYaMBQG5PZAYyQajH89UnZh+cT42D8iBMVyZSiDoF63T/7bdD8kopPhyk8?=
 =?us-ascii?Q?RQ1mHgIfLD4R8Zwh2604HVMneWt9GhtrNbzbux1c86MpAUUZ4n6z/Rc1utZs?=
 =?us-ascii?Q?OHxmz9TGuXQ4wjBxL2uw8LBEXVl/+0BllgWneryvlG4aHPcjcLmGk2/G6qmN?=
 =?us-ascii?Q?hu4oITUxMM2j2Iv6pgy5/0OuKUHpWy3avueSS76q/cpYjjprAATKCq3fjg6V?=
 =?us-ascii?Q?9oUTwH79evX8jmoHOgycHkL4wSKod2V1wNiSYdKNt1K0ehhuIJ0fTeyQ+VCz?=
 =?us-ascii?Q?YvmerYt8Xok+MPFIlrm8F0HKnUVqa9TJ+onbQeVNvMIjGFNklLrYaOZujMOt?=
 =?us-ascii?Q?Mktv32sxuh1bKa+jYzzI3jTq1qkjysG9k8cMY98FY62bz6dtITX9dYha0ZOg?=
 =?us-ascii?Q?VpZeeKAdD1W7iVEsdm0HxYr2N7YRddHmOTHWkUkJdbVPsIo3KIU6Wcp35zg8?=
 =?us-ascii?Q?sCIryryJBVM0sksEYpF+ZC1fchTmRtvINTA410wZefXVBngIATMqe3Wvpfwo?=
 =?us-ascii?Q?c5d29bKDO4/9pxqtU7WvdHLplmmlZp1W9Vt9GsNfvxRwdJ64rDkvzLXXPXKN?=
 =?us-ascii?Q?XuRLi6cLWUPjAX2EgCZFRnSn1KmylhoOcn+Lxm/Sp+7cRAUV7Lhid+72WoS/?=
 =?us-ascii?Q?PsQPlQ9GTN76mJQssBbDOkTgDkSHOBVTFdDUllbJSRXYJn+tghMxQ+li8InW?=
 =?us-ascii?Q?DZWHSs3AmrH1n2SLgzXGJK+xfPNgrCC6VjRrqbKXH1KjhK3RaVR2PYeOlSiH?=
 =?us-ascii?Q?FYnoIExGQwE3gj9Qw4y1HBY0z/O6pRFKusd8T3fo4bj9t+6Q1O9TLpZ8mTII?=
 =?us-ascii?Q?Cm8jvPOPrs2eIob7t8I4oMThziomlw0Wc5ZbY/iJXIeDVgABLUCa2bg5e4in?=
 =?us-ascii?Q?Nlz3K2uiYE8ubNry/I1V6N+Gv/vmmUMxMEBpqhSIq2nvLIXamrZNk0zdEFRF?=
 =?us-ascii?Q?PSGdq3PeaDs+Rm8DrY0vxWok2gn5EBDFJsqQZK+4fjqcqRWZf715yAWIWufX?=
 =?us-ascii?Q?3j26reRs/FfE+DBn+TF0LKkrLtispNAuFW2HGxQaz4U1BI8xxe4Hq0mQ+/Kp?=
 =?us-ascii?Q?xdjIwKFvcSOhNVLc563/bjDjaBIu8hiE4cHXmntw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7032b41-1252-499e-ca18-08ddfe61abe0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2025 07:36:02.3676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ryorjL9EUqx8Ci07cVpRmvxuJZH264Gl8gQ9F2J+2quSGpUVI886snj8/JiX7/yxQLLZvpS7NwnQAO//7eOMPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10181

Hi Shenwei,

Most of the patch looks good to me. Only a few minor comments inline.

On Mon, Sep 22, 2025 at 03:04:11PM -0500, Shenwei Wang wrote:
>Register the RPMsg channel driver and populate remote devices defined
>under the "rpmsg" subnode upon receiving their notification messages.
>
> 
> #include "imx_rproc.h"
>@@ -1084,6 +1088,126 @@ static int imx_rproc_sys_off_handler(struct sys_off_data *data)
> 	return NOTIFY_DONE;
> }
> 
>+struct imx_rpmsg_driver {
>+	struct rpmsg_driver rpdrv;
>+	void *driver_data;
>+};
>+
>+static char *channel_device_map[][2] = {
>+	{"rpmsg-io-channel", "fsl,imx-rpmsg-gpio"},
>+	{"rpmsg-i2c-channel", "fsl,imx-rpmsg-i2c"},
>+};
>+
>+static int imx_rpmsg_endpoint_cb(struct rpmsg_device *rpdev,
>+	void *data, int len, void *priv, u32 src)

Alought checkpatch not report warning, still better align the parameter to '('
static int imx_rpmsg_endpoint_cb(struct rpmsg_device *rpdev, void *data,
				 int len, void *priv, u32 src)

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
>+	auxdata = devm_kzalloc(dev, sizeof(*auxdata)*2, GFP_KERNEL);

'*' -> ' * '

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

of_platform_populate will decrement the reference to drvdata->channel_node
before it return. I not see other places increment the reference to
channel_node, of_node_put here could be removed.

>+
>+	return 0;
>+}
>+
>+static int imx_of_rpmsg_node_init(struct platform_device *pdev)
>+{
>+	struct device_node *np __free(device_node), *channel;
>+	struct imx_rpmsg_driver_data *driver_data;
>+	struct imx_rpmsg_driver *rp_driver;
>+	struct rpmsg_device_id *rpdev_id;
>+	int i, ret;
>+
>+	int count = ARRAY_SIZE(channel_device_map);
>+	struct device *dev = &pdev->dev;
>+
>+	np = of_get_child_by_name(dev->of_node, "rpmsg");
>+	if (!np)
>+		return 0;
>+
>+	for (i = 0; i < count; i++) {
>+		ret = -ENOMEM;
>+		channel = of_get_child_by_name(np, channel_device_map[i][0]);
>+		if (!channel)
>+			continue;
>+
>+		rpdev_id = devm_kzalloc(dev, sizeof(*rpdev_id)*2, GFP_KERNEL);
>+		if (!rpdev_id)
>+			break;
>+		strscpy(rpdev_id[0].name, channel_device_map[i][0], RPMSG_NAME_SIZE);
>+
>+		rp_driver = devm_kzalloc(dev, sizeof(*rp_driver), GFP_KERNEL);
>+		if (!rp_driver)
>+			break;
>+
>+		driver_data = devm_kzalloc(dev, sizeof(*driver_data), GFP_KERNEL);
>+		if (!driver_data)
>+			break;
>+
>+		ret = 0;
>+		driver_data->rproc_name = dev->of_node->name;
>+		driver_data->channel_node = channel;
>+		driver_data->map_idx = i;
>+
>+		rp_driver->rpdrv.drv.name = channel_device_map[i][0];
>+		rp_driver->rpdrv.id_table = rpdev_id;
>+		rp_driver->rpdrv.probe = imx_rpmsg_endpoint_probe;
>+		rp_driver->rpdrv.remove = imx_rpmsg_endpoint_remove;
>+		rp_driver->rpdrv.callback = imx_rpmsg_endpoint_cb;
>+		rp_driver->driver_data = driver_data;
>+
>+		register_rpmsg_driver(&rp_driver->rpdrv);
>+	}
>+
>+	if ((ret < 0) && channel)
>+		of_node_put(channel);
>+
>+	return ret;
>+}
>+
> static int imx_rproc_probe(struct platform_device *pdev)
> {
> 	struct device *dev = &pdev->dev;
>@@ -1177,6 +1301,8 @@ static int imx_rproc_probe(struct platform_device *pdev)
> 		goto err_put_clk;
> 	}
> 
>+	imx_of_rpmsg_node_init(pdev);

Need return value check.

>+
> 	return 0;
> 

Regards,
Peng
