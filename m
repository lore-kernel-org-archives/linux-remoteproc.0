Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012058.outbound.protection.outlook.com [52.101.66.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9781925484B;
	Thu, 10 Jul 2025 12:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752149418; cv=fail; b=oj6832PKYutJ4CYfBB12+uDUeqgjwHToudp+YSGPj9YxdF2MpvIwphIWRSfF2ZIdiT/TMDKWfSCBzRD0v82QW2A/H1JbTrTrmkmvjDc8auuCMMr1OnpPU2ppaM7ImSGLj9rez74vBFtSnBO3L/DsX+ny+fEB8+lGal14U0+ghxM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752149418; c=relaxed/simple;
	bh=u8dIyJw2hLGJTIK3gU3u7njx6sZAkaB8SbJc0Aj67e0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=GiFHjaHxpmts4KWtZwwjvmMsYtbYfPa+dMnBCXtkyJD73sZQ5/s3sCVAXfd1+o0RwgZA2LbiGLH+bXHixxRwY6qZH8PohtTIQhQYaNbw84UZ6bmlRaQwUGPquR8ZuYVViGQ3KcRNofyvqqly8R9XaEVwky/+r3AxPy13Wk62Dic=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hjN5fMqC; arc=fail smtp.client-ip=52.101.66.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hjN5fMqC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N2lWUPZwoQ2nypOHo0qYbaONTKO5FlOw2dB19NHhOTtb7pB3BIFjWGAu8z6BwgtRepYfA2816ZaGrWIaoDhDLbFw8Cls7CxnYBz/KhKQtdye+CB6DnIbL/4e9HyXqLNPCVYGMkN+8HLaQHQI7OPqXY10Y8rgupy0RBHnruU2PHboFr7fqE8A8PwwaFfjnFvYRZfGCKIE04qDGtc95kYroZZvkGGTniK8yxMgtCpCh40D/9ReNkono4YPOKakH/YbtM7z8fNUKd/exkAboajmzrj2coUQ/1KdPETWe9tqha2B9JI3M6rF9PEEdTOmwx/27c6bqbSHSlTwWxVmSM9ogA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l8z+dnCP5QOoMtuc/Y7qlCPm4vLZhZxxia6yi7FpWhE=;
 b=JeQLAYtS++vNz5GR4njElcKQgjXkwZ0ZrXXqo00m2nWymi+E7+yVIySaDKaQxL1F6lZLz9pchMQuvhYe2cuk04kSC4oWlSuV79ZrRV+gIC2xue76yDNtjJn1KNPVbCH32zZzNycib94VUs+nS6tFT066ZWJJrdyr32l8ZU3BMTK5X9pfDGLR07ugp0G4qvRGHyi82V7TeBwB6TIvkyzIc6+6VTq5lclCeKlSLaD1HFVTJi53HXO45sj9MJIRPQ6BBTlWM9C9QfUMjbQinCKEON3Jy81HbFZdDi1liHFJk8Y5tLIShqXRu52LG8zweKINEye7Ra9rcnX+hxNGBl5bew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l8z+dnCP5QOoMtuc/Y7qlCPm4vLZhZxxia6yi7FpWhE=;
 b=hjN5fMqCAy/FIDuSqF2X3ezOrJuYkQMmw1MYkCT9I2ZvWKNMfawxrRWitrR0xngtvGMIdsDpEPWVWp+7UHHII8ekOtGLo5zpt0w7XWucT1/a5ddARrgHcpVJnFfMZ9KVqUzH9FUx6yKxE/zunR9pqkhKmDy9HNsF85Bx8NiyjVmavhP9etih2aXx4wv8gmI9loz3VFo52KBoX+UktPGGvRJWXRUCiV5z0BOLmDZ7FuN67RlN9kI3/MvCrIF0C7LTGaZCeX8MOV88vTZ37STOmqQdRtM3fcBG8SaCDoJhgFlGM6ZPUUCaUFTvVlrHJwaiEwFnxA/NsdM/zkCnLAe7aw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA4PR04MB7983.eurprd04.prod.outlook.com (2603:10a6:102:c9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Thu, 10 Jul
 2025 12:10:12 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.8901.028; Thu, 10 Jul 2025
 12:10:12 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Thu, 10 Jul 2025 20:08:02 +0800
Subject: [PATCH v4 2/5] remoteproc: imx_rproc: Add support for System
 Manager API
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-imx95-rproc-1-v4-2-a7123e857dfb@nxp.com>
References: <20250710-imx95-rproc-1-v4-0-a7123e857dfb@nxp.com>
In-Reply-To: <20250710-imx95-rproc-1-v4-0-a7123e857dfb@nxp.com>
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
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752149291; l=9320;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=u8dIyJw2hLGJTIK3gU3u7njx6sZAkaB8SbJc0Aj67e0=;
 b=OJgwlRPygc8q99P68W9tMFPe8MW1YvQV3iOYFZxPgjQoosCScwU9/VxeEBpZyfTQ+Y34Uv01V
 QULNl4+MeEWAUArS0+RZ0g0wdjQCDbIVXq/QO0jcBq/H7Y4LW3ucR0I
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: MA0PR01CA0071.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::11) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA4PR04MB7983:EE_
X-MS-Office365-Filtering-Correlation-Id: e6d4a074-eb61-4d13-863d-08ddbfaab8b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|19092799006|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eFUrQkJWVDVrNnZFb2ZjMEhQWkZwN1pNUElkUnNVM2RTcmtxL1lCdTMrakQy?=
 =?utf-8?B?bTRDTXM0Y1ZHMDlvdFpwMDA3UDNaRHZlNlpOQVlTVllqNWFqSWNpQXB2bXRp?=
 =?utf-8?B?RnJNWTMzNDRCd3A4bEpkWkEyY29LL3ZFbGFrN1pEK3JCS1NMWGVqSEkyeXdx?=
 =?utf-8?B?d1lwRUppR1BDM2pYSG85ZDV4YThiTjFNWHBocitvS2xiUW5aaTBkMEdsQ1JW?=
 =?utf-8?B?TFB3OHQ5OHpRZDl3VWRhODE4b05zZTEwNUJ2SldnQkg3Z21Db2ZwUWI2K1JI?=
 =?utf-8?B?UFpSZmFWc3Rud0Vkc2lEdEV2SjlvMWcwTDg5aCtGdC8rNWVBakhBd3BLK1Az?=
 =?utf-8?B?bmpOeEpNV2s4OEptNk82QUIzbWxROEdaUFlkelozeGU4cGdJc1FOQ201TmZa?=
 =?utf-8?B?YmJWOGZSUnp6NkpMUGJFbEZ6eFRGVDYvMDdJMjNZb1NuZ1ZYVVBCU3lpczVr?=
 =?utf-8?B?TDcwalQ3cEFBTW1PSXE1OWY0MU5xMnJwWXFtZjJ0ODBtcDNjb0pKSXk5YmR1?=
 =?utf-8?B?UEhkaUxja1V3SlJNTGt2MUZTa2I1dkprUEwyY2NkL0grdWs2MnoyVHdsdzhI?=
 =?utf-8?B?SjZxWDRVNDhxZk9DcnZ1NGVESGVtWG80OW45eFpodmZiVE43eVZMZkF3NjRT?=
 =?utf-8?B?TzFWZk1oelRpSW4wNDJzbkpBUlcxQ3dJYnVLT1l0NmdNcjJRYnYvYmNndlE4?=
 =?utf-8?B?SmZDV2hhRmtDeDlMQzJZRmUyN1F2em54akNPYmwrYnhQdFBTcXBxV0tETENw?=
 =?utf-8?B?MkkzYWh5QStRc25Zd2tiR2lsRmp0NnVUWGlneE1TeUNvclRkcUxwN1N6SlNX?=
 =?utf-8?B?KzlTbWJ1SUVQcVQvR2p5ZUt0SW1hSjdQWUY1dUpFQ2lDeGJYY1ZDbFp5aTVu?=
 =?utf-8?B?VEl1MmJkTUlzZEVoM3hVdHVFbkZEOE5Uam4waTVGNDdXcUFLRGdtQ25QTkkz?=
 =?utf-8?B?VlN5b2NtZFYvL3N6N2s0WUQwbE1lVUErQjdKNFhkcG5MemhtbFNCa00wdzVF?=
 =?utf-8?B?QkZ5ZmZmTHp0QlpuNWZ6UXNJWGdzOWJWS3BYMjNCZHVTWVVJTDljTS94Q21F?=
 =?utf-8?B?a0xDM2F1QjNocFlIQmNZdDIxV1NUdzFPN1VCVUJWa1gwRGFSWTQvM1M3RGg1?=
 =?utf-8?B?dC92N1MyZnhRdndmenFHV0lObXZlVkwwUVVzM1l0OW5hcUtaTU5McVUvRVJU?=
 =?utf-8?B?MHRGZGFnL01XSEJEZWtpWVVXZWpmbG1lUnlXa0hPbExzZnpkS0grbCtKWTB0?=
 =?utf-8?B?SlVRamk2STQ0MW9DU3F4RXFWVlN1RTlGVXJOb0hOc3J3S0NVWVR2NFV0TXRS?=
 =?utf-8?B?WmJMS3AybENERXZsdWlpRFRLeXIrbkRtYnowNjVGdTh4a1NKZkN2L25Wc0Ev?=
 =?utf-8?B?cmlUQlovSnJKQmFVdlVuaEk5S2l1R1dFUHdPa3BUak9zcTk1VzVrTWJNNDNs?=
 =?utf-8?B?VWZQdlUxQUFsZ3A3U3JzQ1N0V0hpQ29JdUdDMGNWREd4dUFQMVVKSWhvN3dr?=
 =?utf-8?B?SUIyREljbDQyTmtod2d6RlRuNmlNWDBWS21XMkhKamdTbXAvd1VaZVlqbVQy?=
 =?utf-8?B?UUtTckFvNXovNWEydllPTUhZb1BLektpa3VPWFdOZnRtK2s3bTdKZnBlN1Vr?=
 =?utf-8?B?TGRLRm1vN0svYXo2ZnVkR0VBQTUwUGNiR1RnWStkR2djT2hERUR5M29xclRy?=
 =?utf-8?B?K2JzZ2VmbGg4NUZROUtXWHExZTl5dXlxcXFFNHE2V21RbWJ0Y2RwbGgzamhp?=
 =?utf-8?B?M3JuNzN4cjJ3MWRYZXU2bVcxUGttcHhnV2NXM0VsWXUxdUpiNi9GL0NRL05o?=
 =?utf-8?B?Mlo2eWRWeG9JSzF2aHJhcU9kQkZwWVVUNWlnSm1POXFDTHg4anJDV25Sdmli?=
 =?utf-8?B?bUxvT3JpL3c1Sm9IcXYrb1pXaHUwQzZ6WG1ZZzlpVlVaZjRTcHRFRkVaenM2?=
 =?utf-8?B?a2lCWjY0MjhCaVJFZzJ1OFJLTzZXNHR1YmorcGZFUkZDZ2hrY0NzbDUrbUJP?=
 =?utf-8?Q?iJ3ww7khe91ZsHLHtqplos5LBWkcqk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(19092799006)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R2YydkRpeGp0cHZTTm1vemVhM001ekdpblZXVmVBTGZScnVSdktlYnlSLytl?=
 =?utf-8?B?cVdNdFNrK0tvam04QkpWRHFLOHhZbDI2cm1QSldMSXZIeUlLUXhSUUlnc3Q2?=
 =?utf-8?B?UlhHc2ZIbFVUd0t4a0NaNG1OM0YvSEdNN0RjeDF6MU9mVnBxbmkxYmw1NzNJ?=
 =?utf-8?B?Vm5uUUprbS9ubkN0c2hTV3ZKVWNsRXJOYTkyK2FCVFdFdGV1dTdOUldiNGx3?=
 =?utf-8?B?NWZ0OTQvemdsWDVHdmhLLzJieWhBYkFldzZ5RllxWXJxckJ6MkdMdCtPeGVS?=
 =?utf-8?B?SVNxMU80VFZmU2cyWVZRL1Q5TVU0eC9DWVZsMkJvWnREbHZpWFF0eTdJWmNU?=
 =?utf-8?B?dFlIYWtuTDZjeXpsVTB4TWFNaG1VMVF1RURoeEk2bWdvbDhYZ2VpT1Vld2xV?=
 =?utf-8?B?RmIvVFh4SjJOSHRzY0k5TXI0V3huc0FacHUrQUJNaFBxY0dhcDZaQmtGTmMz?=
 =?utf-8?B?b3N3UXN1UEp2UjIxVDVQZHdPUExWU25VanM2N29QWGNVUXczeEZtZXZMVE1D?=
 =?utf-8?B?b3NMMkpTc1I4ODk3aUlxTDUzMFJVVXl2b0d6VVVHWjRuMERLTnAzUmNKTjkr?=
 =?utf-8?B?OW5qS2tDZmlCVnltcjlyNHUyUDY0WldlWWlkcDlZT3RQbG1zaXA5Nnd0Rngx?=
 =?utf-8?B?QzAyUEI3ZzA2TGdPVHhBRXJTTFB4T05Gc0RTTE5BSFZrSUNVZkFEczlWQ1Bi?=
 =?utf-8?B?eXN6dUQ0WmRoU2ZNVGM4b2JtOGswOEhQQ09QWTkwa21BK0ptTTBZOUpiWDY2?=
 =?utf-8?B?aDVHU1JrZFVBRXRIbTY2bWVubVJocy9VeGRnNURYekpSQ3FqUUdvRmU2ZnVS?=
 =?utf-8?B?SVVCalpjaHpEZG1QRjIrVVpqbG14dmI5WDBVMlozbWtSRWZBWEx5ZlkvZ1JO?=
 =?utf-8?B?Skw0TlZLc2pkY2Y4eWM1QVRJOFRCM1duelFCMzgvNVJQQnF0cElYekpVZi9i?=
 =?utf-8?B?STllMjdMN0JGYXRjZU83STFpelIyNzZ6NUZEQVJxL1RjSEpNZGRhYzNLNHRH?=
 =?utf-8?B?cnFjVTNKOTRzSksyVDNXSDA2a3lyV2tKaWE2enhpbWtCdXhaUmhXRE1HT1lL?=
 =?utf-8?B?ZEt5TUhLd1UwTWtmdnpZK0NpZEtRdFNDOUlyL1VqVTBVeHBOelYvcGFUeVYz?=
 =?utf-8?B?OTlqT0kxTlpJOW9kYitzcUlETUNpRWdOVG1SRHdLUkdGaG1CblNhczRiQXB6?=
 =?utf-8?B?dUx5dXQvd2g0ajdpSkpiNitNTDQ5Ym9qR1NUdkQwbzFnRVg2SSs2K0VaQ1A2?=
 =?utf-8?B?L21OMWhObWRTei83NWpyTWZiRDFsM2d5cmU3K3g0cWc4cUkrNWZHKzJFcE9C?=
 =?utf-8?B?enpIejJycDlTS3dHUTFReENOSnBCdDNQTnhuamdDYTAxcmlnQ09BTWU2TE1P?=
 =?utf-8?B?T292dWJEY3U1c2w3R0poWUdxNjV5eDdVd1FSNmZRN2hMZjBueGptSXdvMTJt?=
 =?utf-8?B?RSsvbS9KenlCa3dWVVkzQi9JNUE2VFZDT1NQbXB1bzBCZHl2YTlCZWo5Q1l5?=
 =?utf-8?B?d1NCd1MzM0ZOdEQrSXlVWHlxN2hRRXRNa1Y1c3hKSzJBNk9ENlZqSzArcmRr?=
 =?utf-8?B?enFjNkIrTkJmeXR3a0pDeW9uZUdoYkR0T0tnYy9xbGhVSXlhZ3NmTEZBZVkv?=
 =?utf-8?B?YUJna3dYZ0cwU2FkQmpYVVYwVEkyYWlyTEhMUUZubXFYNFhtTVNDeWJ6NzlJ?=
 =?utf-8?B?dGg1c2o3czZGODVxb0NxTXhHaTY2NXNuTHh2ZnlGaTJLL1ZFTC82K3RnYVNx?=
 =?utf-8?B?d3FzakFaYmxhUGY1eEtodWlDb1dWcjhrL0JCcU1aenRLTGVta3ZtYlRKM3pT?=
 =?utf-8?B?c2p2SVpHbjdTVXUwQkIxVTJESFVTekNPdzVGbm5RdzMxTjFPbU1LNXJxeFpr?=
 =?utf-8?B?OFF4Nnh2dlhEQW5NTkZVemFXQnlvM3NVQkpPT3VhOTBMWXY4VHk0ZDE5MktH?=
 =?utf-8?B?dlpJdHhSZWV4cFovaUt1Q0ZjNVVPRVdoSllKZnM2R0hRS0IwbCtUYTdmeUJU?=
 =?utf-8?B?NEFKcTJKWGN1aHFsYmVxSlp2bXVodmpSMXpmdlpXTHZhdGZjK3VPeUwrcmZK?=
 =?utf-8?B?dDVsL0xlVEZGTHkxSktOUnYyZmZrMVUvMlVFWUIrMnp1QllVZlhrenFJNy8w?=
 =?utf-8?Q?1+0Qzyzol6XzywzGSuTjvHkZp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6d4a074-eb61-4d13-863d-08ddbfaab8b8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 12:10:12.2872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AzNIeihjcQ1YrFedX0Su77ReYnAG1KLAPeo6zRJfCqcaCfdhhf5IMJdpCl5d6vnby8uB//ewN4ZjehOfiiSl5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7983

i.MX95 features a Cortex-M33 core, six Cortex-A55 cores, and
one Cortex-M7 core. The System Control Management Interface(SCMI)
firmware runs on the M33 core. The i.MX95 SCMI firmware named System
Manager(SM) includes vendor extension protocols, Logical Machine
Management(LMM) protocol and CPU protocol and etc.

There are three cases for M7:
 (1) M7 in a separate Logical Machine(LM) that Linux can't control it.
 (2) M7 in a separate Logical Machine that Linux can control it using
     LMM protocol
 (3) M7 runs in same Logical Machine as A55, so Linux can control it
     using CPU protocol

So extend the driver to using LMM and CPU protocol to manage the M7 core.
 - Add IMX_RPROC_SM to indicate the remote core runs on a SoC that
   has System Manager.
 - Compare linux LM ID(got using scmi_imx_lmm_info) and M7 LM ID(the ID
   is fixed as 1 in SM firmware if M7 is in a seprate LM),
   if Linux LM ID equals M7 LM ID(linux and M7 in same LM), use CPU
   protocol to start/stop. Otherwise, use LMM protocol to start/stop.
   Whether using CPU or LMM protocol to start/stop, the M7 status
   detection could use CPU protocol to detect started or not. So
   in imx_rproc_detect_mode, use scmi_imx_cpu_started to check the
   status of M7.
 - For above case 1 and 2, Use SCMI_IMX_LMM_POWER_ON to detect whether
   the M7 LM is under control of A55 LM.

Current setup relies on pre-Linux software(U-Boot) to do
M7 TCM ECC initialization. In future, we could add the support in Linux
to decouple U-Boot and Linux.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 122 ++++++++++++++++++++++++++++++++++++++++-
 drivers/remoteproc/imx_rproc.h |   5 ++
 2 files changed, 124 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 74299af1d7f10a0db794de494c52304b2323b89f..11e911ac80bafbc58e10e6fec9f703a30a686c3f 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -8,6 +8,7 @@
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/firmware/imx/sci.h>
+#include <linux/firmware/imx/sm.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/mailbox_client.h>
@@ -21,6 +22,7 @@
 #include <linux/reboot.h>
 #include <linux/regmap.h>
 #include <linux/remoteproc.h>
+#include <linux/scmi_imx_protocol.h>
 #include <linux/workqueue.h>
 
 #include "imx_rproc.h"
@@ -91,6 +93,11 @@ struct imx_rproc_mem {
 #define ATT_CORE_MASK   0xffff
 #define ATT_CORE(I)     BIT((I))
 
+/* Logical Machine Operation */
+#define IMX_RPROC_FLAGS_SM_LMM_OP	BIT(0)
+/* Linux has permission to handle the Logical Machine of remote cores */
+#define IMX_RPROC_FLAGS_SM_LMM_AVAIL	BIT(1)
+
 static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block);
 static void imx_rproc_free_mbox(struct rproc *rproc);
 
@@ -115,6 +122,8 @@ struct imx_rproc {
 	u32				entry;		/* cpu start address */
 	u32				core_index;
 	struct dev_pm_domain_list	*pd_list;
+	/* For i.MX System Manager based systems */
+	u32				flags;
 };
 
 static const struct imx_rproc_att imx_rproc_att_imx93[] = {
@@ -393,6 +402,30 @@ static int imx_rproc_start(struct rproc *rproc)
 	case IMX_RPROC_SCU_API:
 		ret = imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, true, priv->entry);
 		break;
+	case IMX_RPROC_SM:
+		if (priv->flags & IMX_RPROC_FLAGS_SM_LMM_OP) {
+			if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_AVAIL))
+				return -EACCES;
+
+			ret = scmi_imx_lmm_reset_vector_set(dcfg->lmid, dcfg->cpuid, 0, 0);
+			if (ret) {
+				dev_err(dev, "Failed to set reset vector lmid(%u), cpuid(%u): %d\n",
+					dcfg->lmid, dcfg->cpuid, ret);
+			}
+
+			ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_BOOT, 0);
+			if (ret)
+				dev_err(dev, "Failed to boot lmm(%d): %d\n", ret, dcfg->lmid);
+		} else {
+			ret = scmi_imx_cpu_reset_vector_set(dcfg->cpuid, 0, true, false, false);
+			if (ret) {
+				dev_err(dev, "Failed to set reset vector cpuid(%u): %d\n",
+					dcfg->cpuid, ret);
+			}
+
+			ret = scmi_imx_cpu_start(dcfg->cpuid, true);
+		}
+		break;
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -435,6 +468,16 @@ static int imx_rproc_stop(struct rproc *rproc)
 	case IMX_RPROC_SCU_API:
 		ret = imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, false, priv->entry);
 		break;
