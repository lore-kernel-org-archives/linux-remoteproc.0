Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010027.outbound.protection.outlook.com [52.101.84.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251D71A5BA0;
	Wed, 25 Jun 2025 02:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750818326; cv=fail; b=JL30jCySlTIP+I/JKRPPDC5Iqt0A9HlHrjFW8FRiNZw1y5SrojW/HCD2+YX9F2/VDz+FR0CM9jIaFF60wq5b8wXN6u/uAwFV4CjilRKBglU5LunVgN19Gx5BWY50txcY+rULCpFxcgQ73qAIWF0XKFtmohzr4aSXfQYkO2uRKAQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750818326; c=relaxed/simple;
	bh=O5Y7Qp5JCcC6/utYcCfFXjw24jM08IIcbcqvheTzTFk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=m5WPxm6Acyr23oW7/YzwRSvnUW9zd/lZbOz1VV+VMV3FFwyPoO2Vi/eRzjUyft6mPSS69qNyscng9WaNu7+hbD6AWLVqYImJu0lsCJgcsSskdgV1pF8/7lzRhMHVANh3yzZY6tHsG9jBwnKNedd//F7TbdG9gD3drFzH/28NiKQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=u34DSAWz; arc=fail smtp.client-ip=52.101.84.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="u34DSAWz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DxgbGUVegD2issIQqQ7a3UxN7lUUL9kbYfzrgWC4jNkqxD+RioEu0U4nx/CjdxmaFFJ7IdX392BAsjmXn/IjGGT+VeocYcY1ps1i8qA9FcVJ9Dczze0c22Eh5ydp2vABv8KwQn5bA/znro1ltSRNqwfPBfen64+F26fTEwN81aMylNQ7wMc3f1sg5dQteXmiDMMT+nEitH/HFlouDNNS+T1QcOkIqWlT70c+CB+arlitWOQgK7U9amvwqp1rHeK7NH+VznELEaelozY/P64y5W4QJN9nNiPrJ6ZAkCFl9BcJjlkZHg/lJzK9cE2l3JsXHRDX6WmSOY75W15V0CFLQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=in8hR6Vs160f/vExTnzApv2jVpTR7JZrByTRMffRTlU=;
 b=ppY9XbufCMjiMN4tyPKUVj9YF3CKyEBaDXt2Yp1LOClFxtbrRAP0FPIDuOrA+Hl8g2h4pF36WpLqF5QzjheMJNWNHr2/EBkJqTgPB82jM0BHz/aiDyaUhjgFRr5/aCRsPWgJlRHhS2LXxMYhK1nnzVRYInlYPZDqKOBt9RCdC77SZyFKLg3nZI0EoQkB+h0KsyBnDGgEz0duUmIVb97lwtlfnO3geQFsWFQ/SayfwaKnd/VJa28aasNfUonTHyP+qSLkEzX6FXBoOUewgawVBGqjAzkBqs+8OHQ0mlNCMurh1qu5C/0m8in6ejYs06cXk9sLQ8Jwmuo8PCzEnEvTbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=in8hR6Vs160f/vExTnzApv2jVpTR7JZrByTRMffRTlU=;
 b=u34DSAWzKE2mFJsNYX/jP4ppKSumsMKpIw+mmHapPhcrQPYibOgFUhphd0wdLas8NAzzY140uigmcUzz60xHLLId1aijvgp7Cu0xKSR38YtVVdyVfWXArFX7Irl9SU0bvTUwrMmS2jlJ1Tr6GvZNeo0r1HlpO452hH5i7W/8zrM4HH3u7Ir7LFh7sRjwLVx/UnpshL9zJrkI6mAR1CGNvnylGZ9KoNNNzBS0V774ekEZi6glnpUGk0YWN7oMUOrmDunNeu7Fx/3ZaUsr81IPx89aHW8iCF35epCqX4yRKwTIzywBWbNhih1OxjqkYo2pY1TE1yakbi3iYHLmETnctw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS5PR04MB10042.eurprd04.prod.outlook.com (2603:10a6:20b:67e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Wed, 25 Jun
 2025 02:25:22 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 02:25:22 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 25 Jun 2025 10:23:27 +0800
Subject: [PATCH v3 1/5] dt-bindings: remoteproc: fsl,imx-rproc: Add support
 for i.MX95
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-imx95-rproc-1-v3-1-699031f5926d@nxp.com>
References: <20250625-imx95-rproc-1-v3-0-699031f5926d@nxp.com>
In-Reply-To: <20250625-imx95-rproc-1-v3-0-699031f5926d@nxp.com>
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
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750818218; l=778;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=OYVx5Ix8kQ+wO55Uz+k9FTM3qQkZbPeAo50uSGQsu64=;
 b=R2Rikw0OX16m6Wkq1oW0p/onwxeCCtnNJRC30enyUJxlEisUcuuHU/3vUhElzZBMm/9p6s8pz
 Pm3J02KsR1KDJXS2Aw55rnxPXHSxfNnU6DGx9D9VqQs/V0+/Ertie+S
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: MA1P287CA0023.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::28) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS5PR04MB10042:EE_
X-MS-Office365-Filtering-Correlation-Id: 641192b6-19d5-4a47-470e-08ddb38f897c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YlN3N0FLYVM4SG5YU3IzdEhsZ1BoTFBBM1hJQWJDR1RpUDN1TjFsVWhKeFlZ?=
 =?utf-8?B?YzUzTWkvc3RFcXJybldjdjFubFBzOVp5ZVVXWktNaU53Uk82WkdESVlFb1NN?=
 =?utf-8?B?R0lHM0NGM2lXQno4WUdGbUpkTHh5TmdSbWtsM0ZNck16WHJuYXFHamZCZm4x?=
 =?utf-8?B?ZkdwZ0FST0hkL3ZIZFlKVGtTaFBBcHdHUFAwQ01zbGJQVjBJejUza0R2aHFn?=
 =?utf-8?B?SlVGcHFSSkpITENEa1VxVDUrRlhHbGdNK2UwcXlIcWo5M1N4WlR2RCtNb2NB?=
 =?utf-8?B?VUs3L1FmTk16d0FaYldNbzJ6bjltcTAxWG9taUQvVXFaWU9HcEtXNnMzSEJa?=
 =?utf-8?B?QVdNZjc4K2luZVZicW9uTnRBYW05S2NWaXROaUlleWFXYkl2NFdvUGpvcFhj?=
 =?utf-8?B?WXlHYkNITTRvVDNWN3E0WkJsWm12ekFuYnJuQzcvTUl3enppNXhkYmNNNWxR?=
 =?utf-8?B?NjR4UWQ3dGxxNzdEL0h1S05YOC9zakE3Rm12cW5wa01UUFp5bUdWLzdTTitZ?=
 =?utf-8?B?TlBWQTJyN2drbk9XMUZzcU1qYitqWW9aUlVDelkrR3orbklySmdIcDlCRXVr?=
 =?utf-8?B?alQvNFJqUVRlWHBMc09DbjNjOFZORE1yVitNU3E1TTVnSjk4bFhOdEdyTm40?=
 =?utf-8?B?aXFQNXo5NTBvaEc3UjY3bVJmMEl4eC9CT21YOXNOUGd0eE1UaFBKVW5xVmJY?=
 =?utf-8?B?S3VPclBpWWNnVC84NmNEMXpuQlF1YUhrNEpuTGZXenFqbHlsZzNyR0wrWXAz?=
 =?utf-8?B?YU1VWnJRS016RjJReFZCUkwxOVdJZ2VZbXZ2eFJCMTRFenRoWTljZmtwTWNM?=
 =?utf-8?B?bzQxdVdXeE5QZklXRmZyQ0o2amZKeFM3RTZWZjh1bEZMb25WenFrMWVWb1Nm?=
 =?utf-8?B?M0tadGhNcWNxOFVqUHdkc0draTh4eHdYY3EwdEUzYUVvaXY4TGNVVzRLRDQ5?=
 =?utf-8?B?c2VKeDQ2VzdyZTJBOW41bDg5Z29HOGFYUXNsQjdyUXdFYmt5NW5XYSt4NmpN?=
 =?utf-8?B?Y1NXeUlKSlZOR0tOYmZhQkJJRmpRdHVGZWVxNmFHOGRwU1FSNkQ3dlBQUFJs?=
 =?utf-8?B?WUx5M3VhbnNTWjJTMWN4a3Vha1RVc1BWSzVSTlk5aEFmU2RlRFFtTFZ4d2dk?=
 =?utf-8?B?WDdEeW1DaFZPVU9tNW9NZlBwemlhazdQOFpYU09qTURTNkJ4VzdMRkdyY1Fu?=
 =?utf-8?B?RmI1NWVSUTdMdmovaXdHVVNjVENocWNNQlVLUnRHbkg2SDUzNGdKQmZpdGlk?=
 =?utf-8?B?SU5MdkJER1FRZmkrN2dNMEhBeWNaZXl3a1U5Mm41Ulhua205eXFFTmJoWFhL?=
 =?utf-8?B?UzB2L2Vac0t6YVAzeXJaMlk2SmIrOGVTQUI0ekZ0WTFHUVlremxIb1ltK2Zk?=
 =?utf-8?B?Qm16UnpIQm5PV0hZV3BhRFN0Q3ErMUdvTVJSQ0VWb2ptTjIvdGJlRmtxWC9w?=
 =?utf-8?B?dUVHZk5Dcm5rR2oxaTdjdUVWVXEycEsrVHowendNZDJOUEZlQjlYVHd6QUJo?=
 =?utf-8?B?aU0yR2RlRHFtTzJEVVBFL3krQzhITk9CcldPRTFyVFNmNGk0bUZsU2U2TTJp?=
 =?utf-8?B?M0pKMEJZTVFDQXJCUDE0ang5aDBIOWFNZ0o5WG8vRmxBTDQ5SHQzK3VMMmEz?=
 =?utf-8?B?Y0ZxZlR6dE9DcHdkQll1Q3R4a2dzUHIvRjRXYTdLY2tZcnFwM3hiUDVNb0tG?=
 =?utf-8?B?dWZTMEk1U2tmYmhzVHJaekQ3UlExM0dhdVM1eTQ0Z3V0VWpZSUVEQ1Y5Sm5k?=
 =?utf-8?B?S01yNE0yemR2QWVLMDloNXFSYWdZY28vc09mUk5yalMvUkV1M202VzM3TVBN?=
 =?utf-8?B?Nm1FUVRoT0FnSTM3N0JzSmYxcUNJeW9qM1RYSGNYdy9GMkF1UkRPeERST2tU?=
 =?utf-8?B?eWxJZnczbkZDVFFRVnNvbkdOenRhanZPbnFQMExNMSt6VS9iYUFwTWNJVlBM?=
 =?utf-8?B?VzdwYVJhakloYnpDanVXTDdVampNZTlFL2lPZjFMV0h1UE55ZkFySWNKek1C?=
 =?utf-8?Q?qX6yC86K3WV7YfGDgifR+I0yPP/BjA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WnRoSEZqVklvTUhJKzVIekZDMWxtQUh5a2VKZVZGa2t5OURNQmZ1ZXlaOFVh?=
 =?utf-8?B?Yk1nWkY5NGVLcUlTV2p3V1ZzcUltK3c0MG9lU0duUGtGR0dxN1ljQm5xTkIw?=
 =?utf-8?B?QWFyMkJCMWN4TW44T3paMnNLaHprcUZQTjlqNEQyT1ZQbzFweVV5dEZWWGtI?=
 =?utf-8?B?YXRkOG5VZnQ2QmlKNXgzbGhFSGVQa09KVVRKNE03WCtaaHhyK0t0a25IYUkw?=
 =?utf-8?B?VWRwUVhFNE42OSs4azlYTlFEdG43SFhraVpXN1FLcVYyTjN1YmdiZEFuc20y?=
 =?utf-8?B?M0dsYWM2M1BlS1M3OXlxR0gvQm92VHB2OW1RNFhCS1hXZVlEK2loVTI2Ti9R?=
 =?utf-8?B?cmNtcUcxZ0s4cFY1SWI2NmxsWjNXRDRSVVJtVHlsM2tBNlpSWUIyUmRTeGZC?=
 =?utf-8?B?SklBTERMeXUybmhSb2VGZkNXaDNkOTdMYXJJMzBrek1iWEg4dUhETEh0cEpr?=
 =?utf-8?B?UzV4NnVFb0RTbUNwcjdyNDBUeFh1Mlc3SC9Xa1pFQTBDTk85QStXOGRVRFh4?=
 =?utf-8?B?Qm9heXcyMUdhMHdNRHdRNEVKQy96eXA3Y2ZKZitHcEVpUEZtSlpZQVNQbGRv?=
 =?utf-8?B?S1p5bGIxeDE3N1c0d3FkMTdOTzg3cmVIRFJ2aU5POTY0ckZ1QWlRQjRJS2kw?=
 =?utf-8?B?a0p6cFJlaHIwU25lOGtLM29Ja1k0NURaeTZVaVdTelRzNzBUbzF6L09PL1lY?=
 =?utf-8?B?N1lKVDZxNDNUN0hneklhWEhSdWtxcnhpZ2NJdVk0QTdyU25IV250N0t5YVJ5?=
 =?utf-8?B?K05lMXFHWEx4YUFlTjJqc08xVEVBNnV3YWt5alZIZUgvKzh0TUdWOHJxWjRm?=
 =?utf-8?B?NjNFTkU0a3M1UUVsWU5TbkovcjBFblBnUTZrcTcrQ2tXM3B5UnhpN3MwS1ZX?=
 =?utf-8?B?aTNZQ1Erd0tQbkMrM1V1Wnl4YmVlK3gyMXlRTXQ3NkdzQWwvdXVvRHM4Z0hD?=
 =?utf-8?B?bW1tcm9OTXBHMFQwaE5ZM1dkdCs5cEloNTd2eHFrSERJTjU4eHBtdkxkUFRC?=
 =?utf-8?B?U0RMWnJhT2J6UGRnKzMzODZiLzZmZUZRenA1SFo5ekpzWHB3VnpCUGk1VjN6?=
 =?utf-8?B?UDlLSlYyM0VaTk1HL1hvRDVkbFZPemd6Zk9XMHVqNjJtMGtVak9iRjhMa24z?=
 =?utf-8?B?TlA0d3A3aHN1cVJLTm5FdFdDcXcwU3JQeWFqOU9kcDdmYWZ6cmNhSzk2OFpX?=
 =?utf-8?B?WVZ2RWFXdXc4bGtPbnhCT3RFbFdnNlNTWjZXRXgyUmNYWGV2ZXBSUm5kTUti?=
 =?utf-8?B?dG1sUjVwRDRSVWhtb3JIQ0JJeVo0SEdHOGFyVlAwYnorRnBUQjFnaStKUURG?=
 =?utf-8?B?aVFJakdYcys2WnA4ekFvMjd3T2psZkhjY3o5bGFKUTZlRzh0NHNQYU54Mjdv?=
 =?utf-8?B?VGJNeUVDMDAwZzhpc3prMjBQWTMzeVZmU0xGOHBlclpGMmJsWWM2cFI3dzdN?=
 =?utf-8?B?bEw0RDU5TWJua3pWeE1SeWFFZ0xpTUNCK211TUVlYnp1L3hUZFljY1pVMnJO?=
 =?utf-8?B?SXorNm1VSC9DR0xpUWNrblZ0RTd1YlVNcDJWRmx4WDdlZWJmaEowN2RydjI2?=
 =?utf-8?B?M3kzMDh5WGtiYk5Bd3IvUEwvZlZtamY3OGxGQnNjM2pndldSTWlJNXFqTjVh?=
 =?utf-8?B?NFZNZEQ1cWFuamFpNDlrVllBYTU1NWptL0ZLRmovVjZSNmZxVXlpVW51ODlU?=
 =?utf-8?B?MnpES2poV0VwdlozTjFrTW1idnBOQW1MOTQvVWVvZlpCN2x6VTZvb2FiRW9l?=
 =?utf-8?B?VENEOVlpOUlmQzh6QzZLSFhEM012WStIeFg1VGFuMEJWNzNoRzZXUVpWSVZD?=
 =?utf-8?B?cFdrZkFwUFRLWU4xVnhmOTNSRWtXWWdNR29CUkE0OWRmcGh6WllrWjFwbGl2?=
 =?utf-8?B?MG5TRklReW9McUZsdmxab0NuSWxqSGdPSE5MM21Hakc4L09mMlhyWHZDOFJi?=
 =?utf-8?B?bVMzYmZhdzdNbnR1L25jUDNxSGo5S3R4WlhLaS9SUjY0eldjV2dVQUt0alZo?=
 =?utf-8?B?dHNvT0xubGRnWnpuWVVtTU1mMHV1c1V4V3ZNVkpPa1dTdlZpUlBUdk1nSFln?=
 =?utf-8?B?RXp1T2RlaTVHUy9yYVJkelRPV29qNWRuY0JWWFMwNFFOZDIxaFhHK2hKSkFt?=
 =?utf-8?Q?Cq+tIgV0tFIzhQzc/m/3I0fr6?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 641192b6-19d5-4a47-470e-08ddb38f897c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 02:25:22.5996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KpCzdRIt0BliOXTaQ5AnROO7dyrNBV7ohX5tkOA8TGwATwPjNUpi261Qa5OTNA3hu5xMC1Nw2PVIUg0OyD+o/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10042

From: Peng Fan <peng.fan@nxp.com>

Add compatible string for the Cortex-M7 core in i.MX95

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

