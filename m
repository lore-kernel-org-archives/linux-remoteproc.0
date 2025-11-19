Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011004.outbound.protection.outlook.com [52.101.65.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A50A2FC876;
	Wed, 19 Nov 2025 04:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763526183; cv=fail; b=nLB2oGk57Cxd9Bo5a7V8/qkUtrS6tHxyVGDBUrIz5kktdw+tHNmKFEX2I1TMEPRF+vgVfrhcaxCY0k0Vjs5PhFKr/7iJpEACIgwcRgl0Bo0S+PwVsjPdcNuHPAiKZs5e28P9WzB2Pr4gc/Dr9/hlGRbqrOFpK63It/DtPspavuM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763526183; c=relaxed/simple;
	bh=KrCLyg/JqaCL9FjEZh4T2cLlinWB39DljJBhG5CxloE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=TLc8Fr4RkVf2N/7U2MmpJv+13VHSKPDpxXDzZq1TGyd/iFP3Vt/OV0sO5IcaqScJlB6Bz9KZeoY3xKuwkeWnnhIcbp9YlguzBwthq66rrLt70p5/W/aJ3IjHoIrDslmz1n9g6+qmFDRPcrCqid07GHZNlD1tv23shCovqyIcrzA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=iW6/DEFP; arc=fail smtp.client-ip=52.101.65.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="iW6/DEFP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qhONiUr2ohIGvWWX34PldHgzmqw5XHnatTJgVF5UEzJVhvt8siS5jI5tB53kgfig8errMQWWTIEnWaAkkZYyp2E4bJL2E2u8NuByA6kkU8Dd1HgKhPYsFFzodoKgtzlApFaQUqJWL3urSsTMTCsxyQWopKStHc3qQPt3+gVI7mS7iDGlYTfT4lY3bbIeLWx7XzhIjojgdJWn6BlI/xrGmFzzC6TPLsVdI4Bzj0G9e0TrRfEDLx7pjmQFwoFGkgJaRjMvla+cCIVG+FmyuRyx/jBpyQfJ1ojTj46Dc8mPh6BB1CSHF/TjeHq5o30PkqtfkZiD6lpPqEtkmgjGyhffLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LX5uT/c2Zgz7ZUJnFOmxEGM43TSo3lG9Hkv5DZaWEdY=;
 b=b5aTIBetxh7WeqKpXRT0q5Ay3Kw3APWsH/mf01yItyR6OPotQQ+3gzdodncWdbkjjwU9bkh363KKaZkvrcNIKu0PhzhSuO3F+UJDw0FslqQSVd5WunQey79L25k0oJYcWSmKUOc2CLCaC2cubnx4XV+p835yFjQT0VGxGva8DxiHUsm4AVH7Bl/qkPVHGVUB/u+sC5Cstnj7UjB/yLJdBB4gHUmgPmzqxXMbIE2nGIgvijWjiYErx2ewH2xsMxBwq/CahVAsyzH4l3IR15ja6EbqFh1suo28rtpJe4k9WpjE4B/mzOBJ5RseeKnwKhzK8NlH6CZ9UGljZ0KeUiIEog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LX5uT/c2Zgz7ZUJnFOmxEGM43TSo3lG9Hkv5DZaWEdY=;
 b=iW6/DEFPr9YYBOOZqxdP9uPduNc9OGJ4rww4/Ii+Bo0lGd4gmGn4HYwmyHdkk1actV2jauBT9y9dbtU/OTIeYj534FR+0jBU2eRtgv7v99bu2N796PtLN2vwOszOgtSrd0wFCU99kTgM4IOQV94NtPan7p8wgmfFF5WxnFRqs4tp97KGZ23By4vdHXhJBGQJgqsh9LBEF3kCQOzwwSEiUw5d78PxnIsSwVgwIrVeikIaiFPxt6R0jlnswy3NYfHkr8FGbd2koX7tpd1l5FbwLLrZGWze+cnCFMe8abnykTGqP+GY3aIpowVxts+wBwatkDblroSkE6ZY4IB0TMKQ3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA6PR04MB11949.eurprd04.prod.outlook.com (2603:10a6:102:514::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 04:22:58 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9320.013; Wed, 19 Nov 2025
 04:22:58 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 19 Nov 2025 12:21:57 +0800
Subject: [PATCH v4 12/12] remoteproc: imx_dsp_rproc: simplify start/stop
 error handling
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-imx-dsp-2025-11-19-v4-12-adafd342d07b@nxp.com>
References: <20251119-imx-dsp-2025-11-19-v4-0-adafd342d07b@nxp.com>
In-Reply-To: <20251119-imx-dsp-2025-11-19-v4-0-adafd342d07b@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Frank Li <Frank.Li@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, 
 Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI1PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::13) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA6PR04MB11949:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d683cd4-03ac-4f08-6e4d-08de27235204
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|52116014|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eGVTTUYxSW13RWkvY2h3ZzVqQWRjekRaSCsrUG1KK3RZRnk1OTZkLytxUktz?=
 =?utf-8?B?ODdRU2dHTEUrQXRYYmVyZCt0TzBuTDFaQnFkaS9HN3VZTUkvdUdCT2pEN0xH?=
 =?utf-8?B?bjJZdDVxd2hIM1JlQ3ZxbjRwdTNRQVN4bExnL0dJOE9jbmZsT09SVDI3TkE0?=
 =?utf-8?B?YzR0RElBbkJ3TEc5ditaMjhRVUJpdmpzZ0dmYTc0TFpBK3JkSWRWQzM3Tndu?=
 =?utf-8?B?WXlLK3BZeFNFQUtCc2ZnS3lUY1NUeERrYUxTNE01U1cvcUZkV0xvQi9iWlZR?=
 =?utf-8?B?dmt2ZmtPYnQ5MnFjcmpDeDdtWFVNZlArRGN3eFplZk5yMWVjT3drV2ZPL0ZC?=
 =?utf-8?B?YTJ2dUdteU9kVi9iV2VUYkZ2ei9PcW5uQ3VBM0NhYW9WYWlKR1ZCUW1lVlhE?=
 =?utf-8?B?NFNpR0FoNnh4cGlWMEswZ045WWFkSzNTVGxoallKYzUxNk5ITTIvNjVRckVM?=
 =?utf-8?B?RXZLbHFQMklsUXZHYks2YnozYmJ2YkxkbXdDb0RkQjk5VlNUZjFlWHJuVytn?=
 =?utf-8?B?czhzYnFmYjdWV1BUYWRack5ZYmc4VjNKQmxtSE15SUcvWDUwM1VYc1Ztdmho?=
 =?utf-8?B?TE9pdG14aGRKTTByQkdKTnZCVkdnZ1RvSFhDampLbEJNM3lzZXdPQ0J2WEZ5?=
 =?utf-8?B?VS9zQXpaNFh1RlQvYnZ5TUFlUHBvZEV0SkFna1BkT2prR3lRa3VGK0tnLzRj?=
 =?utf-8?B?SGhCVlZuT2FmVFFCVGVDb0xBR0xINmJicXBaZytoY0hzQUp4cW8xQ1dCWWdG?=
 =?utf-8?B?ajRWc3VLNVpWUGFFd3RqRlBIK21DSVp4dHdYdmttMWRNaSsrbGxDR0JOWVAz?=
 =?utf-8?B?MkhZYUwwT2Q1RTJFRUoxWE9EVElSYUFFZ1Q3STlrWFdXL05aWHcyQXJzazRB?=
 =?utf-8?B?SHFKM1phMHpuV3czK1FEa3A2MytsYnd2dncyU0gwazBqWlBqQmRIanJoTEdy?=
 =?utf-8?B?cjFDM0s0MmZ0WmpCMm9PemhOL3lpcGlQN2l4clVQKzBiYjZXL1J2RE83WUY2?=
 =?utf-8?B?N2F1NDVlNWp1Qi9sc3Fkd0x0ZzU4VTdlL2FaUzNNdEExdy9pRDdqL0U0Zmcz?=
 =?utf-8?B?V3RTVi9DQUVGQ29RMmNmTGlHTjR6OXMzenNOSjZqNkp5dG10Z1pLY1JZSVJk?=
 =?utf-8?B?TUt4ZmFFU3BwbDQ1UllsQ0laeDR3RHZBelVlaWM2bDFHWm9VayswenlvMmhB?=
 =?utf-8?B?VUFhTGNTTkZnL0Z2dXUreXBGb0ZrNStSa294Qi90TDhURGtWZjB0K1ZkMDZ3?=
 =?utf-8?B?dHo3ck1ieExubHVzdVhkYkljd2Jhc1ZaZHBuOXdtTUh3RnB0VmRZSC9xUWkr?=
 =?utf-8?B?TXRQSUxnUkUxZkVnS3U5NkNuelJnSDJDRncyMGU2cDhIU1ZzcVU5ZTFmbkdX?=
 =?utf-8?B?STlVUDN4bW92Y0YvVHV6YjUwU2NhMys3QkRvWHU2MWZOak52UzdsSDJEMlB4?=
 =?utf-8?B?dUJFdmFZQ2c1ZnMwcEJSYWlmVGZnQjIxcVp6ZE9OQkpOQlRxc1Y4SzVFbGxO?=
 =?utf-8?B?cFN0Q2wxK2Q5UmIwY0dYNkFRUVZaZ0ZGZFp5RWliSG5UdkVZcTc5MmhzY21k?=
 =?utf-8?B?ZXMzREp4RzE1YmpiWWp2OGx2bjhrRGNoa0lqV3IrajZzOFZ0c0dhcU4wVUxa?=
 =?utf-8?B?bktyM2VCR3lKZU00eXYybFJ1OEljeFI0Nms2eW9OekY3VUxmSktWa24xZVJt?=
 =?utf-8?B?UnI5aEpKK3R5UVRoQmlGdjMza2hoVGdFZ3c4cU5Ddm9laEozOVBWTVYvMmRs?=
 =?utf-8?B?THJHV25XSkhmMFRyVXdJZElmV29md1dsRitNY2R4K3g4UkpqOWd1TGowOFZo?=
 =?utf-8?B?aS9VU1ZhQ1hqK0MwcEMxbkFGclhGaXQ0dS8rSjJzcTdLeTk1T1V4eHRmZGIv?=
 =?utf-8?B?UGtXL3B6Ykc5Z1lKNHFxdDJocU9vL01BZVhnRjNlSlpZNGtFVllFbnpzOHNQ?=
 =?utf-8?B?OTJ4c0JSSVF0SHFLd2s0RUNUZ2ZIRXExRlFNeGUzdE1mZTQ1MWYydXY0RFMy?=
 =?utf-8?B?QkFuNFBQOERaSmRvTDk4SlFndFp1SUVtZFloVkFrZk1CS0JkbHcyTXpob2pD?=
 =?utf-8?B?dlJ5QUdyUjF0NVgzRDA4SEdXMFYzanlxQ3dtZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(52116014)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zm5mZ1hVZ1F4aFNzaUJaRjJkeW9jbWxjRks2TXYrTjhic1lMRG9iN0hybE1W?=
 =?utf-8?B?RGtXeG1EQVh4MHgrbHNkbzY3bEJxMVhvRzcxcTFWbFNsNFlvM2RnMTlERU1E?=
 =?utf-8?B?MlNpazIzcHF6U0paUDE3b3JoWXRKWE5oQ3FpWnpFREJ6c1BSdWt6T2xNbzhv?=
 =?utf-8?B?N3ZqVmFFU3R3L0lQQTN2MnZRNDdqREhmUG8yRWxmclBkYU5NMlZsdlFzUDQ3?=
 =?utf-8?B?UUYyWlorRnQraE0wTFh3Q3c2QS96V3FTNnpubCtzNnN5SWEvR1lrOTF5Nkw4?=
 =?utf-8?B?RHo0Q2hSV1hSS0UwOGJCS2ZPZHU4bks2a0Fsb0poRlRPdEpsQ0JCbEl1OThu?=
 =?utf-8?B?WS8rZ2VMSi9yeXB3eU1kQ0VxemxPZG80QXZMejRjcGMrc2x3dEMvczZKTy9a?=
 =?utf-8?B?SGwzdEFSZFFhYmwwd1lQRHVzUTdZV2M4REdsMXN3UDgyWjl3dTlwUTlQNUNQ?=
 =?utf-8?B?d1BRc1JoL1d4Mm4xSUhFclloVE0ybUwvRnJHUDR1OS9NZ3Q0dUJVMjVaZTZy?=
 =?utf-8?B?VHErUDVvUmgvcUZZek1QUk9lT1NYWUFQWFJyTXFma1NxZEFmWHI2RXRZT0w2?=
 =?utf-8?B?c2k3MWlTbmlJdXhhcWo4UDBJUDFIYUphS0lGQW9NN2VmSllraXVCS3l0dmFw?=
 =?utf-8?B?NnBYUCtHME9DT0FMcWE3MXBNckkxOFNjZkFLMHBTZ2UyQlBaNXJNY1poS3Rz?=
 =?utf-8?B?Vm9nYmZSR1dVUWpkb0wycXJGcUZ2SEh6ZTcxRzIxeGVHSi9JRyttWWlQc0RR?=
 =?utf-8?B?TFhnRjd1WXlRdHgxU2NlZ0o1Y2dUcWlFQ0lIdUh1TDR1SmlvcS8vQVZxTWZD?=
 =?utf-8?B?QThmQUpGRVJQWUUrMVp4THJWcGlmOTVOZ1Z1NUtibElJYmZXbkQ4ZmxuWXZW?=
 =?utf-8?B?SUxTcitZemNlTEtUUkl6cFFENER3NjYwQVhLajlXS2JHZWNPRHlaRDZGZ1Qw?=
 =?utf-8?B?enVFUVlXc2RLN2crL1ZtUEFrYXF5bUtMampZSnVpRkFkblpHTmJrSWJORVJk?=
 =?utf-8?B?b21DTjllMC9jTjkraFgybkdwKy84cGVJSEpkREZadWNicS9aUWYrREdkVW9j?=
 =?utf-8?B?MiszakRlRTFrMkVWeDg5a3E4amxJdkttTGNpTGw4WVRKZnRTNUIwYlhFakZU?=
 =?utf-8?B?T3ZJTGtRNkdxUmtMZEV0dU5qZGE1Y3ZhUDNJa0UzZXFHU25NOVZ2VmR1MTlW?=
 =?utf-8?B?NWVrdXEwUEFvbkpjeFFoQnc2ZHBhWWt5R0xLZzNNMWxsUjlIMHEzQmdNMUZQ?=
 =?utf-8?B?TVlFZkxoN083T0FrbkxUY0VnblpxUFB5VUIybGZ0UUFyb2JZclR3ZDROVW9S?=
 =?utf-8?B?MENQejVsNXVsRzNrSFQ0c21BWVAySXVEOC9ZSmhSYU5FbmZZWGtQQWdjKzdS?=
 =?utf-8?B?VHVIQjN2and0ZXRDQzVVQnE4V2JkbGE5M2w4VFpzSmhhQ3pYUGM2Zysyc1Ft?=
 =?utf-8?B?WnllYUxZeDJuNDF0U3B2MEd4NTI4SzB4WWhCMTAwMVVXTnd5SFZWV0ZHcGw1?=
 =?utf-8?B?dVBDRWx1RUl1NnZjRG1IWEpMMndQTGxsdlpGTGd3U0pVRlNCa0xaUGJ3MFBm?=
 =?utf-8?B?SVNQOHVFL0JERldnMHRLU1R1bEIyTXI3K3pnZVVLYmxxd2RyTmtRNHFudFNn?=
 =?utf-8?B?ZHRibWl2VTBhKzJrOXQzMkkwYyttVzFoU2JDTmdQQSt4Y2tuMStzSVlEMGRn?=
 =?utf-8?B?QnhLRk81Qml3dXdYaHRrQ0lORkFiMjJnZis1RmNNRklBak1iNlhTZDdPdVVY?=
 =?utf-8?B?RGJaSXlvYk5WK05COG81THZLM2RnYVVhWjR2Ri9rYzNxazNlcFR5VmZ2blJY?=
 =?utf-8?B?bW1rQ2E4eklRY3B3VE9KQUY0TUNaL2QvNE5XSzdhcGVaWnNDTm41d3VWc2lH?=
 =?utf-8?B?bjJ5T3dINWcxdE1RS0R3aGwzWkdTdTM1ajltMllWSDJrTlBweE9uSjFlcm10?=
 =?utf-8?B?NkR5Z1hjZWFQaTlabVBIVjBaVlBrK3JJREExWFZUSllzN0Ftd1RlTmhoQmRV?=
 =?utf-8?B?MjNPZ0VidEJvd25vVlIyaHFuR1k4N29ZTml5SnpCcmN4eVR6OWMvdkpKbFY5?=
 =?utf-8?B?R1llUmR1TkZReFRWckdGaWN1SkFVTnNGZVNWdXBEMnR3Y0dUUG43UWpZNmZh?=
 =?utf-8?Q?OL4VW88PDtdcDV8lUU9JbXw3c?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d683cd4-03ac-4f08-6e4d-08de27235204
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 04:22:58.8270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JcfQxJGz3Gd0ByAcVaD43gSrOkajWVjvGOBUMcX1jK0FSPG6dWbbVmoSNIpVz9REpS4xDD/Xua6yJafDnDss4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11949

From: Peng Fan <peng.fan@nxp.com>

Replace goto-based error handling with early return pattern in
imx_dsp_rproc_{start,stop}() functions, and simplify if-else logic.

No functional changes, only code structure improvements for better
maintainability.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_dsp_rproc.c | 39 ++++++++++++++++++--------------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index 6237e8db2eff759c2b7fcce5fb4a44e4ebaec8cf..1a1438823e7fc0a65ba15142abdd97e59692801c 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -376,20 +376,19 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
 	struct device *dev = rproc->dev.parent;
 	int ret;
 
-	if (dcfg->ops && dcfg->ops->start) {
-		ret = dcfg->ops->start(rproc);
-		goto start_ret;
-	}
-
-	return -EOPNOTSUPP;
+	if (!dcfg->ops || !dcfg->ops->start)
+		return -EOPNOTSUPP;
 
-start_ret:
-	if (ret)
+	ret = dcfg->ops->start(rproc);
+	if (ret) {
 		dev_err(dev, "Failed to enable remote core!\n");
-	else if (priv->flags & WAIT_FW_READY)
+		return ret;
+	}
+
+	if (priv->flags & WAIT_FW_READY)
 		return imx_dsp_rproc_ready(rproc);
 
-	return ret;
+	return 0;
 }
 
 static int imx_dsp_rproc_mmio_stop(struct rproc *rproc)
@@ -431,20 +430,18 @@ static int imx_dsp_rproc_stop(struct rproc *rproc)
 		return 0;
 	}
 
-	if (dcfg->ops && dcfg->ops->stop) {
-		ret = dcfg->ops->stop(rproc);
-		goto stop_ret;
-	}
-
-	return -EOPNOTSUPP;
+	if (!dcfg->ops || !dcfg->ops->stop)
+		return -EOPNOTSUPP;
 
-stop_ret:
-	if (ret)
+	ret = dcfg->ops->stop(rproc);
+	if (ret) {
 		dev_err(dev, "Failed to stop remote core\n");
-	else
-		priv->flags &= ~REMOTE_IS_READY;
+		return ret;
+	}
 
-	return ret;
+	priv->flags &= ~REMOTE_IS_READY;
+
+	return 0;
 }
 
 /**

-- 
2.37.1

