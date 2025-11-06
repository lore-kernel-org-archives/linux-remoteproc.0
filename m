Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011032.outbound.protection.outlook.com [52.101.70.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00012C11F7;
	Thu,  6 Nov 2025 03:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762399859; cv=fail; b=qz0CXNUUDi54TW+WWzir+5nRvzHEUowNUE3SX7x2DV1wkeY2ld9NQQeLBnSFLT816jF7avZ66a3J5tzsRS+sNwW0y1OXaeEHtubOeJJ05/zsVoahjg9lV03RJk/cFDqHPPvizzmBSacRvcfKhqIsMlGm4aVlYM25eAMA42TU3rM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762399859; c=relaxed/simple;
	bh=iAxfBlROukCera/YGBM9lkYOks+v8vyZ98+1X+VVr3U=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=mAQyncH1W2QsxsfDzrHGmYwn4CjsANmxK7V9g4M5Ou8lWKRfXN1VIMhJFaHgl1djrSmHQKLCBeOTH7kD0mxjP0bstI2wsNOmsJk0bRHOLu76kCLsUGASO8tqhTJbVsuy+0cEvruoshp7dCymD2HhdARUt4LNP3CjhRtLvCkn7Fk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=l91U4l1U; arc=fail smtp.client-ip=52.101.70.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="l91U4l1U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JnQD2SVvrwbN86kkMhU6MmKWj6HUsSS6G+a86PWc2svHOK2Kx9HjcMZreKKMViqj+QK7h0bKHy3zTtLO5Nxltuner2xOva1lhX7v1SSDt1BCy34IZY6qPeIw5Kay7+1UY2q8BNoFSm04KDkmqHwvcXcce58GQ4Nmaci99U2j2svPGuYbQEmelpU5TxRvaj7sgzIx1OQpRw2Waqyjzz1pKi5lPdgqOLGivd1VM6/TKzf9x4VycCdUjwF670oTHkt7h9TGJ7j+Ug7qMXHewBa5d+qpGBgIRQ8XOojFPG51AAmXW5E34ETfeMKWyDVteixgk01ROLWelhyzyFoGtLkgPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Y/MWVZL3k204caJ5kOWWewlvej/OoWjsAtFTfviSm4=;
 b=DsrRZRHfhSkL9eZ4pG3QWzL6jjTUJFqGORMfIs7BbuvKlTM5uI9SxBZf8Ezu4f5+Vco8MfTkWqLooR1kjhbO8zdlhAjX4R8wCnZBavAcbl4+YfiiMXIWULf8O2GPf+d8758WiWGcHAW7PpknwPkdR8LLQ5+t83GpjtUpBQCduRd4PSY1abHun1/nvN47oGklgP4OSW3iw2VIC6yJYQYUfeT0IaDH3jqFl57eRQDn76FtaAZ3ftibr+m4+2GNaVJXuHjXnI0kZVdT2LM9x9yzyyjjPORoGN0bf7q0nu8OrTmnXpNwo8hIH4t6sJUg+6UfnvO62lKBnhw2qB3s7srgtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Y/MWVZL3k204caJ5kOWWewlvej/OoWjsAtFTfviSm4=;
 b=l91U4l1Uf3YgNyksaIdkY3JY0/UeKFnqk1ox/mwNWbqtwOTMYmFTC3nwHiuwMtJu55TCKI/RjTupprmaVHbuNxKEmhVUWmLZc943mB+E8mGo2DvfygKTrjmSEoMfdOGCOWnZ4nMtpyg9PYtbEGXeGp2HNnQkOZXmqdhuvfTuVFdGwTHeV3MIecGlOYN/cfbQNyKF47n9wVvFt7WUrmxHmnubcR/uALd1aUj5YAh+jrsFP48yHd2n8nFvLhErw7rBge2bGbmiY3lnyLbLw8VTemD2hQGdBtublwL7uRETytc1unwoSOPYWjhuj2hTcSwLxRJGSy1G425koF+OFoqNYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS1PR04MB9287.eurprd04.prod.outlook.com (2603:10a6:20b:4dd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Thu, 6 Nov
 2025 03:30:55 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 03:30:55 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Thu, 06 Nov 2025 11:30:27 +0800
Subject: [PATCH 01/11] remoteproc: imx_dsp_rproc: simplify power domain
 attach and error handling
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-imx-dsp-2025-11-06-v1-1-46028bc3459a@nxp.com>
References: <20251106-imx-dsp-2025-11-06-v1-0-46028bc3459a@nxp.com>
In-Reply-To: <20251106-imx-dsp-2025-11-06-v1-0-46028bc3459a@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <frank.li@nxp.com>, 
 Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762399839; l=2779;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=iAxfBlROukCera/YGBM9lkYOks+v8vyZ98+1X+VVr3U=;
 b=zNB+m3wVNdhWRVZdfr1Guh4xIHNSKq3JgOFLIKlf058jU7fobSm87PL2IxD4CV1dCMRb6+5wu
 +T2nciD9TuXBm9MletFoOglEwrK9daoP3iNU9cR1e/dTlffFVzb+NtO
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2P153CA0028.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::15)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS1PR04MB9287:EE_
X-MS-Office365-Filtering-Correlation-Id: c5c584ce-1e00-4692-1469-08de1ce4e491
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|1800799024|7416014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aDdCMzZZUDhOL25TM3VyRE1XVHA5UFlmYy80SmowcG5RbUl4Q1FNNUlxTFNL?=
 =?utf-8?B?UDBwbjF4aTVsOWVDdGtQRkR0S1lGRkpqRG83bHhTQThmRm9jd2dpNzZrMytp?=
 =?utf-8?B?SzlKYndQb2U4RkVqZHNYZHFSWHRaQVRPKzFZeFlsOFp0anlqQ2RsenM3UHFx?=
 =?utf-8?B?UFkybW5FMWkxTGIrbTBQb2pjdGx5VldyWFlISzg4SS9hemNCcU84dEZQVGFz?=
 =?utf-8?B?b0FyQ1M2OHNKYkhUeG03ODcxSXlvbjh1R01zeUROZGlrblNhRmFtSm1CVFpI?=
 =?utf-8?B?WDcwMkxkbHY4ZG5JeUVSTTFhemxrcDFlZUx4Rno0RGdmaHhUQ1pOZGlZZW1l?=
 =?utf-8?B?TmRHT0dVQk5QcHZhQ1RpNTdWZDkwSGwwU1d1dlJFTFUxcnhLUlcvOXNGWVl2?=
 =?utf-8?B?dVFOWld1TDVyNklQTENpMmVEaE5lUktzSWdtbkxJMGZRVTlXc0hETG1ETjFM?=
 =?utf-8?B?alhoSnhCajNlcktZTHY3MnpieFc2ZDhMNTJDWThERGE5VUtoZncycFY5TUhx?=
 =?utf-8?B?QVEzeE5kTlJENFVkM3RaYThDYTFxdmRyKy8yRlhZT1orTUt0TktvcktOb3Uw?=
 =?utf-8?B?ZzZLcm0rRk9wY0J5YmwvZGEwblRaUXlHNk15Q1dWUzg2Vjd1WXhrQVFTZFZ0?=
 =?utf-8?B?Qno0UWRVTmpkK2JWRHhSZEd5Z3pDWUN5NklVVWd4SHZmR0lXZWVEbVlUNjVN?=
 =?utf-8?B?NXZvajIrUkx3c2kwQjJDZ3VqeEpQOVB6VWFIMExqbzNaNGFEYk9RMFU3U0FX?=
 =?utf-8?B?ZlE1dnNIZzFETU5CaDdCVHlkYWc0UzNkZlBkVlNXVnlBb1BlbEtOcXVDeldQ?=
 =?utf-8?B?eldqaWhLa2UzZnVUcnlxVVJqVlUzQnFWSmpyTXppcGZMS3J0alhBQUFIcUVY?=
 =?utf-8?B?Z2wvQ0U5S1c5UVN6L2hlbnF3L3Z0dzhzSklHUG85eC8xd0J5emwzd3ZDWmxD?=
 =?utf-8?B?SXZGR2h2Nm5GaFVQY3VIdmg3OXZ2M05RbTRFVzd5RFBQZUtXOXl6TlJQTVEx?=
 =?utf-8?B?dktvWWhwYUhoc2d3ak9zaWViSmRYSE5VKy9CaDFxYk5NV3pQemh3Z1ArV1h2?=
 =?utf-8?B?bFpEdU8xeHJndFhRSENUOXVYS1ljMHp1Z0NhampMMExRbGJRbllJS3FoWHZ6?=
 =?utf-8?B?THp2NitYV2lCSXBMTDlXSElYeUpRTE03eERNNW0zSUJMVnYrUC9qUGQ4M2R6?=
 =?utf-8?B?Qkl5SVhMcWFtWEI3OVN6YmV3TEhlT3FRNTFjWnU4K3ExSm9naHBoTDRwWTMw?=
 =?utf-8?B?ZzBDOHluWHZ2RWQwNFpUUVQvRmUyeWdVWlY2OFdqYjUxVis0SkRsWXI0NW9r?=
 =?utf-8?B?a3Z0clpuVm5yUUQ0TUEzTnlnbEpkZE9hbG05dUdpYkh3M1pPQXNMZlM2bmxP?=
 =?utf-8?B?cGRoTktQSXFIVmUrcm9jdVUxSy9idGFNUlZUbFJpc0VRb0lZM3duNnNSK0w4?=
 =?utf-8?B?cEZGK1NkY1RnOVBZSmZuQWpoMHdIRlZPRjBIbGlISTRTZC8yaHJ5eGFHQjRC?=
 =?utf-8?B?Wlppd2ppYlRhTlJDSWUzcjEvMm1iWDdCak5YdUFJalpGMmhlYk9ETDVoUmkx?=
 =?utf-8?B?NFdpYktKRXhhY1c5QnBtdjB4YlpKMFc1TkFTVDUwbmt6ejFqRnJHY2l2Tm5H?=
 =?utf-8?B?L3VQRFNpU24wNDR4a1Rwdjg2VjRYZ2ZCMi9IVHpHemlidjZpbVdpNm9oU1Fw?=
 =?utf-8?B?czdXblgrT0NWczU2Y3hhSzRaV1plQ0dHY1RXZXRjY2tVR2JpV2pmY3FHSEhi?=
 =?utf-8?B?V0UzRkc2VWZIczkrZWlIbUtTNDU2aXlSNlNtVGtkZmxOMWRIMGZlek9Qclg0?=
 =?utf-8?B?L0x1elBxajQreklhWktNNkI3MWk0RnFJa29YT3BlRkQzbGppUzUxTVJ0V0pj?=
 =?utf-8?B?R1p6UGgwSXdES2JWQjJia3FRaDloRjRMbnIwMHNobGovTjNPOFdvUUkyWmpH?=
 =?utf-8?B?SnpiUE5HT3ZFRDBMQjNaUTRseU1IV2xXV0NOOG5IaUlXNkE4L0dGNFhLT1M2?=
 =?utf-8?B?YlhaL0RGb0RLSHdDV0pvS0lCZ0hwUTYwSjM2dng4d3BVdXhDeW9vZzdiWWNU?=
 =?utf-8?B?RlZwYkhOR01ncHhaSWJsemszYytwbmVKSkdmUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(1800799024)(7416014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dkJndWZNLzVCeHBqbkRHQm1VNDRZQmJ2cmduOEowZks0MGJ5WGlJeWpmMTZI?=
 =?utf-8?B?b0F2RC9JaWtBVGgzKy84bnkydTV6U2ErV1FOYjJGZ3ljVGZFcTI0ZDZWa09V?=
 =?utf-8?B?ODMrZ2I2dmJuQlc2bTFlM1BtUHNOTXBZRHM2c3F5OHg4RjJEVk13aXdUcFpC?=
 =?utf-8?B?OTBZQ05rS3RnNVRUREpoK3BBYW1NVXUxUEROVmU0dVluMTlZYzRYRUYyQkhn?=
 =?utf-8?B?V01zY3BGOG11OTI4Uy9qanJJcmpsZTNZM3dydjFLOHpqTldmSzlNZVhvMGtt?=
 =?utf-8?B?WTRMdk1RbEo1ZGlWUDNRUXJwRW5zSndmUHppUExkazhKYk9veTdQYkpTcWhS?=
 =?utf-8?B?VUJHZTE2S3VXdFg2YzhqdElkZXhZTDNrc3AyNkdCcnRNZ1ZLWlE0WDBPaUp0?=
 =?utf-8?B?cWJ4SXRwLzVSRGRXWDZiQW5rcTRkRXpXYjZvUkdCSUxibUpoVTJnbmZrZE9B?=
 =?utf-8?B?QVhGK0xXTXFTYkdvWm1oY1N5UEhvaldnMGw2N1hpU251b29GSHZNWG9UNHkr?=
 =?utf-8?B?UU10SVRrZHJXaEowQWppVWkxRlNJb1J2N2laTkdvYXhhbUY3alFhY2xQbDdT?=
 =?utf-8?B?S0VYM1hScGh4NmNmaE9ySFRDaE5ZZXFiMlYwVlNoQUlzVE1sQmY1dnk3Q2My?=
 =?utf-8?B?NkQ5bElUd3RNMzkzNTVXOUhmWG9qcjdYWHRRVFBWS0NiK3JiY3Y3cDl1ZFBm?=
 =?utf-8?B?anBwM2VjZm1tS3pOOVcrRkxjVGRqNVp5MTN1NjZaaWYwTTRJNHc1cWFnajVw?=
 =?utf-8?B?Wm4yM0tjSWVpL1NyUUgyTEZuR2NVd0k4OGFwN3RHQUNNWmlOQ3F6QVgvNmtH?=
 =?utf-8?B?akZDbFJuV2YyZlJiVXhKRHF2WkgvVndXQ2U2VFJZamhzRXI0YSt3S1ZPclc0?=
 =?utf-8?B?WVZpa1l2NWg5a1NxdkdtVXFUdVdvSmxWdkN5Q01DWnRHd0liU250Z3BXMkhG?=
 =?utf-8?B?T3lzdVA4RURZK2ZLWlB4UGZZVnI3ekZWQ0dYMTVUWGlTazBqeG1GTEdrMlF4?=
 =?utf-8?B?M1VZVEdCWVVSZFpwbjMzckluaVFCVzBSWTJNaU10eEoxMVVqSU9DdWpQdXVo?=
 =?utf-8?B?aEYwTlRUVFdvZmd1elNpbzMwZk0vemNSN2dGZUppNkZUME05UXN4a1FJSTNR?=
 =?utf-8?B?a0FpMlR3cGswSWMwWkRkRTAxakt6QldDMXlqQ09ZS0k1RTdMeTR1dTBLRzRi?=
 =?utf-8?B?MDlTcGNVZkV2V2didzZicXNBYkVaT1lrc3JTUXlhbjlEcjVpR0grK3VlbDFr?=
 =?utf-8?B?Vi92V1VLUmF3YU5MenQydUV6YWV1bjB2Sm8xRUY4cWpCdG1CVGxvLzZsQkdB?=
 =?utf-8?B?QSthbHdzaUc1UHlJNTVuSDhOZlZzN2tFUVd0cDZLRWlqU1dNcWIwNWYvY2xX?=
 =?utf-8?B?ZEFSdVY0dlUrQnJ5SG9nSU5UcHNsYXlIWVNXdVFoTVdxaXZiY1QrV3dXWm93?=
 =?utf-8?B?NVM0L25TaDJiZVpBYVEyWDRtakdTam9RY0M0eUxmNFg0MTZBMUU3eWo0ekMw?=
 =?utf-8?B?N1NSaS9oQ2RBVHFRM296Um4zRmdIQ3B6V0N1Y1Mzd3NPZzdvNVlhbmh6RDRl?=
 =?utf-8?B?Yk5YRGl0eWVSREwvMExBNlU4NE9Sa0tFNDIrUGtDSTViK1lmTGhwU2Y4eDFI?=
 =?utf-8?B?aDhPL1lRbVEweTNocnJyWVJxZVBpY29LUjlidk05Tkppb0RNZHdqdmJQS010?=
 =?utf-8?B?UFZxRVQxVXBCMEpEYXRPMzNYZnc1ZTVUNWltazgza3NEZjF4U3NoVnM4bDRV?=
 =?utf-8?B?Z2RZYXFNbWpPdzlaZEZ2Q3hDenhqSjJIZDdmVTdSVjlhZGVTcGhORTRmRlha?=
 =?utf-8?B?aUx0RXFyQnd1SEZBYXh6cmx5QUJmdU1TamZXaXFPVGxDQkZOMm9qMlpCMDhz?=
 =?utf-8?B?dlAwQklLcVd5b29xcC9RTkpuNzQyQ3hxdGI0djkvVzBpMXpqd0s5MWYxNXU1?=
 =?utf-8?B?UjBIR3kxekdOa3BOMnF1NlVsbmg0bW9Eb3M4UnNVMmYwK3U3U2Y2NkZsdHpw?=
 =?utf-8?B?VlRrTWVGdnVRdDlhVk53ZG9nV2NWMkdOblNSZ3Q2RXVmNzdPT2dvUDlZaDY5?=
 =?utf-8?B?SWJQb2dndHR6dFE0T0hXUHhUMjRMWVhjazFUOFhGWVBrSFA1SWpSMkY1Nnll?=
 =?utf-8?Q?JCq77gW9/cJIHcHUZ1M8LXK1K?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5c584ce-1e00-4692-1469-08de1ce4e491
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 03:30:54.9633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 61Bu80WcoC2qNLBk7rIoZ7rA0Pc/4q5Wq+Gpt9HQapbQoNxnKfhUrf+BCQNCWiE4sPvffJYFAfofmEvs7EH9Bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9287

Refactor imx_dsp_attach_pm_domains() to use devm_pm_domain_attach_list()
directly, removing manual detach logic and simplifying resource management.

Also replace verbose error handling in imx_dsp_rproc_probe() with
dev_err_probe() for cleaner and more consistent error reporting.

No functional changes.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_dsp_rproc.c | 29 ++++++++---------------------
 1 file changed, 8 insertions(+), 21 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index 6e78a01755c7bdc28cd93f00fe6f74affc3d96b0..c466363debbebe8f91b908b3bffaa32e9bf8b9a6 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -1062,14 +1062,12 @@ static const struct rproc_ops imx_dsp_rproc_ops = {
 static int imx_dsp_attach_pm_domains(struct imx_dsp_rproc *priv)
 {
 	struct device *dev = priv->rproc->dev.parent;
-	int ret;
 
 	/* A single PM domain is already attached. */
 	if (dev->pm_domain)
 		return 0;
 
-	ret = dev_pm_domain_attach_list(dev, NULL, &priv->pd_list);
-	return ret < 0 ? ret : 0;
+	return devm_pm_domain_attach_list(dev, NULL, &priv->pd_list);
 }
 
 /**
@@ -1186,35 +1184,25 @@ static int imx_dsp_rproc_probe(struct platform_device *pdev)
 
 	/* There are multiple power domains required by DSP on some platform */
 	ret = imx_dsp_attach_pm_domains(priv);
-	if (ret) {
-		dev_err(dev, "failed on imx_dsp_attach_pm_domains\n");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed on imx_dsp_attach_pm_domains\n");
+
 	/* Get clocks */
 	ret = imx_dsp_rproc_clk_get(priv);
-	if (ret) {
-		dev_err(dev, "failed on imx_dsp_rproc_clk_get\n");
-		goto err_detach_domains;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed on imx_dsp_rproc_clk_get\n");
 
 	init_completion(&priv->pm_comp);
 	rproc->auto_boot = false;
 	ret = rproc_add(rproc);
-	if (ret) {
-		dev_err(dev, "rproc_add failed\n");
-		goto err_detach_domains;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "rproc_add failed\n");
 
 	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_XTENSA);
 
 	pm_runtime_enable(dev);
 
 	return 0;
-
-err_detach_domains:
-	dev_pm_domain_detach_list(priv->pd_list);
-
-	return ret;
 }
 
 static void imx_dsp_rproc_remove(struct platform_device *pdev)
@@ -1224,7 +1212,6 @@ static void imx_dsp_rproc_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(&pdev->dev);
 	rproc_del(rproc);
-	dev_pm_domain_detach_list(priv->pd_list);
 }
 
 /* pm runtime functions */

-- 
2.37.1

