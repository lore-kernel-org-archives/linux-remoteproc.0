Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013052.outbound.protection.outlook.com [52.101.72.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7712FB61B;
	Wed, 19 Nov 2025 04:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763526174; cv=fail; b=uTu0DTqTua4S07U3XI0Anw/Nppe1ovsPMUiZJKsa7gL9n007MnOC5TA7ojThai2/wFM0gpvZdniMI6Z7Eor/or+ipDb81wrthVSBfmF78BWDP32u8YpwD4O/hUuCEb9tsU28dvU/2fJOD7knDkB//QQAN374mxFDTaHSO6s1wYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763526174; c=relaxed/simple;
	bh=Yr82yOdm66SgSJ2YaH9OM+lBu/ijq+WL8xF/DLYxr18=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=g5SIWBMKyvOqSoZVyEG+Rhh+FhEHmTLq4bWm+XgbtXAv7r1dnS32bn3V6BB+yENY1hFnYGm0ln6Mbvc8yQeTJ7jmseXLFZIgbaXf3GvxuWElJrOA8lgwp+zld/HnHuZC+Rewlwi4OJZ78VZ5FE991Fd0drBfNhtus21fyEL29Uo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=AZCP82UU; arc=fail smtp.client-ip=52.101.72.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="AZCP82UU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NyzsAymxK+oO7syX5st33d14wGMEcs154gDfikwgPbAi0JzrIrK2xhv8hTCz/Il+gr5bKEVScWW4V7UcE8w7rUIk0nTbd14L1D1QYjoQZCzt3GCWJLtR4W2w/FxWpVzFeYKK6mX/9fdK1dsE7mavwZRmzLDGlkHoKswce0M4cwCvpggxcJosEia93LvQdqof2wdrg+VOQ7VBVEFIuy9+JVUAfFpgnsLUWM/vJJs0BS+2gobFzGaJUR/hkKeDhreUvLvpAcQP1R+/Z/UChg7z+I3NYHFGd9SoL3D528ZORQHJIhCCYHL/8/diK8eZ4FDgi8hpDsnqJdvmwE6qF2kMLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ns7yXApjNzw68k2vxHh/3oBG6f8suEGqwf/pfzBi+yA=;
 b=wjbLKC9tMf8Izn9qKF3HuwG6FYKgFFUfJRlREvQwBUgGVtIb+FzqZukW3atkGIFerYx3v8hJ1mEoiihk0KqEkRjVeU42N+im8ZU5cFrcma08bG1RMRmSlxVB3bE4iDB5ls2dzHD8P7uyEmeQzZbJVLfTWmIEqRNhGoDnuNgIJER8FiZ2UbfpT3En05YAyvro1shXzwtGXThFZv3NmIhCZy9AQZDwNxBrugZqprxvMIlEgl7oVsexp/JEldoVESDCW8lQeWPRJ/a2SrhRiwn/e+GjOYP5ihGDtVZ1quAnVO2wUw3ADiu1+NKl9i9GJaOBu79oWiwrf4f/uhnPAkzuCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ns7yXApjNzw68k2vxHh/3oBG6f8suEGqwf/pfzBi+yA=;
 b=AZCP82UUqWxA3ZeJ/G5iqGswgWV9/OR62+21NLopZHZFxS22OUs9IeClhEN3KYiuUgUSvmJ65C5FUNpHkGL0fIsjsIVeAJd9ATTRSneFi2R0hf2+hkc+eyLJxRj4pMRH2w1BA9mxjlarbnOdVSs6NCd9rpsr74djcBm7JSa4pA/+dpmsNav083mlUk7Z0hDtTsDhgQoyHSOqVm10Ljt6yObn5ycfV/Bl7OGRQ3J+u1HhcjH41wUpo/gq2R/2lFz4pOZMp00Ff8800GOpi22ExptGqwq2cR3wLd9Z6Y4+YkI4AYr2XF1fgbqw6GddnnNe5vZ0WRL1RVnEJiiJmCMcaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA6PR04MB11949.eurprd04.prod.outlook.com (2603:10a6:102:514::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 04:22:49 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9320.013; Wed, 19 Nov 2025
 04:22:49 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 19 Nov 2025 12:21:55 +0800
Subject: [PATCH v4 10/12] remoteproc: imx_dsp_rproc: Simplify
 IMX_RPROC_RESET_CONTROLLER switch case
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-imx-dsp-2025-11-19-v4-10-adafd342d07b@nxp.com>
References: <20251119-imx-dsp-2025-11-19-v4-0-adafd342d07b@nxp.com>
In-Reply-To: <20251119-imx-dsp-2025-11-19-v4-0-adafd342d07b@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Frank Li <Frank.Li@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, 
 Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI1PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::13) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA6PR04MB11949:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f037da0-8206-4211-f58c-08de27234c33
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|52116014|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MzZzNnVxSDdWUHArOUZJY2FTY0lJVDVxM09jSktHNTNEelBUUG4rUWJDYldv?=
 =?utf-8?B?VndvRDA0S2oveFNWQUlWQStqbW04SEw4MGJJL3llYWozM3dUTXJHN05TV0Vn?=
 =?utf-8?B?TmptZ0wyRjNkWFFSdC9ZMWVSOWloU1BmSXpUSGJ3UEhEYlFQdUprd3ZCclNh?=
 =?utf-8?B?UTVuaFZKc2NKSTRXb0FINnFsNFB2UGNsSEFJdTZUNExCV3doQ3lQK09xcDFi?=
 =?utf-8?B?N04wMXZqdm9aZTErVXY1QXljYnVtZFZsblNVeUFJZTZwb0czWENFV3ZQVzMw?=
 =?utf-8?B?U00zaTl4SnJpUWZUNEtBSk5JTFhCYjdJRlFWQVJCc3dvTHlZbngvK21PSnQ2?=
 =?utf-8?B?dCtVT05Oc0J1YWxkQXlILzN0MFB2c3U4YndRUlp6R3dMNC9TYjYxSmFyeDNX?=
 =?utf-8?B?R1d3bU90OW1ERE52OFJZMll4RXQrUGtsYU8rd2c3L2dtd3o4TDYyTDl4V1Np?=
 =?utf-8?B?Z3VoYSsySFhOdU1ON3NGTlAyOHVQMDV1Sitjc1VqNFNOZXUvV2VoT1VrZ1NH?=
 =?utf-8?B?aU4zeVl2c2haNElISWdzclhtYUwxaS9uNHFXem1lV2dnMUg2Y0FtR2NCSklR?=
 =?utf-8?B?Wm9DbWEraVYyMGNSZGVtWEM2eXpOYWUrQ0xxYWozWmR3UU11YmNyd2tDWFR4?=
 =?utf-8?B?Y3lpVmtsd0VIR2lTQWNFVlhJS01LY05IRDl5Y3M2R2xCNVlvRktrVzV2WTNO?=
 =?utf-8?B?ZEtERkZKbGN0MWptdnhmQUJsVlVLaDYvdjBZaE9ZUDVXYy9scm5zQzlqTFAr?=
 =?utf-8?B?SWF1RXRTNWMwKzl6ZDNJTkFPdlY3TDd6QW1GT1BkcXVHOFZzYWFLdDRCYnlw?=
 =?utf-8?B?bTl2WVNzYTViM0ZJWTdxajFCN3FxcmtEUnl5MTczVXUyVnBYOHNIMzlyL3ZH?=
 =?utf-8?B?cXorVzRGWThRM00yZktXVm8yOHRjeVY5SDY5eEpIZXdVY0hqVlpYajUrT3Br?=
 =?utf-8?B?L3M4bG9Ca1o0UFRROUJmME5wa1FkTUpzanZWM3BpbFMvQkx0by9mVUtnTkRs?=
 =?utf-8?B?cUdLNndOTjlZcGtrTnptUnZNWnRPUVlUZG85UHpCem5hZE1tV0dnOUxMeWlt?=
 =?utf-8?B?NFI2ekl3MWRRN1k0Sm9BOFFZcnpydk9yWU5wbXlsQ1Z4SzRJc3RxN250R1My?=
 =?utf-8?B?ejJtRGJJc3dqWVFiL0pOWmFsbkRpYjlXME9aelNmSmRBdEZDSVYrMXhaVmNx?=
 =?utf-8?B?T3c0bVJ6aHE2czVtMmU4SmMzNHZZb1J2ZVBhbGRIN3Q3V2pZSjRoVmRqanVP?=
 =?utf-8?B?N2FsaW5uRFdxUVk0VUpTeWkxK1dGUEpEN2haNWRCQTdGd01qV0tsN0dCS2hr?=
 =?utf-8?B?NDZWK2xaL1hiUlNMZnZmckpKVEZOQWpWcjl3dWFuQUNELzdWYjROU3BPQ3JC?=
 =?utf-8?B?K1JUM3FiWXpKM1BCellJOVk0Mng2TDVidXNNQzkvMVcwdDkzSWt2dTkzSHRm?=
 =?utf-8?B?U05qbFp1c1pLWnVDSjFmVWVNUjQxUUMzRktOYWg5V05aWjBHMFh4VG16ajFP?=
 =?utf-8?B?VFFDbUtqZFFsa1lFN1NDWTRKeVBNS2cwN2ttendPQ285VGRYMWpzdlBtbjVi?=
 =?utf-8?B?SUxTRFoydTNWZTF5aUZxdGk2UEl4RTZWQlpzcW1mdzR4YVd2UUtpRDVLRGNB?=
 =?utf-8?B?bE40L0U3STRscy9MSGtwZWJhWmhVRmJHdGRZbXZhdGhWcXM5K2s0N3gvQ3dP?=
 =?utf-8?B?U21LeWR2RVlwNkk5WlU4alFOV1lWdlVqMlZaUlRNdUJhK2NBSDlVdDkwdUdz?=
 =?utf-8?B?UDNVUzl3Tis5NlFpZ1o1QmlwMFJBejNaR2hHRnBSOGNNcGVnTnh4L0MreElV?=
 =?utf-8?B?Q1JnVXVGNVdRVDhGNEZ1MVhFRWR6SnZmRlp1L2lFWG8xVCtuSXJVeEQzMENU?=
 =?utf-8?B?YTFHb01mY3Erdk9ZS3hOTjVheU45TFNCcDNZaXNWQjF1UHRsWG1LYUNXenpo?=
 =?utf-8?B?cVYwQkRqenhUZW5BdkJueWN4M2dtZE5wNk1rWjMraEsvcUxrMTJYcnYvbnBV?=
 =?utf-8?B?MUpKMnJFREdtYXBNSE5qTXdrYWN0ckYxcGJsQUJ2eVZYNnhRdm4waitMdThu?=
 =?utf-8?B?eGtEVmFUT1lDL0gwcGF6YlVwRUZTQVFwc2Yrdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(52116014)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UTZVM2VOVnNZVFlRS0Y4OU4zS01yMmtpNm1uSHl2NXBlSkJqVERXRGxEVWlU?=
 =?utf-8?B?YVJDY0tRV0VJU1htOCtBMC95TGtLTVVDYjlRSW1NYmFlVFlxNDdPN0FzRnE1?=
 =?utf-8?B?RXh3WkJneHhScTkvbHdlMEtIQW8wS3FYQTZ4NkhTdXJ2RDNIUWsrc3gyaVU3?=
 =?utf-8?B?bEJwQ1BCNVZLc29mUjJLWkpzWWo4M0FNYUNTREROQ1ZlR1lTN1pld2UyYUJq?=
 =?utf-8?B?UGhCa3d0MFhuK2JONGFmS0Vqc25lQ3hObjVIYlpaR0p1dU5aVE02VEpwNjhj?=
 =?utf-8?B?ZlEyNXpseWpMbXpTUERVZEk0bjRuY1lwZ1hMYjQ2NllXM3hETmZPelV6Ry9N?=
 =?utf-8?B?SzZ6a1NFL2FtZEx4V2RjYXlEc3BuVDJaVGVXUWZnT2d4VjJ0R0F1RFpPK0dI?=
 =?utf-8?B?aU5PZ0Uxb0RCUHNEbGFoTi9iUmVibU5tcEwxaEFHZkRnVFdvOHlJTUJScm5Y?=
 =?utf-8?B?RVg4SEJvMjM4UGp2MiszTitkTDFONW9GbGpMb3N3NHYrNFYxUWVkcUpwdUxu?=
 =?utf-8?B?MFE4WDk0ZnMyY0p0ektKL2FaZDFCeXp6OElUNngvbHRJNVpwbGVxNWRzQlBH?=
 =?utf-8?B?NFV0Ylo3VUpWTVl5NHI0SkF0WjdwUVpURE40cXRjSUZPZ1JLUkRpZ3Nzc2RI?=
 =?utf-8?B?V1JWNmdLN1VaU28zbkNSNDRnS1NDcXlCMC9VdzJjQjhMdm8xY29jc2ovZThr?=
 =?utf-8?B?cXl5TDNnVSs3M2Frc29oYkR6NkVWUDZWZlFIbkx2RHhQSDRUbGl1dExnMkQ5?=
 =?utf-8?B?eExCSWJyZ2pCcUdmck1yc0l6S2MyTjcreStYNWpEbmt1eStMNVBBOTl3L01B?=
 =?utf-8?B?M2xmaTVxTUw3NXdGN3c5dFpMdHVic2dpVlZhdGtxMk9jQkJyK1lrODV1TWFB?=
 =?utf-8?B?dlhqSjgwYTBDV2lkSlU1REhmMkJIMk5HQnFxd1UxR0hleDQ3K2o0UlFDL1Ji?=
 =?utf-8?B?Y01NVURQQnVIdUx0MzVPQWloUURVTU9abUk0amREbHBFVEM4NjRrbnZETHBy?=
 =?utf-8?B?d1IvODNjMWpkVFZCRFJxZGh6dVl3MFBsc0wzazBiRFplTGpKYWxhNDlZMThU?=
 =?utf-8?B?ZGtlTjdPRTE0ZmpaK05GOXVSVGNLdE5sT2g3SFd1emtwVUpxamxJMzBFMzBI?=
 =?utf-8?B?VERaWDlkVEdJV0luR3Ezb3d2SVUvS3pTYjdSQ0l5Z0RLUjlzUlV1MlB3VG5O?=
 =?utf-8?B?dWJpdmlITS9QYnhPMnYzbGtPVFJzb0pDY05ObmxUTmFKS09HT1JKVUovdU8r?=
 =?utf-8?B?NWh4OE5uVUFNWml1VUp5ZEh5S1hGdlQ3S0VjY041WnBZTGJJK1lQNkkyc1o3?=
 =?utf-8?B?NkhmOTZkemhsaURDK2N2bk1rWWF3dmJ5OXNBVGlmMHpmajlXa1Yxb2hQUlRU?=
 =?utf-8?B?MkozZDJWSkdEaUFFWktNM3FkUnBmYlBvcGY0Vk04QUtqQ2tnTDUyTi9GSklJ?=
 =?utf-8?B?YWducXViVDY5aEprVjV5cnRWaDlUK2tCa2tmRWxCS05qWkFJaXBxVGJrYkor?=
 =?utf-8?B?K25venlYUURscXQ2c1R6OWUvWEtDSjQ3blhVeXFNSzNoa2Fmc2htaDczbnVH?=
 =?utf-8?B?UlBPQmw5aTBRYWpCeDQ1WDNNTkoyUU9obnFYTHVjRktCeXNXR2p3akFyVUZD?=
 =?utf-8?B?TFBYRUhTQTJJR2pVWnZIOE5VQTVleW5hQnVWNnI1bDNHM0lkU0FpR1BNVEdY?=
 =?utf-8?B?amdSa1FSWk5iNVZmZkt5UlFpTVZoWXl6dU1GSFJCdjE2bE9sdzZQT0RBYS8r?=
 =?utf-8?B?RlBqa3FoWFV5WUN1Vjl0NXNDbXhtTVhnRllRQzlVY2I3VVpCbTRvc3o1aEJR?=
 =?utf-8?B?dWI0TWJ2UnRqc1FObjBvR29kc0c1enpiRWNyVHc5WVhYQjU5UFdacWFybjNs?=
 =?utf-8?B?TGlkR1ZzanVLWHU3dVpEc0pyVDdKc1hRV2tlMGp4WSsxU29IOFA1b1JhanV6?=
 =?utf-8?B?YktVVEZaSENYUDVyRUFzOXlRTmZwb21LeXA1OVBpd0VabGw5aVRNcTFvSTNx?=
 =?utf-8?B?QW1sR3B3UnlxUGlmSmdRK3o2UnRUbUVXc1RMV1p6ZDFVQjZ5SkEwMzh6MUp3?=
 =?utf-8?B?WGlTVk1MaFE4YUVqL2pwZ0RuNEpmaTJmTkZ6WEdYSGEvRERVTUExY2ZaYVVr?=
 =?utf-8?Q?BGyhkUhnyAGW0C3Ozf75ux8eg?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f037da0-8206-4211-f58c-08de27234c33
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 04:22:49.1408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZmIII9Hxr6g5yQe+bI+kB9UkwqB89UPj06bBZ+ei04QCBAGmPGFIiA6RUGpOhxBHaR246GAVZojzuauHoVc4Ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11949

From: Peng Fan <peng.fan@nxp.com>

Introduce imx_dsp_rproc_reset_ctr_{start, stop, detect_mode}() helper
functions for i.MX variants using IMX_RPROC_RESET_CONTROLLER to manage
remote processors.

Allows the removal of the IMX_RPROC_RESET_CONTROLLER switch-case blocks
from imx_dsp_rproc_[start,stop,detect_mode](), resulting in cleaner and
more maintainable code.

No functional changes.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
Tested-by: Iuliana Prodan <iuliana.prodan@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_dsp_rproc.c | 69 +++++++++++++++++++++-----------------
 drivers/remoteproc/imx_rproc.h     |  2 --
 2 files changed, 38 insertions(+), 33 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index 91d041c15ac19f527f48c8189421f71fb7c9745e..6237e8db2eff759c2b7fcce5fb4a44e4ebaec8cf 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -346,6 +346,13 @@ static int imx_dsp_rproc_mmio_start(struct rproc *rproc)
 	return regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask, dcfg->src_start);
 }
 
