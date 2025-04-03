Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2056.outbound.protection.outlook.com [40.107.105.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490FB28EA78;
	Thu,  3 Apr 2025 19:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743707585; cv=fail; b=RcRpYJqpZ3bh9/fQmHqJ8nmk+B3g92afhJ12Np5dgAkpKawboJKdAqXGhePuJqawD01gHuewOpmHZMh4NBYe6sFnwPOjrr5pFLh5lWqZ01tze8gQdPwx7Q+AxcK9xwHtwg+StmAA7k7Pu3QaMz/Lzgg+kGOntO6tPj0SZC0x4D4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743707585; c=relaxed/simple;
	bh=lj7y5F8ci8b4DTePxz6YQuG+4tQ7y5m8fSHzW2Cgvrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dFLJqYqIj45Cf/J2TeSkZG57642V8/qecYuhtf98UKbE39vrQk8GnUOo8okBoDsZnFjt1ML6yogkPhLiN/Q4bMZK0shB1O8+N4BXNbJGLa7FI5AtXYUWmkLUC+NQlTu3b27ZXtZ10+2GTrojLLqvl3musJysNXfwEvPBod4KRnk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lzI3aPA8; arc=fail smtp.client-ip=40.107.105.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lzI3aPA8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vRW60FxCY/DSFXy4biRBCfpEZ7w88bKoOhvlqv7qzuI06F1IHPlGU08rKYmyNdu8zw5GcQ0wp/KLH01i8DNRWI4Z4XvTaH1BqsTL+VjWntUclySt3kroYQHYimuFPbe9Kik8KhAgBp3Hgta8b/5sfqh44y8qicqkPcQ8HfmICarcn3sLQWNKMEZsQ7NQJmSZ0KUUQB/FPuXvMEQxIaGmXuTpZ+xgvz6FqkAQ7CZHCD/tMVU/Ou3Bg1kI3FilV8cz0Zoh2mm6EiYRZltE1otG1RiUpYPLZDe649Ls7sOukMLZOebQRdTyeGAvFJgRdxOWcA4bm2KJ3vEXR2hqYZNppQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QHNicKeS5pVnREI1YhkN5BFjf7l7J59HKb5KyUleedM=;
 b=cnfra9RvT+LYm1ogXOQGkLIfWtHr2QEczJocS4OkIjN5edmFqj9GKlQSyP+PgnyJMpDQOgsn5INnulyWlp/mWmDwtmMiwD8QU6B0zVFuxIBycHO5svN79cF5Dum3GJUCysdGNEwUEfNPKxOHK0SatycvGVcr3a/HHRZgmaIyzd2yQ757HXGVvvKRl98sAQMBF8aOI8oj+DbzuLluJcZtp4NyUUA8/UwmWOPGxMYGvuhf2scTPmuVXlLkkqteD+vrnlaH0fuPlTlmvjACbIzuEMljazsIuFNTRoZU4lxZqGzOCF1VVy/MnDY/bLV8+DhyCBXNawB3VFJkienhki9ijQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QHNicKeS5pVnREI1YhkN5BFjf7l7J59HKb5KyUleedM=;
 b=lzI3aPA8MQi7NWT5Sb7EoR6cKE7RkD+KrPCLsfK0FCmBTkovCQafo38K4HY3C2iguszyAUNDeusxv3PmoaFP6szMPuU5Q9aaLIwwIPimjJMpOKY5DVpP7WJ2PViqpJ+X6cpkVtCNDnBqahTFRUEMBWwWF016sgXHP0VZhlCFzpfFCV3f63nk/nYi157H7zieEOtkg9Xn83g0IS5TcniQ/p1J9wHAFguDa2uN3tCrgSXPvr8ED816ugsAkZ9zjtJqxY0dTYRqJiNjXJfYS+u3Lcn+6QgliRe+UJtJyveQohubbr659+5SlzTPzvv/uuiCgFQxw2hHicrWtrX3NVIKaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS1PR04MB9456.eurprd04.prod.outlook.com (2603:10a6:20b:4d7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Thu, 3 Apr
 2025 19:12:59 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8534.048; Thu, 3 Apr 2025
 19:12:58 +0000
Date: Thu, 3 Apr 2025 15:12:50 -0400
From: Frank Li <Frank.li@nxp.com>
To: "Iuliana Prodan (OSS)" <iuliana.prodan@oss.nxp.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	"S.J. Wang" <shengjiu.wang@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Mpuaudiosw <Mpuaudiosw@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>, imx@lists.linux.dev,
	linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v3] remoteproc: imx_dsp_rproc: Add support for
 DSP-specific features
Message-ID: <Z+7dso+tsYpSBSFi@lizhi-Precision-Tower-5810>
References: <20250403100124.637889-1-iuliana.prodan@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403100124.637889-1-iuliana.prodan@oss.nxp.com>
X-ClientProxiedBy: BY5PR17CA0026.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::39) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS1PR04MB9456:EE_
X-MS-Office365-Filtering-Correlation-Id: c895ab0c-2977-40db-87f0-08dd72e38be5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AqzXgElseWeE/idiGWmgBwT7/TmohFvMhBVm+VFNCppWDVHuu8PrqkIMNc/Q?=
 =?us-ascii?Q?fjazET2/ftqXusXM8IVyVs8XAIZngV8NyFBMeYSLWhaD1ZrF3OVpQDw3s4NA?=
 =?us-ascii?Q?zcMfOxDj9KOkS7a74cMcCbz4FnGVYMROpIrauKZ7lmwOuk8kDVgEvlsQE4NF?=
 =?us-ascii?Q?vAhu1DPU9NuDFIStkpeVkjx2gvXIKgrfJEl1FKCmLyTbgQ6SMM6zngyoNwHc?=
 =?us-ascii?Q?pgPMuubldnHZZaKR4n9gmmKI45BZQEK6i4K3imthOfk0prfryus9FZ99HgpM?=
 =?us-ascii?Q?6nwe1KnMDHTwTnh/GNNpJWmvrFVz34IuC9cI3iOYgW5+TNUrXMsQgLkDknQI?=
 =?us-ascii?Q?Wm4ZpdcrqzX+BUuX1Pb5xk4okxwrc8mXdUE4AN8d5Qf2VL7NxqwhOg/0nV/L?=
 =?us-ascii?Q?+6BmiYJ4K1eNZEBfMDjfsZS7SACQ0dZnsQMQLuThe+c1DlmhvTKi4W+yv+eV?=
 =?us-ascii?Q?/HuUraE59xEwC76tRqGwuRSRI1v01LRbsokYTMrztVRDIGjgi85g5Swzfnnf?=
 =?us-ascii?Q?oP21tRRt+Q3FDvhkZgBa6fsd3FcRrz/66mLHZgezQ69hlpQ+vMtiuFDpOWrQ?=
 =?us-ascii?Q?bCdyg9ukMzUBIEW/20KEMHhmRIXxnXnIMtoq7VtcRUsOHyWNX5eNLkifuqGp?=
 =?us-ascii?Q?36X6PiZVx3UlACUAKvWUMIvliDuEsVASw8U8oXjSiiq3Z7/h6i8Y8mzOZ42c?=
 =?us-ascii?Q?BsvneTRZQ9aZpTcuY/PcHfr48aGkTUHmlx3IiA4NESnYrqsvzg3vIx3yxYNx?=
 =?us-ascii?Q?tG5073HdDU1gQnXPOPnJOt5e+jBKM3iLSq8vhEjOp6QSFix99DFB1qNoWY6L?=
 =?us-ascii?Q?h+kngcKtqzsjsf9hcN/efcblXgamTilXj0bhV3AeTbywlFN4aaiWdifSeNT3?=
 =?us-ascii?Q?Y0nfOgCs6QjPlCTHigPCXLYgT4t/tNKhTwwcJF3/C0R6hhNzAlevtSp5q1uI?=
 =?us-ascii?Q?RUluy3tIXlrf9ZL8iIBq5FLPlHgM4KT94PTi2h2BMI89QdR2z2J94Q786Lpg?=
 =?us-ascii?Q?/m0618EIFOMW3H9KgBVQKzdoLJGw7hZVTKrqHnMCsXtFD73I77GrS4x/9nCR?=
 =?us-ascii?Q?QF8K2ihq7yGu611QP33ARN6yge9i7I24HLJSKA8gu6A3duZ35wtgpcpPn2TG?=
 =?us-ascii?Q?C2/BpVEDAR0PXyiOBYQxKgO9B2xTZK/zv1IlDbVsIdURYpojzm7b4Wjxf0YX?=
 =?us-ascii?Q?uVdxeVb2Cr9cJN0noDMJuWr8MItvFsV84ECu/+6hQ6yD1UYxbl9X4Ll7wYDi?=
 =?us-ascii?Q?8LM0D4ifRqZez9q0e7teEs80uNKrigre0MwXmGbBLcLKFaUeFcLfwbrTLubf?=
 =?us-ascii?Q?tmjFMONuJfx4STcAMlhsWMgafAbPKUeNf8ce5P2q9hnrGddKG8em8O5CuOZj?=
 =?us-ascii?Q?MH+mpG5I2zapQVx6zg1pMgSCfvHFzOLkcAfqhgUZm4UWpQAVRTdSBgYY01Rj?=
 =?us-ascii?Q?eEG3nakwiS5qFMevcamF7r0MAoDPXGtMpD3CLQwjtAjeG2LjtbyYYg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+r8eMfMZ6f/JQTWBFicY3ryVWhBbC8PSj9HzINZs4zqPp7sMy5duJAWOP9Pc?=
 =?us-ascii?Q?1bhdqY2IKPDQpVJLcKqJ3f89IMuNQ3vbTjMlXQW7H3XKVuvFIzjSwlgppCq5?=
 =?us-ascii?Q?9ryIbN7J99OqeT3r6JO4mbovQj33VrQ/6qG0OG10bvnhlSw8uTeaz0bZ2w+W?=
 =?us-ascii?Q?NVSg4nVA2FG0Hi8qnB4QaAELHvjPGbTn933pEHmjiau98r/LuuKCVlYR4Ibc?=
 =?us-ascii?Q?jqXyYDL3aXcQMQZpzicopXbtRynx3gzvLL2XmQAQGLd4K35wm1LbiXkg9NkI?=
 =?us-ascii?Q?yPzTVqU/aCDiXexWMDZrBdCCrCcc/NlxB2tX+LlxrxMYIVmnJP4PiMRBLABF?=
 =?us-ascii?Q?TKesNI9fkd8ogV2QfGQqfU6EwtGHzuCKIX0UZf4WvMnqN9MFwYAtRHghySdG?=
 =?us-ascii?Q?/+6Db22e/sKlFukbNTJpnICkHDskNbe93iWCcLWaw1GZ3x0ooUTxAiRg6A7P?=
 =?us-ascii?Q?UCcAbFoQWSEWngiwg9VZWGdP4uX7x4qSkynpS6exM16uMjKMH6Zi5x3rRSbr?=
 =?us-ascii?Q?YCn6WyXkLz5M0qKfvGjTkjS/Zty4t1RFuVoiOpejszKy6PzxKwbM2CKw+f1/?=
 =?us-ascii?Q?OVGQV8ZhMEwcPiWFv+75QV+2c5uAMy6/QRKBGwP2gHbA4YINFDPNvW9XUh3H?=
 =?us-ascii?Q?y4Ks2irX9jXgA2PyARyD0OlZarK7tDOowEVlqgv+BsWJurbgtVTTHcqk9vA0?=
 =?us-ascii?Q?JWTQPM+nEg/JR7SUkte84O8mHJUqR4Qco5B4bHFoJleZZr5Nk7MLVoJzWXbZ?=
 =?us-ascii?Q?nHUEPMA5cJp77TZk6boblincIeysF5brxQdE4qscbXPHp/n1OFib1bps4XVE?=
 =?us-ascii?Q?6jGxRsPlWFhCy2OUqHK+6/ySZt1MyJXjcBGFbdTVDZCVsfSawU13euW1rqU3?=
 =?us-ascii?Q?Z3gwXwm6Cl3cmsc4teCnVCP1NnHDwLfEm/L50HxqkhRjJJzBOriJel2PcVSI?=
 =?us-ascii?Q?E6M9eoBr1OT/v3uI9dOisSfMtMqJNQu+a4oLZiBl1VsqnWTo0etCIvgGMBqQ?=
 =?us-ascii?Q?ws8lDUidaGgt0jYKVJaZ7AjNAD3u0asagpG36GNx9aWvDYXVnhins1RtZEKx?=
 =?us-ascii?Q?tO5sNsKvwOj22OBwmq65glHSqSQf6S7sYdjJ2pGmtKfuSxuAq8NaB4gBMHkc?=
 =?us-ascii?Q?r31Mz5QkhM95dCgmiUzmfNiiErP2sOXBwvoJ+EbFsJxR9xJhJFrdMF+kIhaL?=
 =?us-ascii?Q?OTzoKDAhGW5PnTEx28W3A2iVjMq2jFbb4ZCrLCQbnVWN0uOdzzg6xrcYOPW1?=
 =?us-ascii?Q?SUrZpXr3J6R5DaEN23AsARYzmyMZvOe1POcmnMtZajbjLtMXSjpX0oPS0GJO?=
 =?us-ascii?Q?jZ75ybxSuFSPvjo9HrHANeLt2Ce2/Jmi/Ibui2oPvEutTSCfRnVcKhV2qP47?=
 =?us-ascii?Q?s7udembv7UvXbBn53jXcxlWgWw8jAQS9p2dA6vN69LyBNvnBgGYyEx9sr7HK?=
 =?us-ascii?Q?BASLYl2G7Oq6P51sswF9egJhR+bz7FhQxskluES2ofiKi7HEl2OA7eiFUEsa?=
 =?us-ascii?Q?S5jf9tobSYx+/Rhybou9MvFF/Wmh3ow3WDs0QTy4+nmaxtucWf7WfK/ggrL5?=
 =?us-ascii?Q?WCfUdZHo0TZrKVY2xKjxU/2yVpIh+lQOqfHx0XRj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c895ab0c-2977-40db-87f0-08dd72e38be5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 19:12:58.8556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: otSn08ivvv6dYinvbc6kE+5qjhITpuyCfksZoeiYHiv19CTjI9fJbdaaLxvm2oQ0v1nS+ZK0ElIH3ymWb7Mr/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9456

