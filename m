Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010025.outbound.protection.outlook.com [52.101.84.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2707E33D501;
	Fri, 20 Mar 2026 09:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773998177; cv=fail; b=q6eGMPtgyUX4uAOICxRgjuTQGKucaflt0vJNqHbo3GAsDOCM3RmuodnDtw70hxEkbmT0+ttUvfrKAD7iKsnUNJW/OdzdhGpfTqWqhvb7K4GrJvPLZxM2ERSg0Cg+Pe9kQ7bKX5cLZ9DbTCc5j6q1t768H/Eu+KRNifik4sUDDHM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773998177; c=relaxed/simple;
	bh=vQZKjEQMQq+aSgwrln06Tm1oaEz2ZSoUGlfWy7VhMec=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gEihI0rWvRsYy5WbDODJCAwLw04imQqjLVXWv+fvjARBCsVqVSl4CcHeZW2SBGRxgccdLk2AUfBgghx0Za844a9fpebOPBIauVV/ZS0nDLrjA2krg1mYm/Cfg2MJr+hzkA58M2ALCQ6nEF9hDABhYjIV+wSo2EHgP/E379PAJrY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=htdGtCtz; arc=fail smtp.client-ip=52.101.84.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="htdGtCtz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fi0YXjn2NJJi6tV1hvwiuTfzqiWVHNYwBoOpsRPQO9dsYGX53Dx/XjL5bwWnTfJ1O+zKhe9m1T7x/ZS/EBCsJz1MZEc6OCWQDPfKQ3IAoZXhz2T2WYuHVHlUjHc9jp1G7hmmGXUJ19ai8yuQodxmViehZ96AURenspywucEiQZkR23fFWjHxhQ5lURxmDIR9BLjg5aysj3dWe2n/iwNaqwTiA6efJGGoWaEtrRKOV9hM3D1Q+xzctIZLFPLY6CMyjkjJPf68mR73LaqRUTWLV1ZdgDeXGqk1rBWKNLUT//HLW5W08XV6DXMLmYAI3hyBxg3Jzxaz67TTf66Yfm3W0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FXuauTC/G3kPnbbZEfgc7s5YpTpz/iP+l3gSYOtKaM8=;
 b=pPVDvvGflfFxQkQC3p1ZUhXdrcqHNEsi31ISzaeZ1KvYYI7Uvcs6rZhePI0+2BmwMI/7o+uSVf3S//Coa3n6eCMhrDbRTfE12MuyVKNurvzVhL5sz5aOiRKCVo/CObjaZDwq7YSzyeXafODvOUxYYUW1nTefKt+uOtQ9SWGzJgqjg4TgOYKZTdPFnK148Yu/ZbNsx+EE5dXUYVhxW8xZ6pMku9XWzwPe8B7MyQ191Vz4OXDl2DTxMWta29L056tvueBzmvMybRJ9+ALOHqcWnTFbWdyjKsCblieKIUHGs3oMGWJPPYGo+BCqVGPSl8bGIihujv9m0poHvi8hG8+2cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FXuauTC/G3kPnbbZEfgc7s5YpTpz/iP+l3gSYOtKaM8=;
 b=htdGtCtz1oChggfCVMpLXiBMdTBykNo+SW8YoOxuDAAk+J8iKRluNUXuvUQFkDFVHDJr3mwikwkLtFaLf7CVvZly1AisVLOKU2TdKXE/y5cBihBur5DhgDxM5UOOfbNkFT0C/RZ8ATEnROF9wN4T3OnKefOb+xepf8m9NV/LVgDrCYLGwNnh9yEy1H2UAejzrei1W7pJFcVmFM4hPd7vC/ODS9XaC2D/xnThAJNcE0WfGOOBf2h6CPH4d5jt28voW7RnGg+QpqAuStM3W5edTX9YRwuwtAVsDgBxzSXWMgXkFQAU/EKzFrxD0Wp+AMlzvIBS5kr9vawI3cRMbvC2hw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by GVXPR04MB10756.eurprd04.prod.outlook.com (2603:10a6:150:226::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Fri, 20 Mar
 2026 09:16:01 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%6]) with mapi id 15.20.9723.018; Fri, 20 Mar 2026
 09:16:08 +0000
