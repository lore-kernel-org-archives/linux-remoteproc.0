Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011035.outbound.protection.outlook.com [52.101.65.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE78540862C;
	Wed, 23 Sep 2026 18:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790188998; cv=fail; b=aIKIPt5YuADR/kc21zSgkpyEPEeifzMb1NtudNt7Yjd/15HTkSvKFDNjGyDNkWLvn9Nbx8zvSAnq57X06qTxbUG1WfzzXwcs+CGYYNuFRqkWLYR5Pra3GEOjcwGB0Wx14uK+ydZA2lD3R+16T99Y4/xq+xE2SgFl8atDM3g2oSo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790188998; c=relaxed/simple;
	bh=Ng2yeqyJdw3WTrGK+2CwkaQOPJl1612PuPgsK0tulrI=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=uVzt344PARSVMj6SdeEvlYPKOgRMRQK0jrnnb2xl2qiMANIUCBxHtjMPRzQvDtyTpcCC1qeYpBF00BAucYk9UWMFJO1kKkb773CPU0QGdX/XInHtCGmC0J5yZpIrz9tj2TO8/Voz+/LotuS9HCddPR/C960rjiaz9QcLrd1FP/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=WvTZJHQf; arc=fail smtp.client-ip=52.101.65.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="WvTZJHQf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zHMjdTuHgemeBbpVqI5+aqMYeWT1iPpwgEdpRs8YaS9OMz50YoAG4Hw8167+xGGkb96qGuDwEIuqZARvZ/4Bjdy6pyI+YDbuegNOnRpJF4Q3i/LpS2FPgqyHKJXUkjM159Xf5xfLjILHw8FfK7M0qTUARJ417ucEDWPVJAFvPByl6wy7AGAZMvQc81CWuVLDbV+GH5A+AHaKBuxRWMMnLZmYWzG6+GGAnjNb0R+Okl4HDFLs6YazPV6OfeI9RmdCEhs5PUw0iT1rec8jJY5gJf1heb4S8/5iHHFNdbiuT+lO9FzsCJ7KpRVsLZNH8Cv8PHtgHkpWhr0PesVLanRSnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ainme5Cm7jZHCwHCYT2/Gi69JUiNaIXPkuZCJk951cw=;
 b=mVEsVIu4qTXJsTKesJvwjjeTbeA5Unkz3doQxpXdMx4GU+3w00vqyHKHM6E/u0T/KH2ncYvXKwD0wlETzhdsSUGCC9aX+0ez4ENETitlnTYW1tM8z5j625eEV4rE1AkxJAMbldr114iROPST2EdZwpkB9FVVY6h/uEUD5HMSfoAtSOTOm3IG26P10MJ9Y+QcyJiZe8JWzm3V552zR+H9IqaLWl09xE/JMqaGrJupYIRXSyrlu1RTA1TuAk9bQzG82gQ45G2s0AfAvcMsOtlVJcDPOoraRAg2+sG8wByVzb/paMWs8AVDVeqtMpu21ZpqRCdbJ2pCa9umkMAHuR/oVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ainme5Cm7jZHCwHCYT2/Gi69JUiNaIXPkuZCJk951cw=;
 b=WvTZJHQfcKRYplLXDXx4ehmU2Nu6NVPw1BmUJ3qkB39/XcjhahPEOwfOnYuWs/G00XHd3MASj1xGuKSl+ZaAtT7xTvSawGlrNHDjPBuyyQrnRGZ6QgXBGGP8h8o0RVh2XD4dxzhWQqpKdu4KSqwwfmx9HPJIg9y31yZi+TfYhTKfdaCmv/+6kievmAjyIuZ91vhOAqh4JDp+pnPob8gAS8nEM94KSkCSdHiubHybi+acjhW4NoK60Fmim+OidFXtjAK5bdxPVsS3s+OrETHoSQHKIxudRvIlHGJUk2UTz/BxQsCzYFXIHdOeiwUiwjDY/zic6lz7svtfDjUahmF3Vw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB7135.eurprd04.prod.outlook.com (2603:10a6:800:12c::22)
 by AM8PR04MB7298.eurprd04.prod.outlook.com (2603:10a6:20b:1df::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.17; Wed, 23 Sep
 2026 18:43:12 +0000
Received: from VI1PR04MB7135.eurprd04.prod.outlook.com
 ([fe80::322f:adc4:8d65:2ba4]) by VI1PR04MB7135.eurprd04.prod.outlook.com
 ([fe80::322f:adc4:8d65:2ba4%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 18:43:12 +0000
From: Shenwei Wang <shenwei.wang@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com,
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	b-padhi@ti.com,
	Andrew Lunn <andrew@lunn.ch>,
	Shenwei Wang <shenwei.wang@oss.nxp.com>
Subject: [PATCH v16 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
Date: Wed, 23 Sep 2026 13:42:27 -0500
Message-ID: <20260923184255.299034-1-shenwei.wang@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P223CA0005.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:338::7) To VI1PR04MB7135.eurprd04.prod.outlook.com
 (2603:10a6:800:12c::22)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7135:EE_|AM8PR04MB7298:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c26f30f-6b72-43bf-ae5b-08df19a28510
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|19092799006|7416014|376014|1800799024|921020|3023799007|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	VEL4w7wyWkUNJQOI37yZziqIevNEvN7d8YGVfeNF3urtjOQ97l+O9fcZmfw9c0TgZwsMfsIdMu5jwpckLkuiF0wZ9gPUrJ1S8IQ71/fKsUY47IYZ5Ehq0OFjH1Pp+YGnd3TwmzB5saC+tDMr0yJ2V54ENFMxN/XYKhEAgNPzsQkLChPOWry7iN3I22+sJZY8m3dBCJXETFjI8vlyUKEWXnzS+YOCTDcbbMclpVUEA6VNiwIBY1ZJEQAc0ntZbN4AcH06pWyvPR/tZk9nrbBXDGScu5fGVFNKErI2IR88SaFE+eDmhSD28NomSNgH6Z45XfQDdp8HF6CWzVSxfmDM+tIiu61FKOYfAV4lduKnNYTqusjfKROvPmtTZDRzrSk4E8kDxI8QV6UrjhV5t+eZDKQR2Ew6uf/WLAFzpFqAkDvuG5/VxkuwE9RAyVY6HxeQqXSncPzKiHcJypbQX6Waz29jLssEuoE4rO7AA+2qXon4Z6WJZhw1P9iM4GUgHy8Eetuem0rsZEntSxc6OOCMdPDuM73TvHBP5XWx+uX435vsPXDCY1ehFCpueuDpmssQBsLi79rMk4qvUYLuvYLUJgg+k+ZYNJ9K9wH2h1MRkkuZf3aAUTPu1UWc9YcMXvDrzDNNO65u/2OrR0k8n8TBukTOUcjzUmCJ4S22UepMDt9XJyEqXpBKgKMdGIQriZIwVO62lGcZy2qwEN3kawlKXw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7135.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(19092799006)(7416014)(376014)(1800799024)(921020)(3023799007)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWtVOUtBT1JoUXdScmtrSmVoNmhOUFYrYi9vNWt0Y0VnVDZ3VXJIYjBRSzQ1?=
 =?utf-8?B?OGJpMTUwVDVaUlQ3V1NqY3Fhc002b29VQjczMSswTFpGM0dEOUJNdTdKbXJ5?=
 =?utf-8?B?aDlhSE5LSFNLWSt3NE8xRStxWDlmOTNScjYxcjQzZnY4eFJNU0NVOGp6RDZS?=
 =?utf-8?B?WWdBOXhtSzdWWFFKcFJSRStmakdXSzYwZHNVVmFwQ1JVZXE4T2pVaTJLaTFG?=
 =?utf-8?B?dWowcGI5bmhyd1p0K1dDVDI0RUw1cHpFNHZsVmtzSldxbkxvWS9vWWRiZmVv?=
 =?utf-8?B?dFVlODgzYm84RTRkYTVsMDN4NzVoOFpIZ0ZRRk9ETU9aRXNYSVVRTjY3aitu?=
 =?utf-8?B?M2xjSkc3TWhVT2hVZFZNT09GKzVWYk1TUmZpcER1UTJXd0o0QjNYZmpQTFBT?=
 =?utf-8?B?Y25XRnJQY3FUQ0hxVkMrN3FmVis4UGI0c2w4SmpBVktXYU9KVit0M2xYb29r?=
 =?utf-8?B?MFdmMUl6V0tkek9zVkZlQWNmdkhCUCtqejlLcWtoOTQ5d0pOOFdHNVRCNU5H?=
 =?utf-8?B?Q2RHN1RNUzIxREo5UWxyNHlycnlwa2NobDBGT3BTQzI3SGVLVmtKUGIvdWJF?=
 =?utf-8?B?YzYxM0xhckZnUStONllrN0hXTkJCK0NwTjlDRzR0UjU1Y0gyVW15c3pnUGo1?=
 =?utf-8?B?Nm4vT0trOWJxUVRSWDczV2pUOGFCOGd6YThSVEF6UGMyRGlRRjk1aXhDSWxy?=
 =?utf-8?B?RHUzbDNsRVU2MGtFWlpiM3pKVHU0aWJ2KzZjclp2dmdYVGZSWFNtTzQ2dGQ3?=
 =?utf-8?B?R3U3V3kvYXlWalJvM1FKVU1HcUFmUmpPMW5VWVNpMVdkdFRSRlh2ODZ6THNL?=
 =?utf-8?B?Qk1PS1NmVVoxaWlLWnJKOUg3UXFQQ0dOYXF4dDdkR0NBZVFteWMvVm5ZTXM1?=
 =?utf-8?B?TEljTEJCbXNORHlrU1pqckF2bno1bXk0S1p0MGcxbVZHdFM0ZnQwTTBnMWlm?=
 =?utf-8?B?TmhwcDZSaG9XMnpoRXRpeGtsV2dwUlpKUHU5WU1WdzJHK1FxMlUvYXMyc3Ar?=
 =?utf-8?B?V2poU2tRU3d3aWk4K1VzRkk2bW9hYUJMWDV1UVhQSHI0dy9hakkyM2JKM2JQ?=
 =?utf-8?B?MjBIM0hTbVJDekZMS3FwRUk5MXROUWdyQm5xbUdYb2NNRXJnQkNGMWk1QzRN?=
 =?utf-8?B?ZEY2S0R0RFJuK05JeTZXbVZaVGhRSkc3MFhPTGE4eXQ2Y0NoOUxBcDVIMW1x?=
 =?utf-8?B?a2xLaGNSMDB4RUV3MXJLTThNUUVWd0ZkY2JJRGVQdExOaHNrMTFUSzNGbkZT?=
 =?utf-8?B?UlUvMDRZOEJFcDY5USt2U1JHZnRqdEsvbzJBM3JGRTlKbmxNeWNWTVdtQlhY?=
 =?utf-8?B?SXFSVGdmTk5Cd2FuOE9mVFpUZzFZb3hld1N0b05nTEdQQVg3SUdXZldpRkVz?=
 =?utf-8?B?bWxBYXA0Wi9OcHYzS1FhNUtQWjBoTTF0MUpGeHN5MWJxZWRNT3k3dWMvam5P?=
 =?utf-8?B?VUZDVDZnajNGQkhkaUJwVER1bjRBWVpJY21QYjN6bGg4VXlCUW02NVlVL01n?=
 =?utf-8?B?ckFWSzlhNmtLb3JKc1Y0Z3JLSnlMZ0dJbG54aFZQejdtOE5YYk15ODBRall5?=
 =?utf-8?B?OVBrRzU2Z05NUlpaWCtpeld2QzVOdG1iRldqeDljTWE5YmV3bkVpN0w5Ykpw?=
 =?utf-8?B?K21FVWRjbnhUaHhqYXdDcDFERkV6ajJXeVhEbE9YZ3VHQnFjQzNENjlWOUZW?=
 =?utf-8?B?SGpOejZEYm5sUi9BQytCNkJoaWN4Q2xrUGZtQmJFRGNlK2g2SitqdGs3MWNO?=
 =?utf-8?B?SDVYMDBua3AwR1B6QWlybGJUV1lBakl4dGFhTUVCR1E2alhsckxHWkpiRzZL?=
 =?utf-8?B?TEtRbU1qRVdaY0pSdmdKNS85VFdsL0ZWN1dvdlZzWkVKd2NRUVpEK3Z0aE5Q?=
 =?utf-8?B?RHV6aHo2RkN4NG9ZTTY4M0QyclJTUmtrTGIvUnhWbm9TMVowSHExLzFGUHNH?=
 =?utf-8?B?d1p4bWpsSzA0Z1EwNXFPUytTRms4cGd5cytQYXBWUEpoa1RSWGRRd3JKblJ3?=
 =?utf-8?B?SlBDT2ZUZm9NU0FkN0loQTlMK2laVUtKc0h2KzExRlhILzZ2QW5uUzZuMGpK?=
 =?utf-8?B?NUN0WC85cExLdXdTM2pCSjlDM0lsVjhUYVBPTEVYcXg5dFN3OWd1KzB1R3Vh?=
 =?utf-8?B?VHVxUkt1VXZSeUNhdzlmTkJVSmRVYVNPSllXTmY5WXNUaXNjeTA2WkNCV215?=
 =?utf-8?B?Sk40VlBBZmdRbE9xbWErQlRYcmhoMHhUWkppcTJJY2tqWFRyWHljU3dsejR6?=
 =?utf-8?B?N2pURjQxVStQV213V0ZNWnJaTGxJM1pCdkduWkN0NHhCaWlmYXRvSHhGZzk3?=
 =?utf-8?B?a3pBZDJCY3ZVbWNiOGVlUlZ5aFRyem5tMzRaVERRK0EzZmpjM3JGZFp6VThS?=
 =?utf-8?Q?Vdai+2TgLvu2H/V3SZ83cOHzA/h2SF22IzMfX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c26f30f-6b72-43bf-ae5b-08df19a28510
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 18:43:12.1605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SUChmIN+Qibraxf3kK/FF4Rhp+gq3ZZ7q78wFs7xRC5UIEZ47hmVzmpi28FixIDsrQ0g6P1t8V+V4C1vMwVp1EvlL7PmtPSqdI2zzXlM1Sx/5enGmEjOqttl1peQ4rb/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7298

Support the remote devices on the remote processor via the RPMSG bus on
i.MX platform.

Changes in v16:
  - Removed linux/mod_devicetable.h and an extra comma per Uwe's feedback.
  - Added the "packed" attribute to struct rpmsg_gpio_response and set
    "can_sleep = true", per Sashiko's review comments.
  - Removed the channel node from the rpmsg node in dts layout.

Changes in v15:
 - Update Kconfig description per AndrewD and Julian's feedback
 - Enable the GPIO driver even without a DT node per AndrewD's feedback
 - Update gpio-rpmsg.rst per Mathieu’s feedback
 - Code cleanup according the new gpio-rpmsg.rst and sashiko-bot's review
   feedback

Changes in v14:
 - Update gpio-rpmsg.rst per Mathieu’s feedback.
 - Align the rpmsg-gpio driver with the revised gpio-rpmsg.rst.
 - Modify rpmsg-core to enable prefix-based matching of RPMSG device IDs.

Changes in v13:
 - drop the support for legacy NXP firmware.
 - remove the fixed_up hooks from the rpmsg gpio driver.
 - code cleanup.

Changes in v12:
 - Fixed the "underline" warning reported by Randy.

Changes in v11:
 - Expand RPMSG for the first time per Shuah's review comment.

Changes in v10:
 - Update gpio-rpmsg.rst according to Daniel Baluta's review comments.
 - Add a kernel CONFIG for fixed up handlers and only enable it on
   i.MX products.
 - Fixed bugs reported by kernel test robot.

Changes in v9:
 - Reuse the gpio-virtio design for command and IRQ type definitions.
 - Remove msg_id, version, and vendor fields from the generic protocol.
 - Add fixed-up handlers to support legacy firmware.

Changes in v8:
 - Add "depends on REMOTEPROC" in Kconfig to fix the build error reported
   by the kernel test robot.
 - Move the .rst patch before the .yaml patch.
 - Handle the "ngpios" DT property based on Andrew's feedback.

Changes in v7:
 - Reworked the driver to use the rpmsg_driver framework instead of
   platform_driver, based on feedback from Bjorn and Arnaud.
 - Updated gpio-rpmsg.yaml and imx_rproc.yaml according to comments from
   Rob and Arnaud.
 - Further refinements to gpio-rpmsg.yaml per Arnaud's feedback.

Changes in v6:
 - make the driver more generic with the actions below:
     rename the driver file to gpio-rpmsg.c
     remove the imx related info in the function and variable names
     rename the imx_rpmsg.h to rpdev_info.h
     create a gpio-rpmsg.yaml and refer it in imx_rproc.yaml
 - update the gpio-rpmsg.rst according to the feedback from Andrew and
   move the source file to driver-api/gpio
 - fix the bug reported by Zhongqiu Han
 - remove the I2C related info

Changes in v5:
 - move the gpio-rpmsg.rst from admin-guide to staging directory after
   discussion with Randy Dunlap.
 - add include files with some code improvements per Bartosz's comments.

Changes in v4:
 - add a documentation to describe the transport protocol per Andrew's
   comments.
 - add a new handler to get the gpio direction.

Changes in v3:
 - fix various format issue and return value check per Peng 's review
   comments.
 - add the logic to also populate the subnodes which are not in the
   device map per Arnaud's request. (in imx_rproc.c)
 - update the yaml per Frank's review comments.

Changes in v2:
 - re-implemented the gpio driver per Linus Walleij's feedback by using
   GPIOLIB_IRQCHIP helper library.
 - fix various format issue per Mathieu/Peng 's review comments.
 - update the yaml doc per Rob's feedback

Shenwei Wang (5):
  docs: driver-api: gpio: rpmsg gpio driver over rpmsg bus
  dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
  rpmsg: core: match rpmsg device IDs by prefix
  gpio: rpmsg: add generic rpmsg GPIO driver
  arm64: dts: imx8ulp: Add rpmsg node under imx_rproc

 .../devicetree/bindings/gpio/gpio-rpmsg.yaml  |  55 ++
 .../bindings/remoteproc/fsl,imx-rproc.yaml    |  46 ++
 Documentation/driver-api/gpio/gpio-rpmsg.rst  | 242 ++++++++
 Documentation/driver-api/gpio/index.rst       |   1 +
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi    |  23 +
 drivers/gpio/Kconfig                          |  17 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-rpmsg.c                     | 585 ++++++++++++++++++
 drivers/rpmsg/rpmsg_core.c                    |   4 +-
 9 files changed, 973 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
 create mode 100644 Documentation/driver-api/gpio/gpio-rpmsg.rst
 create mode 100644 drivers/gpio/gpio-rpmsg.c

--
2.43.0

