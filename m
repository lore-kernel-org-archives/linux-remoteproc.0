Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013029.outbound.protection.outlook.com [40.107.162.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3677330B1E;
	Fri, 31 Oct 2025 09:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761901755; cv=fail; b=EvdAqK/OHGopvkdQcSJYqzAth8RcCZYVRr4vc7hYinyehdTgSYkIUxh8vbJZGfqZuTLo/VqrsuDGW3dsj/wmF6z9OG1Yyv/FeyF3PYeQMc11KoKRkpxYJBwFuf2y9B2HvoAXaz+mHH92V3jUKV06Bw2TlPL8a5i0031SlwhUECs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761901755; c=relaxed/simple;
	bh=o6K9Q2Aw99fSgol7//9P/aCOL+QNJWqllQMeV8X+hEE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=hMtXXcKeUr8wFWMJXfFmqwdct8A37N7NsTViC6cyPbtzYui9GtQxSfLO2+2C4P+n1NT4o6Tspnb8V4L6mSI4aEg6PrMEN49Fmdc4bgqbhzPGro3bKCbt4sZr1yM7MHC8ef0ZSEaATw2jkzx7r0dbFaEulJI8EyiY/V55JHLJ+RQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bHL7WGsP; arc=fail smtp.client-ip=40.107.162.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bHL7WGsP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CAyfUEVxHYOeXL2dJEVoabGnnJOXJ92fm7k8+qQm/6uf0XpAgDBwiDm65FSqEIk8/Z50MP1FS0ABBNN1sM/llQKoUIQPIkpwc3jvTsNDA0Z+qMzMfYPI4JEkBCrhbMq5kSUua2MmBGICR7t52PgpZxMDNjofpK86rgVQU1XCaaQNVvY/TuBsWkALffaejhUpGPUuJLS41cgiGiyuO3XctDLyxgKXbixC1CUIu3NNXHpXioHUb0Pm05CVCS2vksFV82ofINIDS0FtP97bMxdo8+podwLyUINGjOLPzGVQUPbhER2FGgYc1MmToSV1WSAnFy5vZTHYH0Z5USnq6FvjxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ZRLExtj3Fih9WrCAFpST8cS3eG4qMgPE/Kvnk03WFM=;
 b=TmIyoLI3FxQGaIN8tLLRKYewYuAOPLY66Yc8qeqoKEOIUD+qKmKT3mJI+awWyFVpgVJxaJxwzkk8pwYIevY41WXdHnS7t346g+O4YXi9HizDaYx+4zJ/aXorIOabMFTRXt4VUn91nwNt5GTcU1oy6c0kgViaPD1JsjzMGEmQOS7u2v72+NPRO/3mZez7jawLzPRYd9xTqTjqRcasKuc5EzVHbVUfkqATRrAruhCxabgvBibRPJ/taYwlCEauk2DcQHf1uEdfqZ9aQSfXR9qMUOxWmBTKAQg0LxiNABjYjJ4gzUaMsq4f0btR15w/yxQ7+W//OV1meIO3In3SdT7s1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ZRLExtj3Fih9WrCAFpST8cS3eG4qMgPE/Kvnk03WFM=;
 b=bHL7WGsPsnomd4f7hVugRSGtlEtkD1k3vffLdqingfUKVzPdhVk17d68I6/f2a7/5m4kqm9Cv0dJT2LsjsnHpMlZnualnSgzT++BH7nKUFJVxjnfBrBnfRXgFuud6eZ7DMYfB+UWaB4+qzVTkCsoxg0OtJwf4xafjw+Ie3oxhle0GF1EOlktqtkMgufhvaIJC9uyzKmZ412AUsor05U4BCZYwW0rC1nLiVws6K+Q/VSKRLHAN1rNutAtHi/vk1Z8Ja2Ah5Mnc71NW0KGsuYnO973dnXpzoQNllE1EvfXhxjwT+qJDt1mY8xwZIHj+rV6GeEWt9cLjGVboQe+DceTOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8093.eurprd04.prod.outlook.com (2603:10a6:102:1c9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 09:09:08 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 09:09:08 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Fri, 31 Oct 2025 17:08:31 +0800
Subject: [PATCH 02/11] remoteproc: imx_dsp_rproc: Use devm_rproc_add()
 helper
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-imx-dsp-2025-10-31-v1-2-282f66f55804@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761901729; l=1163;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=o6K9Q2Aw99fSgol7//9P/aCOL+QNJWqllQMeV8X+hEE=;
 b=tW8EcuZhQJLS0wxr/XBOt9JxRg/1Wd1Xk98Px395dBabDjosRQEsgBTJPKpjZFA9uX63K4W5Z
 L5g+PwOtFxxB8a/MZkhaXIjerGSsftgroe1Ab3gRCGlc45auPo3KvGU
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
X-MS-Office365-Filtering-Correlation-Id: 4c65632c-abab-451a-cecd-08de185d2621
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K0NVS0hxQ1FJQVVPYUMwb292U3JMQVpSa1hSUHlPRWVRYVNIWEdoS2p3RnJn?=
 =?utf-8?B?cXNZaFBhVXFrQVhzUXUvajF1RDVuamJTdGp1TVBkUk1zTGEzZUxiZENYdmlW?=
 =?utf-8?B?N3lIRFNFTFJVa29iOTJoa3BsQnJ6THlOM004Vy9oNVVlNFF4WjZsZExMd0pZ?=
 =?utf-8?B?M2JOQ2liNEdkSUJLQVdDS0gyUFdPU2RveG5kZzlBRFA1Zk5IcFJkTSt4czE5?=
 =?utf-8?B?NFpTTGFNbHZCRGkyRkdpZXFuUksrV21nYUN1Q08vRENUZEEwNE9FdG1ZTWRK?=
 =?utf-8?B?K2VrNmlRKzMrbllBWnYyM1YwU0liQzE3VlZQYXI1U1BzRWlBV2Rvblpkcjk5?=
 =?utf-8?B?alZTVWdDNk9pU1R2aCtncmxudE16L3Z0ZUg4TjJHdGFTaXJ2NUYrT0RRNENz?=
 =?utf-8?B?QU91RVIwUXhFWFFtTE5rVDlYNHlMc2U3VVlFQ3ZkRmNjZWJWcU5BUUlhWS90?=
 =?utf-8?B?UVlrTVExZlQ5SjAyNDlaZGh4UktvS2RtaTBieVlaSDZFL0dhcytZUUN0eDlm?=
 =?utf-8?B?RUFwTm85NUhrSjdLWjluUmpVdVh3MHhsd0V6T0wrV1B0Vi8rVUg4d3o5M0J6?=
 =?utf-8?B?ZFNXS2M1MmVFcFRWaFFETHI2dXdKbVJZQlB3MGxLQnhNWFJOYW5qdUlrdVNC?=
 =?utf-8?B?YzBXdUtLZ0lnanFwTlg4Wm9nZ0dYTVVQZ1lQMkVPMEVidFU4dEJMWWpzZDhp?=
 =?utf-8?B?cG9TMzlnNkJiaU5HbEhMcnJTSThiOWxhdXNJdmV4dXV3K2pXN0xTUWdhYTJq?=
 =?utf-8?B?M0QraFhjMFZaakYyMmx2ZStrT3c2MnZadkg3UUdqVlZSVXVCM2FHZi8rQVhn?=
 =?utf-8?B?SmVQcXNMN250a0FMSU81QXB1dVRCQ21OVnlJOGY1eWgxU2l4Unphbi9CaDQ0?=
 =?utf-8?B?ai9YM3FGVEpqM0ZMUXhQSkdmM0NldnFuVyt2dkZzeWRzZWtkazJxTjgzVWlF?=
 =?utf-8?B?OHBjQm1YN2ZRbWNrbG00MTc5ODZ3THlCVzlvV1RHblFnTWd5Ry8zKy9EbXFY?=
 =?utf-8?B?aWVmbXUvYmRJYzh6ZzR1Y3VZYTh6ZnJsd1o3T1FyTFMrTmlZWXFnYllRR29p?=
 =?utf-8?B?cU95eUhhR0tHc2h4MVl1QmhJbWZEU25NSlNvZG0vdW9XTUhPYzhGZTdBcDQx?=
 =?utf-8?B?cjQ3bjJ6bkQzYnM1TG9sbTArVVRZb00rejlHSTdiQ3VTUmM1Ukwzckd2MDNQ?=
 =?utf-8?B?Q041eElDQWE5VTErV0l0WXVjaGVPSlh2SWdXSzVEOWFFMlVBTmNoUzhCMUtL?=
 =?utf-8?B?dEtyNy9rYTh3R3dDY1ZjVW1ONkUxVGNhMG40ZEhpdjRGTTBLOVdqeWdqWkFz?=
 =?utf-8?B?cTNZWmJERUpZUjNERnQ3MzUzYTZNaXdPejY1WWhOWEVrZmczcjNCSXUreUpD?=
 =?utf-8?B?cForM0NwNUtiVVZ5V09MenRoN0tLcGV1TkdFb2dxZmYyZDlvUk9GZ1pVeEhQ?=
 =?utf-8?B?U0dxK3lNVzdYYlhLa0tpaHJ5bloxSlVJSDYzZTBtOTVmSEZOWWJZM0FseVZj?=
 =?utf-8?B?bjIvNWw1UW9iYVNGVm1xelh4RFdRdU1xUjMxUERhUFFDS0ZxcXF0UXlGSWJG?=
 =?utf-8?B?MEZmdU4wVktLdGs1U0dmY2Q0Q0hBZkFKb2RnN1cxSUMzVUQyQWExZ2c2OEpk?=
 =?utf-8?B?NXhaQ3pYdTRoekFTSmpWeXFsV2pFdkVac0E1MUJ3cG13WEpHMkJFamlLVXNQ?=
 =?utf-8?B?UXAreVFVRTN5cDlubDZFMXdyM1FkZWRWZWJ0VzMvdW0xQnpVekFDbXpWbkRq?=
 =?utf-8?B?YitOeUtVV2ExYm4rdU9PSkRPSjlDSGFIMHhPUlBVT0FOcDlMQmlQVW1PeDIw?=
 =?utf-8?B?TGMycDRWZUdIUGRrOUl0b3NKZi9pcHN0UHc4c3R3RGlQdWZlUW9kRTNGQVVk?=
 =?utf-8?B?cE1VK0dzS1B0R25iWWwxYk5EWUx3V0FmQUxhRFpIL3hjSkpFRGIvZFNWeVJV?=
 =?utf-8?B?LytNWHFjaWc5WmxtaUJ6SnYrMGFVQVk2bVdPNlordVl6QmZINE12RlY4dDN2?=
 =?utf-8?B?NlM5eW1YQU94WnYwdHhGam1ZNjNuRVp6anN0UHJEMXVsdVlPd1NSZzN0UXNR?=
 =?utf-8?B?N1RqVmZUb0dIQkkrU2FjUmRWT3dPczdxa0wrUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QlNCRitMZGJVTUpNNm84YmRFWmQwNTJpdlJkSysvbnpxSGg2V2FHdk1mSy9p?=
 =?utf-8?B?WHhTZE1oWGthTS8veEx6bGM0ZEp2c21OT0xuMkMweHNNQUZJekdkTWJnSzFq?=
 =?utf-8?B?czVnWFdId2RJVVlPakxTcXpBOG5xQjlJY1JOV3M2TGRsMGs4TEVqTUExREw0?=
 =?utf-8?B?ZXlHcGRiVGNPczY2aUM0R0x1MnlNY3VPSXd5VEk4bG1GdUxoTmErUE5hcWhC?=
 =?utf-8?B?NERFRE5iQVp3TU1MMUpwMUxlWmRFL0hVREVqd2QvYWNxcjRBdkJlT0YxZUtM?=
 =?utf-8?B?QjNOblFGU1BNYlFwMzNlNnJST3JObDhXMlhsdnpBM25oMVdwaXEwUUc1QmVq?=
 =?utf-8?B?ekJMZVgzY0hPL0UwV0Mxb2Z1bkRvSVBvNGlONTNIRytjZmxtNDJKSys2TlBw?=
 =?utf-8?B?aENXd3QvQkkwNjh5eEhUU0ZPY2t0dFJkcnlpdGNyYU8ycVNOL2FEeUpheGRJ?=
 =?utf-8?B?d2l5UXFxWTlQejF3N0hkaXl6TC9lUzB3bHZLbDc3RGs5SzlBdVY0cERUK2FE?=
 =?utf-8?B?NTlVVjJUUmNteHN0MmpHUnl3R3VJSkpqUXQwbmlsNk1DbXNnT2ZZdkxNb2J0?=
 =?utf-8?B?NGpnblVGS21rc0h1R2xZbWg5WFRsdHFJUm9iV2RxVzBvTTZsYjFhcGVhMWlG?=
 =?utf-8?B?cUVyTGVCaHZuL0VFRy91aENqaE1zK3NLYmc3OXpPY2J1VjRyV2JHRDlWWG1v?=
 =?utf-8?B?WHhGK0NlRTFJVkd1Z3h5T3FHMHFLcXArSnRhcFBhWi82SjRobFBmdmU0N0ZH?=
 =?utf-8?B?WTBiSk03a2dpRkQzSjI1UjJvM2NGS244NXl2ejJLV0ZYS05oOHlCK0NoRTcv?=
 =?utf-8?B?ODAwNmFXK3Q0UHpaVk9xVFBsQXl4QnZGVXQ2Mm03MHBDeHIyNGZha2RqUUdC?=
 =?utf-8?B?emtpOEtPU3RjeWtoZkVHeTM2QVlDNVNCYitKQUp2SFpRM1Rmd1c0SW5XZlBk?=
 =?utf-8?B?SS9WY2tVUTFQd1ZsZE1pcWdqeUJFNFYxZVIyVmVZaWNxc1J1M01PUTQvdTh0?=
 =?utf-8?B?MHdaL240NTdzZ29ha0dCK0UzdnRWNzdOaFZDVmpDVGJUUkd3RVc1UGhhZzZN?=
 =?utf-8?B?V3NOV3dkaXgzWXdWM3htQlNBSTRRQmxBMG1WTWNzK1drNzk2d2hwQUNOcUh4?=
 =?utf-8?B?dW9yUHBSTlVaL2lrRFN1ZzgvZXJ2c1p0YnlBNzZNV0VQRWlpVzJoUHlvaGNs?=
 =?utf-8?B?dDV6VVZVL1J6TGRtYXAwV3VIMDQ2emlyM3p0Rm16WVUra0NKQ0dTVHBya21h?=
 =?utf-8?B?VXlqUGEvTytWMWkyTTNJYTVOL2ZuWU9Zekc1dXR0L2pZTnpmMmxFelBqVlVo?=
 =?utf-8?B?c3lSbnZ1Q2oyMnBuRW5PanR1eDJyOHp6aW1aTmVXMFlGMWNJRm9RL3Z1MzR4?=
 =?utf-8?B?UXVvbXBZWHVCN2JqZzAwN3B2bjNlNEtJSDNFZ09tWEdDSEhhRDN3dUgyZWNC?=
 =?utf-8?B?UFlWb0c3d0Y2ZUdDcFFveU5Oa1Q1UkRNUXp4dEFzK2xzSzFlM0dWbk1RR0t3?=
 =?utf-8?B?T3hBQkhndTVMUWY0V2l2SzRFbnJxZk1IbjllOGtxMnJwblhjbVhnQmFrLzRL?=
 =?utf-8?B?L05PQkE0TmsxSGY5MWYzRm1BZFRJVzhxSjAzT1lOMFJZL2hBTlpHNXpERUtq?=
 =?utf-8?B?SXg3ejVFZEVzQTIwbkN3REphZ0lVcWlwdTBPSjAxcHlRMVIyR1BzRjhoTlVC?=
 =?utf-8?B?WkhqbXpDWDU4WUE0UW5kTHF2WlFydko5Z2trMjFCZkMybFFkWUFXU3RKV3dt?=
 =?utf-8?B?QWZ6UWs3aURjZjdiSFdWQ3NCNWpyMVdLL1dPcjhMSUYxQlYwcy9sSko3aExp?=
 =?utf-8?B?Z0ZPUVdETGx5L0lTV0lHSHlEbDdEZllWcmdNaVlVM2psK25vUDRrNE1ocUlC?=
 =?utf-8?B?RjUzRTlnY012eGd4UDlhVEI0RHVzQUtwRDZnTnRGcHg5OUNFMk9DZ2FIcEJD?=
 =?utf-8?B?VittNmtwSVhZMnVvc01JcW9ZTSt4NVBqeXh2aWhzTTVJZm5PbWxMRjJJS3ZB?=
 =?utf-8?B?NDlwK0ZOTUJlZ0FQdXNMdEhqSU1YMUlZd3ZUNHVETTZyZ1BraDI1cDZhSGhL?=
 =?utf-8?B?aEJRRGgxcDJMT3pPV0NFQzNtOTVudnorRTBRMWpjYWhZNjN0dG9Kb0xxRkZw?=
 =?utf-8?Q?9YWhjdEkfC0JX3o1ZFVA3PdA8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c65632c-abab-451a-cecd-08de185d2621
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 09:09:08.5410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EN5qQa1BrVKGf3whYEjnryE+o9fS/ekfeeiGW0MRmhJwaHJcd/P7QzYA0xNmRnzeTybT3uX9Dwgo2fjTEsvTYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8093

Replace manual rproc_add() and cleanup logic with devm_rproc_add(), which
ties the remoteproc lifecycle to the device's lifecycle. This simplifies
error handling and ensures proper cleanup.

No functional changes.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_dsp_rproc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index c466363debbebe8f91b908b3bffaa32e9bf8b9a6..df6a4126538d22ff6e02145edb5ac13c2d72c949 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -1194,7 +1194,7 @@ static int imx_dsp_rproc_probe(struct platform_device *pdev)
 
 	init_completion(&priv->pm_comp);
 	rproc->auto_boot = false;
-	ret = rproc_add(rproc);
+	ret = devm_rproc_add(dev, rproc);
 	if (ret)
 		return dev_err_probe(dev, ret, "rproc_add failed\n");
 
@@ -1211,7 +1211,6 @@ static void imx_dsp_rproc_remove(struct platform_device *pdev)
 	struct imx_dsp_rproc *priv = rproc->priv;
 
 	pm_runtime_disable(&pdev->dev);
-	rproc_del(rproc);
 }
 
 /* pm runtime functions */

-- 
2.37.1

