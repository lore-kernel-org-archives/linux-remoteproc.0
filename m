Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011000.outbound.protection.outlook.com [40.107.130.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF8126CE2C;
	Tue,  4 Nov 2025 03:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762225984; cv=fail; b=iDcn5pG3ODrgDJZNbutJmbtHKaSuIrMrNzUj5xNuRAySBDgXT5AeKbo0wyHMjpJWm+U1bQjXwPvjtyd+OdHB32opSANqV4nTZWOrU1xnOOLR1rKNyUofkPXDaeXuIEU/h48isxxn3InEnRRZ0GApc3wBQ4pkLUU0c7KLDA9tVGY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762225984; c=relaxed/simple;
	bh=M5bGpKzk+g5kt4mRFRZ6D2WxJMwlavVzt+ZvbG9JszY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QsxrPKsFzx+kvZtPN6Y0HRodOT/l4++U+rfau7EXp1yy4k6LoTzlDBrfKycHCLtv6mULs1PgQMF2C0DS9rCgxPE1rOnNJ1Bvp5GHw601r/wMqqcPrUNtQdT1TLwpsfcSSQl9sgSWFQ4QMqYv3jRz+oMZzHewxsA/xDbWj412VrA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=NZFCeiSJ; arc=fail smtp.client-ip=40.107.130.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="NZFCeiSJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Be3VPEKB9ZES8zLJ6wMpIM8t8C/iH13Ax1H1YR44YKLK4qXkEyj65F7NAxDumYnaG94Rdr6vMH8WEVVw39nfOlXes4RjPIfGkZTXJXqD8b35n2EnMo6CD22IsB377gIXxjgd/Wp/u35TknXn0gTslyNBUQuRRva+LV95wlGW8KEFPD4DMNI3BrwskTTNColBBX/8kzYAgd4SBDkh0x/4zF/v22odFJSASeh4bPXJ6AeDwS3UXmVzz0WmQloM04GYmZ4mDbNKoIo8Jp0U+AgCEVTIXzGihcvQVPpL9JxmaDYH6kvnXtEPBeS7BFI5iH8KbMQ8PzfAUDjkRsMISfilOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=amXLrxK65pOS84TGlRP+Vzm8ZkPFl1pKpUewSXA9Tbk=;
 b=xRyNyzct4l7A2GKwkuQudPF/v4i3ZW1idB84/3JTCuzQ+FWZQlNPIoKEzaMLeRj9xziwKOrhEs12L8hiBLY5Js8bXBQjEdDNBMApDXBo9qg25BFclOvPN5siiD/yM4OB07N2jOx7WMR6ZIK0RzT2rwancjpb5Ly9CLqr8RVV+Jc9N32NtHZ3lSNb/OeZEvlMWGlyybY1wrz8B2ftGancawPR3ZUg0ytq462knMQDGBEutJNoJZFjoVjH4ybxmlu0FhzMUQnmnkON0O3AEETVq4UtDORlDJKvWVUG4GR8rJuXOq7n/HYABzXRFXKyw0K8yfDxjftrcd1dWzRizFroZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=amXLrxK65pOS84TGlRP+Vzm8ZkPFl1pKpUewSXA9Tbk=;
 b=NZFCeiSJUkShs4VZdXEtoTsI7uebEX7pHSofX3DgsgrtxCT+VVYTEkNk4ePmW9wFbc+Q7CPgNpWWpI1JNnaR0c115ZukI6evZrW3/bZ1dWCh454hRs1sYu206O/1idPF9KklVhckRBNgRw532Q5GPQVwJqW+Jzk+qSNAvhAPBZIYJRv0VLz0j9SOVHympin+iLwOSafkeoJBsKMWMOrTvxGGMCNHAqwpKl3bBJQ4jqcL/hcio2OAur1cLG8dvcZXeYI/nhkBJD8h9wtKuFQfsZTI/amq/2gajLJBYYwhRGQVOXlkHfXExDAZqqgwoll5u+5RaXdpO7K94mxJV6Scvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8272.eurprd04.prod.outlook.com (2603:10a6:102:1c1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 03:12:58 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 03:12:58 +0000
Date: Tue, 4 Nov 2025 12:25:26 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>, Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/11] remoteproc: imx_dsp_rproc: Simplify IMX_RPROC_MMIO
 switch case
Message-ID: <20251104042526.GB11714@nxa18884-linux.ap.freescale.net>
References: <20251031-imx-dsp-2025-10-31-v1-0-282f66f55804@nxp.com>
 <20251031-imx-dsp-2025-10-31-v1-8-282f66f55804@nxp.com>
 <aQUJEwjl1xx20dtQ@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQUJEwjl1xx20dtQ@lizhi-Precision-Tower-5810>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG3P274CA0004.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::16)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB8272:EE_