+	case IMX_RPROC_SM:
+		if (priv->flags & IMX_RPROC_FLAGS_SM_LMM_OP) {
+			if (priv->flags & IMX_RPROC_FLAGS_SM_LMM_AVAIL)
+				ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_SHUTDOWN, 0);
+			else
+				ret = -EACCES;
+		} else {
+			ret = scmi_imx_cpu_start(dcfg->cpuid, false);
+		}
+		break;
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -545,10 +588,48 @@ static int imx_rproc_mem_release(struct rproc *rproc,
 	return 0;
 }
 
+static int imx_rproc_sm_lmm_prepare(struct rproc *rproc)
+{
+	struct imx_rproc *priv = rproc->priv;
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+	int ret;
+
+	if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_OP))
+		return 0;
+
+	/*
+	 * Power on the Logical Machine to make sure TCM is available.
+	 * Also serve as permission check. If in different Logical
+	 * Machine, and linux has permission to handle the Logical
+	 * Machine, set IMX_RPROC_FLAGS_SM_LMM_AVAIL.
+	 */
+	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_POWER_ON, 0);
+	if (ret == 0) {
+		dev_info(priv->dev, "lmm(%d) powered on\n", dcfg->lmid);
+		priv->flags |= IMX_RPROC_FLAGS_SM_LMM_AVAIL;
+	} else if (ret == -EACCES) {
+		dev_info(priv->dev, "lmm(%d) not under Linux Control\n", dcfg->lmid);
+		/*
+		 * If remote cores boots up in detached mode, continue;
+		 * else linux has no permission, return -EACCES.
+		 */
+		if (priv->rproc->state != RPROC_DETACHED)
+			return -EACCES;
+
+		/* work in state RPROC_DETACHED */
+		ret = 0;
+	} else if (ret) {
+		dev_err(priv->dev, "Failed to power on lmm(%d): %d\n", ret, dcfg->lmid);
+	}
+
+	return ret;
+}
+
 static int imx_rproc_prepare(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
 	struct device_node *np = priv->dev->of_node;
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
 	struct of_phandle_iterator it;
 	struct rproc_mem_entry *mem;
 	struct reserved_mem *rmem;
@@ -592,7 +673,10 @@ static int imx_rproc_prepare(struct rproc *rproc)
 		rproc_add_carveout(rproc, mem);
 	}
 
