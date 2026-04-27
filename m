Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011019.outbound.protection.outlook.com [52.101.70.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E78519F40B;
	Mon, 27 Apr 2026 02:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777257559; cv=fail; b=HXk9ajjGtkznMG+AnKDIPdta72v7OvHQ10zwe4o0xc0s24HazIMDR1zj14B5uPkcV+WQfm2iYOs0eRlKghuOOuC4SY/i3tS3H2qZxAoxDvGZI7+ib5uyvxvv+N5FxHgu1GNt4M5zcnbehIIUJd5MjBYO+cODRp6kIuaEPzCIbJ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777257559; c=relaxed/simple;
	bh=3kXbgyfnYY5+wAsLKWJYkYkD9bTlx5SLaEFmlGMtJd8=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=dNC5niYXdOnX/82xeKAvVAAh6QrC7GDAlt/mWEeYvaIM8Nc0i96lk27Al63yx1Ouj1DfIvv0F506qiUTynejJ112iC6rhWsHQuFlCo8KWOaUpfdqLwNKesgytjJ3B2HeKFK5jPQ1xO1vjlv97V+mlhppLZWNqIV6bu7IKsv1pcA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=UuQhQqWi; arc=fail smtp.client-ip=52.101.70.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="UuQhQqWi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MxBABoxb3uEblMvHpQoBY/zHaJUD9Pn207HEwkaAMRCqawvyMfB1nukuLv1fVaUkmdx4CQnNvGsPev1CW4aAJfsDiuTK0ADysAgGTyX/Wmixalj4I5RfS+PLfEQjx2KUIJxUnFqzJ3I7Am7Cv3SDWU3JfRqo4LpgOKf38qxKfRqQkOZcxZIvBLB4FlvAYazlU3po0IZWeTXtsXLVrgDC01O0muHoiNf4uQt6Gs+5+yR0bJWMMthXON7bb06IQWVbm9PCNb1062PuOv5BQU7u+mRQzmBft5WDDyk9Ghh3HBZwD/F/0T98Uz9xzwUYGffanzQQ9va8HiK9PAEMub8xZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YOllnpo5dWNYpLH71FGu8iri9y3UuR/Pby23V+tNERI=;
 b=NWY+/3CYs5E34WXy8bZCKUKCRRqDJs+qCiJ4+p7xJt8UprLKKC2yTw5h3uUFE/gxi8yY5DPotAQ9Mwb7/UKSSMmSO5i80fdLS0azq2Bby/PH2DqwKutJPBk0cl0sI13MtaFkInWkbuF/3tkN93H1uEznjenlqdaeAa/hm9gjc6bWIkdb+COoGbHqw100ClmyZOBj5s3WT8jt+n0iJBUo97IBo6hCDQf6GuUVZf9D23c7ZmqXbLltH/9McKCOz1BM7KnJ3OcPN39FbqP1EYifVgk6aGmBktviFB25BKF1MSPu34u5d9g7elXQ9pCcFh7vrO+je9xu1mqmyq0FJfv7pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YOllnpo5dWNYpLH71FGu8iri9y3UuR/Pby23V+tNERI=;
 b=UuQhQqWidNeKiyhQLqG2IjcF4kVFeUlisqXfsTLIOHPJkjfdvwoYSmWOxp68pSUeF8GaAiDvyFWCoAYyv8znZn2+IIwTAlOcz0GCnoxl4DtlgO1lQaTToDBoKpOki/Xg8W6o7AHONorxQeB4WzeOtTObLtiIKIY4hexxr/Jj/ZzU6WxaHLcj/+EWzdnA9f4gPhheNAbWd8OsmumX1VTewFVcQ2WORkRua5Ezb20zaDGBA2MLqlNZl2+h5ZaSTPSL98/qkqzK5pPaQGqXu/ucQU3gEWV/D34ENbYgKDmSYNM2K3lnKeK0roCAmqdQeDYNS+n3HikcSQWvUSRwh35tYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA1PR04MB10793.eurprd04.prod.outlook.com (2603:10a6:102:485::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 02:39:12 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%4]) with mapi id 15.20.9846.025; Mon, 27 Apr 2026
 02:39:12 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v4 0/3] Add i.MX94 remoteproc support and reset vector
 handling improvements
