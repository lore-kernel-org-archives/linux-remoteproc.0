Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013041.outbound.protection.outlook.com [52.101.72.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E07275AE8;
	Fri, 31 Oct 2025 02:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761877535; cv=fail; b=cgpq6HArbn04VPaMAeUsUaL9vLZ2kJ+dkCOEBe8oKhD4jbpMMLmUVj/L2MmUp2nguZbABmkT6hPZ5NQaZq5QgrMAZG9XYoUARoq6KBuK8VLq6J3x5vbI2RGEEPcSaDvDrSA3Pbw89rxpOamG1cmZyKxJd0wx7CubGt3LcFvP5f0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761877535; c=relaxed/simple;
	bh=ZW+UpRuUNmLo638K9Vvkna4PVr/o/Zp3Xw4GRbWiELM=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=daVnUw5IRn9iUHjBN5OfI3Lum2bFJUwqaRlNU7b6R9A3zjbqRmQuLgL0Kv/npZyZIsZ8bFved6UAAc/w8lYE7fR3+NGt7TVY0h3ePrmQ9vlLzr2NZtdCrI/yqPiVjctGXIz0ZMOWyxmOUf19Pz5+LeX/F/hkTurRv0oUVPmGgDs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WWGvJlo4; arc=fail smtp.client-ip=52.101.72.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WWGvJlo4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kTzKLvZ+kPH3R+PLLA6ynHhvoknQmZxhNjmXOc6thuAQwQolQOPc66r/tPHznexIFAvHV2uRhUGJVPJ5SUAzRJd1ciDLV27Qc4xLVUKSNfCaK/p8qhWB/FiZRzr4PiWou27Y2Cg9IymfVQn4Lnqhv6UUtxRL2TuXKqQCoMME4sMC+jaOkH2rpaU1VSQVTctZSdByEhBtQJYHAkXArdKFOQWPV+L+9qWO08wFFSTBcRBiWKsmdYajqFdyNIr1WIZzuhyVSaHjnb/934n8xbuYUU0xNRJFbHkyE0n/YZn0hsCdJ1zwAVjReev7CjkuMA+W6jXYscpN1i2kQveYeZioUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zN0e8bsqIZBcrfqCDv7sxe3ZgXvWNpsplzE9Q/b9aYY=;
 b=Nol0ztxG1vJFJVDM8a088azvcSMPtXgvn9+HsSAsH690yEmaoXc41RYMsuNryBH8HtkiXPWqGThjCs0dgk+yr+K22z3Rcb6fCkp2yRHWRea2yviv0lUETFTR3Nv7pzyb3aV4nZEP3tzFWQHRqInwDgMNnRkK4uANMS8pvrjwWkpy89ZQQXnoNL3GnuuD02+7DnjMQq/k16/E3XoqRjzEQ62zLoH4ZHS5PJPXTcDqrLq2yV9d7rZx7sYcoFCBzCQrQiWZbsWKXNkG62vKJKW+CNIvLa2O+lkLP7FFOIE9WHpspd2N8+iiaHZlFLOpANiHkB4cxBh9DSN/vKFnS/ydvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zN0e8bsqIZBcrfqCDv7sxe3ZgXvWNpsplzE9Q/b9aYY=;
 b=WWGvJlo4GN4PNXZk7jMBy/P2LEGcZ665zlxX/HRbooytyCja9TNLS96SPv3KgFydEDKYkVTJ+v+HZUcPtsWEEvE826THBw+bP9gTkakkKMZfTwSTobq27qg4/Zw2hywPpDS/vd7x+b9ROyzxWfWsYGt7pRpYXYfVWFzRfBZehaoQSlbziTeHboWSBv+9RXOpSlPZiInbjfWtyQQtO4wVX62PuzmT3lH0VLWsEKKGxXqUB0E8kWb3jjCUChDs1eDNx3Q7WGngmajPf1OMmoQiqnJ/HotIO/JOUChPvlErypSRxo0/h/TXnGma/LSEYhPpG2LwOHLoEOk1wYvSbgL/wg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA6PR04MB11952.eurprd04.prod.outlook.com (2603:10a6:102:51b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 02:25:27 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 02:25:27 +0000
From: Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v2 0/5] remoteproc: imx_rproc: Support i.MX95
Date: Fri, 31 Oct 2025 10:24:51 +0800
Message-Id: <20251031-imx95-rproc-2025-10-31-v2-0-758b2e547a55@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPMdBGkC/x2MSQqAMAwAvyI5G2irxeUr4kFt1BxcSEEKpX+3e
 pyBmQiehMlDX0QQetjzdWYwZQHLPp0bIbvMYJSxWlUa+QidRbnlWvCTqBVmXdVz45Rtm3V2kON
 baOXwj4cxpRdg7PtOaAAAAA==
X-Change-ID: 20251031-imx95-rproc-2025-10-31-34b7d0587fbd
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
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761877517; l=3217;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=ZW+UpRuUNmLo638K9Vvkna4PVr/o/Zp3Xw4GRbWiELM=;
 b=jGaNK4/ojNGx5fnRpJn/sz6UF/IYxkwcyvbF83nZCQUQaZ9O1VTy/Ir8J98lVzzfx+Q3tKjS6
 Hj1gCOc8hpyCcRXPxM6UozssRAxzz/0S14APzzmDZHuZJ4DIE0RY3QF
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
X-MS-Office365-Filtering-Correlation-Id: ce000705-ddcd-4e96-f8c6-08de1824c14d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aHFMcElBeVRwQkFkUDJUTkZTQWhZMDgzZDFaMXcvQ1p4WEFFbmdmUnMxYll6?=
 =?utf-8?B?UG5XVEFWdzN2cGdiVllTZE5tTWFvMjZiUGJBbVliTmhHV0hmbDVIZVNLSEEz?=
 =?utf-8?B?aFhEc2h3UzEwRTJFM01KNXZQQmozOGVwcmpWSEMrSGZpdjNCTVdEUWxBL1RK?=
 =?utf-8?B?MytVZlkwSEFLQ05UOVUyZ0s0NnQ1enJ1SlZWNkdTQzdzMlFjbVFGKzlSVVA2?=
 =?utf-8?B?RnlLZFRFVUFnUzdqQUo0TWJtSUZnYkN5RXVvWG9Ldk80eThNejNZVUZzbjMw?=
 =?utf-8?B?bEMwVE9XYjdqaU83SDVBVS90VlpnSkJ6Zi84SlJPRW41bW1FYTVNb1FzQkds?=
 =?utf-8?B?bEVLdktmUnltSzlvVE5pNE1tQmtTVUdmaHgyQitOS2lSWGZtaXRBQVE3Y0hu?=
 =?utf-8?B?ajJLb291U0E0U1VTSGZoa3hKWjRrLzgwTk1STklJWmpXNEltWk1WdE1scU9S?=
 =?utf-8?B?ditZb3FJbktMS0ZYWWJBemxjcTV3QXhsV21Zd2lSUVJHOEd5OWdiL2lobXpa?=
 =?utf-8?B?NFlMckd6YTVQMWRpczMyN0JvN2JGeGFCYklmY0VzSEdmV0xQRFdlSGI5ekxq?=
 =?utf-8?B?KytpWFVWMmdXY2RFMVE1RnlmeG4wbWkzMTNKZ2VjOTIxbTArVlpIcHRkSDBD?=
 =?utf-8?B?elBLb0twN09Ka3VMc3lKZUlvbDlVaEhmTHc4b0RVNllCNzhvQnNscDVsRGxx?=
 =?utf-8?B?MkUrN0YvNWg5Ymd4cDVzR1QzWWJxYW5STFpGVkk1NGxvS2R2SjRLUkRwSGNE?=
 =?utf-8?B?MWZxU0Nwd0tMNTVqQVU5c1JVWEZic1NObmxQL094TmVJN05CMDA4S2Y5Z2px?=
 =?utf-8?B?bHNPbTRYeVl2TURBVU96VXQxTUpNazZOWG11YlZiMjJPbWxCTzBuWmtPeUlB?=
 =?utf-8?B?cjF5ZkcrYnBRNEVGd1haQlliL3FVREFlVTB4RDNNMHA5cnpBelBRZWZVT1A3?=
 =?utf-8?B?eVFTRnA4bSt5QU45LzFRWkwxQVJsSVJ1V1d0N2crNlpmR2VmNFIySkN6R3dy?=
 =?utf-8?B?c3FtN3NLWlppQzJRTEwvQTNUTVFvSGVGZXo5aTVmVHIvckJqNzM2WWgxNGlt?=
 =?utf-8?B?SzJBNUFWZWhXOTJ2Vm50Qm1rSmlFM1VSd21uSW1MSlBQRjBWekM2bGc0WU12?=
 =?utf-8?B?VlBmeGl2eWhiSExOQ29PUGdmU2d0STRIcm9NMXptc1lpT0JadVFsQUhiWEtU?=
 =?utf-8?B?em1zRjJnSGtvSjI2SlJoZmYwNXlCOFd5SnFJZWwrMFZiTG1XRWNML2pYc2k4?=
 =?utf-8?B?UGtSSmFKWnRRZnpnVHZSY200a2dyNGpvWWZDdHdwWFcvTzVWSk1WanNXN09C?=
 =?utf-8?B?TUhyYVo3RUQ0a0FqVEpibWhHSmR0Ukh1TUE0bS9MY0prVEFPbHJKWlBxVHhP?=
 =?utf-8?B?UExpVFZkdk1INGFuckhKTDF2azBhRzNXL2lIZnlIMjRHR2haZnNFc0ZrWlZv?=
 =?utf-8?B?NFZnT2drNHdNRFlGcmF2ZnhWa1ZtYjZ0OGttVHh0VG1XaExxRk9QSVBiek4x?=
 =?utf-8?B?RktRZXBVY0g3TFR0ZlhhQitzbTJJUlJzWENlSDVpUm1OVU1TdWJtUnpLb1Nu?=
 =?utf-8?B?a0JLV0E0TEU5TFN2Q01UanJiQ0p3a1hRK1QycytwbDQyVy9DM0RmZ0F4dWZ3?=
 =?utf-8?B?SkJJQnVyQkhRQ0t6S3BaM1luazhGZ2V3UzNCdnR6ZTJRU1h6ejZIM1B1UTFi?=
 =?utf-8?B?ZUFHd2JkVENHYnhpNkQvZjZiSTJpNXBGdTBMMk5uNXlxT2Vvd3BGT29TeGov?=
 =?utf-8?B?QXg2UTBUK0xxaUVabU5wR1A3YU1yenBmbGY0NHlhSXp3MndsSzdUSGtVV2U5?=
 =?utf-8?B?TmZ5T1NnK2lvWGRjbmJWMExjaUxVSUlJVlFlUHFHS1F4ckVRZ0M4ZFIwaUZW?=
 =?utf-8?B?OTVFYWtRWEFLV1ZubXo4R0dPUWYvQUoyeDMwM2JoNlNKZisrbmcxN014dnpH?=
 =?utf-8?B?K0JLWDJYNlplSmtnQ2E0WFJoR0hBRzNiRkEvUEYxQTJIR29sZVB0VUNGMjRU?=
 =?utf-8?B?SHFsTjdXNm13Z1FDdGJ3ZW5tTEg4R29lcXJXSHMvWnV3U0ErdnViUGZaR0N0?=
 =?utf-8?B?NVpoTVJVclBUZzduUWRweHFlV2V1VUJPMG9SUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHY2TTcwZTVGaWsrSUhNZ0pEQjVQbEdUR0IzdzFrQmxaRVpTNFBJWW5HZ2dI?=
 =?utf-8?B?SFR0V2IwTS9SaUpWTmlCNUw2dDhVaXVRa3RBN21tNHFNVTZtbVJvRi9xeDdM?=
 =?utf-8?B?T29zeWRyQVFyTTFnMGdLZ21keE53VzY1Sk1PSTkwdVJFYWRxNWdXRUQwdm5m?=
 =?utf-8?B?UVRUdkNrOURIZFl1M0NQZFBEQjlYZ29ualRFNythSlRLZTBUMmFlbmdTNzds?=
 =?utf-8?B?ZG0vQ3Rkc0MwNElGVzVyRHBCcU5PczFvMzE3dThiZzVKZ0hZSEJCRGxCU0Jx?=
 =?utf-8?B?Wkh5ZTNhK0ttSEJmMllPeWc2djgvOHdETEF4VVc5ZzlDaEdNMzhvTjhoWGN6?=
 =?utf-8?B?U2pzSFZlaDVqbytRUmxKL052dllYblpBMXZMZ21vbkJTYnFySkNsUGM5L21H?=
 =?utf-8?B?YlBzSmhJY0hVZE1lajFhWWN1MEwrRkZ5NktaRTRvK0Y3emJpMklqaG9WYzR6?=
 =?utf-8?B?V3R1cGlxYm5jVi9KNHJKeW1ZQi8ybi9ORS9zaSszSGovTE1mS1JjdVlsbDVY?=
 =?utf-8?B?MHdoOW90d21zSm9NZ09mb1FBRGlZNENkYVdMTlgySDZ2WktCdTJ4Nm9oenpp?=
 =?utf-8?B?TGE3TDdjRGMwTkw3RWUxYWZROFM3bkovVnl4UHdxeDl4SVJGWmFMTVE3emtY?=
 =?utf-8?B?WGIwdWErbWlWZDJkNUxOcjBEcXBWa2EvUW16dS9WZUY5ZlgzVCtrTDBvb1lM?=
 =?utf-8?B?cWgwSGFaTnNZQkVVdmx0YVN1dXI5N2NZQU1DWEUyR0JvOVlYS2VvYUtWUEpT?=
 =?utf-8?B?bmNRZ0lTcVVpQ3FMMzU1SzJ3ZTI1YjQ2SmErNEMyNU1TcnhRWEZYdDVzaHYy?=
 =?utf-8?B?alFSTEwzOWNhQWtjM1lNZ2FPYVU3L1VYQjUzYlRBYy9RdDFlbWZtSXNvSnp3?=
 =?utf-8?B?S1p4T3NXR3JQcnh6azlnV3ZtT2pHVzRvZURINDlzVE9UYmlmWTEvS3FwcFJt?=
 =?utf-8?B?QWFNUElQa0gvaitzUTdkK1RSZTVzcElDTERDVHZlV0FTY2pjbUZSb29GSnNm?=
 =?utf-8?B?emcySExiazNWa0tXWHBkOWRaallrdFlhb1BUcWtPdEcvSFkrUFpPNDdlOWZC?=
 =?utf-8?B?Yk9IeUUzeGxTTEFWUGMybDc3TVNSSWlRQWhUa0ZxNHFENnJBeU8zTTVHZDFo?=
 =?utf-8?B?SWtPOXVwWWlzeFZBb0VwZ0lIcm9FSlNFTjlYbEFDY2ZnWEVsNTR4SUZRT2oy?=
 =?utf-8?B?TXBEa1kzOXJVMTF6SzVrc0s0WlVoZjZhVWh4am9BOFhXdUJrNE1mSmtJaGJH?=
 =?utf-8?B?cWpzYklCS3YyOXVKK2hPVkRKV0lxZWg3bElPc1pGSEJqTERsUmNJZko3SjZj?=
 =?utf-8?B?SXY1S1V1clJrS2wwWVkvV2lEZkRJSUtWdmdSMUVVNCtEZEx3WWNhcmlrd1NM?=
 =?utf-8?B?aUJmRVFicDIzRmhrczFsYjcxeGJ1bGx5aUhBREQyNjJQV3g2VHJwT1QyWEZK?=
 =?utf-8?B?ZldVeWFUQUtRR1kxSm9mQnVNc1p6WEQvbTFWbE1KbFd4TThFUUNIQ0RnMEhV?=
 =?utf-8?B?QWtiRVdVaTlWNHQ5WkJvNURsVGJHbTlxQ0cveG1YNzlxZGhPOGpzS01uYmhq?=
 =?utf-8?B?dTNTSlBYazNmS0E1Y1ppZ254QURFWjB6QjUvSm9XdWFyUDZoSTIxRUs5NXFZ?=
 =?utf-8?B?YWZLV05xSUtaZHlraFFFbWlmVTRsYjBDOXc1Z2k1OG83TnFDWGdJeUlRVkxI?=
 =?utf-8?B?WHJxdTlRYXZNWkxOU3IycDV5aytEVE12Tk03Z3F1ZWtKOXZ3Vy9rWDh6M0Nj?=
 =?utf-8?B?OVFxc1BrTGhYbFF6NWFYT0gvNEFsLzBIYnM5TWEvNnZpRGErZzFDRFRLL3Jx?=
 =?utf-8?B?eW5WbjJOQzFkQWttQ2lRZFVHVEd1cG1mb0tJTkNNTlpWNGNUejY1Z3pwM1lt?=
 =?utf-8?B?bzQ4bHdxMWwwYWQ2S2M1RFNOTFo4WWYwVUhRQzQ2QXJVSDVRbmxkZWh6MWtq?=
 =?utf-8?B?M0ZOcUZJSHpFeTZ3THpkZjVKY1VRWkY3eitrOHJlNCs2K3NrcHBMRWtxd1pr?=
 =?utf-8?B?MlJXMnA1UWlyVFAwRlZCVkNJZ04wd0pMSk4xVGw3cFE4eHowSVJJbm81aHdq?=
 =?utf-8?B?YUtnOGs0eDh3UlBZbVRZbDhPeU5UQXRsci91T0xKVEI5OXRId1h2K0FaWHgx?=
 =?utf-8?Q?xWUnFkIuN993/oyfFEccyXvRp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce000705-ddcd-4e96-f8c6-08de1824c14d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 02:25:27.7293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N/Y7QKS5AcHOG2C4MsORmuHm/9xC7q0U1qvpS1ziQzDNyo3esPtCpkq1lHKfdz8FrjBOAN2W4IyzZQOHPINJ+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11952

This patchset is pick up a previous patchset [1] with rebased on
next-20251030, and some changes applied.
 - Add runtime ops to separate cpu ops and lmm ops
 - added more comments
 - moved some check imx_sm_rproc_detect_mode() from imx_rproc_sm_prepare().

No changes to the dt-binding patch, so R-b/A-b are kept.
More info could be found in commit message of each patch and below.

[1]https://lore.kernel.org/linux-remoteproc/20250821-imx95-rproc-1-v5-0-e93191dfac51@nxp.com/

i.MX95 features a Cortex-M33 core, six Cortex-A55 cores, and
one Cortex-M7 core. The System Control Management Interface(SCMI)
firmware runs on the M33 core. The i.MX95 SCMI firmware named System
Manager(SM) includes vendor extension protocols, Logical Machine
Management(LMM) protocol and CPU protocol and etc.

There are three cases for M7:
(1) M7 in a separate Logical Machine(LM) that Linux couldn't control it.
(2) M7 in a separate Logical Machine that Linux could control it using
    LMM protocol
(3) M7 runs in same Logical Machine as A55, so Linux could control it
    using CPU protocol

In patch 3, Use LMM and CPU protocol to manage M7. More info could be
found in the patch commit log

Current setup relies on pre-Linux software(U-Boot) to do
M7 TCM ECC initialization. In future, we could add the support in Linux

Patchset was tested with below boot images when the patchset based on next-20251030:
imx-boot-variant-rpmsg-imx95-19x19-lpddr5-evk-sd.bin-flash_lpboot_sm_a55 (Use LMM protocol)
imx-boot-variant-alt-imx95-19x19-lpddr5-evk-sd.bin-flash_alt (Use CPU protocol)
imx-boot-imx95-19x19-lpddr5-evk-sd.bin-flash_all (M7 not under A55 control)

Also tested i.MX8MP/8ULP-EVK.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v2:
- Patch 2: Change to const pointer for ops, update commit log and add R-b from Frank
- Patch 3: New patch, introduce prepare ops
- Patch 4: Rename imx_rproc_sm_prepare to imx_rproc_sm_lmm_prepare
           drop IMX_RPROC_FLAGS_SM_CPU_OP and IMX_RPROC_FLAGS_SM_LMM_OP
           Add a bool for dcfg->lmid and info->lmid check.
	   Provide separate plat ops for lmm and cpu setup.
	   Move LM permission check to a separate function.
- Patch 5: Drop macro IMX95_M7_CPUID and IMX95_M7_LMID
- Link to v1: https://lore.kernel.org/r/20251028-imx95-rproc-2025-10-28-v1-0-ce9e7db9edcb@nxp.com

---
Peng Fan (5):
      dt-bindings: remoteproc: fsl,imx-rproc: Add support for i.MX95
      remoteproc: imx_rproc: Add runtime ops copy to support dynamic behavior
      remoteproc: imx_rproc: Introduce prepare ops for imx_rproc_dcfg
      remoteproc: imx_rproc: Add support for System Manager API
      remoteproc: imx_rproc: Add support for i.MX95

 .../bindings/remoteproc/fsl,imx-rproc.yaml         |   1 +
 drivers/remoteproc/Kconfig                         |   2 +
 drivers/remoteproc/imx_rproc.c                     | 244 +++++++++++++++++++--
 drivers/remoteproc/imx_rproc.h                     |   4 +
 4 files changed, 237 insertions(+), 14 deletions(-)
---
base-commit: 131f3d9446a6075192cdd91f197989d98302faa6
change-id: 20251031-imx95-rproc-2025-10-31-34b7d0587fbd

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

