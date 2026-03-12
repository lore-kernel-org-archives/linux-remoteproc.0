Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010003.outbound.protection.outlook.com [52.101.69.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABC6188713;
	Thu, 12 Mar 2026 12:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773318939; cv=fail; b=VMl/yRMJH04CDQOZe8Q5HM8iQBiHa0QkQlL89GeLQ2r1r+PxScWFYJugV8q4EBY6BoUwQvmRK7RZQ814H9rr4zJntasgXhIvKEYCvVKA1gANF1kAKM1YudyV8tSLqahsnIFIehfN4wYrWP5EE3uxTPjMssjjGT8LWcwSWetENbg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773318939; c=relaxed/simple;
	bh=C3IEaW4GQERH4bOANxQAd5ldGB5m3N5z/v97v05FdFk=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=leeAO8Sq+DvOB6db0JRMGKumM0fq+9Ae6IBSGk2Ls6WJ3BjrrJP0qQcR3UIE8YXV5wmemsIPfFLC9z0Uuo5vnQRjdAL8qKopczpMttLAgi1bTpzwZY8KGMt5sIA99lL77YnU6gjfqloFaOQBV0oUzITWBsJo4xLvtaWEJSN6xGY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qvUVXSXo; arc=fail smtp.client-ip=52.101.69.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qvUVXSXo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bUNzR5FRiEOYLsJDq+7HjH3gwRgEUcnk1vVSLef0mwtFpaL1KpnfhlEYeZ2iBRN/OQzZ4xnzyyBDf16eGj2kLrW0aNj8qc4IziJo3nTCyBafyjDMq4vQLTCRSjDAfuJa6EIf0s57khfY2KgyoMn+nTCZ/p8MWUwp+4VHH7+1oeC3Zj3ap82nb35O5kUnpVc0996yx8Og1h5bu7Q9JDbP85PrwVCTfozXfMrJmiY9K25FUFZCcysO6PwQidrwi4AVIPPaHuTti6UwLm2NsJTO1W9nWsw5tTN64pM1dm/i9SJBAAg+bhrxhOg3nLBdvuNj2BWmp+vO5wN1ip4tPj2umg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dUS0qjRBBvnsHRyc6Ssp3+838fG4QYMApousIEusUjA=;
 b=C0U5KbcKP9KCTKfaIwMT9yn+yMYMgXrP/FvyZHQ7Pe/YvG/Gx4g8u36MhT7JtvMRY7BSejUlU3+Yr9DdoNW3CeN+tg6y41tVxZ6hDX+VBVmLTucYVlL2r7sklm6t9Yjs61e98MFcWOfkN49sWhoUqTatYhyZ4X3S8ZYKK9t7CtWzcrgKlAOvABOsKubc2t6d7Bqq0b1FH72lv8xjl7sUBq/GtTg5scSih7Hn6tRjpr/YAwdNqWq/PztMqzAD+7BFOtNcio53G7x4/zSf1JCkA4m28wmLlGN0+cwfEkpoEPlM+KIWzK3y4s923JLIWfTuOrfAjhac6eRGVKZxqv5pXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dUS0qjRBBvnsHRyc6Ssp3+838fG4QYMApousIEusUjA=;
 b=qvUVXSXoFVIBiQvpzaBJpigsaktxBgjvyMr9plXzhXjdNBRd4kH1cC/FJ6GFa9tNoyM4DigIZBqebkG/hViHYGWn5YCvl9A23U23NuP53NMIJwTk4TbZWQrXrinInQBRCbVks/E4GiuwI/NHK9Np8BGNMP4bRD6oOoLpAof5Z1hq4U+m8OQgkIMIHAU54789vq8lWMLPsK8+7HDIxlPqBfvkwy0bCcBg9TRkzo2K9YhUfMnis/RwRDtoyHZdSip81RXDppBIl09bXax7kqKgjfml8ww2CW+nKelkNAh96kyBE+dlkzite2srnga+z1dxiUbadCIPRb6d7eI7cwGpOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by FRWPR04MB11271.eurprd04.prod.outlook.com (2603:10a6:d10:19c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 12:35:30 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9700.013; Thu, 12 Mar 2026
 12:35:30 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH 0/4] Add i.MX94 remoteproc support and reset vector
 handling improvements
Date: Thu, 12 Mar 2026 20:36:55 +0800
Message-Id: <20260312-imx943-rproc-v1-0-3e66596592a8@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAGezsmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0ND3czcCksTY92igqL8ZF0jA1ODVAODJDPTNHMloJaCotS0zAqwcdG
 xtbUAE+MxoV4AAAA=
X-Change-ID: 20260311-imx943-rproc-2050e00b65f7
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2PR01CA0050.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::21) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|FRWPR04MB11271:EE_
X-MS-Office365-Filtering-Correlation-Id: ad641b65-13ac-4e20-ff03-08de8033d83b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|19092799006|366016|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	eo5LWnx0CF37JTxEuWsc1dHbxSPVCxA6Y43due1+0maz3qGwJggKgKWZvExRWXIb2UkF8wXTa2dcCSK+RB51fOLqnrsQB+E3YfSlNc6q72f4x9aetmW6Hmm6WTfhtlOnYZSsLr0svc1PwxMCIojL52By0VrryMxQ533lC29PnsROTZIHqkgTo4GW+Pc1nqJQIjHDpCdFS+lfD0I3RLgKwaO9Opy7islrLe/o1R2YLTxgN7FWOfiHxJNUkGX+9Qs3Kh853o9zl3gbcJFWrdeq7GD/9dgt6WS0S2EEV/1C0bzOP43fxYKvY/i6NKoOshaXg7MstORr9GluTy+sEbBfVacqF1hgwHh2TEFcooeHf3E3gsnLeJl9gsL0UQREmjFeiBh2JUH+/vuCvV+dP2jSRFl1mgQZMI8OFTX3x6FeoijlhuDwMFXWCqwB10l9tMZQJRS3/hsqmUQQTBwJA5fADfgFjuWgTtu17g1rXUfYIaXUTDj9K6Rz4yc4M5roTU8o1VG0KSjVYYbP63h60QD4fVJJzT0tSpfknFsS8bjcdNeknfaVZwXmEc4LT/ou93xDUu9VKx6m9uLVaY8bJO9RrrAE0gwtAlqjdpdqYOFJFdYoiyLv5f6sGc0bisGtlZnySjnEVG5NTiwSrz80F2ebFBUHdjBlH7zBIRdZNk8oO4Xi/NfOiD73r69t4rzuEKh5e9yJoxUKcA96ZfvGmCXQmRxaggFrCSzprTUeRJ/n6nfqCdPM8Qmr13KpEBzhZqfCueoV4k/a4s/NO/bj2nhUPOAn0L7QXpwGV0ET94Mq6ns=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(19092799006)(366016)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3J3c1ZWdVdBZkxSdWpRMkRqZzF2dDZDZGZQSURwU2w2c0Z3bXRIb1VDNXB1?=
 =?utf-8?B?MVhJVVhhT0VpUmwrODZ0b3pESFBwNkdqdEE4QUx3amZuM0xzU3BhVUVkTW02?=
 =?utf-8?B?Y1VVVTA0TXp3OGg4OUNDWVFSK3Z0UlVOdzJLWjRTRW92QVZaU0RFaTBUYWIx?=
 =?utf-8?B?UGFBTG1nMmladTR0YnJzbVlEWjhQYVdWMHJPWWNnbGhaV1NCUXlBanhSbTVK?=
 =?utf-8?B?K2hkVFBNblVrMWxCZW5mdHUybUs2Nit5QmRxOFA2MnpnRDE2MTlHSjJxRWFa?=
 =?utf-8?B?VmpNNFhjb05nYnc3WGwyT2N1dzB2RFljN0pqUW9ObWJPc3pxOGJYYUVmSUdZ?=
 =?utf-8?B?UDV5SXBLamowRnhPWmNNWXYyMklxUVR0WFR1OFM3V2laN3I4MmZmNGJPWm1q?=
 =?utf-8?B?aGl1YU14Y2lWRWJHdDRMNmM1dWtDRmFrTGp2VVRpNTQ0NGtSTTJ2MmRIK2ww?=
 =?utf-8?B?UFc0NHZzbVFUWW53VGtwYmkzTDdMbEFNdnVrVHN3STY5NU1GUDFsbWpxR2hw?=
 =?utf-8?B?Y0VycGh3aTIwNm81RWdhOWFocTlTM3BiaFhoZkxIOGNuL0dSVjJ1UU9GMk13?=
 =?utf-8?B?Z3Z3SEFtUVM1bFFwcUdSMklxdEg3MjhsY004N3U1ZGZsVEVXZWM3QkpaRmpM?=
 =?utf-8?B?UXlibDBmZVNJaUFaTG1Tak9xaUR5bXNjdUpZczFVV2ViQ1VFNHdWU2NOdWRa?=
 =?utf-8?B?STBJNHVCcWJDRmJrY2ZnNW1qZVRSelUxTVU0MnZFaDlvdnFKWFlOV01OTFkv?=
 =?utf-8?B?MmpDdVU3cTBKc3ZqZjh5QTQyVjQ4Q0xtS1ZsWE9jcTR6alNaeFhqVmpjM2s0?=
 =?utf-8?B?QXp4T2FoMHJKdVpWQmtIKzdnWkdJN3NXU2NvRFBHK2FQTUxhTk41TVJ3S09x?=
 =?utf-8?B?VFQvamJnY3BaMmh4K2F1NVJpL2FUYVVMZURvb0d6Nit1RWZIN1VuU25ybHV1?=
 =?utf-8?B?TTdsdHpwYm1GV0VaMkRRNUg5anhEcElCOEIzUmJVZzhDT1FSRCt1dEUxN2Jm?=
 =?utf-8?B?N1prY3RPOWdDeTRQWjVEK3VvRU40d0RSZHZ6ci9ic0s1R1ZFK0V5WXhDcWt1?=
 =?utf-8?B?SDg0Y3JoblNWR0xibWIrc1J4RTBJWklkSVV1d2JaRXFLNXUxeDVWVTJ0VHRG?=
 =?utf-8?B?RWNtM1k1SzZlNWR6ZGtvSDlMZ01FM3lDZndyYzZOL09ibkJuYjZ4V2NwWHEz?=
 =?utf-8?B?eTdqQzFLL3FZQU9ENkNZZHM2VkZUckpuaE9OZEI3aEd6YUZrcklIazc3N2ZB?=
 =?utf-8?B?TEZna2lvSEh6cmRjdGVpTlFYanNyNkRrZVlVNDNiTm95WFdJcU5SV1B1dXJs?=
 =?utf-8?B?d0dtV291bkY3MnNUQzhaQXNuVHVsMktJc2dac2lHM25SeHhLUVF1VGtvSmFF?=
 =?utf-8?B?WkVCbEVGY2d5Q2hpWWg3V1BTUzFaRkZRS0ZpMGFUVHdKUUtTNlpkUUtHejhM?=
 =?utf-8?B?ZkpUTy9nQnFBK0tXRGhNNkp0RGNJdEUzZnNQS01Na0EwT0dCK0k4Y1RJT0JP?=
 =?utf-8?B?NVlmaXNqcW5RKzQyYnl6dnB0UWFkY0ViU2YzWDl5QUpGbWthVkdHNlRBcTJ2?=
 =?utf-8?B?bTZaVHhJWjRvMEJuTC9Ca3ZLTGtab2I3Q09zYndyYis2aVEzVUkvLy9WcXZM?=
 =?utf-8?B?dEtMamhCZTE2R2ZHN1ZJdkIySWI2TGhqdjR1TkVMVHpNNHExRjBjZ3hWWnNT?=
 =?utf-8?B?MTN3WkJBSFJOZjdDMU4yck9SellXOGcxbkhQMGJJTytRVnRCZWIxZDRIWjly?=
 =?utf-8?B?THoxNnEwYzNtak5mS1h3anBWTDBlUGl4STI1ODVTeWhVTU5NNDVlYzFHOHdw?=
 =?utf-8?B?TVVkcjIrMC9kcDNlbml2QWZSZGw4RGlPdUVabHJ3eHFQSkFyY3pzT0sxT3NM?=
 =?utf-8?B?N2hkamxPMEFLY2p2c1M5RnhjRC9vQ0NBVERzeVk5anlWOWxHWlhqVU9WRk5S?=
 =?utf-8?B?OWJxWUNqcHVOVFJMejFGajIvNWM2ME9NcEhRbTR1eHhSUFU5ZkxWTlV2Rjd0?=
 =?utf-8?B?dzFJOWFjTlh1ZkVKblcyZzhTbjZZQzVjVlRzdVRVdmZvTEpXOU1FTGtsVldm?=
 =?utf-8?B?UElFdml5Vk5tZ2RTMTBDcjFmbUY2ejczQ2FFN1YzKzhoMmlabzFkZWRnTzYy?=
 =?utf-8?B?N1dKZTEyNjdGNFNGd0wxenZkU3BJbS8wL293clJNcTJNVENMczhIY3F0NGJB?=
 =?utf-8?B?ckJBK0thVUNWcHJycFZQK0h4MXgwRUJ6cUxqOWhuNHkyeWJPVVV1VldjMmsv?=
 =?utf-8?B?S3QwNHBiYmFDRkJ3UDNPV3RBcEplNytZYXhmSW5xaloxa29BaTNmbDhNWXJK?=
 =?utf-8?B?U2hGQlI4RkVhTXlQcU5FcSsvQkZXUDhKc0FIeDdVWTdEM3lxUTdPdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad641b65-13ac-4e20-ff03-08de8033d83b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 12:35:30.3123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +bM77y3f9CoNDFcYAIxYdf8C7FFQUpiVq5MpnRSlXk5bfb+9/XJfLRb3/c09m6ZAtvlq28x6q+4KWrIXZKjKTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11271

