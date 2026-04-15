Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013067.outbound.protection.outlook.com [40.107.159.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52AB1E511;
	Wed, 15 Apr 2026 07:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776239328; cv=fail; b=U6y887d103S0XHwiKu8sO8MWyIJ+sYAL18y1nPzML+c3fHznskAy2dTp5N87wxcfCWDtfweg/vf2GW08TYV2ErMatBqZ4WH3tGlT6wAjyGNMr9hhTprxv3xkT8jIEaX/kfkSvTv4sFMdF5YIwMseCgMJnjwYo3n9Tmj4f1WkBCM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776239328; c=relaxed/simple;
	bh=CeI5lckOJwjA/7lAriRwng61XYv7MiDBxJj+0CsDL6I=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=St3/S6zWDHx6ZjNzvcMNezpx80IUatuVMxg/deIAcwuLOgeaDpoSGtCJn73f37iKZirP/MowEjW0NahSoqlQ6r9GzPrHY5ZZdNgjFJlYvtwlfmJHMJ1a72Zc1YcQuSmNH2HGnOtNalcPKePm/fg3Tl13T8h2L360tRXVFve+CKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=HwGftsaB; arc=fail smtp.client-ip=40.107.159.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="HwGftsaB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IQBCZ67YLis+SdtQzh3Tzt0DBTnJbWSbVBuQKXpdQGdivm/aPupuF2J6OEzgq3MGoDQYlZKwdNba/8MzcL2LyE3k9cVTzsU+pHfdNWYBHJsRWmxczGDjfB46v08NQytBO+N7MA7EngW+YtW9WR1OEifxOAzNwZTLIKp1v/czQgUwq4TR85YXFgcR1zlyTMQP0tQCVw5JoSJ/uHYaNRmx7W3bI+xLZ9SSTf6ejhAsUBO5fCO6V/Oryh3FPXDk+mdYngU54rBdShaZdYF4zqiX+eEGsz0uEWE5h5auJMW10WKaOnZw0j7O/ryQaLt/JW6/hPm5Uzyvu8ajt4Ru05hOCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nYQ42WCZBdAAbBFsTJiVlVWIKXcdNh1FPEiO2R14Vec=;
 b=F1T1W7y45jzZkctr/UQZI2p+5bMX/6Vtk5OxBKIcDyvC9AanZUlI5ERj16QwwhoAMBPNT2DrtQ7poPbTKcCcFVrZJmt8EMiDzKwcQmBLVkVfGO7koOvhTgrLZEs1Z3gfSyhhB+tIOu0EZdW9lE6moKQZWh5sP6vb1+bwxKnutczFD19mbDR4+POErl+C/w00+sL/PXxFwiUSFPvSYTm/fANMzNQcBhh/dLKU4lC4JqI2IUrrWZo2RdVsg/HgBNp/QwL4vgt1BGQRAAIZlQCbegXV8bNlnFevge3iM228QoC3VNnBY0grqTGJlgqS1ttSUUVjFV5BGhE3SN90XhSlAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nYQ42WCZBdAAbBFsTJiVlVWIKXcdNh1FPEiO2R14Vec=;
 b=HwGftsaBVFnB99uocxjz3Choq/tGNSiHvVHJvCFsMjsWdtz/hv6ssWB6GQTplqJnWO1wyspngzc8gExhXSdO/Zeg/fvJ7wz9KI09xiPsme9o3Sx6GRP2LihLH/I3YXOtu39PiQisZe3ZxKI0fN/yhnvZ28rVRzaJfB8v6Rmcly2Rg8ZVplZ9upWguhFBs8vK/S9KKf/YhMc9WFQKC9MVLfqB6niTAUuBtQEqD6kPfecpL0DEMYjVgaa77+0X472Cw9TgsxNA3Ga5+5TfUx8NPH2RReKDnIqXYGmbAt4rbelzjkBkOcMIvJQmIX+7QTpYEXsHUBmXDnvuiu1r/gaocA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by AM9PR04MB7634.eurprd04.prod.outlook.com (2603:10a6:20b:2d5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 07:48:38 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::21f6:947a:1f40:18af]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::21f6:947a:1f40:18af%6]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 07:48:37 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v3 0/3] Add i.MX94 remoteproc support and reset vector
 handling improvements
