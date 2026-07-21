Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011064.outbound.protection.outlook.com [40.107.130.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED333B1ECC;
	Tue, 21 Jul 2026 20:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784666901; cv=fail; b=gC1ts4NzEIzHuZVTR6DXkCkFsY0qFY12Fe5wwa8FD6auyZwLb9tn3s5TBBcPQvtSLR/zoPEkjzOkXQ6EpfDKw/xhZstztIWheBBDZDn17/UeTNAQPgSzE2QU5UiphxRQuOYSQzAx5fgcWhGFXsA5Nz1V6IowNO/wXzZu3QP+H08=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784666901; c=relaxed/simple;
	bh=RjFnSPR+8+r+QFiJnHrLIDaSp8m1gDCwilV6nCh7Sys=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=PGVyz/WBsNCpDD8Ql1+taR5zBzuTlZBuA3g29K1UU6IPZsWMS1+DtdBNmlhtKjKMc6B/ucXWVxsRLXnruLpKjep0FPFxx32RQ8iryNqaCN+lYAjp0ZaVwuJJPACb9ISZpjCsgFXor3QaF90dMZ+wKFa4G5S3lQgpRhSm2HmGLpM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=is6+Yr9o; arc=fail smtp.client-ip=40.107.130.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="is6+Yr9o"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gO+RkIna1JToXgOZdtCzQ0yItkrRspGKvlaHrR3o2qpO9zplUU10L4CE6vB25nb1o264P0S2VpJjgq+Ru57pwhHJm/V4gBZbIBEIYp7BXdKpFZb54Yj05I1AjadpPVOKdO5WXyr2WsQOid7sqA3J382Yg9fDOqtgyjwn6hTA4402/f6br7YY2jrqguq21fyxpK3dFQPIfmX2oi8iNApITa0KrSnYVTD43uU6dH0M7keitPbZ5fvPR/McAAipx7eP/3WyPv5yk9uTohGw660SVuiyAEDT9EpfS1JPl3mx++yhgKYLAJ5pAlb9XWlWUnarZNy3Jw9/2DiKZJSal4C1Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J3UNPgPIaUOks1O8aeL/wb1Z44+mt7SyMd3JXMTju+Q=;
 b=OClSevf0IF3MY6BigU4/Pikdy9Umpvyna45iyEp1b7CYuwG0fIHVSkLRhMIB++wkE3Un9p505uPjkFPx6x9t8j7KfOy+HaQtu07VQVD96XKe8OA2aCU2psKnCiuh4cGjLyMqS/7x2W9uzvA4mdV9+I1SnhfZawxOW69V8fNQu3Q1ZbFCQTJEUs8tBXh4DIKfu82dlAPPK98p7xgAdIShhuGsMuYCzFIPygGtztX7n9CXkVFJzn035jCqHDrPBg5+hPV6hKdUF2OMPkBSsRnHgofVs8cCUFt3ykYj0gMjtvc2Mv5DADXpA+g8t/J5w6P2GgPIS6yvghyLuEpB6ADmLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J3UNPgPIaUOks1O8aeL/wb1Z44+mt7SyMd3JXMTju+Q=;
 b=is6+Yr9o5Wo467/8uCAyUHV4yK3ghWY9URzKNHjhLE54FKEhF5BAEsalYBggyU8uH1/ihHJmAO7wEq/rCeGN/jAyTdjtv3zOydVhQZBzMCOFi02TeOR9OUHBE+gBfmIBGpaDb53LwD6KO7OIeY6RqArQv8ktJPqHmXHxHk8uuJ01A5rsVRG8od4hiORfFvWwmaYeKgQB/vznQUnEtLopLjbRXt8uQ3AB+W8oxl/FTKf95hGOzhZXFSAxONJo5w5Qq5jPbJnqrQ4Mr3LjWXukWjF15uiLtXEwmDkCtXc1Q2lBatV04QyHdJbbyGu982JcrecUhnszd1ufQncfDerqZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB7135.eurprd04.prod.outlook.com (2603:10a6:800:12c::22)
 by DB9PR04MB8284.eurprd04.prod.outlook.com (2603:10a6:10:25e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 20:48:08 +0000
Received: from VI1PR04MB7135.eurprd04.prod.outlook.com
 ([fe80::322f:adc4:8d65:2ba4]) by VI1PR04MB7135.eurprd04.prod.outlook.com
 ([fe80::322f:adc4:8d65:2ba4%5]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 20:48:08 +0000
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
Subject: [PATCH v15 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
Date: Tue, 21 Jul 2026 15:46:43 -0500
Message-ID: <20260721204704.400781-1-shenwei.wang@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR11CA0075.namprd11.prod.outlook.com
 (2603:10b6:806:d2::20) To VI1PR04MB7135.eurprd04.prod.outlook.com
 (2603:10a6:800:12c::22)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7135:EE_|DB9PR04MB8284:EE_
X-MS-Office365-Filtering-Correlation-Id: 42bab1e9-cac6-4950-7c20-08dee7695e48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|23010399003|7416014|18002099003|11063799006|3023799007|10067099003|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
	X6C4FGo4UN3ST/TKZItAV+09WjFik7sxAW7pQ0FaTt/bv7J7bsTB4I/GOch9OE1dhnm1LAnuury/IxIe91R4fdch7ZOXy0QbLRluo06XxVIZdALU8DPzyfrHHpvElZEsJ/e4ZCiz1HW8qsh3NXdOUOGBI+He7IZRWBlSKLpn5j7zvGxxrYCRLZJvWyfPz9XjXKJ3Eon0KgU1zP/UeeYmLn50wQJ+ZcJTEIFAsZ6+6Jc5BNyC2BXZvQtCbR1vDCDY7RrJqDonANieV29mvW/HZqOI2iWxh8/RfjeHnRlSk3TA/S5BVJd+mp9lBhi0zUENlfSAL3immR2/GNezRjKUjto5U4EdOYydVJ9XhGrkI+wh62ylgPuuVFyotcT6A/phjRL9nEEanfz142j7MOVfxMI9pvdaGHuvaaL5u5O7b1u6M3Q7ej+PFCPuKUSLf4ami2u0UGwyEFW87ofdgfO98ly4QCaXC3jT6uo9KKsfipQdqpPDS3hgXdtiWNrrGJ8BrxtzNzgA7zlSXON++h3LtBckyeqVQHVjQEvks1FUgaS9s6KTDkIWEqVBlg4nhCW5UFYLN11n5uPBXuf9OGr4sJCBaN6ZfWFV6igrQ1YxuOgu3mr5xJwqD951ehJ224vtN2nSEAF5Zkzw6TEZxFVhZRIpL4BxHcUbSCY5NL81V2h5iji04lXI0DRId/vDTuarAmQ/PErX3vYxXSyFM5vNlw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7135.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(23010399003)(7416014)(18002099003)(11063799006)(3023799007)(10067099003)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmZVU01XTlRnQUxCRS9vaS92aVFhaU0xU3o1Z3NSTXVMeUxPM1ZoYUVkdXhR?=
 =?utf-8?B?T0RJNndvYnVWKyt2QmpEYitGeFlGeWEwYkNnUkF2bHRUZlQ1M3U0Um5kcm5s?=
 =?utf-8?B?M3ZaK1FzVWRERHdWYmxYVDkrMlkzYWFIUXJrK2Q0NEpRdXBpSC9ENWFRUFlW?=
 =?utf-8?B?dWtJbTlrMzh5bHVKdVJnTTJkN1IxcHVCdmJLM284UmNMaUFRdWd6Q3J6a2RK?=
 =?utf-8?B?OXVpa1Q2TUlNR1lDUFlyOEgrTzhyTU9UYjhraEtLQWFNYkh2VDdMdmlTK0o1?=
 =?utf-8?B?Y1ArcXNwbEFiNXJkRGtPVDVpd3JpYjZXc2FjdDRKM05OTXlKbnBFdk44Z1Uz?=
 =?utf-8?B?VGZnaGZWbllOMENmMTY2UFYxWWZheXpmM0NZSDVxZHc0QzhLdVFlQmJRdkZN?=
 =?utf-8?B?VHpnZ3UwbldsNlhxbVdFTTBYQWJLVFFmUmVGa2xLYlRseWhWZjNOMDhvTFlw?=
 =?utf-8?B?MUpaeUNieFJWcE5QU0xUYTFxOGJmYWlucTQ2Umg1M3BOeTZ4RitLbUY0NWRO?=
 =?utf-8?B?YjB1OTJiVnhNSDVhZTF1TE5kKzkvTVFmcE9rRUNKVVRtZHpjdmQwM0hkeU8r?=
 =?utf-8?B?Ukx6WVZURWhTWGxMc2NNeDJwUm1NVnhweEY0SWpHT2QvSHB3Q2FFcjJLVGFk?=
 =?utf-8?B?T0kwZEt4WlFGN1V5ZmpvbHo4YTk0SDBtM3FXcXdraHYyZEJ5SE9oMUtib3Fy?=
 =?utf-8?B?M2F1emduWlhBMTVsQTg5bjZiQmZSYTd5ZGcwM3FBYXpnNHBjRlN0N0toZ1NC?=
 =?utf-8?B?R3VVbVdDSVJ0QVJoS2IzM1BMVjZvR0ZPQUtPUkZpMytWbDQ5TWI5YVFBUjRD?=
 =?utf-8?B?bVVhcm8yQk5kZUo1bXQzYW5SdmRaRU5QRlZjN01SRjZoOG94TlpSbENPbGFs?=
 =?utf-8?B?Mk5Cd0w0ZkpVd3Q0Wm9MRjQ5QmNDVWJaL0xyQ05yN1hWdFREL0dPU0tFbXUv?=
 =?utf-8?B?ZThuMlgvbjIrNmtVZjlTdmFCZ0xPUG5mem5PMXpPZm5pQjJRZ1pNV1lNQkU2?=
 =?utf-8?B?VUUvNzladmtBanN4Mks5cC9PSE0zdlRmL1FmQ3YrN1Y3b1V3WGorSUtJR0Ir?=
 =?utf-8?B?dXNkaENRYUFjVkV2S0hSeEwyWnVUYkRQYmpjSSsyT1M4Mm1hajA2ekNhak9q?=
 =?utf-8?B?S0srR2RBK0lZRnNZTnFBbytxemdncjU4clNhNVVodG5PcU1Udmw4WGY1K2Vt?=
 =?utf-8?B?UjRVVzFyemszUktKKzZha1QvaXdRaGRidGVLaWNaalhJZmVyMEoyb3BNRmFy?=
 =?utf-8?B?YTlUQ3VRNStLVXpYRE5rdUJZcHFkeDhuSG91YitpVjJrQTZPS0JMMmF1RkNK?=
 =?utf-8?B?d2srQ0crbUpKaDBnelFJdU1tWHNuZlhlUmxEZjZMV2k2ZURZWnZaY3p2YlU0?=
 =?utf-8?B?TUl4RkpXQkFoK1BvaEZCcTNQNDJCTWxQZWJLUmFZRk5sTmgyS00zYzVZdW1H?=
 =?utf-8?B?bkNXMk9uRDVzWmJ2a1dkMkRGRm5WQ1V2UWk5dVNubzYzUUJ1LzFyQ3dBV3Z5?=
 =?utf-8?B?WFl6V2tkMjNtckhBVlR1V2VOOUhLT0R6MTUwQjJvNkx4eWJhV1Q4NjJQTEFt?=
 =?utf-8?B?QlNteGNqakg0RSt1OXBkTkVXaG1sTHZaTm9Mb1drS25LVFFORnQxNUIxZnBS?=
 =?utf-8?B?R3VGeVhONS9iSlMyVE9TVkJrczZWUVMrRHFOUkJOY2JNK3BXODRrODVDMFlo?=
 =?utf-8?B?QlhQYTJBbEQ4ZE0rRC9ZUmw2SDRLZVd4NDZOdDZCZGNyWGtUQkRUQTN5ZUp3?=
 =?utf-8?B?WjhjMXdxRG5GZFlOd1diMHBDNVE2TURUZkZMZWorMllVbXV2V1ZGdUdJUDNz?=
 =?utf-8?B?eXdFRko5WEhqU3VieXRlKzVpRFU3cHViV2tLWTR4Tk1iSVQ4QUthNEgrdEdZ?=
 =?utf-8?B?alFkdW11eUJRTlhLSllJRmpRTWhwSVA0eGhCS3g2d3lpNnZLNnMya1JSMnpJ?=
 =?utf-8?B?c2N3VFR3RUlvYjZxSEVnTlhoZ2drbVRMVVNxdGEvZVNSd043Q0hyVzRCNWR4?=
 =?utf-8?B?NHhubjFscGVwZ1F2TEFaV08vZzhvMWZKMXdHbGowM1lZQVA0RUdkRklNQkRF?=
 =?utf-8?B?TDJpYkpWTkhZQU4vUGtGTy9CN2p2WGNLR2prbWFFcFVFQVcyUXpaeHVHOGE1?=
 =?utf-8?B?MWM5L2F1N3ZNZUI5V2xTT2ZqamNvbkxKOVgrQndEK25YUHVWRnlqc2dSQmEv?=
 =?utf-8?B?ZVNIdXJjVmZYV3ltSEVRWDVuam5uVmN2OVIxQk9FZnYvZzJoUC84Z0MzMWts?=
 =?utf-8?B?WHFIQ1lCdjl3OGZSUEQwMTlaSFVnbEcwWUs1QTd3V2NvbzRpcldoWEJxdGNB?=
 =?utf-8?B?ZWVaeElaTmxPUGdQeDFoSGQyWlJXMTZKUnhCSzcrWVhaODF6L1lqeE9vbnNr?=
 =?utf-8?Q?xRHIxjgCa4YIITWiJEPi7NP0xENkqmuNJfdbv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42bab1e9-cac6-4950-7c20-08dee7695e48
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 20:48:08.2172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fX8l01pPAJngcjbQhWDUUgs6ikH1ImYO5dnk0F006a1Ztmylw5JMwkjm4vpbvG8K67BORLOSl4Q+pD8plZATpr7vm7g5P1ZpoRwfpG7R1XO09D3pkVq5Mon14SfGUBhw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8284

Support the remote devices on the remote processor via the RPMSG bus on
i.MX platform.

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
 .../bindings/remoteproc/fsl,imx-rproc.yaml    |  53 ++
 Documentation/driver-api/gpio/gpio-rpmsg.rst  | 242 ++++++++
 Documentation/driver-api/gpio/index.rst       |   1 +
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi    |  25 +
 drivers/gpio/Kconfig                          |  17 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-rpmsg.c                     | 587 ++++++++++++++++++
 drivers/rpmsg/rpmsg_core.c                    |   4 +-
 9 files changed, 984 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
 create mode 100644 Documentation/driver-api/gpio/gpio-rpmsg.rst
 create mode 100644 drivers/gpio/gpio-rpmsg.c

--
2.43.0

