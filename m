Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011043.outbound.protection.outlook.com [52.101.70.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F313570B9;
	Thu, 18 Dec 2025 15:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766072395; cv=fail; b=iHsxcoMJnxZzXYTX+1/HVzfGb+hWIyLWcdDXonvIdXzcXQxLQ+wQtY8aqkBzfvLGeERAw2qF5QwL2KBTSfWVcMtlyo0lGEGT+TjUZTi91bZU4NfH39kzEVhfFDl0Iy0VXajfAtJz0bO2JeIAcJHrBbpwoYXJ6KSL0L7SGVnP+kY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766072395; c=relaxed/simple;
	bh=vs+iNK+TMeJMX3yGEeGGaZ45aoqlRAKFa5bR2EqXmI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=X6R9IxI8VrT9KlFGqZZyH5EL2ORJFTivUvITdBAA3js05VB3gCZonwRvM4FvYH9OHWa4Y6kpg+KQJNH8KpIbIdqbkWYppS2AH28jrWKZmKF9tSrsPn6+sk8bbvAsajziv6erYnSHxQowd6mJah1SScbRaVqN4Ru8ja7lCvofNB4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=TOVfzG/3; arc=fail smtp.client-ip=52.101.70.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="TOVfzG/3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ce1HCsbG0IYhmjqfyX0muX0yu9dw4Q/3LBXlLv2rrypRuNvJkkqvd/SCTbx3129k4CYp189Xh+x0yyeKVAll5OsZaJTt9o1qmYhe1VsUr+Sl5MXZwOstbVWb1Ygk/RE2Jv6yYko7Tk84F8jDzKKrje8Vl+l2bdWXGThdodLAKMl6uLBHpnDHnot+NfWyDb60pQLUE+CFAdT4bRUMlyH82u0vRHjbGiTPZtIxmSH/BkKwZIGQP5Jx9wvj/+UN8+wq5CqUxSgEtnkhAnI2pIGRqPnsD+j1IJJWRlVTT+fkLLIe7TgbFDX3pwtT26lMNb7pyNBg96XmMyoEDt5hx3xCew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nqppE6xIYuVl+HiUJXQOjJe90pA3m3/7D9kxjA53xPA=;
 b=MgAoEKHOlPHmURtf1luS3oo4Bjf+KzlAzVTWePlqxi9iPUo2LGGbzosr95AKu8J7fEJqtUP7G861DCS0uTgkiTx8S01dALt8B9uXHaDYTA/XfP/ra4VH5BDryJubViSFGuzGgk7UvpEHM+8/j48yqdquXyI/7ls8eQhEQUcI52OeqmcSLUfljhyevf8a017E5E4AoJdcHfyRCW5JCiKIwQxhPbwyc/FstGD783/givZqKzKxYR72ZuR7QLcqpUIhjgIVxY34v95RdfMKdh5DHVmQAvbVee6xv91dgHv7ITb7o3gauSY+Jjj+RN2XZnTZuU9zgyQ3gyzh+MGFgJNVaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nqppE6xIYuVl+HiUJXQOjJe90pA3m3/7D9kxjA53xPA=;
 b=TOVfzG/3y4EFripzXpV2Rt5DpU8Dvhimhv1AOcey/R8rSimvZmmJ432CdX/C3PoWZbXGKq7LDx5MRyH1EdL1/LGhMi55yZP8XCezzHxaaRT9bGz2NTApRijh+An8BGD+PlpBk/rgbwOK6UGXeuquzVpGRy6C0RaBnmiGygYYWrvKyUswjpmANEfdE80Ua23ORotQQtABs6lsbAbKmc3JWMzsRVvklSaY/GM6VsdWwYzOJaieGjz/rUzKa7dd2pjgERCauUHUjG2Rdq9TQ+druVrvFQ/xLcEafYRcBz1I5jYahe1DZJw042cPjzusxUB3bgbqCbU/eXLwoNFCKsnyIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by PAWPR04MB11569.eurprd04.prod.outlook.com (2603:10a6:102:50a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 15:39:44 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 15:39:44 +0000
Date: Thu, 18 Dec 2025 10:39:35 -0500
From: Frank Li <Frank.li@nxp.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	daniel.baluta@nxp.com, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] remoteproc: imx_dsp_rproc: only reset carveout memory
 at RPROC_OFFLINE state
Message-ID: <aUQgNwrBbEzkzXlq@lizhi-Precision-Tower-5810>
References: <20251218071750.2692132-1-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218071750.2692132-1-shengjiu.wang@nxp.com>
X-ClientProxiedBy: BYAPR01CA0054.prod.exchangelabs.com (2603:10b6:a03:94::31)
 To DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|PAWPR04MB11569:EE_
X-MS-Office365-Filtering-Correlation-Id: f9c2da64-40c3-4232-ef84-08de3e4baaa3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?f7MIyrXVcPvsTC6R8TnQ+MjpdEYxZ4SPK0bVJhTN1ovmnpOVdERGGLu6ci1n?=
 =?us-ascii?Q?PxCqd7NxXcpCHO5/LcCOPveBd+0OPI9WEJ/zM/HBFBjwdeYIPjn8pAEtkewA?=
 =?us-ascii?Q?kni5yMRhjeIBAqp1hUVr1XuJqPgPo0vjdLjMfCTtr/Ty1STLrb7JIHj5Edxr?=
 =?us-ascii?Q?U8a0kIcNKKJJi6jF0UpD4Q0WXqnMhyN/+Xclcx5MurwTR+yh93NBjE1u87sW?=
 =?us-ascii?Q?x43Fc65YFqd3/DRRvgdDFvU0u1VGK3teccuWRpTSoQxOHOQch09aHPdqK0Z5?=
 =?us-ascii?Q?givxRXUp/YWsb1HcVEkddtmdNoLXmUwdXnYHRKF8LRzQGpdcnlV7fzhPdjin?=
 =?us-ascii?Q?scHw+JVJFSC2TYoOzScWn5vgIByVaUAjvN+d3v87BUwMxL6U4ndLJxqemHmv?=
 =?us-ascii?Q?h0jGZbXJOiKWdt8CNcLQQs2wOW2roKQ1U1DRx5h/jU6do+oMSrSCDhUcobPe?=
 =?us-ascii?Q?Rb2qhE2YuD+rASrxEaYrlj7SsjoBmTMxh9ti89DNEILjU7vpijyubsukVeCy?=
 =?us-ascii?Q?+aNtZJCDBsNDxSe988DfuErrSlMT9jBa2Vpa8g1gdqsCbomLU49VUpFl4hQ2?=
 =?us-ascii?Q?2eWwvMZunE8j77tHKzAIjD2m2XfiAcIPcsO2QZDxUpU1y6xKZzBxXIb+gY/1?=
 =?us-ascii?Q?vKBcZ6SuXFm/mbya6cw8j14dVurNJoeP6kh9khr5/5QhwNMfDbV/l30lJ7I/?=
 =?us-ascii?Q?O9y83dzQHHRZcSlw7WSgzDTgfNmZGo36T/XCTUUVFaD6qXrY5zShUGpwU8fP?=
 =?us-ascii?Q?XXlMjWN2rS9XeMRnTMEaPhDEcXxXh+vsy8LVCdes89fhR/pqlxXtIcCLjCAJ?=
 =?us-ascii?Q?IlTYtoTUD47Qq9W2EYIaEJo506accVQWS7aZo2aAb3dqZTueOadyt9qgwGGl?=
 =?us-ascii?Q?6ZBtOEAEFWEyW6qyydK1exYE1d1sPVu/oomB3/ulHHkuOy5I2W5SQj0MzoKJ?=
 =?us-ascii?Q?X+dqNMR7vKMBPyToc5vLJ32F+jLPRZw9eXfBJEk1Yw3EDQwu1oKM0tcp8Gwi?=
 =?us-ascii?Q?7ZUfWgPD3BP1Sf8n8Q3cDDbaBLMDh+oGcLy2G44i7U72wMm91eQaCJScZL9O?=
 =?us-ascii?Q?XxJayu/jWELeUzbe0/JXl2R63fgIzqjnP1RheEs4eCUeQcmw/fReNV5Fzrmc?=
 =?us-ascii?Q?UtorkhGEvykfmptxZz5iXjWz7K35zTbA3q4IWjeRXAO1uHL9Dvb282jMjf0Q?=
 =?us-ascii?Q?f1iKX/lblJ/Ufe0ciVaXO6dcYjDfB7pEwq+22/W273BjmTqpbk4pvTUBnW4O?=
 =?us-ascii?Q?ND8YOwFvYR9idZALeKWUcY1kFKbSKiK+nsW0ReJ9D4ZsarXtn5xV3ikxIv5V?=
 =?us-ascii?Q?LzjJrGz3FlGckT9Tq11H7wYoekowSYbyMU7MC/+gbEc79zQXw6KBiISu4fBp?=
 =?us-ascii?Q?81iIGmlWvU0FHeJr9IkWF4yjXIzvxrKN2Dk4jyiqGAOvz+GDy+7yJY0smitm?=
 =?us-ascii?Q?cq3aQZhYgH6KgHyhhMhT+78sHhMQjuR6+flBAcdMPhlizI9e1mbNyJmSgfaH?=
 =?us-ascii?Q?bEIhmAD8YyyAHD1HtnT8jxxHxdJFaTSC+zWG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x1y1CG/x53sfu4vlHvBH11qGZ4N41bYcsq4EImLY039o8y1oG8bnrUhablRS?=
 =?us-ascii?Q?iy32SBs6lodP8R5Xr8oCumsTtjripIfEzFRrLABOe0cSr8wSYf49hnSPZmIO?=
 =?us-ascii?Q?MqmE2M9tbfGDGzzpbixwTdrRtkK37U2NujfLmT3uUgMu5uTvkAzZTUoj8l/N?=
 =?us-ascii?Q?U022jL+nQkFOm7BWpJXjzrvNoUqF3vt7pXfMOQLJBOexOELKM+wplFIqCa2e?=
 =?us-ascii?Q?VNkje/MATSEzsA9/vVM2lIUS7hf+1uiyrSCeyBHizth9dPktm4EEy1PZPdXC?=
 =?us-ascii?Q?FeZH/SpLmFTl/GXoQuEQNcJWE24oM930uoL3Jh8942GRQBtF9GdC/7aXH2Kk?=
 =?us-ascii?Q?INQW8o3dDFtghGYGlm0F2pgRoRaEpnMXFbZ7hBBm2hDyeEbBrLL6ooWS9qr2?=
 =?us-ascii?Q?DW6sor0uyrQwK+C/zwFjkHWmQytLwRQ1TfN6WFRposnUdxtd3YD/Ldb0mieE?=
 =?us-ascii?Q?AdHvwkTe/XTlxVgzc/+2XkreoFJT/GypOLvv54X0OUG4Wo0f5i5Dr97Upzyp?=
 =?us-ascii?Q?941D+8kI/52x2iUUWPja2ySihEJanfMFx0Yxt916sPp7j9jErrdSwE10r6bD?=
 =?us-ascii?Q?pLWK3IxSrjkUC8yZ81ychQvGuPwMKi7JEY3QYiGZVZyD69lZHTre9Dpi5Xvc?=
 =?us-ascii?Q?bgPp639DoNeP9qZF3nTMBud/rdsluVVP8yBXmkmsvsbQNTPRwBv9LhNVSQJB?=
 =?us-ascii?Q?s0Bmn59FQiNhRRee9FbN6pNIlHdKGbEV0M6/zDL8iOK0dy8pdAHRVm/zEfBf?=
 =?us-ascii?Q?tBqgDdxtluuw4aoGZ4g02tVwAfWSTkGuJAR6FCHLnwPHXvaUl098bgDl45KY?=
 =?us-ascii?Q?tmLXaUB6cpRu1eX0VTUUYhFGMQL73PkuJiQbiYEcQq+1un3LSldtrdvGPhZC?=
 =?us-ascii?Q?hu+tlTPU/aPvzPDXXfEcCmdN+tWqtXnmwhXt2emgyCC8SreaEJuWkyOtUFX6?=
 =?us-ascii?Q?Lw2+VXAxrLt5fjobfi68Z/B/i9unDH6pP3cwDicfGk/9EAMApcdg3K8m9RLK?=
 =?us-ascii?Q?8f419pQhcpaareUwgBShuCFsvuuU8uHYMsmQ0gT119ntuVwlHKYh7ToKB4Q1?=
 =?us-ascii?Q?WruYbxGsDcShL3Ym++Il90AxGN9h9ueRHb6I3DcBVdY364WR539If67KLyNC?=
 =?us-ascii?Q?BufWJ3uaCFmEjbh/gbljQ8mSjrB9sQWnzivUHoumQKEuj8Ry/J3JTifOl9qZ?=
 =?us-ascii?Q?7J3+mjDU5IG1vq7bNWjeLVdw4Uol/U5wW/X9yLX+VehYUaMWm8wbIycqhZXd?=
 =?us-ascii?Q?PmfGIWrtlcI6tDZL6QFxVEuREFdFabT3Gu/I9DPN341EglX9XMHuRtkR7UfR?=
 =?us-ascii?Q?YiHoHEgP1wC3856PTvZGSW85nSM4n4rp0kDRwQ6Fid4RTrbPWP05+R2flfZ/?=
 =?us-ascii?Q?Zq54UC8od0uneA7onpc7aLYVVlMLz769YE282741X3JgmMwHZQVjjuBBYfxE?=
 =?us-ascii?Q?Ll8rWU2j0UblWMSqXn5Rm+EIjy+vGm0wnpPG5vw7jVdlulg5P1ASNbG4TEsD?=
 =?us-ascii?Q?MgMu9K3Z71xZXY6Q6fLFM9wd+lcuAs0+2JKDt8q011tTC+u89c7XPgUc7kiP?=
 =?us-ascii?Q?w0VBz+W7spQj87tBAa8=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9c2da64-40c3-4232-ef84-08de3e4baaa3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 15:39:44.1053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lZtf2wkdQom/Epy2FFeQoEIszTySg2UpLTnLoBrW7ze+k+wKpINqgZQ6dgPw3t8+tkuc3B13PDVAaMqHpTLQlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB11569

On Thu, Dec 18, 2025 at 03:17:50PM +0800, Shengjiu Wang wrote:
> Do not reset memory at suspend and resume stage, because some
> memory is used to save the software state for resume, if it is cleared,
> the resume operation can fail.
>
> Fixes: c4c432dfb00f ("remoteproc: imx_dsp_rproc: Add support of recovery and coredump process")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
> ---
> changes in v2:
> - refine commit message.
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
>  drivers/remoteproc/imx_dsp_rproc.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index d03017d6b214..ac8aa71aa56c 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -984,9 +984,11 @@ static int imx_dsp_rproc_load(struct rproc *rproc, const struct firmware *fw)
>  	 * Clear buffers after pm rumtime for internal ocram is not
>  	 * accessible if power and clock are not enabled.
>  	 */
> -	list_for_each_entry(carveout, &rproc->carveouts, node) {
> -		if (carveout->va)
> -			memset(carveout->va, 0, carveout->len);
> +	if (rproc->state == RPROC_OFFLINE) {
> +		list_for_each_entry(carveout, &rproc->carveouts, node) {
> +			if (carveout->va)
> +				memset(carveout->va, 0, carveout->len);
> +		}
>  	}
>
>  	ret = imx_dsp_rproc_elf_load_segments(rproc, fw);
> --
> 2.34.1
>
