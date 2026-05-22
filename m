Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013068.outbound.protection.outlook.com [40.107.159.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E413036A352;
	Fri, 22 May 2026 12:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779451697; cv=fail; b=fGg9o+kjlgQyjmooelNpDnTk2ycCJARaUObZD2KaOeZ7GTzSfc5DH4/0D+FnPZzH6/lGOeinUv3p52UmMb8IQHGUZapXOsNRtoCl3BC1C7dNjpz+qrCIBKjnDJlDS9GiTlZYxjafTyqa3tgBkyLemRy2IAzTLeuRkOnU3OQdhW8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779451697; c=relaxed/simple;
	bh=IuP2bx0RKneN23jCleusTfeNY7Na9eb1D2+j6KC40xs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XkSCAPUeFeWQpwj3DsrHOT0l6YmOjQLYiJCHIKBhZLe/zgaLzSrZoyhna4+9+2OPQkOK6kB1XkaOWuSr+J83B/DUbHaMQSz6mwuUmtL93bwnsrrYmUTP0l8tacHpViPhAqx30APFV5VvVN1lpOusvg0IRLwlIqYO3e3XWVsxHBY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vTV6ZZcT; arc=fail smtp.client-ip=40.107.159.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vTV6ZZcT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CvufNR6qJQpBYXgf50Tgsu3KlWEP51NwBrhAT/HRo+P1AgfD7Vs4Cxxkhp06UOUiuFftls3rcFwGHnU55gnC7iZCswHaqhUYh5UDGZyo2CUtTc2kSkG103kY1bbWLIbyDFpUBRz0x7hjMC+eQVRo8ZIonGig4Oi2NVFo8BU/Ok7Y/PJCM9R5OP1QzciwguSSx28paNYTlNckTjnM7E5qdAgTLGeQOyGknDupCN4XOJeDaRCKi3XCMNMbbC4mczWRQf7IJiSBl0w808UiR8eUBXeRskIKEQUAk4qKOiOtjkz8Ygx/8NosyuqNXQ93UWmlEyhQsfm9oEFGqubFPXucOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ArHg5DL4QmZN4SVDzU3xgqgjiQWUHENX/SyoOWnX/U=;
 b=fqOrbNzbU/jixsFM4TN8MYW5lV3BM+ZAWthQGhG0i4rg3edvZlLl6QCTxB9Pnr4VrbXttiayMOvo5oXfl8AwCC/haBg3TeOKlN/CCWdJOpWIkhkQ3ogKQyMtQU/WadLJNzoV4rDXM3Bsc6sH+FfDt/ja+chi//WTBcbLlxE8WPv9SS1qVL8xNN7hn7Yr0mw7MoECIQ6r8/BBUh1dNZOqSvAWw3IIeVOJrxhWXovxDwVsvLpvrj480Gm7X+u+zeLnrjd3N9gI0Dxn2M4SjfxIT19oO73R9GTknl8yUnYPN7SYDOwGu/B/vc6MyOfm3VQL9K3Re3sbf3IT3f0k//q+zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ArHg5DL4QmZN4SVDzU3xgqgjiQWUHENX/SyoOWnX/U=;
 b=vTV6ZZcTo2Ef6G2TD/3Ccvc+ekBjApdxfJf3B6yMIbK+hMhEgzDEWkVeicmIDqlOkfgmtzWpTlKGTaN9r1dj378D+i8clV6RxWHSnx4EXSFZLH1afnN+5at3L9HCwlnuiaXPJyJ38hpSqD2cbBRgVF39nooWlNohmQRsX1IBhZ1VrwYUcwi+NZNun2xzC/QIapveUGbuEGHa84uURImpY8pnWa00Wxqmv2rXXGfB+wyqMPKX5hJoczATHg6qwRvMGKfpoxk/v/0Bt9xN1N6vfC4jqPnOXWb5wL3wR+Lrccs6ZMDVaeLCmMtHYg/uvRNmUtBeij/sbP1U4NNhvANA2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by AM8PR04MB8004.eurprd04.prod.outlook.com (2603:10a6:20b:248::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 12:08:12 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%6]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 12:08:12 +0000
Message-ID: <8651e526-2f7e-4345-ae3d-6cbbdbfbf789@oss.nxp.com>
Date: Fri, 22 May 2026 15:11:26 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: freescale: add DT overlay for
 MX95-15x15-FRDM RPMSG usage
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260522111849.783-1-laurentiumihalcea111@gmail.com>
 <20260522111849.783-6-laurentiumihalcea111@gmail.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260522111849.783-6-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0294.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e7::15) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|AM8PR04MB8004:EE_