Message-ID: <b5e05fe6-97c4-40cd-b7cc-b417d8717aec@oss.nxp.com>
Date: Fri, 20 Mar 2026 11:19:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Add i.MX94 remoteproc support and reset vector
 handling improvements
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
References: <20260312-imx943-rproc-v1-0-3e66596592a8@nxp.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260312-imx943-rproc-v1-0-3e66596592a8@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM8P190CA0011.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::16) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|GVXPR04MB10756:EE_
X-MS-Office365-Filtering-Correlation-Id: b2aa2230-e637-4d66-c0b8-08de8661522f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|921020|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	SCI71QGRovmyyN9OyacI4gLBledvTiLaPR4Ejlb986S+ZqQMmyUIOTGNcCRxXyG7Os2wcqjFPogiGjHNn5hDKdO8HhEEgNx9RzzxHKndnmVZE7/oadK5eYEjQGDNRZ/VoQOsJSNJ+cFdYr0J4Ho8p5fsC6pBARVMTVP+pT73NQ01k439BYUegvLoNOyE2RkGBC6SmM6sjJyFjw0/9EpeN5hhSejdzCM+uXMD96CLI3Dc3p5VyUJFuN0ORgcy9c+pFi9VT6zwRuFKCD6EKKCWKGpM0r5Eg4JH2WbUJq7C5e3SVEm66fJAIWYwUhHSV7hwFwi0wepc6/wK7vW3TVZAczxy+0pnbQx77BFGsrP981adNmGJ/Uv7V47gutjeLMtMoy+s0VgqByY0UKSgYUSZCngq+LIdf/A+e3LAlOmnPwWz6t09W//SWDRQVKWaMYo9HuOkyVOQqqd5z6zp2uLmKuRvlD924NVR+98FZmps3jumA63nwO/2HK/lW2Ya8r+x11ZAE/YAcYJgM2Mh1OY8WY5aiD3RdRpmOp6tw1WaXP1KDPT29DHL4EZnlnNZ/UVePhFTKPxBavyNQYQe+SWwruHJEpn9FUIUjjxmzbSHhEof5rCGaCYuMVocdurXnNzb4RkSWtjUwCofB7B81i8/ya3FIuNUCcP47pRWiGeMHrIE7nXm+a6T0fJyLduBrjTMBxdv/OmOKyQgEvCInr4/07nSUq6dLJ3Tmpc1i8QFDJ5af0hTbGKt2mXfeambejRiaFpAdfqrQQmZNAikdgndpw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(921020)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2RQRjBGMFZ2ZTdnOWtNeG1samlia1Awb3hBdTc4N0NOUmxESVZIVjdBREMy?=
 =?utf-8?B?WldHNUt6YmwvYUVnejlGWDUrenRXbmg3QWR3WlJOK1g1TlhTdFZKSDA2aUJJ?=
 =?utf-8?B?bEczTit2MlNyVVp6RlVQdVNNTElsc05RdjB4cEVYdTFJN25ydDJVY2s0N2JR?=
 =?utf-8?B?dFdyS1RqWlFpOEw4aHVuUFJjRHMxNmxCc0FnU2h3SHVrbEFuTDZkejlZNTIr?=
 =?utf-8?B?M0J0WWlDdkZFTlIvekQwdmJURTZPOTdMV2RoeXJrSDI1SnR4WDBITk1oeGgx?=
 =?utf-8?B?UExhenVDamFhMVBpN0VTNWVmWTA0UXJoWjBPR1dVZisvWmEvd0dpbWxBUWNZ?=
 =?utf-8?B?K3B2c0lSMTFUcERkUEZTVGJIaWlodmtxcDVwTXd5U3hmUGhyb3JRUWJla2Rq?=
 =?utf-8?B?RE82eXp2ZzdENWw5VnFHZFozU21ob1NkOTg1TWswY25VeTZITTRwZEk3anVT?=
 =?utf-8?B?cUlwTUVoVGhZRExVSE1oWEdUbG9MZzN5R1hrdmVrTHpUY1Bsd2QwV2FJSmJl?=
 =?utf-8?B?K2tjb3l5OGhlcnY1Rk40dFpnWXVDS21PdHNLbS9QcFN3RkNPSmVydWZ5MEJP?=
 =?utf-8?B?ZnhPaVRIcW45dGF3UzJNZDJxaEx6UGxJZUdPYVRDQkFqREUyV2ZsV0xLcnY1?=
 =?utf-8?B?Y3RDaThlNjltTVVKWTVhVE1BZVljWlpmMHhTQnljK016STdrQVJpb3BUNFBL?=
 =?utf-8?B?VjlodWlZcFRBMTBFQUhXNFhucG5tWDVxa1BZM2pMTURWZ3l1OG1Ha0xXQ2ww?=
 =?utf-8?B?K2Y0OFZCbHg5TDRXczBrS3BPVnFXMGlkZTUzMG1jeXY1RmlRU2gxMGFXY1cw?=
 =?utf-8?B?K0hnTjRQOXpGRlZ4MGZ4MnRDREg0YnZ4RWNHeUpCY0Y5cHlyQVErbjBRYjFz?=
 =?utf-8?B?cHVWeVV6dDRVeEtxcXY5SWl3UU1DVVM5c2tWeTQxNytneGI1cXpKb1NVRCtN?=
 =?utf-8?B?aThPVHpnUVZMSHB1UVpic1dBVWYzZFdqcDhua3huZW1rR1RUSEdrOEFXcGdm?=
 =?utf-8?B?RjB6Rnh6VnJaVTdhNHRlRWFGd3Jpb01TSkhTOGUvY3ZRbkxQajdTdDlib3lH?=
 =?utf-8?B?ZXhDZ015a1dER0MwUHRZNStzL2dUN3Z5RG1UZ2RjM1pVZ1YySlVHbmFpZEhO?=
 =?utf-8?B?blhNNDBOQTlSZGkvMXliclJLbkNpeVBIaG13QUptNVg0YkIvRHRxd2plckRt?=
 =?utf-8?B?dzV1QVdVWFhDTm9zWlNvbkNKcXVIeTdzZVN1NjBMczhINS96VHZjTWYvZ0ty?=
 =?utf-8?B?cWVDUDNRVWNHbm9yZktCTDdYMU94aWNTTlJJRTVnL1NVVUZxaXhFTm5nbENV?=
 =?utf-8?B?N2VicVVkVmdTZlJyaGJDQ0FXN3M1RjgvemwzWkNqeExOMDJxQmpRS3VqUzRr?=
 =?utf-8?B?eUlHM05UYlNYZ1cwL3VuWEdPRkVMNitDUHc0dTdVcWxoN2Iyc3FtWWkzOXIz?=
 =?utf-8?B?cTl2Y2Z5dmwxTnZsTDk5UEF5YTQ4WGx4aWsvWk90Qko3NitDRDMycVJQZTE5?=
 =?utf-8?B?VEdJVWZhUDVEMHNZMHFwZVU0Um5rMVZPaHo1SDlkandUdW0zN2RtVWtxZXhB?=
 =?utf-8?B?clZUeFMzZlIyQW1WSGhNRzB6QkZjd1BRU3VjcFBoYVV4alg2bE5nTGJYbEVs?=
 =?utf-8?B?aU5Kbkt5cG5DQWV5a2E4YzBMaWF2Wk0xeWpoOTJyVmxQa0p0U2xpUGtGUFNZ?=
 =?utf-8?B?amo2UWtwN2VTRlQvL2svWU0xT0dTb2ZSVktaRU53R1VYWGVqM0RDOCtrUVBz?=
 =?utf-8?B?b0s2VDJpb1dWZVREbWh4TTJEeGp5RFB0ekRKdTRxUXZNUDBLU0Zsa1E2ajZB?=
 =?utf-8?B?ZTNnSitDSjlBYXB1WjkweDR6MG1Ud3RCRUlZWVVUSlppOXJoK1JscjVzQ0li?=
 =?utf-8?B?cHl5RmZBeU1iK1E2Q2oyUEpuRG9McERTM2xFVm0vMTFReGZMbStUNTl6QnBV?=
 =?utf-8?B?bzYvZmlrN0tES2JVVnJnVkMvWWFOL1JjYUd4YTZpWG5DOElQTXFHSlBaUHN3?=
 =?utf-8?B?RGxQN0NnTXN2eVlYaVZHZnNMWTZmQUJQa2xYZVp2K0xDRTlTMmJTNXdwb2Zw?=
 =?utf-8?B?N1JHUUQ0TFUxQkZXZTMzbW5ZZkR3YSs2ZEROd1puY3kvMCtuL3JuNGhYNVh3?=
 =?utf-8?B?aStiZDFQKzQ3OVlnLzJFTk94N3ljeWdSL2JCbENJb21FWEJQeHUzSzhTOXhi?=
 =?utf-8?B?UmRaL3lwNkJzcWFVbE5FVEhxd3V2eG9pd0pObDZmV1lCSldMY3F5YWkzL1lv?=
 =?utf-8?B?UWh1NWJJV211REtQR0hvbUoyL1hYV0JiOWMrREVFdzZLZFlKT0JFMTdGUUVE?=
 =?utf-8?B?LzlyTmtIcXdlWWp6SDJHMjgzVXRFUnRydktPaVh2MEY4RmxlOEdPZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2aa2230-e637-4d66-c0b8-08de8661522f
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 09:16:08.4125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ec4r3WYy68mqbZU17fUc5CbB9mgVFVJcYqtoKXBjPUgORE7uNZ+o5X6J19K2iY6G4uHisluxWjx2MPbgv9hA7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10756

