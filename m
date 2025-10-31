Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013017.outbound.protection.outlook.com [40.107.162.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93325279DB6;
	Fri, 31 Oct 2025 02:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761877547; cv=fail; b=rpkb+IsOnE+VtSm6rSu3jxSIuxOheropPyiXH8+FwAOBshg3W79VQnhhCo4haLTgfdw4LMwmzKXAZBb2O9gRd6nCKU9v4teokn7pyaoLIN6sKcC2NQgacTeOspLMbBPZTUYxfmr9lp2RKsv/pYgGLiyUkmNPxygaF/djOeFTcjo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761877547; c=relaxed/simple;
	bh=dATJX3UjxDLtXdi+9lp39FJJAwxsoA5mrWPWqIKZkTo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=c9MXLQgchv13PjKv515UBKM7MepTE8Ajc24Dtydj+75tgaJ0DCLUhWNnWNyDGzd4FhBq28M7Ywe04/NPhdUeXQYNyaxP7bYeuGWBaomZERAqHTP3xNmyDHgqpoy4FHivLSoUm8kaJSgXZh7hIj9uRrvlKtSNMZsONINL4nZ3Jrs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=h+zKD3JQ; arc=fail smtp.client-ip=40.107.162.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="h+zKD3JQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gp8iqAe9LuXOan05d303p6y0tZzGlk3XeqiE3KSprpyr6jpxUefRS8oVSEGjizbU7TZs4ATCpzwTEfPPj0+MV/RU6UA1p/r5OyfUMDl9IHwD9ffuh2Rc8Ow93ZV6Wea9TdZxIVU7o6X2FAV9hLQarm4zafgRQFb9ZQbL7HMOZDXSw2pfchcXoFshkt8N/ZlntiXqoj8BfwEPhv7Uya8SOdMzUg+AO+LV1dYG1cISohUGf2w969qt2HVa+QAwXIHrKfVjh6Bb6an4+/N0zNfRPVMVU4qnXe6es0huQ2PNaWsM/wvQf1arp1TpF0ed6k416W5QWKPRHh7fUPku5HpptA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nkkVgaizvL2DgPszKKxwygCkFOY+Zr5oEZY/F8E2eHc=;
 b=mwWAzkbdC7TSCgoS+Z5vfk/mDmkFoNPmjhTPhsjYaxM5miIHaQ6ePO5WPigSUQg+AZAZ1x27fsMN0qqUbsjNo+Fqv9X1/1nK70ZwiNnJIZB3LFYTkYTUdzMfWIWRzU1UjlwSY3wZptZH3UClXFMMTayYMZ/9GBUG8OG61/Cd2vHJ3LBa+TC0+nsfslRUvvMYN2kjzIO2f5u1z0HvfUEfjvPNAaTDd7PFwX45aBf3toYNNeOzSWztXpUuuQfgHj4yzHsEcqY2Byg/MRJA9iGe/ZsyYyp8dBRDHVf192NwB8HwH0viw5RK6xKmdd/NfR599H6Ql/HXwHyeF//sl2vfvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nkkVgaizvL2DgPszKKxwygCkFOY+Zr5oEZY/F8E2eHc=;
 b=h+zKD3JQgCaBqLZ85g7SWylMZ1Y8AZqW3A0KDQzjNe29zIyT1Zk0tZXzRvR8YYSooBuP9EDBBclYrccrYB9kUYNhcpdZ1X3LXd7uAW+skNiQc10eQbe+U2sg1ldbk/PMMVTtKEy5Ng/WDriI4mVL41DAJXn6u0Ne51IJYf9FMivHTOE5l96NIWWcrm6iDuNacTTN5gk/sz4ah2g1LzxjTNdkCj2GioRQ7YGPN9Bbr0jYxXlOrmPIsqxNXBDqAl426GjkY22I27RLL7le8RqVJ2wIsJtZ0Y0seUr7Et+q7trxmb9LRBjnlRCEMeqOqdtyOsrxuHy+hPK3M237IeOkeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA6PR04MB11952.eurprd04.prod.outlook.com (2603:10a6:102:51b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 02:25:43 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 02:25:43 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Fri, 31 Oct 2025 10:24:54 +0800
Subject: [PATCH v2 3/5] remoteproc: imx_rproc: Introduce prepare ops for
 imx_rproc_dcfg
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-imx95-rproc-2025-10-31-v2-3-758b2e547a55@nxp.com>
References: <20251031-imx95-rproc-2025-10-31-v2-0-758b2e547a55@nxp.com>
In-Reply-To: <20251031-imx95-rproc-2025-10-31-v2-0-758b2e547a55@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Frank Li <frank.li@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761877517; l=1387;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=dATJX3UjxDLtXdi+9lp39FJJAwxsoA5mrWPWqIKZkTo=;
 b=8HoC5jr+7D17YvgFACVmfAxdE0V2z/enSnu5xmQQeclfqH71fYrOUZ/4rHAU0PU7CtwvzVuid
 sIqi1um3K1ZAS4xwOi2loIwTy9dlqRvoFkszZygpdFcsFC57Pchgmp6
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR01CA0155.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::35) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA6PR04MB11952:EE_
X-MS-Office365-Filtering-Correlation-Id: 0988f1a2-2f40-469a-84b1-08de1824ca8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c2crdFBHQlJTRXF2LzNIR3NKdWZ2cDlOazV4ZVMxOGlPR2hwQkZ5UkVTeE1L?=
 =?utf-8?B?R0tJWmduc2FBR3NvYnZDUUV1VkE5Qk1MKzczcXRRdTNMRlJiWnBQREZPdzFZ?=
 =?utf-8?B?Q1cxR1Mrb0d3WTFrb1F1ZXRMV1JQUFJuWnZqK1dOYlFCZEJYUWNJajBoRkJE?=
 =?utf-8?B?dXdtMmVNcTh6d3YwV0VZbWNVVmFKY3hKRjZaK0pUMkN4aWNnNEJzakdnekhi?=
 =?utf-8?B?MzRZT0MzN2Npc3hieFRtbk5qV0hLU25zbTB4OUNMcGJPalRkWllrZ1hrWVVK?=
 =?utf-8?B?MTA2ekdpVmRNWUZNczVjOVdJTDErU0ZCRVAxRy9hckN0aFBrUkFGWGJ1dEpE?=
 =?utf-8?B?dlZNQ3VjWGtwMmg2dVl4WTFnSS8zSlg4UWZOdkpCNGtuTGNFM1hOOTJESm5W?=
 =?utf-8?B?NiswRGVNbm13U0VvTUt4Qkd2R2YxaWhERG9aSXBiWURTdnFKcXUrZUVnNGhZ?=
 =?utf-8?B?cjhaZzl5b081M1VoclJUc1Y0RlpSMkxKUDhHUXVyKzZxenJvVFRxNzdHSHdk?=
 =?utf-8?B?TzlvU1BUVCtUZStaSHhzQ3J5WCtvNDhwS29MTDhxTGNvb3FrR29Yd29ZTUZI?=
 =?utf-8?B?TkdqczNBVVFyL29yRHVGQ1BibzM0MzZWLzdxMjR2Mk5UYXovck5XQnJDa3VC?=
 =?utf-8?B?eWlOcXN2eFBCdkk4c0tvMkR0NmY4N1ZycXgrOXQxWFRQTFBUN2lUVVFuSHN6?=
 =?utf-8?B?T2NQcDRpWjZGbFJzc1ovWE0vazdZYnZ0V2NqV1lnaHFEODk5NERPdWp3UTdU?=
 =?utf-8?B?ZEdBeUxTcWU3Si9sb0M1dTQyazRkM2tIemFFNnRXM08rL3dZRFBET3VXQkZs?=
 =?utf-8?B?ZXpCbHZDZngyTGRPQ0krdm1lV05Ndnl3a0gzMWd1SjJ3ODZWQ0V5QWE4cnhr?=
 =?utf-8?B?Z0JSWXRvTDRCandwdTlRekdTcVNuazUyU2dHVHYyeFIxV0lxMWgvS3B5TU1F?=
 =?utf-8?B?enBDS2JiV3Izd0cxMnQyOGxKRFhFcitpdEQvL2JGWmxseDNQQ1d5Yk1UZ0VH?=
 =?utf-8?B?cllTa2t6OE9Zb3U5aEFMa0E0M2VUZXFEWXo2NjFFejZqemtqc01PMStmL213?=
 =?utf-8?B?MjcrRWF0V2dqZDU4Tm5nalNWZFFtcVR1YU9LNUwxRXFDWUlmb3A5TUx0UmtU?=
 =?utf-8?B?MjRGQTVDRXptdVUzS0VFajc4ZThrQ3NIRjE2SkVSWm5nUW0rMWdld3pBTldk?=
 =?utf-8?B?RjBkQ0hlblo3MDQxenpxNlVHTGd6RGpEdFNnZW05ZUdHcXhHUFVLN3NzbTI1?=
 =?utf-8?B?RXorQ0NhNnZsZlZ1QVBWeFY3UFZDamVEWXpjNkZqQUFsejlZek1GaEpGUExo?=
 =?utf-8?B?MTZ3bkk5YUIvYnM4ZFpUbXFxNDVrVWRxeHROSHFYVkJFTnAxUlFVakt0cHpP?=
 =?utf-8?B?Um1ZZEVjbE5UR3pJcjlDVmxMME1Sdm1iQkphbjlXelprYVNKM0VDYTFZYVFM?=
 =?utf-8?B?STlNVjVzMzkzTE5DbGpEUi93b010c0hNcCtWekdOTm1xeXV2Zm53UTZlTTB3?=
 =?utf-8?B?cyt2a1laNDAyTnp6WU5yck9mMzJsZnk5aVA4ejlFL2MvZVVQM2s3WU56aDJX?=
 =?utf-8?B?VnZPNTBSYXdDWlk1OTl2OGdoTWFpMGU5b3dObXo4TVlMbDlSeFg5aUNkWTVz?=
 =?utf-8?B?OXhxZkxmWjNqN0tnRFYxb0c0Y2ZkdWpEek9tMzl2Z0llMVBMRElpdzdhZ2Vn?=
 =?utf-8?B?ZUpiODJyakRoQ0YxUnd4Q0l6QVhTelZhTjRuR1R0MVNxakNwWkxGUTh2d0Vn?=
 =?utf-8?B?dTRiV2hhOFJCR05hcnlGbG1uYksrMU5tY0x3d1RBQUtpaUUzU09QNWRNOXd0?=
 =?utf-8?B?UDFNNUhmQW9oU1ZXb05oVGpaK2lWTlZwWFNFZVFKbkNtVytlREFwZW1GMjRi?=
 =?utf-8?B?bmUrNWRYbHk5c3d6aVhVSTlYNm54QWlZa2s3Zm9DT0RZU0JNZDdmZHNYTlgr?=
 =?utf-8?B?SnRqd3ZFWTlOK0taRWkrTkNZUElyRHd1QTJtc2Nud1Z4cXlkVHFlcklDcmNX?=
 =?utf-8?B?Rk4yckNvWlo1ZWdZWnRQekpEVXZ6NnNnTGhWT1lWRm5xZWtUTG1BSmdjcXlp?=
 =?utf-8?B?eXRIbTlTSnU1ekxKSTlUSUJuWXVVNXdiZmJGZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TjBrcCsrYVp4TExKVGwwUGs2My9Gc3lFdnJsdmhUaVpaMmtxdlVrTFRSWTZ1?=
 =?utf-8?B?SXh1YXlVVTJCeU1mcnBab1ZJeHZQVnlON2lvTnprMkgxQjRLK2I4UnVlWHd6?=
 =?utf-8?B?TktRRFc4d3Zia0xMYnlpUG9rTm4zMzBtek5MS2wrdjlxdE4vL0lFSkFNUHov?=
 =?utf-8?B?bzQrZDdkWUphMFY0TENkYWh6Y1E2NTNJek9YUXFLOFd2bnNwc0xpZEtEVFc2?=
 =?utf-8?B?QjZreERTNmZQS1R0b2FRVzVtWlgyUWZsM0lSZU9TWW1CdHhhQmdROTZrTllY?=
 =?utf-8?B?V25oOEEvRTloTXU4emJvbUVtajNXVFNxNzV3VWQvaFhaTG51Z2tyM2s1YzFo?=
 =?utf-8?B?dEprVGErTUpmS0w4RUFNN2lhTHFpRjdWS0hVVFZwQ1hzSjBRd2RmaTBxdW9k?=
 =?utf-8?B?Q3VHZ2xWOUlFSG13Q3hSMm9JNGpONEwrYWMzaEZLUGtEZHdmaW4yNHYxMWls?=
 =?utf-8?B?MjYxa3VRMlJUTm4rU3ZYT0QwYzJ4d2JUTENxQWpjSThLWHUyLyszTGtPdCto?=
 =?utf-8?B?M0Naeksyd3VhVWxOZHFLTm1nVGlqbWR1S2ZLaTlZVmV1Rms1dURVMmxtWnhU?=
 =?utf-8?B?K0pST1FpZEk4Q04ydkRoU0d5UjBsOHRoNERvUkpMbWN0VmM2Uisrb3dKYkZR?=
 =?utf-8?B?Z0VINXJNdVRvSWdGQWJlb2ZYM2x2UDR6dTRQZm0yZGdFQXZPQUZQUWxwQ1V3?=
 =?utf-8?B?NFdVNHBTOTNDUUFOUGhGT1g3YmhrK1dyRHllcGlkUE9MeVRuQ1B0L29uTVBC?=
 =?utf-8?B?Tnc5TDJzNFhXTDZnUUI3VkNsdzg5M3ZFNjlPc1ZhQ1RyVFY4OTB4bzAvQ2xP?=
 =?utf-8?B?ZFZCNHYrUE9sVnpsUnJIVnVubXBPd1RRbndsNklGUFMxbzV0a2xnZUxQQVRW?=
 =?utf-8?B?MjNXWUo5a1BGQnJWN2orUkpqTXZFcENBY3RjN0NDQU9WdTlqV3RNa05raHRQ?=
 =?utf-8?B?R05VSDFQZzBaS3NLeVhWVlZrZGZCVFpIL0Zya0FWUVU2QVVtWmkyQ3Jzam9B?=
 =?utf-8?B?L1pMSzlPL1B6a3VDdW5YeHdCMzgwTVE5M1pub3M2S1ZOb3NXdHVKcmYyUnhH?=
 =?utf-8?B?alRBRXlJNVpWNFVrS1ZES3diQmp2YjlQSXRnbS9nQ1VvK3RGQU5wUGpDU3hx?=
 =?utf-8?B?RTNiQ1lpbUY2TjFodG1DMTV5U2hhNS9mVU9IQTI1azZFTk5naWQzVFhaQzJO?=
 =?utf-8?B?ZTkwMGhiT1lXT3JTZHRzUXlHaUMyRWRUM0UweFlXbEpBQXRKc3VMQURVWTRz?=
 =?utf-8?B?dGtaR2tzTkZJUUlLY3NURTlRQUx0Z1pWeU9aZG5ocDhvcUxoRm4yS20vN09D?=
 =?utf-8?B?OUxaVUtNZG11Wm5md0ZIbzR4Yy9SV3hYN1dRQTZZOEp1MjhFK29NNUhUZHZZ?=
 =?utf-8?B?UDc1dmtNTWZjdUN0eDBIRFRnazJYcU8xSG1JbTViUjRTVzIyS1NENjU0Ykti?=
 =?utf-8?B?azU0L3lJOGpBU2FYbmR1dE0wcUV3Wk5yYjg1NkdHaHpUYWEyVEwxMkU4blUy?=
 =?utf-8?B?SG9zTzJhdGk1alAxZThINU92YkFFSjN6a2x3Tmp5VnppSTBSNkgyU0xPR1dR?=
 =?utf-8?B?SENyNFl4TllLaWhidFlVMHR4bzN5NFVRWWpOcU43OVhCUWovaGs2OEZNRnZi?=
 =?utf-8?B?QndzSmIwYzVEckRpMU9NdEFNbk1PaWpLZDJmY202VUZTKzZDaktma3JDVkgr?=
 =?utf-8?B?Q2k4SVkzbi9XTkVIQlVWSUtPcElmRVBucVl5aHFjTWNtMTFGZDZySG1Bamtx?=
 =?utf-8?B?a3RVMy82ZUQySW9mMlRaTFhwSGlLWFZJYXI3QXViY1NLSVFTb3pIQVMzNmVp?=
 =?utf-8?B?TUtKMjdQWVJwcTk2UkJFbkM0QVg3dlB0SmEyUUJvKzRjbTB2VVZ4V2tYWVNl?=
 =?utf-8?B?TzdGdVhZRGZxUzFpbGVHWldLVjFtR2FnVEdJVHIxS3F4UUVhY2JmUysvdFZX?=
 =?utf-8?B?bG0wOWp2SXJLR3RacUJ6amYzNjk5QVdHY09Cb2VmVVJRY2tjY0pnZFE2bTRt?=
 =?utf-8?B?ODg0UDFLdkNSck8yYVdndHpIOHd5SHg2cTM0aWR4dmlRcGdQNkFFZFRJVnhi?=
 =?utf-8?B?UFUyQUpCQ21UZDUzamdaOFhPV2VSQXZUZmlPK2tCcVRaU2IxeEtycitNTkY0?=
 =?utf-8?Q?1ngf0skJKIouL3EGBw+BwuGgU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0988f1a2-2f40-469a-84b1-08de1824ca8b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 02:25:43.1275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1gXlVYY+dU/PtyoLy4+oZxkILmMC3ZN9Gxbmj0RwDj8g9pKM7+DH/sxeDnwE5jc40pFuH7JmlO7YeC+uWAzo1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11952

Allow each platform to provide its own prepare operations, preparing
for i.MX95 LMM and CPU ops support.

No functional changes.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 5 ++++-
 drivers/remoteproc/imx_rproc.h | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 82cb8c7866ccb79061c46068d2039f38feebbb3c..232eb91e0b5dc2432131b1c140d6688b073fea1d 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -532,7 +532,10 @@ static int imx_rproc_prepare(struct rproc *rproc)
 		rproc_add_carveout(rproc, mem);
 	}
 
-	return  0;
+	if (priv->ops && priv->ops->prepare)
+		return priv->ops->prepare(rproc);
+
+	return 0;
 }
 
 static int imx_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
index aeed08bdfb5619c7afd7201589f417cfd6745818..e4b9ede656506142b260aa7515823f489a168ba4 100644
--- a/drivers/remoteproc/imx_rproc.h
+++ b/drivers/remoteproc/imx_rproc.h
@@ -37,6 +37,7 @@ struct imx_rproc_plat_ops {
 	int (*stop)(struct rproc *rproc);
 	int (*detach)(struct rproc *rproc);
 	int (*detect_mode)(struct rproc *rproc);
+	int (*prepare)(struct rproc *rproc);
 };
 
 struct imx_rproc_dcfg {

-- 
2.37.1

