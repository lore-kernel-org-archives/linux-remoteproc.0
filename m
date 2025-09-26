Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013032.outbound.protection.outlook.com [40.107.162.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06102F60CC;
	Fri, 26 Sep 2025 12:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758890047; cv=fail; b=vGIztrAcyngnAY7QoN1A+ACEeXQyjTNqryvPB1kFwJ5uOXy2OJDhk18fpjHShcfzCQ1qq2hCAImaCy75jXbJ4tyhLSMZZONCA55r5g9AJgsNuKlS/6LyYcQZMuxsKUUb4L9ppWFlsiUHiCuXkYI1q7wbPRPBrMn1UQeImCAVoLo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758890047; c=relaxed/simple;
	bh=ThVM9QQ0Qk3OFoF3y+fb9ELiyROMhLoYGG+/CisjIVc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=FfAarT2To+3JRn41offwqW2z9bRx+QZGnx3w1RfIqpikqlFWYnF/DvRLzSaLsVjBAUuWbOGF8bp5fjyxYNii+DC9zERA/MZFJ9xhc/A890+lvgyl9DQGPYdNdrgvXt5N2QLtFDagci9EFnO+Gy0gVGYYrfsaKMt1wYT254idEVM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ZeFqTC1V; arc=fail smtp.client-ip=40.107.162.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZeFqTC1V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KJqK35l4QD3EAoHnJM77XVhpduwkHCvIMVhnf91Fyd0V3P9fARNpZp2g8dHPmxpEKDgVmW14Svg/BQWU6Gta5Y82qmfeTrEOmprq1351NxQO8ElUPN6Zx6nBoGbant/cBePku31J3fF6Z0lCEQCFkF1cgQIGwnBZfmmJl2wUZHQjWxjCbdT3mGmtjwIs2EDT6Phx63nhlVJzjfma6+RugLrdB/0wDtCsglzxRgdOUVewV00MpN6b1MlOavgJsFiI187VUvKAGwyT6X1nOq8Yg+hEZnbiaHXYaCGkYrpsTW5xUIoUJV+5XnlgHXY63onKadhdtvOpby8vguG3cP1Lpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OjjqCc4dXJ+KKSx4yMVaROt0kY/ipC4qW9omWUasLJA=;
 b=mmLiC6ntj+pICqRg8yRa36xHiq/UKfsyUT1zH+i9bhNEUTsF7YywJAk21V6IRWNRFcfLFJ/PSMyiqTOM+VfQLMdaUwt7aQuQhLYw0oTwyRNQWPOq+OPKYjCRbVeTmgiyzyobFCdCGlpYVLvEJbeZmXomef/+1o7h8+RhKGPQOquRVZyZiEwnQaalV10hiPNkOEVUamFP4pQsny8W9Aw4ImO7S9dWsTAqp3D9Px8gPc8z6K+WqL2em8Ovm8IxtaQKw6pBe8i4aJsXbB1YSY6NT4hlWUiansH5kC1Us0h6N2a698mlql+qIjRAzAQuBVLUwj6hQ4ABI+N3YSZU1qFxkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OjjqCc4dXJ+KKSx4yMVaROt0kY/ipC4qW9omWUasLJA=;
 b=ZeFqTC1VQ9NOmXQSUDzWrlxYduJ34IBl919GNsAnhhPW3s+Uo2FuGGGFwZck4K3+gflR4MYmIsiWB2TsucmRmMIy8uqaQhzv8gPNi8zc3n9rB5E23JOwqVi2DMU1ByQ4A47LqIq4CfKymL7LLX6PcOrMInUapfn66as3iCTiqc5kajbuCnc8Nio3ZrI2/l2/2INoGkj1mWUg8FMqStLlyKuHQ7fRdTvg6LQOmFfnbknr+mLPu4vDaDJ1AoSOmyJqxlsYxojlu/FbfgJBtEsmBtyHAcVVPNKELTERHunruH0E3ZJpgsv00eyLp7kXvqLy5b4oWSr0Yb0zyueUT5qOAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB9646.eurprd04.prod.outlook.com (2603:10a6:10:30a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.13; Fri, 26 Sep
 2025 12:34:03 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9160.010; Fri, 26 Sep 2025
 12:34:03 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Fri, 26 Sep 2025 20:33:19 +0800
Subject: [PATCH v3 5/6] remoteproc: imx_rproc: Use
 devm_add_action_or_reset() for scu cleanup
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250926-imx_rproc_v3-v3-5-4c0ec279cc5f@nxp.com>
References: <20250926-imx_rproc_v3-v3-0-4c0ec279cc5f@nxp.com>
In-Reply-To: <20250926-imx_rproc_v3-v3-0-4c0ec279cc5f@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Hiago De Franco <hiago.franco@toradex.com>, Frank Li <Frank.Li@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758890010; l=3930;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=ThVM9QQ0Qk3OFoF3y+fb9ELiyROMhLoYGG+/CisjIVc=;
 b=y2okUzfaLYR2XbAr8NyFCVZdIv3i5LKp/NPSnuePQptJHyMugr+KPzyx/dvekYngzbqBOSmde
 q0geQfpc+ZkClk0n9kWsMZI6si5vzqTeIP93Iyfcrsg4Cb1GEY75BY8
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR03CA0115.apcprd03.prod.outlook.com
 (2603:1096:4:91::19) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB9PR04MB9646:EE_
X-MS-Office365-Filtering-Correlation-Id: 439f5555-d915-4148-d257-08ddfcf8f95e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|52116014|7416014|376014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZVFZYS9BcDBoekJtZXM5NGFiWUZNODNrVkpKZmlncXJoT3lQZjF6Q1dodmZK?=
 =?utf-8?B?aDNIbjluRXZocHV6Q3lLN3hHNHRZeFhobi9XSlBRalB6NXlqeWNRaG5pSWhN?=
 =?utf-8?B?djVZV3JJREwwcGV4RGZHOFB1OFhSeXdzbjVOWFlOakU2RXZMU3ZPRWkxWlFE?=
 =?utf-8?B?M2NFbXZ4WFZ2S0NkdjlkR1ZHV1BiaWs3M0xYMm1VT0lCT0tGUktlVHVDTXh2?=
 =?utf-8?B?L3p0ZERobUVqNy9TWk93RXB3WkwvbDhyMFY1eUdJbUxRQUlRc3VOZ2Q2dElL?=
 =?utf-8?B?a2p6UHN5T2YxdEk2L0Y1U2ErMitoNDRaOXhIdFRnZEtrU0hnSXhVRzVsRW9Z?=
 =?utf-8?B?VVltd0ZsZXc4R0lYZEMvWjNYY3JycUltL280NWlXa3IwSldyVWx5WUMxWU9S?=
 =?utf-8?B?OHdjdHV1eDdjRHcwQTRvdnBRZjQrZnA4dkJ4eEhKRU1MdHhKalBuOWZVN2lQ?=
 =?utf-8?B?c0Rnbkk4U3JhVStVTHhzRVQreHMwSkpXUWZqRGtFcU5NajgyMDJNQTlPQzcx?=
 =?utf-8?B?cElJUGtESEZoMDUwa2kwRi9qNkNwZktEd2E3OThsdjVPV1huMTU3ZGZvdUY4?=
 =?utf-8?B?T1ZmRWt5RWpxR29mMWFweThOOFdiT1ZQTmhLbVVCK0pCSER5VnJRUnZzV1Zz?=
 =?utf-8?B?MmJyTWtpeS92clJIMjNab2d2eE5LY0VpbWlNdDdGMUNaVlNnZ2Z5YWd1SURS?=
 =?utf-8?B?dHdPUDNHUzVFOTYrbExncGtTb2IwR2pTVm95RTRBWHQrc3FES3NQYVV3NzRX?=
 =?utf-8?B?TUc4b2Y4V0RtZ1pHMjdscnBieFdOMSs0L0hKTFQ5ckk2cm5zNG5RWUlMTmpX?=
 =?utf-8?B?aXFzdXM2di9jRHNleWppMkpVM0VXTHJ4cW9MUTVESjM3YmFjN0xiV1VCenJn?=
 =?utf-8?B?UlJ4YTRVMXkxRGpqS3Q5Tm9YdlBmdDN5V01tWU9ZaGd2bDVLVHd1cWtxNkF1?=
 =?utf-8?B?Zkw0aXR1eTNDUFZMZ2pMb0RVYU5vdFdkalhKMDBKY21UaGpsSVZLQjVLcjcr?=
 =?utf-8?B?ekliWTNNazZxZWpHQTZzUFNXVEpzckFnOVpiZStCN3liSWFxM2MyVXVJd1pT?=
 =?utf-8?B?YjF2L3Nqb2IyQVUwSDNwd2dtdmZoMWFkMG5DRCtkdS90enp6dnd5dUhOdUQv?=
 =?utf-8?B?RDh6aFMxRWFRRENyU2RkNEt6bTUvcXN5YjhSdVlFcUtkUVpnSlhhQW5ZSUt0?=
 =?utf-8?B?bmhENEU2RmJDS3hJRkE0Y0QvNVkzZkdVRFg0REtHb0xvVExnWEJzckd5ellH?=
 =?utf-8?B?N1QzQ2lTSmZhaHZxL3lzQVhCOHJ5Qm1VQTA5bm8xMlVBM3EvOUNlaGdZeWll?=
 =?utf-8?B?VzI0azYrdzJkSXVhdStIaGRNOVpEN2lRazUzVEpzTGtyZ3BpSlpueHdBcGVU?=
 =?utf-8?B?eXY3WHhRUWVyQXV5N2VDT1FWL3ZtOGxQaVp3WFQ3YmxoZEtsTS9wZWMvRktQ?=
 =?utf-8?B?eWxEYlNvaWkyaHJzQ2NTanFlZmNqVzd1ejl3OExLcVFlZUx2cHMwcHZxUk52?=
 =?utf-8?B?b0ZlNm9ObXRjVHI2S0tXa09WclZIaXdkaWw4UVROdWo1bzE1eFJYV1NaSnpU?=
 =?utf-8?B?U1c0Q2NaM3JuUStMdUZCMFdiUVo0eDlTY09yc2k5TTdlTk4rS2pBdlQrajFz?=
 =?utf-8?B?OFJ1UGJ5dTRmekpxMm1CNkFISG9CclA5RENXb2NydDRDd0VOeDUwTXFWWmgx?=
 =?utf-8?B?a0ZFYjdOV2JiZlBFTHRZL3hNYTEvT0FVbUJNNmJqYVVDb3VpRmMrQjJtZjJo?=
 =?utf-8?B?a3A4dWVSZjlNNTlhMjJ2Uy9NeUJYWGRuby93dzRQZzRPVEhFM21RcXo0VEN6?=
 =?utf-8?B?MXFTL0tKVE1relZJSnhKMFpDM2QrL2tHeWZKemZ0bjF6aWlPblRpdFZWU0ZM?=
 =?utf-8?B?NjBrZ0hESkhqbUlId0ZaZWpNVGg2WVZvR2EzZHRIaktqVUUreG1XdmdMb2hH?=
 =?utf-8?B?N1pPeHNHTDVHTERPUk8rd3dTKytRT2lXY1NMY1ZkRnZlUmhKbUJUNWwyYnVr?=
 =?utf-8?B?K3RXVU84TzBlTkorcVBJU21TdG51aWI3M1BEU2NkUUExYTJobVhhYTlTbGxn?=
 =?utf-8?B?UW5FREFETXU4RVZqRG5lQUNqM3dMUnlkV1B0Zz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(7416014)(376014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWR6bnNxNFdmM1pnV3ZPL1F1bU0xZGFXcU1aZUptZU5vK0tRWUdiT3NkK2t0?=
 =?utf-8?B?R1F4MVBYVThpaE9XOGg2OEU0aDZsRDNhVmVGZkkvbG5DNURRQ2hsQVZBRkJm?=
 =?utf-8?B?TU5GWDRNSGV0eXN2Q0FmWHpuWkpsdUlvUXlNNEt4VE9EeTdlOGdaU043NEZu?=
 =?utf-8?B?Ylg1T1p1M0xkazluaTJRUnErUUZkWnpqRlV6ZWt5elpzUHcvYnR4WGxUdnM4?=
 =?utf-8?B?UGxvMTR3N05TeXRGMDh3ajYyRXg1RFR6ZkVPQWxSZCs2OW1paGx6RXkyS1Bv?=
 =?utf-8?B?U3Y1NVlwV2xGQUllNUVnWG9qaTB3L3p3ekE2RU1DKzJ3ZWVMYW80TG5obzFk?=
 =?utf-8?B?anA0UVRsR3l4dE5ZUXBlSzQ4UEwxRmtXeFJ4ZEZKUWJmNmZlVm04VnRaZHJk?=
 =?utf-8?B?VnBxYzlFZ3N4UWxJQ2NrRjR4VnlHRVdvWDF6akZlZ0cwaXNuWitFMXN3a3Rz?=
 =?utf-8?B?emVsNFJHYlFud2huTFVJTXJOenlmR3B0L2hVMjdReklIQ05uMWpmYzloNDJT?=
 =?utf-8?B?UnBadXM0RU1NWHlobWlxNDM4bGpzSEhlQVo5Sll2eVFOcG9HTjkxS0NhRTA5?=
 =?utf-8?B?cHBhVG9uKzJVZkJDRlZ5WGllOC95UCtlNTJlbjBXYklpbFhwY1duZEhuQWQy?=
 =?utf-8?B?N1hCa2x5VVkvbzdNQWxPRDVHbTI3NmR2ZDcxd3htL2hxU0NuWG5sSUtHRHgy?=
 =?utf-8?B?MnRlbFo1bUNCQmpKY1ZlM3llK3ozaXlvV3BFSThDNUNac3FhSElCVHAxUmRm?=
 =?utf-8?B?R2U4NGk3bzJ6a0VVS0dxRFhJRmhmQmFQU1VVRVVwQStrMkJhcHVFN3dkczgr?=
 =?utf-8?B?cUk5dkxld2dXbHgvc05sM2FUM3RwMzV2OWRMcUtPMFMxc0RGL3JXcWQ1dmNO?=
 =?utf-8?B?cWo5ankvTHJHeHg4cE9TbVYxY2VnNkMvU3VGRnhBai9RSi82WlVhS2x0OUZz?=
 =?utf-8?B?Qm5lMkhDN0pZSEkxMHIxWS9IQUNla2N3UW1LVnlBNTYrdkJKSEdWTDlIT0x0?=
 =?utf-8?B?dXlFb3hJeDR4TkY5WEx3SHg4S0JEelNlakFjMVZWcUJCMUU1WlZINXZyNnJZ?=
 =?utf-8?B?dXMvN2NQSzRMQ3F2TWlOY3FSazMrY2R5MFFvVHhWZmZtRzRld29LUHZyTVpw?=
 =?utf-8?B?ZGxNN0d4ZHA1cUQyODlNdGZxZklVMVc2bE96Ni9PTmR2c2xLaUo5OFFtUC9Y?=
 =?utf-8?B?UW04T3gxZnY2MnZTSDhZb2hHenBzdklETm9FWDI1ZVlTSkFob2ZLMURNUXg2?=
 =?utf-8?B?REZFa0ZEUVZWd2QwcWpMU1VTcTIxc1FoWUVRU2FKTnhnOWtHM0tzN1FITUU2?=
 =?utf-8?B?UEpBOXo5MGNhRWtKWFB4czJmMlEyekJBS3BiS2paOG10eFlUTy91d2w0K3dF?=
 =?utf-8?B?NWQ3SWhJdEt1YU1RZms5Q2RoaXdheEZldjRvdnBkVGl5V1U2L3FRa0l2QlYz?=
 =?utf-8?B?TnlKU2hSbG0wN3VlYnR2Z05hdmRnTW9TVHYrSzhrcFNRT09ySHV4R21FYldI?=
 =?utf-8?B?U2VONFRnQkZzSWlmeTVLNEV1OTFxTDZPaU1Fbnpxdm5GSGtUOHhqODV0RlJj?=
 =?utf-8?B?RlNmZzd4K3JKMVVXMVdwOXNhL3ZJSW80bTBJUWRkUWxPS0YwMEZWK3ZPcjNy?=
 =?utf-8?B?ZGR1Nm44dnI5T3NoVHlxVllIeG9jNjRqV29PTmhoMGFGbjJIL25RMGpWSjBJ?=
 =?utf-8?B?L3llTTRQdDZ2eDVvUDdQdWsyMWk5SFVoZ3RFRlVVQjZEdEx6YjY4cEx6Ymlu?=
 =?utf-8?B?Z2NkcFlvajJkYXlHNjhqMVJnRzdwaThRcmlsUjZTbjJhY3lNVzRGbmhUR3M0?=
 =?utf-8?B?U2FyVWYxRWlsYVZaQU43RTJKcTlVTFlSRERkZXFuZ0Z6NjFkSUUwZXpGTXFy?=
 =?utf-8?B?UTBESFU2SDYzMUFoSGk1U1FFRGRJYTFpOFI1U3NUSVNpcVBXSFBIMFpFMUg3?=
 =?utf-8?B?TjBkV1JteVdlNUpIcFF6Zkh6cGl3YVd4bmtjbzNlTDJaQlJWdDhaaFhIcERn?=
 =?utf-8?B?aVRXMDB0SzBEYjgxbHF6MSt5U1lFTXY0N1BMV3JqNHJrUjdrRW5kN3NWUG42?=
 =?utf-8?B?eFB1NjhqZS9vcVpFbURWOFdMeWQxbE0zMUxINmdObGVjRTFSNHZ0Z3pJRnND?=
 =?utf-8?Q?okmyhCEpzWvJ9kzFw2dvb5QIF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 439f5555-d915-4148-d257-08ddfcf8f95e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 12:34:02.5210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DQWQ541eNBKJ54ZbCMjCpTAl/7R4NKQRR+hc02UQpN+eClhNVAzanfHCnkLnnylnMN3BaSD2so+QWFGyJPT0ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9646

Replace the explicit call to imx_rproc_put_scu() in the remove path with
devm_add_action_or_reset(). Ensure proper cleanup of scu resources and
simplify the code by leveraging the device-managed resource framework.

Additionally:
 - Remove the IMX_RPROC_SCU_API check from imx_rproc_put_scu(), as
   devm_add_action_or_reset() now exclusively handles SCU cleanup.
 - Improve error reporting by using dev_err_probe() for consistency and
   clarity.
 - Drop the err_put_scu label, as it is now redundant due to the updated
   error handling approach.

No functional changes.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 35 +++++++++++++----------------------
 1 file changed, 13 insertions(+), 22 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index f353a680ba993dbe3dd7866ca725d18aa58303a1..76feda868cb619b79922bcee4c6fdb3e16fc81e3 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -796,13 +796,9 @@ static void imx_rproc_free_mbox(void *data)
 	}
 }
 
-static void imx_rproc_put_scu(struct rproc *rproc)
+static void imx_rproc_put_scu(void *data)
 {
-	struct imx_rproc *priv = rproc->priv;
-	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
-
-	if (dcfg->method != IMX_RPROC_SCU_API)
-		return;
+	struct imx_rproc *priv = data;
 
 	if (imx_sc_rm_is_resource_owned(priv->ipc_handle, priv->rsrc_id)) {
 		dev_pm_domain_detach_list(priv->pd_list);
@@ -944,6 +940,10 @@ static int imx_rproc_scu_api_detect_mode(struct rproc *rproc)
 	else
 		priv->core_index = 0;
 
+	ret = devm_add_action_or_reset(dev, imx_rproc_put_scu, priv);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add action for put scu\n");
+
 	/*
 	 * If Mcore resource is not owned by Acore partition, It is kicked by ROM,
 	 * and Linux could only do IPC with Mcore and nothing else.
@@ -1103,7 +1103,7 @@ static int imx_rproc_probe(struct platform_device *pdev)
 
 	ret = imx_rproc_clk_enable(priv);
 	if (ret)
-		goto err_put_scu;
+		return dev_err_probe(dev, ret, "failed to enable clks\n");
 
 	if (rproc->state != RPROC_DETACHED)
 		rproc->auto_boot = of_property_read_bool(np, "fsl,auto-boot");
@@ -1118,27 +1118,21 @@ static int imx_rproc_probe(struct platform_device *pdev)
 		ret = devm_register_sys_off_handler(dev, SYS_OFF_MODE_POWER_OFF_PREPARE,
 						    SYS_OFF_PRIO_DEFAULT,
 						    imx_rproc_sys_off_handler, rproc);
-		if (ret) {
-			dev_err(dev, "register power off handler failure\n");
-			goto err_put_scu;
-		}
+		if (ret)
+			return dev_err_probe(dev, ret, "register power off handler failure\n");
 
 		ret = devm_register_sys_off_handler(dev, SYS_OFF_MODE_RESTART_PREPARE,
 						    SYS_OFF_PRIO_DEFAULT,
 						    imx_rproc_sys_off_handler, rproc);
-		if (ret) {
-			dev_err(dev, "register restart handler failure\n");
-			goto err_put_scu;
-		}
+		if (ret)
+			return dev_err_probe(dev, ret, "register restart handler failure\n");
 	}
 
 	if (dcfg->method == IMX_RPROC_SCU_API) {
 		pm_runtime_enable(dev);
 		ret = pm_runtime_resume_and_get(dev);
-		if (ret) {
-			dev_err(dev, "pm_runtime get failed: %d\n", ret);
-			goto err_put_scu;
-		}
+		if (ret)
+			return dev_err_probe(dev, ret, "pm_runtime get failed\n");
 	}
 
 	ret = rproc_add(rproc);
@@ -1154,8 +1148,6 @@ static int imx_rproc_probe(struct platform_device *pdev)
 		pm_runtime_disable(dev);
 		pm_runtime_put_noidle(dev);
 	}
-err_put_scu:
-	imx_rproc_put_scu(rproc);
 
 	return ret;
 }
@@ -1170,7 +1162,6 @@ static void imx_rproc_remove(struct platform_device *pdev)
 		pm_runtime_put_noidle(priv->dev);
 	}
 	rproc_del(rproc);
-	imx_rproc_put_scu(rproc);
 }
 
 static const struct imx_rproc_plat_ops imx_rproc_ops_arm_smc = {

-- 
2.37.1