+static int imx_dsp_rproc_reset_ctrl_start(struct rproc *rproc)
+{
+	struct imx_dsp_rproc *priv = rproc->priv;
+
+	return reset_control_deassert(priv->run_stall);
+}
+
 static int imx_dsp_rproc_scu_api_start(struct rproc *rproc)
 {
 	struct imx_dsp_rproc *priv = rproc->priv;
@@ -374,13 +381,7 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
 		goto start_ret;
 	}
 
-	switch (dcfg->method) {
-	case IMX_RPROC_RESET_CONTROLLER:
-		ret = reset_control_deassert(priv->run_stall);
-		break;
-	default:
-		return -EOPNOTSUPP;
-	}
+	return -EOPNOTSUPP;
 
 start_ret:
 	if (ret)
@@ -399,6 +400,13 @@ static int imx_dsp_rproc_mmio_stop(struct rproc *rproc)
 	return regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask, dcfg->src_stop);
 }
 
+static int imx_dsp_rproc_reset_ctrl_stop(struct rproc *rproc)
+{
+	struct imx_dsp_rproc *priv = rproc->priv;
+
+	return reset_control_assert(priv->run_stall);
+}
+
 static int imx_dsp_rproc_scu_api_stop(struct rproc *rproc)
 {
 	struct imx_dsp_rproc *priv = rproc->priv;
@@ -428,13 +436,7 @@ static int imx_dsp_rproc_stop(struct rproc *rproc)
 		goto stop_ret;
 	}
 