On Thu, Apr 03, 2025 at 01:01:24PM +0300, Iuliana Prodan (OSS) wrote:
> From: Iuliana Prodan <iuliana.prodan@nxp.com>

subject: remoteproc: imx_dsp_rproc: add handle_rsc callback to handle DSP-specific features

> Some DSP firmware requires a FW_READY signal before proceeding, while
> others do not.
> Therefore, add support to handle i.MX DSP-specific features.

Add support to handle i.MX DSP-specific features because Some DSP firmware
requires a FW_READY signal before proceeding

>
> Implement handle_rsc callback to handle resource table parsing and to
> process DSP-specific resource, to determine if waiting is needed.


Implement the handle_rsc callback to parse the resource table and process
DSP-specific resources to determine if waiting is needed.

>
> Update imx_dsp_rproc_start() to handle this condition accordingly.
>
> Signed-off-by: Iuliana Prodan <iuliana.prodan@nxp.com>
> ---
> Changes in v3:
> - Reviews from Mathieu Poirier:
>   - Added version and magic number to vendor-specific resource table entry.
>   - Updated defines to maintain backward compatibility with a resource table that doesn't have a vendor-specific resource.
>     - By default, wait for `fw_ready`, unless specified otherwise.
> - Link to v2: https://lore.kernel.org/all/20250318215007.2109726-1-iuliana.prodan@oss.nxp.com
>
> Changes in v2:
> - Reviews from Mathieu Poirier:
>   - Use vendor-specific resource table entry.
>   - Implement resource handler specific to the i.MX DSP.
> - Revise commit message to include recent updates.
> - Link to v1: https://lore.kernel.org/all/20250305123923.514386-1-iuliana.prodan@oss.nxp.com/
>
>  drivers/remoteproc/imx_dsp_rproc.c | 102 ++++++++++++++++++++++++++++-
>  1 file changed, 100 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index b9bb15970966..80d4470cc731 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -35,9 +35,17 @@ module_param_named(no_mailboxes, no_mailboxes, int, 0644);
>  MODULE_PARM_DESC(no_mailboxes,
>  		 "There is no mailbox between cores, so ignore remote proc reply after start, default is 0 (off).");
>
> +/* Flag indicating that the remote is up and running */
>  #define REMOTE_IS_READY				BIT(0)
> +/* Flag indicating that the host should wait for a firmware-ready response */
> +#define WAIT_FW_READY				BIT(1)
>  #define REMOTE_READY_WAIT_MAX_RETRIES		500
>
> +/* This flag is set in the DSP resource table's features field to indicate
> + * that the firmware requires the host NOT to wait for a FW_READY response.
> + */

