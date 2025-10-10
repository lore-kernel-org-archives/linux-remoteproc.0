Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011033.outbound.protection.outlook.com [40.107.130.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808B92EF66A;
	Fri, 10 Oct 2025 12:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760099091; cv=fail; b=laUkgKAVyBUyw8+fOR4sPlb8+CT64Pwh/BdOUAdmNIRJGzxFXs2g7sBo5byWv5paWeRr/LKUWOEW0eMq+Jy+HSCSDRrmHNSX3ITvuBlHgrjjauMxax1jniZfL+1vV6G8e1yf5+jIrQ3/flFOoDw1K6wLboGBCblhFt5+FWgQNjs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760099091; c=relaxed/simple;
	bh=eSHWbpsXz+4hMLeOs9Vx1ZUKZo8i7f6XJf/76ah9gIs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=uWMsUl9t7gGgEhIvhuBtbCs0juaHoqNUoWcUKyy1pLq8++K4qC6Mb4ki8B1PqM+uGtZFEqy19ABl43RL52hKtujTVMjiWZbjCeFxjsWLBjTSD877o5s/tve7T2klH/pq0vroZX6Jhp3Moi96+N44VzK6Up4tE1aZFa7Xv7d3FDo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=QZF7Pl4G; arc=fail smtp.client-ip=40.107.130.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="QZF7Pl4G"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NmVVmUTqqXcISuWdK5WciZag98j8g4ofo0Y16HYH11xGm6OfsN2LzqMUsChqhY9kmruPdJXhDKMFnpCWPTV8JYNPU9zseD4MXRN/A4aWp/PXMbfMDBPNFgNkZswK9OmyxAG3mVabtRf9AxU3yDdxlYyGd626mZPYy9vJh8wVqgcU8YHMn1uCNwH4GFx4VtqSsRYiYMJHP/ux0VFQChw3I0hi0MSIaUsBJ/4oO64hEEKEpT3nYmqTGdxWLIQWf3V2XqPqrLKFDGGuZAEETLGFbB9g/95Xl/l1B+taltc5R9l2tDE71vQPOEhI3cisShb8PnwUwJ8P4mg/TEv/9Kl96Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wziQ6CiULI6gzCZYLiait0jMyOlJyH1NpP4W8pafVLY=;
 b=GXBuRDZtscOCM218psDnorE9F3D8qrJZIs/Z4Ae42MAL4fgpORFAh0wCaOE1hbTu6nfAOOT2gqw82FvcqXxNYNvmpj2SwLdvviiCEi0GYyyiG+yhZ/QAUPUONuMZPZraf9zlX8jJg/di3pP4FHRztXF1/+JZCVNlLN7L+gG0vrRnNh+lMgs9oJmfq8udHkxXTEO3YP6qa3kNbrUauf79ReXhVeGszwe6NRZZee2xPCqkimPeCZRAi5kJFZLJAV/V/iAlDO0ywQCinFLxlsoVCtdcWHlYu8kGiF7sWSJZ+Hrxk1Bky4xwDHlUaEftwR816GzWM8VkYxG4ATqug0dk7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wziQ6CiULI6gzCZYLiait0jMyOlJyH1NpP4W8pafVLY=;
 b=QZF7Pl4G25PBjayi4iK87yYBbp9fh29TiUXtZGXay1J9vScXWXZYRy2GL+3zpO4ZTp5rBTlVCTwDddM6niTuDv3xOKDiPNKt2Uh/NVVW3U9OAzRwGmZ8wbPq5xpeCjBimM5CwYZWQF5X7WR8kabjVfcXPqdwHNx9JDg6OHX4xKAFLhITpwyrU+H5UO/fziHt+g15GEq+qfWAInZzXpq++bJ6GIOf0YquyXZ5CGP5YXSPaIY3auy8FEgUf7EVh5T/2C97d2zYesCw/F78oC2jtmYUJALFA5h6mZFN2nhaIVznQeyK6Mzwql9zbHHDnahGaYd/Uq4iNahaykFcF9Jg/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8449.eurprd04.prod.outlook.com (2603:10a6:20b:407::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 12:24:46 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9203.007; Fri, 10 Oct 2025
 12:24:46 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Fri, 10 Oct 2025 20:24:14 +0800
Subject: [PATCH v2 3/7] remoteproc: core: Removed unused headers
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251010-remoteproc-cleanup-v2-3-7cecf1bfd81c@nxp.com>
References: <20251010-remoteproc-cleanup-v2-0-7cecf1bfd81c@nxp.com>
In-Reply-To: <20251010-remoteproc-cleanup-v2-0-7cecf1bfd81c@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Andrew Davis <afd@ti.com>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760099067; l=1240;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=eSHWbpsXz+4hMLeOs9Vx1ZUKZo8i7f6XJf/76ah9gIs=;
 b=1DRQVMx8Mq9/Q/h2HctPPxwfmRy4O1AsX1HBI6ucJCiLp3xUvt8LdaIDT/JxYldYhQ77AtlVq
 JNva3VsoITIBpHomOErw4IGYt8upr8Ua+Zn/ymcMRzEh2R9YPeVVWWR
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR01CA0134.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::14) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB8449:EE_
X-MS-Office365-Filtering-Correlation-Id: ba8655a9-dd86-42c6-341a-08de07f80006
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VE5kdEl6UVdrVGpnd1hXNFgxZzh4bWlNVTcralk2cTFUZllOR0JvcTJrQXpG?=
 =?utf-8?B?NFVTT0tIWm5NYTd3Zm9aRXJSU1NvQXcxaVJsZ0ZTTC95aUZxUXNoZ0h0NVFj?=
 =?utf-8?B?YUphYTFIa3AwQmhTZ0dCZk9rRC8zWUs2Q3hHak9ETFowaC9ydlpVdDhOSVFE?=
 =?utf-8?B?b3VXNy92T0pCMVJOTERhajNBck5PeTBpZ1JyeEpBYjd6ZmJBN0txaG1mK3dj?=
 =?utf-8?B?NkF0VkFDMFVnTVNZVnRXc2tNb3lFTG1uQlE3Z3Y2YzB5UGtkbTA5SkJDZ05Y?=
 =?utf-8?B?OEJOM1QwRGlka2hjejZwcXpTSFA2eHpHYTZxVXEzdHkyTkVraWNVT2hCNk1l?=
 =?utf-8?B?L1BicXkzb29LQXRHUjdiZE94M2t0aXNTT0V2NmkrcEJWNTVvMVBDZVFZdXdT?=
 =?utf-8?B?YnIxVE0vbzE0NVJhYVU3UXNER1E5dGk1R2dML28wQ2JrN2MvNmV6ZlUvMC9O?=
 =?utf-8?B?ZzlVRXAvVGVCVkhCWDBLZ3FjaFY1TFUzaTZmUlQxdEVPVlRnUWlleUN4YXVj?=
 =?utf-8?B?ZnlMMlZHUlY5U25xMTFEckxZRmxabjRqQmtPNTI5bTBXVUJpMkk2Q2tyQ0Vw?=
 =?utf-8?B?RVNQaDNLYWJLMkNOc2VCbzZ3TlU2dUZXNTk5R3lwQ09Bc1ZQZnYzUUx2NUEx?=
 =?utf-8?B?SW5xTkI0TkdKWFkwYjNTZTZpelAwclRUN1NQY3dyY1RMZk1WNklkRENINXVT?=
 =?utf-8?B?bG9OK3ZaUHRpYWd2SFgxb0hGc2hXU0Q0SlZHVzhxeG03SVBXTVJ4MVB3a0RY?=
 =?utf-8?B?UUFhcDhUd3cwSzNFMk1EczQ3NEpDUFArZ2lkMTYxZXVHMnRNZXdwRFhNY0ti?=
 =?utf-8?B?ajdLdmFvWVhCMDBFRGtocWdJQ3RQc0haOERTbmtkVjdjQnd5VWpjYUN6S0tG?=
 =?utf-8?B?OVNVWDJPVklxWXpyZHRIWXdvajhhc3JIejBVSjk4REZQb1Jyb0cyZkVCM3ZX?=
 =?utf-8?B?eWxOU3A1aXlubTFkM1dwRnpHbmdFbmtKbzR6bUxvZTgrRlJuVTdXYmJ6Ri9G?=
 =?utf-8?B?cXdwaUtWMnZNTXhMQkFRUEJyUHJRQkljQ1RML0NWSHBocDFBeXp1Vzk3OU93?=
 =?utf-8?B?eGVRbE4zQ0ZPVVhtbnNyUkNVNmNWTHRCOEhxckY0Y2o1aUVVS1phNEk0T0dP?=
 =?utf-8?B?V1VZTldkUEVveldKZGlqUXZ1OERpRTY4VE1jZDZWcWpHcjlmTi9KdXIvQTd1?=
 =?utf-8?B?YjN2MWpvOGdjK2Y0VWpPVVZlbk9FZmtDVDdvTC9PanJvbUw1dU9MTURQNXJo?=
 =?utf-8?B?Vzh4b3lBdExwU1h4bVVsZmtMS040UXhJOHh1SkZvd1ZmNEtiTmFUbTQ1NjIy?=
 =?utf-8?B?a1p2aVZiRnloZURFZ2FKZUczMURkNnNIeVN3c1NpT2JURnhiTXVXaWtSaStE?=
 =?utf-8?B?bTNUODNtVzM0S1dhYTFVcDNMdHZMOUJEdEJHQ0xuaitNRmZjY3pHS0Rja2Nh?=
 =?utf-8?B?cGNXUkVrMkd3SXE5dFk4TkpiS2FYbVhPWWR5clppU2JWd3ltZWhVaVM0bmFM?=
 =?utf-8?B?dHZ1SzFiMUNaTzUyOEhPMytILzB6N0pOek9LUGNDdHgrTjFZNmlUUlJ6ZzVM?=
 =?utf-8?B?VS95ME56Y2JNNUxNbWhnOFl0YXZMcXZPcWxBMmVRbUI4aTBHN1JxWHd5ZHdz?=
 =?utf-8?B?VXdEVnJJb0MxSDV0aUNjVkVibUZ3NzJwUkkxVXp5YnM0QnZoaUpkMXB3YXBH?=
 =?utf-8?B?ZERnZjRLYWdkRlJaVVBBOWxnd2lDKzYzZk80Vmxubk0xMGx1Rk9TNTA5TFFL?=
 =?utf-8?B?ZmdKUStOcSs1WkQ0YUtlS3hUZzhYZDk3WWI1aGVwY0JxdzZ3bjg3RVBnOFR2?=
 =?utf-8?B?bjN6QnBiM0Y1MXFCWksyOFdlN3FkaDNpUitoWjV5dFpEcW5rTWJ6bEdqRFJv?=
 =?utf-8?B?WWJRRWc3R3JYdTdyM09ZNlR1MmFIOHpLZHVSdERSNndZUUNIM0R5YnFxRlNj?=
 =?utf-8?B?OXpFb2ZDVjkvQ2pJdE9tcGlTMGwveEoxQkRUckFFSjBrbUZGWTBxcGlhT2VW?=
 =?utf-8?B?YVBvU2JRRGREVHFUWFVFdkhicGlzbmNOSHVieVlXMmk5SkZXeWNYdVUraVl0?=
 =?utf-8?Q?uehKlT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVhqRi9DeXo5LzdhV3ZSbG5DLzVkSTAvQVNtbmpQTkd6T0ttQk42eUU2c1h4?=
 =?utf-8?B?RkZFV002RzBsRjNjVG5mSmtUZ05WNGNxYWUrMXZoZ1k3cllYNFpSeGVUSGVj?=
 =?utf-8?B?eVE5OVJDc0dyZll3cGxlQjZEQ0RhdVpZQXByTDdZWUdMNys5dTdyTDBsUVg3?=
 =?utf-8?B?VC8ycG90RWdJdmNSYmNJZ0ZqbU53eWFTM0x1Q0NibDFzM3JWYWprOVBJc1l4?=
 =?utf-8?B?Zk1Gd2dxZ3RxZXhMNHJKdW9IWXFSMDRCMWZqYVYyYk9YVkQxeTkxNjV2amI2?=
 =?utf-8?B?S05WWGJrQlBEU0JIVFdMTUZHOGczSHR0c1ZzcFpycWFLQktsZlZPdUpweE5B?=
 =?utf-8?B?U2NHRG0ya2NGWHhhYlExWi9ya2JyOEZFRjBqbUZUR0ErSzNsZXpUaThDRlRm?=
 =?utf-8?B?WGtJNGRxOEZSVHZjN0RkQWY5SHN0cnV3dHpFWGZXZVdiZE1nSVNDQW9qWUp2?=
 =?utf-8?B?bHJLZHo3ZEErTDdWZUlIYWd5S1JDandNREZQY1FaaUgxZ0VLOGJwaXJuakQ2?=
 =?utf-8?B?MkJ5bm91SS9KMHN5M0FHS1NZemFrQUZneG1WR0VKOWhwMTN1NjVuSGFuWHFW?=
 =?utf-8?B?MkEvSEVRN2s1YUJNL24rOGFyTnovRTFXNGhtSDBYR3A1YWpJZjBoSGtFejgy?=
 =?utf-8?B?WHM5U1pmU25VblhvWS9Uc2k1dVRvUEx4YTQ2NndTYS82K3ZhNTVnWWx3ZVJN?=
 =?utf-8?B?ck1uOE1pNnUvblIrc2xabEszUlJwMXJXTjExa3ZKT1YwMnVvemM2ell2eHNU?=
 =?utf-8?B?YXRONGJhRGxWcVFGc3liN2lhMHoyT3locmMwN0lkd3YyYnVNdU5JVy9rY3FH?=
 =?utf-8?B?aXdBYnhxTTFZb0hzaEZ0VisxU1VqMHFkQzQ4OHdxdjJydThwUTFlUjZhSGlQ?=
 =?utf-8?B?UHJKOTJacjRhK1p6SUVEejZFdllsbDc3S013YlhwL1Zjb2o0UWtMNE1PR010?=
 =?utf-8?B?UGdqNU1yUUV2M0ljK0hqNlY1STI4SUU3Q25XS3hrcjBrNExWOHpGQUJkRkJj?=
 =?utf-8?B?enBnYVAxdE1DaHZsZE42eWZWaE9xVTFoTDg3dEFqMkpRdm42UEY3RXNBRzFx?=
 =?utf-8?B?MVJkUEtjU3NWaVJabzliMzhFZ1BSSjJrWTR2OXZTWlNGYlRLM2k2L0FwbVpj?=
 =?utf-8?B?b3Y2NDFzaXlUczh6SEhuRnBDRVBBSnZNZUdWd0xQZG1oR0VIaFpIU3VIeU8w?=
 =?utf-8?B?VzlxczV4NFdPeGhOcWlpL1REeWNUZDBtMGpYNWZsVWFWNVB5NWhkUERNYnlz?=
 =?utf-8?B?eHYvQ0grMVZvWUVRbllWNW50WTYvQ29USHhPM1l3VkZGbFVIeTdKRXVQaG5Z?=
 =?utf-8?B?QnRlbi9OY2F4QlVvdE85Sy9kTVc2Z3ZiUTNQTk1QeUtZOEd3KzY3U1ZnSEE4?=
 =?utf-8?B?V2Q5TGdSRzgvRW41ZUhRRVVuUHhsRHBlbHA2VGJ6NDRlRHpzVWdJeTByQkxP?=
 =?utf-8?B?L0ZDZmRWV1Z5d003K3F4V0VBWTBOVjdWYjA4L00zd2FZNEwwQzZVRHVlcHUx?=
 =?utf-8?B?QXJpTzdPd2FwUDZGMVFCYWlJUFBoVmRNSkhGam1ZUTZYRDd2RVFoMW14VGJ3?=
 =?utf-8?B?eTkvQjhpOU1Zc1VPMFdiUmR5aDNUZFA1eEZPOVJXWjJUcG9UOHlXQUtSYVFZ?=
 =?utf-8?B?WnFyMSs1UVRzaXNrck9QQWpMUldndWpRMHYxZ0RNVU1XOFR6aTlVOS9Md0dG?=
 =?utf-8?B?cTRybmVEYzFMeGRULzZSa0FHQjZKRzZWOEVkRmVPUmFBZjRXTWpWQkpUQ3pu?=
 =?utf-8?B?TXhpUG9vMGNWS3l2LzhCRzJycTNQRGlPNEVSTkpscTA1MXFkdGtReVVJT3cw?=
 =?utf-8?B?WGgrbXJFd0xYemhlcEt1Tld2QUI4TVcyL3FiSW5EV2EzZ3RINDYzQjZTOU53?=
 =?utf-8?B?QmNrWUlyc3lMeDFHamJYaFVPWnBKQ0g2bzdETEM4cGlnRlRRSGVzSm92Um1o?=
 =?utf-8?B?bWluUHJsRzFRWmtQM25ZL0dkNVFlaDVQc2tVWFQ4N3VFQS9qa0hCYnd6dUVx?=
 =?utf-8?B?bHorUy93bmJDZEJRQnpFY3ExZkh1dkh0ZTZFUDNZT09TVnpESVBrcFZHWGJv?=
 =?utf-8?B?aW5zaENxNjc3dFN0dlhrejQvQk42WWtvVDRRemtOTFkwOE9PRE53UDVKRWJj?=
 =?utf-8?Q?7CRutOW0Aes5wYQ/rla+PYFZj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba8655a9-dd86-42c6-341a-08de07f80006
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 12:24:46.8379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mLOvE7rMRMWNP4iIyXuvg1wppThHKyVVlAr9jo5e53OEAkJYYr2SJo4caIJ2kvtVJe/SZHh2CsQ8Fdcfr70skw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8449

There is no user of crc32.h, debugfs.h, of_reserved_mem.h, virtio_ids.h,
so remove from the included headers.

No functional changes.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/remoteproc_core.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index f7d21e99d171667d925de769db003c4e13fe8fe8..8004a480348378abef78ad5641a8c8b5766c20a6 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -17,8 +17,6 @@
 #define pr_fmt(fmt)    "%s: " fmt, __func__
 
 #include <asm/byteorder.h>
-#include <linux/crc32.h>
-#include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
@@ -30,14 +28,12 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of_platform.h>
-#include <linux/of_reserved_mem.h>
 #include <linux/panic_notifier.h>
 #include <linux/platform_device.h>
 #include <linux/rculist.h>
 #include <linux/remoteproc.h>
 #include <linux/slab.h>
 #include <linux/string.h>
-#include <linux/virtio_ids.h>
 #include <linux/virtio_ring.h>
 
 #include "remoteproc_internal.h"

-- 
2.37.1

