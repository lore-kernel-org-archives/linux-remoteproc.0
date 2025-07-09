Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011017.outbound.protection.outlook.com [40.107.130.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F30526B747;
	Wed,  9 Jul 2025 06:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752043180; cv=fail; b=S1uk+6cD9flH3nmxhL3gdO2OauEWmXoo/Ddq6yRDSQWxnVDhUlmldZS9RwsQ4wdhdI9zi62EFBkUPpesb+3MGLO7eIX/O45RVf3jrb5eoym4Qp9cQLkaamKzhhz+fwke9o1QHD0Pb6nnNSywUMRSCOIVqNM1AYPa9nnJh4bR7zc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752043180; c=relaxed/simple;
	bh=rRqHoD4+jWn/weHGl7+eVHD1YdVT8Pikrhq//JPEwx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=il9znrwgnvk8YCleTPADU1I8PMRFjiA2R5XL+zI+c0jZJ1OAlQiHCUV+FQVv4HqZXswO1B6ef8LTR9qQOnsNJQgaA94o7SSKmksImjsYxdjIf2Fzwl5ZDXtkX8qkHi5d0JnD9gb5QPvnNZGVA9dIFvWxscGGUllOiYAqHMTu2lA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=FfQ4jwzZ; arc=fail smtp.client-ip=40.107.130.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="FfQ4jwzZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gNm68ofDpMkTzJ2jLRoL3a+ItFIsrA9aYXVe59Vy6S4FskmTHYSeJDE9kOJ2lSb5pDMj+Bw7Jsj5foGDUJO93BafZaILuz4JEEyID16VKHSMhUTk35Td89KK8oz/SZ86eTod/8nsF6ytzGO4yybgnPAXDnpgeEZTDvPyAijofA3pSqjaZIMg+pgyVH8BxEplUq09wULaKIpLKMMMzWe2DeMpfgN7cpdmTSoiPnVFMjeMdrRFDrsjtjNcthKKPoDW6BK24kSUadKJ1xvUPT26qFrQqUdqmGvHl/TmiJnXVKDR9kLASeSyWxDQBWamOhqE88529wFMBOgRZibSP9jAWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8d8g0SYKmOr4v166dBx5Whp4pPSDxdmFAdP9l6JJIss=;
 b=mUyVxoovKJdUunDdfGiGqx6qgr9buKMTgcHUjJ33IogG/w2E1sOIiFlqQJkxv0yTDQNHxmPnraQVtdXlHOzX57gbhlCsVRKrS0/a2k0q43BG6CJvoZPHDZg9IDd3Fho+ahdpATHRGp+J551qZKwa0bB3Pk2DH7kFVZK5FqgLo+JzGgn8G83DmZvLe9wna3uigXSEH4p43MiZrJLxPLAq06S0r2R/Y9hrMgKRMwN45zuMF4ZrD/A1xRDMpPOrYK16KQW1W5atpkKyIa1Sa0PEoL4Ba3FR09voVvBIdQXp9qA0NkKA/q9Ag9WzicGu+xl5WU/3pC/KuQiqViokFs7/zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8d8g0SYKmOr4v166dBx5Whp4pPSDxdmFAdP9l6JJIss=;
 b=FfQ4jwzZbLI8w/3uu0UYk8h87GmGeWnjz9oKs5HavTz8DTW1yVbx5q2W/daFvqucP8SBY25d87JDgc36G3h8kgz6eb3XdiRjSegIqm9UGN37N3E3PRttZjQa/pl5PPEY1F3xXtMahsCzHwiJO8UtfmZqytimpwEm+cMSbXtlHACLt0jCeoEFrLy/Qjgq1aoDniXsZd9HfFobnBYWDH/jt4IY9uk9YBh/erSz+WjVJTx+mN0IJ0FuUlL19W3gxjAcHrAFV6gf+yJIDXjhB/PatUw1xsiYg3tKXqvYZr69l5VYNL5cDeRX+tkGhv83tVglFc6FK/ZasvsBRin1VQv68g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by GVXPR04MB9736.eurprd04.prod.outlook.com (2603:10a6:150:11c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Wed, 9 Jul
 2025 06:39:34 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%5]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 06:39:34 +0000
Date: Wed, 9 Jul 2025 15:49:40 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 3/5] remoteproc: imx_rproc: Add support for i.MX95
Message-ID: <20250709074940.GA14535@nxa18884-linux>
References: <20250625-imx95-rproc-1-v3-0-699031f5926d@nxp.com>
 <20250625-imx95-rproc-1-v3-3-699031f5926d@nxp.com>
 <aG1J2_nK-LkLQVRj@p14s>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aG1J2_nK-LkLQVRj@p14s>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: MA0PR01CA0018.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::18) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|GVXPR04MB9736:EE_