-	return  0;
+	if (dcfg->method == IMX_RPROC_SM)
+		return imx_rproc_sm_lmm_prepare(rproc);
+
+	return 0;
 }
 
 static int imx_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
@@ -911,13 +995,41 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
 	struct regmap_config config = { .name = "imx-rproc" };
 	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
 	struct device *dev = priv->dev;
+	struct scmi_imx_lmm_info info;
 	struct regmap *regmap;
 	struct arm_smccc_res res;
+	bool started = false;
 	int ret;
 	u32 val;
 	u8 pt;
 
 	switch (dcfg->method) {
+	case IMX_RPROC_SM:
+		/* Get current Linux Logical Machine ID */
+		ret = scmi_imx_lmm_info(LMM_ID_DISCOVER, &info);
+		if (ret) {
+			dev_err(dev, "Failed to get current LMM ID err: %d\n", ret);
+			return ret;
+		}
+
+		/*
+		 * Check whether remote processor is in same Logical Machine as Linux.
+		 * If no, need use Logical Machine API to manage remote processor, and
+		 * set IMX_RPROC_FLAGS_SM_LMM_OP.
+		 * If yes, use CPU protocol API to manage remote processor.
+		 */
+		if (dcfg->lmid != info.lmid) {
+			priv->flags |= IMX_RPROC_FLAGS_SM_LMM_OP;
+			dev_info(dev, "Using LMM Protocol OPS\n");
+		} else {
+			dev_info(dev, "Using CPU Protocol OPS\n");
+		}
+
+		ret = scmi_imx_cpu_started(dcfg->cpuid, &started);
+		if (ret || started)
+			priv->rproc->state = RPROC_DETACHED;
+
+		return 0;
 	case IMX_RPROC_NONE:
 		priv->rproc->state = RPROC_DETACHED;
 		return 0;
@@ -1029,8 +1141,12 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
 	struct device *dev = priv->dev;
 	int ret;
 
-	/* Remote core is not under control of Linux */
-	if (dcfg->method == IMX_RPROC_NONE)
+	/*
+	 * IMX_RPROC_NONE indicates not under control of Linux.
+	 * System Manager(SM) firmware automatically configures clock,
+	 * so bypass the clk settings for IMX_RPROC_SM.
+	 */
+	if (dcfg->method == IMX_RPROC_NONE || dcfg->method == IMX_RPROC_SM)
 		return 0;
 
 	priv->clk = devm_clk_get(dev, NULL);
diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
index cfd38d37e1467d1d9e6f89be146c0b53262b92a0..6fe8d975ed302967f27b7a4319a899e6f0822976 100644
--- a/drivers/remoteproc/imx_rproc.h
+++ b/drivers/remoteproc/imx_rproc.h
@@ -26,6 +26,8 @@ enum imx_rproc_method {
 	IMX_RPROC_SCU_API,
 	/* Through Reset Controller API */
 	IMX_RPROC_RESET_CONTROLLER,
+	/* Through System Manager */
+	IMX_RPROC_SM,
 };
 
 /* dcfg flags */
@@ -42,6 +44,9 @@ struct imx_rproc_dcfg {
 	size_t				att_size;
 	enum imx_rproc_method		method;
 	u32				flags;
+	/* For System Manager(SM) based SoCs, the IDs are from SM firmware */
+	u32				cpuid;
+	u32				lmid;
 };
 
 #endif /* _IMX_RPROC_H */

-- 
2.37.1

