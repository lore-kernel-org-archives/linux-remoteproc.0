Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010024.outbound.protection.outlook.com [52.101.69.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B0729898B;
	Wed,  3 Jun 2026 13:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780492522; cv=fail; b=TjVK/syjBFw9AZF9YBKjXgOiMlhcYqPy4hIjYvh2bjnCej4KBp7l0WSzQZHc6HK0pDo85YjwTJ8Jy5aKSKXGVVUTRnPbvwtr9cPjHzZVg8X34whgBYcEd817KzS5enxYxn/ePBRrclr863cKrspf+wpW2FqxEWkpRMezrz7cVwY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780492522; c=relaxed/simple;
	bh=lSovdGXUk3jmOaDDE2vOOGW1rHicoGx2DbemUDaMTjo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RHNJOwxq5uOfuoLqYwBgIqoRRySrV+KBA9/XFRdh90GcluK9BxCxq6lKth4u0tAOtOeDIFjg4fhoOYEqHk2VXGOxNf4IwrNJ8VRtNkuPOf+ofHnBFbLi1/4ijmRkgUaiRXUfZS9CHVawR0cTwPQAkQnV20UnRbJMVRMAjA+bfvQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=TrqYdm+z; arc=fail smtp.client-ip=52.101.69.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="TrqYdm+z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l2ztrDK0xGrrTgCNUMJ8rSQEmWm87C6Qv9m84wcwSR++K+D+f5e7foLiS4cmULOJoG58HOILiHAVVN7wT3eDQrDhMetHMdrDZmohYkGfiN06bP/VfODXDvBcf8x5D1Q8ohkZJzfP0243TUSnEOygehYv3dbvmT/MP7HGkQb3SbUxujWITfYfpcZWJn5KaSF7uoFK9hmdVMmcBr40CFO+O4/esaqz2+86XDJbbNcvbsRcvyABbzsGd+nHocSTspsC6WhPCR5iqYEPo4CKMiyfjBmZLP8gNR8w9HPIISt5+1u+C7qzFDQQA8xQkGMELONTQmTiruV8MRInVuD0XPlctQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RU29oH8/NrEW6DEgTusosPvx2uF7ptt9MF8V4tjIKt4=;
 b=yzMurfBPV/JJ9SstlqZcr12zREdEW3xsEuJc9N67uvIdz+qxxnwvgqAXPO3n8alyOYl+byyL6W7tZJZVvi0RaRUoAeuyTGsac7VDZvwSO2mOYe71Df6zZxCp7hkSHEKplgzGnFfcehXRPJx89GtjoYLheUxmLQhXyNgmu2ei6rPU3KUEf7ChSbjwij0PmRmaRgfGpRaJcB56sbVdCfKnudPZMiREOtZ2+oGHRqogrACIRukKwxfwvPcDsfv7g+XeFXJzMXzMyzeRpIsK/ioYj5sM329snejjrFu9RGb+Lspmqh3ek/hpNJEMldzz/A1//+VGaYaBGy4gmIdA0aETQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RU29oH8/NrEW6DEgTusosPvx2uF7ptt9MF8V4tjIKt4=;
 b=TrqYdm+zPR25zJFLLMTRt6/OuEq9LkD7CWg6EKPypD49dJHu63s1APKOBQplPCux1P1639HJwQQKihVPw2oEl6UCNFYvzJyvYdgDmrQTWDC7U8eDjh2TVDkJJD5PknjUjh6LLN6ThX8MuyghOLFG1a+65dTYLYyKcC9/o8bjohtu2qVPQlWCFr7Nc70/KNBB+13lVV1fjXSXeIiKg+f+Ilwci1ERARtB/VJTatpUIrAylp1aKVIsmqmzgdFYCnZw3x5/pCoejFYBNcsVjeVfd/r7AhzZF387EjwPrvuaU3GPy4jQv9v2xsoFWyasQjnWgaIe5VWtK5M9F71jKKlhxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by GV2PR04MB11958.eurprd04.prod.outlook.com (2603:10a6:150:2f3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 13:15:14 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%6]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 13:15:14 +0000
Message-ID: <c81d12a8-7544-493f-a947-8f70ad9d409d@oss.nxp.com>
Date: Wed, 3 Jun 2026 16:18:22 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] mailbox: imx: Move the RX part of the mailbox into
 the threaded handler
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-remoteproc@vger.kernel.org,
 linux-rt-devel@lists.linux.dev
