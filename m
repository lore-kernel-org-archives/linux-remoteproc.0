Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011056.outbound.protection.outlook.com [52.101.65.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3FE280017;
	Fri, 31 Oct 2025 02:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761877542; cv=fail; b=HIk2L3YLgLZXtxIPahThrP4dn54CKVIVeMVsLi0nXi/bf0JkD3kcbpK+YptMsYQvykh+kMpDZS22ehX/NDyvNVFSa1Kb6I1NtXdMxUduorEDxjPgN+4WcxTyKstkk4v4R8Q84HB2JW+OuDXdNWm2f7/HRfO9N7yJGlj74GjX9SY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761877542; c=relaxed/simple;
	bh=8v2hYF/0sWcgV67gJy5en+tQ8S80kTzSIt/TBXI6mk4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=km/rBjErRSLQaIScVarUQ25xC/an9MKgZImA5RHTg9lmvTe24AeQuJkkA6EdcmIPTMIYVWWxC+iv+kteeqUcvsv5fCw8bfYXUWLO70suMH1foQccpsfJ7zPk9VQ9STuFgGFD9mVLRWS3pd0/8TfLrLhvkrNJKM5d5Y3dwEotg+Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YBMiKA5P; arc=fail smtp.client-ip=52.101.65.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YBMiKA5P"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FOApuRA43iBEg0P3EIJmQG7Hgz6DJu6aCfA39OT/bOY4N7uyHgEcMSY/cPJEDwtexAgxPYUgF+6eY+AEinTf5dMF8v1k6rJr2lBGgSOzhGmSt3+pn/2xCm2+bJ7SZf8qZXTy2di5SmYd2To/THdLTXbYqOa/PckFyzP9rNCCaE4inewab6WWn+J9wPyfdXukchVeHxASYwCdc8L1kIFMotnCrR/wrxhPQVk9YEYoq5p3DKYHcxhCuNvWZewwhg6d8lZ+ZcGIpaS5/T7upwCYR4Tud8Z9gM9QqVM8EA0bM4dpA4g+PjAFIngA5GNPwGL5XkjE7AF9IlP7D58oIvU4mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T8AP3h0rI0P04iD4I8G2oM+OfvXGE3Upzcp3b/EIVeU=;
 b=GynXQn1lun2WxT8sPCxHrFNfkgngkfZPd9i4seOIk0X0JpPCkbg6meUplT3WbeKfraxyje2pBMmUJ2PaqWngThiLxTPd2BnDRRKlWhihANnBdVTXSExnQyATPuutpO3/pLUvVPTZTxzFFqeujzPcUtfw17FQ6i3qEQtj7k1seaN5GE5j0nf51xlKoaF5D0lZ4O336KSLIlb6Vg04vlxZVkXzqG7gAeON+vpUZ76C+NtmVJu1N4/3Uprj8spTK5b0/b6rIE0hiF/25VK0qNz+E532aDsedQZa6vYE+wSTtkTS9k1+gE+T/CSG94ULJ5OIcFBBj/4QNhyhp/d4Y1GuQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T8AP3h0rI0P04iD4I8G2oM+OfvXGE3Upzcp3b/EIVeU=;
 b=YBMiKA5PLQS5/d3ne31TH6ttyA2o9GMkS7Bqec+5bVCcZrrwccwQRmcZOV6Vg9HlJMQnDXb16J6U+utUKjJ0f5XGMapUb2tFZ+SnvT1B95Jz3KmDmHsCEuOVJEYyyr6jh/oJlhuDWy3dSu6NS1uBeqbuJ5dYTItIEVj7dWOoVs1mdxOvofoG3//Tehs+HJhK2oXJOWS08S8GAyy/jC5ZYBoW1YnHBQOK7hkKFQSedZKzYOBCHpUGiSfndswZnmee1dQP4+2Lt0gYoIRUTE1/0gtZcINanQAI2JCImU/OgOzftWBJFaLV23jXtsbsEzk4vqFZWOfCTRMlcbD8U9mRLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA6PR04MB11952.eurprd04.prod.outlook.com (2603:10a6:102:51b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 02:25:38 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 02:25:38 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Fri, 31 Oct 2025 10:24:53 +0800
Subject: [PATCH v2 2/5] remoteproc: imx_rproc: Add runtime ops copy to
 support dynamic behavior
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-imx95-rproc-2025-10-31-v2-2-758b2e547a55@nxp.com>
References: <20251031-imx95-rproc-2025-10-31-v2-0-758b2e547a55@nxp.com>
In-Reply-To: <20251031-imx95-rproc-2025-10-31-v2-0-758b2e547a55@nxp.com>
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
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761877517; l=4059;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=8v2hYF/0sWcgV67gJy5en+tQ8S80kTzSIt/TBXI6mk4=;
 b=94Q9Utop0pumlxIFGxLShUapMOy6ZYGhhVZTp6gwcmkbH1eLBtQII2TlBe0agacUIkCYT9pTq
 BouPZmNMjzKDSdODeTVG2qgZclnET5Zuy/g5NrjGoLr0A3jhGdXzx3A
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
X-MS-Office365-Filtering-Correlation-Id: d903f5bf-bbd5-4eb5-93c5-08de1824c7a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aXNPYVdpckZCdlZ3K2pDd1VPMHNDYlNTb3lGMW5OeVhLNjEvQUFUeHFQVXpM?=
 =?utf-8?B?WFlUVVZRWkY4djVhaGc0VVJZcWlYZTEzM3dlZnVvUFR5dzdnQkI3OVBTQTRx?=
 =?utf-8?B?RE5MMzNrV21PbVY2WEx0ckI4aGRldUNDVVBRbkRvVUl5dWVrR2pVZlR4L2Jz?=
 =?utf-8?B?dE9Mc3pIQm9GUTJZdDc0QnMyaXpiRnVyaGJTNk5kdkxSU3pYMlpucUNnU2dS?=
 =?utf-8?B?ZmpUNHd4OTFYd25DZDJsazRndzh4ZXJOdm53RVBVKytOVnB0ZnQ4RHFmczB5?=
 =?utf-8?B?MGs4TU8yZHEyb28vKzJ6d2RoMnpiQWlkYStCcWRSNnJRYkF2Nzk5bXljeUhQ?=
 =?utf-8?B?VlYvcEorODk4NC9EM3g1MU41NUVuZnV0MEF2WGRZN1JEVDRhTjNqQVhmK0p5?=
 =?utf-8?B?OGlkZ1RZR0hmYndjTllGUjRRMHlyLzdmb0FTWFhTcG5zUThiZUxOZVBMaGlr?=
 =?utf-8?B?cUlMTzhJdUNxMSs4Qm5CNVQvYm80OGM0U1VCZkw2YnZjRUxJUXZiMkIxUmZ5?=
 =?utf-8?B?U1JLVDhlYTJWcFdPdTJmdkFHejZyTXluTVE4SlkvcFlja00vcllUYXJiNUFl?=
 =?utf-8?B?a0tWYStoTWZxVzFxc2JrMXNJVEJCeVhrdUFudVJpWGZ4TTdmUlVHU0pRVGkw?=
 =?utf-8?B?T202MDRjM0NKbUt1TUYzdjZsRVlDMU5zR0g3dUpkMkNQZjhoOHoyUDNPV1Vm?=
 =?utf-8?B?RDhOL0ZENWo5dGxCd21xTmUycXpOWmcyaTNVV0pyRjVaY3p5dUlDdkJOajVR?=
 =?utf-8?B?OVpKOXBnTXdoU1VsQzBQemNwTlI0c3FNZXY0cS9Iak5CZ0ZhZkJwMHVuTmxs?=
 =?utf-8?B?U2d4ZjE1QUo5MG1Ud3M3dEliS2laazZOWHFyWThhUy9kZEhOUjJzL3VuZGl4?=
 =?utf-8?B?eWFWVWJDOWpjbjdZdU9NZWJJZCt4ZHREYlNlbFVXRkk2TFQvOGR2Y0Y0TVpL?=
 =?utf-8?B?WW1qRzlYbUYrUS9aZnpVRlJvYTdLVzJSeVpFVEh5U1UxaXllclpMSzI5SmlJ?=
 =?utf-8?B?dUhVT0lOY2JkRElQNFB0aDdDM0JIR2FkdzhrTHhySTJ5UU90NHdoVEdjUXpm?=
 =?utf-8?B?UW1iSFhkdkVFTDRGL2grTUt2SDlTSis1c2g0bFp0RDV0dlZKbklBTkd6czFL?=
 =?utf-8?B?VDVxR3g5cFNXWjlTa0NXVGlRNk1jS2U5cUdTdHJSUm13d2RrQkJraFRFZWVW?=
 =?utf-8?B?VExRMnRKTEd2ZE1xM052Z3pDU2RCaHRIS1JxSTlxanltbmtVdmo5ZFlmWTBR?=
 =?utf-8?B?ZDZKSm5hS0lBeFQza3pSQUc3S3I4VUV6dE1STFFLUVZOZHg0NGxiTHlZR1J6?=
 =?utf-8?B?Nm5GcExrdmlIdytocU1kMWpGUWFFUTRnMmVnSFV3MnRIdVZJYUhDZjRVTzRM?=
 =?utf-8?B?NjFQdGw1VS9FRkhoQU8wNnA3bHNVSXpWbkFwVVF1SHhOcFh4MWNuR0JGMHBy?=
 =?utf-8?B?blYxWml4WXVUczh6Z3NnNmhET1FoenVkcnNOUC9JM1FzZ0w4UlBDL0toait4?=
 =?utf-8?B?aEFneFlmd29KTW04dFZtM2pwZ0xMSi9wM0FERVBwNm9GdFZzNTArUVFDVG94?=
 =?utf-8?B?NEYvREI0TW5ZU0RuTG4wa05sOTdHL0hqQXJGSjIwY1ZrVDVYTGcyaXY5MENj?=
 =?utf-8?B?Z0o0TUdwQjYzWjNCdCs1Q01aOFUwVEhIMUFOZHEwMHdNNnlwblJmbkpFUkE2?=
 =?utf-8?B?VCtkN3JXV3FXVlZPL1UwS09seGY3WmJIUDZWbXVtL2FNWE9IbEtYdkR6UEcr?=
 =?utf-8?B?M21aWWdxczE4UVNDNHM4UHJldkJtU25rMy9BS1pjendxVnhjNWl3RG5aVCt0?=
 =?utf-8?B?NDVnQldscUxET1lGeUZoMVNRMFVScCtnc2NqbE1JMVV4NTVhRVMzZjlqeGJt?=
 =?utf-8?B?N2U0MXRGaWQyZ1M0bXVHWGZ1N2pEYmtjOTRXTEo0dnFuNldKTFN1TGx3S2Rq?=
 =?utf-8?B?T1ZlWVRySXF5aCsvVGl6VzZGclNSckt0cExWcEd5bDc0WjlmbmhSalpMUDha?=
 =?utf-8?B?NnZvQjg5dXRSUUd2dXRPak0yT1BKVThVYW4zNGFWTm9KOWlhTUZ0b2dySnZ2?=
 =?utf-8?B?WEE5aEFIVHRCSFp5Q0NobldNQk05WWVuYm1Pdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ai9lMWh5UXgzREtSRVRLbURGaWEzVW1BMXIzVTIxQUZzVGdpTURpVWNyc0pK?=
 =?utf-8?B?K1l0UVVTUkg5S2YrYXhCSm85Wk5UVUd2Vk5GblYxMEEvQklUdjluc2tHdnNr?=
 =?utf-8?B?ZjFMNkROYllndnBsT2IwLzNYWVcyaitJbEJ3aW5GbTdnOWU2UzRZNmZRSm9u?=
 =?utf-8?B?cTh4NytVZW9qVk1qTmhqcnNqNU96cW1DbWRjN3RwUWVFOWpVYzZwRXd3dUlB?=
 =?utf-8?B?WEhZK1FSR3haRkx6M1ltYTFJcTduTHNZRHhDY2ZoVisreVRFMDVpaGpmMDJm?=
 =?utf-8?B?SzlZcTdsc3ViYWw2alI0Q3ltN0tibVJ4TitKKzF5T3BQY1B6dkJxZzhxMDhm?=
 =?utf-8?B?SCswbVp1bVFiSlovb01jNkdmamhsYkVsNkFINCtiblB1NW9VRjcrMFZWZ0N3?=
 =?utf-8?B?WG1FUEkycERwMTN4R2c5bHJhUG5oWGNQWnlBWmVyeDJkNVgyMDFPQ21QaHJh?=
 =?utf-8?B?WVE2R0srMSt4cHBPN1ltVUs0QzhlenhOcnFvT1F6MlVrYTdJak9MckhpWmp5?=
 =?utf-8?B?RXcwZDdpZEpQT2UvaDBTdW5ZTDZvOUxxL1pxY1pqZWM2WHZKY3krZUZ2UmQ4?=
 =?utf-8?B?L0Jyemg3ZjUrRVVwN0poUG83Yi9UNnFZdG9PMmZ3L2M5QU82UG96ZTBuNmJU?=
 =?utf-8?B?azJxT2NCMXV5elhtV0krNnFISTJUWmx5dll5MXU0anQxazVKQXZia1hFMkdG?=
 =?utf-8?B?WmtMMXpjeHoxQnRHME4xNk9qYnlDK1hHaDFsdTYrK2hNQVlkOTA2bFhlV2Rj?=
 =?utf-8?B?dG1WMVpxOExMaHcwanNwSWI4aWdDQ2FVOHhPa3RENnM3K0pZQ0ZjejhGODRh?=
 =?utf-8?B?OHN0cGs4NnM1TEZvVEthamZsRGZ5eDYwaFlVRmI1N1pjam8xaVlUTk9OdEZG?=
 =?utf-8?B?SGcrWTNBYnRaclVlRm5LSis4YzVVWHJHQ0ZzRTRadGdUeDJKYTBQczU1Skpr?=
 =?utf-8?B?QlRQYmF3SlBveHNtdGRBY1J0a3pCZU16Rks2Zk54ckF3N2ZJWVJsdTJESjRm?=
 =?utf-8?B?LzZ5QUlYbEZONy9vZlZDZURqNkFrd0NLWWZnSDhKWmkyRmpHYk8zQ1o1SkJr?=
 =?utf-8?B?VThrMXg2SENVRzhpbUh3Rjd0UGl1RXByRmZmczZVaS9QbDNQS2RtTjV3QUZZ?=
 =?utf-8?B?Q2RDMTB0Z1RMSStCZWVVU1FOcldvRk1Ia1pxeEplN2Evb2dWUUpialN0dVpp?=
 =?utf-8?B?MTVFL1BQcUpKWGpNRHpQdHF0dTRvbjM4Mk1vR3J4ZVZ1ei9Fb0c0c2NvWnNJ?=
 =?utf-8?B?RlNaMHRjZ3JNYzFrYThFWVAyS3FDbVVibmljckVidm5mVG1obEwwK0tMMWFm?=
 =?utf-8?B?TVRhQ3g2MFE5bTM5aEo3Y0lBazZhY3FFYVNFMmlydkRiRk50QmJ5dDB4bko3?=
 =?utf-8?B?bmZ5bW9OZzFaYzdOdUx3YkNqOFR2bXVuZDFzSmxKdlhCYjZqdGI3TWxsa3do?=
 =?utf-8?B?aE9PUHZrQS9DSGhjSWNRRnQzbGVHcjFFSWtSdUVWbjdINnhrRU5neUdjaG9t?=
 =?utf-8?B?ZGxDbFc0QjFRc3VTU0hFM1dUbmw4cW9DQmk1a0txMEhwL0JaS0dqZjhvSFFa?=
 =?utf-8?B?Z3ZJL1FBb3lxdlVOZmM4TnlYNHU3RWxmdERWZmUwekpLYlNSMzlZNnNZcDRE?=
 =?utf-8?B?Y04zL3lERGxtZTkxTzNWVmdON0o2SU9Yd3hSRDFlWTBUa3lZM1UyOU1MT2oy?=
 =?utf-8?B?TjNMbnpDbHVMWDVVSkQ1Q2ZEMmtma0NZYTVVcmZnaDIxTDEwNlI1VEE0d3Np?=
 =?utf-8?B?L2wzdUYwSDNBR1M3aThPNmlNbXAvY0hqNDlhdVc2ZkE2clJSUndSMXlBV0pQ?=
 =?utf-8?B?N2xyTFBVOUVSbTMyMU1ZbS96TFdTNjNBbnE1Yk9iMWtJUGVjYjdNVzJUckRm?=
 =?utf-8?B?cEJGbVBNUWZ3OEV3NS9nME5WdGhwZzBhRzZqM1VsSVlvUUxzZ09EMXo2amhT?=
 =?utf-8?B?S3QvNDRmcDB0QlNjNnIrem5ILzUwTHR4N0RydElaWEx2dlFxTmc2MC9FWjY2?=
 =?utf-8?B?Tng4NnJ2SnkxUFRDSS9QYU0yditYcnErWWUwR1VYbkRzbkFxZWhYMnRreGYx?=
 =?utf-8?B?MTNrek9PcS9JbjFTTHNkR1FCYUgrYjNOblI2UWZGNjJzTVpPc3luRU12VVQr?=
 =?utf-8?Q?OgZQ8VNcpm8fzwfHR+7JqL+RC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d903f5bf-bbd5-4eb5-93c5-08de1824c7a1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 02:25:38.2785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PtC6moH6QGiGS49MMIB5nHdlFRqk1fChWam1ZI7QitjFRSh2FfjngtTZaNNjoq6lGImi3ZTjPXFSO7bBpy2QXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11952

Structure imx_rproc_dcfg contains a const pointer to imx_rproc_plat_ops,
which defines the start/stop/detect_mode operations for a remote processor.
To preserve the const correctness of the static configuration while
allowing runtime modification of ops behavior, introduce a new
imx_rproc_plat_ops member in struct imx_rproc named `ops`.

During initialization, dcfg->ops is assigned to priv->ops.
Enable the driver to safely override ops at runtime without affecting the
original const configuration.

Improve flexibility for platforms that require dynamic operation switching
(e.g. i.MX95 Logical Machine ops and CPU ops).

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 02e155e967942d745de4ccd96f9008e4211f9b36..82cb8c7866ccb79061c46068d2039f38feebbb3c 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -116,6 +116,7 @@ struct imx_rproc {
 	u32				entry;		/* cpu start address */
 	u32				core_index;
 	struct dev_pm_domain_list	*pd_list;
+	const struct imx_rproc_plat_ops	*ops;
 };
 
 static const struct imx_rproc_att imx_rproc_att_imx93[] = {
@@ -315,7 +316,6 @@ static int imx_rproc_scu_api_start(struct rproc *rproc)
 static int imx_rproc_start(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
-	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
 	struct device *dev = priv->dev;
 	int ret;
 
@@ -323,10 +323,10 @@ static int imx_rproc_start(struct rproc *rproc)
 	if (ret)
 		return ret;
 
-	if (!dcfg->ops || !dcfg->ops->start)
+	if (!priv->ops || !priv->ops->start)
 		return -EOPNOTSUPP;
 
-	ret = dcfg->ops->start(rproc);
+	ret = priv->ops->start(rproc);
 	if (ret)
 		dev_err(dev, "Failed to enable remote core!\n");
 
@@ -372,14 +372,13 @@ static int imx_rproc_scu_api_stop(struct rproc *rproc)
 static int imx_rproc_stop(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
-	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
 	struct device *dev = priv->dev;
 	int ret;
 
-	if (!dcfg->ops || !dcfg->ops->stop)
+	if (!priv->ops || !priv->ops->stop)
 		return -EOPNOTSUPP;
 
-	ret = dcfg->ops->stop(rproc);
+	ret = priv->ops->stop(rproc);
 	if (ret)
 		dev_err(dev, "Failed to stop remote core\n");
 	else
@@ -590,12 +589,11 @@ static int imx_rproc_scu_api_detach(struct rproc *rproc)
 static int imx_rproc_detach(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
-	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
 
-	if (!dcfg->ops || !dcfg->ops->detach)
+	if (!priv->ops || !priv->ops->detach)
 		return -EOPNOTSUPP;
 
-	return dcfg->ops->detach(rproc);
+	return priv->ops->detach(rproc);
 }
 
 static struct resource_table *imx_rproc_get_loaded_rsc_table(struct rproc *rproc, size_t *table_sz)
@@ -995,18 +993,16 @@ static int imx_rproc_scu_api_detect_mode(struct rproc *rproc)
 
 static int imx_rproc_detect_mode(struct imx_rproc *priv)
 {
-	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
-
 	/*
 	 * To i.MX{7,8} ULP, Linux is under control of RTOS, no need
-	 * dcfg->ops or dcfg->ops->detect_mode, it is state RPROC_DETACHED.
+	 * priv->ops or priv->ops->detect_mode, it is state RPROC_DETACHED.
 	 */
-	if (!dcfg->ops || !dcfg->ops->detect_mode) {
+	if (!priv->ops || !priv->ops->detect_mode) {
 		priv->rproc->state = RPROC_DETACHED;
 		return 0;
 	}
 
-	return dcfg->ops->detect_mode(priv->rproc);
+	return priv->ops->detect_mode(priv->rproc);
 }
 
 static int imx_rproc_sys_off_handler(struct sys_off_data *data)
@@ -1056,6 +1052,9 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	priv->dcfg = dcfg;
 	priv->dev = dev;
 
+	if (dcfg->ops)
+		priv->ops = dcfg->ops;
+
 	dev_set_drvdata(dev, rproc);
 	priv->workqueue = create_workqueue(dev_name(dev));
 	if (!priv->workqueue) {

-- 
2.37.1