Date: Mon, 27 Apr 2026 10:41:23 +0800
Message-Id: <20260427-imx943-rproc-v4-0-68d7c7253acd@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIANTM7mkC/13MTQqDMBCG4atI1k1JJr921XuULmKMNQuNxBIs4
 t0bhWIVZvMNPO+MRhe9G9GtmFF0yY8+9HnwS4Fsa/qXw77OGwEBSRil2HdTyRmOQwwWAxHEEVJ
 J0SiUyRBd46ct93jm3frxHeJnqye6fn8hOIYSxQQzJ6Uo84HR934arjZ0aM0k+KOgThQyNYIrw
 4TWipEjZTvlVJwoy7RsjBKg60pbs9NlWb6tyU1BHAEAAA==
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
X-ClientProxiedBy: MAXP287CA0002.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::23) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA1PR04MB10793:EE_
X-MS-Office365-Filtering-Correlation-Id: 56c1833b-d732-48d4-a56a-08dea4062a30
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|52116014|376014|366016|1800799024|921020|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Hw9csSOYfZ6XozDHhDoSzClk3WIBLxjNcJaxfw/KNKtp+z3wpsu2trp7tL1d9HVXQ21va1o9IzENKDaI4T1qqQb/MXuMKIRDK7/QUVhwhYC3WIUduJ0txaSH/wytbQ9u15R/aY/+a2sQVpTQuJyWABK2v7HIsQ53ns9PLNGge3GYNZoDVETQ/mTGZ0Ef/QsuOcrHN2cjnI5aiXf1jIR4QqWaEpzJX5Qkq4x82kqE3orN5dqgUfTCWndTVDB42pCiY0TkdhTz99VrdsWmQ15sbXB6zSQ/t0KUdxO5ZVJ3vFEWstAVBWrjCzbbDfJ9hsk/WLeh4CTCnEoAFumPnMxsIIQsm6KPeXGHRz8ns4GmLi6kITbttgTVxpaxUwjoHqVKChw2UUsa2KGB7O5o0EAm5unbZ8kwaZPhYagF+HmG5qmgJb0PIrcTiLn9VwvdPpK4fMw8QKytS/4cvAa2tYw5TYPokoKDJjM8TscJo3rzj7WGgBHJIMP84DWU2IcWXUv/VVJCBhwUiN0BzVJoDwkO4Gi3qKryY4/QgiR6+HWElW2CFJ7XOAHnBth9C7jn2SFLzRvzm8tSFCP/iGbX45EGL1n7JYySdqMT/CAc+QOP4gJl9MEDcmsyetQn0/tfrqJtnipqKPQ6qgvEcodVEhM8j08oFUeMqOPZRXv/+baKwYqk+fhkFNwTkupACTvFi37bi84HjLOCt3WWin4uYE9/6OmSXHRz1O/EKh9v0ycLwAtOFYqZHmu3ktu5v/Yaz6HoymPSoORhS82SsFFzmalIVlPCQzoDVUioejdtOFl+7c0XejwH+wai7hFNo2hj9rpCZuRwF35BLw23EIcfJBldgw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(52116014)(376014)(366016)(1800799024)(921020)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OFlTQXlFdEFyMi9IdHdTWjJ5djVTQUZqL3hlbnhubjFuTU1YaFhscnB0YlAw?=
 =?utf-8?B?cFIvSWV2Yks2dlJrQTBaaUJSVENoK05GZ3lqc2dia0cvMi9Ca1FxbmtnRFY2?=
 =?utf-8?B?Wis0cTBmc0Z0QzBWOGlsZHpNb3RKOEVRVWt4SHIyMmJqcjhSV2sweFA5cVBx?=
 =?utf-8?B?U3Y5Q1VIVHVDK0FFaDQ2Z0dBN0JxQ1lNL2NCVmhJelNkYzV1VzQxNXZMNUNk?=
 =?utf-8?B?VG1WMy9yMUJ2SHNDblFGMEYrWk9LNjF5UHdBd0wwOVFwenNCRXErZngzN21V?=
 =?utf-8?B?ODkxNWRuQmtndW4yS05QR3BkQjZTL0tSWWFsRWVsM243VWoxWnpXSDY2a0Ur?=
 =?utf-8?B?RjhjSnpJaGNqRTB6bW5HQ2RMN0pxS0E5amo0aTN4aWJHVDJJN3ZudXQwenMr?=
 =?utf-8?B?UzY3TkVONFAzUFV1dE1aNHByeFBkY25OOXErWVRUZmdPaEZ6eEZ6SHVDQlFh?=
 =?utf-8?B?SmdJZmJ3UmdoVXdyZXE1YTRDQWpaMWthRERtbjJvSG5WVm0vYkdsaGg3TnJD?=
 =?utf-8?B?TGs5dlJ1SjJZbUpnNjZOektiZThUS2F2bHpLTTBPWGFuSzRUK0s3Mis3Vk5Y?=
 =?utf-8?B?M2ZSa21Sd3RmRE1RNjd2WlIxUUxzd1E1bkRNVkNLYTR5NjlyVmZpZkJnVFI5?=
 =?utf-8?B?K3pyOHExZ0oybmtKR2hjZkc4Y1BRSUNoZDB5UTdxZU5Za3Ziemx2b01XN3lH?=
 =?utf-8?B?TlpkUHE4TG9JTzFsWDV6LzljczdhRi96ajRpSExpekM5ZnNtMGF6RVdSUjRD?=
 =?utf-8?B?Vm9RbjRVZnBKcHFoaWtSOWk5Z1RlYmlESE1sUklmYkNXMWg5aE9DRktUK21K?=
 =?utf-8?B?R3Q0ckYyZHhucWdwWmVvSnVUb2EvbVpldTdubHVweU1tM21tS0pMNXpOZ29I?=
 =?utf-8?B?ODdtZGlvQkh1WElSNGF0KzE3SlBVR1VaWlZvVnBHMDZldU5UNUhpTnpxcnNr?=
 =?utf-8?B?Ykh2cWx2STZKU1RYc3pFZm5jcERQZVIya1pVVmFZMEppWmNvVmxKMi94bDY3?=
 =?utf-8?B?cG4rck1sd05pTFEyYnpZSFA2QjlySnZrdUxkeWFvY2JLL1cxeklxd2pHWnFC?=
 =?utf-8?B?UG5UaXdLS2djV2hCMk03NXMvb1hLalJpb2xkSXZWUno2b2g1eDBLaUFrOEtx?=
 =?utf-8?B?YWl2d2pQWlpNSTR5STJUMFZLMGJ1VndvSzJHZ1YwT3VUVGl6VUgrTjdDUk85?=
 =?utf-8?B?ZFJUQTR2U2NlbXlkb2NveGpNMkcvZlFCak1iSk5PMHYrYkladlpzV3lvQ3FM?=
 =?utf-8?B?SnlMTWNMZ1FabjRBcEZiSXBnMDMzVXo1ZGJMMm5xOHpjLzIwWHBYWmZFb2l2?=
 =?utf-8?B?V3pUQWxIM2pMM3RvSFlPVUpBWU0renhIaXJBejgrQnNyOC9OVlFZaHFHR2hh?=
 =?utf-8?B?ZitGamNnUGZuV01xUmVweUlucmlJbDRsS2IvRWhoMTVxWUhRN3JRdDVlcEVn?=
 =?utf-8?B?SlZEeEFmY0FETVFlOEY1SG9idllxVXVNNlNqSEJIeFNOK3JlTzJacHprOUZq?=
 =?utf-8?B?MlBweHlOSWVYakUzUVBZaklYcFdpWHo4SzVRQTVQYWRpRW9rU1F5c3RzTno4?=
 =?utf-8?B?RWxSMXhHOFZObi9pb05TaXZTaXdxc1c0cG5HZVVxaGJDQjg4U2dFckUrZlpa?=
 =?utf-8?B?RUJVa3g2c2NhMGpOcjY0SE1SU1pUUjRyUldsczl5STVzb0pWL2loU1czaDZi?=
 =?utf-8?B?YTNwazRyV3pXL3h2QlRsaGkvU0R5bVIzbENWSUttRy93aG5zQStMcW9RdWVB?=
 =?utf-8?B?bnYrMzBGUGt5ZCt5RXdUNnh5bWRkOHR4d0RjNE9SNEwyYTFvK1JsMmNZeEhh?=
 =?utf-8?B?enEyeU80UXRrY2VoVmNtVGVqZzFRNGVIaTRuQm53bFU3UE5LSGdvV3NQUmFI?=
 =?utf-8?B?UlliV1JnazhDT1NJQU9iY0d6czdkTUxBQjNyNlUxcWZjd2xxblFQL1dHZTZP?=
 =?utf-8?B?WUsrMVZ3YkNOZG1TRFppaU9RcngrazdBZFRZbXIrY25LUmZlM0lQR1QzUHB2?=
 =?utf-8?B?VmdUOHdlM3lVdUVDM1lPL1dVQjhzVFY1bzlYak10c2ZXK2NxRExmQ21Rd3lW?=
 =?utf-8?B?RmFvVDdwMkZ4d3ljV0JaQ1F3R0Ivclk1QVFSZ1FyNUxCcG9BakI3bFN2dkQx?=
 =?utf-8?B?cHg4VDVoa1JXUnVwVkNudmpudmRSNDM2V2tqdzk3YnBiSzEwVUdrOWQzbDdw?=
 =?utf-8?B?d1hHVmVtQm1TV3NtV1B1dHhLNFFqMlZMdFZIYnN0ZXdJSU5pMDVOYXpMUVlF?=
 =?utf-8?B?Y2ZNOUxsMjVGSllhWTJFYy9XMXh6aitXQmR4OEYyN01ZZGpkeFVBYmVudkJS?=
 =?utf-8?B?TWE1eTdacUVxallsNVhuNlUxWW13UkdHRHZ0OTJyaXl1SXpJbnNEUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56c1833b-d732-48d4-a56a-08dea4062a30
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 02:39:12.0094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0RdrG9Ndu7ydn2Olohk2vXnop1fmiP2zD8mezX9ANOO0C+LBuAJpCh4BvaMxMPaQ8rH0fxC6dX1bnd41tL4NOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10793

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
Changes in v4:
- Daniel raised the M33S secure region was not included, but since I not
  have image to test secure region, so drop the Secure alias region for
  all. Updated DDR region. R-b kept since this is a minor change.
- Add R-b for patch 2
- Link to v3: https://lore.kernel.org/r/20260415-imx943-rproc-v3-0-9fa7528db8ca@nxp.com

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
 drivers/remoteproc/imx_rproc.c                     | 92 +++++++++++++++++++++-
 drivers/remoteproc/imx_rproc.h                     |  2 +
 3 files changed, 95 insertions(+), 2 deletions(-)
---
base-commit: 724699d8d0523909da51fda8d1e10c1ff867b280
change-id: 20260311-imx943-rproc-2050e00b65f7

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