Date: Wed, 15 Apr 2026 15:50:37 +0800
Message-Id: <20260415-imx943-rproc-v3-0-9fa7528db8ca@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAE1D32kC/12MywqDMBBFf0Vm3ZTJxCTqqv9RukhtrFloJCnBI
 v57o1D6gLs5F85ZINrgbISmWCDY5KLzYwZxKKDtzXi3zN0yAyEpFJwzN8x1KViYgm8ZoUSLeFW
 y05CVKdjOzXvufMncu/jw4bnXE9/ed4h+Q4kzZMIqJes8MtVpnKdj6wfYMom+VNJ/KmXVyFIbI
 atKC/yo67q+AFZrq2bhAAAA
X-Change-ID: 20260311-imx943-rproc-2050e00b65f7
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2P153CA0002.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::16) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|AM9PR04MB7634:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e653af4-60fa-4068-84db-08de9ac3672a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|7416014|52116014|376014|921020|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	KHeWttEwYZU2vhAEx76G4Dt/CGa0jiVUVpQC1Dmong+Vs4iUEtyCSCdtgZiG3xDz/6Lwd6pzBbq8MGfntyVUpCgnYTaKCuusM3wbYc+zgFr911kyKTu0wKxFD1rLPBqu8KktlkTi6/BePJhokKyC1AXoJAgQQzE9UuL6mUP1FB0JKRnHZFhF+jJxd/8zeN2u2oJWo0jAA9v+CH4fubVODqw9ryKSKhkoPkrYOLeZsuBK74fSwBmqeYUvFKe5DZjd/ZkU0WaQ346sIf8E3SRgkLeLOar8o9fZQQYxJDTM0hxoPG2f6I9pBYEfQTFz65r6GZX9NxioOJQv9YKXcG3ZrGuAYvF4DeN8aIwqORNp91/aey/DDf5dni2mtPvfaWf3Mn40VrJI2vndTeg4J28RKrxtmLjuZH7M4j/bvUpfXjQOB8o7r+vOPU2AKljXh48VJVVgsM2m3OQrM3pxFPDedq2brUM444L70uXzmgaPYgz+bn9TqYz9Yn3OkneDSFhVeq+4rcMIaljPqCffocUKtiLJwEVeuvhkQYqw/xmg3ABNneB5CRz5RC0tJYlzX93npXSc1UHStBS+Syw5Xx84hjvmd1J2+QzpphstdoFKTG8Qe+xEsxehJ7RYoT6BxxCeS02Hp5NC7J3dHWX+io2Gg+ElRjZGp+NTe9jVHHqJFWVMu0u9eHvLcDLD0BxwK8scW/WGS6PR3Mpl1TEJhy0/JjEVnS7pqFym+NDmqeZ+r2riLjscsdBDvyHrfE2NNyMLZ5zRyU77jAwedmq9X9tcazw5b7t0++PzGtP7eCfY0/cpNHXyT8FZyM/iD/Es9PQkOLGp7jWnjY4aUXLx3KzwvQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(7416014)(52116014)(376014)(921020)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmpTL09LRDgwbUlNbFBOQ3N6QUhrWSsxZzR5Z1ZiOGc3RkVSTlY3eHEyaTQ2?=
 =?utf-8?B?UjNmaTd0RjlUWHE0Zmt1TGVYTm1MODljVnh2YkM4VTVWeWFaelVDV291ZXpa?=
 =?utf-8?B?MURpMDhKK2tHU3grV2hvN0h4ZW1WMEUvQXVOeVpCSE0wbW93Z3BPa2FrcTBu?=
 =?utf-8?B?RjBxRDhOYjFkOXFLeVowWVNoamNPTFl5cFIwVzE0a0gwWFhZZlh6SVlKSDJH?=
 =?utf-8?B?NFNLbGtUbTRLWVlOK0pKc1ZpQlNaSUNtdzhNRmY3a1ZaOXBlSFIxMWRneGdP?=
 =?utf-8?B?R3NZaDJ1aHpNWGFFdXpNQW5zTXM5NXlxMWV1N2hjdEFtUDg5elVPWXBCVUM0?=
 =?utf-8?B?bU5pQkNVNXFJQkVKV0gwMDRna3g0Y3dOZHMyUjBZZ0hhb0JJRE0rNGxVOVpW?=
 =?utf-8?B?enZDMldray9KNHpaOG1zbkxKS2R3ZzFQRDNPd1pVdlVpUjFaRUFnRHVvTmRK?=
 =?utf-8?B?eEZCREZ2TW5kMmtmQ3kyUm9mY2lZNXo5ZC82ZExPRm5Hd0lFbmt2K0F5dXA3?=
 =?utf-8?B?VmhUTzN1VkNCTXBRM2RleUpIT25qQkxZb0d0TFJtQ1gzakFtKzkxRW5CNTdS?=
 =?utf-8?B?bjZZM0RFSGl5bUtxQVBFNk4rNGEvYnBBWjlMMmhFTnplZnNEZU5XWXpyS0tU?=
 =?utf-8?B?amNVTGlyYmF3b01mTHVRM2tKa0R5U3Rab0pMQ3ZHcWVJRDkxM0MvL3VoZFJJ?=
 =?utf-8?B?NWRDRkhWNzJzak1aYUI4dUdscVBHaHh0S3NYdEUwdWd0a3ZpTWp1cXpiUktX?=
 =?utf-8?B?MWt1d1ltQVdnM3VDVnU3eXBXSnc5dFhOSFFqZ2RPY3FBZURsVUxZbnlDRExF?=
 =?utf-8?B?VzJtV0VXVnZtN1M2SXgvZE5sYnRodUhLNGE1a0twWkg2QW12dDlyZWhTbVBJ?=
 =?utf-8?B?c3FLTmI4eVdCSzlYcjdkQ040NVhUcEF4VzNGSjJxZjF5d2RIZVpuWitTUUEx?=
 =?utf-8?B?RWJIUEpZRWppNkJkVHVjMHlISEdmUnBiNzJBMnpydTVnakYvMHR3YXBCbHVh?=
 =?utf-8?B?cDFGWHFIaUl1L09yeEtHaFMzTkxvbklEVndyUmxuU09aZ1JNaHpCSWhxTWpV?=
 =?utf-8?B?UGlldmZIbDVaVUpuNmdoUkNXcCtTVDRvRktFY0ZxY1NOWm0rS0ZhYm5BM2w2?=
 =?utf-8?B?SVdYWHlwRzJrWEh1ZXNQQkV2ckxnV3hrMmxYWlJhaDdFdDFiVXFzSTRDRVJy?=
 =?utf-8?B?S1FaODhGUm01ZEVYZnc1VUlhUWZicVNkc0cxejdQcjNLUnRNeFordENsTmJR?=
 =?utf-8?B?S2tPZnFnaWN3UnlaNXlTRGlyT0dyRDJuMnpMZUcrZ20vcXdQSDZXSW92UDFI?=
 =?utf-8?B?aTFvdXMyS3VleURBTUJDMlg5bUEycWZDTFlCRjdvVndmV1pPcC9IYnZEY0sy?=
 =?utf-8?B?OUNBTzdoQVhZV1ZXTTVCbUVISGRuYUJwNDN5dzdNWWZXeGZRWm8wa1RWTW5R?=
 =?utf-8?B?U0FCY24vVm1NK0ZBajVNSFJrdUlaaG9CbE9GaVpsU0lMOU40elZ2MXpzc1ds?=
 =?utf-8?B?UXRJeCtFN3lRUTFieXdqZHFWYXdmTTFlUzdkK0IraHhBN212cXE5c3Zvanlo?=
 =?utf-8?B?VXpPQkZUVzBOV3Y0bkxCS3JxTTdTVFpTSWhMUG0zbXNXbDBOODZkeWZ3TFNF?=
 =?utf-8?B?ZElFM1Z5VCtmc0x4dExUSDcxVVZveC8xUXRDMlA5WWdtSjU3R1V5Nndpd0Ru?=
 =?utf-8?B?emVyMks2ZkVYejZzZXVSUHo4allqUHU5T3NPdDRJeDZmbXFvcFcwdHRCZUNn?=
 =?utf-8?B?Um9uWDZMMmM2RE1MTllIZGJqVkhaSllkb2gyY25pQXZ4MktkVkszWFREYmFq?=
 =?utf-8?B?cSsxeENteUJvaCtwSDlkTzdaU2xtUGZzWVovekx5WkhoS091VmpGZFpKRnF3?=
 =?utf-8?B?anZFbnp6MWxxclZnUmRhQmxpUUdvN3F1R2YvdmhmSGtTbWtud3BkU3VCdzlG?=
 =?utf-8?B?UkxOVDdNN1pXTEJPUEVOdmpMdVNaSU53OTlFSlBhQ1ZYVFRraDF2NnB1MU1D?=
 =?utf-8?B?b3U0M3dLYkxiNHQvejRIbUtDbXRITVhtNFRSMHB4aEU5Y2t6RS9tcTFBYVlY?=
 =?utf-8?B?bysyVDJLYy93MGRRRHRIZ2JVaGVTRUFIWjlTcFA0ak8vd3Y0cDBSY1FnaUdi?=
 =?utf-8?B?Y3JOUk01SUluNlF2dGpXcTlOQnJrSDhVQVJySVBybDEzYWhGM3V5aWFaYlVt?=
 =?utf-8?B?Vm1HVzFtemwwY1huT3JzbEFRMDlEdVkxc2R1UkNTbmdTWkZYYVV4NS9oWnJ4?=
 =?utf-8?B?Vjk1RXJPaEdJYzdxeTNkL090Rjg5MG5wMGtpVG1tbU9XcUZVeU9UbTFQczhs?=
 =?utf-8?B?UFFvK1VCajRUZHc4U2hvRDIwWVBzYllwVGpOOWMvMXJyTVA0S1QzQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e653af4-60fa-4068-84db-08de9ac3672a
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 07:48:37.5335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AY9Nd2hdtyxdR9CdPKG4+2J635KFiOiQcKtHwSj8HdiCoMEgJ/l/IDZquwOTh3scUMXkd5CrP00qPaC6LfoYvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7634

