Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013026.outbound.protection.outlook.com [52.101.72.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84ADB38E8D0;
	Thu, 15 Oct 2026 14:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075176; cv=fail; b=dker6c2veVoFX+HunupgBHsJ2KeUVZmgKUwM1yDS3xL2ln2ZaEsVmSEik6dEwvpUHe/073caMzVBvhexmf9XsUI+qNNT6zVAJLOQcBs5zZ3n8yRpOLK9zlykb66bOYDSehwgfUIM81aXynHkNkDCIDSt2lza4WMqdUWkktvqyLE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075176; c=relaxed/simple;
	bh=q5xGx+tn23zBqcJ9hlTBG0wRKneYkrFas7q40HFZ2p8=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=nmAtmB7Sx1EP142h+Od23mpdmCJIm2o6+L2mdtPapxstLsWGVnIy4vH0jqkxUVV8OdRaYn3tdSer4rzBeZ+h3DteVcm7fd+nGZLMI5h46KvdAxUCuXEq7ECSoSVvW7/h9ZDIe9VX+nL/SEZpc2JPk8mhoYGMRXpCHF7qiAOtmEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vu0snf6F; arc=fail smtp.client-ip=52.101.72.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vu0snf6F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wR3Ef0Lz6X76w3ZGYpMp2vYiEkOPQizt//v+wCfXmNm5n3E6G0JAN31M6E5vh0hZ3wHWkxX1zHj5DUFdwKP2wn7kQzYTKLgfpg8QTHxn6ZmSsNH5T9GjEGbb0qDgl4V63UMlsEquk7NCr3AosCphNJWlPvcRQLonu0PCbDjQz+guKsgpbycbSwqToXuCBSXP1W8t/6SWmBSrG2LOzjeFbhaZPg3TU1bajdaAYOQRVlZ1u3S+nXa3wE+wq7nNLMWaiD2dxV4b5SuHSplg7MqakusaBwDA4GyT7I1rsxBsriM60EelEX7zIE8f4o3Dh7FLdmFnIijofypwPk9SlpEhYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MEb2Ph0vd+OANpH0/6hBcRYs6jC6LiXNsqQkv2LF4u0=;
 b=LUyl6BKdRHml1sat1/ABayoXFRJEk6QX3BCeN4u5J75/drpMgcjoZDtH5qGTJ0P/GNBaaJHztSXANuSg/hNof6uKxhMocEhRg8hPaoYK9lzkceJFpjTe4SBdeEAETp+egyiSEVR2iukeyvQcJlGOFncBKaDr52E+kDt9NS7a2g432GBSf3vLGwV0UHGtt9NdxlKUOhalRyxdJdE4FhH1FcJD/HMgagh2uGgALuYWJcQzJDstVVgMLYra5ohP4EgOe5EUV4URck8FgViM1PJomx6Bwj1g7wFp2GQsOmP0eoTsCWB5KPVTeEPtCHEbpOqnQP82p0h1wb0Ujn/PVd7QDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MEb2Ph0vd+OANpH0/6hBcRYs6jC6LiXNsqQkv2LF4u0=;
 b=vu0snf6F3NvVkCiGF4l9ir38UlKDY2Px54XVIXqWtor9wWrqCYY4lgEx98u/skxhGCLupmEoI2kjxzfdcSJZjq6LFD/Q9Nc0yhGGag0a9OcxdNaAbSO8DQqItVCFyIjBQfSTnLtchwEkC1QayoW7DtHm3vT4YVyG5TEDtmO6uJHRj0djV6NSG0kCkIyhBUrOBVbRLxFohpLyw+x+VuIHtVyMZwxWw3wJvl2GJpr1YbrMJUmIv67dXIvn/gopj1romu3JflgM3gM3aT15e6CLYhzBd6fAhCmTMLtCub0LPAP9qQn32x7jii6AoK+JXEutgoylO/V3Kytph+pCdg2ytw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM0PR04MB6881.eurprd04.prod.outlook.com (2603:10a6:208:18b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Thu, 15 Oct
 2026 14:39:31 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.012; Thu, 15 Oct 2026
 14:39:31 +0000
From: Frank.Li@oss.nxp.com
Subject: [PATCH v5 0/3] remoteproc: imx_rpoc: use memory-region-names to
 avoid hidden ABI.
Date: Thu, 15 Oct 2026 10:39:21 -0400
Message-Id: <20261015-memory-region-name-v5-0-abc358b39a96@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJnl0GoC/22NQQ6CMBBFr0Jm7ZjaUCuuuIdhUcoANWkhLTYYw
 t1tMe5cvsyb/zYI5A0FuBcbeIommMklEKcC9KjcQGi6xMAZv7LqItCSnfwbPQ3JRKcsYV8JRqR
 4K28dpMfZU2/WY/TRfDm82ifpJS9lYzRhSStHNZbZ+wXkv0AskWE6SyEqzqjta7fOZz1ZaPZ9/
 wD7r+7pxAAAAA==
X-Change-ID: 20260915-memory-region-name-f950eea2b78d
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792075166; l=2748;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=q5xGx+tn23zBqcJ9hlTBG0wRKneYkrFas7q40HFZ2p8=;
 b=cGxitOq1XQkze3PM1zpGspRzx1JPNH1nvXbCwuLOEY681R+fTVnacAN38SG3KqCqYNVnF9sey
 e0iT4JGl2AYD8YHREklvg1BhDhkwelsW4y4/CV4s6N+VzTVnM8os+fu
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: DM6PR03CA0083.namprd03.prod.outlook.com
 (2603:10b6:5:333::16) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM0PR04MB6881:EE_
X-MS-Office365-Filtering-Correlation-Id: 622efe12-ce62-46cb-4d2d-08df2aca1fa3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|7416014|19092799006|366016|5023799004|56012099006|11063799006|261009223027099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	kF/Q+hD8Z4bXDnCmnBwjSNzTXE9Saa9z9GCJL4rvY3ZIrb0rhIQ90U7JnpcN/YLQNgtDpTnxmFnLSlvzVtjoPK6M1p9P7ItnzlRyMaaYAbNMemisRem5bRdmnXP3XOSDlDIWOM32yTpXOTROLEsShLQeYiuVl92okdr3EF1LxDEC1rO73DCQx4eVZkkw+dYh1IYidI5reFGxT/z5nE4FnB3TOGpLBu5iT/8YI181V8I6WDs9j2PwoI7IKgAPUEGM1/p3dPUMAe9CE3TuLGwzUvXww+MIjYBeFZq/9txqkA6vlrlaekYMts+pIXtbCETAff8q8UYOcB55skY+piaKHsXGd+kh4usPtljv3PZgd7xamGT9Zg5M/MBThMmJDJoaL2jmOdLUM6KGXfBhc6YmJ/CVEG1JbC8GWd4tYeJbUqPHyKvlJsK515ZnLdBCTATr81aD4ykxmaOVHhtdhG2EpKOTqzO6HDrgXqFfOzsiEFU2RTjAz2evOpjzkVodtfHZkJU2BkXzMwHWdahtFzosE4+BOFgBT6qU6IE+jvSBYSMuubLl3xdgVAdjf1q9A+C1jnJE0aJyuGtvp5Yd/qaDSTtsINiHvPsh9BxRg2bxOPBa14dj1Wurv/99AMc5WLfs
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(7416014)(19092799006)(366016)(5023799004)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXIyNG9JaUYwNnNWUFlOU1dPeVhMS09KRXR2RTVtV2o2bUZUOE5oSzhsdzZR?=
 =?utf-8?B?ODV2TkVnTmRWeXBXU3BjTkhKVWZQNEJMWkVoV0FhT2dUUEk1SFpJRnhVRU55?=
 =?utf-8?B?ZmJEaDh1cHRHcmZRM0xhNzlQNWw0TXFaYnNrZkRmRTN4N0toQ01LZDdhR0Va?=
 =?utf-8?B?U0NHMFk2a1JFVWVXWUpNcUEwRXRIdXkvVWM1NTBaZ2dVU0o3V1ZSbHU1RFZq?=
 =?utf-8?B?TEt1bFZhakFQZzVDalNSaG4xVTVKVjM4MXhVa2FzMXkrQXZEUHBEYWJZS2p5?=
 =?utf-8?B?Nit1TENVaXc1TUgwTXlwejlpZDhvUVlPRjl1Y0NERHN2ZVNpZEpSSWRkaXRD?=
 =?utf-8?B?L3NSbmlqR0J0aGNmUnNGRklLQlNYQkQvY3ZmL21PejhiV0ptVkFwRUdxUUt0?=
 =?utf-8?B?dVJ0dCtCNm9MbXVuQVBEZzJpSlNKQzdZQnRLd3hpL0d0L041SHNyOUpCRzg1?=
 =?utf-8?B?cVVTVlhmSHdOWkJpVzdTcEtNYXgrRjZEVVBYb0xiaEQvcnNWOVBXeTB3Y25a?=
 =?utf-8?B?OWtpVExvOU1Rek5YREtJR1l2dHFZaEdCeUdaUnB1ZGZVbW9ac3MrbjBwQUdt?=
 =?utf-8?B?Z1M1RXBaQVIxUjVQbVFmQm15VS9xaG9ML21BZFNYd3MyWW0zd0RyMXVTbmM2?=
 =?utf-8?B?QjZHMnpLZUt4RzVwcUd0QVF0MVFkUXhIa0pIT0VNYXIwY3pBcWxmSnBUUjNB?=
 =?utf-8?B?blI0YjVPTnQ2a1oxNXZKTFl1QnN1RGVSVGl2ZXkycjlORHhkUkVrcThKQTV2?=
 =?utf-8?B?TnJ0dkRFalhZMWVyLzZ0YUxFZ2JOWkNHaGxheFd1SnBaZkYzSElMV3c4QXNn?=
 =?utf-8?B?aEM1M0xTbHVpTmlCQWU1WVAxeFY4ZXdtTHBYTUN1QklIeFBxNno1NzFjL296?=
 =?utf-8?B?dmlGY0FsMHpxVHAybDdlSlVJdkp1dDZZVGdFMUV2UUk5S2JzdUZVaVNuZjU2?=
 =?utf-8?B?MkVBVUV5cTJKVnZuN3JtSVZ1UWdWUlFBSUNGMHE2N3JlaU5majRjWTN0RFlF?=
 =?utf-8?B?WTh5ck1Xbk9ydEJhYlpHNnVZTys1bGtRaE1DdFRXeHpjV2NpdlBWOWdpbUhr?=
 =?utf-8?B?YnlHYU9qWGRZN1dNQnhBdWo4Zkk0UkFTb0M5c3lZNEhQb3JZeEt5Y2NpRHZl?=
 =?utf-8?B?TXNNRDRxNHIzdzdFM0Q2UUdueS92MjMvM2VIUDFEeXBFdUVxSDFZRnRtZ0k1?=
 =?utf-8?B?Q3Yra2VpWUxWa0NaSWtEOUJVeThrQzBVSTlXc2RndXdObEVkSGk5dmRVUHFY?=
 =?utf-8?B?MFJPcmgvWFVYME5tUUxFMGUvWGdYMUpqQ05Ga05RSkhEVUtPb1FRdnhNQ29a?=
 =?utf-8?B?M1lxVmN1cmMwSjdhd1lUMnZYczdVRkUwZTN1d1F5ajRydllSN09MZHFsdkla?=
 =?utf-8?B?QTMzNnpxTjZrbmpKT1pSLzRrRlYvbVNPWGhWQWU5L1A2T0h6eFBKTCt0QThs?=
 =?utf-8?B?bktJYUtnUUQ0bWpPZUU3M2xQQzIwTk1FRTdEVWZiOFJWZFhUckNpNFhLVjBE?=
 =?utf-8?B?MVh3VUcxeUZ2YnhYeC90M3N2Y0c2N3VWeWxiK05GUjg4bHJLOGJqQnlaT2dE?=
 =?utf-8?B?MzRqbHFrSlczc3VnU3o1TUtLd2dmbEwyRDNoUEJlbEJEeXhpOFRWbFp5ZlFF?=
 =?utf-8?B?dUl4RENWck81MXA3eVhqbGZMMGcrd015Q0taR1d4N1NTeUpXckR4SXZFN0pa?=
 =?utf-8?B?V1RwNU02Y3hLL3RUR3RiaU5SRzNuaGZlNHd3ZFl4L0pEaXVtNlF4NGRkVGFR?=
 =?utf-8?B?d1ltZWVJblIvMzl1RmtXOGQybWVuQlloWmw1djJ4TVB3Rk1ndjVqdEpNK3p0?=
 =?utf-8?B?Rml4TXY4V01Cb3RMZDZIYmZ5Z1ZZc2pyMkptbFU3YjFJQXJtVjNYYm1XaXJq?=
 =?utf-8?B?NkRWdkVWbks0QlB5MmZ3Q3Z3Rk4vdUdDTk1WaFp0aHlBUzdlZkJVODJqMXQv?=
 =?utf-8?B?Q3FEb05IZEtHOVdFSmV0SDV4Z3RCKzY1SWhBaW1Zc0ZnOGxFY1NJRXNmeGg4?=
 =?utf-8?B?Ymk4YS9FSGxHQnJyUTNPOTFsTGFUSEc0Wm9xanpsdTNSUTV5RFJUR0pZWUkz?=
 =?utf-8?B?bHdST1VKT3VPTVB2SHlzY0xaK2xJeXNZd0I3eXoweXdOWDdPVTUxckd3UFVr?=
 =?utf-8?B?eEVXd1BXaEhWaVFFdjFpM1FGcFFxVG5WeDEzaitOWUVMaHlVc1BSUSsxSm9O?=
 =?utf-8?B?VjJlWi9YNlJ5NW5zT2tRM3BzSmU5SkxQdUxibTVUVDVrTGtvRHFtVFFqQWgy?=
 =?utf-8?B?R09QMzluY0dwejRXS1lRNDdkdVpEMXBveVNTOWEybTNZVVVLZmMvWml0eVYw?=
 =?utf-8?B?UW1hZC8vOTdMaGJtb2lrci9JcitkQzYyRzJuM3NqaW5UNDRMUjArbzlwS0xa?=
 =?utf-8?Q?wVf8xR+HdeG4xMT8v90fAEVBZC1auKh0X9IAT?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 622efe12-ce62-46cb-4d2d-08df2aca1fa3
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 14:39:31.4324
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kp7N81n1OTbtf2HP10OQg4KSb+mxH8d8s9ZfMS29NWMCoitn25MZh5EGxQ8OPdV2x4sfY75eIY95vNKKXOTbsn9B7A0nHLnBnV7FCdFdxPiLbWZe2XLEeiwBEwaFbMMA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6881

The driver currently derives the memory region type from the referenced
memory node name, creating a hidden DT ABI.

rsc_table: rsc-table@90000000
           ^^^^^^^^
{	ret  = <0x90000000>;
	no-map;
}

m4 {
	...
	memory-region = <&rsc_table>;
}

Current require node name have to be rsc-table, but no any binding doc
to restrict it.

Since memory node names are not constrained by the binding, incorrect names
can silently pass DT validation, as seen in examples using "vdevbuffer"
instead of "vdev0buffer" ([1] and [2]).

Add optional memory-region-names property to define such ABI. To keep
back compactiblity, use "optional".

Link: https://lore.kernel.org/imx/a3602ef8-2b77-4cc3-adef-2c4cba08a5d9@nabladev.com/ [1]
Link: https://lore.kernel.org/imx/alexXTYQHUs76J7v@SMW015318/T/#mb9dc709ff3adc24d9db6d30c973f37b580f6f1f9 [2]

Prevous version
https://lore.kernel.org/imx/ail0sH1UhnQBPRkr@SMW015318/

---
Changes in v5:
- fix binding region-memory-names's pattern
- add vdev1vring0 and vdev1vring1 at dts
- collect pan peng's review by tags
- Link to v4: https://patch.msgid.link/20260917-memory-region-name-v4-0-260755920ebf@nxp.com

Change in v3
- rephrase commit message and cover letter to correct descritpion and
reasons.

To: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>

---
Laurentiu Mihalcea (3):
      dt-bindings: remoteproc: imx_rproc: document memory-region-names to avoid hidden ABI
      remoteproc: imx_rpoc: use memory-region-names to avoid hidden ABI
      arm64: dts: freescale: add DT overlay for MX95-15x15-FRDM RPMSG usage

 .../bindings/remoteproc/fsl,imx-rproc.yaml         | 11 +++
 arch/arm64/boot/dts/freescale/Makefile             |  3 +
 .../boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso | 81 ++++++++++++++++++++++
 drivers/remoteproc/imx_rproc.c                     | 13 +++-
 drivers/remoteproc/imx_rproc.h                     | 21 ++++++
 5 files changed, 127 insertions(+), 2 deletions(-)
---
base-commit: d419d682257d813f6cb7a28e42b35d0edf4ad038
change-id: 20260915-memory-region-name-f950eea2b78d

Best regards,
--  
Frank Li <Frank.Li@nxp.com>