X-MS-Office365-Filtering-Correlation-Id: c78f000f-49f0-41e4-a6ee-08de1b500e58
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?r7d37rX6bSPbxSXTqBvQE3+kg4J/VDHSV/MZX58EwZQIKbhApsDb0PYvMFHa?=
 =?us-ascii?Q?QnDApUswYQrdLRinl7a9dspU6aOg0uqCoSgDj+2lV2UV0LEEUsZbf/1THeCU?=
 =?us-ascii?Q?r7CrDOcegr13XSyC5wBC1pzAPOX319CL0lMtip0y0xURTT/oGIj5965FIY91?=
 =?us-ascii?Q?D2wSrsV42mZVt6d5B6xiwhygvQhSBkBEQbGWtU44Og+DeSmfCrHjxwN1KSdK?=
 =?us-ascii?Q?J16p2IW91wLk55CxVMxKWzm0Q2bpDyDs6y/7dWWY//q9mkN/3EDI5i6tyGbg?=
 =?us-ascii?Q?Q3oExDNPIqRhjCCWuDKk6tBTeTZrhm0c7oiLkIEPxq1ASSbh2uQ91Qmxtu+I?=
 =?us-ascii?Q?Al7mH633pp5T9G4Ay06Na3gBPxCVqf03QVyqa7GJvR1UXxl5A4gUABpwsqXK?=
 =?us-ascii?Q?Rsi6y3D6+hyIx9hGTO8tcIytvoFC2c+o2cRx3oJzH0bBvpWmBBPuu0RftgN6?=
 =?us-ascii?Q?G8sSpZYyt3BcHoQIf9nuKCt2AxqFVlRBltRRKcbu071VGvIyK3Q2L9iqX9LT?=
 =?us-ascii?Q?GQqjk7Mf1oScdlIkr8TsGpXYSL1TqnDPco8GiBT8aS5OidbJKy7ELCJbc+Wk?=
 =?us-ascii?Q?dVCXAvvYM66U4SvW03RzunN0kr8yEWVH8Mx15+I6rv7u+MlUgtrKg04H4Bl0?=
 =?us-ascii?Q?wb0NoCO7UatsyLCDHbptFstXMA1kqzD9PPJvZ8geGwDRl2js6PSKS9XA+iZi?=
 =?us-ascii?Q?kq4GoMb+F/Kh50jt6d/rrggYvLktitq5z2YccenP9MfSYTYu/l+0uBkLyTeg?=
 =?us-ascii?Q?hBkTZaak5ArYsnE6WG1fSlOfP0XlZaa/uEBZZkRu/LYmq9TluMbRQf9rfh6l?=
 =?us-ascii?Q?qzMo46n8HcNOPY3FUIU+HlfTDkCs14vPToxQTkYikp0k5fy5HxH1cUWdFOOD?=
 =?us-ascii?Q?vV/Qr1PBJ+BsgUH79htyVGJx0mmV/KAYyGID9h9OhbE0zXEGlJgrKQq50r67?=
 =?us-ascii?Q?1pFxTM6HNx0zNZe2pLnuVVrejRQVawYe/EwHSNa7M/VMw+vkvn6xKv3TMvgE?=
 =?us-ascii?Q?SlOqpir0KqioouWefoW6+/EFZK45TUR3PfuOAsTORWYTqRLJZmnkH035oi2n?=
 =?us-ascii?Q?rDdE0c1EB/RpciXv3wOrlGvMkS0KuTBoRMgnTSWqza+uLnyZXpvgX637tU2V?=
 =?us-ascii?Q?z96/GI2w5Bs6FyhtcU/O0qS4ybnerMTdju2/j8rp+Js/E7cx/+WK1fY0/l2t?=
 =?us-ascii?Q?SnjtnYfCyTRqn+AhxcQddk1WlkwVgJe1aEEACB24r1/ehFdRz/1T537xfa6f?=
 =?us-ascii?Q?QYkTjtK5Wnte443WT/4Oh5BE9oAMI2N3IjiG4XyaZ2VAenEbiWSpxZkNSITP?=
 =?us-ascii?Q?3fh9KaxJHLrA0Sqi1RDej76lHMmgNeDr/dgTZnYErqTEMnmrZqmC05I7vn0R?=
 =?us-ascii?Q?7ifiopP/mPvnsZ6sGDq4HfssbI0XEb1FuEDiMKyyTt8JilMgWKhrlXtKmKkG?=
 =?us-ascii?Q?806pBFpURN7QJWvY1yC7S9F8bNhXQvpJrgOJoSL8dWr7lwChIOHWMDJKKrv0?=
 =?us-ascii?Q?vpgx3UPFcAkCcJJTJUFwCzzrw/N34Oh/wl8X?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sqsFb4a4HHAUFHrBu16vFDThjTi8uDV8xVuAD9lvjzlY7L5Fvsf8qchbBrb5?=
 =?us-ascii?Q?IVWO0HYmS1TLccBzT9SVEuTxx0Agls7nYlfsT2gJQPezF5IsV4qGtVl7qH6f?=
 =?us-ascii?Q?8j64flmsqUd+/9HJhDQske1R58Jq/vosRRgeyQHv3EwHyCnt7CcfSBjMSWbz?=
 =?us-ascii?Q?oV1ClHVAW/RSjtajGscGhgk4NwHYQsERK9XTt4vZ5Faq1hOvXlEDqdA1+hkv?=
 =?us-ascii?Q?P1b2bpd65ARu0Mu70wsDprH21p/qa14EUfZrlxcomvFxFFFYaT0h46UrJBuW?=
 =?us-ascii?Q?8yLdqwQS9P4LL+D6SBQkHAbNNNDIpRE4a55OxtIsEdZwxV96t5lOy3ypBwL3?=
 =?us-ascii?Q?OxS8RYIk5awi77Oq9aLcDg7faJelA/GKANs9dqFSlZ/OP8zlaRFIGiYebUBT?=
 =?us-ascii?Q?YtJmNxohagWvPtTNV6QGdkW3AM7TWNzA1K0IZmnhI2qJAFj4DfGo0ZEU86Bd?=
 =?us-ascii?Q?TtXg7WpbYFNc8ar1oBRq+TWQJ2so/Oh5YTGhyq17ZNdgQc4G6Q3qd9l2c+z+?=
 =?us-ascii?Q?VHaV+mA1yxmss7yU2+qKhRAvIBb6w/hJyZ5NsSDIVmHq+gpjgeK/jDkG2GBD?=
 =?us-ascii?Q?WNRd3UNna0oLM0osGfl9gIIbaCKILtFBIVMs60GGgevXNsr4zaR4y1pPJ63b?=
 =?us-ascii?Q?wEoP+uYsNe8ctePuRYroPVCb7Gn8jp5tA9TdxjSnLY8+OYEiPJT90aCzzaox?=
 =?us-ascii?Q?lp7xzFEkYwPBnGzs6wQ6/9MgLrARoGthE4/Fh0oZ9U7dOWswh4ZF1Vf+M4qr?=
 =?us-ascii?Q?+WEefbEodAZPCaodWnuqPp+ID97D541k72UicinqXa1iZGnDrixQpuBwKsbz?=
 =?us-ascii?Q?+eEfg1xbXVfbQCBihBw9xnSqpFF6e3e2DZpJRY9Br0LtQ/k2wE5dB2xAK2qo?=
 =?us-ascii?Q?AClTZ6X1PeY+JDlKXjaTIEVL4HvJxxPasIVwioRRGJZD3CGfaoZme6cnq+bN?=
 =?us-ascii?Q?d0T09CM7+2Z3uSwff/Xfua43RIU+NFUlzmTCpA/QJH44/+5SKfQzmpRXmuhk?=
 =?us-ascii?Q?wogGoNJKSo84sr9QidkeR4ZNMayjrzHpW/QP3M4gREMtWk28TxsSnJwvbYVP?=
 =?us-ascii?Q?zfo/uWYwP0YaV/ZYuLXqQLmEVqXqSm/Fyy/0nk3Dv0ud/zlJ4mERyGYxyld8?=
 =?us-ascii?Q?dG+O8mzFvtqNKrnR9ZjDktlsNSgzTGBQpYn5IMZHPszHNZK5lPdlYFkIJXFI?=
 =?us-ascii?Q?0A2w2AJmkI8kmWxVBICPcotCxpiaaDAupYWej1Rag0FaE2BITvWVktjS5d78?=
 =?us-ascii?Q?kUwbpzs5mytnKQ9ipBc3vrbELpfCME7MVUPyUF65ftGRbp1gu08+V9naTP32?=
 =?us-ascii?Q?TDSFKESc9GW9zaKYhRt6QoM9oDL0nmsJz/w+m5gjCnqgfb3kO7R9Vyw37KiC?=
 =?us-ascii?Q?9PvCzMveh0Tubhcw1bucx0trpeN2QTb+BVEhr1q8e7EOgl2+znPqbFivAoqB?=
 =?us-ascii?Q?SrwP1jZmv0Rit67GoLVjiw4YmpATaLV98IHpqGoINbiXiFkFgz/IfookzXgk?=
 =?us-ascii?Q?SBFwq0qQPZsbpnCk+rS0iuBua6/euqr64v8CmwyiwEgS+h8IObbtzi5RahiG?=
 =?us-ascii?Q?bF+cXuc/fwluvv5qT/RrdS9UAqpYuiwiUJtHxfBN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c78f000f-49f0-41e4-a6ee-08de1b500e58
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 03:12:58.6785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sbZyfpcw6pfFRdVyaznTIzRuY+pKrSuEeQpEkyGCqSaaEFSSjNqFAvv89t3GIAXp/7mr1DzT8HTDvx+H/CtMPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8272