X-MS-Office365-Filtering-Correlation-Id: de55fc6c-45e4-4a03-9eae-08ddbeb35e04
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|19092799006|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bkTqu2QBkCCY+shdRyeWCFv/uWa0hDsjZqB2zi1335hGxXGxYaEgJOQVrub9?=
 =?us-ascii?Q?Xi6qqi4459Mot2NXTgo4FgEj8faAHc3MpPRc8I+VvT/ey14szl/NHV/kQgIu?=
 =?us-ascii?Q?3iCsfKDcrPE4A7WEbu5ifG4qulo0umNLQ5s2S1iIjoyDw66X3q11tInZ/W3K?=
 =?us-ascii?Q?50t+3RCtv/AiVpxgO8MBsyH9SfD0x66LRrkQQvWgEnQVu1jFHVRSFfD3D8kY?=
 =?us-ascii?Q?CJqgaofCOKv3xC11SPsxTpz1GzzZAjqFpFoVjiW6K/Z2It4J+H1bjlD8N/CV?=
 =?us-ascii?Q?5tT8DZSAuVCZiYej9MKCrS1UupZ6WOleUWaKmZd+Hu64WKdG/GAhdjnQLNm5?=
 =?us-ascii?Q?JJCtLzKFIUg6Lv0RhILWU/SDmMdI8MddtLpk+hbrHFwDYGl6ApfqmkY8pBKf?=
 =?us-ascii?Q?5O39r9OICY020MKgfR8uDaUyxcyLdIp4+lt1COmdEjGvjNLqsxvFFULUg37F?=
 =?us-ascii?Q?9DnSaCOu6l5wcWlzf2Cw+Zui+C0KGyrp/sdFCcZvvCdx9PjeKHSkSelYEl41?=
 =?us-ascii?Q?JzMQWyCbd7zpECmZIdTioM7WEhRU+OEQGyfX+gscUXEF+Isku07mtKB32G7T?=
 =?us-ascii?Q?LrQ9gewPX/xHhFGd/In1IQG4uqip8fpnNIrGGJwcq4kBBN4MiQc3ocz3TqjW?=
 =?us-ascii?Q?pzld2Qo7sBAfGyooZPIYk9bB/70ORKXCt2fsQFtmlCj2KjmRjhltnvhfhjSu?=
 =?us-ascii?Q?MUdy1ypIAzjjg6K+zWj9+TCVyTIYiIJLeVhCqLr5N3scNnbiu8qYNGRrSCyW?=
 =?us-ascii?Q?9K/fyK331zSgevAhV3WLtnVYIvpkoymABviKUdp1tStUZz3vDngjtvsm9ntl?=
 =?us-ascii?Q?ZdoxOQwsYynz+W59A4iCuqwiDQe2aKxtdGHt5Chl0WAonfowZwfUDaAOtxH1?=
 =?us-ascii?Q?H8748IVx5gNg3KKURgjqpShBTcP8zKcFjXP4aCH6cOW6JdxQQcqEbuWnFNlK?=
 =?us-ascii?Q?8emEIaSFS5rxhd9R/BwesCv28Fr17vrulMaxbFe1Dcg20wX28v7sT1hXVwVF?=
 =?us-ascii?Q?fFIUtBgNuKpWVUHT2/nI6/HDzcyCeHd/jbUbxIsdCVubCa4iFYAWtEZl2+Hp?=
 =?us-ascii?Q?wLdZ/bj4vCNX6oaL068aAElX/zc0rRvnk5XVP2Lm3C3QF18uFjnB8ulMIKhm?=
 =?us-ascii?Q?744jZd+V+9sc5uq9+9uTWle/BxhWCNGJJE1T6R3oRvfox63cnY6n7QTr9MVx?=
 =?us-ascii?Q?FKke1LaLPX+MOBIORyMF54ooPNXTp1XC0CjXbfRa/qzB8LcqPcnHrZiS/gHB?=
 =?us-ascii?Q?wcb3IyLAgAvKS4fA+YuQ084cOuOAnQTynCFJHkogQLrDXu+gjhmVxON22BQ0?=
 =?us-ascii?Q?8WmS8/7YoSQcW+3/U6t95PKIdaXUsYDqeQ2JgQ+xW8acQAkO4A/S2ByQc0Dw?=
 =?us-ascii?Q?8R1qP9hQdURLWAhUCuUsDeNfp7dzdrPa4PovKEA3dd3WI2nbQmLsJy7VIrsD?=
 =?us-ascii?Q?r8Sp0Xdo/1Imp8FdfcoeXZF1P1ZKfB1Qi2DHA5zUaynmQijtG8uOsA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(19092799006)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eVUyc3G8p8hGUoHpJV5Xw1xE5lAj6NYpzZpJ88hzgaqfpeAoiRALa/XcR6UP?=
 =?us-ascii?Q?oZfLem/Coxvaqh3eACUcw1agJxg6VlhugqrD6wAECZl1CgEEo3WLOOl1e/VB?=
 =?us-ascii?Q?THllu0FTsl3wZWa1QnY75sRNSM86aTkbcCxjL2DBVTdI07ks4ImjhiAK8fmd?=
 =?us-ascii?Q?Tck2/JniFoKu9UJmoec9QAaHKBokgfXLMaM8SjZ0BS4WNxl5fY80FCCxcufL?=
 =?us-ascii?Q?4oEoKenaEnCk+UKrSHtDtUcbCAaj8w3rc/oK4CggGcy1VPRyJ92Q6zCr+emC?=
 =?us-ascii?Q?yB3NkxJQRAeInPayU9TquE3L2/eCdAKBFMGCbk8fktgbyB/gC1aavT72WfA9?=
 =?us-ascii?Q?90IFy/9daBEuvmOIrMbj5BN6m1fUAolWexo1i4AMcP6Elr7hEOFX/XC32LQ8?=
 =?us-ascii?Q?ISinZw7tqTUw1/2KcWgKJ7H3tvpvKDo+gkZy2YT3z4eSErKJ9Ws7FcgDwYK2?=
 =?us-ascii?Q?j0J83QjhFky3hkh1kziHwbhPzJsXJGE1QO17uKSYl/lRue5yi1ivG1QyGbx3?=
 =?us-ascii?Q?3djarnb9LoFuNJMo29NwF0z5RTg+N2kDnerjgiPEiCTa1e9BSeYF2BPyFwSB?=
 =?us-ascii?Q?84rqXx7OnwnhTZ10FLeWYUHbWJJt+BHY3D43qRkBkOIh/EXo1/rJvO3akPMk?=
 =?us-ascii?Q?7ibOAPlzXB+IRDJahmWV911HAS61GBKtFTceAq84LpRQKQoR9rLDuVO7zWcn?=
 =?us-ascii?Q?j47+GC8NVetJQOxkqcBCjQrKNW50S2DajbkD9qVdZGrOUwayIAjsXKQJDQk+?=
 =?us-ascii?Q?+5M7Xbfs7m82pOqrKmvbWL1uh+Q3FNa1TVrJ6l6UpHd4JyrDHyAC5fXqhr6m?=
 =?us-ascii?Q?aPBNTgiVSckKkOmwE6vn2qZVFLmb6I6D4ppfb6b9cI6v9jRtuuFhLg+rM6mX?=
 =?us-ascii?Q?O3Mv/KiGCmS6qncZZE/kO7ThYEJ9HpB78Xr1hIg3tSHw368kNST9xdJwG8zi?=
 =?us-ascii?Q?C5ghVmIYz+8Ympfe+JMhG9emactwQsNYpZv+9mDGxik7HWQeqI48/8gEbnYp?=
 =?us-ascii?Q?DeXXJLGdSA2/CxUi9yGOa/4FRuSOwviCU92NC+V+Hs1ZoVsOgoHKoouCBIWk?=
 =?us-ascii?Q?UIIuz0dH2lxJ7yWKDyQf9JZf8If78d7pR/x4YLNPhSRgxZdhtV9kwWEGp93p?=
 =?us-ascii?Q?WcFk0Ok+o7gLxlKtnxs4MXxm3byGBXU8ex45J1t/3vFZL6uOd720P1pR2CU+?=
 =?us-ascii?Q?U+7H22FHUi4Va/3mSYiQRfJAIOnCVRzgfk6Vs8pH01z7lHomVfmj1UfoEX8k?=
 =?us-ascii?Q?ljH7ji74AcwsfBzhVDQrN3iH5PQY19iyKLaGWuk/DWvgFr+ANU8KYIv2tCY4?=
 =?us-ascii?Q?2H922rBKizEcmOLmQmtXEmyQa0VX0ChT03D2ice0gCEpUorxbpZGaxuQdXW7?=
 =?us-ascii?Q?zoJkxjrgRWKS0t3UUmVi2I/vuDxVdLFXu1kKyqATAess8b3pvCALwaq0lNT7?=
 =?us-ascii?Q?40wBBdLMLqNGHubVGhgHe2vs/6PT8rXb46eAZ8Sack4ThTVazCNRNyjawEtg?=
 =?us-ascii?Q?q8asmkz1POBYT2M5a0/XzTnFDvQNSMXxOZq9RHTFQGfbkarIFL59qe5pZ/Lg?=
 =?us-ascii?Q?f9DDq4nSYgJPcaZzb7y9zzfvvF4P/wi4LqSfNyAI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de55fc6c-45e4-4a03-9eae-08ddbeb35e04
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 06:39:34.5709
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gqk4Gzk54ZCgyoC5rGMnFg0EY4dDSfi9qfDtyDMU79sfLIIRIln9bujWkkcWXGSInzjPAQlepE9QcbFFnY379A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9736

