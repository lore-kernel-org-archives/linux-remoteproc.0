Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011038.outbound.protection.outlook.com [52.101.70.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABB32F3635;
	Wed, 26 Nov 2025 02:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764125861; cv=fail; b=A6q78dAbuullLqcXXcs7lLdvuN3/Qb2MIX8/qUlHLBUjyzokTZy9/w2M0sp2dc+Ke4qyfjfBnVdnIBCZxH6dOXkG/NV+GqzW3wBj6DH72Ao/2+z9mtt2AeQXuFsiAnbaaMWEA08PNG3BBBb16ButOp0UkcLEybnVlQRTaMZvuCU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764125861; c=relaxed/simple;
	bh=8cLF1/EfDy79S7wxPX+ki4ybnFUVzx5GnCTnOJnEr7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DLt9ex7liqCOgdqWreEdiA3uFXoV4/zNPFkr7S/5LwRN6t4ziupRONHxWYcSCo4+CdjvJBpXEt+svjXjLFCDaNVK8nVumtzEbCh2NYW4/RXSP/0pfwKLDJvAVTbstbv5l18K1EbdWcTKa2xydJxoJujWBi7JU/kjMPYDAmc4fAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=LlVFJJ7+; arc=fail smtp.client-ip=52.101.70.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="LlVFJJ7+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CMYHNNBVo9OHjnp2j40mZ2p6TO2fNRRVgXqpMq30V3YCDSYtArf+9npLN0t/NVK7XIOV1+X1/DkNTp5TrpsdoMQ+fPRlP+4yBeBsAgKVpdXPjqZg/vLozIM2BffWBhf6m4CJw2VpVqGNtaZ4RecZj7EdMHYCVvOjgjHf+9wSJ5kXAaUDeMMEsid/TgVmphOII1hu7Jhqkmr/i4gKTl/YzW23359c8XqYVk0zma7+XYGOfE72NH4UcuFVyNZR++U+FbiRB4R9eDIjcsjFpntYK5CZYIFJS1vritoElRoWtg8MWcSjsrIaQ2dRJ5RCI2en6ry2jSrJk/+Q/zFWYHU/8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+q5WaB0+6MDy/08YGtt7+wgsYiTS56YB+WpuE95ELm0=;
 b=SUfckBlMjBJVXo7SOecfVN/E4lMGG3S2bm9L+LZlLBLFerRu38xUcrUWwC7bXzgJj9+c+4fpW0vsu5wxwhDL/0BoDRYXPsVEcwO+nqVXZVbfqGvf4BG8xmzhIMszwQozsu3QBLW8vB70C4mkUX41DHNDNmBr51tjQ3tyhAUm2G2ei5Iel4qmRbLmp1i7LTFV9vc0iBg9CWZBN1q+JgoFcPnMVKesoXcgG9jNnmgtVlIgoQteGeCR3CQXpZXEWiKlC+G8QFh5Vp6gLMzyuiV9wQ5CVlY1Y21mEmqxycdo0WRLxS0T38wO1DKMR+2K1Ham3jN2mbIETpxmSzG78caKcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+q5WaB0+6MDy/08YGtt7+wgsYiTS56YB+WpuE95ELm0=;
 b=LlVFJJ7+cVxs717Da603QVx4u4uz9Pp/jnH60Wex9shndQs6wjVKr/YkOOzfT1m7mmyhWU3+CyWFUFPxkS0Q2PViHatbMZ1DQ8P9D1qY3TbH3xhmKkAZMt2/48neglLjcyvctH1mFcCkWSSnV0Sljnc7eOK50VOR31K/wdQvlqfUr5OV+RqjYvxvh13RERD3az+qowL6qxdeeygMgrmryLWhrVmpgywrbQjudAPpLCQK2EP7+5GU940TpttFOHRYEu5V09bKVatdNrjUdRjAEwsOSEmCJAxVWZ3Dec/GdgTBBFCDvLaFu7iK1k3a8ceEoj+tQ9UjMMq2ntzipY8LdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB10405.eurprd04.prod.outlook.com (2603:10a6:150:1d8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 26 Nov
 2025 02:56:23 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 02:56:23 +0000
Date: Wed, 26 Nov 2025 10:57:15 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Frank Li <Frank.li@nxp.com>
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
Subject: Re: [PATCH v3 4/5] remoteproc: imx_rproc: Add support for System
 Manager API
Message-ID: <aSZsixcVpSeVfwQp@shlinux89>
References: <20251122-imx95-rproc-2025-11-20-v3-0-9ae6ee619a78@nxp.com>
 <20251122-imx95-rproc-2025-11-20-v3-4-9ae6ee619a78@nxp.com>
 <aSSVoOi3VIn7LefK@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSSVoOi3VIn7LefK@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: SI2P153CA0035.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::14) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GVXPR04MB10405:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cd2fd37-46f9-422e-48b7-08de2c97618c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|19092799006|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sFv5C+YYwuJNTQpG6UQcNq7JZMO1/Tkd95TFUCVPAMMWDMGc3/raXdqhxWVp?=
 =?us-ascii?Q?zO/iNyEhN5OwpR3Twl9heutuEDgaTt3QQwjMaFBwTf41997IwjUAj4RO+LAS?=
 =?us-ascii?Q?Nqig4HHNNDLDA/PKG/RHCCoRMX5ekpX5wM5nrgGPEhtM81kdhiviR5x3v9Je?=
 =?us-ascii?Q?ozVqcdyQJvkdBXPxsgAKzJ16UzS4T7lrZdopNyY4drTWI6bB2wIVIjy083er?=
 =?us-ascii?Q?CP+n6bTjUkqGYc3RXqQRxdGnZdeZL239Dom8YyL+GPuGx3eq6n2BNGHJMAwM?=
 =?us-ascii?Q?fNJpuf3g3cgGXjeQjtt3W9eT8ra5CQFTMb92WcvKxLn/wd8+wVugxiS830fn?=
 =?us-ascii?Q?1AyhRTRJeGec9tkDUwFfP/gYA/dHKqBsFEaKQQNylwlXZYXWjbnsazonNcHF?=
 =?us-ascii?Q?veidprHde/0QguG8jMdc5bU6ApxyMFN5gNO7/4etKCK25L50VDaHIgQy6UUP?=
 =?us-ascii?Q?+hY+lKA0Yzkl9+ObtGH6G1bKqoDOqlXjw/zWJUcYL0JF6P85CCmj10OJp4XW?=
 =?us-ascii?Q?zqXhZrzj1Fs0FtDmyJGg6F4DFAqAPPfbzqEemivd27E5gkdgEiMokXUBjzni?=
 =?us-ascii?Q?OAHkBoYLeNqTfndzSO1t98xYDTeR0ak0LyJ4EKzpmlOny+EwL3KICJCZqKqe?=
 =?us-ascii?Q?PZwF0eX6VyHPqKNCT1pf5NrGXN0JMCScQtJ2q8dthSi4c0YqjI14DgdNDPuR?=
 =?us-ascii?Q?Za3TxCqDTSulV5/eqN4Lu1PCw8SvGL6yATrNZLhi4eTDWcOxo+tufWsXIRho?=
 =?us-ascii?Q?jknTMZ648QL65dtbf3W+9HMMFHah0b2MQTkpMXlHqO2c4yvp0bKs9u0kk/qr?=
 =?us-ascii?Q?InOcSaoajN/PltLhR36hC+rMfJ0q1EkfIDrvAWFg+uM46/LO2SoQNj2M2VQU?=
 =?us-ascii?Q?nhB5gQBpwUZw5gRldf6iIudY+3+3gUYr/MFwAr9uEGBaimx646nyCj7cg/Zi?=
 =?us-ascii?Q?bWYdlePZcf3sffTPQ/ZaTStg/WVJFiSeS4vARofPzjoQf4zTEcAUB/2SzNOH?=
 =?us-ascii?Q?AWZ3nsJw0AnoVaP8ncjuUvnKS5EoYhGN2zE7Lvgj2DXtUeox/btvIEcKK7fm?=
 =?us-ascii?Q?vBCY9UFbie1XX5VoWnF8g2eS8xp7YtcGTEsY2zW9mua70HzOX7TyLZhZswhz?=
 =?us-ascii?Q?GxTZCNP+PlGjq7DYG0q7L2yqVXETis8oF4tj9ByBv/U7T8XzE9zNdry2adwP?=
 =?us-ascii?Q?brdDkhyAGMGWKS55qHywrc8QV7DYYPnsB67niBFbadb1/mw1BL4flOU3sTxJ?=
 =?us-ascii?Q?q3IrAycPFuLvaweUxhcocVrNymDBAA56U6uPwWFMGZ173EixateCkGBrjy4A?=
 =?us-ascii?Q?zUQF9NGrXPPZFXY/TvCtTg1kOsITVw39cdwmYLC5NkKss4swongGjAYjFwS7?=
 =?us-ascii?Q?sYPFoUrWSdz6OVV2p0xdg7Bkzx/J90AjfEGwk0CoozxMKblanRglM/3xLD2P?=
 =?us-ascii?Q?n5aVD7zXPtXZ48aACvZ3pRxC+GpTsWtAKl0xgChZEA4ggKKSkgv7tpzCejTk?=
 =?us-ascii?Q?u/VPOzGmtAsMOJby/GlHv5SXnBslvC8POZ+/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(19092799006)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jPfJJ6kJfcTHWShsnnYNO64rMj8KitRcJs2IIzrGCmC4HEJZoU5kznt3aq53?=
 =?us-ascii?Q?Jn/HjLiXbSEtmnH2ibg7rcYW5vAbsvZ8aVVwM+njg3JqDh9VzNfsqmq/qYDQ?=
 =?us-ascii?Q?JUBHkohhchWDKmTjbfLpuOwjDZGrJUJrU2UNQkKlqnG5zQNN+sKxGrpIP+Rt?=
 =?us-ascii?Q?yZkm3Uv8AN3v3GDfWATFtJ7I/oYKjgmL1atq2PMPParshpnC5JIiq55NOtqZ?=
 =?us-ascii?Q?Uhy3mguDSO/UokAdspQtBQQogE9pe3iVqWG/ma1LHUimke+6knefFKngEpQz?=
 =?us-ascii?Q?gYqyNK5SvIiMHv1BNBKdfEqccrF/TRpPcj17TCjrZkAOT0HT0GJvgq5Lpys/?=
 =?us-ascii?Q?k1XdF+3IKn223J02muSZLswTjdX5eZbniKJejes6wBW8eMDSnWjXimt7omeE?=
 =?us-ascii?Q?6H+E3Su4hKkIdWsfoEcgkKR9r/AXRyZ6mARhWx1lqkpL9WnxM280X7xrwoag?=
 =?us-ascii?Q?OGgT9Uma1aKnN1AQP7iFwb3dcICL8FWG0m2GXgujGCwEO17cyggFgHNpzeCw?=
 =?us-ascii?Q?OlC10tvI5ePYS9TUDxNayK8UsoxoRlxRLR87NBbEggMBR2Cl5F7ZiSFSPm0U?=
 =?us-ascii?Q?MaQ5e85dZ8xHzTNVxqmBU27BIyWyyWLsn8KhQEqXRYlOx2F2ZBxW6ioaJDsF?=
 =?us-ascii?Q?5VOxH6B/gL3JIShOFcmL4f3VLR9hSd1corhk9plxieHQwFSCrd46+KxLY4c2?=
 =?us-ascii?Q?4QpAuXJ+qwPH38k3oYJ14uxGD5vxnNe55Gp43qrgyqT2A8Y6AN5QON7ytOpt?=
 =?us-ascii?Q?dRBk29bNBmTa9dIhx15th0YfO2QTqU3JYKWD3zyCdAUIN0+AyrVW528+4Dxp?=
 =?us-ascii?Q?HaYe5Eq+XsfRkUJ2JzfyGo2reERJctMxKXwi26ev6Rau0ltxxaJEYL1PJW8x?=
 =?us-ascii?Q?PGKVaVZuRz4wospUVIS2Tf0Sr5fYmRhlh1kIFyZkdY/fADTlcUmW5Rn7ilT0?=
 =?us-ascii?Q?je0HmpESm+zHjV14u1E6saeoWgq8aS312/ri9CxUPoi8QovA9IpNmPK521kp?=
 =?us-ascii?Q?lpU0CxBtaTCweMzGBdlY3hUDuexM3FEDFy710Ep2T/0VELuiz5rptdJ7fX6n?=
 =?us-ascii?Q?T8QTId8wYFe4yUbNa5ceK5BvIDSVNDcrdW0NaT/QJdIgePo5bsTUV+oSeern?=
 =?us-ascii?Q?FqtqzdsvtGONLwBmdZn7S6zKhdi5FTOZLXnM+jPxNo4JlXZO+bgJ6smgEqts?=
 =?us-ascii?Q?NRqR0b5tDg0CdGWlL3jKuZDlhUrJb+a3JU5KR0blGW015bXt5B3ILxO1ngaU?=
 =?us-ascii?Q?vu9I8ljyhutXy/g4+/FppOhLHBuTzLO7v2HtIhIrMVJe6Sp9DyHZ208gXeLb?=
 =?us-ascii?Q?6OwhWOIR5HDJMXFOMZpOvMYtLkeiRyBRCXRoxgHQ53i0Ve8bkodXNFJvgmfz?=
 =?us-ascii?Q?bFLtyYCpz82YuERCsdTlNEUCWsa26Q1V+3jN+3ON2Ofu1lJF/vZsluA6WUI7?=
 =?us-ascii?Q?FybzyfcOiFUF+xV6lF1Gi86QZ75VVmWcOpficC12sdl77idUIZ9np/aWgc4J?=
 =?us-ascii?Q?4TEX+Il9oNuCFUuyAAvxZ7xfGwApsMPewU/9izYE24DyEU6GhR9L4KL4wmQs?=
 =?us-ascii?Q?OzcR6xI+uSHt4yPs9RgYocOWyNMTS2CCbnRODciD?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cd2fd37-46f9-422e-48b7-08de2c97618c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 02:56:22.9713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 36VTsKJ+ObWxgPolnAxZtywc+1sdUOb3FbuqYovdXSo46KqubxjEblxLhZFhT6frgDgb3l8WJ01o3QMKLBtheg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10405

On Mon, Nov 24, 2025 at 12:28:00PM -0500, Frank Li wrote:
>On Sat, Nov 22, 2025 at 08:58:19AM +0800, Peng Fan (OSS) wrote:
>> From: Peng Fan <peng.fan@nxp.com>
>>
>> i.MX95 features a Cortex-M33 core, six Cortex-A55 cores, and
>> one Cortex-M7 core. The System Control Management Interface(SCMI)
>> firmware runs on the M33 core. The i.MX95 SCMI firmware named System
>> Manager(SM) includes vendor extension protocols, Logical Machine
>> Management(LMM) protocol and CPU protocol and etc.
>>
>> Depending on SM configuration, M7 can be used as follows:
>>  (1) M7 in a separate Logical Machine (LM) from A55 cores, that Linux
>>      can't control
>>  (2) M7 in a separate LM from A55 cores that Linux can control using LMM
>>      protocol.
>>  (3) M7 runs in same Logical Machine as A55 cores, so Linux can control it
>>      using CPU protocol
>>
>> So extend the driver to using LMM and CPU protocol to manage the M7 core.
>>  - Compare linux LM ID(got using scmi_imx_lmm_info) and M7 LM ID(the ID
>>    is fixed as 1 in SM firmware if M7 is in a separate LM),
>>    if Linux LM ID equals M7 LM ID(linux and M7 in same LM), use CPU
>>    protocol to start/stop. Otherwise, use LMM protocol to start/stop.
>>    Whether using CPU or LMM protocol to start/stop, the M7 status
>>    detection could use CPU protocol to detect started or not. So
>>    in imx_rproc_detect_mode, use scmi_imx_cpu_started to check the
>>    status of M7.
>>  - For above case (1) and (2), Use SCMI_IMX_LMM_POWER_ON to detect whether
>>    the M7 LM is under control of A55 LM.
>>  - For above case , after using SCMI_IMX_LMM_POWER_ON to check
>>    permission, SCMI_IMX_LMM_SHUTDOWN API should be called to shutdown
>>    the M7 LM to save power only when M7 LM is going to be started by
>>    remoteproc framework. Otherwise bypass SCMI_IMX_LMM_SHUTDOWN API if
>>    M7 LM is started before booting Linux.
>>
>> Current setup relies on pre-Linux software(U-Boot) to do M7 TCM ECC
>> initialization. In future, we could add the support in Linux to decouple
>> U-Boot and Linux.
>>
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> ---
>>  drivers/remoteproc/Kconfig     |   2 +
>>  drivers/remoteproc/imx_rproc.c | 193 +++++++++++++++++++++++++++++++++++++++++
>>  drivers/remoteproc/imx_rproc.h |   3 +
>>  3 files changed, 198 insertions(+)
>>
>...
>> +
>> +static int imx_rproc_sm_lmm_check(struct rproc *rproc, bool started)
>> +{
>> +	struct imx_rproc *priv = rproc->priv;
>> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
>> +	struct device *dev = priv->dev;
>> +	int ret;
>> +
>> +	/*
>> +	 * Use power on to do permission check. If rproc is in different LM,
>> +	 * and linux has permission to handle the LM, set IMX_RPROC_FLAGS_SM_LMM_AVAIL.
>> +	 */
>> +	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_POWER_ON, 0);
>> +	if (ret != 0) {
>
>if (ret)

Fix in next version.

>
>> +		if (ret == -EACCES) {
>> +			/*
>> +			 * rproc LM is booted before Linux and not under Linux Control, so only
>> +			 * do IPC between RPROC and Linux, not return failure
>> +			 */
>> +			dev_info(dev, "lmm(%d) not under Linux Control\n", dcfg->lmid);
>> +			return 0;
>> +		}
>> +
>> +		dev_err(dev, "power on lmm(%d) failed: %d\n", dcfg->lmid, ret);
>> +		return ret;
>> +	}
>> +
>> +	priv->flags |= IMX_RPROC_FLAGS_SM_LMM_AVAIL;
>> +
>> +	/* rproc was started before boot Linux and under control of Linux, directly return */
>> +	if (started)
>> +		return 0;
>
>should it be before scmi_imx_lmm_operation()? If started, supposed need
>check scmi_imx_lmm_operation()?

No. We need to detect whether M7 is under control of Linux before return.

Thanks,
Peng

>
>Frank
>> +
>> +	/* else shutdown the LM to save power */
>> +	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_SHUTDOWN, 0);
>> +	if (ret) {
>> +		priv->flags &= ~IMX_RPROC_FLAGS_SM_LMM_AVAIL;
>> +		dev_err(dev, "shutdown lmm(%d) failed: %d\n", dcfg->lmid, ret);
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>...
>>  };
>>
>>  #endif /* _IMX_RPROC_H */
>>
>> --
>> 2.37.1
>>
