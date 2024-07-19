Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013000.outbound.protection.outlook.com [52.101.67.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D00C82485;
	Fri, 19 Jul 2024 08:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721377659; cv=fail; b=BOnlXpG2lb6EETQVau6OWzgyfVFrCPfzkTPeTQHv3l9O85Tmgvb9lxZLFz2TJbTtlFHZ+hcr0o/Rwmq7VAmCYjrGq5j7rRSdLltcNW45cNBGLv2pU3U7yoFrQgdI7UDqFRSnV62Tmhn3gpKmJLMHwJIJU5BZ8/zFp97cW1Gp7M4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721377659; c=relaxed/simple;
	bh=jZVnl9XcBHalZXnzqQCsSUORoLgsgpRkBxF+3FisBJk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=MgQkwsd6Wb2wph37lKq+lHhM5w7C28wioPfqgqzGaTs6gqcwbaArQWeK/mSq/E0Cl0jOIHeGiNFeBdAGZ78keMY3Vfwydq6pRP0KuJgp1kNkObF3JUKBudz1SRv8SYf2j/3YgEWWmPnkQDBj3CEbykKmZ5UI3UYIUvnVibd0m1Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=i6MkVP5J; arc=fail smtp.client-ip=52.101.67.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="i6MkVP5J"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pjaVYGTpr1oZQ7H9jDTTpUAgFdVuQyrzoFQQ32BIjPigSdqXGZHTVcxnzDJ/oJdsWUplxpg0/N5qV/ZOsIP2+1O37xQn9zNaauh8KdCMyA/JRVHG949yx45GuB82DuVtTSnPX26cLrMFlLphLsO2lzfz7zXLvakTuuAh90gVcJWG5qHfgel88RV6uY+gW38euTNTy/ijh/zTlFKiOhXsEOM+orB1yU28YrcOhONa4sonjf9sAtNguAumDsyUEQuQcSemAM9bcFZvmxlcoODQJNyYSUkz5XmVqaF276kbXV9cbD9HdxCcoPpdGFDO08LHEaxoIWWJKtAdGCSoO8ypOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yluKM98VRAVJ1KqisBOblnpoZWZRa7/8SY5GxFgqCKg=;
 b=V+DuR7mIOeK7ZbmVxkWWHj1fArgXrzHuXxjZtEcnvyMhlHt4JKlYgmkJhxzjPiHVLywPlhh1HkKmRSYo8VX/N+3Kr4v+VyB92vhUJhLYR52KzhQ6Qct9QDfILinUcthA83o+SjluzLE3eS27MIMHfSuQ3YWHJDQPjWEc7cpop3FcIqGff5ggGrwTVqSNhcL57+66B+4AbSLztwOsM3tcfh0iqefPr/TSsblKtTQjFFAUbGyCOWO7JnpmFQIrLYtihsq6KvSCJEzMPN99lO8lyalGCGTC9bu0jvu1UibLYyFbox8F/fePXzMU5OEY4cnPzGdKgL6difgBIzCL+7aC6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yluKM98VRAVJ1KqisBOblnpoZWZRa7/8SY5GxFgqCKg=;
 b=i6MkVP5JkLO7YXBSMBFHtDw1U1CRPxhTTO/IDh5NpRwvT5A+z7eIvEgaqRfDWScscLV9s4JZn+6FJf10tuN+fDKsUxO6osNZckInvH3jvKh0332maWSTE6oQQ6a3vRAgQ32pZF706sP+/6/DY2WqDt0DwiFuDH/Jz3wp4wfIe6Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA4PR04MB7904.eurprd04.prod.outlook.com (2603:10a6:102:c3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Fri, 19 Jul
 2024 08:27:34 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.7762.020; Fri, 19 Jul 2024
 08:27:34 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 19 Jul 2024 16:36:14 +0800
Subject: [PATCH v2 4/4] remoteproc: imx_rproc: merge TCML/U
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240719-imx_rproc-v2-4-10d0268c7eb1@nxp.com>
References: <20240719-imx_rproc-v2-0-10d0268c7eb1@nxp.com>
In-Reply-To: <20240719-imx_rproc-v2-0-10d0268c7eb1@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Iuliana Prodan <iuliana.prodan@nxp.com>, Marek Vasut <marex@denx.de>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721378185; l=2145;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=FUNk7E9jxQGO19ko7cs2/p1SFUwFfbbIwFiGTwmT20I=;
 b=72pClawQzESXbycoJ0e7X6Ge9oMG3iupyx+26BBT+nht2NWSpPb4K+LhkfGSiRZeHOkgEZxmY
 R19s/s9ATkPArvq9kv9UkY8sSMYFK8BMQ0LSuAEHsp2gRB2BIqpD+iX
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR06CA0232.apcprd06.prod.outlook.com
 (2603:1096:4:ac::16) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA4PR04MB7904:EE_
X-MS-Office365-Filtering-Correlation-Id: b7d7dcec-779b-4ece-52cd-08dca7cca3c1
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dkM4aW15UHRSVStBbExVV0kxdVNsUWtxMzd6T3lpZEVwNWFzMDFGQWJxRWpU?=
 =?utf-8?B?QU0yVzdxZjFqLzFWRFNwQzVtd3ZKODBENzBZd2Q1TGRYUDhlZW1kaHVvTG4x?=
 =?utf-8?B?TXdHanlNaG5aQlpkRUh5YnRPcW92SUZ3QkZ6VHJSY2o3SG1FdUVzT2hVaVpU?=
 =?utf-8?B?QWZFV0VKMjZCd1NFa3Y3Nm1iNW9EeTdwQjdIazRHaFNFanVCQkZRbG5JTGp2?=
 =?utf-8?B?VXJpbGRTWis5TlIrVWZ0b24xTHAyem9nVzcyMUxtR1hNRGpCNlpUNWZaMTVQ?=
 =?utf-8?B?US9kVkxJUGQxZWdXWUlMMDhsSjJLSTYwVmY5bUdjb0dxTEhaQzVyUkdqOE44?=
 =?utf-8?B?bVpCUzFMcWViUUhMQnZlU3AzdzJjK0lkZzNyRXA0dHFhNFdrRXY1dm9IS2pj?=
 =?utf-8?B?eXRkKzhGOXpWVm14c08wUWdXN3lSSmdlckVBdzhVWVNTa01sRTdFSC9IQUZh?=
 =?utf-8?B?dzBDV0dmQUphbzNDOXhhbDhhU3lhRERhM2ZyZUlNR08zdWN2WnVPK3VIZi9Q?=
 =?utf-8?B?L09rdG1McC9uOVZ0S0RrTnhHUVFvZnI4QnVjNHR0aU82ZlFjVTRZY1VnaThT?=
 =?utf-8?B?Q1RoazFDcUEzSFFRSGtqa0QzYmpsVFZZdFZueGYyQlUxY0liRENJVXR1VEN1?=
 =?utf-8?B?YlNIWjdScEFSKzA0Qk0zK09RZzRBd3VocEphZER2dk5ScFBWOTNFdnFxN3Z6?=
 =?utf-8?B?YzhRV2NDSWtQclJCenl1N0tZTVJYMGozWkRndkpIK3d3eVE4RldERks5T1l1?=
 =?utf-8?B?bExKaEFxMytPamNCQ1FPQ0NzRkFUWUU2TkZ1cVhqYXF6ZXJSUlBlaVI1NHRY?=
 =?utf-8?B?NFBpeHlBclA1V2pmU3MvZjVJV2phTXF2SjdDdVQya25BWG5FUXdjakVpRDBp?=
 =?utf-8?B?RDN1MUZBb2xpemM2UXIyd2crT0h0b1ZwamxzUkJoYXRnLzRWZWRKVnNrMW52?=
 =?utf-8?B?UXI4SElRR0huRmg1RkZCcHN1T1ExRUZjdExYbGlRRjVJTnNhM2VYUkR2ajFl?=
 =?utf-8?B?MWJ0SnQ3RjRvRlJudDJxVGljK0N0VmVNS1pWN0xRb2VaUzE4SWFKb1R4dVBC?=
 =?utf-8?B?ZFpqdkc4TGFRVmdJcXEza3dFVFU1dWw5VWI3NklGSVlQSCtwaGlPaDRBZUxj?=
 =?utf-8?B?bGNHc2FsVVBRQ3BNZEl6SWtGMThva1BXcVhPZXA5L1k1WG1GbjhrTnB6eVM1?=
 =?utf-8?B?M2dzYU1HMUY2TjNmbTgvb3ZFV3pGYUVwYVhiN2JHeEx3QVMzOGRkQlJhby9y?=
 =?utf-8?B?QmdwMWw1bjYxNmR3eXhBanF3UXlOa0ExamQzdVJpSnV5WUQ5S3N4RlJ2V045?=
 =?utf-8?B?eVdXeU5TZDMxZkRhTXVFOFRXRnZpL1h3R0kwT2xVVUEyamxtc0NLd01hRXBO?=
 =?utf-8?B?Qm14VkJtdDk4R0lBajhoQkl1eTNHNnNxMHlYTVJFMGd3QzloWGh3M21LUEwy?=
 =?utf-8?B?MStEbXB4NkdzQUVDQmpYbTJjVWwwK3RLV3g1WGxyOExhWktKeFd6aStPem9Z?=
 =?utf-8?B?dVAxQ2U1K1hNcVVDNUtjSlN2YkQ0QkRNamtRTHZQUDN1bVF5VDFkSytXejND?=
 =?utf-8?B?a0phbkp2KzloRzlBMDZYdS9oeTF6clZNc2VQaDRpSURzUm5oQ2hBS21rS2xC?=
 =?utf-8?B?TC8wR2xiemJ6K29Gb2ZmUkc4SFdzaUJoQmI4T0FWL1pjN1ZLWDRoWCtpYmd2?=
 =?utf-8?B?WWlqcHJyUmM4YnI1Rms4dmtjaXFPemhnKzJRZnphUGZFYndLeHFCV1lBcWtN?=
 =?utf-8?B?Sng2NGtIR1ROZHlndWFiN0J2NDIwd2g1N0lmTTVDdzN6QWR0M2o5c21NbFla?=
 =?utf-8?B?aERGNXJsZW5tMHB2MC9LemFlWXlLYnZkajI2ejRqM1Mza2pOMmM5ZzVJYVli?=
 =?utf-8?B?Wk9PdXNsRjZzNmVKOCtqN2xNaWpyZUFHMyt1UVlLamo0WGc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?LzVhdmhpZFNZdGRFeG1iNFdleGxSMFJFUlVSMXhMSUZSTkxmSGJiQlBRS0Uw?=
 =?utf-8?B?eWxpdFk0RlhBYzU1Wkk3TGZna0VxVFBncW0zNUVzZlJHZWFUMVJJSENKdm1j?=
 =?utf-8?B?Vmk2WnpuL3k3czk0bi9Id3dJSUEzcEJKR3ZXRmZIUmdwUUY1SHhydXFsSHV0?=
 =?utf-8?B?ZHlRT09ZZUxrQjZGMXlKUTVycy9rZVlGZHdPT3VqOXBHNVhvNTQxMEdRNEQv?=
 =?utf-8?B?LytwYWdXYkl0clVzZnZHNlhKWGh1ZGtzZHRFU3hPVHZiV0Q5WFRkSTZ3bjRU?=
 =?utf-8?B?OUVNY0JSaTZvRFJEVU5mTkNMNXY0NXBTYW1QUDA0L2NFbzBzZmR3aFpjYXQw?=
 =?utf-8?B?cklndW9FbXhWdGRZeDR0MHVweFA1eEdQQlVxeUkwWjhXN0FleHFJWE84RVJN?=
 =?utf-8?B?SHdEbGVQUWE4OHJMWHpKaTZSdHBwNUY1aEVqRHErUk9WSS80SVp3aWxnOUU3?=
 =?utf-8?B?OHVJL2NabVliSmhhSTNSYWFpbHpKU2VCYmdTMllJMm9peHVlL2xuaDdqb3Rm?=
 =?utf-8?B?MjQ4SjdMRVhML0hmTzdHRDk4eVA4WjNkMFVsSUpHay9vUjY1QytraWgrNTA3?=
 =?utf-8?B?dFBRZngwNXpxY0FvQ3dIRG9WL3hFcHhjc09TT2RCbStmY0xxVFV1S2Nxa2NY?=
 =?utf-8?B?WVpQMTVUc250T01MNFZzTHpiVmVsWUZwM0FiQVA1eHkycUozNThzd0pTMzFs?=
 =?utf-8?B?WHk2akFQT00vOGtuS1R4QjRyTlRHTmt5Qk10ZVI5RjdXMXV4eGo1ZU1sU2ta?=
 =?utf-8?B?QVQrOGVJNGVRMno5R255SWhlWnViS0JJSU5sN1BYb2x2a2g2dkFzVlRWQTFv?=
 =?utf-8?B?a1pYNUNodnI3SVYrSzcxNWxKWmVjMWNMbFFvRTkxY01CZFJ6T0NVV3B0R3M5?=
 =?utf-8?B?bXFQNTRSbzhneTNKM0hUR0krc0V5N281bWd6WDlRS29YOWxQUFBNWmR5QjZZ?=
 =?utf-8?B?VitJWjVhaGJCZjZrWEtkZnhMNG8xZDNCYWptam42Q3V6dmVYZnpXRDA4MjNi?=
 =?utf-8?B?MC9ReTNmTUNQTXdkNEVVOUtjQjgzMXB1ekk3ZHRXZ1UxdllvMUJqUmptQ2Yr?=
 =?utf-8?B?MG9nRVpOcFl1UkFoQVpuK3l5d0VrSjgvWi92VTl6ZmhIdy9ZOWxGWXhRczRT?=
 =?utf-8?B?Y0Z4OXpsa3pEMGNldzdWRTh5SFV0TXBqa0R2Rkc0T3FOdWRDNzNFOXFISW9K?=
 =?utf-8?B?MkRBb3h2TlR1aGVEczJ6ZktNSzNrLzUzVjFtL08rRVZPT1BuMTY2ZEFsaExl?=
 =?utf-8?B?SWpJNDYrYjVlVDNIckhBZHA2Q1R1dUdWSkE4OFlzWm5NSTZJSU5Va3ZablZY?=
 =?utf-8?B?V09oRUNQMittRStFR0JLaElSOEVSUzFjRE1TVG0zUTlDa1NFNGUwV2QyTGVZ?=
 =?utf-8?B?VjhFc1JLTzltZ3hMV0JEV1JiYXlYMWRhMnJ0cDZnTENNbXNNNy9OSE4vQUxD?=
 =?utf-8?B?QkVMQmNxM3IxdDV5SmFac1NOR3BrWGpPa0pMMGZOdUdkVlV0WkVjN2s3RGpY?=
 =?utf-8?B?UXNrdjd1U3MyUXVMK2hSbWl1Vlk4dlpOSi9mZko2czhqMjF3dHhvTTBiclVJ?=
 =?utf-8?B?RE9JdTN0czJBUWxUaUg5K1RsODhXa1duUnVhUlhtT3hHSkkvN2EvWmk5QkZ2?=
 =?utf-8?B?L1p4blFrMzFqdkZFZG9PQjdWNXIrR2wxSFdQbnpRVnFka2hhSldyWTY0ODlK?=
 =?utf-8?B?VmFlaWcyZktMVmN4K25CcGpleHA3VGQyVnZIT2t4disxaUhXd1NtVGF4Nlg0?=
 =?utf-8?B?Sk9rUSsrUVVqb0IxV0VPL2R4eUxyeTgvTWtSeFZsRWhjclFtMmlSdTBNYVUr?=
 =?utf-8?B?eEdpQ1pKcFJEVEMxMU51TkQ3VXVOMXMxSDdmRm5neDhhOTh3dllSNHIxZzBR?=
 =?utf-8?B?TERQWGdtY1dBUlJRdmJNVnRwcVhFblVrT29JWEFSQkZiSXY3aFduVnM2N2Nn?=
 =?utf-8?B?ZXNWT1hCbm1QRk9QVUovRHprdmJJZjMxeW9MZmhNMGlrSEw1KzJha2lNamY2?=
 =?utf-8?B?NTZQaW5vZUdBc3oyNWVFaTFVVzZzdWxtTWZERDQ4Rkc1eTJtUC92WVdBUUsv?=
 =?utf-8?B?a2tVVVJ6VnVJb0hFcFErRHpiMzF6cHZsaEVNd25LRW9nR1MrUGdtamhOa2Ex?=
 =?utf-8?Q?du2iFE28MPMVy83pa5dWBhjn6?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7d7dcec-779b-4ece-52cd-08dca7cca3c1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 08:27:34.3035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V/nK4MZD/zHmUtwrdrrU3HxD2IakgV844NeMrcCWWtkhIJ326GyP237GMZPRJqIsTkv9h5/94ljMO+XkBDldtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7904

From: Peng Fan <peng.fan@nxp.com>

Merge contiguous TCML/U regions into one to avoid load elf files which
has large sections failure.

Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 9e99bb27c033..552fccebf7e2 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -119,20 +119,16 @@ struct imx_rproc {
 static const struct imx_rproc_att imx_rproc_att_imx93[] = {
 	/* dev addr , sys addr  , size	    , flags */
 	/* TCM CODE NON-SECURE */
-	{ 0x0FFC0000, 0x201C0000, 0x00020000, ATT_OWN | ATT_IOMEM },
-	{ 0x0FFE0000, 0x201E0000, 0x00020000, ATT_OWN | ATT_IOMEM },
+	{ 0x0FFC0000, 0x201C0000, 0x00040000, ATT_OWN | ATT_IOMEM },
 
 	/* TCM CODE SECURE */
-	{ 0x1FFC0000, 0x201C0000, 0x00020000, ATT_OWN | ATT_IOMEM },
-	{ 0x1FFE0000, 0x201E0000, 0x00020000, ATT_OWN | ATT_IOMEM },
+	{ 0x1FFC0000, 0x201C0000, 0x00040000, ATT_OWN | ATT_IOMEM },
 
 	/* TCM SYS NON-SECURE*/
-	{ 0x20000000, 0x20200000, 0x00020000, ATT_OWN | ATT_IOMEM },
-	{ 0x20020000, 0x20220000, 0x00020000, ATT_OWN | ATT_IOMEM },
+	{ 0x20000000, 0x20200000, 0x00040000, ATT_OWN | ATT_IOMEM },
 
 	/* TCM SYS SECURE*/
-	{ 0x30000000, 0x20200000, 0x00020000, ATT_OWN | ATT_IOMEM },
-	{ 0x30020000, 0x20220000, 0x00020000, ATT_OWN | ATT_IOMEM },
+	{ 0x30000000, 0x20200000, 0x00040000, ATT_OWN | ATT_IOMEM },
 
 	/* DDR */
 	{ 0x80000000, 0x80000000, 0x10000000, 0 },
@@ -211,10 +207,8 @@ static const struct imx_rproc_att imx_rproc_att_imx8mq[] = {
 	{ 0x08000000, 0x08000000, 0x08000000, 0 },
 	/* DDR (Code) - alias */
 	{ 0x10000000, 0x40000000, 0x0FFE0000, 0 },
-	/* TCML */
-	{ 0x1FFE0000, 0x007E0000, 0x00020000, ATT_OWN  | ATT_IOMEM},
-	/* TCMU */
-	{ 0x20000000, 0x00800000, 0x00020000, ATT_OWN  | ATT_IOMEM},
+	/* TCML/U */
+	{ 0x1FFE0000, 0x007E0000, 0x00040000, ATT_OWN  | ATT_IOMEM},
 	/* OCRAM_S */
 	{ 0x20180000, 0x00180000, 0x00008000, ATT_OWN },
 	/* OCRAM */

-- 
2.37.1

