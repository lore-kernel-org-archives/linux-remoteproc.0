Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013014.outbound.protection.outlook.com [52.101.72.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDA62D5C74;
	Thu,  4 Dec 2025 17:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764868685; cv=fail; b=KJIi3fnm1f/seryr+XgWdU0Q3xrqxzQM9RswAjA5vAzZbZXUvWwtz8++6HQdVNe6Jhp/EQktDP3R8/Mi6fi7KBF9XzhjpzYVJbD5P5fEWo0tx0InfI7KHmYXc11y6Swzk5LNKXzX87unemUzlYs06uoWoJqXXACJl61flRBjwHo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764868685; c=relaxed/simple;
	bh=5zYZJsq3X9GR51iigyGLV9FH+mKG/uGjibVFJR/1rC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ABplFb8fhn9KZlfWElZHQbrEC0PWywSzhZ+mEvhzThtfxGrs6YXv/KehSFim65DgBP5GMXqyHeiz/qfWzExmPhkGyfCAXMCnu8mzzOLNeSczXzg5ZnUqsm3mhr/Hi6/29T24CErjWC4viRbhybZM+Mq+UKlOuP/sdPxV1TO/F/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KzDLdgY4; arc=fail smtp.client-ip=52.101.72.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KzDLdgY4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ncxuG4bg5bf4Te4GEo5/15Y4bErx58pZ8VPHrothhUBiqPTtc3++9WjFlVtXCDyVJNNfMiWoJXHjZzknHcRq8qvCnycMBGS4okcCHLO+qvYJu37TOLghAhpqUR8eYx6ZE4RxnPr63qygec02LGebAf/6Atyh8n1YQivltuPqAiys2m/S4nlPmV4H9RQ++v7jrg4YuEWNw/E3OrmSKIkWRJoaraEj07aYwezspcrjCzCgvgedWKYrILO77oh9zBKfk/AKcTsPmEGzN0iOwxjmataIIbf4LvnE6BLnAn6pnyCOgLz3T2E2z9NxWk3SNbogSwXcvUDX/WAIB1br2AZKdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vz4OM5Ue6KvEhxsWvuZ2KXd/BUsOTLovIKrh2kxZrkc=;
 b=NSYXLn58UWOPXkjJYPOWvyTIIMXDaUcEZxqzG/qReSeXWaD7h6lPBy+P0gp6EmncsDJGbU8314Pn1UfpOd0Z7DYJtKuICX4oNjTdrj15XyN2smYircKT7BJqrYWLXOQvKFMJWB0xuElAiY+poI6n3jv5t9Uczp1C+/Gr2W+Jj13RNfeRP3TpXXDetSZtH0wVWW4fGkWTwsfZ2k4I/ISkMjspbNaWX2tpw4x1euYQDXNefKD/Xs8M2OcLlDuLleMtNMdQykklEpKMhiQ65kAJDcQKENFwvjcVcm/5ROKoYmTG1PrN+Jm93zxNEwBA0tpko9ZY0XQFcBzCysNk2M/+FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vz4OM5Ue6KvEhxsWvuZ2KXd/BUsOTLovIKrh2kxZrkc=;
 b=KzDLdgY41rj/CmBlwppyz7oes3hHUrgfS0xKecCZyr+sc77P/MFHC/KAggJpg/Md5VomM8+4DkJIuXJxhGIc8P/TdQrBMlUbclZqdfwmmO5Apvjxk8tanlhqkprYQwy3/ZyHojUdoCRcL8CddYqX9DGxlnV1Ab9zzYTbCpcagWArzHp7zE3tNbOYPECLvBpoQECXUtgLrHI2vY43Y6pWdP8AjDCEbJwxkPRgCNjhsfYUhiu+dl37jeeja55l/FDySm/QMGWkwJrTLZt7M18xJy8oie0RiK3WtHf+oPDq9laLmuv8uV40fuSYG2qS32/cjwWVtuguQLuTSKz1Y3fimw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8957.eurprd04.prod.outlook.com (2603:10a6:102:20c::5)
 by PAXPR04MB9108.eurprd04.prod.outlook.com (2603:10a6:102:22b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Thu, 4 Dec
 2025 17:17:59 +0000
Received: from PAXPR04MB8957.eurprd04.prod.outlook.com
 ([fe80::9c5d:8cdf:5a78:3c5]) by PAXPR04MB8957.eurprd04.prod.outlook.com
 ([fe80::9c5d:8cdf:5a78:3c5%3]) with mapi id 15.20.9388.003; Thu, 4 Dec 2025
 17:17:58 +0000
Date: Thu, 4 Dec 2025 12:17:41 -0500
From: Frank Li <Frank.li@nxp.com>
To: "Iuliana Prodan (OSS)" <iuliana.prodan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	"S.J. Wang" <shengjiu.wang@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>, imx@lists.linux.dev,
	linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v2 2/3] remoteproc: imx_dsp_rproc: Rename macro to
 reflect multiple contexts
Message-ID: <aTHCNeb7eXpttUwp@lizhi-Precision-Tower-5810>
References: <20251204122825.756106-1-iuliana.prodan@oss.nxp.com>
 <20251204122825.756106-2-iuliana.prodan@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204122825.756106-2-iuliana.prodan@oss.nxp.com>
X-ClientProxiedBy: PH0PR07CA0040.namprd07.prod.outlook.com
 (2603:10b6:510:e::15) To PAXPR04MB8957.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::5)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8957:EE_|PAXPR04MB9108:EE_