multi line comments should be
/*
 * This ..
 */
> +#define FEATURE_DONT_WAIT_FW_READY		BIT(0)
> +
>  /* att flags */
>  /* DSP own area */
>  #define ATT_OWN					BIT(31)
> @@ -72,6 +80,10 @@ MODULE_PARM_DESC(no_mailboxes,
>
>  #define IMX8ULP_SIP_HIFI_XRDC			0xc200000e
>
> +#define FW_RSC_NXP_S_MAGIC			((uint32_t)'n' << 24 |	\
> +						 (uint32_t)'x' << 16 |	\
> +						 (uint32_t)'p' << 8 |	\
> +						 (uint32_t)'s')
>  /*
>   * enum - Predefined Mailbox Messages
>   *
> @@ -136,6 +148,24 @@ struct imx_dsp_rproc_dcfg {
>  	int (*reset)(struct imx_dsp_rproc *priv);
>  };
>
> +/**
> + * struct fw_rsc_imx_dsp - i.MX DSP specific info
> + *
> + * @len: length of the resource entry
> + * @magic_num: 32-bit magic number
> + * @version: version of data structure
> + * @features: feature flags supported by the i.MX DSP firmware
> + *
> + * This represents a DSP-specific resource in the firmware's
> + * resource table, providing information on supported features.
> + */
> +struct fw_rsc_imx_dsp {
> +	uint32_t len;
> +	uint32_t magic_num;
> +	uint32_t version;
> +	uint32_t features;
> +} __packed;
> +
>  static const struct imx_rproc_att imx_dsp_rproc_att_imx8qm[] = {
>  	/* dev addr , sys addr  , size	    , flags */
>  	{ 0x596e8000, 0x556e8000, 0x00008000, ATT_OWN },
> @@ -300,6 +330,73 @@ static int imx_dsp_rproc_ready(struct rproc *rproc)
>  	return -ETIMEDOUT;
>  }
>
> +/**
> + * imx_dsp_rproc_handle_rsc() - Handle DSP-specific resource table entries
> + * @rproc: remote processor instance
> + * @rsc_type: resource type identifier
> + * @rsc: pointer to the resource entry
> + * @offset: offset of the resource entry
> + * @avail: available space in the resource table
> + *
> + * Parse the DSP-specific resource entry and update flags accordingly.
> + * If the WAIT_FW_READY feature is set, the host must wait for the firmware
> + * to signal readiness before proceeding with execution.
> + *
> + * Return: RSC_HANDLED if processed successfully, RSC_IGNORED otherwise.
> + */
> +static int imx_dsp_rproc_handle_rsc(struct rproc *rproc, u32 rsc_type,
> +				    void *rsc, int offset, int avail)
> +{
> +	struct imx_dsp_rproc *priv = rproc->priv;
> +	struct fw_rsc_imx_dsp *imx_dsp_rsc = rsc;
> +	struct device *dev = rproc->dev.parent;
> +	size_t expected_size;
> +

put
	priv->flags |= WAIT_FW_READY;

here,

all "goto ignored" can be replace with "return RSC_IGNORED"

> +	if (!imx_dsp_rsc) {
> +		dev_dbg(dev, "Invalid fw_rsc_imx_dsp.\n");
> +		goto ignored;
> +	}
> +
> +	/* Make sure resource isn't truncated */
> +	expected_size = imx_dsp_rsc->len + sizeof(imx_dsp_rsc->len);
> +	if (expected_size < sizeof(struct fw_rsc_imx_dsp)) {
> +		dev_dbg(dev, "Resource fw_rsc_imx_dsp is truncated.\n");
> +		goto ignored;
> +	}
> +
> +	/*
> +	 * If FW_RSC_NXP_S_MAGIC number is not found then
> +	 * wait for fw_ready reply (default work flow)
> +	 */
> +	if (imx_dsp_rsc->magic_num != FW_RSC_NXP_S_MAGIC) {
> +		dev_dbg(dev, "Invalid resource table magic number.\n");
> +		goto ignored;
> +	}
> +
> +	/*
> +	 * For now, in struct fw_rsc_imx_dsp, version 0,
> +	 * only FEATURE_DONT_WAIT_FW_READY is valid.
> +	 *
> +	 * When adding new features, please upgrade version.
> +	 */
> +	if (imx_dsp_rsc->version > 0) {
> +		dev_warn(dev, "Unexpected fw_rsc_imx_dsp version %d.\n",
> +			 imx_dsp_rsc->version);
> +		goto ignored;
> +	}
> +
> +	if (imx_dsp_rsc->features & FEATURE_DONT_WAIT_FW_READY)
> +		priv->flags &= ~WAIT_FW_READY;
> +	else
> +		priv->flags |= WAIT_FW_READY;

if set WAIT_FW_READY at beginning, else branch can be removed.

Frank
> +
> +	return RSC_HANDLED;
> +
> +ignored:
> +	priv->flags |= WAIT_FW_READY;
> +	return RSC_IGNORED;
> +}
> +
>  /*
>   * Start function for rproc_ops
>   *
> @@ -335,8 +432,8 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
>
>  	if (ret)
>  		dev_err(dev, "Failed to enable remote core!\n");
> -	else
> -		ret = imx_dsp_rproc_ready(rproc);
> +	else if (priv->flags & WAIT_FW_READY)
> +		return imx_dsp_rproc_ready(rproc);
>
>  	return ret;
>  }
> @@ -936,6 +1033,7 @@ static const struct rproc_ops imx_dsp_rproc_ops = {
>  	.kick		= imx_dsp_rproc_kick,
>  	.load		= imx_dsp_rproc_elf_load_segments,
>  	.parse_fw	= imx_dsp_rproc_parse_fw,
> +	.handle_rsc	= imx_dsp_rproc_handle_rsc,
>  	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
>  	.sanity_check	= rproc_elf_sanity_check,
>  	.get_boot_addr	= rproc_elf_get_boot_addr,
> --
> 2.25.1
>
