Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010018.outbound.protection.outlook.com [52.101.84.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF7B30FC2D;
	Tue, 23 Sep 2025 05:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758604619; cv=fail; b=j9bEwV7ax9fVcbv1ayx1y2s4eIgf44yZHj+9QYCPPc16DKoVnGekOAvB1n1blk3G8KsOqiDEB+T7kxF9G1/wD0eSh4QmHNzJhpbP0WR2XoRUMdibjuXzN1zIIpBX31+rYKmwlWK29bK0xkWluiGAxVZA92Itws6E7+D7w3xFQYY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758604619; c=relaxed/simple;
	bh=Irfhxyawgv7CV+zrEK19UZh6DQIzRtTHIxhfR7Tz0cE=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=N/sOJvgsRSqMtaokLaD5vSRmYm6bEFhDI0dkgiJLIAOn4k5ElO9oKq/eRVgOjbxr1QHePIpecedKGX1R9bsm1D/20CnrZeQ6XJihmTrxDd7wBe8JcIlnm32LRUcVs+c7ltbwWzWB3sCUswqwQ2AoA6aIdCJhjbKJSoxFqrk0npo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hx+atYbU; arc=fail smtp.client-ip=52.101.84.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hx+atYbU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eLeGLyN+1P0f+XrLViMKzwhRt2kAsl8OubGBqIg+t1FysSOqVOhOShcClG+FW4kNaih/tOmzPXKzPdV5Wjsoi2WiryI07bsqMQt0b0+6MRa8InuoQMdFyNY+Fk1nOkKGzjouOMduVOp8eW9/50b6sobi9oFJ7M1FnzA19ZaUKetsrSirqNv38meL4O+9ZrzR7gRkzQefSisldI/JvR3UIOO3x1T3S1TX19cye8br7FKiYgubttyNKu3YxIKpdHoJnqSyDlccCRoYiOMMsyH6nHY4SvCjrXivmdGipgFD2/o39pGyqL+J8CCUT6ej7QEYKvAd8nONQ9c/YDoUEyzAog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KXcelVfoyWT5T2qA1y++kcmbq6dqXGpdlv+2AAWVcWI=;
 b=NAU3/sWDY0w5iUPFs1IsCNqzaMxBiTyffvuVTsJM1UeZScpGsVidvfpAr6e8yqk7CfeBkRHhgNDDvDP6j7MAl0Tv10bElwmdxenfEr9B5z7nwcF3yw5UpVEb7PeorjCWYSc7KOOcLuWLKaUkzKPFWx0WYkmbOkfq+eAerOBK7A/8lxLs2xSmAvIRHQAvoL06zIU0qIa2OqUvHnyma6wXJzaabfIOlBFsH5NYHvDOuB79WMbll8J4tOfTpshZOP+aIdKtJWI1kO7yC09MQHLZuAO42XePe16r0V6UNzxxplWAfuoxM1ZbkQoGDEWK97oPqcDPj67v0S785cLtNX0sYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KXcelVfoyWT5T2qA1y++kcmbq6dqXGpdlv+2AAWVcWI=;
 b=hx+atYbU5RKZCHJMyGTF53OCXpYkYQbTWq3oEWzbbYC4yBUULbup5v/hrj+qBeylTjzUTlHeizqKN511UZvx0RAwqBdm377i3suIcJCpQrgG50MMeUBIc3hicJCn4eA2G2DUKLB/UCAtneaRAVqM6cQ5HY79QQb6vTIhMVPKCK0NXgbk3V1pcPvt1ik28S8+r4bm3fQ3mYSd6R5x+VItaEko9VAOzJuGN3112zN2QKJIS/oKK8LyBS+StmWAZqXlw1sPgCcKGDCa5SogV83zITfNcXNo0wexFRPdmGHKD9TwyOFOSRwi0OxEZGOpybECkFw5mAkADYmujGz+WZ3xQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS4PR04MB9340.eurprd04.prod.outlook.com (2603:10a6:20b:4e8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Tue, 23 Sep
 2025 05:16:53 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9160.008; Tue, 23 Sep 2025
 05:16:53 +0000
From: Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v2 0/6] remoteproc: imx_rproc: Use device managed API to
 clean up the driver
Date: Tue, 23 Sep 2025 13:16:32 +0800
Message-Id: <20250923-imx_rproc_c2-v2-0-d31c437507e5@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADAt0mgC/3XNTQrCMBCG4auUrI2k05g2rryHSEknU5tFf0glV
 ErvblpERXT5DTzvzGwk72hkx2RmnoIbXd/FAbuEYWO6K3Fn42Yg4CB0qrhrp9IPvscSgUOljc2
 LAmppWSSDp9pNW+58ibtx4633960e0vX6JxRSLriVqGqSRuo0O3XTsMe+XatPkv8gQiBBZlGjo
 hdZPwf4/PZNIVIwShBUKHJt33RZlgdvHXr2FAEAAA==
X-Change-ID: 20250916-imx_rproc_c2-2b9ad7882f4d
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Hiago De Franco <hiago.franco@toradex.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758604605; l=1519;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=Irfhxyawgv7CV+zrEK19UZh6DQIzRtTHIxhfR7Tz0cE=;
 b=oiba//aEZD0hYgiNNvaR9jSt5ZressI7uaBz1xW/p3t0/eGM78l+Tgsp8a2+MuiKQeXyJbbAb
 Fih95x9W3wQAQIouRQOPlmA3UjJ0SkeDmfD9qwwYqffk1wWj3YsdHfg
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: MA0PR01CA0070.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::15) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS4PR04MB9340:EE_
X-MS-Office365-Filtering-Correlation-Id: 5100a2c1-e1a0-44a3-3296-08ddfa6068a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TmRHNnJWb0R4bUpZckhMUUZaUFVITkNkbU5sakNKTjd5VG1rTWM0dGJRN2di?=
 =?utf-8?B?ZlBmMHdBN3M4TUlZa1JRRzV1VEhuUUQzeXF2cHlCNXlIamZnNEVURm9UbTdh?=
 =?utf-8?B?bEJabVlaRHZ1STdvSlhUYWRCQVhQMGZFa04xYVc5QUdJOEZDZ1AvMDBvNXZz?=
 =?utf-8?B?eTIyK0U3NFJ4U2d2R0hOM0xPQlU0MzRyL0Z0WjFMTlY1VXNJYkNDTWUyWlFX?=
 =?utf-8?B?V0RxQ0M1aTZ4ZktMUjhjejVONkw5REM0cjRRVFgzTkpERnpVMEZkQjF5QXlo?=
 =?utf-8?B?Z1g1cDlsSUZOYm5BRXZlalRkc294N0doZ0pnZjI2dDZHVXlPTFlDaEhHaEFa?=
 =?utf-8?B?MnpRUE9lQnBoVVBxTUxGWDBHWit2clRHcTZreGFvblJCSHVZa1NkaVROR1Rx?=
 =?utf-8?B?L2p4V09nNlNiUlp4RFcwdUt1Rmhhd2lTeXB4Kzg3OU5xWmZHQ05VR1ovbTh2?=
 =?utf-8?B?S013K1EvODlIa0pwdmVsQTI5cFFydWdRblBTWDE2N0dDcFRseEMxTmk5dk1y?=
 =?utf-8?B?QUFIeXQ0YVhuNW5oZUoyeUN0NXZWT3hBMUQ3OHcxTEcyWnJLUlVuK2U2aUZu?=
 =?utf-8?B?cTZ5NHM0QXZLdGYvYmZ3c1pvZSt6SVA5V2NoVVJCM24zRHR0QmtDbnZER3g0?=
 =?utf-8?B?bE9rbE9NdVdxcGNSak1vR0wyRGkrZWwvajhjMFhOTU9SaTFia3hwNXNCUmp4?=
 =?utf-8?B?VjcrM3Z6RUZtVjZ5UXAyT05OOTBDcTllWm5mclIyUDNHbVpQTUYvYnhDRHlj?=
 =?utf-8?B?eDg4YkRqenc4ZTdlbDdFYTJ2RWlndnJWVjljWTRFMHF5T2ROdi93b3RDNXVl?=
 =?utf-8?B?a056cUFtT0UvS0VadHhxUUJjWGorZ0pDRDduVDRTVThDYU1mL2NVRFhzNlB5?=
 =?utf-8?B?OHI0Y2pnb1ZoMFdZdmlvdDVJd3loREdHQzYwdzVQNGJrS25jZHlJZk9IUWll?=
 =?utf-8?B?enZPZ2Q3QlJXU1I4YWxpdmpOSzM1K3NEVjhZQ0VrZVVKSitCUkFhYU4yYWww?=
 =?utf-8?B?QStSb2JYbk1iVlQ4eFRldnd3K2svWFFCT0ZiSHhBbW9OVE84WmN0TllPSzMr?=
 =?utf-8?B?VURRdFlSOWtQNm1KZVlTQ3dOa1NxU00wazZHeE9CanZSUFNXWjNjOXlid1J6?=
 =?utf-8?B?QjBhekt2RnV2cE9kelNMb0JJS2xuMWFSZEREUG5VNmh1ZTdGdTlzSUNab2NE?=
 =?utf-8?B?NzBrVDI5cU1VMjF6RGJzVy9aclVPM2p1eEl6T25ISEJBcTFsQVhib2VLcXlu?=
 =?utf-8?B?T0Z2L1AwS04vUGlrSnpqZ09mTmplVG90ZktXaTBSWFBTU2N3OWNIUEFPNkpi?=
 =?utf-8?B?a01KSm95NkRiMHkwQjFxR24vaHZRNHFXWWFDYnlDdmZ5azNWejRRbXNBTkxT?=
 =?utf-8?B?ejhKd1JNMzkyaFBKMEFMbWZONVdvSEV0NHV3WmZOeTh6QXpXQk41RjlFM21E?=
 =?utf-8?B?MFpvaWxiNXhOdmhDRWNqdDNjUDFmRGZiSlF4VFpPQkFNWWhUeTdzTzRrOWl0?=
 =?utf-8?B?Yzk4VkJocDlGSnpKcHlEUVNVU1IyVHJCNlA5dmRYQVZrRXBJSXM3V2paUnJo?=
 =?utf-8?B?eUpHQlBJUS93Uk9hVDA3S2JzbVFrRFZGUWtkRXFQRm5adTY4TTMzM0h5L1Q0?=
 =?utf-8?B?dmczQUttL29jWUY4Q3VKZ2pDN24vQm53VnM2MkZPa2Y0QlhXVlZzM3JSQ3l6?=
 =?utf-8?B?elQySUtTRlU3QjBUeFZSa2J2a3dUQWJSTmZaYm1URUpML3ppSEU0Wk1VbnNJ?=
 =?utf-8?B?TWptR0dLYytIY2JXbHdBTERpRmhRdUpGRFV5eVhuZmVDR3NuYitpMmxtNGlL?=
 =?utf-8?B?WUR6djNDczE3ZDBUNWJCeDlxZzR4WU50MUxnVlZmNWFBUHRjdzJneWNyZnJZ?=
 =?utf-8?B?SnNTMWlBcXZjOFRMRkZ6aGVlRHZERVNSSktHUXFnbTIvUThWemowanZVZSt0?=
 =?utf-8?B?TU1RN1FraVhUc2tmV25sTWs0NCtrck9lZngwL3RZb1ZBMEQ1OERoY1VlS2JG?=
 =?utf-8?Q?tGG8PFjvK7dJ1fDPPOGYIelDJahR6s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUZ1dHNpRkFlRDg4OTBjTVFiemVGazEvY3l6Szcxb2pYWnhuZ0hKMHN5ZjZB?=
 =?utf-8?B?U0pnUzB2eDFnRTFna1FOeGhjMlBSM2xsK3o2a3V5TXlPV2lPMFAxUTF1Y2xP?=
 =?utf-8?B?MTgvOGpMdDc2QmFTSDVNdzc4QlV6ZDFRbWRnc2liYUJSd3puN0ZuUWxxdUta?=
 =?utf-8?B?dlhaQUMzYWxHZmxzTnozMmFzWnhybWdIUFJBNVhHbzY1eG1pVkFKQkk1ZUIw?=
 =?utf-8?B?R3FZWWFSSWtLQmMxN0JWclN4Nmp2Rm00azQxUS91L1ZFbk1lV0dWVUkrcnpu?=
 =?utf-8?B?N3VrU3lOaU5tTG5WeS9FODVXTkduRFJxdVpRYUdNNmlYcE1PelBIVnkwTFFa?=
 =?utf-8?B?dEl6WGc4RUtTWnVpQi9TVVZTRjVSWkczQ2lKNkU0T3c3ejF4S0Y4b3QzYlpv?=
 =?utf-8?B?c2FOb0VoZUlUZjc0UmhEV1dSWDVzZDBlR3lrSWRNaXp5YzVBeUhCZ1RSZU5k?=
 =?utf-8?B?OFpaU2FXekhCS1NWTzdFVjgwS1cyTmxsclc5SUl0dWhPZ1hxM0d5clFNb0pm?=
 =?utf-8?B?U1BYZ3VzRXI0OWdzdHZ0S0g5Vlg5TkZ2ZFRpZUpvTVl1djFnVUVRSEkveUZJ?=
 =?utf-8?B?WTJXY2w4aTVHM2FDZGtaQlFvRnR5YXJXT1hPaFA5SE0zQ2NGenMxdlBJRjg5?=
 =?utf-8?B?WUtaT2t0eU1PNzNDZXhpK25uMVBHckgzVm5Rcmx6ZG5wQUI2ay9CQjJVVnQy?=
 =?utf-8?B?WlpjWUFwQmprZ00yRUY1T0dtZWFWZndhTkZ3UWFaQ0h6V0FocXVMVjd0a0Nq?=
 =?utf-8?B?Z3B3Z3phOUhMNjJndmJLZURob0JKMzgyM3Q2RG9QbXlHeitZUDJIWUVQMGdn?=
 =?utf-8?B?b0N6ZzErWGhRa0VXTFhqc2xzZHZmb1R2OXZlaGtSOXduMXhYblc4MG5CK245?=
 =?utf-8?B?VEM2eGFsZmIwQ2ZEWmJOYVdNbjdhYUUrYzlnSHROWEluQzRpaEJ3alp5c2x4?=
 =?utf-8?B?N2FreTVadEFJRlRoOXdNSHFTTXNjTkh1ZmMrWHJ6Yit0VlBIOFFxdkxJVUJE?=
 =?utf-8?B?U0xNbUxRZUhTWEtnN2ZuWEhjdFBTbDNVTnF0Mm1WSld2UGhNaldWSkhxRTFr?=
 =?utf-8?B?d0YzTUhGUUVraXYyN0RFQXdWTVhya1hLWDZJY3BMTlZRNVc2ck5URnZueWZu?=
 =?utf-8?B?dGFhQWJYMlRWK2hKZ1N6OUVrRUFLY3Y4VTdoMFZFK3hEQkJ3UFR4RDdkMXFp?=
 =?utf-8?B?RTR1UWt2VXpWUEdvYUxkY1IwbzIxb3J4cUg5NGhTLzlEZ3ZNbE5CSGUzWEVx?=
 =?utf-8?B?ODMySmk5ZzFpSmhiMDVOT2NtSlA1dHhLSTNyQ3UvOFd0QUduS2QwNzBQdUlw?=
 =?utf-8?B?di85Ym5tV001YmxWTDZqYURObjlSNnFQSTNZa090MnVLZDJjdGdqbGFRZ2tw?=
 =?utf-8?B?a0JxTXJRc3M3ZUVOY3JhbDFTZFdOQmVQbUtqRi9vV3ovNjRxa2pBUzc0RXB1?=
 =?utf-8?B?dFRZYVh5bEFJSzFYaGdjeVFLOWtaeTc4VHZFYTc4Y0xxTWd4eXdFKy81ZkxO?=
 =?utf-8?B?TkxCNG1pelZsVUpNdmtCc2d6eFpCa1NyUDlydzVWNzJWNm9aMDdpWFVwUG5H?=
 =?utf-8?B?eXlVcTlnMXd1aGRIZnJoMUczeVIwNHdyOUVkVmk1czBUcExIbXdrSUlzR2lR?=
 =?utf-8?B?TldQTG9oWFV6b2Y3Vm0weDlNSHprOG41QllMbzFieW53RmxhR3VCZWtRWDNF?=
 =?utf-8?B?cDI5cVloSTlKejE3eVZhTlFGRStmWElJSFRJcVhUWU1kdHE0bXBoQlF4alBI?=
 =?utf-8?B?QmVENk5DempodjR6MVE4R2pyWUYwVHdmUjQyOGY4cndDWWxIODhua0syYUp0?=
 =?utf-8?B?RHQxdEsxb3pJTStBL0FUWnFrMU1pTnlXbTlKb1dQUkNkaFpLdFJmRWNSSlM3?=
 =?utf-8?B?azRRT1BoaGtpUVFOeC9mZXVNNnE4MlZlMHhmUlYyOTU3bEtRVHNxSUN1ZHp1?=
 =?utf-8?B?ZDhpYkNwamVIZWpvK3JzVEZPU0h5NjFhMVhibXRodDhhN09DQWh2anI2bzNq?=
 =?utf-8?B?dzNHZ2pnWEpmSG5qV3RTWmRGajdmekVuYm85SjY1bklkQ05sM2tFT3ovbm9E?=
 =?utf-8?B?bXJnY1I5TlRvZUJVdy9iNlB1RWRFQ1VZbDFlcmhDZmFBN2ZCRmNFcnBtdGFy?=
 =?utf-8?Q?fB7ysL7bC0F9RfvtbkYPyjes6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5100a2c1-e1a0-44a3-3296-08ddfa6068a1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 05:16:53.7223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fd34PqWLa9GIGu/zrDvZFcJK6V/KMiYSEWvCAy16vpSkloKr3u04+lucuzPSdceY2ofJeladjrl1qnW3ZyafVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9340