This series adds remoteproc support for the i.MX94 family, including the
CM70, CM71, and CM33S cores, and derive the hardware reset vector for
Cortex‑M processors whose ELF entry point does not directly correspond to
the actual reset address.

Background:
Cortex‑M processors fetch their initial SP and PC from a fixed reset vector
table. While ELF images embed the entry point (e_entry), this value is
not always aligned to the hardware reset address. On platforms such as
i.MX94 CM33S, masking is required to compute the correct reset vector
address before programming the SoC reset registers.

Similarly, on i.MX95, the existing implementation always programs a reset
vector of 0x0, which only works when executing entirely from TCM. When
firmware is loaded into DDR, the driver must pass the correct reset vector
to the SM CPU/LMM interfaces.

Summary of patches:
[1]dt-bindings: remoteproc: imx-rproc: Introduce fsl,reset-vector-mask
Adds a new DT property allowing SoCs to specify a mask for deriving the
hardware reset vector from the ELF entry point.

[2]remoteproc: imx_rproc: Program non-zero SM CPU/LMM reset vector
Ensures the correct reset vector is passed to SM APIs by introducing a
helper (imx_rproc_sm_get_reset_vector()) that applies the reset‑vector
mask.

[3]remoteproc: imx_rproc: Add support for i.MX94 remoteproc
Adds address translation tables and configuration data for CM70, CM71,
and CM33S, enabling full remoteproc operation on i.MX94.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v3:
- Patch 2: 
  Drop R-b because of changes in V3

  Following suggestion from Mathieu that apply reset vector in
  scmi_imx_[cpu,lmm]_reset_vector_set(), not change the meaning of
  rproc->bootaddr, add helper imx_rproc_sm_get_reset_vector() to get reset
  vector and use the hlper in scmi_imx_[cpu,lmm]_reset_vector_set().

  Add reset-vector-mask for i.MX95 CM7 to avoid breaking i.MX95 CM7
  boot.

- Link to v2: https://lore.kernel.org/r/20260327-imx943-rproc-v2-0-a547a3588730@nxp.com

Changes in v2:
- Drop fsl,reset-vector-mask by using fixed value in driver for per device
- Add R-b for i.MX94 dt-binding
- Update commit log to include dev addr and sys addr
- Link to v1: https://lore.kernel.org/r/20260312-imx943-rproc-v1-0-3e66596592a8@nxp.com

---
Peng Fan (3):
      dt-bindings: remoteproc: imx-rproc: Support i.MX94
      remoteproc: imx_rproc: Program non-zero SM CPU/LMM reset vector
      remoteproc: imx_rproc: Add support for i.MX94

 .../bindings/remoteproc/fsl,imx-rproc.yaml         |  3 +
 drivers/remoteproc/imx_rproc.c                     | 98 +++++++++++++++++++++-
 drivers/remoteproc/imx_rproc.h                     |  2 +
 3 files changed, 101 insertions(+), 2 deletions(-)
---
base-commit: 724699d8d0523909da51fda8d1e10c1ff867b280
change-id: 20260311-imx943-rproc-2050e00b65f7

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

