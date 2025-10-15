Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011014.outbound.protection.outlook.com [40.107.130.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A609123BD1D;
	Wed, 15 Oct 2025 13:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760536432; cv=fail; b=U3EUiuO/6kIlfSYr5JNc2qbUhKAfOuCgDki+X5UejMWS0Kp+5h9HvBFyFEiKwViXRUnMBmuDsPjrwOOQcntgHn4F7AEo8ces9Q07XuYXu+vVdSX9xD9UOWOgl5rKP7cw5/P/o8+5uBzdGjqVD9MYZRFwbzyUA8e7/gflf2WQLMw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760536432; c=relaxed/simple;
	bh=ubPGUSA/U+ZOw1gfPc8BkZeJlxaEckkX6PUzue4SoY0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=HXVB71Y8i78zCzICyQqpWuGIX/+sT/opiyH7dAKAtAPKp0pEEkJx0ZCfCYjOprmrCFTUlTxzQhbjd4a2cNBJ8e7E+pNEvp2yN1wzjmls2zz6i5DiJSqcg7Muu4L13YlbcQ5Lb1JnqvJkLyo1El0eniuEz8WrN9aajfb9ovbrsh0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=M36YTz3W; arc=fail smtp.client-ip=40.107.130.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="M36YTz3W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EX392FP+nqcqi6uIOYHSGgqFWIRrHom1NpGk4WwrLoPMflP7sjLbsKlA1BdjNwFYNFZNtJgTqL+HwMANS4fX17dYo5Fo6wd2jQd/rd5neP7s8F6RyINeh0tC1mRSUClT3ExefkfjUGvYzfuupv5lauecRUfR+VO7GMEPoZDWU1zfgOuX0YY797N3Y58d2fWC6rF+smEkE1eHbw10/qyG4bkXuxUKn3iEjBn/DFIMnq+Kw1Xi0AWuLYhh2DXFYelmGN1+r+oaqPrtTbRu+RaryU8GK9yu8oIHvJGcb1k5ZrCOLlK78SrOVT+PpQRgA1WV658ZEgS3B6eB5kJ0KIGixw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CCzrP28pdGHGSnbUbMxIJ/pi16pVmqX/w7SQCH5Sb44=;
 b=o8tw+B6y9lXdJJPpSuz3oz/LaX46GJBDjKx+/gtZYg9IFZNR/J1mXjmCHc+7LTCZjwojxsUOsGZjoC1gy3dxczFOhVVqxazLd4NvH/9aC41tixwDO7Lv+fBHVaDWNm6R1LE7u+wXFUWM/z1adwPjvfbobgS/0iG9QiNp60vRBYyaHMlsflMzfquxl3hXax3ZjtpY6vCnJdtMgeSdB/Gk2Mk9O2SCO3bbT/gNcnwLegRRMMNOprgv8PSW589NJXNrK1cfVpxDdSZ9pwtDKAq6RtfdTRFgtwFPVm9QZ6zdZkOLdTgDmW3HX31VBhWMoclHT8bLjeAsnUDwj75gvKrWlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CCzrP28pdGHGSnbUbMxIJ/pi16pVmqX/w7SQCH5Sb44=;
 b=M36YTz3WsNfcOL0QstZFcPqP/PG/coCEvsp+g4s4L+a1gtNuHBFfW3Ndw4gG8nac3XbsVe9JYeRh6XshobnzvCzP/BuIOQxTCKAY3SThiXG2xmJNOtCQ2m70HOj6t/B2snVT4ohTIRyVMuHqO+Utubtrvi78Zv1RXAiKESMWFg1KDQD5tQw+5DaP/r0YkP8njNZQLGtxFiOy0jTZ5ICff2iWIsfalZLpCbyaVrLK1yaT32QrVrrX4mJ7R29/LbeQ300LnxPVD4qnbfsdeQa0bRSUMWB6mW+v7KvKW4lPH4ZV+YizJjdQaflI335VQJKW2m6cgcebdy5Kj+g+mWVMHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV1PR04MB10251.eurprd04.prod.outlook.com (2603:10a6:150:1aa::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Wed, 15 Oct
 2025 13:53:43 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9228.010; Wed, 15 Oct 2025
 13:53:43 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Wed, 15 Oct 2025 21:52:58 +0800
Subject: [PATCH v3 4/5] remoteproc: imx_rproc: Remove the assignement to
 method
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-imx-rproc-c3_1-v3-4-b4baa247358d@nxp.com>
References: <20251015-imx-rproc-c3_1-v3-0-b4baa247358d@nxp.com>
In-Reply-To: <20251015-imx-rproc-c3_1-v3-0-b4baa247358d@nxp.com>
To: Daniel Baluta <daniel.baluta@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <frank.li@nxp.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760536394; l=3509;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=ubPGUSA/U+ZOw1gfPc8BkZeJlxaEckkX6PUzue4SoY0=;
 b=svMQ84vRzyJ3NeXWSBzuZPqwhmLaA99oFKpa4Qq+xmdoFqMRQuNAKwRBtHtjzdgH4uC5f4iYG
 m4FfOHIw+zrDJASWcybq2jNykNhWhisdDdbu3xTjCBZT1Rhn0D0oGp+
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR02CA0110.apcprd02.prod.outlook.com
 (2603:1096:4:92::26) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GV1PR04MB10251:EE_
X-MS-Office365-Filtering-Correlation-Id: de263b3d-4031-447d-c40c-08de0bf240b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YjVPYkd6N2czNC80OFF5QWJUL2pOVVpvSnlLRzM3S204eHpFQmxPOG42OXFO?=
 =?utf-8?B?cW0vVXgwaUNwMmFLRTc4TjI4Yk5LNE9xRGMrRHhubTc3R2h0ZHNlRm5YdGVz?=
 =?utf-8?B?RENreUxacDNWMllTSG94ZTlYVkJndHVYMFV5TmdML0dIYjloK0YxL1cweFVv?=
 =?utf-8?B?Zmt6R1BoMElvemlVUk1sZWRscWtvSG9aeWptZ3ZjWEF0NjJuTU1CU0R6bFRP?=
 =?utf-8?B?aHE2Snp3aEhldHdwRE94YjFDUHJ2eFdMY1FUVXVVQXlrWXlsOEdYNHJ6dU9R?=
 =?utf-8?B?VGRxaGNKc1lZeS9MRXYvKzFrL3FtWUFVK1BEQVl6dXUxYURxbDRRWi93cWZO?=
 =?utf-8?B?ZGVwYzN4WlQ3REN4bDBmUWh1cmtwVk93N0VMTkRBbVBHN2Q4WE5QYXNBRlRG?=
 =?utf-8?B?T3pxV3pHZUtnWVV0Rzl5TnJzdkRWcVdhVHZSNkYzZDZieG9KYksrUllhMFNm?=
 =?utf-8?B?a1Z6UXAzUXQ5eDhFUUlMQ0JuWHpyNTFQK1phVVJYNythZTJ2cVpZTzdQTTBi?=
 =?utf-8?B?OGlrUmI1S1U5MmUxbDQrUzdzV2s3KzF5Nm42UFhJRE1UVHN5MkE3dG9SOEw5?=
 =?utf-8?B?bkxJWmFGZlc0eDhDZ1FNejROdGV3bXd1Q2FMbkgwNVU2MFpVdU1qUktsTFZG?=
 =?utf-8?B?cERqNGliUkE0VW9GVGF2SXVEQnphNk9zc2xkcGIzd21IMUVkbncyKzIrTGtt?=
 =?utf-8?B?TGtHM29ocjZRbDU0WGQwcGFKYm5Ec0ZSTWJlcllISU4zc1p6YkpmRjlVMDA2?=
 =?utf-8?B?SkxWN0dCMW45alZHaXVoUFhTWkJpM3pOdERSaFY2K1I0SitXK3hGUjg3QTRq?=
 =?utf-8?B?L0lyTk5PcitnK2lOTkJQSExmbkdkZGdDSTNUK0IyQWRLdytPKzRKNkU1UEtq?=
 =?utf-8?B?cEVhUzEyclNlSU5YTm5zRU9jTHAyb0JNcFVMeWRwZFQ5emFjVFpYWmFrSm9Q?=
 =?utf-8?B?Z090am9iZ1pQaXBVWkZJS0JqNVU1OXhPWXJwVlkxM0Y1NWh6S0ttb2k4aGNm?=
 =?utf-8?B?S0ZXejcxME5VRTlFemsreXhrcnp4bElUUyt6N1dPNkcvcDJaMTBPNUw1SXFt?=
 =?utf-8?B?V2VnQXdLMUk1dDRrM0RGU0VIQlkydTVCUTdHK25JUUhWY08yRExMV0Z4MTIw?=
 =?utf-8?B?VWxWVFZhT1ZYSEdnTjZCWWVPL1Y1L0xkK24rOVZRYlhveHE3dER0RTg3ZTNJ?=
 =?utf-8?B?TCtVaWxvYUtSak5jTU1GU0JaU0NCcm1MalBiT0J2MFUwNmVVTzNBbVJRTEda?=
 =?utf-8?B?YTBjWVJiQVlyL2kwQm1uRkpESTZiYWtmbXRYdC9ySFg2aWNCcVBtU0I5VWVF?=
 =?utf-8?B?Q2NvNmtMYTdFVEZyVEZNVDJvN3pncnF3REJlbkd2a2RCa2lVQjM1aTlvWjFU?=
 =?utf-8?B?VERjYzMrN2R1L2JmN3p2dExUV0dEWG1BUjNCYThBTWtRV1FEOHkxdUI2MXhE?=
 =?utf-8?B?ZUM1RkdEWWptUTY1Ynk3R3RlcHlhUWZvVjRvSVVQRktHNllaQ1N4ZWFTelVX?=
 =?utf-8?B?ZWNkK3NzaTg0UjhFRWZ0aUMxaVVCbCtSRnJ2SmpZK1EwREgzQ3ZxL0lMb1hP?=
 =?utf-8?B?OVZCSW16cVczMCtjNU5sSTJvdFdubWdkclJaNklYbjZuRmtTNVlMQmVpREZ5?=
 =?utf-8?B?d2pxR3A5Snk5T3R3YmxLNHdaTk90Z09iMmd1TTFvSVM4N3FCeXIxcFdzTncz?=
 =?utf-8?B?K054bXErT2FOQnUrT21VQXJoajFabGJoT2s0MVIyNitEV0VjMzNlWVp1WW43?=
 =?utf-8?B?bGgzSGJabUtJQXRkU05wbnlNdnFnZlpXcGVzQ3BTR3BVK0EzMEU1UkdhcnRF?=
 =?utf-8?B?dDdOVmloODlJVCtZOUZWWFJ3WnczekNPOGFLaFdJV2V6N0ovM1pCSVB5Yk1H?=
 =?utf-8?B?UFQvWHVRVFFQbVlhNjdCaXNQek9WaHFQTUNJWHZ4UUgvSUZpNGRjanRJeS96?=
 =?utf-8?B?VjV0N0NBOERkRTU4eDM0WDFkTTFnekRPbWdGQmU2OXpkZzRSQlhZSW96Rmwy?=
 =?utf-8?B?cVJYbE5kTnFYbkhlVzFRL1BROGZpUWdqVys5R0pHQXhUaWpyNkphbzZRTDc1?=
 =?utf-8?Q?Sv3zWP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?czVoeFphSHNEaVZRK3cyS0IzNytNUlAyeFdCbnF4d0VsaTJoQUlOaElzeGxy?=
 =?utf-8?B?ZTREQVZVUHlwcGlyRzVEV1p2ZHp5WmdjSEtSM0QycVVlUHZqTHQ5aWRrSTEy?=
 =?utf-8?B?eXpWdG9tRytnTHlXOXczU043TXkxOC9ZMWhJUk5iRlBnS1czbUZJb0dvakt6?=
 =?utf-8?B?ZmlPVktNeXJyVG16Q2kxT1k3QWJ1a1JYS1pkdjdORlV5ZjNmRzBUL2tnZjNR?=
 =?utf-8?B?d1p5NkNraGpZNWtMdzFSY1FOdGw4Qm9EQzNhOWxQRDduZnZYUUJNcTNUNGZS?=
 =?utf-8?B?ell4NWltckY0ajZEbnZhSzdYNWtIWnlZNDRvNGxMOXBjWGV0N0NMYVBHNzUx?=
 =?utf-8?B?SnYwZ1p5eDlkQlhYOTk5ZXl3MjRaZlNSV3hDNC9nVE5HUGdTRG0wMnpKVFR3?=
 =?utf-8?B?SDdYemtzYmNuMkdqNmF1ZUpsbzRweSswRys2cmxZdmxra1pKSThSWWhpcDcx?=
 =?utf-8?B?WndhV0p3NVVKcTRkQWd0Wk54QUlFRXQwOWlvMGQwU0NkOTE0SE9tazZQQmNC?=
 =?utf-8?B?SlRsQWFDZDY5c2VFNlAvcEtUVzRFNVl1U0dHaW9sbHA4bGdFeXpFVDlvR1pN?=
 =?utf-8?B?bk1LQS83dWlkR3I2YmtFUEl6VmMxWXRVUklNNHRHT095Yk9QUW14WkhvdmNk?=
 =?utf-8?B?Q1hvMjJTMk1BMXF3em1EbklxNmxlSnVsOHVxWUowbGh2Ymdtdjdwd3ZPb0Fr?=
 =?utf-8?B?aFZPWitNeWw3ZWMzLzUzL09tVW96aG1Gd01PV0ZmK2JYek5ScGUzY3VCTlUx?=
 =?utf-8?B?NWZlOU9EQWlRenRUUlFOVUhBRlJCaWMxQ2ZMRHYwOUhlRHQxL3ZoWUh5aWc1?=
 =?utf-8?B?N1U4cllsMzI0N1hGcUpqMEJrNEhsRC84K1J4VHRLejBZR2JhODBaZ0JGS09X?=
 =?utf-8?B?S3N0VHFYV2RRcjdtNmVWNURhZGtLOGkvSERoMUd6YkpjaDJhM0ptRktWMHdQ?=
 =?utf-8?B?VlBQVHdiNzFvOHMrWXZmL2tMSXRNamdSaXo4Q0hwUUxHa1h4MTQyVkFnb2Np?=
 =?utf-8?B?TUhydEF4Wlc2Z3JYaWp3NDlGOWxrdUVLMlh2VGpJREdSMHZIQ0NDRGVOZ3BG?=
 =?utf-8?B?bHU4TldaL2xDVENxQ29nbENmWTdUdFhGMmxiK2NrdlVKKzh5a2JyUnZZMzc1?=
 =?utf-8?B?QVVpVEorMzJzM285a2hnaEcrcXRxbk94VU4wWDBQQzRUa1ZERWtmQkxmaDJn?=
 =?utf-8?B?V1NZQjhQbktpNXJQVGVQamRHdzhBN2lQVkZzWUc1WjlTTzFHclMvNVdTaDZZ?=
 =?utf-8?B?TkNodEFDVWFnSzVUaHFPMWhoeHdOKzMvUDJoVkx1MDJBQ3h0M2tXaFd6bFNE?=
 =?utf-8?B?NHUrb0RoS2VBcmNodSs2TGNjT3NuK2JiekhSQlZRRDBxZk91NUlyYjVEanA1?=
 =?utf-8?B?cWZsSHBZak1sY1N3M29OZHBYcmN0L2pyRk5vK3F6enBXSDFyTjN3dHBKMm4r?=
 =?utf-8?B?WDZhNkszbmlQOWNlc0J2UE02YXV3Nmdiczl0Um1XUDFhME1YOFA5OGNydjhk?=
 =?utf-8?B?NTM5VE9ZYmg3aTNSajNtV3ltK2l3L1JWZFpiYXZKVWVOK2YvSXVWRzBiNjFv?=
 =?utf-8?B?aS9NYS9iR2FvbndRNGNhZENvNU5sTmpkQ2RwWTExMms1enNLbi9kbHBRY1F5?=
 =?utf-8?B?VXZwNjgvcGE4TkVRcFExS3lIRWZJZDNtTXI5MTcvR3I1YVVTRnBVNmhuaVBw?=
 =?utf-8?B?WWErRFNpMXNoaWYzaFR2S09palpZVy96cUcrZjhDQlR6anFYV0dLSmRUSzJ4?=
 =?utf-8?B?TnRNUXQ2Nm1RVmkyWjBuZkxPYlpXektPVVhKdCtTdUtCY3dwZmxzWW9UYTFa?=
 =?utf-8?B?ckxGclBvNlB6c1ZBNlczeUF5V3UxNTFnYkFhRGVZeWhXWVE5RHRkSmtOb3dH?=
 =?utf-8?B?NGt0aldlVTdnQnNhSHNtUFh2RG1KK3NHdGYyVElCMzJiVjl0MEpWSENiRUEv?=
 =?utf-8?B?NTZNQVIrdzNPczhUZThNcS9yaWt5bVBDaHNwRmVveVdLZGpYVUh5enBMYkhM?=
 =?utf-8?B?MDhRTVljQ2JCTUJRNDBXdDlvU3I2aFdId3BPV1NPNGFtMHhUV2FqeWNPQ0pl?=
 =?utf-8?B?eTZsQTJjeW9DT2cySVJBeERMNmlSYXJHOS9BK294VXZ3dmVwSmtCWitqUEwz?=
 =?utf-8?Q?IS5nfJlLZfDpb5/5yhbM1vHsL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de263b3d-4031-447d-c40c-08de0bf240b8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 13:53:43.0858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z9Mz4c0pF1lVKkHYrOMeA0DD7/3MxEfIcRT3MEqmw/W88gvXIrnkTOnB/6db8vhXHAz157c2gTZMYUSmo5JgnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10251

'method' is no longer used in imx_rproc.c, so remove the assignment.
But imx_dsp_rproc.c is still using 'method', so still keep the field
in struct imx_rrpoc_dcfg.

No functional changes.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 25f5cb4d414eabed7a166eb2a8ae5e20b6b4f667..02e155e967942d745de4ccd96f9008e4211f9b36 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -1176,7 +1176,6 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn_mmio = {
 	.gpr_wait	= IMX8M_GPR22_CM7_CPUWAIT,
 	.att		= imx_rproc_att_imx8mn,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mn),
-	.method		= IMX_RPROC_MMIO,
 	.ops		= &imx_rproc_ops_mmio,
 	.flags		= IMX_RPROC_NEED_CLKS,
 };
@@ -1184,7 +1183,6 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn_mmio = {
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn = {
 	.att		= imx_rproc_att_imx8mn,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mn),
-	.method		= IMX_RPROC_SMC,
 	.ops		= &imx_rproc_ops_arm_smc,
 	.flags		= IMX_RPROC_NEED_CLKS,
 };
@@ -1196,7 +1194,6 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
 	.src_stop	= IMX7D_M4_STOP,
 	.att		= imx_rproc_att_imx8mq,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mq),
