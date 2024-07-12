Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013008.outbound.protection.outlook.com [52.101.67.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653182E3E5;
	Fri, 12 Jul 2024 08:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720772763; cv=fail; b=ERMFM+IB6uHQP6BlwnBRohG/BBHDUpaM2KxmFJ6OhOceQHrXGz8cMqJT5vBA7EzJfd+SPRY1peQbF9X76cQH7DWQMdXZg2IdP1aTGJ/50PjJ5vCdPklTZkKi71N0CJNGVzTnJjh0JSTGR9sOnP9OHEnk/+kVZS+9NQkRTCwe8Fk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720772763; c=relaxed/simple;
	bh=Il+wxcOEKJGwoUkNcp3B/7VGpHjvfy/O6b7GgproFUA=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=R41xzhGwRzQQQ7XwBW1w8869gQv7zktPJumGd6f4CGm2/Ep431E3P7FtE009nfG3VnC/bFTN+om7q555mDlz8kdfvnjJUn1j2XAZFGVgMcacaJi09Uirx2QrVz3SHGpybxVfckK+Kl2pU7PRXs/M/RWiIWo742LlkrbIHm2A3Qg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CL8tTdVB; arc=fail smtp.client-ip=52.101.67.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CL8tTdVB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XPngex7vt9yA9/nf8Z1CVQbOcfv9KCuGZtbpyY2/iGDvoHowf+ItRpCyBbC4hOC+DC7B5VVpB60hStPAlho7Ewx4mW7HNgKtgVZkBBYHyAD5lOrmgtuXQ0gdesrfACO3aX6lVIqC65YYTU5KeOrhKKf8Ie+QG3TSw6wckcI7y/buF5lkY/ALu8h5CBU1U0QGxbFwrQvC03hYEmyqGPuNx6qV9r2JCcTQFu/kY8IaMN+SY9UaRZSzXqZnojRAjZIqES4m4ZvL8zLHg4YJ2T4j1GKqBC8fN6At3pazOO/bCv2mXdguDCL3OrE5UQB773kvXK3zdTsBPiFOw9yB6OHipQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jlbFHm8J2dCkiMO5gfQe3ixgb4wzY3HBWNB2MgzF8ug=;
 b=pO3enY1FLeDF9Nu5rPcBSPcvMPlCzX9VX1nN9tK9yx36F9INhhO8SoWy8A8AWGFB7v2bUEprjRjGw0BUtgJkdq9EzKm634dZMYlg9M1G4Ptld+3wPsWT+d/+mgJDxWWTUAv8H7PPg0Lmn8cG9xdYOVUvtZ33MPUHZ8xL+r/GkbQiM9zmPb9342uNmbZOiaIruF25OwNQsOZjJh9ufmM6z60hCFS8CtEc91jTE6OCuLkO1iWJXbqY4u49Ma+yjEqwRX2V8MY1ieprzA+eKt5umF/J5CxBf1CfbsSaiPTM4T94PdICTEWrZYdUHlLE1SxlxvlYfB9nyrEFF6h3PPIgTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jlbFHm8J2dCkiMO5gfQe3ixgb4wzY3HBWNB2MgzF8ug=;
 b=CL8tTdVB71AkFx/iA6duP+TaBle9HlR3eM5CNhZhMZVhTuGbl0XzX2b59wIfQ/E13Vp9PiPaKHmY69b5DeLvQc8nUAc1LYE9c27N6zpXhaovSiMVQ72NCjijc+XVj+UPEePY5va2TlIz0kNcyVND4WUmkVEXzXUk8VjaWVjuqu0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA1PR04MB10865.eurprd04.prod.outlook.com (2603:10a6:102:48a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Fri, 12 Jul
 2024 08:25:58 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 08:25:58 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH 0/6] remoteproc: imx_rproc: various patches for misc
Date: Fri, 12 Jul 2024 16:34:53 +0800
Message-Id: <20240712-imx_rproc-v1-0-7bcf6732d328@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK7qkGYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDc0Mj3czciviigqL8ZF0j0zTjxCRzU+NkUwsloPqCotS0zAqwWdGxtbU
 ApvoZO1sAAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Richard Zhu <hongxing.zhu@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Terry Lv <terry.lv@nxp.com>, 
 Jacky Bai <ping.bai@nxp.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720773307; l=1329;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=Il+wxcOEKJGwoUkNcp3B/7VGpHjvfy/O6b7GgproFUA=;
 b=4pL6mmmoeOYK96KbSf/Tys7D6+Don473+tWD7tOM939t+ggQBdB5zGSAbQj2dWZMdwCGi7pDb
 i08tBhBfCqhDYIoc0+MWOYTQN2tXfTNn9JtCDjnrX5Lp7/atCbksHR6
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2P153CA0013.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::12) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA1PR04MB10865:EE_
X-MS-Office365-Filtering-Correlation-Id: 43e8b56b-ed36-4575-8de4-08dca24c414b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Ym9oMFdUL1I3SkIwMDNuU3pyY0lKVDNueFEvREdIWklaQVJXK0Naa0RFbkkv?=
 =?utf-8?B?YXRhU3g3eW5LR3JRVU54dEZhamxjNFZ6Lys3anRhc091bVNibDRnUUpNdmx6?=
 =?utf-8?B?bHBvVWhGNDFZWW03b05XSWVIL0hocWM4WlBURDdTdWQxdHd4TENrMVp3N2dY?=
 =?utf-8?B?V3JWeGNGVVBmNDBvSXJxQnA3aGdVNFhqZDJ1elF4Y0I0a1c1azY5QnFlbjRH?=
 =?utf-8?B?UndtQTFUZkRQZmhHQmh2Nm5hYVNianhNQlVyT1M0dmlDRlV1aVBuRnk3WC8v?=
 =?utf-8?B?dmMrSEh2Y0lwMzhOVGc1WUhSSyt4VGo3YXBtTzUrdVF1SFUzaGlUcDhQS3Nr?=
 =?utf-8?B?SDg3UStUZ2ZFMFVyWjFGRENrVEJjcXZScXMrMk9zZlNXdlViZVI5M0NVY0dW?=
 =?utf-8?B?N2E0dEFOaFhxdmJRaERseUt6NFlRdHJyejBIU1RrTllUcTMrVnhpMDBOT1RM?=
 =?utf-8?B?Q2tYMkM0a0l3ZC9PSDZ5bDRFT2lKZFlYeVNqNzZyOXlZWHlmM2xmMmVENEhU?=
 =?utf-8?B?S2ZxSmI2VE9teCtESE41R1ZIYWNzdnh1SlpXNE45KzNLcWpOODhsQndIRHIw?=
 =?utf-8?B?RENsWWljOXY1TVZxVkFtbTFaRG5XTFhTSXFrOEo0RzBnOFc4azNieXpmcFBX?=
 =?utf-8?B?N1VSeVpSTll2TTJHdDc5THpSSE9PZE1rWTZPcnpEbkwyWTZRUy9CbGRTTkNp?=
 =?utf-8?B?dG9UampqaU9pbGhUamswMFlSMXZiU25qR0RML01FZVpCbFZGNHQxL1h1Z1FX?=
 =?utf-8?B?aUtRaTkybFA0ZC80MnZMVGNac2d4dENtczdOeUVJTllWZ2p1dDhiN0F5dHNF?=
 =?utf-8?B?aVhoYlpKNHhtTUR6QnVZZEhXaFBlbEZGTEx3RllJcjJDSmp1N1VtMnBvaHRl?=
 =?utf-8?B?ZitLL3JCMW9hTUdqN0RMWGpaNkFNRU5RNm5XSlBnQzVROHRVdEYwTE9sck9D?=
 =?utf-8?B?UG13L1NDTXhVMVliZHFXRW1ramdOb25vblorMWVUbmpPSGFuZEt6enhOTkxH?=
 =?utf-8?B?cHE4RDBRQWllRm5CSGJtWTVPWFpHLzVzditqR0FXbnd6b2NNUnJQdHBHaEN0?=
 =?utf-8?B?RnRuV0hBeHorZHJWZWIzSm1oY2VNOGthZjJjeTNVR1ZWbmZiR1N2cDFsRjRE?=
 =?utf-8?B?ZE9vS1NvTi9HMUM0YWsvY204WEJkTG1OK1NHb1JvbmxUUkd2ZzBxUHI0ZEJG?=
 =?utf-8?B?aUNRbjUvTjJQL2NwU0sxWkFDVk1STE1ZalJSdFp2UjRLWnQrZ3QvcC93TEty?=
 =?utf-8?B?LzhDQUNDcU9hWTU5NmNkZUliejRaMHp6cGV4WE1oSU1vSzg5aGFKYTZkWlFP?=
 =?utf-8?B?encxekxzOGdEQll2K1JtZjVqK3NlRWFXZlhCbWRsWi9EQjFVOTk0TnFIRjRp?=
 =?utf-8?B?TVdiQXN5Y0JvZWhjQkxvbGc1cWFUSnVPMkdySk4zMi9ISzJlWGtkQ1FRTHZX?=
 =?utf-8?B?dTJhQSt1VlQ5bm9pdEdnTDd3L3BhSUowRmNFUjhMKzhJaWFtM0ZGNFRMVkd1?=
 =?utf-8?B?L2g5aElRbExueFN6Wk9DbFc4M0gvcE9aMnlCT1kwMW5VOGY5WEttTnMyeGJp?=
 =?utf-8?B?QjZUZDl4MFBuWkw1S2JITjdmV2xnL0V0NVBjSFJHTFRWdXplVEF0Ylh5TE15?=
 =?utf-8?B?K2JwLzNieWxubkdxbE5GTGlkTXptZUNDTjNaNm54VGdxTnVVeUR2TnpYZ3Va?=
 =?utf-8?B?Yi9hTW9sY3UwQVRhMXNwRkprNS9QSTA5M21lUjk3RVJVOW56bTJmSkZ5KzdF?=
 =?utf-8?B?LzZaVXVSOHZNY1FpNFNWcTdYeThaRDUyMDVIbHdkSGpFSEFXdFRqUlVMS0w3?=
 =?utf-8?Q?8nHbdM2eyM3f5htDzMUcqeVbe+JGEDgcDCdb0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXdFK3lWRFZnR0ZQdzU5N1Evay9qM2RMQVZQaWVuMWNwbDVHcW1YMHpEb2hT?=
 =?utf-8?B?RGJMTFpZc012VUNwalVxVSt0MFQ4Um1YbGdQSzdTQklRa21hSEVoRHcxVTVj?=
 =?utf-8?B?YjZoamxlSG9vVGdDQjkzQ2JYWmRaaGc0YWhGaXUxWG9mYUR4V0VobXJMcmcv?=
 =?utf-8?B?eGxoRmlFS0JaR3AvMno1dFI2czY3WC9mWERsRXFzcXFCV2RUL21wSzNEZ0F4?=
 =?utf-8?B?azZWK1B3MzNOU2t0OXJscmRoZXRtMENLWUFWSTRlckRIWlI5dGJSOUJxbXBo?=
 =?utf-8?B?OUErWXQwTkFad1FrR1FjUTQ1bWFqY1ZpWXhCdlA4YjlBa29OWWYrWEpZY29T?=
 =?utf-8?B?M3NxWTdOb2hRZHNINTdhdHk4RGFSVTNzSDNvS0R3OURKYU5kZHNQWmNEeEFO?=
 =?utf-8?B?Yjd5UDlGNEFxUU9LelVCRjJBYXNtVUMwdUJvZkVMNjV1NndUOGVaV3VoVEpy?=
 =?utf-8?B?VWVvdm1GVTk3U2M3dnVmL1hhaGM5Y0MvbVg3WUk5WnB3TFl5NThyTDVSajc1?=
 =?utf-8?B?NDBrMWZ5ZkRlZ0tCeU84N0ZBQWJQSUJSTFpBWCtUdjRiOGlSdmJ0ZzFxeGM5?=
 =?utf-8?B?bDRxWDJOVUV6OWhsREkwRkN0Zk42UmZIUVNHb0YraVg0NVB5cWN6Q2ZmMTN6?=
 =?utf-8?B?UHZQV3VISUltODZMY0ttUEJxNEUrSlc2TURydnk0SFUxSVJuTHhucld2S1BV?=
 =?utf-8?B?dXloVGgvVFl6eWVoZGQ1VEpqQ0trZkZXSWtyd0JUb3BRb1FvU2V3SVNmMFV3?=
 =?utf-8?B?U09VOTZZMUJVSnZuUmk2bGtEaHowbndERGpWUzdndlVMNmZDMTY5K2lUbkhB?=
 =?utf-8?B?S2FIeXNCSFhITHRKZVZqMDB5bDlPUG5sQ3FrSWR3UVhVOXpseUNqY2tibG8y?=
 =?utf-8?B?MUJONTZna1UrRTBZd3F0aTZjeWpuSStMY3U1d0N6UEwxOU9IQ3FDaEVjcTdt?=
 =?utf-8?B?MWFsWXVqSnZYcmRjMjNFd0srT3BxbURCTUtoUTRmQ0NtaGUxNW9YMURLKzF0?=
 =?utf-8?B?MkxKN2xMaDBFd1U5Y0l0WEdkQUtWTm1QclVteHc5TnlGZVJZZXI4MFpoejRB?=
 =?utf-8?B?Qk1oK1dMNkhDZnBaemhQK3lVRlNVa3NSMmx4elg2amMxVVFZcWoyaTJ4QXhU?=
 =?utf-8?B?eGthZlM0eFlLcDBrUHNwaDF5MFliaVJkQ2tJRFBHYmZTSG4wUzhJUDRSOEp6?=
 =?utf-8?B?QVpabHloV2Y4R3A3MVBhMTdsNDUzeFdIMk1jUmhRMlZTeEdZbGk0S1JOMkxM?=
 =?utf-8?B?ZmsrS20rMllONDZHYnRaUGlBaDRUVzJYYXB3WUtUa3dTd29RcXNVeEZnTGM3?=
 =?utf-8?B?MkpRdFlzeGJNMVgyQ3gyVUdGZjJHSXJ0UC9vZVlqRHp1c0VqU1g3K1NvL3JN?=
 =?utf-8?B?RnJ3T2E0cUVYSmZvZEU3aVBsM0tDcm42SDRJUVNQRTllUW12M3F0YmdRZ0Uv?=
 =?utf-8?B?ZXhqM0VaSW5DcjJLaHRHa2VKa0RTSHpYRVNlb0FocWE2OC85NGM3TnB0QlRo?=
 =?utf-8?B?SnluNFdDYVN2Y1pDaDk5V25UMkxueXY1MU5VVjZ0cHd1UWZRZDVtVEdudWFL?=
 =?utf-8?B?b2o4YmEwdlVJakFNTFoyN1A3YmtraE9LYWt6YndWWjY1NnpISWRHcXh3WTJk?=
 =?utf-8?B?UXRTcE1WQjNMNDdxMnNqTjZLYy9lWGcxR3FLVjVjNWdBVDd1NnRUd01hTDlC?=
 =?utf-8?B?NGRpNEhQdTVpUlVRd1F4SHVrd0Z3cVROR0JRcHVWcWpWK2NVNHVyRWdxY1BY?=
 =?utf-8?B?dHArQ1dDUnNPak5sK0E3VzFKMTl2dWVuYWhTNVJ4Qk5sR2lCT29iM2MwdDlL?=
 =?utf-8?B?alVTOEJGVWp4UVpYRCtXR2w3c1FFNVdvRnVrb2Z6SmZkKzYraGhpNExLZlZq?=
 =?utf-8?B?U2szV3F3aHZncVRTS25xREZGZFdFTkdiT29pVDhodU5wV0dYajlMNGFrbkNx?=
 =?utf-8?B?ckt2UGZiK1dXd29BbzkvcnZiRzF1em5iT0lubU5nSXZHTXMxcWV0bTNFRmFp?=
 =?utf-8?B?MFNWSnVobDFub1F2b3FuRlplWE9iOEx3UmFsUHRnWFpTeGZZUmFtYzJrQUV3?=
 =?utf-8?B?MEFJYUFpZzZNVnVvRzBKa3lTcGN6TzFVR2gwUm0wWlhiU2NOa3B4OW9aVDZF?=
 =?utf-8?Q?qKMiqK4RtA5d5Ddeaobzwraog?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43e8b56b-ed36-4575-8de4-08dca24c414b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 08:25:57.9234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nuLQLI7t4fSKF4rW6zO7mAXoyh4I1CzCXZmKxBy7zrBEQYPlhJmX3ETv/OYILY6wiPtUINe029vo5BHGgGlyaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10865

