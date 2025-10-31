Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011019.outbound.protection.outlook.com [52.101.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67087303A39;
	Fri, 31 Oct 2025 19:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761938433; cv=fail; b=azzOu4emQz7HvbQRJkgExRZcsMJicB8udLyHMtFnHYedYru48Yyq+yD2VXPg72cR0xhzKfNjxVXsf2Sa2jJUIcPF3NZeno4YOtVwnaPGdsxit0Sqb1UdQca0Vn2aMMf4FGOIJC8ckppTSRN1dNGjXPPJY8QO72wfuKwPtr7+Z7s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761938433; c=relaxed/simple;
	bh=k/dT7KJZkqu07g9TEZm02CgRmib529mDwmZ1VVZ3pMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jx3NrlSyoqi9TSNe+Q0iw30aj2Q3S/jCpNReCxsR43hXZmHJmendrr82FSL7Vj0meAgInP1iG+OtlgoUEbjY9VmrwFDYhYRtycRHP83GcZMzYJoHJv1w4F7aiSr8WcycUHpf0h/EWb1mmRGd6xdg+psiyWwY5p17afq4rzL0m1s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=gtvZV6Ex; arc=fail smtp.client-ip=52.101.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="gtvZV6Ex"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mOC7hkkAFcuWuWAH/mUb7iGGj4j6cQGpb645aAVbrYfdfTKEMTgtLGkGxf4lCW6VdIXTkJa4eqmjB1GgwqIP6HS+7+B1PvAJxmqRIh7nfdOdrJ2Rc48tQPw4Lrh9lJvrLZTebJ+eyobyprgAz3xpBfs7WIanSyqAZebOc93omLvv6+isd29XKQffVJoAt6+WllqmyCk+I5yLN1rX4aV/KIPZLM55I9tuCQQ/GAQEnLTugTUAfZ+ND9nFu6G8cEvsKWokuwmALQltlS1QFkc6LXnuwDh9jXnR89Wcsiswk7NrMEvZns1DomefccOZYn4okoemsqx6eOOYQOXNWAlzaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CJCOVn0YU5ABaNZ9vYE07l0t8m+jU8HwRSm+lQt6ICE=;
 b=X5UqC2bPwkaJEP/gxD5tT8idjntZ/fNqI/CKOFD0r3j6AlvrHfobXxzXcQxZwDkCuoTVdNW3QiiGJ6dRbwS5KhwG62hp99TLzy9QMZUSEWEygUjFaS+afBFAXCdUxjB4nNjQL7d6DyrLAaDhhrZ5XFKklO3BUmR6C6Sxtjb+0pPCeUbifiXAq0sE/ZSqoQXXU3h17FDyWuvDYyyf5O0NAsI7jaPcvebD5Sfg0J4SaKgaWGNTXDHYOTiphzSxBVWtCIrXQJgYNb2kaMm8rvY/3HpFdJ0i3DY8sYaA50qsklcairFiJcXS40aIaCxrf0ch/bsXv7LfUxKr/NcKCxScQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CJCOVn0YU5ABaNZ9vYE07l0t8m+jU8HwRSm+lQt6ICE=;
 b=gtvZV6ExYtV95wuSEmJFBmVUNJ8NdJHi9dJ5j34vjmZjZ58FfozCKdAZPzT308XZxWOzDThTvh20FY880zGKJAaxU+Dtz3Z7f+xzVjXOB/yB6oZs8LEwWYsRJhmAnUjitO2fiGMdzlJvahc/KO+Jm2efXkG1dmyk/80vOLJjBC38uVZ/qOXHosnMKo09y+pNG4jm5fRoJYI5LrmfJNQuFJ3ps3bT/YIIe7A2RQ0eXrVHrsoA/Sm+VQDPzQgvC7foB1KZ/nqmHJpEnGNyuS4MYoxI87UZVXg9CKp8SlQRLLipVZbzyS4nATjiatJ21xRWFYNUqaDTR7zRHQwzTHBexA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by GV4PR04MB11308.eurprd04.prod.outlook.com (2603:10a6:150:297::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 19:20:28 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 19:20:27 +0000
Date: Fri, 31 Oct 2025 15:20:18 -0400
From: Frank Li <Frank.li@nxp.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] remoteproc: imx_rproc: Introduce prepare ops for
 imx_rproc_dcfg
Message-ID: <aQUL8v7nqiQaP5Sq@lizhi-Precision-Tower-5810>
References: <20251031-imx95-rproc-2025-10-31-v2-0-758b2e547a55@nxp.com>
 <20251031-imx95-rproc-2025-10-31-v2-3-758b2e547a55@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031-imx95-rproc-2025-10-31-v2-3-758b2e547a55@nxp.com>
X-ClientProxiedBy: BY5PR16CA0021.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::34) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|GV4PR04MB11308:EE_
X-MS-Office365-Filtering-Correlation-Id: 984ff1da-040b-44d1-3cc2-08de18b28ca0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lEA4p6Ps/6K6YhuGplxUVrMJRjfUwsLWQfsjJuk2gLhKx6PQykWnuxoyn3xk?=
 =?us-ascii?Q?wJ3r7SzPkYFGt0EEqfKHn1m9CFAYz++Av9ZQII7xSDn7f8lUEjwnudn/aHmL?=
 =?us-ascii?Q?aTGB4GOej8NvhwPkZTNAEB2GJIxpw5XtwX4cZQcPYWDkz3jGOFzX+225Mppt?=
 =?us-ascii?Q?H5hQaqC2MtVSrvbLIXgQo1Rb36xKv3zju5RKC3aX34+DeRNQBImD0tDpLpmH?=
 =?us-ascii?Q?t8gXUUUeAcQgTY1M1yw6pfQjW7zPXPP2K4ICtpAIpgIYXvSBrXWkRn6YfabM?=
 =?us-ascii?Q?9/1B7y5oNIVEDIixvjMK2UCePka/XYt5uGZjk9BPIjCBbjluIq+t4hVPU731?=
 =?us-ascii?Q?y7wXGTfMsMOG3/nSpNDxH78TVkvzhPxhuvOEKSbM2BRpT3kVSMvNkcGNB0VX?=
 =?us-ascii?Q?QsG9ELJp+rkU71PVum7zLNEMNRAFv6b+QCheFjGCcpm18evBZBg0KpR1P3h/?=
 =?us-ascii?Q?JyWVUIll3KmzMm13rAveJS5gQ83teEz4QBLdeKO4/g8UgSpz0b+C4SqUQxXU?=
 =?us-ascii?Q?atLyL7PVQRrwugydXvZvshzAmHyHDeAMZpNArJar2QK4ihR5cw81T5vQA5vA?=
 =?us-ascii?Q?ar9OXHMdrn22wve6tL1UfQq0Ia3oh1fVVFM9dcRf9q8Zj70yMbzf6FM+69HB?=
 =?us-ascii?Q?ywDNEwo+5xa1Bdu3yf3Q2c70kZi4549wDdV08uUVoWrFwM7EX3ME4DqNUTGi?=
 =?us-ascii?Q?2B2jXynxi1WF9BbDUQk7AELakiEt1WAaBRS0Ful/9T9q0plX+afjwtKUeHE2?=
 =?us-ascii?Q?/SHXUFdFzGTszHV0k8gljvk0ATmrlGSJ++UNICNfB6l93P9GweD/ATH/N6a9?=
 =?us-ascii?Q?Mc+me+gYIByxrJHd6vCqKgH6A2KTeWBHSZm5w3pwWKZLLSOM/K2htRr6ZjmV?=
 =?us-ascii?Q?C5GfZ8ag6fXyoiA4guRp3Qpah8V2t1D7h5koASohur4eYLV8yC8MOT4Jgz2k?=
 =?us-ascii?Q?nip1dcmKaiDQwCmGARyWcM+62wmRWP0HiQx7ag3FeMazUoHv/Dw8aOOPp1f/?=
 =?us-ascii?Q?bFtrONG8WZOBug/kQIvgjswNfV+rDgBm2Ei9TG0bjVU9oN4l9p+x1oxld9P5?=
 =?us-ascii?Q?NZx+cPHaNHVuQsBupH9hqTHN2ctqWjNntqlvuQVz/0T6bjWWOdEnUrXwz83s?=
 =?us-ascii?Q?MpBhoMm5Pnp04g2xUjsV85sFk0827N1gSOObLhKw+o7UXRptuqjZ4xzpMnAv?=
 =?us-ascii?Q?YM7r1xSR004HQZpW79e+6NhsYQoQgoIx3B/ko41C4M0MTLo86yt2b5zTIP5H?=
 =?us-ascii?Q?/PozEp5seplzdEojyENEt26ZLC+3Nl3mbNkkS7C8KkHxNQnIDf4l5OOBfdTO?=
 =?us-ascii?Q?6JWtknFiB6bgTvbTW879oE4lu0TAPuhhFewOLYFs/uklomTFNh9Orpwx/jqi?=
 =?us-ascii?Q?q7pnPK5v3TTnMIz2LQ3LX99cAQME4DPrEeAcXltABT4mzPStfDd9H4L+Lp89?=
 =?us-ascii?Q?5rvX4/KYi26b9H+DXhkkGq+pHxmFBZgQIBClKVWXOjURKOrKr5ReujIzOLIc?=
 =?us-ascii?Q?iCjUHhlDrbHqQwp82/PmmvAbIbiAnr+L/w3C?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lFvlloR51XT8xetvmURzGEor5OjxanYhXzb/65+gVWto3h4Bpc4WS8lg1WPK?=
 =?us-ascii?Q?NVTO0STvZQEf7NTtlr8PH3O8tag7wi49V7dOSTHCsxU8Ke6L3QsWTPA83quw?=
 =?us-ascii?Q?gd7/0vYOt2i5LMFtUSuugWkb0FujqPj6/V37Zj132vjeutlok50Kq0dbD5ss?=
 =?us-ascii?Q?o2hp4UmdOq0N3A0rvDogFsg/VzYscHXYwc8wilEcGhoP1p4aEuDGZGAywJ2c?=
 =?us-ascii?Q?ZBXqs2C971k3yGzjmKRTkxzsZmiyd6mLAr294OwFUJPlHkISy0/NasZWph9H?=
 =?us-ascii?Q?VZZUe8KrXagUbg1T6YnibpLbbap1GeHWAPWT0CMdvfiwOnD1ZplNmmLRXzOD?=
 =?us-ascii?Q?bOzu7vZsf7uYbraXwQ5Z6BMm49Qtv6DlttwstYnVWklN7av7nEu3EvT6943K?=
 =?us-ascii?Q?VnWkUPdAfzheXzmx4cr/a7LOG3LbtJOi95aL9xJu3YCODL94KcF3LTTq+yDh?=
 =?us-ascii?Q?oNnD8N0c1nlpk7VOOcmQ6wH2lmX/nyDxHbzsm5JiLnDk/XKKkFPxEY1MqGRJ?=
 =?us-ascii?Q?z75IrHmVPUsVykmElWaYTgzVD8VV7IXGCS2TCbVOoRZX4/s01Haq/gVRZYeD?=
 =?us-ascii?Q?/1MY+lVNWmtkStmziDdyv+OykrLpe1oqubGyVThOAoUBEbl8ln3o+zbO3RGQ?=
 =?us-ascii?Q?IbyRS6JHWHIN8iG/x+eghDmEWtYzRl/uwj0Eo4BR0Pknn8LtOxYBtG4HRzCn?=
 =?us-ascii?Q?NhFRwxHJhvpz5kmUVXXMIUca3ru/n3gS7UnthKyd0qdV3cxf4+MVIGz0Nuqf?=
 =?us-ascii?Q?l0PX0RDi8Fb2SySLVOPKwKnHmxsvTE88pxTED+6eevzoE+sh62uV2YfRrXVk?=
 =?us-ascii?Q?pdrRqy+Bi26NmuZ7wiQRfuHjNkJFf3riWgkMQduD8axOsqYaVnHBvtiZvekd?=
 =?us-ascii?Q?0RzWP79dIy6Xxthq2goqcSBqu9hWDEly8Z961fPfhgvDDiSsRqdO0BszRC32?=
 =?us-ascii?Q?XxU+kBgG8tfP0FU9DzacgFrWWvHJLvVe2ImhwGM3skN31YUXK/6dugcaMaDp?=
 =?us-ascii?Q?Ydb6oaNelixkhvAJJ+kVvLfGgJ3J2wAnb1TQdIOOUi1hd00ny0OBQBDl3ywd?=
 =?us-ascii?Q?6olL8skx0b5Re5qUDsPslX/30OUOB+Q6JJOU18N5mXHHL0FLQqhj7H6Ahq6i?=
 =?us-ascii?Q?tV6o6Q3wfSWzRMrbJrPEEEaa+yZwAGk/wWOTTWu1uBcqpRPtgWPmRsFpeal4?=
 =?us-ascii?Q?ht3GKP2fMEF3cAt8RITFoVhEZkIeb+VQK2PK1ZG+1b7+URcWAd+6jLKouPVJ?=
 =?us-ascii?Q?lOWzC3aMnZXJKEQvqpt3HJB0vo6ZW55GsEi5UGCs/Y7fiLzM9+uStW1VCZkp?=
 =?us-ascii?Q?vlF+ZP90Cb7RDIAi79JT7Y6ivjJAN3xafZnhPNLgwacnTHWcaiEazuiU2Nyz?=
 =?us-ascii?Q?l0VVYrym2mOKxw9Gc/z9guiHy3h5DA85q7JKEMIRYTrmS6DoHpUi85Vx7kui?=
 =?us-ascii?Q?1il3wukFfkf3/my2pFd5Gd9tCSWNEr3SkYTQ9pM6vsxN5xHrXsA3B9P8SV5F?=
 =?us-ascii?Q?Eb1HTna3vWcE7Keo5tBt2FhQnWywWxVtWllm3YNjVl6xrlzPa6198BPuX0lN?=
 =?us-ascii?Q?rlfR3bfDmMNSnhtk8PsFbhKaYcyBLE1RlbCoayua?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 984ff1da-040b-44d1-3cc2-08de18b28ca0
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 19:20:27.8574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jdvp4XkhbpRImBbVG1/3TEkepswXfqlReShYW+0ZBJKjCc10HOlv0OblwX3wXkLTRTNknAEFmZ7Q2J7iee5AnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11308