-	switch (dcfg->method) {
-	case IMX_RPROC_RESET_CONTROLLER:
-		ret = reset_control_assert(priv->run_stall);
-		break;
-	default:
-		return -EOPNOTSUPP;
-	}
+	return -EOPNOTSUPP;
 
 stop_ret:
 	if (ret)
@@ -1057,6 +1059,20 @@ static int imx_dsp_rproc_mmio_detect_mode(struct rproc *rproc)
 	return 0;
 }
 
+static int imx_dsp_rproc_reset_ctrl_detect_mode(struct rproc *rproc)
+{
+	struct imx_dsp_rproc *priv = rproc->priv;
+	struct device *dev = rproc->dev.parent;
+
+	priv->run_stall = devm_reset_control_get_exclusive(dev, "runstall");
+	if (IS_ERR(priv->run_stall)) {
+		dev_err(dev, "Failed to get DSP runstall reset control\n");
+		return PTR_ERR(priv->run_stall);
+	}
+
+	return 0;
+}
+
 static int imx_dsp_rproc_scu_api_detect_mode(struct rproc *rproc)
 {
 	struct imx_dsp_rproc *priv = rproc->priv;
@@ -1080,26 +1096,11 @@ static int imx_dsp_rproc_detect_mode(struct imx_dsp_rproc *priv)
 {
 	const struct imx_dsp_rproc_dcfg *dsp_dcfg = priv->dsp_dcfg;
 	const struct imx_rproc_dcfg *dcfg = dsp_dcfg->dcfg;
-	struct device *dev = priv->rproc->dev.parent;
-	int ret = 0;
 
 	if (dcfg->ops && dcfg->ops->detect_mode)
 		return dcfg->ops->detect_mode(priv->rproc);
 
-	switch (dsp_dcfg->dcfg->method) {
-	case IMX_RPROC_RESET_CONTROLLER:
-		priv->run_stall = devm_reset_control_get_exclusive(dev, "runstall");
-		if (IS_ERR(priv->run_stall)) {
-			dev_err(dev, "Failed to get DSP runstall reset control\n");
-			return PTR_ERR(priv->run_stall);
-		}
-		break;
-	default:
-		ret = -EOPNOTSUPP;
-		break;
-	}
-
-	return ret;
+	return -EOPNOTSUPP;
 }
 
 static const char *imx_dsp_clks_names[DSP_RPROC_CLK_MAX] = {
@@ -1324,6 +1325,12 @@ static const struct imx_rproc_plat_ops imx_dsp_rproc_ops_mmio = {
 	.detect_mode	= imx_dsp_rproc_mmio_detect_mode,
 };
 
+static const struct imx_rproc_plat_ops imx_dsp_rproc_ops_reset_ctrl = {
+	.start		= imx_dsp_rproc_reset_ctrl_start,
+	.stop		= imx_dsp_rproc_reset_ctrl_stop,
+	.detect_mode	= imx_dsp_rproc_reset_ctrl_detect_mode,
+};
+
 static const struct imx_rproc_plat_ops imx_dsp_rproc_ops_scu_api = {
 	.start		= imx_dsp_rproc_scu_api_start,
 	.stop		= imx_dsp_rproc_scu_api_stop,
@@ -1334,7 +1341,7 @@ static const struct imx_rproc_plat_ops imx_dsp_rproc_ops_scu_api = {
 static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8mp = {
 	.att		= imx_dsp_rproc_att_imx8mp,
 	.att_size	= ARRAY_SIZE(imx_dsp_rproc_att_imx8mp),
-	.method		= IMX_RPROC_RESET_CONTROLLER,
+	.ops		= &imx_dsp_rproc_ops_reset_ctrl,
 };
 
 static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8mp = {
diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
index a6b4625e8be76c6eb6a5d8ef45eb5f3aec5fe375..6a7359f05178a937d02b027fe4166319068bd65c 100644
--- a/drivers/remoteproc/imx_rproc.h
+++ b/drivers/remoteproc/imx_rproc.h
@@ -20,8 +20,6 @@ enum imx_rproc_method {
 	IMX_RPROC_NONE,
 	/* Through ARM SMCCC */
 	IMX_RPROC_SMC,
-	/* Through Reset Controller API */
-	IMX_RPROC_RESET_CONTROLLER,
 };
 
 /* dcfg flags */

-- 
2.37.1

