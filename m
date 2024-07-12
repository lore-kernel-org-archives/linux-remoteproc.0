Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010054.outbound.protection.outlook.com [52.101.69.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB3B145FE9;
	Fri, 12 Jul 2024 08:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720772780; cv=fail; b=iDyW4VF68oEVukErbGR68LYxzDBsRRuk0IPByLIsCOFYeDC5lV9d8svD+aMuiCHQaCExMdjI8gkP/GAvyGQ1bw0nd934FQjienx7o3f+ZP68OFzipCdkj53BWuTRGrkShixXFY0QMwy0aWAubge0OUDa3yGERa1mOWu+gcq+UDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720772780; c=relaxed/simple;
	bh=XJF6Xsho2Koc81UfvCWYce+LgposwVGbuNdUlbHpzrg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=XgBNAAopMtcUTT1Go5w+EQbGE84kNupS/2ih+kOuIfnKYWaG6yQOgIYpa4GcTIqWrvQxUEErXPGSrp0JRhU2v0d2YEeodtMox4EQeC5JP3cI2U5UqAWgenL3U/vj6Ger+mSSCwq7kqfMUES7ui/rzv+ztbv9C+WTl0GkK7tHTV0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=HwQcagt/; arc=fail smtp.client-ip=52.101.69.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="HwQcagt/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IlDzC5YJB3Ha+U/G2z73wdETtFwgrNZP+0Bm7Tuxs/tT/G/qmoGkYQHw4gmBGsK14s2vYmzcGPFXDYmOrJd2+xUfKXxAQfaVUyg+ur9XLHmB7HnuiHJSLSNB2Ef7tYyZ/CI6+FGWumaD/eej+cOEYxvXATDSBkNd+6eRdWmlqYhPKxuUxjwOiGiVXOsHddWSFte7lkchuJNMjQx6Cl/RglJyNuY4MeTXORK2JbxgO4N5b7ABGgTedQOxg02cRcIYQVDvwLLY7NOlxOER6W0G2KzAqyXsAIuQSKlsS0pogv1M14oqlo+k0i7mRkgrcIHuOJp2gdT3uzzoaKQNxBYiSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UUX6R497YRg7q1iy7q2/yhhuRn5+gy3qVyTi3N3KxUE=;
 b=X0N/tZh+qBAjMeYCGsmsi6axAStWR66yBanWheOLzT24TQitcKN5xULw8l+PNLgJpi19NyjK305iAI3fpEv+qpbPqn2BD9wp8izNqpp2Mc14KIjWcfZcdfLFIpzx5ix4lQKnbfmUd/6WTzhYRr0q2rS7l5YGBDmVeneOjH7aVOAmw+jr+KlZjs8Us0EvRl05IZr5I0VjOO4sj7Uq5NldM9fDpEIHSceikhir8w14rd/DR3aY86xuOd3VpI1WuZ+ncKiyOnKtBtKfxqE5/kBPhK1gzDPY/2MtndMtDqteb5uLRqcL0HwdPn63M9JUxo3xQZxf2DxSxNz9VD9YDVb7Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UUX6R497YRg7q1iy7q2/yhhuRn5+gy3qVyTi3N3KxUE=;
 b=HwQcagt/+X21LAIVTOgn+WxESDHHmC7rIZWGhx1Ycb0dujiey8i3CtevTsjmqDyqGzR+pSgryqJinyDfOLbZmhb0jh7xyBJk1ujGxGtOympdckybmfZgpG1Jwg0mgWEi2xzmSTeQFisuov2xb3iGx354UQ7OpRms8aZnyKijRuw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU2PR04MB8709.eurprd04.prod.outlook.com (2603:10a6:10:2dc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.22; Fri, 12 Jul
 2024 08:26:16 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 08:26:16 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 12 Jul 2024 16:34:58 +0800
Subject: [PATCH 5/6] remoteproc: imx_rproc: allow tx_block to be set
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240712-imx_rproc-v1-5-7bcf6732d328@nxp.com>
References: <20240712-imx_rproc-v1-0-7bcf6732d328@nxp.com>
In-Reply-To: <20240712-imx_rproc-v1-0-7bcf6732d328@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Richard Zhu <hongxing.zhu@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Jacky Bai <ping.bai@nxp.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720773307; l=2319;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=p7aJwJNDnCiunEqGoMTxl7aI0DSNvgXZL6nZNHRBXks=;
 b=oVNucySmyuBcOoI187p7YzPR4LqOFvyuL+1dvez+QJLQtwHmN5kh+JyacHsrPnEKetmauw+5s
 NVZWqQS2JNxDplPOVI4SslJyuAcEX+4vewNULpUqdzIggMkTB1oTZlB
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU2PR04MB8709:EE_
X-MS-Office365-Filtering-Correlation-Id: fde0177e-91c5-402e-1b69-08dca24c4ca6
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NGdYeTJtTnpwN0J5NDlkQmJ1TzgxN2RHT2wzcTNNUFFTN3NGaVI2Q29BeC9w?=
 =?utf-8?B?cFhmMmdSVjR5THBrSzZJYmdsT2lUZ2RnWXRjeUlxcWRuTXlCcUxRNDl1KzQx?=
 =?utf-8?B?aDk1dUgwTmJINHVxa1o2dkd4dERlWVdHRGxwVHhtazBMZm5uRVFKb2o1Zzkz?=
 =?utf-8?B?ZHExcVlLT0FNSUtSK3MwZUpaaWt2VVF2MnlrSTlVRWFobCtkRTVJNEVtS2s4?=
 =?utf-8?B?eXV1SVFjZ0xxZVJ3d1JPTWFjK2dFNVNiYk9xQXV4cVUzd1BvK1BHZzhkRy9J?=
 =?utf-8?B?TS9VakdLYTFBQkpoMWZkTWYrMTV6UjY2Sk9FalpWd2trbHdoNk1ZbERkd3k2?=
 =?utf-8?B?U1N6aWFhN25DcUhiZURtMmFuRWRJSVlnZ010NE90alUvaG0yVkxXc3VhazNp?=
 =?utf-8?B?dzBHYlpNeGtzS1JRWVpObjBsNkM5SFVwaEduWTRHK3Qwa2IySmNXTk82MXls?=
 =?utf-8?B?UU4waHprMGJpVmFPb1kySU01YmV5Y1h3QU81NFR4L3JDaUdqTnRoVUpZelhp?=
 =?utf-8?B?Uk9JUEh0K002QVZLOFZlY0YxS0JMK3pSbEo4OVNJdUxKM1JPVkJzL2F6cExG?=
 =?utf-8?B?dWdjcFBUNjA3bWczQ0RqMGtUVkdFSzhQbk92UHdwT1VEVkVFSlFUQVBGdnI2?=
 =?utf-8?B?Sk1OdjlCck5OWlFqU0ZPS1Y3c3dGM3VIR0RsOWRzQ0IzblFpWGRFczRVWjZE?=
 =?utf-8?B?ZWtaMDRET09WNTd2TE5zSEl5dHpYZjlwNitpWVJLcFZrcHEwUW1IQlNJNFRl?=
 =?utf-8?B?K0xYVk5IOGxYOEc4b3dIbzM2NHhMMGM2Yy9kQWI0cStGME1SOXR0eUlVdFlS?=
 =?utf-8?B?cjNsSkF2K0d1NGtjMk5vSUhpbHhZdHpMcXJNSVR5Tktsd2RXaGhuYmVKOEJO?=
 =?utf-8?B?WlFyditBYzczNUZtbmNOcUs1ZXRjODIxNlFvNEY4K0FPNTV3bklWK1dXN3No?=
 =?utf-8?B?SUFoeTU2dXhMTTFidmhraC8vR1lyYWVkbSs1eWFCOWt3UTdXOWJqcEQvN2Yx?=
 =?utf-8?B?ZDE4VVNyai9kS3FCOFpTNVY5SVBNVldwZGMxQmNYZTBya2dRUnA4SzZpTE11?=
 =?utf-8?B?N0kvWFc4TlhEWXF3b2xaRGpsNmUvTThMTnFjZXFrR2k5azFzRjJiTDIvZzFG?=
 =?utf-8?B?dWxFanFBMkM1WjV4MWZHZERaTFpWZDNpUzZzOG45SjIvTTVBb3AvRS9KeS9I?=
 =?utf-8?B?eW9Tb0JKdXNwa25TSkxJeExHa2RxbVQ5cnZ2eWtaVHhNR28xNXVvclB5WW1m?=
 =?utf-8?B?aGlmbWo4SFRpeVZ2N1ovSWVvdlRuUVB5TUk2UUx0N2Q4UjAwQnROZ0REcldw?=
 =?utf-8?B?QndWdzhOWkl0Nk9vSUU3VnVTWUtob2dYeEFCc01sZmZ1TlNQZDdNRXhVUCtq?=
 =?utf-8?B?UmZVdGxrS3pBdXcwUFgzQmVFTzNKWGdQQ0Y1dGhhd0l5c2svSE9Ccm8yZEYx?=
 =?utf-8?B?RHlDeFRWZEJJSnp4RkFYdFgzTTZMUU1vSmkyMTYyb0xzZ2JTVngySGpUQWNG?=
 =?utf-8?B?Y3dPZ29lUUJ2ZTBZUVVIYXdhVG1xcFpmNE1mbGRaZWlpcXphcFZMVUM2aFFE?=
 =?utf-8?B?T1lyMzhqTUtWdUcyZ3g2M0JHVmlmSW1KMDJkOGF3TWQ4UUppbE1vejRKL0Rh?=
 =?utf-8?B?dU1zSUpTOUtPVEdtSFZOblR2bXp1UW5BYmxzbU56KzUxckRNSmZmSXJlTEZx?=
 =?utf-8?B?OXdoR3BXNkRkNVhkcTZNWmtFSE5jZlE2dDBZcjgrSVV6WXRTYllpcktBdlBn?=
 =?utf-8?B?cDZGNTEySXNwU1c2NkFvMndMU2t1a2pQd09OSm56bDRWT3QxYVZuQ2tpSm9F?=
 =?utf-8?B?WnJSYzZlbUxsVk5VZi9QNzVXdlhSeGQxeWc1QXo2V0cxcVg3eGhObjQvQ1p0?=
 =?utf-8?B?cmJBNnNiSEpIN2pKRkNzdzlGV1FVYzA3UGY4MW5kZHFtZ3c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cnZOTlFBRmgwMXZlT1ZnL082YWtod1ZrbGpyNmtkcVhTUUFiOEFxc2NKTmRz?=
 =?utf-8?B?MExtN0FtWW9NZkFxaXlJNVI3dGVyTWdXOTRvaWRWcUQxV1kxY3o5M0hhQnJ1?=
 =?utf-8?B?bkw2TUhiNWhBMUkwS2hiajA0L1lXc09uTzdDT29pZWFUd2s1RjdydHJiaGxG?=
 =?utf-8?B?OWpmMEdEcGRPNzRyOWVuZFg5SUdNOWZTUjRnbHFpaFNqM2dDVnFBOFF0ZUF4?=
 =?utf-8?B?VXB0T29rV3h1cmJoS0xybDlTR3J6dVN1N3E2SXVvYy85RHF0VEtUb1JjUWd3?=
 =?utf-8?B?cWpNd2xHTUI4WVcwN2lFbGliSnhYc295VWZ2OUlQTUFUZGo3WGFGeUo3NjJ0?=
 =?utf-8?B?N01KaUMyYVFvU1RHb2p0K0phRXRRK0R4UHNhNzNHNXAxbXNrRDUzRERPVkRy?=
 =?utf-8?B?eDZvdGE1WkRrdkU2RmNtK2lYWVBFdkNnRXlmY3RpY0NQYXQ4cXI4a2dRNW41?=
 =?utf-8?B?QWFFU2pBQlVxQ1Q2UkRnZW4xM3A5YjlmaTQrSitHd1JRdndOcXlSUWNDalNn?=
 =?utf-8?B?bmNkbzMvZUM1RXN1c0U1SDNQakh5ZkpEQ0NsaEtrclFCOFIxaU0zbFRYVWFi?=
 =?utf-8?B?NlErUTU3ZTdNUTF2eC9qMVJKLzhoWk5pd0VJWi9XMWtrU0NoRFFHb3RuYmxL?=
 =?utf-8?B?cVdFVG9IMUYyOHlqNVNiSEFNcmJNcGN0RWNlR005ODN6cnhiMnZ2TmFrWGJx?=
 =?utf-8?B?NXMvUXhvbGJKODRacVpjKzBpTTRxTzhGSDJYM1d2M2pBa0dWOEhVTHFqNGFD?=
 =?utf-8?B?OE1Va3lCZ09ldlJxYmpmQXp5NHo5L2VwcVlmaXNLa0JDa1NJdjhZMnZiWlBa?=
 =?utf-8?B?UFU3Z0I3d3FwZ2s0anowK09BenBEemo1YjdadWJ1WkF2aDdnVGhyLytBYUFK?=
 =?utf-8?B?K1VnQkVhRXRuSHRCY1ArdjhzMG1ZSnR6dnhCcjM5TllIQy9yYmQ1cHFjV0dh?=
 =?utf-8?B?amhtNi9LYTZXMmdtTktTdFdDU2NDRE4wb1hKK096RzB5aWU0Zm5Da2ZJTzlJ?=
 =?utf-8?B?b0VDeUNJL3o4ZHV1TDZBelYyT1YyUVpLUXg4SWRBeEJNYUhsRGZDQVU0VWdh?=
 =?utf-8?B?VklIM3ZqQWZSNmpQMU5uSytGME5UK3NOZ1FPVXRwZW9rditlZG1Pa0gyMUZt?=
 =?utf-8?B?cUdUaXVvUXhLVE93Rzh2WmJ6NmJldFM2UURteG0wQ1N1TUd4KzIwdnRMVkJu?=
 =?utf-8?B?L0xUaVppK2ppYXJxTm9JcVJ1WnBEVWU1ajY2c2RjK0czTldOQkoxZDZyUlBG?=
 =?utf-8?B?ZmNmR1ZLOSswZXJ4SzVoV1ErMjd0aHE2SUdmZTBWeXdXZ0RVc1pORFlYZzYz?=
 =?utf-8?B?R3JhUmFHRmRtR1lTS2ptSTNJK1Q5MHU3TFB2R3pldHdjQlBMd0k4WUVualZm?=
 =?utf-8?B?YWp1eEVQTWg3bDVWU1NCeFNtbHNFc0pOZjVtWjhJOCtxQk5UM0h6Wm1kM3BP?=
 =?utf-8?B?cUs2SVRBMGhVVVpoV2x1c3VQekFYNFFSemZ3dUEwMGk2ZHhHTFY4UUk5RUdY?=
 =?utf-8?B?ZmZiZHBUaWwzMEZHTDNheGxHRkpZZnlCTEs5eUFFYThteURETnk0YmhUMzZ2?=
 =?utf-8?B?UzV6YnRBQzVOdStiMy83WWZ0L2JuN3hxTy8vaWd3MTNxOGk0MGtYWE41UTF1?=
 =?utf-8?B?NGVSQ0trUFpiZUQ2Q0dtTDR4dkh2YmhwbFBSU29QeVNwZkRRWDl4aGtBRXdD?=
 =?utf-8?B?ejJDRURGMndDQkk3QUxkYnNyUDVJQnZCV2RtYUlXb0FJQjFOWUV5U2RMRGtr?=
 =?utf-8?B?UlQxcnY1N1BjL1Zrbk16cDZqR1ZObHdhK2tvVlJIREtCNitKWmdoOUhKcGk1?=
 =?utf-8?B?RkJOTGJjczRNK1R6ZWJGYjdQU2pNY2UwWW9Pc1lZUmtEREM1U2hLN1BNVXBJ?=
 =?utf-8?B?VlNMTGtjZ3E1enpUUitkc1J2ZlQySndzYWs1ZEZOcFRlVklFOWRyK2k3M3kz?=
 =?utf-8?B?UnZpY3J0YXNaYnkvSU1mNTlseExRWjRNdHRrYjlRRGQ0clB2REgrdjJtQ3dU?=
 =?utf-8?B?eDR6OFE3b3hnbVlJbThSK2dQY1dJZTI5Vkxmc2JpakFVSHdKUFE2TXJlQU43?=
 =?utf-8?B?dUFnMUlNbUh2aklnUjhlZm91ait2T0FBSXd3eXk3YStxYkl3Y2JVZnZ4Tndv?=
 =?utf-8?Q?oEmoX/xM4crhlYJ/n0G5jLZ8u?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fde0177e-91c5-402e-1b69-08dca24c4ca6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 08:26:16.7902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +goJhrMDSxft3VAHBJGMTkBbfNyxyzlhhmyXgZhSb1XpTrGdbGbAtZU8F8pYOoxnO7OEumL8+V8XooBFNsr6Sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8709

From: Peng Fan <peng.fan@nxp.com>

Current tx_block is set to true, but there is case that no need to wait
response. Linux just needs to send data to remote processor, so let's
allow tx_block could be set to false.

Reviewed-by: Jacky Bai <ping.bai@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 552fccebf7e2..01cf1dfb2e87 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -90,7 +90,7 @@ struct imx_rproc_mem {
 #define ATT_CORE_MASK   0xffff
 #define ATT_CORE(I)     BIT((I))
 
-static int imx_rproc_xtr_mbox_init(struct rproc *rproc);
+static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block);
 static void imx_rproc_free_mbox(struct rproc *rproc);
 
 struct imx_rproc {
@@ -369,7 +369,7 @@ static int imx_rproc_start(struct rproc *rproc)
 	struct arm_smccc_res res;
 	int ret;
 
-	ret = imx_rproc_xtr_mbox_init(rproc);
+	ret = imx_rproc_xtr_mbox_init(rproc, true);
 	if (ret)
 		return ret;
 
@@ -629,7 +629,7 @@ static void imx_rproc_kick(struct rproc *rproc, int vqid)
 
 static int imx_rproc_attach(struct rproc *rproc)
 {
-	return imx_rproc_xtr_mbox_init(rproc);
+	return imx_rproc_xtr_mbox_init(rproc, true);
 }
 
 static int imx_rproc_detach(struct rproc *rproc)
@@ -794,7 +794,7 @@ static void imx_rproc_rx_callback(struct mbox_client *cl, void *msg)
 	queue_work(priv->workqueue, &priv->rproc_work);
 }
 
-static int imx_rproc_xtr_mbox_init(struct rproc *rproc)
+static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block)
 {
 	struct imx_rproc *priv = rproc->priv;
 	struct device *dev = priv->dev;
@@ -817,7 +817,7 @@ static int imx_rproc_xtr_mbox_init(struct rproc *rproc)
 
 	cl = &priv->cl;
 	cl->dev = dev;
-	cl->tx_block = true;
+	cl->tx_block = tx_block;
 	cl->tx_tout = 100;
 	cl->knows_txdone = false;
 	cl->rx_callback = imx_rproc_rx_callback;
@@ -1083,7 +1083,7 @@ static int imx_rproc_probe(struct platform_device *pdev)
 
 	INIT_WORK(&priv->rproc_work, imx_rproc_vq_work);
 
-	ret = imx_rproc_xtr_mbox_init(rproc);
+	ret = imx_rproc_xtr_mbox_init(rproc, true);
 	if (ret)
 		goto err_put_wkq;
 

-- 
2.37.1