X-MS-Office365-Filtering-Correlation-Id: beb8a58e-4809-4144-922a-08deb7facb7c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|1800799024|366016|921020|6133799003|11063799006|4143699003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	TCUrIC4/lN8bnDol5BMKYwAxCCEanRQhEg/pKzL+ncPrV7ZhjFS9NzJJfAXwmm/xeTN+KMNXq0P4AFQYRT0rffftKGZ+aN0BwUBiEUiBpxifBwQIzuL+Rm3SAj1fB/S1vGQRNCUmDQP5YkRfT/vORCaUN4hSuBndGn5fWuq/3Eos7vs4iQATa5G+v7p2fjPXPy1qCJwSOYu76/QM221lwArndrd9KrAV6Mo4Vb2cNjqHp7d803BaaVUHcIVgHev+ZbHrS/6/OJ/K87NyjlZAet6B7r0uzexWH+1w+ZdV+QcuAzZw/yzMk4sa1a3Uudu2LH0m1tMvEuuR7lkjK81pXuVOO7wXxnhxSqXEizSoV/UcrWOIXWa/IuVo2sfxmsY6BdQW+Rff+K4DfXDopa158a4jjq/TErGBlPmXKxCvTv6vJaMQP1Mi+CNhtRxyYTv+aqLyjYzAAxD1phIXFMVLvX0YhMrVvvc+uILYSgfpz1EdlkIJY5cEnORfNMwlV4Mla9/tLURWXElJ7L22NYav6jk+IOYz0X58Prfhcp8l5IRH6HPdgEVPruWQcmFqYRpPe4mRNamNqwqEuFp1e++yRq4CAfcaOGSSYJA41HeDRR3kqSBQx0Gvip2KQDBKxM+839OmYsNjevrJv9RdBeg6Z2Bb9R66z4t3eTpcO5tv9i5t044JN8mIolhSdBYGaawK0tBW/HK5n/eKEzmSocw011yGGXiUlWjazTNWiO3MT1Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(1800799024)(366016)(921020)(6133799003)(11063799006)(4143699003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YjJnaEZWSVFDbU5PKyttbGx0TkhhMlIvbUhDQUVrMFdYelpPeFVMdTcyKzFj?=
 =?utf-8?B?TUplRXQ3UlhjWVprYUI0RFcxRUVHSVRreEtVOThQdDZJNXNSc0ZxcVN0MTlO?=
 =?utf-8?B?WUdUOU9ORXJ2OE1jZXIvVTJxLy9WaVNnb1NWbnFhdU1mYjVmWFhRT3pEZmp2?=
 =?utf-8?B?VEtQTitwdFJoMGk3VTh3QnE2MGJjNEJWNzRwK0Y1YmNncTFmSTN4YnNoNysv?=
 =?utf-8?B?b0NPakxsSHhoYzk0bXpaWkJrUGV4UVBoejUxZGVrSDlxQnh6dWhibVg2Lysy?=
 =?utf-8?B?YmFRRHo0bE15cDlvMFJSZzkxN2phQUlrc1VsNDY0bFZ0dmVNdC91b0IxbUc0?=
 =?utf-8?B?a3A1dVBhOXZvUVFYMUdpVzhkQmNGY3h5UE9ONXprUXV3WE1oZTNUVGtsNWlE?=
 =?utf-8?B?Z05yTWFCbzA0NytXeGtsejFaVWlkZUgvcDFhK29IeFVZdjNXRDNiYndxVDMx?=
 =?utf-8?B?Uk9KVTNnTlFzV1pNaGZZdWVjK3lBTFllaGpKQ1pXMEtaMjdRUTRacnpadm1O?=
 =?utf-8?B?SUwrNE4yenlLclJOLzRjb2lCeWpzSFc2S0J5NEYrRnY0Z205cVd2RU9DRVRs?=
 =?utf-8?B?dnN0ZmxUYkxXTE9SME1LdFI1YStDL0FCN1R2VUdHNHBnOWdqbkVFM3BVa0pK?=
 =?utf-8?B?RXRVa2tBVzAwUTlsalZSYmN3YXgwNUhWcWoyMyszazU4Sk16QUNLVWdGaWJ2?=
 =?utf-8?B?K2l3bmJlcEpXWVNmd3dGeTJkKzZBRDhwcjVITG03ajBKVm9NWmYrWkZ0MklS?=
 =?utf-8?B?L1NOVTI4NVBHTFM3K3lDKzB6bzZabnd5YUh2LzN5QXJHdExSMk84SXVFczJn?=
 =?utf-8?B?blI3eDdLcFAwN3J4bHBMcTVrNDNReFUwcEFJcWcwbEduYlpXZFpxSWhIS2Ro?=
 =?utf-8?B?OGZLZ2daZmtZenhOK1NuN3FUbVZSSiszdmxFOHJIaVFuN2tDWm12KytBUWxv?=
 =?utf-8?B?bW9lbHN4cGFodVc5anN0ZlQrTjNlbXF4V2dyMWk5M2pzTTB4WGpJUy8xalFL?=
 =?utf-8?B?cnJMc2pSQWQ2NEhLSVlVb05WL20wR21lK2w0NVU1OWk0amJBaHUxeitab1lR?=
 =?utf-8?B?SjZWRXVBOFcvOGVvLzErRHVQTjNhc0JKUjlST3lSODZudkd0cktqeCtwODZ6?=
 =?utf-8?B?cCs5OVJ2QktlSC9DcThPOFBCTExzOTR5S04zRVpENE5jemhhT2dyMlFkTkVI?=
 =?utf-8?B?eFVkdVE1a281U3RZcWF6a1pGZlh0TCtpQUhiOGpnNDMvNllYRTBidTRJeFF6?=
 =?utf-8?B?dHNzOVBvMGNmSUl0UXZabTlwOVkwS2J2amEybEJ5NUdkL1NHRVVsVHNGQUpu?=
 =?utf-8?B?UWlwZEFDZ3h5TUdMcDZ5TjBFSnRodEhTUk5zMkVtZGVqMjFETFdqQjNqMVBo?=
 =?utf-8?B?aGFyZDdpZmltaWNFMWwrU241RWk4QkxXaldTK1BqWUVnLzJ0M0dJdHJCRHR5?=
 =?utf-8?B?MzFLRi9kdEpJQlY0UytXWE1HQmZxYUwyM3NCcXQ0a1ZWS1ZoWWxyTEhIOHho?=
 =?utf-8?B?ME1iTzhwVXo5Tjd0R01wWFkrZXF5dWZpZzdMWHpiSXlBYmhGODJmR3hQTkZt?=
 =?utf-8?B?YitUdFBLaWZTNWZiR3I4U29lZ2VnSXNmMU1KRnNuRkVSUUYzdVY4cHF0QWZD?=
 =?utf-8?B?VHBKTW9uMm9FY2xiZzBKdzJXYmNUcFJnU09FZ1BlZFlBRVFXWHJxRE1jVTNZ?=
 =?utf-8?B?VTBOSVZuM01Da1JMOGphZHRNMGFLTnE3b1ZZb1J5cEprMDEwWnVnS285SjZQ?=
 =?utf-8?B?aWZXaWdtRzVCVXlxNDJneEx0OHdWOVdhQUJjZ2hTcUs1cFBMSlRHbDJrQm5K?=
 =?utf-8?B?aEV2bjA1OWhNZ2QyOEhKNHRrSWdEajFkMW1wazZZazNNTk5mTzdRbWZ1Z0wr?=
 =?utf-8?B?VUFmT2N3VHRaVU1MNW1wbDNqM0ZEb3Eyc2M5aWJvSXhQM2syRHlTemRieFR5?=
 =?utf-8?B?TEdDWmxldDNFc29vWnZ1STEzTFFickZsdk9nOUJFOFY1SDBxOFNUeXpIejJG?=
 =?utf-8?B?S1Jxb2lBc1cxMk1YRDJ5MjBPQmNxd3NDb2RFS1pWai8xRDNGRkFkMzNxTDdn?=
 =?utf-8?B?VkRTa1RoQ2dXVy9ZOG10VnFYYlpmRXpVYm5ucEdMMzNnNnlNR1MyNmdYWGxF?=
 =?utf-8?B?YktNV0QrMWtxS1lKUWFGc1VodWhzMW1kZGh2ZS8xMHYvRyttNnpscmIyRVMz?=
 =?utf-8?B?T1V2QVFRSWtaUjFwZHQxY0dIR3BEMEZZdWh5VTFjcXdaM0VhQUQ4OUdrT2pB?=
 =?utf-8?B?RDRTb2lSS2tzRDJUOVhVOWx3NXYyQ2pPVWVSa292MnBqNThabnZWVVRxQllX?=
 =?utf-8?B?bmJLWkg5aGg5TTFiTVdiNmdLNlh0TnQxVEM0WXJHNG1LRE9tYUpTUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: beb8a58e-4809-4144-922a-08deb7facb7c
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 12:08:11.9519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WkZ5cIHiI6lVkoDrFOw3TcvIeQ+TEJh2pqrUxTLRejDhNxsrRg66VA3GyCGZ0+HPheRQoCcZZxaqEYAyoVIY6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8004

On 5/22/26 14:18, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> Add RPMSG DT overlay for the MX95-15x15-FRDM board. This overlay is meant
> to be used with the mx95evkrpmsg system manager configuration for
> remoteproc and audio over rpmsg-usecases.
> 
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile        |  3 +
>  .../dts/freescale/imx95-15x15-frdm-rpmsg.dtso | 65 +++++++++++++++++++
>  2 files changed, 68 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso
> 
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 513f61eb27b8..a30a99e42426 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -521,6 +521,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx943-evk-pcie0-ep.dtb imx943-evk-pcie1-ep.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-ab2.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-frdm.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-frdm-rpmsg.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev.dtb
> @@ -539,6 +540,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-mallow.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-yavia.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-zinnia.dtb
>  
> +imx95-15x15-frdm-rpmsg-dtbs = imx95-15x15-frdm.dtb imx95-15x15-frdm-rpmsg.dtbo
> +
>  imx95-15x15-evk-pcie-dtbs += imx95-15x15-evk.dtb imx-m2-pcie.dtbo
>  dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie.dtb
>  
> diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso
> new file mode 100644
> index 000000000000..b39444dde66e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso
> @@ -0,0 +1,65 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2026 NXP
> + *
> + * This DT overlay is meant to be used alongside the mx95evkrpmsg SM
> + * configuration for remoteproc and audio over rpmsg.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&{/} {
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +
> +		vdev0vring0: memory@88000000 {
> +			reg = <0 0x88000000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		vdev0vring1: memory@88008000 {
> +			reg = <0 0x88008000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		vdev0buffer: memory@88020000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0 0x88020000 0 0x100000>;
> +			no-map;
> +		};
> +
> +		rsc_table: memory@88220000 {
> +			reg = <0 0x88220000 0 0x1000>;
> +			no-map;
> +		};
> +	};
> +
> +	sound-micfil {
> +		status = "disabled";
> +	};
> +};
> +
> +&cm7 {
> +	memory-region = <&vdev0buffer>, <&vdev0vring0>,
> +			<&vdev0vring1>, <&rsc_table>;
> +	memory-region-names = "vdev0buffer", "vdev0vring0",
> +			      "vdev0vring1", "rsc-table";
> +	status = "okay";
> +};
> +
> +&edma1 {
> +	/* reserved for M7 */
> +	dma-channel-mask = <0x40>;
> +};
> +
> +&edma2 {
> +	/* reserved for M7 and V2X */
> +	dma-channel-mask = <0xf>;
> +};
> +
> +&micfil {
> +	/* reserved for M7 */
> +	status = "disabled";
> +};

For this usecase usually status needs to be set to "reserved".

Otherwise, 

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>




