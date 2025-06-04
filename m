Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013051.outbound.protection.outlook.com [40.107.162.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50918256D;
	Wed,  4 Jun 2025 02:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749004555; cv=fail; b=ab3FTEpMYzoVHOLwvzf1mIWkM7IWkM1yYf4wC4WlLfIN2g39q0QL52RJ1IPGkWHVm0xdUSuTVt9C5P04fXQ9RA3EuNf8BGQsio5UMwXhcq2IX7BONXMr7oBTJ0jaGom2bD3nD/gZir0RcWbXGjXivvTtOEjjMVNoM1ecUrnTj6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749004555; c=relaxed/simple;
	bh=+7SCU8kMew/eHogmVKHdbpQgkArEfSxBk/wV7pREC8g=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=fKJphQvWhbktpb9eA9Mg6T5tUVYr/BgKUrmHtsqyOGVBDG0ckT2Q/4z1VA31rwPilWbzgeboJUGkE5v/aQy7MlJoEuuUr57mN3WJ8SH/RlgXLCnZv0c1Tlosk/r3WDCJsgYDkfHluLnEtGQvoxsRQNnaPoQiJK1mYUoaTi09Qgo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=VQlQWC4N; arc=fail smtp.client-ip=40.107.162.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="VQlQWC4N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QBwl9qW3zQrFp3W4Cm/Aj+FKKDSELrJqNGI+lsBfEvFoUoQ7TH+wSY0amJG/nqwZ8F61KQRh0zTNFB1QY9tj2M9NuQ9sLO1MNjyVfxFTpgdfjqSvaB8WQIALQ+RhbzstDvyMqTxyKLeSI77wGuajauY5KnH2Pgou4hgHRsbamNWDuV0M3kfLI7sFaik3R4m5krwAxnL9j+Nh6G6DzENEhMISyKUjGTlANljHEFn2gUIgebliE9RLB6Lvyj6/GdqNqKL1U5L8miol+j4ksiJxaLsYAZTjHi8uLX9bcbMPnbWJBIPpfVwq0Xhj7ZdsOsiWs9M5VOii5DiuvzxOdew4sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7GlzmevIjcoFbboUjH3xdIAzIYr7rNmrU39tHeEnqNY=;
 b=ct7fJOp4irH/J4MQOZOy/Fyr2VIakvk+4nQiY7Ryt7QpnC/OGzJUs2kD1i9z9DgvWC9M7l1Sz/tyXD51GgyC9JfuEOOkalhDVvyvk8QeNZtzkuPitfke9uf933hDlDNZXvTPGeGlnNnE27ktDHZcXkSTfmrZmEZJuA/I1TGSuKzDqrTme2bylAHKHIpEIk9Ic54P3vUf9kkUc88bSI7F86IyhdH8p3IeJ3yzYi4dLGdfKbELm+gPJcWa7YAL17GcXF3CtA+fN/T4PAxPZGUANPVJBwfUMg8P2Dcjyoj6JWyTv9dWiIAd7x9jUKVTogCJjmsY5Ap6VIWJPiiHaQjc1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7GlzmevIjcoFbboUjH3xdIAzIYr7rNmrU39tHeEnqNY=;
 b=VQlQWC4NF82FIak6pXBLanlpQl3rD5bV/sTfFUUzW1yBGziM/OxNAhr1tiQ1EQt5/bWg+4heSZYyG4lfrReUrMJRKzLW1Bj2MgfCnsl9PrWkMEiwrM7uc2irED1jy6mYm7llZoL6AmJSjDiflXyZaKNrpPAmddXs97eLipJktXOLo5K9HT65HZZwal1ON70ZpmnmD6fRKqLCdH/HiMqZP0cjrE/7J3SJ5ruSYpanRUOkRvKDR40LJd7t6KrSAv3xT1jVGeM+ZfVNaWyVCtK80Wy5eB0Obne/ZQXu7D3LUi25ec0AXIpzSls9dIfyy96trjQIKfY3DkXEOLt1vrC2hQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA4PR04MB9440.eurprd04.prod.outlook.com (2603:10a6:102:2ac::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Wed, 4 Jun
 2025 02:35:48 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8792.034; Wed, 4 Jun 2025
 02:35:48 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH 0/3] remoteproc: imx_rproc: Support i.MX95
Date: Wed, 04 Jun 2025 10:33:42 +0800
Message-Id: <20250604-imx95-rproc-1-v1-0-a6e5f512731c@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIawP2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDUyNT3czcCktT3aKCovxkXUNdI4OkJHOTlJRki8Q0JaCegqLUtMwKsHn
 RsbW1AKr52SBfAAAA
X-Change-ID: 20250525-imx95-rproc-1-20bb74ddc8af
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Iuliana Prodan <iuliana.prodan@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749004455; l=2140;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=+7SCU8kMew/eHogmVKHdbpQgkArEfSxBk/wV7pREC8g=;
 b=rm9kXenSlPa5B/j6SQ33zG16iXAlMBjeYGChM3lqi1YjUuyWt6Q0MAesrKq8/H0jzbktYbcrB
 ahx/KSaJxbFAShnRLd8v01gX3H1Aqghkt3KWHaDyO+rjy3jrVmGgQeE
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SY8P300CA0015.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:29d::24) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA4PR04MB9440:EE_
X-MS-Office365-Filtering-Correlation-Id: 04cb1a42-8fb2-4624-b864-08dda3108397
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NFROL21GWUl5M1p2UlYvaVlIMFA1aC9aK3Z5cHd1TzVWL1VoN1RKWnk3dFdZ?=
 =?utf-8?B?amNQQTJYRlFCNkVGd3FaYnQwRHRZcVFDOFhZZXViVkZkSHQ1Zk4wYmhISTJI?=
 =?utf-8?B?MkFGTzdnOXBXVW9xZXVpdCtNMTBXSVYwTWNGSFExeHMrSzFFK01sSlovTGhL?=
 =?utf-8?B?S3NJTEp6cmlTdnJIQzJZOUxHMHpFd1UwNVJhcnhhYzc2L0EwUXNqczYzWU9Q?=
 =?utf-8?B?WjNkRjRscEV0TVJweE5kbWJyVitFbzVybEJOeFZjSXFuZ3ZoWTdnUDA3ZmxY?=
 =?utf-8?B?Zkg0cndTaVZRck52ZWF2UUZMTkdrK3RsRHdFZUgvUVhiOVNjKzRvWlZKWEFE?=
 =?utf-8?B?OTdhUnk4N3VCdG1ISXJBVkJIb3JEd01vRFlaYzFIb3R5aHRHWHBpTTNNeEor?=
 =?utf-8?B?YnZMYjBOdmRTUHFncnJFYTIxdDFPbjFyY2FWSHJlTGlqTVY0WnhuODQzcUVn?=
 =?utf-8?B?MjhIV0daRXlvWkNYWEZmQW1ObnlrZmwzdzkwY2lsaU4wYU1QYVJtcVRqbmkz?=
 =?utf-8?B?OE5weWpGMmtUSVN4TThFTU9CMks5cFY3SUVBdVpUL2hsY29hQ1RVc25FRzB4?=
 =?utf-8?B?b2VrRDV3REhFOWdCemk5eTlZbDdHQmExWG1jVDgyVmFrMmVIR3NKQ21EY3dQ?=
 =?utf-8?B?eFlHZTZsK24wbklKNVJxVHhvdzd6WE8vMldaTy8rcmEvK1MvMHlBL0pUWVNI?=
 =?utf-8?B?U0VpeXVCUmpRSC8xMHdjWXdBVVhLVWRiQTdpT3RtVFVLMWVYSVEwZzZXRnA5?=
 =?utf-8?B?WmZZdlpyc3N1Z2VBRGhUaTNrN3h5OC96eFVjeWVVeXd4cUFQQ2xpM1ExVWEz?=
 =?utf-8?B?TlZCcHZrTzZhZmptSE8rNHN4S2NXdW1rUGxiY0pFMHYyeldJZ1ZtMkU4UHNj?=
 =?utf-8?B?VGNqZWVSTVVGRzltV0h1bUM4Q0xaZjQwUWJLakxnYXBHdzFWUGZUSFdmQVdF?=
 =?utf-8?B?SWhwQVRvQTAyTjVuME8vQml1eUx4cW9qOG9CZW1YWExNbFY2V21wSGZkUXJl?=
 =?utf-8?B?SEY0Zy8zVDk2aG1yNlZWZW1xNjJjQzZRc2QxdlREc1N2b0tUNE9xV0dRZDJK?=
 =?utf-8?B?Y09BQWMvY1hCNHBLelRITksxd1FDZmZGRzFBYzZZQjBLR2VLdkdNWkpTUVRy?=
 =?utf-8?B?MHdQU29tdFZjQ3VSbHFJTDlUWnhsSVpMaXB0ck5YOVdOYTkydXgvV1FCSElP?=
 =?utf-8?B?Mi9TNXZ6MHFpaUpJTERIbFFrdTRYS1U2N0VQVzNIeUpRc2g1NWZCSFZpZW9L?=
 =?utf-8?B?M3VxcWtXcnAxL05HV0oydmRsSDFFU2JydFZ1QTdZbzhzT3ZUS2YzKy9JR0Ri?=
 =?utf-8?B?U2VkeWtocG80Zy9LZzhwRTM1Y3hWSGU4YVlVTW15U2ZWR2JHT2ErVTMyMnk0?=
 =?utf-8?B?WWkxblVFTjFNek5hZGs2R1o5Q1NyRDJ4Z0xsN3pZYjhrR3duUE0ra3M3WnMx?=
 =?utf-8?B?NnNEV05JY25ocVNLQXR6V0k3cTNFak55bEI5ajNEVUZ5U0htUHM1dklQVk9W?=
 =?utf-8?B?b0taQ0JJL2hMREtwRUZxeG9pQUN0b0h5bExKbkxQcVIySCtPMExML0hueTFT?=
 =?utf-8?B?dlBSSVVLTG9hdTBlT3dhcGYyQ3J2OTNkZ2JmTzdzdUtFYWxMR2kyVHZBbzlR?=
 =?utf-8?B?d2cvUEw3em5BbUloK3duTUdRZWs4aTdFblRBY3ZqMmhrQTArb1BxSk8vdndu?=
 =?utf-8?B?ZG0yM3pITFNiTHpjRUx1dE1Pd3IrdTNsZHZHRjBsTndGaEcrS3V5RWhWT2hB?=
 =?utf-8?B?Ti8vNHRPU0xlK0tsbjE0OEJXTzB1Ny90ZWhzTGdLeDU4Uy95dEhyODNjakhn?=
 =?utf-8?B?YVJOMUpJbDB4WTVDclk4eS9qZmN2Q1ZuckttVU1Pc3ptY0YyQlpvSHVXcDBV?=
 =?utf-8?B?cmlGV3I4QXJpYmQ2OGQ1R3ArMFdpMGZKaFZ6Uzg4b2ptYTl0NXVDMmhMRndw?=
 =?utf-8?B?NUc1VWxwSGFEWVdZYnVLU216RldtakpoRkJsNmRxbS9IeXdBNEVWTXYvTW9i?=
 =?utf-8?Q?e9lCBTqyxmnANd1bWp3CR3Zevucq0Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXk4dUJpTjJBTUxUT2ZuQlVIV0dTN041YzlOSnVDNjZOM1NyUFhiM0wxVDNU?=
 =?utf-8?B?aFhJOTBacmo2em9CZEFMK1YwOU01N1hZZ29UcWhFS3VkY0xDeWNUOXZ4N05D?=
 =?utf-8?B?SkxESlJwZm9RTmdFTkF4elREQ0k3N3A4cTNjeE5weGlPNjRjZExkczdKVVhH?=
 =?utf-8?B?bkIrQjltWFV0Qlh5KzhaektQRlQ5VlpHTFVYRFJOd24wbUFOaGlTVUtPM3hB?=
 =?utf-8?B?RGFCN0EvYjJ4MHZqNUhWS25Fc2RUTGh6Rm9WTFlyaWUvSWY5N3JFbnRNb2FW?=
 =?utf-8?B?WVZSOFo3ZXJXUFJFMnR0Y1ZDVW1QZERrUU53a0ViT2o3K1BPZlgvVDN1dXBO?=
 =?utf-8?B?ZUJibUZCb1RYVlA1aFBQMEV0SEp4MHgyVTZxRmtEWTVUZFptdkVTSlEwQWdn?=
 =?utf-8?B?emtXTHB6SkRwUGcyVkRJR2txeHVXamdTeGtQS3RlY0JTTGxRTjRKRTVQK1B5?=
 =?utf-8?B?clBKa3RHRENGQkcrMXVncnlhUkUzaUJGNWljL3ZSaUxZbHZmbkZnZ01YbDBU?=
 =?utf-8?B?SlF2WEd1amdJUUx1TC8xKzByNm0wWHpncUcvOWhNZU1TNG12NmpscmtRSTRq?=
 =?utf-8?B?akgraU9LUkhGTHd2S2cxSnlDclNpSzR5Tk11eldxWkg5SHlRQlQ0aGgzWm5y?=
 =?utf-8?B?cmE1MmFaQVhDUnhRUkZxNlNqQ2dkK3NpUUE0NDZiTHMwRTdpY0ZNZzJYWjQ1?=
 =?utf-8?B?Q2NQYm9Yb2liYlpRb1JUSGl2SmY3dmRsMDZDNmlEOFpLY2FFREdIRC9kcHFx?=
 =?utf-8?B?N2pHZjRGL0xQa2syekRUUXI3b0V5WHVIejdBeWQ0bWtCWTA5RDVBWXZsUHBQ?=
 =?utf-8?B?UDZrZE1hVVRPYWtLVDBRMU04Sm5ZRENSejNlT1l5bEJjUkF5R2FmSDJKRGxV?=
 =?utf-8?B?VElaalFielBTdHBJWjlvdDZQN09wbkt1RkZwNWszYmxjRkM0RVorRlo2STE0?=
 =?utf-8?B?bXRMS0J4Yit2bUR2VXp0Umt0cUZiRlFiSjBYb3lUU3VHR1RKTW5tN1Bzazht?=
 =?utf-8?B?R2YzczFhc0ZmeGU1cGIwU3paYzFWQUswWm1HN2x3bFNYbmRncnVlMVAxdW1O?=
 =?utf-8?B?bEVibUFpNURBRzgxY29idms2MTh1K25zRExSRDA5ZmtFcnRVOHNMdUV6SkdT?=
 =?utf-8?B?QTFZbDVyWWs2bVNmZTYwQ3ZtUkdKU1o2NnBJSW8wOUVweTlsYy9YNnV6WkI5?=
 =?utf-8?B?YlhVRFBWb1dDZVAvbjdvM0pVRkJkTVZNdU0vRDJyNUE5dDVwZTBHc2g1dzhn?=
 =?utf-8?B?SSs0YlVyRGhsWHhrZ3ZZcXFNTlFiQXU1UmJ2VkxINWRwRDJ3ZWtOOWN5OE1K?=
 =?utf-8?B?a25zRlBKdlU5VzlRbVJJb2lCa3VIZFRMak0xK24zVUZFZ0F1eUFxRHY5SGps?=
 =?utf-8?B?U0QyTkI3blRvallXTUl0TTBXUFloSnFNdXlJdFNDb3hsUEp5dldteWlMRXQr?=
 =?utf-8?B?RTI5cS93N2NJWlhLRDdTNm9Pc0Z2NXVXN21vc2tPVkFqb0ljOGNCb0hKeWRC?=
 =?utf-8?B?MDJsSzNQOVROU0ZVNE5iSzRaQ0twTmJxUm5ZcVlPVS94T0h4RVdYZXE5Q1Vi?=
 =?utf-8?B?cms3NnJKYUV3YjJ0YlVwZTJybWpEWWFBQXc0aFVxbHJ3QlJPa0hPd1FOZXpI?=
 =?utf-8?B?SS9OcmtvOHQ4SzRYMzBkQmJoOUozak1qRXVOMzFJVHczUTJpMkdQYXVFNUZB?=
 =?utf-8?B?U3Q5MnhSNkhPL2dic1B6T3N6M0hKemZvQVEzcEduajVIODg5TEgrelJrY2Vt?=
 =?utf-8?B?Y245ZHkzOUcxZFcxN1d6SUF0VzZEdlpjYkNXQzBSVWZoSVo2U005SGVmU0h0?=
 =?utf-8?B?YWNXMXI5alJZVldheVM5T0ZHZTVEYUZzYkYvQ3BySDNFY3RDQ1h2amtXUlhz?=
 =?utf-8?B?RXB5UkUzRWswVGRLc2pNLzJqMkNoeVpnQ0YwbSszM2liQ0dLOVEwV253d0lJ?=
 =?utf-8?B?Q0tqTXZycVpGTHQ5b1hyWHV1M3E3TXUzM2ZNQW5nRXRPOWUzLzJpMWIxK0ZL?=
 =?utf-8?B?eTBKR01qYlpPUmRUenRLREUwNkxlQk9ETWtQNklId3hmNktEZzhtQXJkWmZU?=
 =?utf-8?B?c0RVQmN6TURhWjZldVNZdFBVRkFHOTZWSmdSSXJlQVB4UW16VlluaWIyUjBO?=
 =?utf-8?Q?YELzztCw4tLye9FNwGIOJAtXn?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04cb1a42-8fb2-4624-b864-08dda3108397
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 02:35:48.3839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SklBFtYngik/7EQ607SihmEzzBsB/S9lyhq7We/fUwVx/B9ddJhbR/S2DhdCtWPJIGX3gmuwU+3Ejscy4PzUBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9440

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