Hi Mathieu,

On Tue, Jul 08, 2025 at 10:39:55AM -0600, Mathieu Poirier wrote:
>On Wed, Jun 25, 2025 at 10:23:29AM +0800, Peng Fan (OSS) wrote:
>> From: Peng Fan <peng.fan@nxp.com>
>> 
>> Add imx_rproc_cfg_imx95_m7 and address(TCM and DDR) mapping.
>> Add i.MX95 of_device_id entry.
>> 
>> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> ---
>>  drivers/remoteproc/imx_rproc.c | 25 +++++++++++++++++++++++++
>>  1 file changed, 25 insertions(+)
>> 
>> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
>> index b1a117ca5e5795554b67eb7092db2a25fc7de13b..c226f78c84ad180c69804116d6cfcab19db6aaa5 100644
>> --- a/drivers/remoteproc/imx_rproc.c
>> +++ b/drivers/remoteproc/imx_rproc.c
>> @@ -73,6 +73,10 @@
>>  
>>  #define IMX_SC_IRQ_GROUP_REBOOTED	5
>>  
>> +/* Must align with System Manager Firmware */
>> +#define IMX95_M7_CPUID			1
>> +#define IMX95_M7_LMID			1
>
>Any reason those aren't set in the device tree?

Krzysztof rejected to introduce the IDs to devicetree.

From IRC:
"To me this makes no sense in current explanayton - you have 8 cores, but only
one can be put there, so what happens with the rest?
And I don't think we care about something like remote and local ID - it is
the same. CPUs have single number. So this looks like copy paste downstream
and thus solve it internally first"


In System Manager Firmware, CPUID is fixed and will not change.
LMID is also fixed as of now, we not expect customer to change LMID.

So with "fsl,imx95-m7", we could know the CPUID and LMID for M7, so 
it does not make sense to introduce new property saying "fsl,imx95-lmid"
and "fsl,imx95-cpuid". This should be the main concern that DT maintainers
reject to add properties for the IDs.

Thanks,
Peng

>
>Thanks,
>Mathieu
>
