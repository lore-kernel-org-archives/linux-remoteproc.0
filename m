Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010064.outbound.protection.outlook.com [52.101.84.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA45125DF;
	Fri,  6 Jun 2025 01:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749175019; cv=fail; b=t+auyzZlz0wCliFOudKAQsv5a4PYCoLpyNyKCrMEjUaDtyKMEd/1bc/Wau49g80r9C6eTkdQg9cQ6016iZbnKt1C0zUXmhTY0OySvmILuOPMkTxj8JZm2wQTpoVlIsheZDdHY2QTLjIsYHZvMbdaOxOgeZX8+zYw/ku8JfW4SdU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749175019; c=relaxed/simple;
	bh=zJEMvfI/VQnnKHomfkAy6ygr8nfgooa6ZRc+S7ohHaY=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=TXfU+egih4loLRO4plifuni4ebMe+MAtSQxS8GB1OrDmUKemNjuyKOpPPbSk4UYDBwX0CekbUjVnGgXbisjiF5Ca6MTn2bG4F8tvYE0ghHt5J/vdAkKpQgfXuI92xFrvRqsURWoqNWRPAdgZMin3ewB3EM6VgFRZV7Ak6n2ybhk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=cY8MIAKJ; arc=fail smtp.client-ip=52.101.84.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="cY8MIAKJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CD3D0j91l1pecmYu6/PVd982gd2/U/UPXlYve73HWJ/n8mBab8AqDj5R6jmOaOU9jAyDwXqtVHTYYpKRdIjJhVsAAdQcU3fHUUQ9rd69jgBL0jFZnv1E6FNRjy8BkKnzIzyxGM27267s5Z2vmeqqjgpjyZ2FqaCZQwge9BtSZqv0zC7JLIbuIt24lgp7a4j7fPh8+q2cncQtH3tFtMTJdtxNM6XaMbmUm3JVFBTx2zbAF/aVqyCGc8XW33RCbxtOhjcqsY2PyTSfQRM/oIEXoQRm4DriygH8maejZmT/084lpMuDL4+hWk9YXzlsjVCaUgsYae8ha2Kl7acZVcX0LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+T4NHgZQ6FVHSZw4LvLfB89oc3f8nPd3U1TJKL+cpz0=;
 b=E+g709XpfHd0/Bie9qFEb7kFHihSgUKEtrb5C/qvcITAPYpIRbG4CzvSBUNUGK/WDBO9AwqmYxezQUUtFnFbdPfm3pAi6FWKUqOh6KXuM1S1F3qimBhdNdlXbm6IZL3/T6OZLei0fBSV+E+YFx6BBdZ24hEwDl+VPAdwB1BDIY75Gam4maQju4HDquBHXYhdlnqeLdTJabkVwflPu7IM4WboPp+WZxqk1OluQFJv7uMspKAnTkGssgAknXrUP/kurGdRsIFNPoypgWd55Qink4UJq6qgfXs7hdaTSvqE2xpSmMsTbXFq1gmFDM80nH/QgtmkVfghcZl20+Vhp7GsgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+T4NHgZQ6FVHSZw4LvLfB89oc3f8nPd3U1TJKL+cpz0=;
 b=cY8MIAKJMfhF5cqDSXfkD7iFZxlgXX+VEuHIQREBd4LRbQqHbrtuUjBqPPHENp54VnJmxXgUE/G6VO6z1ZI3nuJ1Cx4drV5YkD9ooWtzrSd3hhHIwwI8izoY3I1Auyr5VZvdQ3X1JfB87CcoBo80ZwM9snb+9bndgsDqfyLrofqR9I5XWfEN0UrPXW93rv0ugnRGmoe7mDMs0TOxV2Bv0dgh9cEzORvz2dFagto7bp3lxycpXtb+v382YKXx7dTBet2geEgj+iFdwq4DQFpAiearZAu8wWalsHG5IkUa7b0Vu7RMagEgefg4VmxvqELeSmusPlsONgEGrm/JBvAguQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU0PR04MB9657.eurprd04.prod.outlook.com (2603:10a6:10:31c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.39; Fri, 6 Jun
 2025 01:56:51 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8813.018; Fri, 6 Jun 2025
 01:56:51 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v2 0/3] remoteproc: imx_rproc: Support i.MX95
Date: Fri, 06 Jun 2025 09:55:11 +0800
Message-Id: <20250606-imx95-rproc-1-v2-0-a2bd64438be9@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH9KQmgC/13MSw6CMBSF4a2QO/aatlJQRu7DMCh9yB3QktY0N
 YS9W3Hm8D/J+TZINpJNMDQbRJspUfA1xKkBPSv/tEimNggmJJNCIi3lJjGuMWjkKNg09a0x+qo
 c1M8araNyeI+x9kzpFeL74DP/rj+pY+2flDkyVJ2VTnLRX7i++7KedVhg3Pf9A+QIxH6oAAAA
X-Change-ID: 20250525-imx95-rproc-1-20bb74ddc8af
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Iuliana Prodan <iuliana.prodan@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749174921; l=2404;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=zJEMvfI/VQnnKHomfkAy6ygr8nfgooa6ZRc+S7ohHaY=;
 b=egB0glMUENWgsftgFAT5XHIOimlX/myfMyAhz68gcZX2+yG5vF8LSx4knzUHgTe0L8bNfPtHI
 msLfX+wPk/eDpnTpJoiA2Bx6vqwQxRrWla0JVQHeag/nZDb1L+7Iukm
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2P153CA0053.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::22)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU0PR04MB9657:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d73f6c3-fce9-43a2-b484-08dda49d6779
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Nk80RzZHYWNuSXNFN2p6cVl0NkJ4cWQ2YURQeFFuc2hQbiswbkN3V0Vuc3J0?=
 =?utf-8?B?dGk0eExXb3lLN01KMjhlOXQva0xCd2l5cHFuL0o0NWlEMHdHamhXcFNDT1k3?=
 =?utf-8?B?blJXcW5zQldlOHdqUnZlMTlvUmFLb0dJcUd4U2FEZEw4QzNCY2JhcWVyS1Bo?=
 =?utf-8?B?TXdqWlYzd1hZYlZadzQzWFpUdkhpVHM2WDhoN3VHRXc5cWxucktpbW9rR1k3?=
 =?utf-8?B?bFBVZ2hIWDVlWExnUUxJNGNEQk5mR0VvOEFIMzMvV1RwT24vWHBIUmpWSHZu?=
 =?utf-8?B?VmtaUDUvSUJwTnZxa01NTnZMRnZzVUtxQTc3MFNaaytnTEo3LzRTSktJSmJE?=
 =?utf-8?B?czY5d3h2UGFPSDEvZkEwbDA2RWxVeXpaUDN0Rk5LdGNvUTJzMitDcHp2UVIy?=
 =?utf-8?B?dFl1KzlLSXRDRHRLN2g3R0NEVlc0amtBSGNDVkhGbFlCa2J5SnhmVXI2LzIy?=
 =?utf-8?B?ZjA3b2dpOWkveWxuZUhnQytVQ0xSZTQrMFN1eVZqSmEwa0M5aHlpRHR2WHJC?=
 =?utf-8?B?aFhENnd6Z09HSDd4bGtSY25zRDFJYi92TmFMaGVsMmNXZmFZaG9WZVVWYitM?=
 =?utf-8?B?RGVzZ2xJUnI5OElYN3Z0aHZCcWthVlVCeVoxZEZzMWwwanpiUzVTNFAvK3dn?=
 =?utf-8?B?dzU1aGJ4TUUrbGVKK0svRFhwT1NwV2NMTi9oaDliS0JUUHVRbWI0blE4K1BQ?=
 =?utf-8?B?Q0JXSlJsa0gvRW9KSlJkZm1DSzFWMityajdSaVJSUVN0MlFySGgwcC81K0Ux?=
 =?utf-8?B?Q2tteDUrbUp6Sk12Q251Um5tZVNmUjM5bjAvM1F1cEhwUTFkWEpnR0NtNGlR?=
 =?utf-8?B?cTJBRFlZcmNJMjQ0S0diYjd6WWczd085SVc3OW5XeStJTytaRWFPcm5EdjND?=
 =?utf-8?B?dHhrSnVpUWRtTklkNlJib2FvR2MyVjNGYUZ5QmVnb0dLOUwrck9wWEZMWkxW?=
 =?utf-8?B?MEhiR0hadldsY2wvYW9GaFR3YkRGa3QxN0RkOUZjVDV5a3dObHpmeXBUY0xF?=
 =?utf-8?B?bzJYS3paektYN0JuQnFkaEJGMnV4dHM1WkdxV1RteC9wNW9sN3YzUms3bXRP?=
 =?utf-8?B?V2NwSzF2UG55cVhZT0lnbjY1dHFKa3NpUEtyUlZLNTZJYXEyeHZVM0RDNGow?=
 =?utf-8?B?bnl6Nkxid1llbWU3dXhXeWNJZkR4SlA4NWNGeVY5WkpvNTgzaWdKc2R1SGx6?=
 =?utf-8?B?V0Z6VHk5WEFUSHdwdDhzRlcvSjY0a0RnbVdQcXVZb1dnYXJ6aGdCL1EvaVFI?=
 =?utf-8?B?WW14ZlM0Y1dFdTBqVnM2TVJ1bFovb2R2Nk0ya0pPMFJlK2JUUmNCSEE1TU5Q?=
 =?utf-8?B?OWRudzQ0ZC9IZk94Z2Z5emZDUXEwVDZCRE9zN1FVOU1pZFA2QU42cjBTUDVs?=
 =?utf-8?B?V2pIeUkvZXo0eVRtNmJtRXltMlZsVDZBQ01RaTExZDV6MlFhUGI2ZzNhc2ZQ?=
 =?utf-8?B?Y1Zld0JMaTB3bXFGcjhEOExrR3M3YXo4ODV1dnFSNWp6OWNraklYY0dOMnhS?=
 =?utf-8?B?Q2FmcFNTUzA3K09FM3dzWEdldE9ETlNjeCtLZFBxV1hvOUdCMWY4NXlNa0w1?=
 =?utf-8?B?eTFUMVJFV01idGVob3BaSHZaTDIwdGNNc0prSzEwSENoa3Z1ZkkvTVM4QkMv?=
 =?utf-8?B?dC9NYlBPR1VCbkRYTzZhTnF5TTB4WmRZQllOcG9kd2pHUnZkTGl4ODNvNUJW?=
 =?utf-8?B?bkpVUFk5TnUvOUZ3SXpsUVliZ3RLd2krVkdOS01lYkI0ZEZoVVFsaFliNDFo?=
 =?utf-8?B?NmNJR0ZhZXd5U0hQQU1lc0Z4MDd4M2MwZUZNYXN5eG5LWlVTM0dZVFJDUU4z?=
 =?utf-8?B?KytzMmdyZTRLV1pVTCtJWG9TMXJtZ2dBYjdJOVMrM3VVWUFjVjMySmZvTGEy?=
 =?utf-8?B?WXZCOXJidE9aeEdidGdiZldPSWViOEhBZXJYNmdYaXFabFdaazBwcmhwRjRO?=
 =?utf-8?B?NzRYR0NGSzZXMDk2WnNCT3BXNDRDSDdHSEpjdGNCQk9ZTDVGT3dVQ1UyMzNT?=
 =?utf-8?B?eUgwSWJaSkN6WEVGRE9vRFp1YnM5c0M4MThIdUJJWFljT0IycEdLUHhWS3J0?=
 =?utf-8?Q?/QuwCv?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUkwNGZmc0ZIakZTV1NXa3F5aEtKcjRrbG1ITGhSTStqNDUxVUFwb2NVem91?=
 =?utf-8?B?aStkcXBieVExWU55c2RzYUROQkdQRk5LTm1TZEROSVNFRlBhbVo4VkNkRm8z?=
 =?utf-8?B?YnVvZ0ZHTTg4U1dpOFlFREczWVoxS3cwSWhrUkNEWkgwdng5M3NqQmlSZ0xj?=
 =?utf-8?B?d0VWbEJzc1daZ3c2MVlYanhsWERSRkRLaS9HTXU4d2JEYW9LcnNuRW1sV2pU?=
 =?utf-8?B?YlRNdytmYTE3MGJZbTVicHJtcEs1bkgveGRja1NJWGdCQU5hNkR1MFgyeEhn?=
 =?utf-8?B?RTIzNGdNQmZYd0JaSEdMYmNyS2FIRmdha2U2R3FXcmhGczdabXpPNWw4NkVR?=
 =?utf-8?B?STNWdUl5R09IWkNkNTRCY1plSHdBTUMvZ3JBWnBQanFzL3BaUnpSK1AwcEtE?=
 =?utf-8?B?eXBPNjRQdW8yMkVaUUVMa0VEVVRaaUh2cnk2ZThtTjN3L2VjTXZkaFlkYy80?=
 =?utf-8?B?d3g1cGpPUjU4N2RuaHAzQU8yckJSQUhBR2U5UHhITGtjWm5XZHFiaXB0dkIr?=
 =?utf-8?B?SWs1NXBaRFo3b1N3VXZwTW5hTkFiejFxQngzMFNKY3A1OExWdFNHT2FVZzB6?=
 =?utf-8?B?eXREa2lrSjUzU1U1aGZwK1VnYmVmVWgzK0dUbEptK3MxdnpvUFdicU1JUDNa?=
 =?utf-8?B?b0VWbFFFeEIyZURsU1h5cGRvUUFQMTFqWnF2NUQva2xwUGk3U2RjRzBCUmNl?=
 =?utf-8?B?bGZzWmUrQnYwQ0FaSlpzMzBsZzNYQ0dUa0I4bkorcGR2NG5BSDl4OGx4SlY3?=
 =?utf-8?B?alduSG9rTVdDR1RHdmk1Vk9mRkp3RFA0MjdrWDd3em1ESE4vKzVDK0JQc3lq?=
 =?utf-8?B?Y2xnSkRqWGc1UVpYT0pwdXdubnRsVE1odjF2dXVBQk0vc2UydEk0TjVQdkt1?=
 =?utf-8?B?K3ZUK2hjYnlQQ3dEdlZMU3VQaWhCVVB6MS8vNkxJcHNBZHo5N20vNFNvZHMv?=
 =?utf-8?B?bTduTm1Ucmgya3FBZXUwbjJNem13aCt5ZTBDcE9rbDVGdU5Rd21BNTV2QUZY?=
 =?utf-8?B?UEJ0YTkyazhSOUJvaEd3Z0k0K3dPYWVnSWV2Y0VGR2ZlaE03blZOUmNiZk1T?=
 =?utf-8?B?VmtFVTdGSHhaOUlGbHZkdndXdkVKanowbmlHQnc2U05Sa0NmdlQxRm45b0dS?=
 =?utf-8?B?N2lSNzhCVTcvbHFZbXNIWE5oMjZ5aWpsVTl1NDZGNmZydkgxMjlYQVZOL3dG?=
 =?utf-8?B?TVo5ek1rdW52K1NIVFBXV3o5MlkvekhPeVlUb3lHaFJpZlRIa3ZEcGZZL3Vo?=
 =?utf-8?B?SGlVUDEzNGRpWVM2NnFRbEJqSkxvQ2RtTWo2c0xoM3ZnOUg4b0ZOZjlZY2J4?=
 =?utf-8?B?a1BkbXVvYjlsbE10Y0hGMWVZSkFOMGdZbTZUQkJYY2MrQW9DL1puMzhPRVJK?=
 =?utf-8?B?ZlZOek9FUnkvREE5WElwRzFtbFdpYkw4NkZQdUdPc1lIYVBxSTlnU0ZuU0VL?=
 =?utf-8?B?TkVUVWphUm1xejFxcVRhMC81NTg1Y2pTaXVaVGVTZ2FEY0NzazRzZkhVOElV?=
 =?utf-8?B?NjBsdWxObWpxRE1ramRuVzZkcmJSWlBxU1ZMT3dDeUpobEtnQ0RDRHNKN0o0?=
 =?utf-8?B?RUFkYUQ3K2VRckh3dzl4ZCsrZlZacS8rVzJtNW5vWEtxbHE3U1c4Yi84NnNu?=
 =?utf-8?B?TUZ4WGdnWG44T0ZnWGlYNEFzZlNyMjA5dHVRQ2phVnVnNTNKaTkzS1NGR1pR?=
 =?utf-8?B?dTN5N2Y4UEhYbFpNTG9rM3lndjEvZDZ2bXZJWFcvckdmdFVsTWJlUmVDTytk?=
 =?utf-8?B?Y09jVFhSdmhqamJnYXZTd1JYZTBaZWFQZUZtYWJOMUdrSDZ5NldjVEhCVnNi?=
 =?utf-8?B?Zm9HQWpPU21kbFZaRVFmUnFOWVdJS1dYZlErY0tUYUQ2WlpLU3BRdng0bVpi?=
 =?utf-8?B?NzUvVVlKNVJJMXNtNmpMZm1YSS9iM3FxMDhFRE1raThVekVwdjhRVkI5cEdq?=
 =?utf-8?B?alB4T1YxeTY2eVlOZXlEUHhrbEF4SE9KVE00dzhjZTFxV1hvMEtEdzhDUVlL?=
 =?utf-8?B?REswb1BOWWlDaTRxS1hUR01VWVg2VUFqSS9Zdm1GV00zUjJMckMvVDdGdUp1?=
 =?utf-8?B?Rm9QcVVNZjlLdFd5WkhIWStpZlg3UmN1aGZQMG11Q1VPOFE0R0M2SFRDNitl?=
 =?utf-8?Q?eHYvWOw5jD3HLOHWtDaweX53A?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d73f6c3-fce9-43a2-b484-08dda49d6779
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 01:56:51.6688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GhyLl4qXb1FE2q8hsDZr6BHeHqkOHI6RS14hm0oMWtlMBI8Isfw7YvD9eOWJFXP9n6d369rSDZeSmY0Wy/p/Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9657

