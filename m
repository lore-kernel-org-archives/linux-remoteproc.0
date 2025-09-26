Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010052.outbound.protection.outlook.com [52.101.84.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428B32AD3D;
	Fri, 26 Sep 2025 12:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758890029; cv=fail; b=buqrZqHmRecXdhtdgLJc9esxXE/Od5KjC8HlpnoTaKLDF9JRgnyLXtw2MhTBRZL2hrcIrODfgN88fKtcPgKsq9PUOTJFj/cES9jC/RkG7kRAV7mSW3W831qzC4Sx5mdzdCXTmAyE/ydU+oBdXzSSrQVrNcwgxkDqtobE9ErAxZ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758890029; c=relaxed/simple;
	bh=ZpPFDG1/y8MbnfU9AnA/p0Y3iMPD9WKPsAGyJPHCRlY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=HEvvrejEBD8O9teEBfZdsAi02NhIDnZDBVTPtw3DBXlxXugumZEsD+cNqQ9wgw8ojjnOwRaSNuW9DzctPsSp9jQIAaKcJ04RiDfOD06WUZOw48IwZ0iCEQyDhJYuDTDexNNvoa9xlfNNcEyBvyF476nflm7OClweuD8t3dERF0E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PCzBhtJQ; arc=fail smtp.client-ip=52.101.84.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PCzBhtJQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sFQ1CpUpzM7rlOqEaGZA2Wgw1nLPHnIjZdu/9hnIISO6MtTFU1k8Z0Gd4lKeJqyekmfg+IO4HGBk5aS8qU3ES0Z+x3ufjOPWrauEY5RYPv+o6xAugUNap03qrgxq65WKF9BJtd/i6NuCgHFuhd1/zWrFieQgDKyStXZ6jhyrTHcuAR0dHgoBaHjoqTLgP+iPle33GIkYS2UAmNqpwxMdtK6+QRCpDhF7krSLKUAGCk0lItsXg4NmfcdGFO5qHGALx9DAQ8TC1EjmfnIMvWNLRPUqyHZNxALhOmDV4fJsGQjcgcvekg+yjd+xj7xRKIYUdDR6rSGle0n6UOc6VDQPjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CyCCG6M9xq1Uqgji8WiDBeWdiBBxwmqHoO1yDEj8cdA=;
 b=skuflkzAddouuPFpOzgrDRhWq8MM801BXWmJIDEi3vKe6LNYx0v48zhOcHet5JeoMOaKywZRk4EdZaeMApiRhZP/3M4sVGlJxws7Spk6VVHsqZPZNzH6ItK7TcFYMY4/NkPYnI8dZo7R1f7jmiS07YYjnlnaHXnjkrvRL/nHcpvul1vvbv/G1krSKqHMc4AHb7+SXxZJZGEq2Lk7Bn0+M5JkrjL+zodl4VX4tUx5bVxEMc1oKm6MvarJgkmd4RAL8k3lMLk7ObcmsjlXp/rUPZq9Gav6ZRfXnz2n94Wk8R2qs7VSU9VU5GZMJTuFqjQeHFq3WVNHs5YIGI775QHnhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CyCCG6M9xq1Uqgji8WiDBeWdiBBxwmqHoO1yDEj8cdA=;
 b=PCzBhtJQiHsUPD+OOsdpt2BaDTtputKDwC0kVe2OBY/qv9pR+ZNWJhifJEt4TSHbWtJnvTkTvi1JtUwrljSWBJLg3GTmsZUAhpjRT4sR3BIZh0ykX8D0nu19CQMkHodt3MRewfk2QcNCuEgB3HA9hgktKIoIt7yiLLXMqdF5UzYZF83b/eSr2nJZF+OYKoXQsYN7oCKJASmJ266aigtsU9K6IepnO09nMqjWNznyRTMDUjAiCqv7UAeDcS3QHGPWKejAGK3fgldMchInt4zH5wPDZ9omuYVmGOPNV8AHNH63nNMhEYQcKZqboxeD1juEV7F6uMNpf5/nuCZoP80Aew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB9646.eurprd04.prod.outlook.com (2603:10a6:10:30a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.13; Fri, 26 Sep
 2025 12:33:43 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9160.010; Fri, 26 Sep 2025
 12:33:42 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Fri, 26 Sep 2025 20:33:15 +0800
Subject: [PATCH v3 1/6] remoteproc: imx_rproc: Fix runtime PM cleanup and
 improve remove path
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250926-imx_rproc_v3-v3-1-4c0ec279cc5f@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758890010; l=1807;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=ZpPFDG1/y8MbnfU9AnA/p0Y3iMPD9WKPsAGyJPHCRlY=;
 b=mmrCmeIVmfQxSTKLTR1sYsDoq+FLX0++hnytM6B6IShRxhc5ZOgp1rvsakqwON+DC8myDVWcr
 lgVgRRMCMTZBI4FKftMXh2uojRbgBDN9MguGNmTeNOEPPxukbAfWRSs
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
X-MS-Office365-Filtering-Correlation-Id: 8655cd34-430e-4c6d-cd07-08ddfcf8eda8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|52116014|7416014|376014|1800799024|7053199007|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dHcyQ0ZFZGxpT1J2RVZDYUxKMGViOFg2RnQ1dFZHOVAvNGVqMUFSRTVkOG0w?=
 =?utf-8?B?UmhOU3JSRkN1dUNZcHpac1ptZy82SExmeDJSb0VKK1BqUzhuVVE5cXBaRk13?=
 =?utf-8?B?SS8xWE44NDc0L1NoanU0Wkl0TXJZVjJoV2ZhRWhmNExwSm8vbGNFaHFpYzFF?=
 =?utf-8?B?aG13eU9oWW56SlA1cHpWdDlWMmtGREhCVmY1aWZqWVcxLzJTWHdRNUhaTDIy?=
 =?utf-8?B?QTgvaDRza01lMTlSclZ4TmhRNkhGaDZnT1R6UUlUT3RnMUdxTUloMDAvK2lv?=
 =?utf-8?B?VDJuelNJUWZ2YjRkdFVNd3dCNzFaVUMzTVpJUVI3amh1U3d6TXo2NDVHZ1Rh?=
 =?utf-8?B?NEt1ZGM3ckxtcy9FaFdBWUxkQVJvUE43Yk16OWp4RVIwSjZLTmpTakNwWmpY?=
 =?utf-8?B?b0Jtb0tNa2pSd0RPNGRtM0dzWWg1RW81NDYwcmhlT2tHcmUwMnE0Z0M1MUxC?=
 =?utf-8?B?VjJrWFRiQTBIU21IdlNaVFkwdUJBOE0va3ZNbW5qdjVneUdUN1FTK3FjU2Jw?=
 =?utf-8?B?NFV0QTA1SllvUm5HakVUNERCZWRVWlBlOThURnpCZHN0eE5nMEJGVFJoMEJa?=
 =?utf-8?B?VHBHVitHbkMzQk8rSVZ2eVpWNzJPTUN0aGQvS2tyZWhlWFlkSFBGUVNTVFdj?=
 =?utf-8?B?NFhGLzhRTmZkZEVKbU9nQ1R1MFhkUEtpdlNZcWRDR3VwcjFKUGZSdFdVWTVj?=
 =?utf-8?B?RkZLSWJDbVZVWjk2ZndTSFdJY1c5Snl5UitNTERYVk1rWiszK1N6TlZJV1VG?=
 =?utf-8?B?bnlBK25KdTlWRVhGNjhIR1RFSFVUY3FFMGlydHllTTlRSGVjRUl4YjdLd0hH?=
 =?utf-8?B?b3RXcHVzdVRzblB5WFhYcXdudGlFNnVWWVlkTWRKaEI1ODl3Y25jQlI4NmxC?=
 =?utf-8?B?S1BRSTUzS0c4MElYVTJkR0llcHRZWTNwd3NHc2prWllCVFdhaFIrQ2svQlph?=
 =?utf-8?B?UklsUmx2a3hkbjhpcmZOQ1Y2TzNuMFhxT3kzbUJQb2hycEczZklranhqYnhs?=
 =?utf-8?B?Z2RGK3UwNGJHTWxYSzMrS1BXVjBVL1JpalpsNWtScDk5NHJmc3V5d3VSLzkw?=
 =?utf-8?B?WVg0a0FMZE9tdC9EY1lKc2R1RXZ0UzZKSTJXVnpKNzA5djNKOVhWbExGOTRQ?=
 =?utf-8?B?WjZHcm5QaFhLYXZMVlFGTGFpRU9RMUtZVk1OMTVhbUpOT2JENWNZSzdYQ2JW?=
 =?utf-8?B?T0hLTldhOE1uZEFVZzRkWjFQMnlzNSs5eGNvTGw4RStEeFNoaS9YLzJHbFd0?=
 =?utf-8?B?bGJISStnS0RwL0dHLy8xV0V3N0NielkzdGs2azdFWmtxQkV1d1ZVQ01xR3V1?=
 =?utf-8?B?cWE4NFkrNk5YRk9OZUVob0NVeGJVQzBHV1JzWURDRjZwNGY4RU11OTJhT1lK?=
 =?utf-8?B?Nk1TV2xZZHRFS3JZOGVzd1RZNUFXbyt1Z2tLSVU0bFFiS2hjeDdPZ1J1K0pH?=
 =?utf-8?B?UWZmd0NVQTdNNndaTVNIT2NscXNpNVdpT0hEWHBhS21rVGRxL1JhclIrcTM1?=
 =?utf-8?B?Uk1VZ3ZUblVJQkdHaGpFUFlMcFNFNXpsVHAybUJraHVJQmZXYnM0cjI2am4v?=
 =?utf-8?B?dEpqUzg0c1JvdnAxa0owYXlHNFF6bVB2NGFoOVBpcWVjNWdPVzc2WHVNeFdZ?=
 =?utf-8?B?WEFrTmE2S01wZHFDRU9vZzVKS3BEdlFGZUpEZ0xMYk8vbE83TUZCMHREYmxj?=
 =?utf-8?B?ZmlRNERZa2tUV09PMTV4ckdyVUJ4UWUvR1R0azJtUUVLNzdsQ0MrRVFIM0ZG?=
 =?utf-8?B?REZPYXQxVjZyaHYxY00xOCt2OThtMW5rNjRNbHBvMkZsMU13ZnJ0N2FseWFu?=
 =?utf-8?B?NUZRUlZnTGNOckZ4ZitkUjYvck1KaG8wQ1AvSXRFayt3Zklud3pOcGpjYjdX?=
 =?utf-8?B?QUFCKzZMQVVJQmFKeFRQcTRlNnpNVXQxbVFReGZsWHVock9aVTFBL3A4TWZu?=
 =?utf-8?B?ZEprZy9MemU3Y2VyRnpBbkdsSDF2WUVqanJieldTWkNVMHBBTWN1bTlsVHc5?=
 =?utf-8?B?N1JIYnA4TkVsOG5wNXoxSXhPakRPbjJ4c3E2NXBBZE96ZFNzUFljbk1zN2FQ?=
 =?utf-8?B?SVhVWTVtZWJUd3krajM1SHZKa1dMWmlBNmFkUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(7416014)(376014)(1800799024)(7053199007)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHhLaFRsdlMzaGZSY2dpMGw4OHBGandoRUZDcStDK0VocDdvOU10WFRVWGFz?=
 =?utf-8?B?ZG5LZGNMeldQRUZnb2I4TVp1ejlsRllMNjYzOFk4QXROM0RvY3RJcjN2QXRi?=
 =?utf-8?B?aGFNTEJuZFYxWDVsaVRndW96TFNTV2ovYkNYZDE5QURscEc2OXdPeVBscjdO?=
 =?utf-8?B?YVg2Mm5xS2NpWXVMb2xHNDlaU2xhaTZyT3EzeVk5YUNDOUYyNFozNi83OG1B?=
 =?utf-8?B?MitBdkZpTDZpbjM5RkxUUnVFZDdDZlVqT3hCTDZ6Q2JsTFNoWkdJblpjQVRi?=
 =?utf-8?B?SXIyNVBGSkg5aUlnYjlPTTRKZVlJTGhGTVVTVVM2VGlWWmZaMVNLVHByUG1h?=
 =?utf-8?B?dStjZTFuUG1OQUVoOVE1RnVLQlVIclNMRkxPMktGVHB6MUxWUEpMUWdhWnZH?=
 =?utf-8?B?ZjNDemtneDViS0M2dHBBcnJhOEVrMVBrMEZjTnJveGwrNVBLRHFNMTZTQWFu?=
 =?utf-8?B?M2lTcXJyTit1THJ1RTZ5Y01NNm9nc2RpSWUwYWNjeGx3N2V6NWszeXQycjlN?=
 =?utf-8?B?STh0ZWgxOWVUMmcvbkJpT2tDKzk0azEvZ2U2VlBXdEVBU2tyd3JCYzI0a2NS?=
 =?utf-8?B?SlJvbnM1Z1hyTmtjVnF4bmJ4TUlpQ3E0S3kzUkhyTjlYUStFenVTMnpxSlJt?=
 =?utf-8?B?UzVteE1LRE9OZWwrSUdrVFY0OWU1NmlNUkRLQlAzbjU4NDUyK2dkK2cvYk5Q?=
 =?utf-8?B?YUJ3dDNQSjFBcDhtbEtlaHZiTHNySE5KTm1aS1pTaDFRa2szd1U3eXg1WVdF?=
 =?utf-8?B?VFNKejMwcGFsQ2x0WWhVYmhuZjVWQmZ1UG1NMTA4bVFjYWxsbGVFWTlPWVVn?=
 =?utf-8?B?ZFIxaWR5bXBuRUE4a1l0RzJZbWRpMWZmazM1bnBpYmhzbitQdjJxelZZQldk?=
 =?utf-8?B?UFpHUitjYVRaaFNCd0UrencvWk4vVnZRbUZ1amxic3RkVDVaWkRKKzZGclpK?=
 =?utf-8?B?SGU4TFJaRVdOWnFlRkM5c3REbkV0WmxmRkdwYXl2d0NxUlpDWFJ5aG91OHF6?=
 =?utf-8?B?TzI0Z0pVTEZpT1hFcDhuL09XV2prazhoRy93SjdGTjlqTW1EM0hNdlRTejla?=
 =?utf-8?B?MGF5bjVEUG1DVkkzV2FBMHllS2tXV25DUDFpQ2FhVnFkTHlaNHVRNXVuYWtZ?=
 =?utf-8?B?MHk1d3M1aktBZVNxNmV4YUcrKzdXL2FjZ2Z6enVGZmkrMzI5dmNYK011S0tj?=
 =?utf-8?B?bjhac2o0OVAza3FOaUlkbEJLeDBwNVNUSlZEY0J6UnlxZXJ6RlRDRGY3WnQr?=
 =?utf-8?B?SDdqU2t1aXBUeDJ2SWdDWWxHTGRBbTVlWDNZdUk3YVdsSzV0bjZPa3M3V3h5?=
 =?utf-8?B?alpXZmJDOHFoTThjTmRvSEVmNjRxc215VElFUmpvUHZLZTRhalVBT1FsNjJS?=
 =?utf-8?B?aWVCYS9vanFIYzhwYVdHWnZhL3Nabks1VEkxS1hvL0FpWGdCUnlQcFNJTGxy?=
 =?utf-8?B?Nkw2emZZajg5NEVhYzlpd3VEbVpyb2Z5cm13dTBwbVZwbFRacGIyY2tmNDMy?=
 =?utf-8?B?dXBxaS9nb3BtYUt1VThsSkVvRitqV3hsdFM2b2xLNVpLdmFhSkhZbDZSK3V3?=
 =?utf-8?B?c2lwT1VOMk9pM3YwQVNtNUNqUEQwRFBTQkNGQUxvM0cwbzV3ODk2d2JxR1hK?=
 =?utf-8?B?dXRYVFE3T0VwYnBrMnZveXRWbUZ4Z0NrZDBSKyt1VWJvYmRCMnBoNG1xK0tw?=
 =?utf-8?B?V3JqQU1BQW5BRldQTlR5cmwya21RcGRWOG4rS0E4UThzRTlyWjlnb0pZQ1B0?=
 =?utf-8?B?N2hCMkpvREVZWGVRbFo0YzAwVnhYaHNwNXhybTR5MzdOdmthSnNZUG1FM0c4?=
 =?utf-8?B?ZWtOcmQrTEFZS2s0MFhMaExSWXRqRHQzM1h0Y3gzTFpoZHU5NE1NbkVlaGt3?=
 =?utf-8?B?NTFFSWtWYWhWOFFEbm9aRDFpWmU4cnZrcjZFZDA5RzZSZ05sVnE1VWU3ZWgy?=
 =?utf-8?B?N2x2STBiN3dzSjdKc1RXQVg2N1JRQ0JFaExFcEd2WXYyZXp5RGhKTERFVTli?=
 =?utf-8?B?aHZuSkxWNmJFQjRudDREZUJ5MjFBVGFKSG1HWjcyenpyZHVxVXFHcUd4Si95?=
 =?utf-8?B?L0ZMczhDZjR1RXF0My94OXlXc0JYT2JtL2dyT1VOcEFDT1p2ckFyQUU2bm8x?=
 =?utf-8?Q?6iNomlMj8+fumNzrZ26OipYe1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8655cd34-430e-4c6d-cd07-08ddfcf8eda8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 12:33:42.8306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ecGHehWNIsASsYp5f2pCEe28m+lkvxy0pjplCrIcGYqAGm9zR0fjfuW1ma6BJjPW7m9+ouwsURpW+f5qdnQBLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9646

Proper cleanup should be done when rproc_add() fails by invoking both
pm_runtime_disable() and pm_runtime_put_noidle() to avoid leaving the
device in an inconsistent power state.

Fix it by adding pm_runtime_put_noidle() and pm_runtime_disable()
in the error path.

Also Update the remove() callback to use pm_runtime_put_noidle() instead of
pm_runtime_put(), to clearly indicate that only need to restore the usage
count.

Fixes: a876a3aacc43 ("remoteproc: imx_rproc: detect and attach to pre-booted remote cores")
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Hiago De Franco <hiago.franco@toradex.com>
Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index bb25221a4a8987ff427d68e2a5535f0e156b0097..8424e6ea5569b9ba6b07525643ce795faaeb2898 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -1136,11 +1136,16 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	ret = rproc_add(rproc);
 	if (ret) {
 		dev_err(dev, "rproc_add failed\n");
-		goto err_put_clk;
+		goto err_put_pm;
 	}
 
 	return 0;
 
+err_put_pm:
+	if (dcfg->method == IMX_RPROC_SCU_API) {
+		pm_runtime_disable(dev);
+		pm_runtime_put_noidle(dev);
+	}
 err_put_clk:
 	clk_disable_unprepare(priv->clk);
 err_put_scu:
@@ -1160,7 +1165,7 @@ static void imx_rproc_remove(struct platform_device *pdev)
 
 	if (priv->dcfg->method == IMX_RPROC_SCU_API) {
 		pm_runtime_disable(priv->dev);
-		pm_runtime_put(priv->dev);
+		pm_runtime_put_noidle(priv->dev);
 	}
 	clk_disable_unprepare(priv->clk);
 	rproc_del(rproc);

-- 
2.37.1

