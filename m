Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013064.outbound.protection.outlook.com [52.101.72.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA4C237180;
	Tue,  9 Dec 2025 16:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765296317; cv=fail; b=a51mGCuNaYTdo12VxyrxcHjscJ9+U1HZPvmOFW107CNWRwpheO94UfXHGAQQs5prBlAxXAtL3gJn/R3S3/L4irYEbickRuj5/tUZgwqvYvfBUu329KsLLZFevfL5Q2+YTUJ+qQzAqil1eMCKQ6EaeQtKQ2yNG+De6ktYlkOfU1U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765296317; c=relaxed/simple;
	bh=MT6CquSbIUySNVs7ZnD0aenN08NWBj4Z7VM3uQyUPME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=r46DrJWLE4dqY/vPMaTzhsraM8BVFuBTmjLJ9x9/L/H+ErGUrMA4d6A66tOjevhdn/XjGTSz6fCak1WEmoUdE00rntgbE973iinqeVIH4xx6t6hav00CAveYNFKw4fXDQQ0rKD1I9u+242smA2HfK0EPSYKWNEepqUzzasFWoiw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UINQKG9E; arc=fail smtp.client-ip=52.101.72.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UINQKG9E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l39BSQBMMLJrW0w7Is6/jvjH8hLF+4ljVx0YJ31FWI85hHIzsuamJdT/FcRGHa1EpATzU7WpAIEE83OONhsnVusaV+DkM4CIoVkL0WQo5DLMY4OtJeDybL4Sb2jnNUU1t0cxp5O9qMB3bxeRyVxSycfBRJcBcUHTVkVMvsZ7vJGSIFGxZhXFAZvXiQpvN4R8N/v4BSsZukKuY9amZkxS91uiiTBGNW+utiVU7jT0knlwHtEepWAW69uL+7KrqkfPs7D8ti5J0lOpXtYfleL5o45gBwualWUR5jR+HrJEweSyG2sE/Hv2B/1NXVi2nRHVaxheR8goXX9uzK0eb5C9DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yNFd4nZVbIqggj/W+9I8JmTu5WCBdg1Fkxh2JFcg7Ag=;
 b=PAy4bIt1YcC1zvWIv1y91rYL+XJo+XDiIAp5C0dF1Q96msybTlrjuA01c/riNuwvKAd7/DHD9qk7HSggD98rM8GNj/HHwAulR95fpzbOAc/6owgCeD7PYXadD2QMxeacnJimuKlW3xBO9ApHGHgaKBu07Pj9XNiHm8Auqi0guts+cFyq5Mef25/lkZTElKrXJIUmB14aQxQx57cjfqEHRVo0oFOiY9VwwHeY9fu+4xF7MFxPS2Vli2CpmYI25gs0u5MA3GzcuI/fKYzoPuINUz3SZrrxFmyJY+CvLA7tkHo/nwfhHWVvqBa+pcs3RstjDT6Oik+jaWnoLuemosHXAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yNFd4nZVbIqggj/W+9I8JmTu5WCBdg1Fkxh2JFcg7Ag=;
 b=UINQKG9E+SGL6EbaXeE+SujJwnoIh8bycZQVAMn9+tSTNuCSIC6ERK8VPPAibvtNVV7sEZwy8nYTi3EvFWwDnstt9aa0DdLmfBO7Fn9fzUKm2x/qGV4eoNiD4DkqkTGMygHOR8w9TTuRsoMThttZzGrJOOQAcNFVeyih+k+fjug4Vc/mSVl1EVmFuHj/eD9Fg2L0N8A3knzpOIqDurZoZFRcgCYTnlDmdm7x/HHlIKobFnSb0hXCKIEatwQHGTO+49RKzKYyUjOz4MTErnXTo59a3dWj5nNnHyQjHmAJJVlt+GZkTWSzaUq5bISha9AtdNLf4jcxMfloHNTfmN/iVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AM7PR04MB7160.eurprd04.prod.outlook.com (2603:10a6:20b:119::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 16:05:12 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 16:05:12 +0000
Date: Tue, 9 Dec 2025 11:05:05 -0500
From: Frank Li <Frank.li@nxp.com>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-imx@nxp.com
Subject: Re: [PATCH] remoteproc: imx_rproc: Use strstarts for "rsc-table"
 check
Message-ID: <aThIsUU22pdulMrJ@lizhi-Precision-Tower-5810>
References: <20251208233302.684139-1-shenwei.wang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208233302.684139-1-shenwei.wang@nxp.com>
X-ClientProxiedBy: PH7P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:326::13) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|AM7PR04MB7160:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a94ba25-424f-4f71-de3c-08de373cbbea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5rqY+rMu8Xa08XNx11nnHSR1ONKXH80ArtlfNjRwZ9xJjHD+Hv+CpTNEZE9c?=
 =?us-ascii?Q?jxtf/Vq3rk6LIajx1Kw3qmvpe2zMGTdZeC28NdiwQTePEy2CK4ZAJQHF33dJ?=
 =?us-ascii?Q?gYUlb5Mm6Cmr468FgNXpCfIthQYFL+yMucJDiT0PW+VRfKnrCxmTjNJuewdk?=
 =?us-ascii?Q?ZjLdsiyLnhwo9+n+Vude44IJBNMfvbHnGX9jrMPQU9XgFMD6GzCQ2j1gdJh5?=
 =?us-ascii?Q?89j1Xf4uJcUUiT2uf46X1pEaH6u9AIIGR8FVlkNCh3Fzsj/QWgJkb5o6XU4u?=
 =?us-ascii?Q?MIp0pSuFBGLCRsBXmKj7eLKjEzzHsHUYphEzFhe1900bq4xdXgHVaG/ETFC9?=
 =?us-ascii?Q?Z/elfwQ3sBGyLSAEnbGFPaad1tQYNBRkCkKPFkrQggg0Z5ik5u9WLYyG20WA?=
 =?us-ascii?Q?ElI+IoZd2AZ5GIIh79HUidTl4e8OHfwMHr1JpW6gm0qmCEHquaj25rt103hf?=
 =?us-ascii?Q?v2UbXe8ZZSNCtXz6cCCJ8Fz/5NIetRz/NFq9fn2Of5qGcBa5fDyvLlJy9394?=
 =?us-ascii?Q?KUaAeZmg73BhV4pFY+Znd84fCdrbEYPJt1F72VrYG5xE7z60ufjxI9kkaQiA?=
 =?us-ascii?Q?QsCEuTNfIqCLuEAPoARJrt1QgJVh1aWK8R8X2jsujVk7B4ytu3g3I8cF5uhB?=
 =?us-ascii?Q?+9/yZQJj1WV7S7FM/Hy/bgfPaqW7qV3qgOIHez0UYBCL+sP26Pur/GUxQBrp?=
 =?us-ascii?Q?+2I/rdikpk2cJMldtn1okFS4rmrMsfqTXeax2Lk8K6WOajxwxM9fKLI0rvPk?=
 =?us-ascii?Q?FOaahjO/oYrd+3tqgODhoGVICKNlu9rGm2UU91BX/sY72QxYNe1dQY67WrwS?=
 =?us-ascii?Q?qqB93xD6bSjtIAXv38yp/3f/bm+CDeu5JbzVLEZP8rjRFFSENNLmxbIrldoh?=
 =?us-ascii?Q?tTfnjCdsOaRCPURR1uoPQQXo1m4Hh5REDaVfhvudmQU2vWWxPsz+gr5rxDhY?=
 =?us-ascii?Q?Kk4gRBFn9DdpN2f/xPNVhdE2jTIdZCam6Lc5I78P3DDDGiZlE221haWzQqjJ?=
 =?us-ascii?Q?WYi+GwvMrVNJMfN15raAojjoEU2431g+KXdROeEiP0t1cZQy//cdlkBQ4rLY?=
 =?us-ascii?Q?nZ8CML1kFp8WnmNVt+WYhJYodDil1UrNKRjZd4v4dp9RZphLCDl05GMy1Y73?=
 =?us-ascii?Q?gQy3Tt7VgAeTp2YngWFtfXFyBbNrkNF5AAAtl7ZDpSGIGLweV22yvBZIXInP?=
 =?us-ascii?Q?Rj1rxdDbFgx3ctkJInxotDmjADsDD7BzVtbbGJHE7Ha+HTxolmSb4v3dPGN4?=
 =?us-ascii?Q?7osTJhOFjk/eY7XQ2YgjH41su7qFOHDh7lmXAUI2+1ijRbbGyybBrzXiTtxW?=
 =?us-ascii?Q?McjJwnxddFFwNFdFuHzzJmsg3m8cPGCUWweOglabk5h62OjIIrUlwKxrJbv4?=
 =?us-ascii?Q?D/ni+FzoE7y48JUC4NH3DVLTYWu+CB+K9SA1wdq3QdEGl8LdNw6exLS9TrVZ?=
 =?us-ascii?Q?ad/g3rdeNWE3NRFNmwS1xUEUuBO4dPiDYprhw45JYwYoHaeYI58uVxAp/kh5?=
 =?us-ascii?Q?k//xlhvYbfFNg/VRGyptpJiYB123hiJe0LWt?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y2sip6V86up1W81m/ZmJ/iB0rb19A6ocGbdX4QVou6mTpELx/ULaGWw/cWZN?=
 =?us-ascii?Q?R2Fs0Xaoo7b6cbn1BaKSmhl4BTveEhYslaAscV3AXsVIUcRice6bXDZ/cije?=
 =?us-ascii?Q?B41HMAXWeT9CyWEUTEb7jY977VEpHc9NpRU3Tt4ce6mRLzzkf3PF/JeXybTy?=
 =?us-ascii?Q?SVmXyN6vDUythXlcOPsb+gmJiPN4JuKLXBlXJ2j+rUay37yyg2NM5N3qXIFR?=
 =?us-ascii?Q?3Oof07mMhHmbciPrPGJgCz9atsMapuephJ9OgO4h6A1DWFV54gDK6WnI0OYV?=
 =?us-ascii?Q?k7JzlrD61VTMjQAct2PEXuxzy3D98KbcskkbiQYgc0Zzc9VazolCEKWc6FoI?=
 =?us-ascii?Q?mKoRGyjtIuWy7TG0Ery9EdsvMEbRUVqbtpm9sQk9GrAIc1HgiXa/duHGMPNY?=
 =?us-ascii?Q?DSTr4yyoSbM+njy7Wwq8XvX+x6sT6Dlc1VtwnJD5lk646U3aJxML1cpiDlk8?=
 =?us-ascii?Q?ihgo47A249Ws319fAalHJ347eWhRt8j3pKqB3IZDWpKPRCPq7lJWbOzLeMHR?=
 =?us-ascii?Q?nHIY/S3v/lzq8d9yxt5DAkfEIw3g5NwZ9orFNWa5NkTZq6oaz6SsQ8kSoiGh?=
 =?us-ascii?Q?xsyzdIo91uxZq4NV/eSNWa3uiaTNBL+BkzT0zwKainJnSAjjsN/ubUpsgXIG?=
 =?us-ascii?Q?MrI46qDnICxbWs/Job9hA8vVRQKOx4/ZLCJSr7KXMLUhTCifGrMOPoJHpUW8?=
 =?us-ascii?Q?rxW/EmIbjySpWyG54L5JmflCBriET+VRncCxwO/hgJZsF8nTbei5YxsvYj1g?=
 =?us-ascii?Q?T7BBGThmmILaMutldrBCXRwTlREUEqfNr3UU04BWp3DroKk2o4Dx2ukLVpNk?=
 =?us-ascii?Q?HdXqHiAOXb1Jt0UnQuSIvmT+4iyspcAfGaWlaNwY7sZe/DS2dx9X1SH/fmu9?=
 =?us-ascii?Q?xmVRW7TAhGXySJ+FDpSd5+6+pNwuQjKePafOuT5vOT+UZzlYex9pHm/oDiTW?=
 =?us-ascii?Q?hUAQRWf0gGqFKxkXDXRlmP1S/bOLki4D7ZmnVfBn7nJp6mBPdhJTVeIvR/kz?=
 =?us-ascii?Q?sover11cTU3glLu9GoyFAl4XBHj4s01hjtgYP8drNlPwvzqGyNNScER+Ysyd?=
 =?us-ascii?Q?2/96VECjbTnLRIIDElv3BeWmJHM6ijxeFox4ZawhLyVDtF+hZix3leqjXGAY?=
 =?us-ascii?Q?mPR0Q68Xuff7ZEFruXn0mQhcctpfWEBSPT8cSHKnL/ikOyvO6yyAot18k/+G?=
 =?us-ascii?Q?orOhBiYT7QEsTYgXJ+JvEOHYmqBbOqYFlwGM5kJnw3bHjEo95h9h/qjjILwG?=
 =?us-ascii?Q?cxYcSCpvevpNY/ruFVHPNiyF7LE8TehGm+QkQMyVDN+Hh0qcrwh9xQuom1Yo?=
 =?us-ascii?Q?oX2q+cmOc1VHk6yxdfttXguYhNDa2r8fe+7F+h7AHdtCSCoebqeZNFYe4p27?=
 =?us-ascii?Q?nHtVpN/Z6bRTk1Pn0QBkqxLHdy2G9Je2wdxUY7rfkKBCnDoAtibcIP/ZgQzR?=
 =?us-ascii?Q?SuFG/MlLzW2sNtm7JMCHJXYQnXC+duUIAa9Rvbl5+5g1jfcl11oX3RyCzN29?=
 =?us-ascii?Q?l4HIE/uBcrx5Z4FeDKvziyrcr4I36q8GupoRAYmjOuLw/AxItNWuzuv2HljP?=
 =?us-ascii?Q?FTHMetQnY2HPL8+SgCyf4YbWNB3XUm2ct3fIhksT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a94ba25-424f-4f71-de3c-08de373cbbea
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 16:05:12.5349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GURlXKhSuJ0ffsZAxutA2cY9J56h1F0uUDeiK6A1cC/Cscr7KsIvvqPyx99oj6bkRWjvo81sBywUbmVOYSus7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7160

On Mon, Dec 08, 2025 at 05:33:02PM -0600, Shenwei Wang wrote:
> The resource name may include an address suffix, for example:
> rsc-table@1fff8000.
>
> To handle such cases, use strstarts() instead of strcmp() when checking
> for "rsc-table".
>
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/remoteproc/imx_rproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 3be8790c14a2..33f21ab24c92 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -694,7 +694,7 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
>  		}
>  		priv->mem[b].sys_addr = res.start;
>  		priv->mem[b].size = resource_size(&res);
> -		if (!strcmp(res.name, "rsc-table"))
> +		if (strstarts(res.name, "rsc-table"))
>  			priv->rsc_table = priv->mem[b].cpu_addr;
>  		b++;
>  	}
> --
> 2.43.0
>
