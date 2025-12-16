Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013004.outbound.protection.outlook.com [40.107.159.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D601922AE7F;
	Tue, 16 Dec 2025 01:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765849896; cv=fail; b=oMkIixerq3OTpla5TQnxsegDh1DZP80235+1M7y4+/Fpxd+KPvVyJPbTGgUk1s2WrIT3EAM52fxTFA97+FqIFjlusb9cm1LUnokdbHlNb5D7F4cqknwiq5Q4bGTn0MguQl6kQV1NIBAJ7vYhI5u7lwFMqAtHWIaJFHVJUNTedK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765849896; c=relaxed/simple;
	bh=PR24i7fSdksPETrqWMVvUmuOwBBOF5O14pmfcQiuaCg=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=OuzHLpgafMeDx6HWRRQ7vNjD8d5ZXljrQCpMpJo5W+wWeXEPUrVEKOP8a/jad4l0v360eK1dYQQuDMtrU1MXMATC4lHfLUaVGrM7b3pkOIV1WQQ52pF1BAT3ObUWf3LZydDWQQ9Qm8J1DpYku1KYbO4knQfv55nntJvaC9PFJyg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ab/ib3jV; arc=fail smtp.client-ip=40.107.159.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ab/ib3jV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fMbuwfvxl6pEHbIWNM4xjFUf3Hxflj5PtDU7j6pwVC9FF6kbtcCrJ1FAxtPIiLo17gWCaiT11XYbMvxsX7fhuSU6gCd9dDAeSCpaUZi6yav5IJ2TMnDQDRKAg3bm0qUnQ2Ccqi6vNjsERsYApMm21AZB/o2DYircnxRnHjwE7eH5eHySMm0bYX3+nuhPcXlMBWc8WNZvdqQCCjX60Yvi/oWiAKsfltmQLU/MKxw5jnA8z4MrRAqpBL4Th9PAN8Stqj6gSIxQ46Dw8NLSdaWcXqMmqnuAon+MNyiO0b3RwVJDL/Yuj8IuFPGk4mZ6vV4/aCCoILzn2FtH2Zz747P5Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vNUccsZ2EKFvf6pKVWeFKkAG9R6FkML074UKIn588/g=;
 b=G+eFyUUTu40lZlffEKQgqSyafi+Fi4L2PKNUi9Nt/UlFFTZ09jK3b+wFgmoITIy5hYoYOpHtkOVtfFtQyH/gbCLDCPiSIe8vaskOpxTF9PX2uEKU/stbs3AXWrv3Br8CCgDAkjqkQrKzEeg/niH6uqUWokTrTJNaX5LQoumic6fVQWU1TlprRlKt0Q+fqDJl1Pm93wScRhVkilTaDUb6nG6lMUN5F4fLis3vFHD/7fPY0B0TItlqCWc2Q/HZSoIGTaAjJ+JCObX8X5LwAR4cqe+kfgN1WqoMf4WFPGopIf4ddJLpAQOCgxXQC3Lg6V9ZYl4LeZenPlXS8h78BgMhpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vNUccsZ2EKFvf6pKVWeFKkAG9R6FkML074UKIn588/g=;
 b=ab/ib3jVzcpOwa3VuGSiEqY+95KTrxQUKMFVKL8342WOLpMzNUtGOtV++qcCt4X+ctpNSIsYoXljrvhKism/AJJ089G4gZIENn1SeVsNdkJItrRL19TIUw+PGDLc8A7fycSdaqLvyitD2Ct2Z7rDYMdw3+fc9W1nw2Cf6PVt3617jXOhlkQeZYRVNX3cAehotx7hapclqCycheF+puKbaPGWBv48lE6fl/ON5najJfl3Msec1Z0RuULyuQSGOAsaoR1KtFZpcdgNQ0s2HaZRzZJesiEJ+HAqiqzXoY7iKx/0VPUg7KVyKwE10MJR36wH27F+jVMDPcfMbFztGyM88A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM0PR04MB6915.eurprd04.prod.outlook.com (2603:10a6:208:187::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 01:51:29 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 01:51:29 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v4 0/5] remoteproc: imx_rproc: Support i.MX95
Date: Tue, 16 Dec 2025 09:50:58 +0800
Message-Id: <20251216-imx95-rproc-2025-12-15-v4-0-bf1064ea8daf@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAK7QGkC/x2MSwqAMAwFryJZG2iDVfQq4qLUVLPwQwoiiHe3d
 TMwA+89kFiFEwzVA8qXJDn2LE1dQVj9vjDKnB3IkLNkHcp29w711CNgiWgJbaExHLu2CZ4gj0/
 lKPd/PE7v+wHcB+rLaAAAAA==
X-Change-ID: 20251215-imx95-rproc-2025-12-15-1200ef764ca2
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR03CA0120.apcprd03.prod.outlook.com
 (2603:1096:4:91::24) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM0PR04MB6915:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c7cf4b3-2a11-4fb0-7c98-08de3c45a12d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WG1EZFRlcVFORHdzMXRONytTSk02V1E5dVVPTXlzbURGTmlLWDJhQUtiemFC?=
 =?utf-8?B?ZExHT0ZRVU4vODVvMmRWRGJXbzRwRENYRmFSYWlqSjlJOXZQQmJhV2w2OFNY?=
 =?utf-8?B?d2ZjUm1PQTJnYm5UaGtVbXJYMDdaaXZHZjV4eXJOcms0VkJPNlNRcTh4azAz?=
 =?utf-8?B?R2Fzd05pZWZpcGxmb1dBM1JXeG5kVlk2VStnZWlUK0NHZE02ZW5QMWFYSUdq?=
 =?utf-8?B?RG5veHpkbER4N2hqV0xXMVJXYTROVWJZNHlxN3lMbEdWTlpPUFBiNTl1TDND?=
 =?utf-8?B?U3dXdXpVcHRlSUsxWjdoWG9LTUJpdnJkMHhyeHlHS01Fc1ZuSGdiWUc4MDVC?=
 =?utf-8?B?QklEcWQ3MjNIellyc1QvWkFhSXlmS1l3UzVnSGxRTUR5dG9DVmgzMDREZGhW?=
 =?utf-8?B?cnRWSXJJWnBHK2I4eFRaRDl2OTM5NmNtZWo0NCsvTnM1VmZyaWdzRGFLcnJr?=
 =?utf-8?B?cjRWdzlrbjN4elZZN25TTU50Znk1MWlDSThtMlZTQlduNkZURzdvVlVVVThT?=
 =?utf-8?B?SUIyMFNZMGd3Vm5nWUIvOHFLNGhOTG9zMDAxbTdoazAzY3FHaUd6YTJJQUIy?=
 =?utf-8?B?dm5jTkp4WXkvcFUyUkFETUROelVBelpHTG01VEVObGRsK29wa1lkdTNCd2M0?=
 =?utf-8?B?WkQzdGRiZUNVMGllM1daT1FBREJWYnlDSm01MG5BUVcvc3RZazZsTDVCQi9t?=
 =?utf-8?B?SEdNWkQzZEJyUmZ6S1ZnYkpGTHFmdW9LNU1JU0FkR0J3Y015K1Z4NHJCUUg0?=
 =?utf-8?B?bGc5SCszdHUvRnd3dmxJODZmazloWVphSTJPV2pGcm5DU2ZQNWhldHI1WEVx?=
 =?utf-8?B?QWVPVWthcUVWOEdiWWU2cSs3VEJBcndKNG9OOW1BRlk4ZkpNeXNPZ3RqUE43?=
 =?utf-8?B?SHExMjcvMEg1ajhGNndnZmVOajZBSm5hYWl3WWI2b09KMHMrVFlUTjliUkxz?=
 =?utf-8?B?Z0RwQXk1bm16WnR5NGk5dTJKYXcwTkxmdHdoQUN6RWZqUjVZdmJNK0lLVE83?=
 =?utf-8?B?RTdtTkZxeWFHSGtncHoyK1hGUEJvK21pbWlwNFNJbnRzRjIxZ25XTmpTVGRu?=
 =?utf-8?B?R1pZYktGaGFreWZ3R0lVY3RORStodlo1Y0RLZ1QrMGlxZ3VGS3RUcDMycy9l?=
 =?utf-8?B?aXdua3hPaHpBczA1ajR1UnBYaCtGSEI4czVYRjhVMlNwNWFsV215M1hZT0Q1?=
 =?utf-8?B?SHdwdkZ5ZXdBbUtjMmNDbTk4dktSVFNDT3g4TkhIWnEzbk5vTUNNR1Z2aFZE?=
 =?utf-8?B?SFRsMld4YmdCbkR4NzZ1MUJnWS9zdHp4TEovWGxzUXhyemdLeDRxQWVZaHdS?=
 =?utf-8?B?YWprV0VZaTU3WDZ2dzRVblFraUFUWW1hR3Vub1hkd2FPSGxzb0dBdjRSUDU5?=
 =?utf-8?B?aFRhYytsL3hIaC9GUVBGaFJYMXJJZFNaRnNmck1abUhIYlNQUks5YkZRVnpr?=
 =?utf-8?B?bWI5c1J3QWY4S2FBeHpNLzQ3YjM4U0RBcHAyWEtzOWFaUERudHU5YzZaSUlP?=
 =?utf-8?B?Q3dwUkJKdFMwRk9SR1QvdUNwRTdGQll6OUNVeHdSbHU4N1kxV0oyc3JOaHNZ?=
 =?utf-8?B?S01iTDI5ZUduWWRLV0JPdTVIdVIwMHl6ajB3THFSekIvTjBSRkFWSkJVUFNG?=
 =?utf-8?B?TVJVRlh0N0x4cGI4QVFZYWRWTHdIL1ZUdGp0RHVFd2hnZGQ1QXBHeDRPcHJB?=
 =?utf-8?B?R0cybjBsckk5dVc1c2pPbzBvdlJMamlzN3dBUlNiWDcyV0x6VFZpd3FzTmJu?=
 =?utf-8?B?L3NYSS9mdTF5UlprRS9aY3JldzcwNXBGNzV1ZzhocVA4Vk8zbG83RFh5aWFa?=
 =?utf-8?B?YitoTmdXd0JBYVg1NkI1MUpDejhXKzBSbVR5bm9uZGpmako0VDdzaXBDZUFD?=
 =?utf-8?B?WnNxMHlwakZhSk9VREl5ekRVU3UwRGVjR0wxWmxRakl6NUpIbG16eGJ3ZkJj?=
 =?utf-8?B?a0FoQUo2WW1aL0VLaC8zVUFUYkkyZ3JSb0liU3dvdkRaSUhxc3h6L2M0QnA3?=
 =?utf-8?B?VWRHa01UR0NIdGJrL0RmSnprZkdBVVJkNmFyelYzSFFUaDI4NlUycXY0Ky8x?=
 =?utf-8?B?WEswU3F2dURwbVQwYVVHTEZDVWNpRmpYTTBsZzBEVnplK1FIeGlWR0NYNUZ5?=
 =?utf-8?Q?CF7k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ry9ZVC9NcTVZT1E1UGl1SnJDaWVVdnc0QmJXNVBYOTI1WkJTWHgyZVZtd3My?=
 =?utf-8?B?V0xLRmk5QlVJUUFlSkh0a29QQ0NoK3lIelk2eWtHM0RzMTFEN3ZlY01vbVVC?=
 =?utf-8?B?YW5rK2J2SE9zWHlDNnlObDZ5akdsWENwQitVaVI4L3pKMForN3AzOGQwOU9P?=
 =?utf-8?B?NGo0T2pIYU5NVU95WDRqWTVPQ1hvWHhjUmY4THRyODEvSUh6VCsxWHphNWpl?=
 =?utf-8?B?Sjl2T1RWUnBqRlgvaWdpKzI0OUNuV2tlUTRrTzlaK28xL3d6UWF5dDQ4amRn?=
 =?utf-8?B?bW01MXY2dHhaZndUd0hoWWRoOHB6ZU5RRnkzRGVxaVBVR0tPUnk3MGRBVmJ2?=
 =?utf-8?B?V3picVh0NGVBbFdIOGVKOFRLNDAyV2thZ1dQUllDSmdYY3ByU1dvY3lwbG9q?=
 =?utf-8?B?KzQyQ0lmMVZBNzBmaG5STG5ZY3RUNGFYcXNwQSsvdldEbHo4cUd5aStSMVdw?=
 =?utf-8?B?ZG14anpqbkQ0V1RSNWJ0ei9XOXBEM1M4R2hGZDF6Mkp1aTJjWHNYVGFjZkJk?=
 =?utf-8?B?cWp3VzJZdmh6S3kvOHNpaHhnWFFHUVk2VktYRGEyaXVWcTRrVGZVT1p6dzR5?=
 =?utf-8?B?UVdCUzByL0pMQTNVY2dIT05mWXp5eEV5alYxdGJaOGo2aTl5bmdRZnBJQkZB?=
 =?utf-8?B?cHlQeEQ5N0xPT0JvWDdjUzZ4ZUl1YnFla2tyNkFUNVlVcjNOMjVOYW1wQjNQ?=
 =?utf-8?B?cmZjNE5hSW1odlk5bWZXa0tMK1MrM0trUnIvcC82NUVzRXdyYzF4ZjdDZUxC?=
 =?utf-8?B?OXVVYTRpZVdPdDV5MHk0Z3RKQ0ZYZmIvbisxWUhXcGI3OU5sMUlxUElhdS90?=
 =?utf-8?B?enNMekdzWTVqa0xCbE55T0h6cVFkNUZxRkUvaGczR3Z6MVRLc0N2OGZWZmt5?=
 =?utf-8?B?TmlYT1MvU3dEYUpZRlFRbWlXQmY2b28zQ0JyUytIN2Z5Y1o1dnNPOWVVeUN3?=
 =?utf-8?B?U054TkJ4c0lqRjEveGNDdWNRbGphOHdvenBZSnM4M0kzTXI5WU1WVWVnUkpp?=
 =?utf-8?B?eHFtdy9FdkQyUE02YU5mdWxueFp1d2JwWWorOWZNeW85ZFRzellPMVJ1SnZj?=
 =?utf-8?B?T0pnMU1QQUErV3VVT1VBVkJyck94NFJaWHJGdFlVcWlhODBvSlh0THlXZ0xz?=
 =?utf-8?B?encweXJjSjBCZFd4bzFrdDdwZm1ock1Dd3hsOEE2ZERDQ21Fb3NWRXlrZ0Zm?=
 =?utf-8?B?VURIOGNXRkN0SUpQY0lzRmdWVWRERFFReTI4b0JyYmR0aVN3dVZCcHZKNnFU?=
 =?utf-8?B?UjB2aW9sN290WlAxYVgvM3dveEpSM2VGSEdBczJHYTR2K1UxR242UzMwQU1v?=
 =?utf-8?B?TlNNcmYrUmd3K2VENXkvL1pnTmZMeS95Rkt1bFN2SVkycVlOMGlITnVmTzh6?=
 =?utf-8?B?dDZVeFBIU0tNU3FCRVhtRHlVSTZnbnlEcm9kSGkrOG9POVE4eFFaYmg3WWlX?=
 =?utf-8?B?aDFtWHlDd1NXOWdEZVpCOTdadlEydGNnNU52RUk3NWw4NkpnSjdjK1JrNFBD?=
 =?utf-8?B?ekR4QUhJUEw4cVRBVGZ6eVJJbUZpd2hGcmxab3J0OGF5bFVWWmxwV0RQZnl0?=
 =?utf-8?B?dlBwVkNQenFNdVBWa051U2wvU0w3VkFXbUxCZnBLS3hTR3pvVzBmbzE4SHNM?=
 =?utf-8?B?cVNjajM1dTVsaEo5RVFuTmw5dnlJQUtaS0lzSHBScFFTaHZUSjVZWnRwcjhX?=
 =?utf-8?B?cGxLTlUvZWVpWFpuV2pBS0dPYjJ1ZVZjYkwxbENkY29tQ25kcnRTc1VwZlp2?=
 =?utf-8?B?TU13SGxiS0txbzZNRm8xay8yS1lOeXlTOGQrMDc4TXZpMXdZc05yRkxKQzZV?=
 =?utf-8?B?UGVMQjJmdk5CdUtXa0tqRUwzQlY5YXowQTVCc3BuZHZUWDBKdjJiVWpPdXZs?=
 =?utf-8?B?NFZ3NUN0VEJJcmwvMjYvYVp1R1lWcEVsSi9DNGN6ekRXZ3ppeHRyTHUySG44?=
 =?utf-8?B?MlZyeGRjbzQ4YTJXSlZrOHJBdXg5UzlENVdLbzdKZlBEWWZscWo1SnR5azFE?=
 =?utf-8?B?aGM2U2JGSldCeHpxV1YzazVBZ1BrUUJRcCttV2JoZjJFODdsQkZMcGFJdDdT?=
 =?utf-8?B?b0dFV0Z6bzlrdlhvQXkzVUQ2bHVsaDFmd3gwbVp2VUtmVlptRlk3L3l5YzR4?=
 =?utf-8?Q?RFj+kJ2Qiyo0f1n3Qwv3poOAu?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c7cf4b3-2a11-4fb0-7c98-08de3c45a12d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 01:51:28.9834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 717M11w4o5fmo+Kpi9WDJySZUif3xc3uW5qIsFl2huyDNbJq27V6cH8MS382pdDT8giAaU/0fZQNSZgDV9tVmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6915

This patchset is pick up a previous patchset [1] with rebased on
next-20251030, and some changes applied.
 - Add runtime ops to separate cpu ops and lmm ops
 - added more comments
 - moved some check imx_sm_rproc_detect_mode() from imx_rproc_sm_prepare().

No changes to the dt-binding patch, so R-b/A-b are kept.
More info could be found in commit message of each patch and below.

[1]https://lore.kernel.org/linux-remoteproc/20250821-imx95-rproc-1-v5-0-e93191dfac51@nxp.com/

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

In patch 3, Use LMM and CPU protocol to manage M7. More info could be
found in the patch commit log
    Current setup relies on pre-Linux software(U-Boot) to do
M7 TCM ECC initialization. In future, we could add the support in Linux

Patchset was tested with below boot images when the patchset based on next-20251030:
imx-boot-variant-rpmsg-imx95-19x19-lpddr5-evk-sd.bin-flash_lpboot_sm_a55 (Use LMM protocol)
imx-boot-variant-alt-imx95-19x19-lpddr5-evk-sd.bin-flash_alt (Use CPU protocol)
imx-boot-imx95-19x19-lpddr5-evk-sd.bin-flash_all (M7 not under A55 control)

Also tested i.MX8MP/8ULP-EVK.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in V4:
- Rebased to 6.19-rc1 to resolve conflicts.
- Address Frank's comment patch 4 regarding "if (ret != 0)" -> "if (ret)"
- Link to v3: https://lore.kernel.org/linux-remoteproc/20251122-imx95-rproc-2025-11-20-v3-0-9ae6ee619a78@nxp.com/#t

Changes in v3:
- Add R-b for patch 2,3,5
- Patch 4:
  Rename imx_rproc_ops_sm to imx_rproc_ops_sm_lmm.
  Add more comments in code
  Simplify if check in imx_rproc_sm_lmm_prepare()
  Update commit log
  Use dev_err for failure path
- Link to v2: https://lore.kernel.org/linux-remoteproc/20251031-imx95-rproc-2025-10-31-v2-0-758b2e547a55@nxp.com/T/#t

Changes in v2:
- Patch 2: Change to const pointer for ops, update commit log and add R-b from Frank
- Patch 3: New patch, introduce prepare ops
- Patch 4: Rename imx_rproc_sm_prepare to imx_rproc_sm_lmm_prepare
           drop IMX_RPROC_FLAGS_SM_CPU_OP and IMX_RPROC_FLAGS_SM_LMM_OP
           Add a bool for dcfg->lmid and info->lmid check.
           Provide separate plat ops for lmm and cpu setup.
           Move LM permission check to a separate function.
- Patch 5: Drop macro IMX95_M7_CPUID and IMX95_M7_LMID
- Link to v1: https://lore.kernel.org/r/20251028-imx95-rproc-2025-10-28-v1-0-ce9e7db9edcb@nxp.com

---
Peng Fan (5):
      dt-bindings: remoteproc: fsl,imx-rproc: Add support for i.MX95
      remoteproc: imx_rproc: Add runtime ops copy to support dynamic behavior
      remoteproc: imx_rproc: Introduce prepare ops for imx_rproc_dcfg
      remoteproc: imx_rproc: Add support for System Manager API
      remoteproc: imx_rproc: Add support for i.MX95

 .../bindings/remoteproc/fsl,imx-rproc.yaml         |   1 +
 drivers/remoteproc/Kconfig                         |   2 +
 drivers/remoteproc/imx_rproc.c                     | 245 +++++++++++++++++++--
 drivers/remoteproc/imx_rproc.h                     |   4 +
 4 files changed, 239 insertions(+), 13 deletions(-)
---
base-commit: 4a5663c04bb679631985a15efab774da58c37815
change-id: 20251215-imx95-rproc-2025-12-15-1200ef764ca2

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