X-MS-Office365-Filtering-Correlation-Id: c8797a8b-6d7b-4a31-4243-08de33590dc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|19092799006|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RXydnPQBUdYqcmdsABBj2BZA/w+kvkegLzM7Piz9H22qkXbGVnn4b9V7/LrA?=
 =?us-ascii?Q?c9wBoit57SvShO/SKV6t1vlzGz2lK1tR75Q43iQGs09t9Vjsnh2ZW+Bnb9Ii?=
 =?us-ascii?Q?wRNBIusekF5i5hEKzuJ4e5VCUHpE30pgsBfxjpQh0pszuNLtvB/bhpArFEyi?=
 =?us-ascii?Q?ZSv6Droe/pBdM3LhdgsQJ0079S2L06H/uT1tOSAL5Wl6Q6jIISsXBrjbkCkM?=
 =?us-ascii?Q?givaakoGC7N0Ov7X3CC6kuYMbA1kJRCg7aAR65dK0W2XGrKSEEIyT3MdoHbb?=
 =?us-ascii?Q?qF6GjGDU0cF1NECnWRt9waJPBmIeP0vFCw2G7qQH1rSVUZSkRZ4Kk4i0cAJ+?=
 =?us-ascii?Q?74mVIHzsjMDeqJ9juL/p8SrQWDCuTZ+nIkY9jG4ltqpvwddyAeA/HsiH/QyD?=
 =?us-ascii?Q?irdfgVxge1KDgP4qSAGZQb14DoBMe5LaN7xcLiZZ8zuBm2YHZeOuXUwPnHwl?=
 =?us-ascii?Q?nJ3J2wp9A7w9/M2MmYnb0GKXjJjylEJtswuZWo+cVBiE+zL3jOOEKHdpcvN4?=
 =?us-ascii?Q?yj4C8deewUaVPFGovXHuR9nQeZgJWMMdhdTcu1zPyPgb8EtoruOjIi7A5KNx?=
 =?us-ascii?Q?G9FtRWer0G2N4Sq6vDFWKJ31KHx18fzjDo59N9EVWZraq21xXeAfereSxKcB?=
 =?us-ascii?Q?1lfthLj6U5c5zm0uNqsFud/l3FK9eBgLgBDX+J9vW8g+LV1+9Sbrbmqkj22z?=
 =?us-ascii?Q?kbp+3Wvmj+/rEi2HPhZHFM+nxhiohTdduF6Zcg2jjGetLWnuVjG+Qa5iuodL?=
 =?us-ascii?Q?Yi3VSkv1T7V6xWcbq4yY+SVnrDdnSQbYXc2/XesgSEYW7o98wNlrofsQi0Es?=
 =?us-ascii?Q?OwSW4QBtYbyo+SEsw5xDfvdGW6bQnr0TtbAaCV5ShGTfipmcc7Q9IvX49w8w?=
 =?us-ascii?Q?k0PtsLbqca52PCEF+4P2UKgszLfI8k9S6+UwypiRQYRo0PqN7ASa3k8NgWni?=
 =?us-ascii?Q?XnhKc1NK6i43a6c6tnkHCYY9HiXn30B5j0qV5fkrgIbR6OV9aE8g/nPyPyat?=
 =?us-ascii?Q?o02E/EnY9vsdDxAGYswEXrxBv3ARZupI5IDoDu0JXFExp9Kpz7xKNOf+y4iQ?=
 =?us-ascii?Q?NUxJngsj8uDhYZnRKEgf7VRDGM/nYwqspO9fJkkcR2b3grkbJ9lx0YsNYzTF?=
 =?us-ascii?Q?IvMj5CqfjWqX7EZ1c3GG6oneIDdwI65vrSdU31SkK9fjxyeFOVCN743ljvPQ?=
 =?us-ascii?Q?KdnhGUk3kF5yGFC0l6W7yj7MddICv2VArDk6AyNy0rO8EzfkZoX0cNJXHM4Y?=
 =?us-ascii?Q?F9jnmG9WcLRdwcDGmS5f0QGqN/yGy9/Ag0w8T/GaAF5g3odcZFSmS3Me8kFX?=
 =?us-ascii?Q?80jSGAXrbi0haqQtrOFbt7Jwzf5AXBcvpcjD575ZVqjqn2t1HNY6HSdT+cyi?=
 =?us-ascii?Q?dd15ZAMifY4V7frzpa2pDNd/boR/APsLQgAM1DmyK5lo5uMJ3XarTlCqpfXC?=
 =?us-ascii?Q?iii7voVPUVO1k4MqVHg5d2Y+34E3EIs4pTEov84U14p/tFbwfeCvQVBVtfrB?=
 =?us-ascii?Q?etxMrt4kB6dGclfo4dhSRBqRTx1S9dACblEQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8957.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(19092799006)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uiLO0QoFzmQnRwmNqMuj4BGkgURkHdJ89ni3WER0I442/rLJWQKK5u0eSPfs?=
 =?us-ascii?Q?vldvbaBimegujVTX+o586vmyKHDkYBfCQG1khA4/yGUgKlJ+/abldvxJzI3M?=
 =?us-ascii?Q?NMrmQOpIqq2W7eFQqEefhu+TI4jtkw94ER4+NcnKNo/lSBmsx18zI4k9eDNC?=
 =?us-ascii?Q?R579Gcgv897S0E5POGlhgNyOcWPOzCVZbX5LZe6EpZEwtJgHDDN2MfUTBe/9?=
 =?us-ascii?Q?njp6WzrA68cAJEFBhdeoZgoQ5s3YFjC1lxJYaGLetRQ7QkvRS5nbzty03fa+?=
 =?us-ascii?Q?bwWH3xIyntqid5iF01iuJqosSu3172BBNDGzPBWk51HJOQPoYudpqzZivWob?=
 =?us-ascii?Q?qXeXWNR5XwxSPcExvB32g14EDTfR3F8IsXTR4uw7IIy3sb5Kzvz3+ti/W1ib?=
 =?us-ascii?Q?Y/rNe7WG8LllI6Ij7o0dHPKp95GVYs/wsBTLJzsjci24QutRLLkD/EexK5IU?=
 =?us-ascii?Q?P2UPxx6bCn9lpNMLF+xmJIs07uCyxokEKzU6jXY0LMdeGklPBkYtZQ78rIbJ?=
 =?us-ascii?Q?hMDdrnkzMugjgrtNGk8En6J7rIqWHltqGtJnrVi7pSLRns4GLfZwJclrBYQE?=
 =?us-ascii?Q?aVnigXq14WpCIMsvwqa2PtTEBTSKEftOLXCPDHVcHIq7L0PK01BBltD2ik6F?=
 =?us-ascii?Q?33IsLdcMZxEilwk6kC9lumXot0oXiA31uShmq6z/mzjn/qaNi15P1Z9AQ57o?=
 =?us-ascii?Q?3wYke5hEBbtxDyPinI9VzqYJDXRVsvMuOIXzsV9M3KQu/hn98Bv6RcwRzcdR?=
 =?us-ascii?Q?niJEDuE6tOn2+i986Sk3hNGGvOse8rZxPmGrih9cHNzJYibikp2SdVM4TFpl?=
 =?us-ascii?Q?jV9sudeZltWM/FOhrG44hU62vJgeKXCZbVyeG9RiQKYnNFC/YIMfvowEINAo?=
 =?us-ascii?Q?Tu1ZtFqKoHjIK6tEnyvg/scDeBmgNtPzA8bk6txUSIrCrsirsygOWsyJXJTM?=
 =?us-ascii?Q?FPZZwlFvsqMnt8KT8nVx5F2y7s06ResiPxPQ495N1FCgY4kbnQAINLs1Xdys?=
 =?us-ascii?Q?77sxg43X7Vdm5Qa6pY7F8FL7DuW2TtPHeD7UjTGMpACk+/+0WQWgQbG/B5k1?=
 =?us-ascii?Q?xnpmqEdM07RvOFHIzV1R4pDKpNx7YZ95B1iggRlWdwFkYY+Q5bfM02q7VjB2?=
 =?us-ascii?Q?jFVh3L0PBqYonsMBJib01NxpkKY9ftDTYyIPuAFGohOBaFhfsdY8gRlTBj3K?=
 =?us-ascii?Q?tpq8fAEpQojGis9DboCtvP9LdaZ7AoicXsTdjmKSM5aJIA3ptNSI4QTbSEQb?=
 =?us-ascii?Q?OCyVNBAudreRWzc43xZJY4uL3Gsx8LF24Ip09JD1Pmq7YJ18owHQsecwYgxJ?=
 =?us-ascii?Q?zrruPKt3ZxkHOdVdQmIXBQzl9dYIZLbjMw5qbQcDCeflajA2Ruk8vutE963s?=
 =?us-ascii?Q?NG+kc8pdTQxH2JwSQLdVEHWHl5EMPi/RsjdYuvGgbh7FW8th6f0lmsvFKmHj?=
 =?us-ascii?Q?zPYZS0BfUc9Dm3RGTqxeABMmEbKSOxZZ2Kj5056q8LfQYDAn7m15oluhreW9?=
 =?us-ascii?Q?5x/IMfrZ7QYnVMHRt6SFCNLSBka4LPCca1/rxxn4Z6+rIQNqZWAV3GyjZmFc?=
 =?us-ascii?Q?a4jGMAJTrZYo5G3gcH+douwG87S9iKxVZ8zRVzQ8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8797a8b-6d7b-4a31-4243-08de33590dc0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8957.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 17:17:58.8357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Jv0RrxVEx2OsQmjTiDSp8D6wh4LkUY2gHmSwaCHCJOkyr7MqxdlCuti+lXYRTSzGWI33cRf6AaQRbY2uUuqVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9108

