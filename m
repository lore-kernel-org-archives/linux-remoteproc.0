Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012059.outbound.protection.outlook.com [52.101.66.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA42035293F;
	Thu, 18 Dec 2025 15:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766072268; cv=fail; b=TOIQLl15COqehhwY9//vq2pGKFvQZrcI8Czk8SqMXwubrya+nXzXN2jeqnpP7Jf3pyDh0zdEnoHDByCx85BcRTEOmJ92hi3lC2hYkCldpzgkaw+nxGrytZpcpbAQnw7xFyM0Udm8+I3rkxdyFAhG8bkTpeCrBnBskRz7pkpDrds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766072268; c=relaxed/simple;
	bh=S5w8naWwSB61vDT+n3nvTUraAYPQRsnlDtVjeqqapt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WTR9cnVHvPk+EkSmRa10mtHEWp75shIaLzMbyhWfQtrl69TfewhcNpVila/4xDYYHSSiQZCTG7avQ9Uscd89fHdKOapmeeK0/nQH0cKvOVbUJefwAvYIVtCvFcFO/mbZzDyYr93pPcdZbXHrC0n+hb37kN173fcDyssg/zQWDjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mKtU99GX; arc=fail smtp.client-ip=52.101.66.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mKtU99GX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XNfntVhi+f1eSHsMUJWjQ6u6sVNzbzApYCV4vFDxn6Dc3nGgWGdCjdhau5MaPAEzPRSfUFiI4lcelMeKHtjuRmGjb4y7nqIHk3sUxpsmh0tT54PJke1D1S0i8SYH83qfsLQkeOeY0/JKo+5UpuD8vFs87uVgDJcdi7WLqaUP/ZAP7O9amLRk/C9MWVLhAHP9N0GENjopfFsnUuPVE4Ckin+uNQ8YwogXvcRouJACkkZPP4+zV2opIa1kQ7RSY705VNyoF7z5KYDxhiAF6rIexz04inRSet9zpggz62luVR9Vx+CbL8rXgZ02cmPN87uuQDRCLTtY5NKOGfYkuwOXIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kdgLMroXemhvo1SGOC0fd/F1NlaXDQpAtVGJf2IAEoI=;
 b=KRlxeJv3W/InhZU2WSXAhemFYPtY8sMePJ+By3HxAr876rM33jdz6VOhfuvvtw1chuWe53KNofk+N5vslHA7jZwGpP1Y6TI/AopsD9aEGEpXUk0+2f7pPuXNUDdZQlQ5h3e5uxKblLvgF1jEbxXi8pcCoTmEWTUNOfV96dGEnUzdAyqLbRpC8pwvZW2nm213rMiXab1LaT8P2gF+3eJUbCMRjZudRb1qfV2pnOurhlJ/wMZwLEzHjla4aN2B3OkMLdiEKBnWGDhDnjpOMWsHknVkjMohWfcX5mRX/cJGHGkTXs32n2qe4Tn/8fYqkqmV2C+plRgz/MqhnWPSe9erXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kdgLMroXemhvo1SGOC0fd/F1NlaXDQpAtVGJf2IAEoI=;
 b=mKtU99GXWmR5e+U+o5patOYMTXyD9tdPhf6pFvTsfsu6qekjVg8vMfJhZjb28sbpvjJjzYiCvIVqYN/UIW1l7TELAI2lzRvF7i5ZQ0dtE8U0OTezhZDRxIa1vfobF7UeurwjMNgzPxyRFpa5/qkFpLpUGtiLaD1SKgH5hOurD7B72QdcReDuTmGfMVlgHCdRtQikdtol8RCHViapIeMelFrd7SL4zgdGW8zIj3fYwCHnTxm4b8HX+k4q4sJ2oFhW8EdBBo7jZM09yCuNxk3JjZueAKw0/68sa0AEwcZvgKyinVcGP6RzPSYxYgHh2OIPsT5F+4fpcUJ42z0Ampr0ZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DB8PR04MB6827.eurprd04.prod.outlook.com (2603:10a6:10:f8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Thu, 18 Dec
 2025 15:37:42 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 15:37:41 +0000
Date: Thu, 18 Dec 2025 10:37:32 -0500
From: Frank Li <Frank.li@nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
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
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v5 4/5] remoteproc: imx_rproc: Add support for System
 Manager API
Message-ID: <aUQfvLm5m8KsRPm2@lizhi-Precision-Tower-5810>
References: <20251218-imx95-rproc-2025-12-18-v5-0-b56a27d4158f@nxp.com>
 <20251218-imx95-rproc-2025-12-18-v5-4-b56a27d4158f@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218-imx95-rproc-2025-12-18-v5-4-b56a27d4158f@nxp.com>
X-ClientProxiedBy: BYAPR02CA0045.namprd02.prod.outlook.com
 (2603:10b6:a03:54::22) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|DB8PR04MB6827:EE_
X-MS-Office365-Filtering-Correlation-Id: 99868b88-93b5-48f9-c814-08de3e4b61cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|7416014|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HiaxnwkQsvgStSHkwO6kR1UoJAxapE8kNdQmChmPz3/ceFG5VW+hVwhSRCDE?=
 =?us-ascii?Q?/ixnI5wHfbqgro4p2Ecpg/l2V0QciwfrhZzvM5mO0TzfsD9uXBYHMzYH7msG?=
 =?us-ascii?Q?GejVrFhSgI3UKZ4XbwZhcvg+NSV+3HaWNJN9pUNOpOmcfyr9Sn4MGcOvQ6sp?=
 =?us-ascii?Q?q/pYw2rtE74jUOl3Id5LP6lEnz3x2e/MdVxwpfrl2ARHUKKwrOGE2WELO8RV?=
 =?us-ascii?Q?wMNQamz4g0hi6pGodSw8nthlMIeyWFnKiR/SRrzbXNYxpxJPKocSZDUWDKhq?=
 =?us-ascii?Q?/PRgAAv8BdI0DdSyiHtlhKWN6QypO+103Jyg32SQPV/CWnTsUO0T0QTgW+Wf?=
 =?us-ascii?Q?VPgfzSffggqEmyQrUWQdWAm+a7NQJ+hsxRzxc6nIkn+r1E03/qkJX0yiM2Cj?=
 =?us-ascii?Q?VIzYdSE0fM17qf2D0eYv4Q6DwaXGihmrD/psOGA95nk22wTXIOESV/Hj1P1J?=
 =?us-ascii?Q?iFmqWTs01rqU3vo+HmQUQX5SSczlGGzemdBGTWLzvgRozFNrUpAZ2EH8jmjR?=
 =?us-ascii?Q?GQofkzdqPHjJ/9Bt+yLluaQbXX18w7dApOXDpXkvJK/qsdK1DrWuaQlUSHdV?=
 =?us-ascii?Q?2l6xM/C+jSM17B6spWzifZjy6G08fVeOMgXa/arIVEaknhwxLeEQ3ZB0M2WV?=
 =?us-ascii?Q?7l6Y3FTGdoDeT0SOVYhXVykEL/dIAdfYMM+CIIF/Kg6oj+c4sdHVNRiJmtWt?=
 =?us-ascii?Q?z8cIdwBLXpc03cABVnwvUyVjSTVPrxHAx4UGKhEQc7BonZB/D1AgjuzJ3XcX?=
 =?us-ascii?Q?hBuytXN7iUPxQgbINjseoPPr8e+pB8ajmcUjj6IDdfp1KHYFVVamGdyUa+Vx?=
 =?us-ascii?Q?mRF3gOrfGT8ECyS+2RAw4KKcbWWBX1IA3dhj3ziC0EQp251mrBR0ZC8GuOY7?=
 =?us-ascii?Q?aBYujpNTDa5a8VBxnZGbm796HreR0K7QzPWXLyg5RakzIbhbySE3GATLYtII?=
 =?us-ascii?Q?iL9cKdqf2lr7UeW17iliHJCVIXy54WhEUX26uZHZ66CBRbPs3d58SAR8XT+8?=
 =?us-ascii?Q?QfGDRbmkFlHdeNvoddZ6IYGXGjyH4+v1OA9cRHraPbSnY3gZV1Va7SCTi5x0?=
 =?us-ascii?Q?/RFL4WlCJVLn+2OEI37VOaSYkWn6Bx5SS8WsdCT163Yt9+XAqdrpAATjLVE+?=
 =?us-ascii?Q?rUl73IAKx684hbXt8L8kyxQrZjavR2x0Jmt69lLjLCzXPEmcPZV1oBz+Z1Jy?=
 =?us-ascii?Q?mOi7QMRHJgog5mrhQlmabYOAHUoiS0sv7LvCy593x55z0CtZzRSwPckOyfLW?=
 =?us-ascii?Q?nh34CARGhQybqtBZgEEp0xVAB9KYNUTBOCKZu7iNs+MYLatOtRhYjvvZOLGt?=
 =?us-ascii?Q?C7Dg6fpR/wxk5D8McWKqSuo+r947gnNY70g6h2nqVCLcObCUZLJeQD5IK1st?=
 =?us-ascii?Q?lm8i9/xACCSRuN/RF5B6HI+klbTHEGkp5RVaHt+LqWeZhauehVrqYJnoMk4S?=
 =?us-ascii?Q?Q9E53+fHFX5SbgPKZ4a2qN0U2myj81avsTP2uI6kDqKkO06MER2iSAROHxaB?=
 =?us-ascii?Q?yWKqcZHXlZT04QbYj2aUvqgFaCxfywoTHJnO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(7416014)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ig3RJSpKaXrU6t8y6pxTAbB8IlEtIzjZrKFWpdBQFTPzf4S0JBmxJqssDgnx?=
 =?us-ascii?Q?48Q3IKm9mguBadm8uuejOdmg7ACqM3LwBhIgVIA1rqGfSfqfLvFrz0I4hS+c?=
 =?us-ascii?Q?McGgBn6CygwMW6u8MEpPKnjuGaSubRL2C/vkoSAXw19xO/nGH8xIdKnYJZNs?=
 =?us-ascii?Q?g2EsmZtKFcMuGFvr2HqxjUDUf0UfbqvbPtpryBpjbHkG+EQqbVsOsZQoWy2W?=
 =?us-ascii?Q?l7wLky5zkuMof4b7ZrQE2aZkPmuMwnLYZt+9gLYJEWjvwK66S7AGqATeLuYI?=
 =?us-ascii?Q?KlcYa0OeH7RYKzjhtFyTo1GPnRAKPprV+WGVlzf9Cqd4e+IS0sB4Rn+ii6kf?=
 =?us-ascii?Q?Nf++aUw6qa4/GwJyDHLL4EDnJbGRBxUigeggx8+1yTZ6P1hYJsi7n6NGMRZ3?=
 =?us-ascii?Q?xU9AEmp+UkjGZ+cEegOTb5a42rgDKmLPhf7FMU2RLnE3vZ3M94YQkSq0uUgV?=
 =?us-ascii?Q?K1jK5ix4V7i2OpFWhxb1tbWtQf2yOFY6Oa6bV8rlqDApk26O/8jESZyqVu4d?=
 =?us-ascii?Q?ss09U0+5qV8xWbLigVgT0a7SRzqjRsUzn0ljQYjkkrgbIiZuFePmxjqOr88Q?=
 =?us-ascii?Q?au0WfAf/yGhZ17BE76Fv0sT+aP3KLYvtvFRAIHEHChm9in4+ba2tu90IzD+K?=
 =?us-ascii?Q?tT/38AeTLxCxnSsYmRVPeZDk5xNrgMaOTYlJQ1P/QW83kSfDxNXJYj4aeZ5v?=
 =?us-ascii?Q?TXynTNw70v6d+e4LdgJUB4wYDWLOvepQwnInbON2cQsvt66w1Ny50ZWq1Ddd?=
 =?us-ascii?Q?efCdynvrstG4yCMiz9Yuuur7wmT5OjBBKcbe19Rz4Tb0NZ3tgyTt7Ds0PnBh?=
 =?us-ascii?Q?VlIvIZAe9cFeKD9Mzipb/GFmot3NJyPj27aM/0SwQNtjK5rDdNabBTtFgtFI?=
 =?us-ascii?Q?ivpJkgATK2azUyNRQjXImHn56h/NwU7imbfYhTIZrgXXh4zQwK72+M58euJC?=
 =?us-ascii?Q?smTj+H7FI8RxGQdT6+dRMtXMTAFvMjNozMLg/wtG6vYPYFX4v2XzSdXfE5DO?=
 =?us-ascii?Q?KEuX++a9E0Uhb7hbhQDgqe+JdfFxzSmX3qTW4by16S1UPtYyb1GmiOnbjB2x?=
 =?us-ascii?Q?13/kispE10qxMNwiSyHCUsOw0yuO3fVIHxYnL15S8DQQgwJqf95PcZeqb2q9?=
 =?us-ascii?Q?lwRMEiK6JwOGHL6nvHYvF3gpEKxfzUsctWTmD9tn0QKZazn4eTKvOK7BqNxH?=
 =?us-ascii?Q?t93cm8C4MQL/d94tKuJXELDcuSWwg8AXL3JSZDAUkRziW0U2YPi4lgFn0o0a?=
 =?us-ascii?Q?in9s3cfnDzUOl3CepA9FXL8b4OWRG8w34lDV5geKYx90dEeilGswD4jjRVTp?=
 =?us-ascii?Q?bvz1KHAExsc4oGWXUaxzzIaaqsuVL/n+/hVyjJ/8+7b41XOphro/Pc3sUNOh?=
 =?us-ascii?Q?dS2xKwsiKyq5h1EjlDN1xqhCVJdUxu6hW+HhComsUuH8BfAtGuR9Y25tVlln?=
 =?us-ascii?Q?2qDA2dSjt+bEef5gsALVt+Rw2dU+aUaoeD42Ap/lfgTJzQSSX3doi0TL881Y?=
 =?us-ascii?Q?gH1q8mtb76Nip3oKN2Zz9Z/vIZ/PwqADPjCf+bfxdbFvB7/Db7k1fyVQAEKR?=
 =?us-ascii?Q?VJxH3tZpHzwWQpzp+cJHEU5dS4yGTYbXZTBV8sTM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99868b88-93b5-48f9-c814-08de3e4b61cd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 15:37:41.8747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CIGkuoVYz5LXKIKSegK3gWJnU7SFSIdG1xjx7D0Ww6c8MZXPRpb900EUxvRBM+vkChgbEGpr4kb15VR0XNf5oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6827

On Thu, Dec 18, 2025 at 01:17:38PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> i.MX95 features a Cortex-M33 core, six Cortex-A55 cores, and
> one Cortex-M7 core. The System Control Management Interface(SCMI)
> firmware runs on the M33 core. The i.MX95 SCMI firmware named System
> Manager(SM) includes vendor extension protocols, Logical Machine
> Management(LMM) protocol and CPU protocol and etc.
>
> Depending on SM configuration, M7 can be used as follows:
>  (1) M7 in a separate Logical Machine (LM) from A55 cores, that Linux
>      can't control
>  (2) M7 in a separate LM from A55 cores that Linux can control using LMM
>      protocol.
>  (3) M7 runs in same Logical Machine as A55 cores, so Linux can control it
>      using CPU protocol
>
> So extend the driver to using LMM and CPU protocol to manage the M7 core.
>  - Compare linux LM ID(got using scmi_imx_lmm_info) and M7 LM ID(the ID
>    is fixed as 1 in SM firmware if M7 is in a separate LM),
>    if Linux LM ID equals M7 LM ID(linux and M7 in same LM), use CPU
>    protocol to start/stop. Otherwise, use LMM protocol to start/stop.
>    Whether using CPU or LMM protocol to start/stop, the M7 status
>    detection could use CPU protocol to detect started or not. So
>    in imx_rproc_detect_mode, use scmi_imx_cpu_started to check the
>    status of M7.
>  - For above case (1) and (2), Use SCMI_IMX_LMM_POWER_ON to detect whether
>    the M7 LM is under control of A55 LM.
>  - For above case , after using SCMI_IMX_LMM_POWER_ON to check
>    permission, SCMI_IMX_LMM_SHUTDOWN API should be called to shutdown
>    the M7 LM to save power only when M7 LM is going to be started by
>    remoteproc framework. Otherwise bypass SCMI_IMX_LMM_SHUTDOWN API if
>    M7 LM is started before booting Linux.
>
> Current setup relies on pre-Linux software(U-Boot) to do M7 TCM ECC
> initialization. In future, we could add the support in Linux to decouple
> U-Boot and Linux.
>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/remoteproc/Kconfig     |   2 +
>  drivers/remoteproc/imx_rproc.c | 198 +++++++++++++++++++++++++++++++++++++++++
>  drivers/remoteproc/imx_rproc.h |   3 +
>  3 files changed, 203 insertions(+)
>
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index 48a0d3a69ed08057716f1e7ea950899f60bbe0cf..ee54436fea5ad08a9c198ce74d44ce7a9aa206de 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -27,6 +27,8 @@ config IMX_REMOTEPROC
>  	tristate "i.MX remoteproc support"
>  	depends on ARCH_MXC
>  	depends on HAVE_ARM_SMCCC
> +	depends on IMX_SCMI_CPU_DRV || !IMX_SCMI_CPU_DRV
> +	depends on IMX_SCMI_LMM_DRV || !IMX_SCMI_LMM_DRV
>  	select MAILBOX
>  	help
>  	  Say y here to support iMX's remote processors via the remote
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index b0857a1a9660503ee7cd5473c06dacb5262286b8..ae3183ad996462ad0815889a2291d320ce7a1e8f 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -8,6 +8,7 @@
>  #include <linux/clk.h>
>  #include <linux/err.h>
>  #include <linux/firmware/imx/sci.h>
> +#include <linux/firmware/imx/sm.h>
>  #include <linux/interrupt.h>
>  #include <linux/kernel.h>
>  #include <linux/mailbox_client.h>
> @@ -22,6 +23,7 @@
>  #include <linux/reboot.h>
>  #include <linux/regmap.h>
>  #include <linux/remoteproc.h>
> +#include <linux/scmi_imx_protocol.h>
>  #include <linux/workqueue.h>
>
>  #include "imx_rproc.h"
> @@ -92,9 +94,16 @@ struct imx_rproc_mem {
>  #define ATT_CORE_MASK   0xffff
>  #define ATT_CORE(I)     BIT((I))
>
> +/* Linux has permission to handle the Logical Machine of remote cores */
> +#define IMX_RPROC_FLAGS_SM_LMM_AVAIL	BIT(0)
> +
>  static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block);
>  static void imx_rproc_free_mbox(void *data);
>
> +/* Forward declarations for platform operations */
> +static const struct imx_rproc_plat_ops imx_rproc_ops_sm_lmm;
> +static const struct imx_rproc_plat_ops imx_rproc_ops_sm_cpu;
> +
>  struct imx_rproc {
>  	struct device			*dev;
>  	struct regmap			*regmap;
> @@ -117,6 +126,11 @@ struct imx_rproc {
>  	u32				core_index;
>  	struct dev_pm_domain_list	*pd_list;
>  	const struct imx_rproc_plat_ops	*ops;
> +	/*
> +	 * For i.MX System Manager based systems
> +	 * BIT 0: IMX_RPROC_FLAGS_SM_LMM_AVAIL(RPROC LM is under Linux control )
> +	 */
> +	u32				flags;
>  };
>
>  static const struct imx_rproc_att imx_rproc_att_imx93[] = {
> @@ -313,6 +327,44 @@ static int imx_rproc_scu_api_start(struct rproc *rproc)
>  	return imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, true, priv->entry);
>  }
>
> +static int imx_rproc_sm_cpu_start(struct rproc *rproc)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> +	int ret;
> +
> +	ret = scmi_imx_cpu_reset_vector_set(dcfg->cpuid, 0, true, false, false);
> +	if (ret) {
> +		dev_err(priv->dev, "Failed to set reset vector cpuid(%u): %d\n", dcfg->cpuid, ret);
> +		return ret;
> +	}
> +
> +	return scmi_imx_cpu_start(dcfg->cpuid, true);
> +}
> +
> +static int imx_rproc_sm_lmm_start(struct rproc *rproc)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> +	struct device *dev = priv->dev;
> +	int ret;
> +
> +	ret = scmi_imx_lmm_reset_vector_set(dcfg->lmid, dcfg->cpuid, 0, 0);
> +	if (ret) {
> +		dev_err(dev, "Failed to set reset vector lmid(%u), cpuid(%u): %d\n",
> +			dcfg->lmid, dcfg->cpuid, ret);
> +		return ret;
> +	}
> +
> +	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_BOOT, 0);
> +	if (ret) {
> +		dev_err(dev, "Failed to boot lmm(%d): %d\n", dcfg->lmid, ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  static int imx_rproc_start(struct rproc *rproc)
>  {
>  	struct imx_rproc *priv = rproc->priv;
> @@ -369,6 +421,25 @@ static int imx_rproc_scu_api_stop(struct rproc *rproc)
>  	return imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, false, priv->entry);
>  }
>
> +static int imx_rproc_sm_cpu_stop(struct rproc *rproc)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> +
> +	return scmi_imx_cpu_start(dcfg->cpuid, false);
> +}
> +
> +static int imx_rproc_sm_lmm_stop(struct rproc *rproc)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> +
> +	if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_AVAIL))
> +		return -EACCES;
> +
> +	return scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_SHUTDOWN, 0);
> +}
> +
>  static int imx_rproc_stop(struct rproc *rproc)
>  {
>  	struct imx_rproc *priv = rproc->priv;
> @@ -485,6 +556,33 @@ static int imx_rproc_mem_release(struct rproc *rproc,
>  	return 0;
>  }
>
> +static int imx_rproc_sm_lmm_prepare(struct rproc *rproc)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> +	int ret;
> +
> +	/*
> +	 * IMX_RPROC_FLAGS_SM_LMM_AVAIL not set indicates Linux is not able
> +	 * to start/stop rproc LM, then if rproc is not in detached state,
> +	 * prepare should fail. If in detached state, this is in rproc_attach()
> +	 * path.
> +	 */
> +	if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_AVAIL))
> +		return rproc->state == RPROC_DETACHED ? 0 : -EACCES;
> +
> +	/* Power on the Logical Machine to make sure TCM is available. */
> +	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_POWER_ON, 0);
> +	if (ret) {
> +		dev_err(priv->dev, "Failed to power on lmm(%d): %d\n", dcfg->lmid, ret);
> +		return ret;
> +	}
> +
> +	dev_info(priv->dev, "lmm(%d) powered on by Linux\n", dcfg->lmid);
> +
> +	return 0;
> +}
> +
>  static int imx_rproc_prepare(struct rproc *rproc)
>  {
>  	struct imx_rproc *priv = rproc->priv;
> @@ -980,6 +1078,93 @@ static int imx_rproc_scu_api_detect_mode(struct rproc *rproc)
>  	return 0;
>  }
>
> +static int imx_rproc_sm_lmm_check(struct rproc *rproc, bool started)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> +	struct device *dev = priv->dev;
> +	int ret;
> +
> +	/*
> +	 * Use power on to do permission check. If rproc is in different LM,
> +	 * and linux has permission to handle the LM, set IMX_RPROC_FLAGS_SM_LMM_AVAIL.
> +	 */
> +	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_POWER_ON, 0);
> +	if (ret) {
> +		if (ret == -EACCES) {
> +			/*
> +			 * rproc LM is booted before Linux and not under Linux Control, so only
> +			 * do IPC between RPROC and Linux, not return failure
> +			 */
> +			dev_info(dev, "lmm(%d) not under Linux Control\n", dcfg->lmid);
> +			return 0;
> +		}
> +
> +		dev_err(dev, "power on lmm(%d) failed: %d\n", dcfg->lmid, ret);
> +		return ret;
> +	}
> +
> +
> +	/* rproc was started before boot Linux and under control of Linux, directly return */
> +	if (started) {
> +		priv->flags |= IMX_RPROC_FLAGS_SM_LMM_AVAIL;
> +		return 0;
> +	}
> +
> +	/* else shutdown the LM to save power */
> +	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_SHUTDOWN, 0);
> +	if (ret) {
> +		dev_err(dev, "shutdown lmm(%d) failed: %d\n", dcfg->lmid, ret);
> +		return ret;
> +	}
> +
> +	priv->flags |= IMX_RPROC_FLAGS_SM_LMM_AVAIL;
> +
> +	return 0;
> +}
> +
> +static int imx_rproc_sm_detect_mode(struct rproc *rproc)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> +	struct device *dev = priv->dev;
> +	struct scmi_imx_lmm_info info;
> +	bool started = false;
> +	int ret;
> +
> +	ret = scmi_imx_cpu_started(dcfg->cpuid, &started);
> +	if (ret) {
> +		dev_err(dev, "Failed to detect cpu(%d) status: %d\n", dcfg->cpuid, ret);
> +		return ret;
> +	}
> +
> +	if (started)
> +		priv->rproc->state = RPROC_DETACHED;
> +
> +	/* Get current Linux Logical Machine ID */
> +	ret = scmi_imx_lmm_info(LMM_ID_DISCOVER, &info);
> +	if (ret) {
> +		dev_err(dev, "Failed to get current LMM ID err: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/*
> +	 * Check whether rproc is in the same LM as host core(running Linux)
> +	 * If yes, use CPU protocol API to manage rproc.
> +	 * If no, use Logical Machine API to manage rproc.
> +	 */
> +	if (dcfg->lmid == info.lmid) {
> +		priv->ops = &imx_rproc_ops_sm_cpu;
> +		dev_info(dev, "Using CPU Protocol OPS\n");
> +		return 0;
> +	}
> +
> +	priv->ops = &imx_rproc_ops_sm_lmm;
> +	dev_info(dev, "Using LMM Protocol OPS\n");
> +
> +	return imx_rproc_sm_lmm_check(rproc, started);
> +}
> +
>  static int imx_rproc_detect_mode(struct imx_rproc *priv)
>  {
>  	/*
> @@ -1155,6 +1340,19 @@ static const struct imx_rproc_plat_ops imx_rproc_ops_scu_api = {
>  	.detect_mode	= imx_rproc_scu_api_detect_mode,
>  };
>
> +static const struct imx_rproc_plat_ops imx_rproc_ops_sm_lmm = {
> +	.detect_mode	= imx_rproc_sm_detect_mode,
> +	.prepare	= imx_rproc_sm_lmm_prepare,
> +	.start		= imx_rproc_sm_lmm_start,
> +	.stop		= imx_rproc_sm_lmm_stop,
> +};
> +
> +static const struct imx_rproc_plat_ops imx_rproc_ops_sm_cpu = {
> +	.detect_mode	= imx_rproc_sm_detect_mode,
> +	.start		= imx_rproc_sm_cpu_start,
> +	.stop		= imx_rproc_sm_cpu_stop,
> +};
> +
>  static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn_mmio = {
>  	.src_reg	= IMX7D_SRC_SCR,
>  	.src_mask	= IMX7D_M4_RST_MASK,
> diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
> index 37417568a0ade2ae4d6a4e3d0f139ea52b185254..d37e6f90548cec727b4aeb874680b42af85bdbb4 100644
> --- a/drivers/remoteproc/imx_rproc.h
> +++ b/drivers/remoteproc/imx_rproc.h
> @@ -38,6 +38,9 @@ struct imx_rproc_dcfg {
>  	size_t				att_size;
>  	u32				flags;
>  	const struct imx_rproc_plat_ops	*ops;
> +	/* For System Manager(SM) based SoCs */
> +	u32				cpuid; /* ID of the remote core */
> +	u32				lmid;  /* ID of the Logcial Machine */
>  };
>
>  #endif /* _IMX_RPROC_H */
>
> --
> 2.37.1
>