On Fri, Oct 31, 2025 at 10:24:54AM +0800, Peng Fan wrote:
> Allow each platform to provide its own prepare operations, preparing
> for i.MX95 LMM and CPU ops support.
>
> No functional changes.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/remoteproc/imx_rproc.c | 5 ++++-
>  drivers/remoteproc/imx_rproc.h | 1 +
>  2 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 82cb8c7866ccb79061c46068d2039f38feebbb3c..232eb91e0b5dc2432131b1c140d6688b073fea1d 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -532,7 +532,10 @@ static int imx_rproc_prepare(struct rproc *rproc)
>  		rproc_add_carveout(rproc, mem);
>  	}
>
> -	return  0;
> +	if (priv->ops && priv->ops->prepare)
> +		return priv->ops->prepare(rproc);
> +
> +	return 0;
>  }
>
>  static int imx_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
> index aeed08bdfb5619c7afd7201589f417cfd6745818..e4b9ede656506142b260aa7515823f489a168ba4 100644
> --- a/drivers/remoteproc/imx_rproc.h
> +++ b/drivers/remoteproc/imx_rproc.h
> @@ -37,6 +37,7 @@ struct imx_rproc_plat_ops {
>  	int (*stop)(struct rproc *rproc);
>  	int (*detach)(struct rproc *rproc);
>  	int (*detect_mode)(struct rproc *rproc);
> +	int (*prepare)(struct rproc *rproc);
>  };
>
>  struct imx_rproc_dcfg {
>
> --
> 2.37.1
>