i.MX95 features a Cortex-M33 core, six Cortex-A55 cores, and
one Cortex-M7 core. The System Control Management Interface(SCMI)
firmware runs on the M33 core. The i.MX95 SCMI firmware named System
Manager(SM) includes vendor extension protocols, Logical Machine
Management(LMM) protocol and CPU protocol and etc.

There are three cases for M7:
(1) M7 in a separate Logical Machine(LM) that Linux couldn't control it.
(2) M7 in a separate Logical Machine that Linux could control it using
    LMM protocol
(3) M7 runs in same Logical Machine as A55, so Linux could control it
    using CPU protocol

In patch 1, add fsl,lmm-id and fsl,cpu-id to indicate LM ID and CPU ID
In patch 2, Use LMM and CPU protocol to manage M7. More info could be
found in the patch commit log

Current setup relies on pre-Linux software(U-Boot) to do
M7 TCM ECC initialization. In future, we could add the support in Linux
to decouple U-Boot and Linux.

Patchset was tested with below boot images when the patchset based on next-20250526:
imx-boot-variant-rpmsg-imx95-19x19-lpddr5-evk-sd.bin-flash_lpboot_sm_a55 (Use LMM protocol)
imx-boot-variant-alt-imx95-19x19-lpddr5-evk-sd.bin-flash_alt (Use CPU protocol)
imx-boot-imx95-19x19-lpddr5-evk-sd.bin-flash_a55 (M7 not under A55 control)
imx-boot-imx95-19x19-lpddr5-evk-sd.bin-flash_all (M7 not under A55 control)

Patchset is re-based on next-20250603.

Thanks for Daniel helping review the patchset before posting out to list.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v2:
- Typo fix in patch 2 commit message
- Move the m7 address mapping array from patch 2 to patch 3
- Add R-b from Daniel to patch 3
- Link to v1: https://lore.kernel.org/r/20250604-imx95-rproc-1-v1-0-a6e5f512731c@nxp.com

---
Peng Fan (3):
      dt-bindings: remoteproc: fsl,imx-rproc: Add support for i.MX95
      remoteproc: imx_rproc: Add support for System Manager API
      remoteproc: imx_rproc: Add support for i.MX95

 .../bindings/remoteproc/fsl,imx-rproc.yaml         |  27 ++++
 drivers/remoteproc/imx_rproc.c                     | 146 ++++++++++++++++++++-
 drivers/remoteproc/imx_rproc.h                     |   2 +
 3 files changed, 173 insertions(+), 2 deletions(-)
---
base-commit: b79c044712e34fe49e7b85ffafd0bd460b5c4afa
change-id: 20250525-imx95-rproc-1-20bb74ddc8af

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