On Fri, Oct 31, 2025 at 03:09:17PM -0400, Frank Li wrote:
>On Fri, Oct 31, 2025 at 05:08:37PM +0800, Peng Fan wrote:
>> Introduce imx_dsp_rproc_mmio_{start, stop, detect_mode}() helper functions
>> for i.MX variants using IMX_RPROC_MMIO to manage remote processors.
>>
>> Allows the removal of the IMX_RPROC_MMIO switch-case blocks from
>> imx_dsp_rproc_[start,stop,detect_mode](), resulting in cleaner and more
>> maintainable code.
>>
>> No functional changes.
>>
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> ---
>>  drivers/remoteproc/imx_dsp_rproc.c | 63 +++++++++++++++++++++++++-------------
>>  drivers/remoteproc/imx_rproc.h     |  2 --
>>  2 files changed, 42 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
>> index f28d25cab3f1d89e5cde37a04b528870a59abeed..456a46f163d3d823a25d16d11fb79fa9fceb2ddb 100644
>> --- a/drivers/remoteproc/imx_dsp_rproc.c
>> +++ b/drivers/remoteproc/imx_dsp_rproc.c
>> @@ -338,6 +338,15 @@ static int imx_dsp_rproc_handle_rsc(struct rproc *rproc, u32 rsc_type,
>>  	return RSC_HANDLED;
>>  }
>>
>> +static int imx_dsp_rproc_mmio_start(struct rproc *rproc)
>> +{
>> +	struct imx_dsp_rproc *priv = rproc->priv;
>> +	const struct imx_dsp_rproc_dcfg *dsp_dcfg = priv->dsp_dcfg;
>> +	const struct imx_rproc_dcfg *dcfg = dsp_dcfg->dcfg;
>> +
>> +	return regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask, dcfg->src_start);
>> +}
>> +
>>  /*
>>   * Start function for rproc_ops
>>   *
>> @@ -360,12 +369,6 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
>>  	}
>>
>>  	switch (dcfg->method) {
>> -	case IMX_RPROC_MMIO:
>> -		ret = regmap_update_bits(priv->regmap,
>> -					 dcfg->src_reg,
>> -					 dcfg->src_mask,
>> -					 dcfg->src_start);
>> -		break;
>>  	case IMX_RPROC_SCU_API:
>>  		ret = imx_sc_pm_cpu_start(priv->ipc_handle,
>>  					  IMX_SC_R_DSP,
>> @@ -388,6 +391,15 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
>>  	return ret;
>>  }
>>
>> +static int imx_dsp_rproc_mmio_stop(struct rproc *rproc)
>> +{
>> +	struct imx_dsp_rproc *priv = rproc->priv;
>> +	const struct imx_dsp_rproc_dcfg *dsp_dcfg = priv->dsp_dcfg;
>> +	const struct imx_rproc_dcfg *dcfg = dsp_dcfg->dcfg;
>
>can you add helper macro convert rproc to dcfg to avoid duplicate above
>3 line codes.

Update in next version.

Thanks,
Peng
>
