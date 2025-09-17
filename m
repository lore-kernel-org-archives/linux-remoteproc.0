Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011047.outbound.protection.outlook.com [40.107.130.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C31E2F0C58;
	Wed, 17 Sep 2025 14:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758119912; cv=fail; b=hj+fdUCNTba3xVTmmdUJxgvb/h77WmCjEL3AwAGwagPvkYfNrQtSfzMu+80BaTw+meCjqiwcwAZNDfE+dgdfhJqBgU7/gJM4S0MkDYYAZ2gMsYMtoh6wwGyIlEHYl5nkXovFpohsX7rShaYzX0cayJUA23YfO2YrC6yWUJK2QnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758119912; c=relaxed/simple;
	bh=rBBvGy+V6hu8l9VJqkezIiwlZDNOUUELGk/JEkqg4aA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=S6MEOLI1rJlIHyu31iKdUG92ligwOt+6qe5XRca8/rhyG+ZCTdzNw7+06Qxn+n+XKmDYpkNstxiHFRU/aBSnQYORVQ16M1O/nqY0eDoaa/ubbvRQgKqY1PddlnV0Du7BXfIuU9MlZt4ydL327j+0OmEONaNtgAIDRSgMaOBPFbQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NsqpjWs+; arc=fail smtp.client-ip=40.107.130.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NsqpjWs+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J5inD7LybvipEmgwFMVG9OIX8dHgCtjVymsAAk4b1xo9Ge7noO1ytaqSNPa6QHIisS/gFp7TlF3EJiDzzRCMDGi/uMXlfUzqV9flCrfxy+SIpGUuaPEKUCXSy5QmcNKhkBshGYH4zUZBzThRMNoatI+R30lZnfItNFUSJNVRpT2gf2la4Ng9oBFXXW32T/4rVAMJAZvQr+jBXGk1nUQJAI77eY9BTZ9fyckEK3GCymLh9wIHYWt9LxuiF/18RTUqyb1LtmgGsgQWODpC6BIOdixpIMkN5YtmnYmVQGw6yLSQG3ErIItOewqB8WyHdaY6A9clhvvU54YlimiaifOU8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ae9QfdsjhHnBC9Du/ShhayaTQeujfWxRCbpgyBE9IzE=;
 b=nPQeY+EGAoLtz7kaTrMMbkjB6+8B3AuM43EQKDlYE7st/prjhA+yUfEdsIQ2SyvlZ0Bb8QxJ+A3Jt61NQ1pcCHMClGffyAqQYw46jawgsOF+S5oQyboAgqG7d0MLT6vLpyCvEv8XlH1bN3BNuPWWDQoAQUo5Xw3vlurDcP6vboCDCfVfJl9+IhJ/rqhLYiXffROZU90qbf1CjSTarZkzw8ncf6u1qSMfEUHkFlgtgasf1st2/Fmd5ZfPTYI9Gj9lj+Lw/gKxaGBoxnxOwy5GtWOo3YZaabQPC64Id3+IgPuKtrvVEMRLOVboO6WPTOsyS5tq/7qCa11PX6a8ueRboQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ae9QfdsjhHnBC9Du/ShhayaTQeujfWxRCbpgyBE9IzE=;
 b=NsqpjWs+BvjJV8veQ2mIKlQUjIaNXKihkiVC6BpaEQ2rKLTHYvKpi2wLfAij78GabWSfTxXAhfIgFnYBXN6rrA6GzjaC3EndFLLFKtoZcx3CEw88GYAWdf1WxPDWoU4Cpqgba3G3TuCc8OJvoDTVNHgazjw5+tP27GXT7W5RLm4VcGGO+BoYyH5dkOHctnU+x8WWw9HoK2CpSdMbB6vvTXXZRIVRjlddHmaeBMTteZv8d1O7CTBTJnSwZcoz1DsOehJiczlzZn0QLDxWwOuD/ocBToGNnaoL8cTNnz43EHloPHyV4EsksukJT1IyblEaxsDMn8WI63pVCk1A98m+Pg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by DBBPR04MB7628.eurprd04.prod.outlook.com (2603:10a6:10:204::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 14:38:26 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 14:38:23 +0000
Date: Wed, 17 Sep 2025 10:38:15 -0400
From: Frank Li <Frank.li@nxp.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Hiago De Franco <hiago.franco@toradex.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] remoteproc: imx_rproc: Use
 devm_add_action_or_reset() for scu cleanup
Message-ID: <aMrH10vcC2216oRZ@lizhi-Precision-Tower-5810>
References: <20250917-imx_rproc_c2-v1-0-00ce23dc9c6e@nxp.com>
 <20250917-imx_rproc_c2-v1-5-00ce23dc9c6e@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917-imx_rproc_c2-v1-5-00ce23dc9c6e@nxp.com>
X-ClientProxiedBy: BYAPR02CA0060.namprd02.prod.outlook.com
 (2603:10b6:a03:54::37) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|DBBPR04MB7628:EE_
X-MS-Office365-Filtering-Correlation-Id: 23c966ba-4532-4d90-e6f4-08ddf5f7dae6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?776+BkXeG93TdHADX4qKpyoZfvj2/XWuAscknMS9GnOp0neef9ZYjPK943Gp?=
 =?us-ascii?Q?QFd7h6OSmO2xD9+BTTV16prTuJ9Q8qBW/Hp6xUdjjfbn/X0nGNNPFx6Td54B?=
 =?us-ascii?Q?qc30ALCBc5PN8LiC/lSgbk7J1yy3IrwsRCfNrxUyDtP/kOA1O241WZq8qWB7?=
 =?us-ascii?Q?0hIt0Jcj9wvuZHvdQLpza78Dg01mjjtIra9JYPXw/QAxv4Pu9o7xKvDH/8+E?=
 =?us-ascii?Q?8v0422LtvnahVlZ7ROmTIs/yVLwQXbUU1V9BxhQTHxPEKSRmQ4JBiafIiCoe?=
 =?us-ascii?Q?XlnZC18hC52JNyqnQ3jjTuzUlOkg+XDHnbZZydrdImqV5bocaUglP5qLIndA?=
 =?us-ascii?Q?KFEX9oewEK3cq4PFkV/7PtrcmMZkzIn5yNPOzRapPqrFIXGAUfI++/J+Yq/5?=
 =?us-ascii?Q?GUv8u59OxsVpsI4J3RlN/ptoaxba8ZulrceacI8BdRzS6wTDnd4j5Dut/EUB?=
 =?us-ascii?Q?7d+7e99BoTNB7AQCLFsNMI06xF3W93Pf7Lgj0M+wS44G6qIxAgWnEXWBWr63?=
 =?us-ascii?Q?eQQN42uOFmcnY/VOs7iVFRQGBkVE3cy56fRn5mL5b6IMdZT5c/zYGswR3j9K?=
 =?us-ascii?Q?YRjOgzMkyTVmeBfu2gGCM1ynKtYmO6plPFwNYdZSouMOB4rUubTp4Z0m5XOr?=
 =?us-ascii?Q?eQPOjeINWVe9ki89wzzILXwp3DMNQ+JmgRcAlAqEMh0AahvmPt2jxdcphgqc?=
 =?us-ascii?Q?STlAqZY30iYbL78kf+jC2J1Lk8wEVh8bSrDHM/N+to1NWPBpsiN73YBqbUIh?=
 =?us-ascii?Q?ZcgguMxab72/CIjZVm6oCMlM6B7Udnytlw+DwxSACl4kR8/rIMDvNvdo9H50?=
 =?us-ascii?Q?B1m0KVcYGmtiTNYbfLukOz0QAatfiNK39eQ7ZZIz1FTWIiHs5jqzFYp+ZUyT?=
 =?us-ascii?Q?r8GgAziUBltqvKzEJ0pzNvD9Vhjh0VGFL5kolnpG7RXrlaRZN6GfqzRblbMT?=
 =?us-ascii?Q?r8D0UNAFw2rr28z+VsUihHBvO1v5cnDYFTajSCnQ3EsTAI2ZpuqblFK15u2p?=
 =?us-ascii?Q?0C8NWWDoEAXuC0W6QZOt/U1TUwvfq5wyc2xH0G6o9/N5ciYkReZpcYoILr0q?=
 =?us-ascii?Q?OZrox1tMM9fVuRW4bLWJRrrDqGXRmHGT40c1J35qzexYegxnCMFMboLKDnex?=
 =?us-ascii?Q?4Z5OMB43MsaLn0hWtgey2eOKZwgFAkpwHb2iCrHpQE2YpC768Q5Ixq1L8F38?=
 =?us-ascii?Q?TvQqiWrEPejmlpMd40WKbEjhbbQIVZK8bTo1TRRW2LpFS2cvcIHSoYVtOFJ/?=
 =?us-ascii?Q?RihuGW7YRIbzS5KM07YMLsQLqkuupO0Sv28pL6tIJUUNQ2qfAXLyRzpsys1/?=
 =?us-ascii?Q?XJwYFq35SmHHSzZTO2xNuiB75ARpTEGjkJyZo3my8JzQYFJyPfmr23iju2Zz?=
 =?us-ascii?Q?JqcoxFIRdFy5DPG8fpDRHwQKTR/Je/AFy/4QA2eHUmqTyJsgOwmK2Ce1LhaN?=
 =?us-ascii?Q?8jCxNDdbTq4AEDt0qg8RNbnLk5pS6ky7klMNo8mIPXMCJBuwyMq+YA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DIqev/7DKk3+mKdBYMb8a5mhrvTh4mSJcWLMiNH12gb6my+qRdL6kyZ20KYG?=
 =?us-ascii?Q?vYVNkB/Tb4tgG//9k0X2FswxDdKaePYfE0yth+Vy7fx85BAbtcV35piKcPY9?=
 =?us-ascii?Q?Mp7wMZbMQlY1xY4VqAzG0wkOBGhzlavB853ESUnSnYwOF6cV9gxGdRUjp+6X?=
 =?us-ascii?Q?5UoTXBJ7B+QVFG4mt+p4BtIKJQLxsFWBM9lko5ZLXjJD8Dsdz2loveVWaTTW?=
 =?us-ascii?Q?EN9ZZ3oU2R6b3wEpWcredWVjQT/apy26+rRUmWv0zdi756up3aIyX6DpFEDc?=
 =?us-ascii?Q?7RgS5XHpjDp28iSJOt3dAW26hg4KYSvr15zU9v5FVsr6ItVewc7JRgkKuV1T?=
 =?us-ascii?Q?W09OgWnO+6Y1Nh1EywlNagb/teNTVMAxGUmL/WbuSe3VbbJSl/6PRpE9WIxz?=
 =?us-ascii?Q?1KzI2NWSqjhu0pKP7kbjc9HJoM9Un1C5qGg8o966hVnODOnpit+QIPTIbsdJ?=
 =?us-ascii?Q?K9qb1UJ+k7s7nScSVrLwORGfaenGIeTLatqPp1r3a7R1Yf6NMC4qxmrJuvz/?=
 =?us-ascii?Q?w7UJNtImCb3d/0B8Wfud4En6zbLs+lk96/AusckPrykoiPWEVGFHoOV2q0oa?=
 =?us-ascii?Q?tkiUj2zEbRytnpZIuCJWPBCbfxDG+1Iih28vKeeDI1RFVCz6tEIyOb2NFa3g?=
 =?us-ascii?Q?na+UCAKHJ4LNsyABhAsl6s8BmrIr0uXTGq9q71lyb6i68QHbvgQjrlWdsXse?=
 =?us-ascii?Q?jCqX8UOI+pfK1jU074wDbh10eu3iJHVNFowl1rY1f538v1tq76LyI/9uvrhQ?=
 =?us-ascii?Q?1QaJR5iD8Q2luI13hMCN/xYsB/uLarhX4S0iLDx7p8dhApjcKPvVEXAuTcXq?=
 =?us-ascii?Q?n4CvWoKj2ULADIT0Nmvwr5M0gqOdzw+QqijF5y8yvPuwfxqBoM8RLRWkCCwJ?=
 =?us-ascii?Q?7PpESchLeCdGSdlmMb0cLNm1N7kJmCufp6UfJshnQeQXZi0lttM59EL3CPbE?=
 =?us-ascii?Q?Ce2YdC9U6vcKvd2pYt0Dd620yXlPLTgwJt82K5EyTt+0cJwLBFoZlCfMaH0Q?=
 =?us-ascii?Q?0kap+d95OavZhg1vMlbdRZLPN6Fpc1TszOIvgPrNS2H4qEyCb7hWj+lSWwOV?=
 =?us-ascii?Q?vdtxTBQ5zkSrF2ZkYnpFOBNW7nZXuVjc9syS+wSNLf86QCHvk4D53GTBpBqa?=
 =?us-ascii?Q?pcBg7z4iKtK3h0WnsN5NCnBPvBIK1ta5/Qpm54N2bOCeTR0sWx1bGfAgkI0/?=
 =?us-ascii?Q?LVpy2SqRr8PQk6AJOhzgtzSW0lL50kUZeZLFJUmInxNnrnsaHptxBR0zKJ3h?=
 =?us-ascii?Q?1IywLu/IWKy5PIm8+BCfEXA5pBckqkEZCV1PdO51CcL++ZIr0EdM3FXGFEgX?=
 =?us-ascii?Q?/xKsKz9mRE7L0tm3gwUK6D1Jt2tThR7Ej+iAitueQh7ulZjnjarVPuRwNuTQ?=
 =?us-ascii?Q?MwVnjV+5w0fjPKgljqZcR6KSu7mrKEO7BTCrCO0Xbj+sQgoWiZfisch5zMEO?=
 =?us-ascii?Q?e6bgDBiQB9iuHd8xY9vgKgoRG8//qzYKBKC+14+FBg0d+FJPz1xd7nyTGAHr?=
 =?us-ascii?Q?35L0NcnmHMce8s2giDJlljS/3tJEGk76plGpCsK4DIVi2BSpY2wwZaPkYGyv?=
 =?us-ascii?Q?6aBYcSLX6LIC/00rkW45Dy28M0Uaju+MxwCia7to?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23c966ba-4532-4d90-e6f4-08ddf5f7dae6
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 14:38:23.6148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WEuLDR8IWDuuXe1eHjM2z4i3rVBz36ag1VE+OramQfYW0FrmO8VDxtfvw882otOwPnffXdi6a4aLh5qcznn3Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7628

On Wed, Sep 17, 2025 at 09:19:17PM +0800, Peng Fan wrote:
> Replace the explicit call to imx_rproc_put_scu() in the remove path with
> devm_add_action_or_reset(). Ensure proper cleanup of scu resources and
> simplify the code by leveraging the device-managed resource framework.
>
> Additionally:
>  - Remove the IMX_RPROC_SCU_API check from imx_rproc_put_scu(), as
>    devm_add_action_or_reset() now exclusively handles SCU cleanup.
>  - Improve error reporting by using dev_err_probe() for consistency and
>    clarity.
>  - Drop the err_put_scu label, as it is now redundant due to the updated
>    error handling approach.
>
> No functional changes.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/remoteproc/imx_rproc.c | 57 ++++++++++++++----------------------------
>  1 file changed, 19 insertions(+), 38 deletions(-)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index c6cfb308ddb376f370fd4492f8a84f734602bac8..a53ff186d218f54123e1ce740b0277a6fe95a902 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -796,13 +796,9 @@ static void imx_rproc_free_mbox(void *data)
>  	}
>  }
>
> -static void imx_rproc_put_scu(struct rproc *rproc)
> +static void imx_rproc_put_scu(void *data)
>  {
> -	struct imx_rproc *priv = rproc->priv;
> -	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> -
> -	if (dcfg->method != IMX_RPROC_SCU_API)
> -		return;
> +	struct imx_rproc *priv = data;
>
>  	if (imx_sc_rm_is_resource_owned(priv->ipc_handle, priv->rsrc_id)) {
>  		dev_pm_domain_detach_list(priv->pd_list);
> @@ -944,6 +940,10 @@ static int imx_rproc_scu_api_detect_mode(struct rproc *rproc)
>  	else
>  		priv->core_index = 0;
>
> +	ret = devm_add_action_or_reset(dev, imx_rproc_put_scu, priv);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to add action for put scu\n");
> +
>  	/*
>  	 * If Mcore resource is not owned by Acore partition, It is kicked by ROM,
>  	 * and Linux could only do IPC with Mcore and nothing else.
> @@ -1110,7 +1110,7 @@ static int imx_rproc_probe(struct platform_device *pdev)
>
>  	ret = imx_rproc_clk_enable(priv);
>  	if (ret)
> -		goto err_put_scu;
> +		return dev_err_probe(dev, ret, "failed to enable clks\n");
>
>  	if (rproc->state != RPROC_DETACHED)
>  		rproc->auto_boot = of_property_read_bool(np, "fsl,auto-boot");
> @@ -1125,61 +1125,42 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  		ret = devm_register_sys_off_handler(dev, SYS_OFF_MODE_POWER_OFF_PREPARE,
>  						    SYS_OFF_PRIO_DEFAULT,
>  						    imx_rproc_sys_off_handler, rproc);
> -		if (ret) {
> -			dev_err(dev, "register power off handler failure\n");
> -			goto err_put_scu;
> -		}
> +		if (ret)
> +			return dev_err_probe(dev, ret, "register power off handler failure\n");
>
>  		ret = devm_register_sys_off_handler(dev, SYS_OFF_MODE_RESTART_PREPARE,
>  						    SYS_OFF_PRIO_DEFAULT,
>  						    imx_rproc_sys_off_handler, rproc);
> -		if (ret) {
> -			dev_err(dev, "register restart handler failure\n");
> -			goto err_put_scu;
> -		}
> +		if (ret)
> +			return dev_err_probe(dev, ret, "register restart handler failure\n");
>  	}
>
>  	if (dcfg->method == IMX_RPROC_SCU_API) {
>  		ret = devm_pm_runtime_enable(dev);
> -		if (ret) {
> -			dev_err(dev, "Failed to enable runtime PM, %d\n", ret);
> -			goto err_put_scu;
> -		}
> +		if (ret)
> +			return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
>
>  		ret = pm_runtime_resume_and_get(dev);
> -		if (ret) {
> -			dev_err(dev, "pm_runtime get failed: %d\n", ret);
> -			goto err_put_scu;
> -		}
> +		if (ret)
> +			return dev_err_probe(dev, ret, "pm_runtime get failed\n");
>
>  		ret = devm_add_action_or_reset(dev, imx_rproc_pm_runtime_put, dev);
> -		if (ret) {
> -			dev_err(dev, "Failed to add devm disable pm action: %d\n", ret);
> -			goto err_put_scu;
> -		}
> +		if (ret)
> +			return dev_err_probe(dev, ret, "Failed to add devm disable pm action\n");
>  	}
>
>  	ret = rproc_add(rproc);
> -	if (ret) {
> -		dev_err(dev, "rproc_add failed\n");
> -		goto err_put_scu;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret, "rproc_add failed\n");
>
>  	return 0;
> -
> -err_put_scu:
> -	imx_rproc_put_scu(rproc);
> -
> -	return ret;
>  }
>
>  static void imx_rproc_remove(struct platform_device *pdev)
>  {
>  	struct rproc *rproc = platform_get_drvdata(pdev);
> -	struct imx_rproc *priv = rproc->priv;
>
>  	rproc_del(rproc);
> -	imx_rproc_put_scu(rproc);
>  }
>
>  static const struct imx_rproc_plat_ops imx_rproc_ops_arm_smc = {
>
> --
> 2.37.1
>
