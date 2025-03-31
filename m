Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013071.outbound.protection.outlook.com [40.107.162.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB9117A2E2;
	Mon, 31 Mar 2025 14:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743430592; cv=fail; b=nltbykcr5o4ZxDEMTiLDmqeSWR6buxOSJJjl5B121+QekKCKV+9ySEAARvI1Ae3J5BoDLqT6G6wMqNbHc8DADBsFQzOqChbY0OoS/80yPqRVQyq592Kyp2reGchxuZ7RyWwq1Wkl5zShGasQIZ/MefD8p0dNMCEB9szWYJohd1w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743430592; c=relaxed/simple;
	bh=al5pQSiRvG5668fep/NohbXgjfMFPNfQsIPotB3l4go=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NRFaqt2EiU14C75moAhYC9FfQypIji7PCEL3NX2i02UhDNNQIjXya4mOJ4pfX+utPwlJCcxjijxkv8Ay9+FrOO4U9bsK7Bj8lRgblY6Edayeib3+gazl2dnJaLPQZxuXlvCVKzbe52MZiaE6riIUs97Kz5VtCwtzWqG5YbxmSV8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UiCRpv9Z; arc=fail smtp.client-ip=40.107.162.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UiCRpv9Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w+M3T8s2mPDwda9uxszuNGqdyFgEAndp8+wa/iUSopmi4nxT3/KO8TtrZdJMIXmXhStsknz2DehAty678rt5sySXl3xsxkDcWkh25Bb1H2FCzKDlqIwnYoKx8VjG3gecndvDt2MCpWzrV8p1U1j67oqUbMMK8iRSYOvoJQ12woq3MP55qhlaZQl/FDONLPmgPdt/oZCGTvdTvULcX6twR8GrAN5w9/+XjyqoT3hJEg/hBynfxQd+mrn/Tca+q95ka/z0ZFfJlJNhJUxlejx8L5fUGkY05GqajRZ1TmHeM1TMtdcqPNjm5ZUaMqEOasZA8TCpfcRtmuzy+xL/FdqCHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qp5cksr7fwfPXSfHWf8hFke7BkxV2I+6rB+DEn88FDk=;
 b=q/i6tTTN9bjRXv9yVsBZMXrAaHpjU42A0M4/lhZFvbsmccNaxwfV4LqsY5RG4qk24S5LrscJtBU7x3X7QfET7xi9EklVejWag8E0uptRcltmovStt+njMT0oqLXoj9Mf5E+3mFz54D5gdoZ5XR44lpjf4q/udEDuWpgwTNBqnHQgmK4U6mH0ANUzCGI7uHMRWXylzoWUzGaDwUnkuoYk7vYKsb7Pnyb8mLoVBE0M+QDoni+oJ7ck5vvej4Rti/UwEkUYeIu8E6CdPaf86iHXDoebvC2/qdnmeMveyZthNlHPRNQ51RfTWturrNjIuzbWV7dyWOfANuVSvjCLt2Ptbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qp5cksr7fwfPXSfHWf8hFke7BkxV2I+6rB+DEn88FDk=;
 b=UiCRpv9ZNbKaqwOYYnvPPqi1o8Fgf6UHSyGnGR7s3xM+zdwyBbObVvGypXyWZaVoMet4enqgM2YK5S8ScWi30vXfVTrXeddC5cehGkjhdHRWqw5wdkXD+XjI2LioGe543A6inIkVlixrqOSXUQLLbxLb4Y8vc677A9UZKiYOv5wYya+kBnrZzAtQLIFWFagkqEY9TFcx2AKyZcEwqCwbDDmtyrmNDzCAszZ1LTH5RWIDxkWewt/pAkN3dV/aQjMR2LSRmtD+ws4fgODMKchyPfL2MUoxt8f0BiPZEegZRo9Pihj180qs74DxpRT3yOMMZJmUuoJ9bYNQN9t/x2jJcg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB9076.eurprd04.prod.outlook.com (2603:10a6:102:22a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.52; Mon, 31 Mar
 2025 14:16:27 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8534.048; Mon, 31 Mar 2025
 14:16:27 +0000
Date: Mon, 31 Mar 2025 10:16:18 -0400
From: Frank Li <Frank.li@nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] remoteproc: imx_rproc: Add mutex protection for workqueue
Message-ID: <Z+qjsqMbejeV31ej@lizhi-Precision-Tower-5810>
References: <20250331112246.2407276-1-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331112246.2407276-1-peng.fan@oss.nxp.com>
X-ClientProxiedBy: BYAPR05CA0060.namprd05.prod.outlook.com
 (2603:10b6:a03:74::37) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB9076:EE_
X-MS-Office365-Filtering-Correlation-Id: 11fcf29e-5b14-46ca-aa76-08dd705e9fd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9h4rWI4JEmilir9dfkaOXY088CA0vwft7iyLurMGxZRpqEwAWcX8uciCI2wd?=
 =?us-ascii?Q?iegBjejj37RFhnXfeyQ73z0D2MsbfdtFGba0L40OkztEgLuRmmRNwZs6O27n?=
 =?us-ascii?Q?3Q7Efhe1bsJsMkJFuyUhMBRBy2Lc9TZGfkSEBt8Nr8LA3S9g8IhkNo8hvG9M?=
 =?us-ascii?Q?mKY7l7Ldhfz8Ua4jGvQiHqZbOpRQ9Ph3nz08adExi+x842TvHd5cgdCh05Vo?=
 =?us-ascii?Q?de0KKax04wMXZWpmph2PxtoBj4Ko55Jpb6YYJyYybxtLsnPeKl4lXGDvWYiP?=
 =?us-ascii?Q?mggEIV3F5C4vEIYa23B/t2aB7ZUUeNn/3knMmXrWRWT4vBZM8RwbFb8+dnMs?=
 =?us-ascii?Q?kkHzXv3aZi5CGpi1zS/7bb2csxdhSESeHZ4Tt8CmdhC/2yi6p5Kryy1UAczR?=
 =?us-ascii?Q?w4SqEylauztCSmRPqnNcDXTP7C4PbaYLmeT/BlWkRvlAAvZ3MBoo2ZCZTaur?=
 =?us-ascii?Q?7zMMLa3IxmNJcOQuJ8Mq1FSj9hiZc3uhpwzizOE47bQ59mcEvMYqUzWlcJm+?=
 =?us-ascii?Q?2oy1U0WYO8StTnsfYUydZ+wE4wM9zRIb2jRAPbh4MclO/XDWCrTpUPsM1raD?=
 =?us-ascii?Q?9SuY3uxMknEY8D9gpGFqmQdfMpOz4KHtwO/YDjAsw5qF06joj7E/Yz58ezUB?=
 =?us-ascii?Q?8z4y0h5B5KlfMrodYiothaOQspJq5LIH/PsZ/SCTMOiXKfVH7tlcpt03aqAT?=
 =?us-ascii?Q?2ogmLqGgTWl36XP8PPwxeweqC464bEBf/gFhh9EyROZw+oZPYJInclrT5aS+?=
 =?us-ascii?Q?mKjt48x38BMhm89nT/46vOG8sAnjlaeoSJytvluhWZ8K5uV2zLhHohnTrdNa?=
 =?us-ascii?Q?uwIWjW6zmNvdTBJck1MaHFqAxUswJEhhG+PyH3Vf2KndL+sQY2jUsujeWp8X?=
 =?us-ascii?Q?2DBi+fdGO2Azlc2b0e1ktxM8jsukC87OfIAMc5IBmHwfoeXRHsDHUieIXPTo?=
 =?us-ascii?Q?oMGyp4dnTNFon1gHnalcukjojZKtZZFDgjMg5a14BfHhdtmv0wJ66TP7/iMA?=
 =?us-ascii?Q?PzR2DDIRP2aIT+rqgE1pRK8shMeln7sazpQQfY8ihAJThtmvzLEdBwS2ORb5?=
 =?us-ascii?Q?5cGzoj5Xl2U7/ymbULkhz0pbR5Lk8PL1aSYrfpXOQ6DCmuNpdo13FrD0Bf09?=
 =?us-ascii?Q?hfamQMwMO8oQjnYA5eEW73qQ7e1VeJqh1D3zJqBNdqv9EmeqBEuaUsuFyPY8?=
 =?us-ascii?Q?O3bpZjSweALNvLzcTLl9lr1Msb/NVR8wcCb/ku46VVB4sObb7G25/phU3g/w?=
 =?us-ascii?Q?WqB+5IBcith2URAzC0xiMvA3Oj8unrIajiUhZBqt9lCSGXCocWLejWB2gz7N?=
 =?us-ascii?Q?kG+td8lXL1bQZftAn6E4w5YhKKgWJBww9nC4wYjtko8f1SppSwk4t6tEU2Td?=
 =?us-ascii?Q?6Lvya58NNAfyUo3SyiEYCp8uPfefK2XCtohjSKSzToSBftAhmQpwUJgpc8Hi?=
 =?us-ascii?Q?QVsZhgfHhBBiQJkj25PNJHVWS4q/KwmX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x2r6dDb8k18zqNu//VDcum7ErNW22nLTI5VYgBMbluHA/+L9la2BUn9tM76o?=
 =?us-ascii?Q?PpB7h5P8lyDKBgo7U9FogKuBw7qWu8OCfcFpZEgbezt2xw/v8rjcWVLj7HIK?=
 =?us-ascii?Q?e1vMLnbxPTQX1vTVQvGh1YIDQ6s77uLPBDyJxam4qHRItH9N6tf4UPdLk01v?=
 =?us-ascii?Q?uODzVnkf+uwsaVDpKaF0/9/OyKgCGSeTKzgbv8DZYUa3rMIRK5h5vLWOGAb0?=
 =?us-ascii?Q?VMeIBl7V8zu1OVBpdXxj9+1QWiBVMw/d5oGsl0Nc9G+fNsqxgBoHp+Cork+g?=
 =?us-ascii?Q?bEJKqGnE9he5NHKlhflBWY44VXVjTy5cmhNqs/yExk0DzgIbSuD8DIWpwCU9?=
 =?us-ascii?Q?5jgGae5dmcBJCsLQZ+jonnVxxMD/SQ/UwatdH8wYofUZVkSqPZTarVfclZ3C?=
 =?us-ascii?Q?QJ+Ph2fOwLEgSPjoB7sXUlGJTE1h4D0fa6JjiSN78eaaG1VPqKszfgpezJ75?=
 =?us-ascii?Q?/C0MusGRuOysNJT23sUv9WL8eV43ryBdYtU6ZheVBc9uNUf8nW44XA+WRT6g?=
 =?us-ascii?Q?YpDinyE+1DYsAj/1LGnsIcQhE8rBb9D7RenGkFkJcEZmaEgrzkyxzghQKOGd?=
 =?us-ascii?Q?LLUcI3vg8PUKukAg/F2Qp8+zAyEB4AE1b1LxypmuO6ZkVQUMOpEW3JhdUSJY?=
 =?us-ascii?Q?ICE/VcE/35on82SfCNt1ARvWcVlLnLMtMpI9150Qc8j0hBF1DFmSqRI3gWj+?=
 =?us-ascii?Q?GnMH2KGTIe/mjAUFFrFvIYLnK/QfccS4YptbCVmKmDmeeF0VzqF7CuaogiR2?=
 =?us-ascii?Q?p4RzoqySEeX8XppsdeJSP3h/PSTz+/+3vgTwMVDvRo91l5S+kPNFdMtZGlcb?=
 =?us-ascii?Q?b7OwMCbABnbN71p9ix8AP4lpmakPDAAgDgXm2qJGIFr+TDYs9/4Zl9ilpFR1?=
 =?us-ascii?Q?LPXZq8h8FgpiJDS49gS6jCzNRc2gFGPI1Arw+8Fo801WrDYWE+m9TtrtqDPE?=
 =?us-ascii?Q?+/p7G/Hop2tUDw/v+LBrWwH/et8GiQQRkoiKA3biHnQDsUswUCLButFdFYDe?=
 =?us-ascii?Q?O7irn77LHRGaPv0iLo6hk4i0/JUI51Mj9Xw7swbTIlIUMXdWFrV8yuYihQpK?=
 =?us-ascii?Q?9DfEZn2AT0ms4xpA4LjGILxNZrLuc+134efi+8ICYCUMia3lmNToqh3XsN5T?=
 =?us-ascii?Q?8oHvDJz02W2L2iRQlngvXVXngrwNRJVsR+D2ix/DEvfklkcXkWyuHiYXTIZO?=
 =?us-ascii?Q?T58iGQMabPxeCHM7TI1hyhL96s3XCS6b4qmmVFKfa5OVZDYC50ZJ6ZjeC7PM?=
 =?us-ascii?Q?Yb1OfyAssrm5flNFmOqdzmxhHuTyoqoKMBx8oz2TgoBnMcrXvjxF1yNKnqBx?=
 =?us-ascii?Q?Ri1OftRGJZQhWdohgrrtg/eg6XJav9TDXwxKjx4zCwJNN/b+P+VfHq/Bxr/V?=
 =?us-ascii?Q?YIS99WYCIraboobZaSXgZ0yek5hSETM7Ou9jhQ6wFGiF0HqdT+g7aNzgG9kP?=
 =?us-ascii?Q?QskD21vxJve6ld/+j5e7ZuupB/Lud1NksPc3hhZ5T74jvqi8QNYnp5hsxm7P?=
 =?us-ascii?Q?KAaaksCS+H9oPhtUyusz7DC/uB8k2ZyUHl2x5RMtJ/lrB4d3NscOWWYtVu8M?=
 =?us-ascii?Q?h2bQWx5aM/rjamMP+/o=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11fcf29e-5b14-46ca-aa76-08dd705e9fd8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 14:16:27.0657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8hUaxyOS8W15HlpsgcgCLTx4jkNEbWHiBeF1IZ8F2DIiDYiQtihYiLaVNhNEYhAgf6H5KSDyTRkdwzNuRiE0Rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9076

On Mon, Mar 31, 2025 at 07:22:45PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Same as
> commit 47e6ab07018e ("remoteproc: imx_dsp_rproc: Add mutex
> protection for workqueue") and commit 35bdafda40cc ("remoteproc:
> stm32_rproc: Add mutex protection for workqueue"), imx_rproc driver
> also has similar issue, although no issue reported until now.

Can fix wrap

Same as commit 47e6ab07018e ("remoteproc: imx_dsp_rproc: Add mutex...

>
> Reuse the commit log from the fix to imx_dsp_rproc:

This sentense look like reduntant.

>
> The workqueue may execute late even after remoteproc is stopped or
> stopping, some resources (rpmsg device and endpoint) have been
> released in rproc_stop_subdevices(), then rproc_vq_interrupt()
> accessing these resources will cause kennel dump.
>
> Call trace:
>  virtqueue_add_split
>  virtqueue_add_inbuf
>  rpmsg_recv_done
>  vring_interrupt
>  rproc_vq_interrupt
>  imx_rproc_vq_work
>  process_one_work
>  worker_thread
>  kthread
>  ret_from_fork
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/remoteproc/imx_rproc.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 74299af1d7f1..f933c8f4fc8b 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -5,6 +5,7 @@
>
>  #include <dt-bindings/firmware/imx/rsrc.h>
>  #include <linux/arm-smccc.h>
> +#include <linux/cleanup.h>
>  #include <linux/clk.h>
>  #include <linux/err.h>
>  #include <linux/firmware/imx/sci.h>
> @@ -785,6 +786,11 @@ static void imx_rproc_vq_work(struct work_struct *work)
>  					      rproc_work);
>  	struct rproc *rproc = priv->rproc;
>
> +	guard(mutex)(&rproc->lock);
> +
> +	if (rproc->state != RPROC_RUNNING)
> +		return;
> +
>  	idr_for_each(&rproc->notifyids, imx_rproc_notified_idr_cb, rproc);
>  }
>
> --
> 2.37.1
>