-	.method		= IMX_RPROC_MMIO,
 	.ops		= &imx_rproc_ops_mmio,
 	.flags		= IMX_RPROC_NEED_CLKS,
 };
@@ -1204,27 +1201,23 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx8qm = {
 	.att            = imx_rproc_att_imx8qm,
 	.att_size       = ARRAY_SIZE(imx_rproc_att_imx8qm),
-	.method         = IMX_RPROC_SCU_API,
 	.ops		= &imx_rproc_ops_scu_api,
 };
 
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx8qxp = {
 	.att		= imx_rproc_att_imx8qxp,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8qxp),
-	.method		= IMX_RPROC_SCU_API,
 	.ops		= &imx_rproc_ops_scu_api,
 };
 
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx8ulp = {
 	.att		= imx_rproc_att_imx8ulp,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8ulp),
-	.method		= IMX_RPROC_NONE,
 };
 
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx7ulp = {
 	.att		= imx_rproc_att_imx7ulp,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx7ulp),
-	.method		= IMX_RPROC_NONE,
 	.flags		= IMX_RPROC_NEED_SYSTEM_OFF,
 };
 
@@ -1235,7 +1228,6 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx7d = {
 	.src_stop	= IMX7D_M4_STOP,
 	.att		= imx_rproc_att_imx7d,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx7d),
-	.method		= IMX_RPROC_MMIO,
 	.ops		= &imx_rproc_ops_mmio,
 	.flags		= IMX_RPROC_NEED_CLKS,
 };
@@ -1247,7 +1239,6 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx6sx = {
 	.src_stop	= IMX6SX_M4_STOP,
 	.att		= imx_rproc_att_imx6sx,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx6sx),
-	.method		= IMX_RPROC_MMIO,
 	.ops		= &imx_rproc_ops_mmio,
 	.flags		= IMX_RPROC_NEED_CLKS,
 };
@@ -1255,7 +1246,6 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx6sx = {
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx93 = {
 	.att		= imx_rproc_att_imx93,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx93),
-	.method		= IMX_RPROC_SMC,
 	.ops		= &imx_rproc_ops_arm_smc,
 	.flags		= IMX_RPROC_NEED_CLKS,
 };

-- 
2.37.1