On Thu, Dec 04, 2025 at 02:28:24PM +0200, Iuliana Prodan (OSS) wrote:
> From: Iuliana Prodan <iuliana.prodan@nxp.com>
>
> Rename WAIT_FW_READY to WAIT_FW_CONFIRMATION and FEATURE_DONT_WAIT_FW_READY
> to FEATURE_SKIP_FW_CONFIRMATION. This way, the term CONFIRMATION covers:
> - waiting for firmware to confirm it is ready to start;
> - waiting for any other confirmation from firmware.
>
> Signed-off-by: Iuliana Prodan <iuliana.prodan@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes since v1:
> - New commit
> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index f51deaacc700..1f3a35756769 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -38,15 +38,15 @@ MODULE_PARM_DESC(no_mailboxes,
>
>  /* Flag indicating that the remote is up and running */
>  #define REMOTE_IS_READY				BIT(0)
> -/* Flag indicating that the host should wait for a firmware-ready response */
> -#define WAIT_FW_READY				BIT(1)
> +/* Flag indicating that the host should wait for a firmware-confirmation response */
> +#define WAIT_FW_CONFIRMATION				BIT(1)
>  #define REMOTE_READY_WAIT_MAX_RETRIES		500
>
>  /*
>   * This flag is set in the DSP resource table's features field to indicate
> - * that the firmware requires the host NOT to wait for a FW_READY response.
> + * that the firmware requires the host NOT to wait for a FW_CONFIRMATION response.
>   */
> -#define FEATURE_DONT_WAIT_FW_READY		BIT(0)
> +#define FEATURE_SKIP_FW_CONFIRMATION		BIT(0)
>
>  /* att flags */
>  /* DSP own area */
> @@ -287,7 +287,7 @@ static int imx_dsp_rproc_ready(struct rproc *rproc)
>   * @avail: available space in the resource table
>   *
>   * Parse the DSP-specific resource entry and update flags accordingly.
> - * If the WAIT_FW_READY feature is set, the host must wait for the firmware
> + * If the WAIT_FW_CONFIRMATION feature is set, the host must wait for the firmware
>   * to signal readiness before proceeding with execution.
>   *
>   * Return: RSC_HANDLED if processed successfully, RSC_IGNORED otherwise.
> @@ -322,7 +322,7 @@ static int imx_dsp_rproc_handle_rsc(struct rproc *rproc, u32 rsc_type,
>
>  	/*
>  	 * For now, in struct fw_rsc_imx_dsp, version 0,
> -	 * only FEATURE_DONT_WAIT_FW_READY is valid.
> +	 * only FEATURE_SKIP_FW_CONFIRMATION is valid.
>  	 *
>  	 * When adding new features, please upgrade version.
>  	 */
> @@ -332,8 +332,8 @@ static int imx_dsp_rproc_handle_rsc(struct rproc *rproc, u32 rsc_type,
>  		return RSC_IGNORED;
>  	}
>
> -	if (imx_dsp_rsc->features & FEATURE_DONT_WAIT_FW_READY)
> -		priv->flags &= ~WAIT_FW_READY;
> +	if (imx_dsp_rsc->features & FEATURE_SKIP_FW_CONFIRMATION)
> +		priv->flags &= ~WAIT_FW_CONFIRMATION;
>
>  	return RSC_HANDLED;
>  }
> @@ -385,7 +385,7 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
>  		return ret;
>  	}
>
> -	if (priv->flags & WAIT_FW_READY)
> +	if (priv->flags & WAIT_FW_CONFIRMATION)
>  		return imx_dsp_rproc_ready(rproc);
>
>  	return 0;
> @@ -1131,8 +1131,8 @@ static int imx_dsp_rproc_probe(struct platform_device *pdev)
>  	priv = rproc->priv;
>  	priv->rproc = rproc;
>  	priv->dsp_dcfg = dsp_dcfg;
> -	/* By default, host waits for fw_ready reply */
> -	priv->flags |= WAIT_FW_READY;
> +	/* By default, host waits for fw_confirmation reply */
> +	priv->flags |= WAIT_FW_CONFIRMATION;
>
>  	if (no_mailboxes)
>  		imx_dsp_rproc_mbox_init = imx_dsp_rproc_mbox_no_alloc;
> --
> 2.25.1
>