Cc: Bjorn Andersson <andersson@kernel.org>,
 Clark Williams <clrkwllms@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Frank Li <Frank.Li@nxp.com>, Jassi Brar <jassisinghbrar@gmail.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Steven Rostedt <rostedt@goodmis.org>
References: <20260603-imx_mbox_rproc-v2-0-a0059dc3b69a@linutronix.de>
 <20260603-imx_mbox_rproc-v2-6-a0059dc3b69a@linutronix.de>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260603-imx_mbox_rproc-v2-6-a0059dc3b69a@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0415.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::12) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|GV2PR04MB11958:EE_
X-MS-Office365-Filtering-Correlation-Id: c8875f04-a312-4d91-b162-08dec17225b6
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|7416014|1800799024|22082099003|18002099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	GhNjn9l5UlXsKHUbK0Xd/9VDfj26tuHyoFBNn7RBDJSB5FnPVHs9g6p44Wvy2xmwXAVMx4I/cMwliMpMi54rzawMkYSf74Y/3bcQ5pj0OxFYW5yN50LmqbzC2iiEHfE+Wg68UTuUL5zU6t88emzRpUtnaPbnz3tQ5MPJdULiUc/wUvOnPYAY0NZn0rqXenHl1aD0ra+IWRZap1BZyfeQROZPB/4qjfSPQdu79s7dfpGWvJ39pqQvJJANlteH2Vj2Sovak6XPRfeQJQGesDZUY+64xllw6T+XAp9ox1DP3wkcXC3OdInVJoC7LS+3Tl0ykH29WNvRf1KUqZLYRCa/Isc7gibHxkX37Y9pyrh+NpyR1UXVYGjN/1+0ZPNxUt3bXPWtyV/xlahDaO9hY8Q9kZQMQCDksAeLAoRWPh5gFTKVTZAebwL+EKRNLPubjCKrrZvBX/pCn+BfVY8dvXKAnmjtlFbeBpnAQysUip9D6Qra2jAwkb6Um3RtZqXmz35GfAXlayNBYBKKTPdqthMWNSDftfXWGBdGc7GYUp/pxatE55VFozshSxbMR6lIBj1ZgtKsdGURDUyAXxftEXOObkEQuY0lApEf6fJb76shL9PEqJInKReUm++0tNJHMGX9m5LPMOFNxA+YmczNbbZmacmLzIr58Q0hqaneOAcSHbI47QKbcfNl6m5DnB1mxz1D
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(7416014)(1800799024)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UjBXUklmYlRJYWlrSDdRejJNQlBiTXlDWlJ6bHFycFhJelc4eVhEaHdBQ1Za?=
 =?utf-8?B?WHQxc2JQQ0Z1YVVibE1QbDRFWTZqVDZJOWRHWE01REl3NmtGWTNmNXFIWTBF?=
 =?utf-8?B?aUZUNk5kNUYxNkRIVTZSMllnZWIvS3VTbTdXTTFERVdQK3VaZkdJcU5Pclp3?=
 =?utf-8?B?RExvQnhSVGdPRlBXYjlwUzNQbWYvWTFtK2VDejNiNGpvRVYwOXp4MVZqazNl?=
 =?utf-8?B?TWRRU2pLTWUvdllNVkNjemxHMjVSaERnTUF4NVh0c2wrZEduSkZCc2FnWGUv?=
 =?utf-8?B?NHpIWHNiWXBtNkJMVGtVWVh1MW8zS2htSk5NaXlic1Q5cGkreTcrVGMxRStr?=
 =?utf-8?B?Wlc5NmxWc3FyNDF4OEVtMVRxQ1VDUW8wTEx0WFVOaEVWdmNCTU1QREEyRFRr?=
 =?utf-8?B?bVNNL3ZUWElQeFR4cjgxZTBHNXlubnNDZkp2MFd2Uko4SXJFYXM1Z1JiRlNh?=
 =?utf-8?B?ZVpyb2VoTDllQ0U3eUtPWnpoZzFRZmFFYzlqN1hBWWJlUWJob0xvSWZ1M2lv?=
 =?utf-8?B?eWIxV0xiR2s1ZVlwQ21FQUIxVDgzQ082S2dPOUh4ckdrdCt4ZldaR0dLdmdP?=
 =?utf-8?B?amVPeEpxU1IwZ2hNMDJtRm5QcVJMMnNqUUVFRFV5WEFpTXhCSHJYM0JYOHlV?=
 =?utf-8?B?YVROdFQ1K2FyVm1SbFBDWll1dFUvWWduK1lNbXhVL1V3ZTBRK1l5QmE1R1Q5?=
 =?utf-8?B?WnNlZDgwaGJwTWRqRzFkRVhpTS9MZ1ZkRURXM0JBemJ6R1FHZHJqTklaSGZq?=
 =?utf-8?B?MFBNZEc2bnpoOWRVOVVudVZ1bUhCRzh4dUtrYW1DcGUvc2dEcHRPMjJGU1Nr?=
 =?utf-8?B?V3pGekV2ZDFZOUJYRUJ3V0tuaVk5VlNWeHdLbkErNUhxLzN3eGVnNEpyWm5O?=
 =?utf-8?B?UjJENGI0T2IyNzRhNUNEeHN5dnB5b043bTUxT2M4RzdDV3EzT0lpNmZqR3FP?=
 =?utf-8?B?bWs5dGs4K1N1NSt0OXRsUmk5S1RYcEpjeVRPcDZXci9GVGpoYktFNUpEWThL?=
 =?utf-8?B?SlNDamFnb2NQMjF1djV5SGFrdXorUnRXSjFXeHdzbE9BTnczR3grbFIrUkNk?=
 =?utf-8?B?SCtMczI0QnFTTE9DaXlQR0tKQVA0RHl1eHZRemxvLzJQai8zZVZDTFBKK3Vs?=
 =?utf-8?B?U2RBUXlMam1VSjgxR2FwM01ScExNMS91RjY1TExMdERtQ2FHMHQ2WVlSalNp?=
 =?utf-8?B?cUdNVk9FZWdIeXRLYzdheHZYVUxqQXMyTU5jYmtVK0xLeHBaNWxheEtpakRV?=
 =?utf-8?B?bk9HcXp2L0ZmVkp1YVdXNFQrd1EyNllkbWFLWmZtZ0U3S3pROHN0NGdBV0ZE?=
 =?utf-8?B?UUVEcnNtdnN5RkErSld3VjZzeStpUUZVcTIyOW5LdmpZRCtPMG5SWUZGYmxT?=
 =?utf-8?B?a0UrandKak16VCt6SUVQNElZTVhOUUJySXdURUYvWnJ0YkxtY2FFVVU2Uzlz?=
 =?utf-8?B?VS9zNzhyenJyd1J0WmhzTkp3a1FMWkZJWmg2SElMeXpvSVA2Y3dMTDN2b0NE?=
 =?utf-8?B?UXQ3cFV5YnNoUHJPbHZxZ2ZUcWlyM1JwS0NORitvK2VzMXM0dUFJQ0ttd2hp?=
 =?utf-8?B?aktVWXlLVWF1YS9Fc21sTGlGZzNEbS9wNnQzd21SWmpjNVd0R0orb0p0WjZi?=
 =?utf-8?B?YUV4emZKam5tQjhIYmliS2lGZ2IyZjgwNHJtNFQ4cEtONVE3bkh2dWtndVgz?=
 =?utf-8?B?aGZncjRCNkpUSXlHSnZKR0tCdzBNaGdoMCtyR21SZHdqTENDellYZWc2VUVt?=
 =?utf-8?B?WHdBY1NsbkpxYndVTkRWcEI0YkhGSklJYjZxQjZjSWp6aElDd3hMNkZxVzYx?=
 =?utf-8?B?cFYvbVY5K1dTNmQ4VmpWZXZKb25OR2cwcmZuR1FhMzhsZmQ3eUQ4RjlldS8x?=
 =?utf-8?B?L0xjcWZtZGh5V0tSSy84MVUzeDNHcFNRT2tVQzR1RHkxT2hOR3ZKQlZ4dWRT?=
 =?utf-8?B?RFRlSE81aitJMmxQMW02YngrVnJNT0FtWXEzZTdCUFFRQzJISzZGeWQyL3NQ?=
 =?utf-8?B?QlVLYTQvRUZVOGZaWkorZFIxUm5rbVgxQ3Jwc3J5b1hHUEtrVjBMNGI0UklE?=
 =?utf-8?B?eXcxV3lqcGxCT2o0Qitld0ttcE9jLzNrcndDL1UrM01jSTBZb2tzWlh5cmxj?=
 =?utf-8?B?dlV5em51cVJWM0tpSW9rOU9uSVNDTGoxeXlNd1l2Myt4SUZkU3VsYnNNL0Ri?=
 =?utf-8?B?cjNyZkcya1AwQ2JjTzNUcjNTT0hiNzlsUkY1K2JkdnFvLzBCcWo2bDZIWVBF?=
 =?utf-8?B?NFlDNDNKWUpqSW1kellrc3g4b0MzMXdEUGFKUDFSbTZDSWg5cTRNYWZlNDRw?=
 =?utf-8?B?eXdRTHNQNGEraThzT29oN2dzcXBUVGFMSnhkZG1OVTA0aUJ1SXg0QT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8875f04-a312-4d91-b162-08dec17225b6
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 13:15:13.9735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HGH0UOaBQYgNvtDCL82wqi1ODKUXLgvgAmM1/yDgSDpDi4VpaLuiGwhC8VATXZMUCjbvcsf/IeBydq5Ru3wgxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11958

