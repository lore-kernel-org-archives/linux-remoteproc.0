Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012054.outbound.protection.outlook.com [52.101.66.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC6C331A61;
	Fri, 31 Oct 2025 09:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761901763; cv=fail; b=EIEaPr1M+ribxPuFAeR71BpkLLBjiNDYRYmk7WUP0yLxo3oQnsd1jqrbD3FYc049hZ7SGw8wgV2MbgdmdMb7m5j/NiCOB8ClGXAY0cAxrUrDdVRxSNSFd43fvDY8+hGjJdPqZ4cBcqf/qHc1viLwyeEZAwSF2FAMw2RpyR9WjAA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761901763; c=relaxed/simple;
	bh=RlzGlQnFPc/KkSI6YYktzK6jfPoQbFAXSfX40/k3MaI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=XtN0J+lB52qkgH8/WIvaCiNpB/ZMiMsZf3vhAXrhwxADHevz0Iet8PzyaueUIjn+hzSHd63nTwIUbOsvt8w8Tx/57ldaEK4kN7wb7pEtpopKyyV+YZlGU4urJLgDKFIOqiXfUWyplUbXZrSMucXDHiSpdxkLphkrkRtqSBrgBUc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KieAgvKq; arc=fail smtp.client-ip=52.101.66.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KieAgvKq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XgV26JhJxKX5iXdYL/zW52CUU+XOY+pY1vZcuFdmTN0aueFhoLNRY6+oZG28Qe0J5Byc2380EsG3f3od2gZqPESxLx5mKAGMI0b+UPjfEKZ3fve0+jB4GXnM8Je3f5cbXfGvOndJlbLNW4ibO2iWOuUBZND2fGysXOrW60eMUWUZA5BtPnJzD3LOLK+W09Xpe5OOxqxAadbPPLakXmZDNZmSjPtq4R+ASFMMamyygOPkG+PCx7Wsv0e8npHtFZbesV68V8emnyOz3eqSsGML/vJuLDmTRZfMlh3tQ4Ontkbgl1BIRZtnFdVEDkAzl9qO1CagqDE/+8bdRE80nUbl8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cBpOkBubN4heEExReyxthkzYdvVbPXcR5hSXAD2vzMI=;
 b=sPGIKotwVqtFAyaMhBI9iLms6j/pMBnwVeeTDm2BNkmT7iiveRAxyHCGAAD2KJWpQ7qjuFLE8XuX7hsqeOcnGeQ5TXg/waIOiboeLgmyRMnkvrVAGKXND2J406vW9UEHICi6Wr6P8Q2hyvHhoM/9sgTker1a3QqTbMx6k+tDBwLQuS4JrzOBZQtHsSAMRflbvQqMER1WvUfYrMwgH+tfKzZ7ubUYogiCU4XBX200141tjyk44ZWJLEjXmhw7nBfpmRn35RiNABbGO/4Ggap8B/aSQ7Q5F5mjFVjfm8Y05qQg5tkey8URZybhsrAXNVo90KChm2ij0fsVDFvu/AxWrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cBpOkBubN4heEExReyxthkzYdvVbPXcR5hSXAD2vzMI=;
 b=KieAgvKqYfMwu9zM/IiCr2MVc+NLT3PI7/gPGxWBVgPb64a7/qCRgdarxzIEsNytLZJ48m/lob4nFsNKng1uiDmOR9PBOmMAt1kcbFYmEPiFpplw0MnpHOv8CiektAOZWGcOaD/fM5hnHHzQlasp5FsRvN5NzFI8E+t6bEUiBCyx6CgIDMOqDD0cvh3wU5kpoiThK+ZIcKW1Ak6XdZeUU1BF1e7TCP8AfCAQTi27Ila7Z0CKOu7RXfaqEziMnd/XdNMhngGrxi5+L/91hz181TQBVeXXAItueCyETjcJd9l0swQXtotUE0qyl6xHM9sqHK2Gm6srBBCeTgGfQbLFAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8093.eurprd04.prod.outlook.com (2603:10a6:102:1c9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 09:09:17 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 09:09:17 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Fri, 31 Oct 2025 17:08:33 +0800
Subject: [PATCH 04/11] remoteproc: imx_dsp_rproc: Use dev_err_probe() for
 firmware and mode errors
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-imx-dsp-2025-10-31-v1-4-282f66f55804@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761901729; l=1665;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=RlzGlQnFPc/KkSI6YYktzK6jfPoQbFAXSfX40/k3MaI=;
 b=2bgP9b5cs09ncO7y4AxPhrQCMP2D7SULjKCb0+/MGCAn6b/ZRXI/1FefjfRXARB4+IUH6gtA8
 6zM5tN1TEmlD9OeTPWA9TPFKD4u+G1RyPRT74Jv7wk/C4Hu7BpL7Di6
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
X-MS-Office365-Filtering-Correlation-Id: fb0e5cf9-e938-4dba-9fd3-08de185d2b94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eW9rZzErZWNoSUJqWkhSTWRNSnR6S2xreDJxT0xpUGFLblhyOU80cmVnMWJK?=
 =?utf-8?B?MGlsTDBXbGJpald2RG43TEFJMGxVZ1Y0YXNCQ1RhSml5akxQSjNvaURpUHRW?=
 =?utf-8?B?YlhZWHVzcWx3WC9ZOWdJbkd5RG96NnJBNDdlcXVuY3RJN3lzSzBONERKbVUr?=
 =?utf-8?B?SEVrNmFWS0FYakFuaEpMUlB6M3ByR3JWcVg0OFVLVE9FeUdGVzNXaUFodnJi?=
 =?utf-8?B?YlNJK3BKNjMyUnp1QytMVG9ZZ1FCRnRkb2VIbWdWQUpROVduU2Vwa1dQRnU1?=
 =?utf-8?B?UTdNeGlhWFp2ZHlTSUdVQ05IQThBWTBDNjRpMTE1eXZMemphTGJrVWRXa0xF?=
 =?utf-8?B?Yndld0p4b3NyUy9PRkswNGVrVk9KTEVPd3ludHhOZGd1bklXWEtSTW5vMVBI?=
 =?utf-8?B?d1RpU0YxazNtT2hobkdHMmhJUXV4dUFHd2xGekVnS1Y0eFhDVGxtMFRHcnE0?=
 =?utf-8?B?TFc1dStBcmdRSkRnUnpBdmpoZ0dsTmdISmpCMUdDUGdRYWZHTnlzTHc2a2VS?=
 =?utf-8?B?MWR5amFSRGZaTVl4QUhzTGMzTklVUDZIcXZjMXhzSnR0WmlDcHROU3hhRjRj?=
 =?utf-8?B?cm1nMFB4czhwQ05vSWxqL1hIMnNjQU9PZlRETGlXRVhJeHhUMUVXaEV5WXNP?=
 =?utf-8?B?ZlFNZ1VDbDZNK2VJVC9aekYyZWlqdjE5SkdzNWxWWmJsbWhQNUNQU3puRVJQ?=
 =?utf-8?B?KzF4NC9iUGo1MHJqcHE1QVk4SkNSQmJKN3JSRXFISUs1WkZCWjJrblpLRGlY?=
 =?utf-8?B?enFIMFM5UDFtTlpoakNqUER3VXJiZUdDS25OdFZ0cTdxQjU2MnVqdDNGNzRO?=
 =?utf-8?B?bndpS29QTzlyclM5ZEgxeW4vNmkxOTFUWFAzd003TjU0NjFkS2pxRnQzSHNF?=
 =?utf-8?B?SngvZEQ1UlUyYmVzV2V5Y1VtL21lTk0zZFdhN0dFOU1XUCtYS3JLSFBnN0l4?=
 =?utf-8?B?WUFGSjFvZ0ViN3I2Y2d0dzlvODUvWGg1T3lESFhSSEhOS0E0eitRQzdBYXZY?=
 =?utf-8?B?cGVUOStpUmM3QXdJaDFnbzFRUDRrN2dkODljSk91STdKaVUvVXo4bW1nbHNJ?=
 =?utf-8?B?YzNkaEg0RkJJWEFjNjF1ODhEby9kOFBWNXZOWTk1ck5ORXVpUGxkQW1pZ0ho?=
 =?utf-8?B?RHp1V3ZiZ2JOcFJHd3Z5c28zckEzWEVXZXpaREs4cXdoV09PS00vWWgzYm1G?=
 =?utf-8?B?V2trTnYzcFJqTTFRTkFCYTdYNHhWZ01uazVHd29XUVJra05KWnRlTXB1d1RR?=
 =?utf-8?B?Rm1IM2xyTDg4M2JRSGtiWEh6c1B1ZnlVZ2NWZjFhbHd5Lzk5M2NWQzBBOHVl?=
 =?utf-8?B?RXpkdjNnZFRoR3pSVDVvemhjVlA4MEVNR2ZjSFRvaHE2OG1kLzNnNGVqTjFa?=
 =?utf-8?B?REtDK2J5Z2NTK3BsNmJiUGZPSnFFQkR2MWdBa2l3OHZSbElYRXpGT3lmV2Z2?=
 =?utf-8?B?a2k0M2M5ZkZUYm0vQmEzaGMyZHc0TGlYcmYrRHYwWlMreEhmT09RWWZkS211?=
 =?utf-8?B?SjY1dld2Tk5ieUNhTDVaTkpudU9iN1czbm1uVnA3d3puWmtoT2o0cnVveHZE?=
 =?utf-8?B?dHJudVBDVG81aHJmMGR1MVlaT2x5Mm5iTk1ydkZDb0JiUnJRQUU4TXBXL2tC?=
 =?utf-8?B?VXBib2tPU05JeDJBOGlXSzFHaTJON3NnaC94cWMra0dNMFJtZ3d6R1d6bXFo?=
 =?utf-8?B?U1hvVDBOZktGYWgrb3h6VEFjeDN3dWlIYkFONHVTT1NRUnBnVzBnWGpENllt?=
 =?utf-8?B?c1NNQWgwVmU3M0tPRktxSlRBVmFUNlJsbUVYRkJGdG8zZTA5MExobElxQmFS?=
 =?utf-8?B?dkpXekJwdXVZcXpIeHlxOXhqSkErdnM4TXBWcmw5RGVHTHJNUmxpeTFOWVox?=
 =?utf-8?B?YWZERXVGS05UVzRrS2xHY0tXZlZWREREVEFzM1JwdC8rMGE1YnFlU1pOaGVt?=
 =?utf-8?B?RDZxeEJiQ2V5SW41OWpMVmhrWCtiZGthaXlCY1FKcmNhWUV1U005VmRwaGJ2?=
 =?utf-8?B?bWVmVWVNcTBiQlg0Q2dYNGhRVnhHYUYwSlRNNnAyWHBpYi9jVnc2V2Q0TGQ3?=
 =?utf-8?B?QlVpeWFoWm1FcENMMGpLUm5wNWJtMkt1MTJyQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dEFpVVYvVmNacUpGY2pDYUZtZXFDcSs1NUdtcmFJUTFTN0xVMEMyUXFscDBa?=
 =?utf-8?B?WjNhcDJBNzF5NVg1WW55dGlYT2hMVWhMbksyblJlK09rQU5IdVplZkhFWEQ5?=
 =?utf-8?B?dTJyQTUxYkMxNVZWQUFlb21mS1FhNkwzQ0NqZVhZaUx2UDhYNjdVejZTdmpv?=
 =?utf-8?B?cVJKZW5NMDFEMGtteEhRYmZoT1pNZmFlL0Q3M0JXUEluWjZmMGFYK2g2OXVy?=
 =?utf-8?B?ckNEa1plYXFUR2hBcXBWeGE0ZmRsVzlmdzg3dFB4YW5DcHRGaFltT3RMUWtx?=
 =?utf-8?B?T1AxQ1pORExIblliWHMyaUhwVTdmOXhlT1BIdDRoa3BjR1BPSThMR3AzWVZz?=
 =?utf-8?B?eWFoOWFKK2YyK2swVTNXSGVaQVNldjFOcWx5c1lmZ2lMdDhqa0RhMTgrRFJH?=
 =?utf-8?B?d1NsSVNUUXJtU3dDVUVFUTBPSFdEL3JVR2UvYzhwRU9mcGRUbzBwdDZySHZZ?=
 =?utf-8?B?VHZnU3NORU9hb2tnMGUwTnI0QitMWERDaU9pOThrR2RicGVRNm5JaGgyZHNN?=
 =?utf-8?B?QmNFU1h5ejJxZTdld0lHVWNXY0pIY0dNVEZaY3l2bXBhdGo2ZzhSWWFvQ0E0?=
 =?utf-8?B?Ty84RkNvb1V1SzdObFZMT2JlNXZFb0I5YjVYNFlheFVBcnBtM3ZwSFZrdjcz?=
 =?utf-8?B?SERHL2lra2xxck5DanJKSHBVUGRYQjNZdHdxalhEajgyWU5kdUFWOGxZckxF?=
 =?utf-8?B?M3krRzZ1R2VtYS9oS3V6cTdIL2FQOUhEdGwwa1pFbnNBN3FYL0lpRDVZNW9p?=
 =?utf-8?B?OVBNanp6NW80YnZMcndPMFM2bTN6YlY4LzEwUTZsWEtibUJicDFWNldwK21Z?=
 =?utf-8?B?UlZQRGpIcERwVURNOW82R3BXVkZCM2kwRlNzS3M1aHpiZmVPUWwreDRLZ05L?=
 =?utf-8?B?YWhWc0xUN29PQXZRN01IK0JwT3RDWTBkSkx3MUhYZTA0RXNDaVJaRTdTRUdR?=
 =?utf-8?B?Z01BU0lwcWFzaGt3OXZ3WGZaa0kxM1dtNmVydWZXSG8zeGRXNkhpZ3lycStT?=
 =?utf-8?B?aWZId3hnUnVPQnZzTS91NitXN2pudkIxQU90bEJwczlkTlo3WS9uamVCdk5k?=
 =?utf-8?B?NDlrS0Yra2tNMldzZ1ZIY0gxVGhOOVRIRVNhNUZEaUhsbFR3TUxzSU5qUWRL?=
 =?utf-8?B?MU9lNGh6VGFIYVpnVCtkRVJmd2JwN1B3dFlUWWVCTlppakFEa0pQUWVMTzRC?=
 =?utf-8?B?S0p4djh5bndwTG5tUHVaWjkwSzRQM3hVTDhYciswRjNZQnpoSUxZNUZ4bDRP?=
 =?utf-8?B?QVJ0R1EvNk5YUTZTSDlobGZLNW1BV2sxR0psalZ0eXo5QldIWlpSdno0S1JS?=
 =?utf-8?B?YWtmUUY5MjFjQk55MVBhVlIzaHNiK2hjRVVRNTJvalZPZ3hUOE1oNjVjcEYr?=
 =?utf-8?B?aXRWZHdxeDdRZEx2M2JxMFNuNFhGMFo3SEhCWUtWVERvZW9SUW9nZUZCUHl6?=
 =?utf-8?B?bWh4cWh2eitLOUNsYkh5Nmh2TmlwU2JJRTNONE4xSHBmempRcmdad25qamNP?=
 =?utf-8?B?bDJMQy9WaDlNZVczY2VsTEhCR1RKanJVZVlmL3gvN3Nray80OG1FRVU4Unhw?=
 =?utf-8?B?WkU5NTh3aVhXdjk0WUVGRloxdTdBVWxoQXZFUzJoUDlTK3dJWW1ycnY5Mm5l?=
 =?utf-8?B?SGwzQWtWZnIvSitJUTR5V3o1Slo2N1VLVGhhNTJma2ErL0xZYlJHREVXeUJQ?=
 =?utf-8?B?ZzF3MlJGWHBZaWx5cVE5UUxKNGNtRTErNHhKUHpHWmE5SFE4UnRETWtZRWNH?=
 =?utf-8?B?alNXNUU0cHhKTXVDcmg2UzhROTlsODhXMEdoUkJSUHgxeXUwbzMwWE9hQ0NV?=
 =?utf-8?B?S2sxaXJaaWlpZWwwcTNFWWJFZzlpZUVIZWE2RE5wTy8vd1hicWE0Wm04ZnAw?=
 =?utf-8?B?NjhZeTVMVFBjampVSGNGN3o5b0wreVcyM3NMK29vTnk2REZveVpmZzhOK0I0?=
 =?utf-8?B?MGJlanh1ZUZBSmxvT1lLRGIrc09xeVFJd3pNeXMvSWZoTkQwMUtLaExsN0Q0?=
 =?utf-8?B?b25RRHAvVlVVekNEQlRNZzVnZXNXblRUaFNrN1R5QmpXQjhkckVJeHRKQTk5?=
 =?utf-8?B?TlE0Vmx2VHAzNXI3bXhJSVowUEtudXFyZkZ1K1M0aDMwejFEdVpmYXlFMHM0?=
 =?utf-8?Q?ZaPJ5+XGrI5ty9xZkFbb6hUE8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb0e5cf9-e938-4dba-9fd3-08de185d2b94
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 09:09:17.7012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ycUylTRPQ+mwQHgJYtIv8uWYbBUaBiLJvb+xB+tcZvlCkox3KYRmpV5466lOxClNa3cEFxh+YxzGLQCQnlQkjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8093

Replace error logging and return handling in rproc_of_parse_firmware() and
imx_dsp_rproc_detect_mode() with dev_err_probe() to streamline error
reporting and improve consistency.

Reduces boilerplate and aligns with modern kernel error handling practices.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_dsp_rproc.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index f5d0aec52c56664d6074272e276edb0c4175c9ea..87f4a026c05fbf1c9371058290b2d33cb94b9e54 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -1150,11 +1150,8 @@ static int imx_dsp_rproc_probe(struct platform_device *pdev)
 		return -ENODEV;
 
 	ret = rproc_of_parse_firmware(dev, 0, &fw_name);
-	if (ret) {
-		dev_err(dev, "failed to parse firmware-name property, ret = %d\n",
-			ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to parse firmware-name property\n");
 
 	rproc = devm_rproc_alloc(dev, "imx-dsp-rproc", &imx_dsp_rproc_ops,
 				 fw_name, sizeof(*priv));
@@ -1177,10 +1174,8 @@ static int imx_dsp_rproc_probe(struct platform_device *pdev)
 	INIT_WORK(&priv->rproc_work, imx_dsp_rproc_vq_work);
 
 	ret = imx_dsp_rproc_detect_mode(priv);
-	if (ret) {
-		dev_err(dev, "failed on imx_dsp_rproc_detect_mode\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed on imx_dsp_rproc_detect_mode\n");
 
 	/* There are multiple power domains required by DSP on some platform */
 	ret = imx_dsp_attach_pm_domains(priv);

-- 
2.37.1

