Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2070.outbound.protection.outlook.com [40.107.20.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC381CB30C;
	Thu, 22 Aug 2024 13:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724334018; cv=fail; b=MddWsBLGyp7ZJTeU2pErTbSYphhmDDvjlYBr9spkOjbsgP0gRHXzYjexG5JZse2LzSl2UrcbjIocVmNzirXBaFy8WdU8NTbRFthI5B9qBZ4sWVjvPys8mbXA6yO8uN/Jb0RHnu7d5yrI9YzT7XVgXW+o9Z/MHXfzn2pQFOgawso=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724334018; c=relaxed/simple;
	bh=2c1Tdc//SpqRuEFleWpbSpnpm5Zz5h3NxNQRqCJkfMc=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=cQU66QlAJVrrv4RhAtpGxCN9dirmtCrhnB590x/x2X4esjoHbuGebYdt9QbZbLuwk+Y2WHm8kseoD/xpKEhBFiw+0GtVS7XhK1DT5PrvmrWudcBr3+QTbTJYXmGcKhYf92e6kU23DrDHGpqU4W6vjFD8l42JnO/UipPDd76pH2c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=sOKQFoTl; arc=fail smtp.client-ip=40.107.20.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="sOKQFoTl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HtTIw7I1Y2zi/9EzxBwOKLsjRdAWemJhybCf+011kj4UCHHh7XRBh2L3gdCs2NjVt/YLFiYlMMjuS7+MDhxznGGSWlFMBJ44anNVDidpWadNwaBThhKxCYN5NlPg9t/5jhsTPtOuEL1amW5ySS1KZ3XPW2qLESJJ7SMZzhPYoKvRAiCHh1D4fQm5W+ydIwN/+J7Y77xh7csg4PEw+uRpC8oaDL5GkH2omQLLV5wQespsS12QTuo9CxD4KUUMtLUFV3UsX0UCBa1yi9p0i9bJEMfWZnZO3iKGKkxJ4njP2Of3pLXPfB5jfsrY6dEe/J0iJmh7eqFT6VRvcGxXJRc+7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=68G/TYAvloXvSBmmvY0rM6I9gK4aRAneNSnIBDgZFZw=;
 b=Q0b3DRCFUXAwPw7+swTMWcKWNnkvzboyUwqi8C8MuMergxCnDTsylqpQzQxPS5h84p+YTrgaA4AeQwbZwU4jWJaKHtfVUozktldQ4KC8XuFLdodyNDQfsmgw7aRQSr1aMB1o1agJ5C2ncJRMWynxl3AkdDUzKnTgKyF5SHwyzC7tYBzjOgOtjTEIYK9mKGtNkM1kZwPpTuNf6udAX2GiLsypbGT3eKfKkdIkSdMc+pcibvrzG8dVZvrmRpTjBEFdBC+7Z1SVGreXLDKlFSlIgj3O9qQJ88VD7Q6Mg+Gg7arIs8JCFla5DMtsQr8E2+NE7bmNbQYfj5NL3urzlfyW6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=68G/TYAvloXvSBmmvY0rM6I9gK4aRAneNSnIBDgZFZw=;
 b=sOKQFoTl2Z469vDDKPsoUY6aFy1q0ufou+3WjV6ZfYHORzLngEEZzc6R7xrARDXmZCzTQIUmwgv+Zmx0/ACLqXxeIVvdO/8id60WcwWW0p/VfAXLai8KqSZz66VEbOElVPsAQwhpQOPnN136VFaMF21/mmWnbfrnVsC4xJxnDzuw3OpAEwUvOlEMyFInJMiQj81hJKOQiKPxI6+vEFgZ4EYzTdK9J/+X5cUc4mMHFhPljGYcUR2ZyFJ9Q6qeeGLs/cVrAtzo87c4WyAb+/TObgsi3K9/IfGKFSxQ7/BEZ2y2XGc67nq1ui5Y5cr+eqFvA1NiBwGcyeyH5C0GGAluLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV1PR04MB10126.eurprd04.prod.outlook.com (2603:10a6:150:1a5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Thu, 22 Aug
 2024 13:40:12 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 13:40:12 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v3 0/2] remoteproc: imx_rproc: support non-blocking tx for
 i.MX7ULP
Date: Thu, 22 Aug 2024 21:48:48 +0800
Message-Id: <20240822-imx_rproc-v3-0-6d943723945d@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMBBx2YC/3WNzQ6DIBAGX8VwlgYWEe2p79E0DfJTOSgGGmJjf
 Peih9ZDe5zNN7MLiiY4E9G5WFAwyUXnxwysLJDq5fgw2OnMCAhURFDAbpjvYQpeYeCWyU5wpni
 D8n4Kxrp5b11vmXsXnz689nSi2/VXJVFMsOiUrQUDzaC5jPN0Un5AWyPB0WuPHmSPEk2gbpQwH
 f14ZfF3r3TDq1ZKZqn9/lnX9Q37lb8RCAEAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Iuliana Prodan <iuliana.prodan@nxp.com>, Marek Vasut <marex@denx.de>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724334552; l=2424;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=2c1Tdc//SpqRuEFleWpbSpnpm5Zz5h3NxNQRqCJkfMc=;
 b=RECIKpxkaiyiLPh1jNd4VamzfqMnSWfeIbSmhmOwHPwi3zouVMjjekty40Yik2NVhNpbf8Fox
 IPhfB3QkigBB2eM86yqsLzrUTzR/7SsUyOSe+kyOEMWUPT9TyCaN0Sp
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR02CA0051.apcprd02.prod.outlook.com
 (2603:1096:4:54::15) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GV1PR04MB10126:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f53540a-e52b-4970-fe48-08dcc2aff278
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Tlp2d1pRVzhsTmg0bzNyTlFXc0Flc0F3cThhVnFGS0FHMlJua1FBc2hLTnda?=
 =?utf-8?B?T2RzblNVWGtUMS9yY28zYTd5MU96VHg2NzJQSGZDY1IySnJzbTUzNHZSU0tL?=
 =?utf-8?B?ZllkRytzWHhiQzRndVFIZnBJZUZaSHQrQVJNVllpN2pyQXVDVFRBQ25zZktw?=
 =?utf-8?B?dEFuRUdLeHlEOGZGd2FneGZFeEhpNVJPMVVReFU2cE9uWkRoL3RZS2VBYm11?=
 =?utf-8?B?a2xJMlJHdzdSVWR1VEFkMitsYzJSTHlQUGNHeFlZN2ZPNTg0VG50cXY0K1Rh?=
 =?utf-8?B?YXJ4ZDdIVi9aS0tBK2c1Q05VMnI4a25CdzlJejFZK3B6a0xvdEZWbm1RNE9m?=
 =?utf-8?B?SUw1N0g2RUhxZCtEZzY4ZjUra2Zta3YvUis1dXIwL0ZId0lCNFM1alZSTWJh?=
 =?utf-8?B?NzA2dStOMDJkZzlMYnhuWE5vWVRscldEcE8vOHBsOFdBcEN4b1RCS0w3TU9Y?=
 =?utf-8?B?dlpVN0JSc1RBWXlCT01jZ3JnVWFXeSs5K3dVZDJIQkRHMFY4SllsTFAwSi9M?=
 =?utf-8?B?b2ttZG50emR2M1pHNEpZWnFhcWh6TnhsQ1ZBZmFjcU5ZUXpVZDFXODRzdkEz?=
 =?utf-8?B?S1JYUFRZVzRSbVpLcmF3L1UzTUk2a0xBb0JvZnNvcVo4TWRIY1VKVk1Dek5E?=
 =?utf-8?B?M2dMYjBGTzFZQmRWZHNMK3pJWVd3U3NvdUV1UW1jalAzZW1Ub2ltcDdNVitR?=
 =?utf-8?B?RHlJRzNZM0xDRGhkK0txa3A0YlQ3TVlaejJ1UkhlaDJrU3k0SXVRdVhwRTIw?=
 =?utf-8?B?WXo2cVdNemJoYmlhNnBMdjNGVGFSa2ExY3ZsZDN2SVU2N01kNzBtNGdMWFl0?=
 =?utf-8?B?Nk80Q0g1K0YwUHMwUTU4UjhLN3ZNb0t4eE91RjZlT3RUV3RTekt0WnFhMEYr?=
 =?utf-8?B?S3MrVFY1VUhpWk5PVVB2dXh2L0ovWjVWUGhvQjdDY2VnTlFENHpMZkJDZHY0?=
 =?utf-8?B?WXdOcUtRS2JMYU1ueEFhdDQ0ZTkzWHcvb1BMbmhYVXQ0blczYzFMRDQ5TkE4?=
 =?utf-8?B?QU4xRWk5R2w0eng4dWx5MkhkVmlMY2ZYWUh3dWpzaXJKeG9uRzNIUlQ1bHJO?=
 =?utf-8?B?b2N5ZnBvOGVEUHNha3JQTnhDK3I5YnZLNzhJaklEbXQvdGd3QlVHd3R4SHRO?=
 =?utf-8?B?NkdaT3RnM0ZLaWw4ejM1cTRLbXZHMCtLaCtaRzMrSzh5QWhpeEN3eVlnZmFq?=
 =?utf-8?B?bzFLRXljZ2dWQy8zYXJUQVZUUEllQnZKckNlcHpnQkVjU1U4bTFWVFJBWUZN?=
 =?utf-8?B?WVhSNzJiTjd0TVVVdVFwOEo4dG9VV2U0WlR6YXV5b1JaWXhMZVFFM0lHRHRY?=
 =?utf-8?B?NzhiaHpYMUR0dlhjQkgraEpBejFFVndNcEpXRmRlNGJWV3p5Lzg3VkR5NVQr?=
 =?utf-8?B?SS9YZ1lzUEtaeUd0TW9WaWVaWEtxdXloN3IwYnQ3bG8vQjI2TEVBVENlNHpw?=
 =?utf-8?B?ZStDZFQyTmFHSnBIZzh1MGExMVRDc0gxb09ja3IxL0hsQy9BSk5qQUJpUWNH?=
 =?utf-8?B?NVVreWExRFIvRjZvTS82dlZ4dlM2ek80ak1RamNMYTVOdzRHbi9uakRkeERD?=
 =?utf-8?B?czIySDVoRUtjdTJDZHRacmgzSFUyWlJteVV2cWxPbW1zMXZSekRmVEFSbW9k?=
 =?utf-8?B?cHRPOHlCSTcyVEpIYyttWkc5bS8zL1pqNElvelc4NFVKQnE4VjAvaEhhcWRz?=
 =?utf-8?B?ZXIxMFNQQkZ4bWR2dEhIOElNd3VPUUFIUVN3emUzMVZUcjlPazZaek1CUmt3?=
 =?utf-8?B?SFFnaGJqbTFiTk9wOFVuaXlyUkhkSFErODJCOWdzMUYyL2pyd3MxeWo3ZWxT?=
 =?utf-8?B?MnFVYzQ5UWxhWlk2SjVyNjJpTXFmN0dOaWNpNUxwOHNVR0xkY0tkZm9uMDBL?=
 =?utf-8?B?SHI0dCtxbVlkS0dEdTJtUGhadC9tNm1FdXhmQ1FJMnFEWmtJVzB4Q1FuOUFu?=
 =?utf-8?Q?NF2jOjZzzU4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTgzOVhkQ3NEM0puNE9DMVB0VWU4WTNISXlkdG1qMk01bUNjVHZKb2h4R2Qr?=
 =?utf-8?B?Yk84L1ZaWlpIcFlRbUZQNjJoTE5TaUpZcElyZXJ1T0pMZklyNHhuclZ5bXpN?=
 =?utf-8?B?SG9jQ0JyeFUzU0FlcTYrU211YmZrNkYvSmt5VUszZWhTemdFaWxzUGMzd29C?=
 =?utf-8?B?YmVwS0lGQnpkMFk1UkF5dkhOMVY3eWw2ZWFNY1ovUEsyelpSR2FhcXBjSGpo?=
 =?utf-8?B?S3VjZjFZYjY2bHRQVU9wYXFFaUFwTmNFcnBISkJpbW9ScFFIOGVXUzQ4NXNC?=
 =?utf-8?B?aXdBSnV1bXNtREs1NzVtMFFsYjEwY09MeDZ5eHpOcUh6VFBWdVNkQXNnTU9H?=
 =?utf-8?B?UVJQbVJPUFFpdXBvNnZRZnRkYlhJRk5Bc3VxS3A0UEQyUzQxczFMbmVUcGRS?=
 =?utf-8?B?elVWcy9udlg0MXh5YWRHczlJWE1NK3NmaGo4eFlEMnJRYTJ1Y2l1N3lkbWJF?=
 =?utf-8?B?a2xIbTVMU2RWa3NuNFBHSnM2bHkxRFhUeHNDSnJYVWRvanR1OXN0NXdhWU1n?=
 =?utf-8?B?SXdNZmZwUjdDSm9nQ3pQU1I2djBrS3M5K3k2aGg5MjZSMXZSYjIxVFJQeWJ4?=
 =?utf-8?B?K00zVXF2N2dvOVRXc2g0RExwbFlhZnArSVNtdmtrSkVqa3NUWTRKVGFIQ0pC?=
 =?utf-8?B?K0VYMFYrYVl4RnZmTEhvMGJXS3BIeXc4QjZkR282L0grMDhzK2M2T0Q3K3RV?=
 =?utf-8?B?N09MNjNkN0F0UjJ3WWpsbGpqU0xJaForZlUxY0xFbXVvWGdlVTcrazN1VU5o?=
 =?utf-8?B?cFRSc3hXWkZDYkFyZEdLRzhoTCs3OXNFQWJEcGJyTzI2UlA3d2daYndqQ1VV?=
 =?utf-8?B?SnF3VzFhdEZjMGYzZzB1c1VPTkFwNmFzenR5K1N3WmlzeTljOTQwZjRrZHYx?=
 =?utf-8?B?RGJFby9RWS9leTNVMDRENkRLS0VSSUE2cXdRcmo4cXo3Qjk2dnRCUTc0bnJS?=
 =?utf-8?B?aG5Md2hVZWwrZ2M1SW0rRG5SU05qSG5JdnFycDVsdG1rRW9GZlMxbkVzaXV4?=
 =?utf-8?B?azQ0VFRVRlF1ZmMyNy8rVWpUUkdCSHkzNjV4Tmw0a1NBeEdZMDM3YjJyRWhI?=
 =?utf-8?B?ZkV4T0luSkVGcms4enZHeTdmU0pGTkhqbnQrd3EwTEQvVVBBS3BCRHJpZVVk?=
 =?utf-8?B?c2hRRlk5QnVLWWJtN3Uyc3lRczVEZjFSZ2lEb1BtTHRrWTIwejQ0RlN5L2ox?=
 =?utf-8?B?U3h1Y0xCZVZzSmwyY0JGa3lPWlpxMlpKM0d0ZDF0LzVTL1ViWHZSZWh6azFp?=
 =?utf-8?B?dmUybm9DMkxwZEVJV2VZS0pQbHRjR3p4cVorcVFyOUs4Qmw0c3VkN2RCalpj?=
 =?utf-8?B?NVhQT3pCN1VYVmJSSVZJdUkzTFZzRmVhWDh5azhMdElrZVlPU2J2VXNWeUdS?=
 =?utf-8?B?SkpoQ2FCNDhsVW00WDQ0cnFEcEVxUnZZRkpDNzZjd1YzTkRyUS92MDI4Z1RJ?=
 =?utf-8?B?WGxoMVY1ajlNV1ZKK3BtcU5EbzBWei90VXBqU0VQUDZPSElzUC8vMm9pV29J?=
 =?utf-8?B?U1RVRHpRLzlGMTdCa3QwWE40ME1uMWh6MWg1STB0SjBSbGJ3dEFKdStNYU1N?=
 =?utf-8?B?NWM3Y3gyRkY0a28wb1VaeWdvbFRWbmcvYndYd0VpT29oWEg1ZEFJbGJ4L08r?=
 =?utf-8?B?Q3dGRGdCdzlYSkRHTEV5TEZMRU42by9BUzVqWllhVmpaWHcydkJzWEZLN2da?=
 =?utf-8?B?RUlWMTJQSk9TWEZvZmdVbHVHQmxOdDZWWE5hSEoxOXpudEJDSTRGem5wdWVv?=
 =?utf-8?B?V3ovSmdSZ1BLUUd1M1N1STM2WmxGL1FRUDhqN3FPc0g4MzdCQzRjaFRCVEFL?=
 =?utf-8?B?dU44YUw4U05MSW1DdEpKWEtzSjh3b210eHVLUG9aK3ZuMVdac2ZwSHhxUWNL?=
 =?utf-8?B?aVFaWlgyV3h3RFIxR3g5RHdHL2RRaTYyWGJkSldCVW5hNXZoWnZaL2FKYmsw?=
 =?utf-8?B?WlNBcGxnS2puMWNnWGY3U3ZaYkN4UnhZaHRTL3JYT290QWJSY251YnRNeDVW?=
 =?utf-8?B?b1N5UzRuaGhMSFQ0TzhZVDl1RndOelFqN0FWMDQrZW4rM0F0elNoT0wvbXNq?=
 =?utf-8?B?dWo0bmNaaTVnNyt2SkhiajF6cXdvdzBObGxlM2h3bE1zdWhUQ2NHdXFYcWRX?=
 =?utf-8?Q?NaJ5epG6+co0Of4gr4KJaDebX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f53540a-e52b-4970-fe48-08dcc2aff278
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 13:40:12.4966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cNZnH5OwDnhuamLLxOZqnBEtktPwSdKHEUR9QDxgBI8lTBYMERV1f0qSrTtR7iF7mRnt8wKnO5xPamLEfQAGEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10126

The i.MX7ULP Cortex-A7 is under control of Cortex-M4. The i.MX7ULP Linux
poweroff and restart rely on rpmsg driver to send a message to Cortex-M4
firmware. Then Cortex-A7 could poweroff or restart by Cortex-M4 to
configure the i.MX7ULP power controller properly.

However the reboot and restart kernel common code use atomic notifier,
see kernel/reboot.c: do_kernel_power_off, do_kernel_restart.
Linux 'poweroff' cmd will trigger kernel 'do_kernel_power_off'
Linux 'reboot' cmd will trigger kernel 'do_kernel_restart'.

Power off and restart are totally different operations and are not
complementary. So need to make sure the mailbox be changed to non-blocking
mode in SYS_OFF_MODE_POWER_OFF_PREPARE and SYS_OFF_MODE_RESTART_PREPARE
stage. Otherwise with blocking tx mailbox, there will be kernel dump,
because of blocking mailbox will use wait_for_completion_timeout. In the
poweroff or restart case, there is no need to wait, because after M4 got
the message, M4 will put A7 to reboot or poweroff.

patch 1 is to support non-blocking tx mailbox channel
patch 2 is to switch to non-blocking tx for system poweroff or restart.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v3:
- patch 2: Introduce an flags entry for dcfg and set IMX_RPROC_NEED_SYSTEM_OFF
  for i.MX7ULP, drop used "struct sys_off_data data" and add comment(per Frank).
  Drop R-b of patch 2 because of this change.
- Patch 1: commit log rewritten and R-b dropped.
  (Thanks to Daniel).
- Update patch 2 commit log and cover-letter to clarify reboot and
  poweroff are different operations and not complementary 
  (Thanks to Daniel).
- Link to v2: https://lore.kernel.org/r/20240719-imx_rproc-v2-0-cd8549aa3f1f@nxp.com

Changes in v2:
- Separated patch 5,6 from v1
- Update commit patch 1 with adding "No functional changes"
- Link to v1: https://lore.kernel.org/r/20240712-imx_rproc-v1-0-7bcf6732d328@nxp.com

---
Peng Fan (2):
      remoteproc: imx_rproc: Allow setting of the mailbox transmit mode
      remoteproc: imx_rproc: Add support for poweroff and reboot

 drivers/remoteproc/imx_rproc.c | 54 +++++++++++++++++++++++++++++++++++++-----
 drivers/remoteproc/imx_rproc.h |  4 ++++
 2 files changed, 52 insertions(+), 6 deletions(-)
---
base-commit: 33a32de2d79c051f27ed57c4ac90cdb406f91928
change-id: 20240712-imx_rproc-25f3ab753c58

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