This patchset is to upstream a few patches that in NXP downstream for
quite sometime. For patches directly cherry-picked from NXP downstream,
I keep the R-b tags.

Patch 1 is a minor fix to DDR alias.
Patch 2 was sent out before,
https://patchwork.kernel.org/project/linux-remoteproc/patch/20220111033333.403448-1-peng.fan@oss.nxp.com/#25144792
this is just a resend
Patch 3 is to avoid mu interrupt trigger earlier.
Patch 4 is merge small area to support elf that has large section
Patch 5 and Patch 6 is i.MX7ULP requires a message before linux
reboot/poweroff, so need use non block mu to send message.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (6):
      remoteproc: imx_rproc: correct ddr alias for i.MX8M
      remoteproc: imx_rproc: use imx specific hook for find_loaded_rsc_table
      remoteproc: imx_rproc: initialize workqueue earlier
      remoteproc: imx_rproc: merge TCML/U
      remoteproc: imx_rproc: allow tx_block to be set
      remoteproc: imx_rproc: handle system off for i.MX7ULP

 drivers/remoteproc/imx_rproc.c | 85 +++++++++++++++++++++++++++++++-----------
 1 file changed, 63 insertions(+), 22 deletions(-)
---
base-commit: f477dd6eede3ecedc8963478571d99ec3bf3f762
change-id: 20240712-imx_rproc-25f3ab753c58

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

