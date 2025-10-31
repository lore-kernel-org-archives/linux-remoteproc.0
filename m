Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010036.outbound.protection.outlook.com [52.101.84.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C8A32ED37;
	Fri, 31 Oct 2025 09:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761901795; cv=fail; b=OK306EutxzW8K4Y1ouXJOVmM1oA8BLH1c1iFK/jRzna+yETzU9bT0k54jqpzcNtseOOSIq58MPmStJ0ofelyemVeYr/oBgoDSE1ak+IK/7CZ8DcnukSsLgesuC0GrctEBhSmk851OZkOiRAnNQUVTlh+2uTyjagHQzy65HXzIjs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761901795; c=relaxed/simple;
	bh=tMWvhvweWATfEdw9pDPpp7wadcOT7LgCnVS1SEBgiEw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=TIpYYSk4pT6RYu4zLmFcAlcp/1DAmQjstfm2OArzaO3DBjlOrXVYgNPaTls4gbYHVEMSnW6XFy1DoWBYynoohlqYez+31ecAetqyEJsVFhzElNxq6h4zdesBB6CKoKSAA+kj+s+ccuT9asNzvbOP3kh9QviNu9X4ylFqaktzdpQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GK27HjEq; arc=fail smtp.client-ip=52.101.84.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GK27HjEq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PhsDMf3T7co9FQQbrP0OXeYQYJZZZ3H/4LuvvE63u96z6p2RjhBHWqD68RsELp2dJAUFbi7LDsdE8N7utX8tHYE740I0sSHyMUITBQf+98DUkprq4wcPxfagSewsxxkdnjYule2Ab+W/uuOzR0L3fMsptpuyeKnuD1Qe5tOCKmGN45h65snK1lsxjcCvUI/auEvJsuJBiaJQLAgl2fWO0/dg92K7f/V3jHGWyw5mBM/FP7b/yDeLzM3693QRxdzDhQVqQ9iDJ+dixw83RcocibxeamfaGG/VKMyPL55ocAw13fVCugmbAbwS5bWUDiyuz6erXXWLhUQbA7VnvLR39A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GwcGBx4ZFWyd6XYjlrNGGWD6diTLLMtT0sm+zgz08AE=;
 b=t9Tq6/5fM9/NVzN85DxLBkOXVyt+VSDBOeBu+CWqdxc5fYxJ0moGxM5kOmqHsVdcc/rgSnq7vYRRD4zxG9ZtiEKQJz5dgbzMFnUwT+smV+omLGBYkLs5lGnQYqJNuINtBYd2Ylwe1BAqDuqWnzWtQdQ2RIZ7aktMAYFOUzjfeRWz8RgD7OmQOifV8ZDeCZrLRAGb9EGq3oLZOW7Jc/P7mFzABaiGCK/GcGH58bGMmArBubWSbPTYm/z+gUYSGGcz8b3hPd3F/TQeMF+gIicXvOJTMRXq22/l7o9KFMSPH1dtFrsBDZmXDS64BCQVEUKGfCsQljx6sXBHodbmmsCjAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GwcGBx4ZFWyd6XYjlrNGGWD6diTLLMtT0sm+zgz08AE=;
 b=GK27HjEqgOyPU9AnfO7omr7CqnaqunrmFljrIgVZIQUXDezI7Ri7Y02pbfJXN8OKAlvqLC1x6XBiEAxogMczAmzS2rC6Ug0xvQu2m8SF4iImbUCl8cKDe5ApaM2iwN6pX0aWeEUWGEqPBAopLQejFd93Ee5Ejo4AiYnkIbDyHq8y6wVqWaCAOGZiPTc0mDdzNpitSKB9aTFbKJs+L37j+lrm3D7MIXCTlQCTreH2+OGrMoNJNv5sqvkdGRVdlZmpn2Ch4zLdyeAu0CzcJOoU+Lcs3WQTvREDuQTncnutkQ19bPCfahXKl+agQmiGbq/PcniLgnSmk4RjQWfh7KRVzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8093.eurprd04.prod.outlook.com (2603:10a6:102:1c9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 09:09:51 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 09:09:51 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Fri, 31 Oct 2025 17:08:40 +0800
Subject: [PATCH 11/11] remoteproc: imx_rproc: Remove enum imx_rproc_method
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-imx-dsp-2025-10-31-v1-11-282f66f55804@nxp.com>
References: <20251031-imx-dsp-2025-10-31-v1-0-282f66f55804@nxp.com>
In-Reply-To: <20251031-imx-dsp-2025-10-31-v1-0-282f66f55804@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <frank.li@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761901729; l=1006;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=tMWvhvweWATfEdw9pDPpp7wadcOT7LgCnVS1SEBgiEw=;
 b=KdXkbBzjL3los8XHF12IKuxRBNwZf6X6auUKwjoqCjcG2zO0hbddV5A9v5OU+FLcND0s0MY7J
 BiVTh5nd7mDBSSxcLtyNJXnoTfknpLILrqD7cl7+t2eu3sI746ervMR
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2P153CA0010.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::13) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB8093:EE_
X-MS-Office365-Filtering-Correlation-Id: 30ffa2df-fb41-4e23-0b67-08de185d3f1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T0lTdXduZVpRZUpQYkd2QWo2QlF3NVZlUGkwNGY1ZENGMGZsZ21oU0lRYy91?=
 =?utf-8?B?MVFoNjBsMWZaVmlKRTVFTVFTZWtab2VEY1VHUkVrbkNlZEJySHB3TXZTWjJs?=
 =?utf-8?B?Z1ZGVWNVZHZEVDhUOHh1R0NpZXRjUGtZVXYxUXAwNitFMysxZHlCcmxmVFF6?=
 =?utf-8?B?enJnQU05OGVmOW5kSTFPOWZyNlZvWGRGd2lzd1VUNTlwNExvYnZhWTZJcFkr?=
 =?utf-8?B?VlZHVDM5VVAramp3Qit4YVRKdnNDYVBuUnZraU1pQ2IvZGpmYjBYd2wzaFgv?=
 =?utf-8?B?Qk1CdGRGOFVkZVJWMHJVdFplQW9Nd2NWUEt3SnkyZjgwREQvdXRqYUcvd1pN?=
 =?utf-8?B?dHd3eGxhbjcrZGxLcUw3ajJ4NFZtL3hMRFhoQUlhejBzQ25zdVBRYjVsZEh1?=
 =?utf-8?B?SDFtdTk3ZGI3VEFCMXBKdzdQRkhwS1N2R1dRSUt1K1ZsOXpjNkFqeUNVZEho?=
 =?utf-8?B?Smg2VlNERWVMMm5RYUcrNDlSNHhYMTBTRmg5WEQzWWJNM0Y2S0lrQjVaUHdN?=
 =?utf-8?B?bEhMMUlDOUFzblRwU3lBNm1ETCtWMkdqWlh5Z29BOStxaldUUGo1MWwyK2tH?=
 =?utf-8?B?ME1yM2N5OUhiYU1CKzlzcDBQTXlKT0ZWZWQ2b0lBd0RwNjl4Z2RwdWJrMTFq?=
 =?utf-8?B?b2pZS0xzWUExR1ZmTXlselM1SkR0OW9xSWxXMjUvZGhDZVNYVzd4eVp0NFR4?=
 =?utf-8?B?cThWVDVGNUQ5NVdwVmYzYyt5N2kycllSUVNxejliV3FNUkNldW94WlNSTzE5?=
 =?utf-8?B?NklWN2oyWmtRclgrRUdvQ3I5TGxqVjJNVnV0ZVBERG9qb2lGK1JTaDBGSUJF?=
 =?utf-8?B?TFlicm4wangwbUhJTFdvcldRR3NwUzdBSWV5Wjcra05MY3hEVk9lRUpDbzE3?=
 =?utf-8?B?MFczdWE2MWMyMWJGYTlDZmNzSk9LWDZKdzAzQ1ZVUWlPRExOeVl5Y2lpa0hP?=
 =?utf-8?B?S0VuaVI2bHNtRDlUdlpUdFQ4UjByZ3M1RjdEdy9zcjE3Vkh0Q2d4dk93V253?=
 =?utf-8?B?c29hQ3c2a1JESS9PRFRzeU5DZEtzZjcxMFlEbHFxZDd3VzF4VEJCR2FEWE94?=
 =?utf-8?B?RElkME5mbVpwdExDWnE4VmR6dlJpelR6cE15RWRyaGViVGFWZ1R3dGxHeG9h?=
 =?utf-8?B?R0c5L2xVa1Ard0tETEhaNnkvWE1VQnZpNUZablZ2U0tJTXFuQS9ZVnpEcm93?=
 =?utf-8?B?My9pL2ZDT0lwT04wMWdzbGQ1bDFiVXhmb3Z3ejVjV0hZY1hnd3ZnNi9pU3Js?=
 =?utf-8?B?bUlsdlRKaDhIUmtTSFh5UGx2OXlnUEpzcDgxdXNvck44bXZwbDUxNXJxd0la?=
 =?utf-8?B?ajJrb2Z5djBna1d0ZXJzSEpURFdqS25lSWU0ZnNXWUpSaTYwZm9vQnQySXpI?=
 =?utf-8?B?NTBqMHp1Q1lZbllubmtyT3BTNWw5SnBTMjYxL3crVkEyM0JPYm9mWE15Sjgw?=
 =?utf-8?B?Q2VGRWhYYTYzS1JVM08vREhvQnFyTCs2NGNSMWVkekdrbTVqQVZGUGI5NGEx?=
 =?utf-8?B?KzRMdG5OWDNjVGQ4bXlxdys3Nzh5N1QyWVlUV1gxd3plamRPY1BGemM1QzBK?=
 =?utf-8?B?b1NWd1laZ2lQWklsYnoycEdVSCs5eERtc3VRUmdnNUszUm1QdUh6eDNPTWJW?=
 =?utf-8?B?UmN0V0w1dERpUDBwMTFHWnlpSzBoRHlQd0V4RWNRbEJOZWszTHBNYm53Vk5m?=
 =?utf-8?B?NExOcUxrSWlBeUY4VjZRWWk2cURjc0p3MHpPLy9aRlNTTHFtdHR2SUZIRCs5?=
 =?utf-8?B?OThlOFJNQmVLOHo3ZStqOFZmSHFUUnRIWXdLZytiRjZod3ZLNmI0RHJrTTFr?=
 =?utf-8?B?VE5mOHpNaWV5aWdnTitoRmY4OW0walRnenM0dlc4T3dHVkRFVGFXZnRlTGRJ?=
 =?utf-8?B?bDExa3dDMWYycDBkUjluN0xoRVBNTlB4clIxMWkrdmJjNTdFMHY2Z2RqVnE3?=
 =?utf-8?B?VDB5SDhZVkh2RC81NnJrSFdSTnBzaGlGbW1oU0hZdkJHU3ZiV0M0ZytDWEdy?=
 =?utf-8?B?L0cvWjhDbkNPZnd0YjhiY1R1VjIvbEowTkxLa05rOUZSejlYSXlLeVduenk3?=
 =?utf-8?B?K2w1ajRvZGFRay9tTGhLZXVpK0VWZTNPU1d4Zz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGd3UWMvTllnNFdkTzJadzhqL0JFTDZ4S3VDYlozNHRBVDJhWEtBMmhjeVo3?=
 =?utf-8?B?VTFZZVhHQTdhT09BNVk5OG53Ly9ycjZHOUZQYUtybys4YVBhT0p3MEJjVXFP?=
 =?utf-8?B?Y1VJZDVWK05LUGN0T0JHRTNia05mVXR0ZUJZOENOa09FWFUyL0NEeFRDZjI4?=
 =?utf-8?B?SkpQbnlzZGxlUmhSZXdZWWoxUnNrcyt0d2s2bTBwOFZSY1poNmZ1OWpIWWdC?=
 =?utf-8?B?d0I4K25TeDF3R3o3Sm1WbkpvUW5PNzhXMXh0b1VJS0VIVVZHckMvRGhuMElR?=
 =?utf-8?B?WTMvNUhtYmxEY1FCbm1QSlh3TDBEcUlsU2Zzc2VaKzZneGFveU5VRmpEZFFw?=
 =?utf-8?B?MG9tVlcxbkJlZ3VrUWxXeXNnWjdVYjJpV1kwZktXeVdUN2N4SlRtZmI1TjVK?=
 =?utf-8?B?R2M3djhFby90RGZsTW0zOVRHTWtrN1pLN1QyVmhDUWlDZW52U2Voam1OMVR3?=
 =?utf-8?B?Y01Qci9MY3hPNGp5alpEenhULzhYT2xpc2pXakZUUDU5SkhQZkhKT1RWSDNv?=
 =?utf-8?B?Y1RTWkY5RzRnMlllM1BjVStGaDh3d3N4bTNuc05lYTVFMm9hTDl1dzJhMVND?=
 =?utf-8?B?T2pBTllzRVY0YjFIUTgrQkppQmMyZ2xmb1ROby9IWVRKNWJRK08rT0FLQnFH?=
 =?utf-8?B?UTE2bE5pM05aanNsS2tYakNIZzFkb2JvRGhnUW56RVY4WDRGK0NhWGoraFhJ?=
 =?utf-8?B?NENiZytvc1RnWW9FS0xhRExtMjBEZ1FuemVzLzlwaDEzYVJGTlEya3hEbzAx?=
 =?utf-8?B?a1MwQ2hpdGpLd0hOclBlOWJMZHM0N1Q2cWc5dElHa3pMamE5alYybnVwLytt?=
 =?utf-8?B?eTJjeHdzWWNkZEFqekdUVGoxYitsZjE1RU96dnZPZlVEMTB4UGFiMlpqMFd3?=
 =?utf-8?B?K3B5aU5ZZ2dSTDBmUXREb2tzVndsVkRaNlAwb0NQNmlva082azFGTzlEU2xa?=
 =?utf-8?B?UldnaGZodXhtUDhCdU5PTnV0Wnh4MXo4UlNhd3ZkczlCVWs0eDRzdHEzblVR?=
 =?utf-8?B?Wm5tNG1BVk0xRUdzZk5WM2hLS2k2QUdKL1puVldIK0N3Sk9KYzcrTCsxRDVF?=
 =?utf-8?B?eUt2aUU2MWwwOGhZUnZXZ3lYUkd6RXUrRDhZaUx0blJJellPRWVWelRUYW5y?=
 =?utf-8?B?ekNRVzZNcUZwbFdkYURWS3pXTXVob3c4K3ZGQ2hLT2ZjN2xrVStCL2Q0WDM4?=
 =?utf-8?B?QjFMY2R2SFQydjdYbG9rVncyRXFSSDRhbEYvdFY4UmNId1hsdzhnL3dkZjlj?=
 =?utf-8?B?U25aUjdPUE1BbTlITU9Bdk1INk9xL3JRMUhKdU9NTjN2OFEwWG51Y3VuRk83?=
 =?utf-8?B?b1ZuQVhQS3pWSHJpUWJpL2E2TzZxZU9VU3craW1LbVBLMHRtbHM5YnZHOEEy?=
 =?utf-8?B?UzFFMGNYVmVuVHFnTWNySXM4QmRCelNpUUFVUmZaaTJ4SEZNdGhkdXFaTXFD?=
 =?utf-8?B?Z04xT1haeCtBa0xCTU5VWVc4MVBEMmpXVEZWOG5rZmNRMFNPWHdsSUFUWmpR?=
 =?utf-8?B?RE1NUDVDNzdMS3gzOW5ZT0htcjgyRm15aVBzTWR1OVhhQjlZOUdTVXl4QUxp?=
 =?utf-8?B?ODExVWRkNmN6c0RvUVBqbkxEVDhPeUo4SjJocy9YaHMvM0psWHlicVNOUFEz?=
 =?utf-8?B?b1R6ZUhaWlJiVUh5NmlIMWZ5d2t6ci9LUThZNjJzMXVIVFZRQWFMWGpDV2l1?=
 =?utf-8?B?TG9SdWtTbXBGZ0RQNDdHUmJGa05VN1lOdDBYVS9URkZhQmNIM05nNHZ2OUNV?=
 =?utf-8?B?RFpxc1hMTHdiRXhTOWpwL3hURUFtSUNJNE1BSmhET0h2MUkxZjJaOGd0ZFFs?=
 =?utf-8?B?bC8yUVAzeWI3RUpCdDVSL1JDcXBLWHRsN21FMWJxVHYxT3BpQUcrTG1zMFlu?=
 =?utf-8?B?Vm1YMWRQSUxlZTVDUlNGck9oNXkwaXM5KzhYckhBb2JBRlFzODdVeVczT1Vs?=
 =?utf-8?B?ZUJTWnRIMTBmWWhVOGVzcWpUUXRXZEF0Z01CT1ZLNjFXVFloamZqMUJmL3g3?=
 =?utf-8?B?U0U1MTR2UHloTmlSTlFuY0RqTytqUmpETWZDdW91YVBOMHVQaUs3ZkthM0hz?=
 =?utf-8?B?NTRKbklCNnZWV1pjOGpFTnVUdVRIS0xuZEVNL3BzWWdKVnh3U0llU3lDcWs3?=
 =?utf-8?Q?tLOXJPx2uKO0MY5eR8C2p3DV/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30ffa2df-fb41-4e23-0b67-08de185d3f1b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 09:09:50.8298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FV2oA3hypskXXWOILSbRvhLqz3cuJx4Fpmr/dtjofb/QaizwZmkXZ1aeR+fOcoXnhj3V3JzEfXN0iJ2eLhUTSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8093

There is no user of enum imx_rproc_method after moved to ops based
method. Remove it.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
index 6a7359f05178a937d02b027fe4166319068bd65c..1b2d9f4d6d19dcdc215be97f7e2ab3488281916a 100644
--- a/drivers/remoteproc/imx_rproc.h
+++ b/drivers/remoteproc/imx_rproc.h
@@ -15,13 +15,6 @@ struct imx_rproc_att {
 	int flags;
 };
 
-/* Remote core start/stop method */
-enum imx_rproc_method {
-	IMX_RPROC_NONE,
-	/* Through ARM SMCCC */
-	IMX_RPROC_SMC,
-};
-
 /* dcfg flags */
 #define IMX_RPROC_NEED_SYSTEM_OFF	BIT(0)
 #define IMX_RPROC_NEED_CLKS		BIT(1)
@@ -42,7 +35,6 @@ struct imx_rproc_dcfg {
 	u32				gpr_wait;
 	const struct imx_rproc_att	*att;
 	size_t				att_size;
-	enum imx_rproc_method		method;
 	u32				flags;
 	const struct imx_rproc_plat_ops	*ops;
 };

-- 
2.37.1