On 6/3/26 16:05, Sebastian Andrzej Siewior wrote:
> Move RX callback handling into the threaded handler. This is similar to
> the TX side except that we explicitly mask the source interrupt in the
> primary handler and unmask it in the threaded handler again after
> success. This was done automatically in the TX part.
> 
> The masking/ unmasking can be removed from imx_mu_specific_rx() since it
> already happens in the primary/ threaded handler before invoking the
> channel specific callback.
> 
> Move RX channel handling into threaded handler.

Hi Sebastian,

It is not very clear from me from the commit message why this change is needed.
Can you please update the commit message with proper explanation?


> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  drivers/mailbox/imx-mailbox.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
> index 006aa76b74b62..6fe202593592f 100644
> --- a/drivers/mailbox/imx-mailbox.c
> +++ b/drivers/mailbox/imx-mailbox.c
> @@ -381,7 +381,6 @@ static int imx_mu_specific_rx(struct imx_mu_priv *priv, struct imx_mu_con_priv *
>  
>  	data = (u32 *)priv->msg;
>  
> -	imx_mu_xcr_rmw(priv, IMX_MU_RCR, 0, IMX_MU_xCR_RIEn(priv->dcfg->type, cp->idx));
>  	*data++ = imx_mu_read(priv, priv->dcfg->xRR);
>  
>  	if (priv->dcfg->type & IMX_MU_V2_S4) {
> @@ -408,7 +407,6 @@ static int imx_mu_specific_rx(struct imx_mu_priv *priv, struct imx_mu_con_priv *
>  		*data++ = imx_mu_read(priv, priv->dcfg->xRR + (i % num_rr) * 4);
>  	}
>  
> -	imx_mu_xcr_set_act(priv, cp, IMX_MU_RCR, IMX_MU_xCR_RIEn(priv->dcfg->type, cp->idx));
>  	mbox_chan_received_data(cp->chan, (void *)priv->msg);
>  
>  	return 0;
> @@ -555,6 +553,12 @@ static irqreturn_t imx_mu_isr_th(int irq, void *p)
>  		mbox_chan_txdone(chan, 0);
>  		break;
>  
> +	case IMX_MU_TYPE_RX:
> +		cp->pending = false;
> +		if (!priv->dcfg->rx(priv, cp))
> +			imx_mu_xcr_set_act(priv, cp, IMX_MU_RCR, IMX_MU_xCR_RIEn(priv->dcfg->type, cp->idx));
> +		break;
> +
>  	default:
>  		dev_warn_ratelimited(priv->dev, "Unhandled channel type %d\n",
>  				     cp->type);
> @@ -608,7 +612,9 @@ static irqreturn_t imx_mu_isr(int irq, void *p)
>  		ret = IRQ_WAKE_THREAD;
>  	} else if ((val == IMX_MU_xSR_RFn(priv->dcfg->type, cp->idx)) &&
>  		   (cp->type == IMX_MU_TYPE_RX)) {
> -		priv->dcfg->rx(priv, cp);
> +		cp->pending = true;
> +		imx_mu_xcr_rmw(priv, IMX_MU_RCR, 0, IMX_MU_xCR_RIEn(priv->dcfg->type, cp->idx));
> +		ret = IRQ_WAKE_THREAD;
>  	} else if ((val == IMX_MU_xSR_GIPn(priv->dcfg->type, cp->idx)) &&
>  		   (cp->type == IMX_MU_TYPE_RXDB)) {
>  		priv->dcfg->rxdb(priv, cp);
> 