This series adds remoteproc support for the i.MX94 family, including the
CM70, CM71, and CM33S cores, and introduces a new device‑tree property to
correctly derive the hardware reset vector for Cortex‑M processors whose
ELF entry point does not directly correspond to the actual reset address.

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

This series addresses these issues and provides the necessary DT bindings
and driver support.

Summary of patches:
[1]dt-bindings: remoteproc: imx-rproc: Introduce fsl,reset-vector-mask
Adds a new DT property allowing SoCs to specify a mask for deriving the
hardware reset vector from the ELF entry point.

[2]dt-bindings: remoteproc: imx-rproc: Support i.MX9[4,52]
Adds compatible strings for i.MX94 CM70, CM71, and CM33S processors.

[3]remoteproc: imx_rproc: Pass bootaddr to SM CPU/LMM reset vector
Ensures the correct reset vector is passed to SM APIs by introducing a
driver‑level helper (imx_rproc_get_boot_addr()) that applies the
reset‑vector mask.

[4]remoteproc: imx_rproc: Add support for i.MX94 remoteproc
Adds address translation tables and configuration data for CM70, CM71,
and CM33S, enabling full remoteproc operation on i.MX94.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (4):
      dt-bindings: remoteproc: imx-rproc: Introduce fsl,reset-vector-mask
      dt-bindings: remoteproc: imx-rproc: Support i.MX94
      remoteproc: imx_rproc: Pass bootaddr to SM CPU/LMM reset vector
      remoteproc: imx_rproc: Add support for i.MX94

 .../bindings/remoteproc/fsl,imx-rproc.yaml         |  9 +++
 drivers/remoteproc/imx_rproc.c                     | 85 +++++++++++++++++++++-
 2 files changed, 91 insertions(+), 3 deletions(-)
---
base-commit: 7109a2155340cc7b21f27e832ece6df03592f2e8
change-id: 20260311-imx943-rproc-2050e00b65f7

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