On 3/12/26 14:36, Peng Fan (OSS) wrote:
> This series adds remoteproc support for the i.MX94 family, including the
> CM70, CM71, and CM33S cores, and introduces a new device‑tree property to
> correctly derive the hardware reset vector for Cortex‑M processors whose
> ELF entry point does not directly correspond to the actual reset address.
>
> Background:
> Cortex‑M processors fetch their initial SP and PC from a fixed reset vector
> table. While ELF images embed the entry point (e_entry), this value is
> not always aligned to the hardware reset address. On platforms such as
> i.MX94 CM33S, masking is required to compute the correct reset vector
> address before programming the SoC reset registers.

What happens if the reset vector is at 0 and the e_entry point is at 0x800...?

In this case masking will no longer work! Can we implement a generic approach?


>
> Similarly, on i.MX95, the existing implementation always programs a reset
> vector of 0x0, which only works when executing entirely from TCM. When
> firmware is loaded into DDR, the driver must pass the correct reset vector
> to the SM CPU/LMM interfaces.
>
> This series addresses these issues and provides the necessary DT bindings
> and driver support.
>
> Summary of patches:
> [1]dt-bindings: remoteproc: imx-rproc: Introduce fsl,reset-vector-mask
> Adds a new DT property allowing SoCs to specify a mask for deriving the
> hardware reset vector from the ELF entry point.
>
> [2]dt-bindings: remoteproc: imx-rproc: Support i.MX9[4,52]
> Adds compatible strings for i.MX94 CM70, CM71, and CM33S processors.
>
> [3]remoteproc: imx_rproc: Pass bootaddr to SM CPU/LMM reset vector
> Ensures the correct reset vector is passed to SM APIs by introducing a
> driver‑level helper (imx_rproc_get_boot_addr()) that applies the
> reset‑vector mask.
>
> [4]remoteproc: imx_rproc: Add support for i.MX94 remoteproc
> Adds address translation tables and configuration data for CM70, CM71,
> and CM33S, enabling full remoteproc operation on i.MX94.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Peng Fan (4):
>       dt-bindings: remoteproc: imx-rproc: Introduce fsl,reset-vector-mask
>       dt-bindings: remoteproc: imx-rproc: Support i.MX94
>       remoteproc: imx_rproc: Pass bootaddr to SM CPU/LMM reset vector
>       remoteproc: imx_rproc: Add support for i.MX94
>
>  .../bindings/remoteproc/fsl,imx-rproc.yaml         |  9 +++
>  drivers/remoteproc/imx_rproc.c                     | 85 +++++++++++++++++++++-
>  2 files changed, 91 insertions(+), 3 deletions(-)
> ---
> base-commit: 7109a2155340cc7b21f27e832ece6df03592f2e8
> change-id: 20260311-imx943-rproc-2050e00b65f7
>
> Best regards,