In patch 1, add fsl,lmm-id and fsl,cpu-id to indicate LM ID and CPU ID
In patch 2, Use LMM and CPU protocol to manage M7. More info could be
found in the patch commit log

Current setup relies on pre-Linux software(U-Boot) to do
M7 TCM ECC initialization. In future, we could add the support in Linux
to decouple U-Boot and Linux.

Patchset was tested with when the patchset based on next-20250526:
imx-boot-variant-rpmsg-imx95-19x19-lpddr5-evk-sd.bin-flash_lpboot_sm_a55 (Use LMM protocol)
imx-boot-variant-alt-imx95-19x19-lpddr5-evk-sd.bin-flash_alt (Use CPU protocol)
imx-boot-imx95-19x19-lpddr5-evk-sd.bin-flash_a55 (M7 not under A55 control)
imx-boot-imx95-19x19-lpddr5-evk-sd.bin-flash_all (M7 not under A55 control)

Patchset is re-based on next-20250603.

Thanks for Daniel helping review the patchset before posting out to list.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (3):
      dt-bindings: remoteproc: fsl,imx-rproc: Add support for i.MX95
      remoteproc: imx_rproc: Add support for System Manager API
      remoteproc: imx_rproc: Add support for i.MX95

 .../bindings/remoteproc/fsl,imx-rproc.yaml         |  27 ++++
 drivers/remoteproc/imx_rproc.c                     | 146 ++++++++++++++++++++-
 drivers/remoteproc/imx_rproc.h                     |   2 +
 3 files changed, 173 insertions(+), 2 deletions(-)
---
base-commit: b79c044712e34fe49e7b85ffafd0bd460b5c4afa
change-id: 20250525-imx95-rproc-1-20bb74ddc8af

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

