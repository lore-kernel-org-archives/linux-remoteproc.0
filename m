Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011032.outbound.protection.outlook.com [52.101.70.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4EA345EBF;
	Fri,  9 Oct 2026 03:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791515610; cv=fail; b=svDNO6rlvtPDKTe1p7kX4Wplp4JS1Sqy+6XOyvxDAgp9UNyivDHR6ZH5JkfHwzSUQdGL9LkwjyMKdcR0FaAjRXKrE0j2MY9aA5ZemVvLO95Ivq3ryTtlF2OXoyS9A6+ov7phm8CwbxpZi2UKTmS/MKE07oCODiY0Dyt/PnkzuIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791515610; c=relaxed/simple;
	bh=E6aq0SyBkqGhiBu3LQyd60qvehzTyPhyJeFfbQZjo2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WJt/IGnu35FQqBVNnLex8Y4QgQY+azmVz/nYtLOdBsPbzxOQjFwh32Fl9cUVzOYEctHVGYFOrjnpnd51YeTve8YIT6TmaXXR2MtrU89pcY5Fa797YxOsJ8Gqz8dC6uCYIYwONLUB6NcdZQYBhDq+aF8yBNx6gNlCfnc15EJDJFU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Jli76vr8; arc=fail smtp.client-ip=52.101.70.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Jli76vr8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XytQwgohol7Bm/pHDWYI2i6TaiDRV+IOFd2Z5QYyEtQmaIb6J5re9XYLAm75k+xwVnUfHH8nlH7iEN+qEF83ofXb+S16GDSumyp/p1dxts51uNOswv5eZ3F2K4YkvWLjoRHoEknKY49cL4Keis2QKFOLht2ue4kx444ec7eP/ov8llZSn+qT+JwVewwZn7fte2azU3SjpgZUzibliUpIWicDfLXWr1SAp2DbWC6IV2DdSc2tPaEdzn3rdUiPQEN7Vr2xLP1Lsu6sFXm9N98jK1F7CCV9dwnPt2bpByzf93xzJV4yz67I+/RGI4U/Q4AJGSGYnSYE5C1DikdJvsVqLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E6aq0SyBkqGhiBu3LQyd60qvehzTyPhyJeFfbQZjo2I=;
 b=wX2GI10ZxVdkj44k2KbwMHVTSxYeTTKRzfe5RTqyiFm8uxAN6tHIcbkmanxxQjYL673kLvodSjCgFggrKK49J/6X2sqoUq3B+AsCOqNxmhsO9hYoY33kJ2DPLr1uDek9TK2waw1UYfOUY3QArjxor+VEFg+oGGcqXa5abGjDkMt6vOu3KJ/ziEQn/SMQMnGc/Yt5ELtJ/40/FfGcJE6+jxt5qQcIxcanxXFlQ/tBUz+ZuJMb/zOrI8OIRWU+v4l9dCBITWGn5xdJ2xRotyXYodeGoh2iSrba4OMoYWMNisTFNDdpTFobyZ1/AaWpkaqLAZLjdONSNvmyNfcHwOkQwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E6aq0SyBkqGhiBu3LQyd60qvehzTyPhyJeFfbQZjo2I=;
 b=Jli76vr8HdTXN8i7wPs3c18JvzLCBUwtAHxJTV9TBSImJbNVT19Uu53wAC6O3hlMCoTrLZqF4OtxzuM1mHh9qnYkNCwWhZwq+SB4RRda/JiQlaCSsGHAAzVI12bMCuHh0cG/ryvb4eyoZzGnxGwIWZpml4fcVc4lZtqTRyzowHb5d/eYH7+7K1gRHp0bTcgrRZzJxyvLeqtrIKZR0863y/3ehaO1PXZZ2CxZH4Eu0eeuXeExJ3NwPe0oxtfv51t0oq2bKwoGa990C+GZ/eSfO6mHmXXt4VKtZh4sBgupAUMr7TzXVF8Y8rbZUb7Fn2zDALUhghvw0AeuReId0Qxygw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AMBPR04MB226274.eurprd04.prod.outlook.com (2603:10a6:20b:75c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Fri, 9 Oct
 2026 03:13:26 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0496.010; Fri, 9 Oct 2026
 03:13:26 +0000
Date: Fri, 9 Oct 2026 11:17:59 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Frank.Li@oss.nxp.com
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v4 2/4] remoteproc: imx_rpoc: use memory-region-names to
 avoid hidden ABI
Message-ID: <ashc52brq031Tr8c@shlinux89>
References: <20260917-memory-region-name-v4-0-260755920ebf@nxp.com>
 <20260917-memory-region-name-v4-2-260755920ebf@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-memory-region-name-v4-2-260755920ebf@nxp.com>
X-ClientProxiedBy: SG2P153CA0004.APCP153.PROD.OUTLOOK.COM (2603:1096::14) To
 AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AMBPR04MB226274:EE_
X-MS-Office365-Filtering-Correlation-Id: a3f77d76-b70a-4fc7-fcfb-08df25b348e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|19092799006|376014|7416014|4143699003|56012099006|5023799004|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	bMiyuxuDhhqKEpmC5EqzvYCYkatUDuljaB52olsFnAMxRDXb5nG1X1+3dI8fxUzcFKCSimI+OuN++QCwcvDt0WtfwL9dfcCjU84ZH96mZAy+OnbfInEgEd0D99AU7VShK/Ctv9jmh2rNM1GdUfMTqrNUtG0MaXGgCGMgjhcQchkCLgi6/QoHpTkpUcTTh9UpmwZ2WCj+6jwz/T8U1K2v2wuDWdsDmRUIKp2LVOQ84Vbb+idRuk/xnZCKaLZcWj/U2g/i4TFOlFv0SY1evBPv4+mFNezODbBcj7mvcCdMwmHSgJu+tsEZnHkqc1tQ1+yxlgg5e0qYA2w6ZToO3ocnK+GCTzsGs/gWcxALRf+G8MrwUHCXKZXJ9U/VEgKXu6WtZrTaL0mClXuJwD+PgJ0V7c1vm/l+S6Dg4g6GokV4dqeyx2rsIMXKwXLSTQBhutdqgwR1bbNW9mD94iWs1bfhNbRQv4NDttkwKLZOpa7YfB+W+RfyVqMgzJ7qGOCwF+CABbB0M0eKFQlI+4Xtl+tFNruO2CDlMUoleE38zwWOMGhdSvCu7diCaoBHJrW3ciZ1f2kZEzI7RpaaTG0VT/FxpVmkionDz6H26bTjynJxoTiHiJCSVmq2XGDZr9q9qzLu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(19092799006)(376014)(7416014)(4143699003)(56012099006)(5023799004)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UWD4L7pacoK7p7pTk2wgCPVP5itvpKZzGHmzp2vhpgkx2U1AWG/uvuwMv00A?=
 =?us-ascii?Q?66HJXRecGVF3etm/7FSJu8cv2UAfnf6bRA+9/hKg0b31+++XMpDh5Tdw8xp+?=
 =?us-ascii?Q?EgtkBEQZ44Qpi34VoItU4cG7RXuuzeJe44JTBrEFtQWlXx72VnIvYsPT3ZGZ?=
 =?us-ascii?Q?ev7Uymr+mKZgan71a/4h+El/EZJ6YKooS0vL0ZRqvU/x9C0h8rq9tX+UkAkn?=
 =?us-ascii?Q?guHketjj12dMctGz3G5EU1AHPdTp93vJkKTuEiByTuJIm/S586sn4e9gV/vw?=
 =?us-ascii?Q?AfsQNgWMDf2GtDVfFTNt51/+6L2qdEmHBPyJsxmmdCti+g/bIazpMkDi5qC3?=
 =?us-ascii?Q?3Lp7Pr8zqsyObnErjBcWbYr6Ibi2PEEyPCE37LEWMlZX0HcEaf2wWX1WUlUq?=
 =?us-ascii?Q?fd9H29PM0TE8ldDK51MaGAkTBgPCR2H4Y5Y6S2+6RI1uzbl8u03Z3nmQVeXb?=
 =?us-ascii?Q?h506SMfOhA1h+Gcv4H86QQMtFqVJe9rhzKTZbnAP7E+5SqDt/xCgLUodPZDj?=
 =?us-ascii?Q?PDhpMmStKLr+1ugwdwJy8iGx4buywmf3h1oNLOsD+iOQgxyOnKHCSBZgCr7O?=
 =?us-ascii?Q?PF/h17KwHNKQauhnXq+l5fGOXqkBAvxs2aXp86R8sA9HKP5H7PTTU4rS5XBd?=
 =?us-ascii?Q?g74md4zOvf1zZzgtmZkucOeOjE46l1jH8kfGaKwbAYXAx0tf3wSjqQ1RdUNX?=
 =?us-ascii?Q?NJRyAEOGdAUQyix3BsKJIgXfY7S4PDEhVe+LlGB827dEjFPEdF/iyDci4H77?=
 =?us-ascii?Q?nTsr7J4YRg7VOhuh6Iy5wng5ZYOUFowenVVgHr96n+af1MGF8/2jvyp+J/WJ?=
 =?us-ascii?Q?FNUcV/RWruIxbJRLjwluQZRxFwgW030FGsGXSH/SDdoo/WJmgLT/7RSf6eG/?=
 =?us-ascii?Q?hwldwCceG/9IUPKHftFBG+HFAsZ2X3BHrbEMvt8jLqiL/lOp9smH4PSNpL3v?=
 =?us-ascii?Q?lhymR/KfAcatCFB28saTL/vyRbp/4J22oeI2ej3FPHETn3pcCYAhb9bDOWvB?=
 =?us-ascii?Q?bcN641zrf+j0Unrn4gU/3OTzOq0Ew5euXX30p2LExofS6y1G4VNojbfN2TZd?=
 =?us-ascii?Q?MYsuvMBo+mRo2fNsI/swbCtQyi26zxa4YjKAx8wf4fVvVoHPPLKR+HQZlREL?=
 =?us-ascii?Q?JtnBshryYPFzVcKZnmKCahRcgVnSkk7t7RzRIFPReheCQkJOkLvt0Firs5SV?=
 =?us-ascii?Q?ESZPl4uy2VZBaYolVbeTrhyCUlQCEiO7ze9hp2hZ+JZMJycmBRRNR0GA0oOa?=
 =?us-ascii?Q?m+kd0+L3My1tS6Iqq2t4C5SdT2QH8ZyO/OE3Qcn/jiBa3byG3vTQZpiVydK7?=
 =?us-ascii?Q?rMvJfpsvXL6y33MWeFWyF8I97b3rgYSCr4e31zUZCmlU60U5o9Kx2cFlzff+?=
 =?us-ascii?Q?AWFyRsiOwuOmAUcsAWSL/QWNiR/UihTfWMJPCbjZVp6/h5vFLqQR4HnXGjxr?=
 =?us-ascii?Q?r5TJqrUDgik3SICWambmn1p8sFPGCyjGiey1VmP7tKEX3N26O4lqZu54Fqtv?=
 =?us-ascii?Q?/be1GdcjhqMmeEFDQ2C7yZVn749IFuC+6iaixUjWHS8zb6TP5GWZhc5ZgiAI?=
 =?us-ascii?Q?Ikds0zputVf5zd5IgkBtbkEvgrBU05m6uID0MrMXS3+H8a5C8Ot5wroOYpel?=
 =?us-ascii?Q?HtirBtk+9ID+6SO30FpyIiZoWv/296j5AvBHYNeyWy/wV3BY9pueOusPop9f?=
 =?us-ascii?Q?j6atf2YnQKltZapV15dcThud3xXWbkchHbSUmHiVshA0j1S38QUgG5Nl0rSR?=
 =?us-ascii?Q?Tutb6LyOwrl7poA7M1VmHTzkkamdVxDu8gZ8trWO6New7o0GI0Ha?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3f77d76-b70a-4fc7-fcfb-08df25b348e5
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 03:13:26.3727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hoGhSGKUm1dzx0JmW1rM5TOGBc3oQ5qDm3a/zA6ggHsWcJunSrCiAcgduBlQhaUzZzO+4oSm4rFqvaBeb0XIDy1ukB3wnyw0VS3AP4oKg/qlsJnPqXyaw/j8y440xwWq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB226274

On Thu, Sep 17, 2026 at 02:19:43PM -0400, Frank.Li@oss.nxp.com wrote:
>From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
>The driver currently derives the memory region type from the referenced
>memory node name, creating a hidden DT ABI. Since memory node names are
>not constrained by the binding, incorrect names can silently pass DT
>validation, as seen in examples using "vdevbuffer" instead of
>"vdev0buffer" ([1] and [2]).
>
>Parse memory-region-names to identify the expected memory regions and avoid
>relying on memory node names as ABI.
>
>Link: https://lore.kernel.org/imx/a3602ef8-2b77-4cc3-adef-2c4cba08a5d9@nabladev.com/ [1]
>Link: https://lore.kernel.org/imx/alexXTYQHUs76J7v@SMW015318/T/#mb9dc709ff3adc24d9db6d30c973f37b580f6f1f9 [2]
>
>Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
