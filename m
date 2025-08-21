Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013048.outbound.protection.outlook.com [40.107.159.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAA52D3ECA;
	Thu, 21 Aug 2025 09:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755767135; cv=fail; b=EH36iriRzDysbaccRAuRlDuaKvwklGhY+aWmHv7IcskuOYcxyC3Y1SIUadZdGFxLDahfCzFi9TRTtDxrxMtJPTYsO0pJ/uC03sFxVjsV2gNHyLALxGrQ+241r0kevAPqwdI+NZ7pZ9cSJHg0rADrdE+cYd6wc3KdqSDew+iqWXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755767135; c=relaxed/simple;
	bh=Gn8AanCwjay2JI77GrtpgXF6F5gweYuV9gKPS2j8sc0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=VQQuKUS2E2tnRI0oxfh6x80QF8pULYXwZP0vyXhhCp/2jtfwa/XEZj4DymQpkWQ1SgF3icwopYka4WYYWBggSQCs3Ic5oBA2nQgkkX4rUp+oiriPFGUAWzzoLoAhWATCK4ETw+/AGOX6Etc5hqVga+pMUbbGvFV19YldQ3CIWbY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MoiubRtd; arc=fail smtp.client-ip=40.107.159.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MoiubRtd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H1U4gKmlp0RDsqtb43hvmfYXDKTpEHGKXvLTekq8kJXyH8CLSNK0/yG8VRch1s3gOX8g6zN3ffbuU/Jxp7HTp/h6eSSMTb4dR/EJo8auzD1yv/Txz99nhFv9qttt2vHcTe/jUwG0Q4xdyy/i6SG3BtbPRHmjmbZLxDGvwxfVovAfkmvcAiL6KVC6HbeeGObQvKAddcPWycFVvgEeKtPwOnNit8DV0wlBKJD1DYQVdYGvVen/bHo/6vXP8oSnJRKnHZbbTxNpG/0KReJw5JrAoeqmnF0G4rRyWVUupyN/A9e/BPAaKUFO8X8JgjutTNip3Ig1l7cQrzNQFae8xHEjuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mq0NmtgjYej1VQuxWa5z1Q2xl6VISmwm3tPi1mnGGeo=;
 b=LQ5lhAYnF2YWwOV1sTGHz/2SOGwDdUPUiOxZ6VNy+Dl8wz8jumUzQeibf3zNA/RU+ntLHrjYZeV+bXVeC35wZoLtJmofqAWCHRs84IWwojn2jVG+SfHm/1pimjSIY/cEMGFwaO5symO7cVre6cJ0Y+a9vicAD7LnFuhXwf9TnOetQeCP8Xw744ydfmbTBTp60jZtuBaDI3haGjD1OgIyUmYG+vkg0bDRtq6OZsRKDx2tNAxzNVzTud+HltXWC7mLGCPUr6Fwd4YFqKghHalQ06hdk0d0cbqygNJ4pDjAE0LTQ3OpvpFUwu7A5Yke+XcV4t/uIaK69IiiqG2dFAIE+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mq0NmtgjYej1VQuxWa5z1Q2xl6VISmwm3tPi1mnGGeo=;
 b=MoiubRtdLeP3hmMSRgzGFA5rf9IPcKr9cfPPhNkjUURVTaYoZRUMwg3hSMkFigRhOaJ+4VKkCwF/w/rWJt580dYx4e5VTv3fAS8pafVmie64g2Y/F0//Ag8nxNEf7LrKVjrg1hWfdlHbXJA1wR1WJ8BdYvicK6HTm5nux6OwuFSwS+Qnosmlf0D1fH88n332Aa7pmiesS/X+DPUDobIJR+F88xJ0mva3fw8H/idmyLnY8kEEMSqx5N9UYCbDDD6Zpm1E/p4hJnR6bGRrDRWayoSZ1movEOv5a7QYeuZe21Y7J94NPbRjt5tmFwZFb3QmdlPYE03aeVCl1ao0Dl3ffQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM8PR04MB7858.eurprd04.prod.outlook.com (2603:10a6:20b:237::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Thu, 21 Aug
 2025 09:05:30 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.9052.013; Thu, 21 Aug 2025
 09:05:30 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Thu, 21 Aug 2025 17:05:04 +0800
Subject: [PATCH v5 1/3] dt-bindings: remoteproc: fsl,imx-rproc: Add support
 for i.MX95
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-imx95-rproc-1-v5-1-e93191dfac51@nxp.com>
References: <20250821-imx95-rproc-1-v5-0-e93191dfac51@nxp.com>
In-Reply-To: <20250821-imx95-rproc-1-v5-0-e93191dfac51@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755767118; l=884;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=Gn8AanCwjay2JI77GrtpgXF6F5gweYuV9gKPS2j8sc0=;
 b=0KY3RHDuM6NXprCtNriEu4oPtQPlPvJCp1lLF7zvAHYxSvBynh2MbFhfBYDkT6ytIz9eJfZd5
 lBzDmcBICitDXRA2CvtSIPSPINoDgFqTth1iJnhN4Oe3RbOV4LqRvLN
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0035.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::8) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM8PR04MB7858:EE_
X-MS-Office365-Filtering-Correlation-Id: 92af7563-101f-4a8a-87c6-08dde091e08c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z0NYSGNmblFWYS9hWDNSdkZCZTBRajY5WmJBdm55NU9pZ1dOdmFINDdIaitL?=
 =?utf-8?B?U2YxSDFsbFBSYlMvN2xnNUdMMnYvOTUveTlCL0ZJM3pLdjZjelhJa3hOY3Rx?=
 =?utf-8?B?cWhpRVNSMFB5SHAzelpoOHVlWUdlS0puNldPV1VXTEdkMk9VVWN5aXdnYVh5?=
 =?utf-8?B?ZStTS0tUbUJ6YzdzZjFJYlFGcllJZ0l4dFE2cExMcmVKNGlLSnpDWUFOTDh3?=
 =?utf-8?B?K0E1WDRaRHZIckVFODJkRmRCY25mMHA4MFhSKzExQ2xLN21jS3ZiZVd1dXJP?=
 =?utf-8?B?aXhYTUpXN1lFNHVMSjNTR0lZMExBZFdwaW1OdVNMUUM3cmRnY0pKWnA4UW9G?=
 =?utf-8?B?Z2kzMDV0VDBNanJlcXpWUlJoYTQyL2lBR1luMndtWE1lbkRUMVdGamRzaWNj?=
 =?utf-8?B?TXJEYXFtVk9tTmFNT3BQRjhvaHl3SHEyeEZFbmRKdXZ2VFNYc1dXY2hPRmxl?=
 =?utf-8?B?Z3I2RXQ2b0hJdmorK1BidURPZXVFUlZhOVRaaWtYdmYvZ0JpNlRXdmR6TFFG?=
 =?utf-8?B?bXdOQklCbll3TnFlN1E3K3lkaURYUUF6Q3o1S01wUUd4Mkc0QkZSTUZleHlT?=
 =?utf-8?B?VDYyd1c1WU9qYkVYcDQyRHN4VDYrbVV1dVJRWFo1UTVMc0dtc1g4WVI5OHRZ?=
 =?utf-8?B?RWtwSlFuV2JpQTVvZWdtRENsTnJXNU5MZGJzTmNLNWJQVkxRdmNKN2s2M2ts?=
 =?utf-8?B?MFBtSGZaUEZzcXIwQmRlc2dWVjQ3ZjFDR2Mxd202L1VUbnNOVVFsa0lCRS9U?=
 =?utf-8?B?SlJkNWptVk5BU2tuRHd4ZFZiWS9BanBZTFV5UTN2TFNPWlBIU3RNR0Uxd2RJ?=
 =?utf-8?B?cS8zU0tsR2dMZ2E1N1hzak0zbVpCdnlqL0g0TGx1TW5md2xQVEozSm93UHhu?=
 =?utf-8?B?eUltVExlTndFTVo2cnJveWN1UjhyMU9aUjAzU0tkd0NXNy9aMHhoV01Vdk5N?=
 =?utf-8?B?K1pvTmM3RzVxMC9hbFZ3TFNTeFRzRlhVRS9kZHE5bHNMQjBaS2w4T3dRTUtH?=
 =?utf-8?B?YXRiVjB3N2wvRVBaL2tmcnljajFVS1RBUUFRNDRnRGxlcXlTdWxKR0pNWFlh?=
 =?utf-8?B?c016YlQ4TThSUXRaVUY4ZkcrdXp4bU1zWGVBOW5uWW8zbmY4QU9IZWdRb1ov?=
 =?utf-8?B?aHdvSWc5bjhLeXN6bXhuTVpwMy8zRzF0alpnczJEOHdFZ0EyaUFDV0N0dVZV?=
 =?utf-8?B?WlF4aThNL2RGY01DbkNZV3NucStRYlJkK1lRODFhODZscHF5TnF4OGRRL3Jw?=
 =?utf-8?B?eGtBdnlZWXlDbmUwZWdOZzhxcXE3cEl4QjVQVU5LbVBIT0doSHJTeGcrN0gv?=
 =?utf-8?B?UENxTlBEUnEva29Pb0ljdThGOExrWk9wSHQ2R3dRWGxGRmZMTCs2dEFhZysy?=
 =?utf-8?B?bkRVNjBOSUpiYmhtOC8zZ0dsL05SVWZ1R20yZTJWR0VrUjlzOHBXekh3TVIw?=
 =?utf-8?B?WnhBWFZpRHRPUmpiYndzNHFYM2dqUGE4RmxzTHZBek9RM3BqMzloQ0VsY212?=
 =?utf-8?B?dktUMDAxUCtQZDk2VFRPQzk2VGNBS29LUzJub0NxbEhoNytNVnR1SGNHZ0Qx?=
 =?utf-8?B?ZitRRUsyVndYbytwalgvdlNiYm1uenJjblNtY29tMFozK21ZMGZ6MzdEWDdS?=
 =?utf-8?B?azhMMmdMWjFYd1AxZXVJYWkvYjZneTAvOHBTQjRZbDYrZytwb3k5bTYwTUZx?=
 =?utf-8?B?WlcwdUFzOXhGVlJudjJ0M0hkMnZrZDZ2Ylo2NEpROWNxRnBQeXZMVThQQUpp?=
 =?utf-8?B?WXlZNHhhY3VpNXZNdFVVdDNGYkpjOGdJcVNnY21LS1FZQkZjRlVjYnMxK3dF?=
 =?utf-8?B?RDdEZVVNOCszczdDME1JUUhlZXZ3T1FZa3pMdFpaa0kzM1JHTGxCNHdRTHBm?=
 =?utf-8?B?QVBGVDArcVBabktGTHdrVlNPbnFkSnpNTFh1N1pwTy93RUxlK21ORHhNbTRj?=
 =?utf-8?B?Z2tVcjJMVUNHUFl5QVEvb0U3TlhpdVhPZHNZazhDYTZLQXJMOXlYWWlvZ1R5?=
 =?utf-8?Q?StyL/QY2UjHikXqslMbXew29xaHdUE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzZqanAxSFFjbU9GN052REdVYXZwbFlmNGVnRUFPdE9XN2hvWnJPVlFkOVV1?=
 =?utf-8?B?QVhNazZKZ1VGeWNhNnlpMUt3QUhWdEhoVnlsb3hDQ3VlblZ1UkZuQStUUTVQ?=
 =?utf-8?B?eVA1TWpVa3lhNzV0VE82RDUycXA0OEN3NVV0Z3d0RDBNdFhiMmVETTc2QTVD?=
 =?utf-8?B?a1ptMGZFZFVGdjFnT21yZjB5djNoTGppNVY5SHd0bi9NTnBhUG5kUENIV0Mv?=
 =?utf-8?B?WmtKendJeGh0Zzc3SHVkQTlQZzFKMk9mUm4zTE8zeXY1TUhQbVpLUjJ5WkhB?=
 =?utf-8?B?Q2tVVDVEZWJvZlVHWjVvWk1LYU5iR3J3RkNTR25zOU5oR3JWWlNGdXpZT3Nq?=
 =?utf-8?B?cmRoM1hqSEJ2c0dEcTlLSDN6ZjBPRkRGWTNLb3VDL1ZJQ2xTcXBGWlhGSFZa?=
 =?utf-8?B?cWc4aXArUjV0QnJlYUI3L01rS3lkZnlyb2dGYkhsalhDSlFiUVBieHB0ZGhm?=
 =?utf-8?B?N24zaHRmY3hjQTZJNzNaWjZkUlpqbkN2WVljaHhCazZhekhaOHl5U1NKUDQx?=
 =?utf-8?B?VTFrNUpVZ1J5TjdocmhxVW9hUXdtSXNORkF6US90L1dlWm9NSFM3dUo0VlN2?=
 =?utf-8?B?cEZ0eEoyZ3BrWHplWCswelgrUjZOYUt2R0NxUExBd1I1MGtZMys3UWppTDRK?=
 =?utf-8?B?SkY0TXdGeTJFd1RXamtFSkVhTkd2aFNrU0dPL2ZSeWFIZ0lUZE9JNDFwS0Ey?=
 =?utf-8?B?cXRQV0hmSTN0Q3R0QTZrRDF6NmdpMi9ZTXM3UmxuZWl2QXF0MjAvY2lUeGZ3?=
 =?utf-8?B?YzJLS2xueG1IVHY3WXFGT01WeXh5eUZmaldwS0JtQ3krN0FtdGVsSE9YUGQ2?=
 =?utf-8?B?d1drcmxYMHBLRUorcFdXRG5SMytrbksyZmVBTmdMajduc3pNZ0hwQTFvN2J3?=
 =?utf-8?B?Z2ZGWTJQdGJVNmNieHRBTkRGQUVWMjQwMjZrc0FuM0lWWlpXdVZIQTFSMWtS?=
 =?utf-8?B?eVVwNmltcm83aWJjdlE3ZllzQUdsUjZwb08xQ2FWSG9rUTRDOTVZS0ZDRHYz?=
 =?utf-8?B?aEJ5R3NHejRqU3FuUGttYVprdGJ6VTROSkZYRmFTT0h6L3FoMDVWT3FQMTFY?=
 =?utf-8?B?bUhvSkZHT29TcTBRV0d2NUJuYU41WVV5bS96R3lLTDlha0RqcEwwMW5jVGZN?=
 =?utf-8?B?VDBreUMzcmRubGRjVy85Qm00amlVSzhpU2Z5UUsyMzVGd3VwZVFGRVR3bUJX?=
 =?utf-8?B?d1gzM21qdjkvbndQbUNOQUx2U1UwSk5IS0dKckZOcFFtSXE0QThZOUJTbkkz?=
 =?utf-8?B?YTAvM0RYTGVKZjhtdWVyaTVZVDNYcFpQbTFteUJzUWcyNlF0eWlsekVxdVRs?=
 =?utf-8?B?RW5xTTNVY0tndGNQVnFlaklQM3F5VEpmVmt6MXhaQzlnUktFM2VGU04wV1Y3?=
 =?utf-8?B?dWNTMndwYmt1eWU1RGFkcFBCTHc2OERnQjVjSktDR3ZxSUxjeXZrUTRycnRh?=
 =?utf-8?B?ODJ2RlhXOTI5R2pmejhiVTl5MHVRTFg1MlMrelF6enh0dWViYzBoSGVQZlhK?=
 =?utf-8?B?YkJPRFlMUHphSEZ1YXkrSzBSc3k0ZytPWUhjWTNoVkR5WmN2UllrTC81akR3?=
 =?utf-8?B?bkxjTEhrYmRhNnpNS1dZUWVNdWxaRktrWmpFZWFxRHNJMkEvaDFBcnY5RVdG?=
 =?utf-8?B?MU9sb0RjcWpIcVN0U083S01acFVlVzVqWkcyYldickFEQ1NtVnNzZ2FGR2Vo?=
 =?utf-8?B?c1JyNEFpS1E5ZENmSWxobWdwdE1nT2RTMWdldlVDWC8ra0Z1TWVydEdZUG8x?=
 =?utf-8?B?VXg5R2txM0xUWVI2NyszRllLZjd1bTQ2Z1hmWjR2c3Q3WlNncFRGL1VXdDZO?=
 =?utf-8?B?eU1vbXZrektiOEwwOHU5dGxGYUVFY0JGcEZyNU5ydyt4K0kzb3dMTmtyT0Ix?=
 =?utf-8?B?S1NiRmFHK2pCM2dUTGtUWkFyVTZneHlpVlRsV3ZlaXlQWjNhK29hTEhRZGFB?=
 =?utf-8?B?RUJ1UEtVT1k0V2VtaXdXZWduRVNxMXFSSlZYS25yYmhJNk5sckowS0JRblhG?=
 =?utf-8?B?S0dKVlplTzM1Snd1K1Zqa09xbE1UWHJiTmk2ZFdNQTVqUlVuQVBHUXh5alJq?=
 =?utf-8?B?cVg4NGtIaTBaaVJNNGdJajE0UXUyZjVVUy83NExPMFJBZjFNaDFMU0RPb1dZ?=
 =?utf-8?Q?ms9uFSMwo9j/bi2s3rX+8EZ5h?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92af7563-101f-4a8a-87c6-08dde091e08c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 09:05:30.0243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I8UW2FrQQce1kp35Zwb+qapQCc47dKiIRPmO+cSqEFKqDn88Z5F5is6q0B3PuASVsWpBmGw3mYveN18FP16fcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7858

Add compatible string for the Cortex-M7 core in i.MX95

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index 57d75acb0b5e52ca49d1361176fdebc18a0bf7a2..ce8ec0119469c8fc0979a192b6e3d3a03108d7d2 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -28,6 +28,7 @@ properties:
       - fsl,imx8qxp-cm4
       - fsl,imx8ulp-cm33
       - fsl,imx93-cm33
+      - fsl,imx95-cm7
 
   clocks:
     maxItems: 1

-- 
2.37.1