This is the 2nd series to cleanup the driver.

Patch 1:
Fix the runtime usage. This is not critical bug fix, so it could be
defered to 6.18.

Patch 2-6:
Use devres managed API to cleanup the error handling path and remove path.

Tested on
i.MX8MP-EVK, i.MX8MM-EVK, i.MX93-11x11-EVK, i.MX8QXP-MEK, and i.MX8ULP-EVK.

There is still a 3rd patchset to do further cleanup. After this patchset
get reviewed, the 3rd patchset will be posted out to list.

Thanks to Daniel and Frank for the internal reviewing.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v2:
- Address a build warning in patch 4/6
- Add R-b from Frank and Daniel
- Link to v1: https://lore.kernel.org/r/20250917-imx_rproc_c2-v1-0-00ce23dc9c6e@nxp.com

---
Peng Fan (6):
      remoteproc: imx_rproc: Fix runtime PM cleanup order and error handling
      remoteproc: imx_rproc: Use devm_add_action_or_reset() for workqueue cleanup
      remoteproc: imx_rproc: Use devm_add_action_or_reset() for mailbox cleanup
      remoteproc: imx_rproc: Use devm_clk_get_enabled() and simplify cleanup
      remoteproc: imx_rproc: Use devm_add_action_or_reset() for scu cleanup
      remoteproc: imx_rproc: Use devm_rproc_add() helper

 drivers/remoteproc/imx_rproc.c | 128 ++++++++++++++++++-----------------------
 1 file changed, 57 insertions(+), 71 deletions(-)
---
base-commit: c3067c2c38316c3ef013636c93daa285ee6aaa2e
change-id: 20250916-imx_rproc_c2-2b9ad7882f4d

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

