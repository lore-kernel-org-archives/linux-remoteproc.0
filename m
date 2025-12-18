Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010068.outbound.protection.outlook.com [52.101.84.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EA4212554;
	Thu, 18 Dec 2025 05:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766036021; cv=fail; b=sd77rsDEUb4HSUhOGe+DBTRoNV4Mn8F0T6S599bMKMK51IziJ1QKEMgTOUojRC7DoCdBNRihCdtPajo093Wq35wPQPafC2PMLUnWJNzSRHJPnySWhRhP5Efvp3CBAikBv7iqCtZAYeLJ3C2CtD2Rm/K23Vh6w1HCwiyGbXzn75I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766036021; c=relaxed/simple;
	bh=i3T3U5nTvh0JQBPF3Z1P298FPPteQR/KfGcwX/v/tIA=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=uA1TXK55cvrLaUTiHxsrWZcm65ctdZH0cAjjpANShCjkS9+RkAvK+oA5SFTEAZL4hThC5wqlscOtQoPXOyGsC8Y2v1GyQee7oagtTM0S1yZm+Gn1ZAhcfbSuiJvrWzdXwceHgpyaTQdceh9v0mBnWRfdpyQWRIhCBPSd5s39w08=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=BvkN3QnS; arc=fail smtp.client-ip=52.101.84.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="BvkN3QnS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HcxTH2pzz3n+7t6vvmqnzq0XQLu38mKi8CavtPYAQyG/eYEcYS+FHkFKR09uSfxmEBjzIgzSa+BG/+376krdSEfmVNioMYU5y70gNQtWU37quFv9t9QzGjCYQDqWsxm89yZGBsmRbYB3TtJECDHmGmUlMbWJKZsbeEXzPCPVzscxJL3MagYow1f1xApgWYly0ZJ0WvdFFdE635g7JQ1Sd/fUkGhTNt1X26CDXcxbZ2rpdP4Uju4t0wGFqWuWgg6Zr1d7wUp/aKocGiKpurc9CA8PIANOi8/uWXWGD1EuXyeA3y6Or93881IZB5Rcxjj5tf+ZVHpBSdc201zaeZ1LEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMQ8PVd1Ge8ruxhd8DVWp4rmaKd0ebAnHBscb4PVYec=;
 b=YgCUuAW0AWqcc55zATVqTXkI4D9R66x3PyfHPfnBuFyjSRynICTt8+yyYLhCYpFgpVqCxhMrDZk8PH8TpRL3aFRv8MIx5KPIw2OO9NnBKyzC7a83EwGrY/hIxbd7mDxdOV/Kn4AIdqboqlQwJ56h7iHfeA/mstQg8+gmgLy9HoZZ+R8stPC7XH8fDzeH16BKYZUWwCx30lY17uYixyJS6NBT/tLqQKJR0cVdBvkLDVBGSuOglF7m6bly7hO34Uc1H7zjLf+5Xc/sjhCUWvT+iBB6sokuBVWfmdvh57eYH7gJBLWKMAwTFPQRI+aSes9/ybeWW0KzCzO3MyYrWYw3JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PMQ8PVd1Ge8ruxhd8DVWp4rmaKd0ebAnHBscb4PVYec=;
 b=BvkN3QnSJydfs55TZppdMKfWi83VKSXdPqMjv3QgbAUfRcHwNb+B2qp5RGiTveM9L0u2kQ7io5oOc1A7b4hRCSRH3uRmESX56/66gDJEkbQqcIfGfUj/cIN6toHNVFDDyJ23RgfdPA7+/GiGoPh7pui/q8belSWyy3ad2Y/MbOyBG2G1uZnrKHH/fdMedG1cZoRI0H9dL86Ehk+SdZq6quBBhpaTqPBJZTMYlz0fjTXobI0z7TU2ubFFPhGRcZVoR29xqfw8XWYQZhCZ7NZku6Aics2kkvm7FHXthiqz4q+WPXgZl2oI1MYPZZrsEezSv1Schs29xptk/qrX8oKB7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by PAWPR04MB9839.eurprd04.prod.outlook.com (2603:10a6:102:38b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 05:18:04 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 05:18:04 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v5 0/5] remoteproc: imx_rproc: Support i.MX95
Date: Thu, 18 Dec 2025 13:17:34 +0800
Message-Id: <20251218-imx95-rproc-2025-12-18-v5-0-b56a27d4158f@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG6OQ2kC/x2MSQqAMAwAvyI5G2iCdfuKeBCNmoMLKUhB/LvV4
 wzM3BDEVAK02Q0mlwY99gQ+z2Bch30R1CkxsGNPTDXqFhuPdtox4ieRGJMui2JiIecdVZDi02T
 W+I+7/nle9uubBWgAAAA=
X-Change-ID: 20251218-imx95-rproc-2025-12-18-644d2e105017
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SGBP274CA0024.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::36)
 To DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|PAWPR04MB9839:EE_
X-MS-Office365-Filtering-Correlation-Id: 84821537-b0ce-4ffc-fd18-08de3df4d234
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|19092799006|376014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WExrQzBJS1FlOWNWK0YvdHd1TFlYejEwWEdMa3JUem1NY2tzQlJXZGNRV3hY?=
 =?utf-8?B?b3ZpdlptSmtsdy80cFdGcWFGd2hGU0Fqcm5yejlTNWgxYWtFK0ZPa1JhZTFv?=
 =?utf-8?B?K3o0Tys2UkxoYzdndldTd0ZHU1lFcTNrOGROQWtWc3ZObDkzcDdOMmQ0d251?=
 =?utf-8?B?VVNYMGMwcVhKYkxveWd1dm9wMXR4bXlmaHd2SUhoZ0I3bXBGdkdGeHBFQnZH?=
 =?utf-8?B?SWY1R292MWM5Tjg4QVVqeU9BdXRVd3BrQVlPM1lEQzY3bkw3YVU3VDZRNVZL?=
 =?utf-8?B?bFBtS0JQY2ZBSSsxMGRiTGIzKzI4SkFYWXpPQzhEaG1QK1psMWhLUDhPQ0xn?=
 =?utf-8?B?cXVSZm9vZjd1azNEaEdyTHdpa1A5Rkk2NFY4c0VueU1BcDFpOXoyTHZ1TnYy?=
 =?utf-8?B?VEI0ZVZEa2ZEdXNtQkRTeUx4aHMxSnhPYm1ROVQzZ0IyUTRwK2NLMVZGRGFr?=
 =?utf-8?B?c2NPckdvLzRiUGNWN0RzOUlTeURyY2ZTTG5pL2QxNUJVOVhuaFh5YWxkclZs?=
 =?utf-8?B?c3h3elJ3N0wrODdMeWl0ajczaEpUT21HK1lLb1lnSmRXOVVKblJ6VnJveUhr?=
 =?utf-8?B?dWVTZjgvUDRENVphaXBPRFFYTkhMNWhmRURmeFpUOTNYNnRKQTNaektKSU5j?=
 =?utf-8?B?LzZ0UWNCUE5jWHUzUCt6d3F3N25oeFliNEdzMHZGNzYwa255QWhlZDZsbnhu?=
 =?utf-8?B?U094ZklZY0hEK3pFcElHMzFKSmptSDBFWGVIM1Jnd2x0NHJMWng4SllIV09G?=
 =?utf-8?B?ODNIV1gydGp0NVhVYXlOalJGbkduTmdnYzRJR2U1TjN2RFVFYzAzSld0ZjZ6?=
 =?utf-8?B?MUpFSXJmVDYzTUJma1o3ajF3VFAxRHgyWmlqY085N0UxNVZrRWQ5dVpYRzRi?=
 =?utf-8?B?S0kwaDVFaElZL3FCUnVLVmJZYmgzODJtMk8weVhPRzFIZEdtRW4wRHRRUlha?=
 =?utf-8?B?Zlc2TnFrRWIrSlBzRkk2dVQxczA4Y3Nyd1VTRzdKdFN3eVN3S3VUTXFwL2xF?=
 =?utf-8?B?YU14cGFuU25XNG95OWJvOUQ1R1JZVXZUU1Z2cENVQWpheExCRnlhMmNKaHZT?=
 =?utf-8?B?dkdRMU50Ym9lUkFtQlZkbGhZQzB1NDl2MXlyZEJocndZc2E2K3QvbHBCQ0FR?=
 =?utf-8?B?QzJDbVpSRjZ2WkVWaEI5Y29LQmREQ0t5MkVCSnF5MjV4N2lpVHJpaXJkRENo?=
 =?utf-8?B?cVFrY2dMMUdpSFBPNWo0TWh4UTk3WnNwV3lkWUd1WWVjREtmVkt5QktJbWxI?=
 =?utf-8?B?eE9jRW03ZjlPcWtGUmIrdlR0T0JRK0FqYXIvclJNWTFoVDM0MWg4dWNCcG1a?=
 =?utf-8?B?bzZBRVF6ZzVvQmNIamJjTndvMFZzLzA4OWxzMm5jbHNHSnkxLytWa2ZoVEY1?=
 =?utf-8?B?Znd2UDdMaDVKQUZLNll6Y0NlTkRNUzBTa21GU1BIS2haaFhadTNpRzNLSGVn?=
 =?utf-8?B?RjVmNXFDMkcrbWpYb0IxNnJGV0pHTGFyUStrVWZ3dGR3Y3YwTDNXc0ZVZlJx?=
 =?utf-8?B?UzU5VGtxZkZ3STR2RHZaSXoxZ0wvSExpa1lXajFLZVdoMFhoZnJzbG44Q0NP?=
 =?utf-8?B?ODZOaGtRSVlPN01nQnRTS2RCOEc4REZ0L2dUMG1xcGV4eFJCWjZYRDZjN1E4?=
 =?utf-8?B?UUtlOThzbTFiOHNrYXh0R0E2cEllRDZxazBQYVJoaEg2T3RsZ1ZqOUtmMHpC?=
 =?utf-8?B?NTJkNnkrZDZkUExYZTUvRkw4emZzU3F5ekhydExYN2JJUUdCT25OU1hsVmVB?=
 =?utf-8?B?VEJGckRBY1NqMjZOTFFaVzYyeDk4OU5weW9pY0cyNnNIbDVOdzR3b2NSR1VH?=
 =?utf-8?B?WU5uY1ZnZHRMQUlxUnFaM0pZcUxYUnM4R0RDWm1wTUZXVnFNa2VmeVNZR2hH?=
 =?utf-8?B?L1dpYzdHaStpUlcrMFJlakxDMG9zNVRsallDdjhYUlBObnJFQkR0Z3paMkps?=
 =?utf-8?B?SGVmNFpPamlnRStiS283NW15OWl2cmZER0NmNlhYeDlET0JEMjRPK0ptWnFq?=
 =?utf-8?B?TWttbXdUSVF1djJrem1GQlFtR2NLOGtHV0wyNWpVUDJUclUvOTd1Nko1M29u?=
 =?utf-8?B?UkFvcTNoWHpIaXJkVkNheTgyV1dRTlhhLzZRZ0VySXhPd2VqMVBIaWxHL2pr?=
 =?utf-8?Q?QmHU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(19092799006)(376014)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFE3aVNqK3ZFbnd4QWphUk04b1J2NXNHUmgyK2t6ZVNMWDZBbTc4bTV5cnRw?=
 =?utf-8?B?M2VYc2taeXdOMzhoWnV6U0thaERWUjNlbHl4SHo5TGpnd2krWWN5RWZhS2ZE?=
 =?utf-8?B?UmdONXlmNEcrL3FoZkNaM1R6b1A3a0NwK1VmaGU5d3AxeHAyMHdKb20xYTVH?=
 =?utf-8?B?VTRqQWQramQwRHdKa1NocWMrYWxkMW1kaEVRdWdGOWlmOU96V2VXRWMxS2Iy?=
 =?utf-8?B?MjBQNWg1WkNzSkkxVGRVYlN4UlFoLzYydmdBYlN5dlhnYWRTZkN4Q0d2L2Ju?=
 =?utf-8?B?d0M0REgzelNQOUtCVmtINFZzZ0RNR0xyOFUxcUZ0QVNTNlNZQUJxeVdsbFJN?=
 =?utf-8?B?QkgrUTdHMDFwWXdpZUdzTXFMaEdKV083M3hXa215dGpHbnVVeFk3bjlzMjZI?=
 =?utf-8?B?S3dOazVwSGRxUzBDMXlzMEJBT3dWVXhEcE1zMERXNXc3RDFSQm9SckozU29C?=
 =?utf-8?B?TEZxY2VtNXpnZk9BMUFhQ2J6TXBvTy8zWU9YSm00ZDc4bGw2WS9pb2lMc0pV?=
 =?utf-8?B?UXlGMnlrTFVxaTdxWWRYVWNjSEF6SHRXWmNBMVBiWWpWemNoenNucFBiNEs2?=
 =?utf-8?B?ZWNYREgvcFpkemtXYTUvZkVXZkFRb25FNGUwR2dQalVxM3JuVGgrWnVIdHVG?=
 =?utf-8?B?R0JaQ1hFa0F4MVN2eW56SGE2dG1aSTZXQktyRk5KQzJERHFjUnNNZHhnRjc0?=
 =?utf-8?B?eTd0aDk0QVprQk53ZkJGQnY0ZVcwU0YwY0h5SUloRndmUC9kdWtSa3h2T3VI?=
 =?utf-8?B?QUVpSHVKVmg4ejgxSk9vdVJHMDZacEo0OWhqaFNkRWpucW1EVmRGUjIwUml2?=
 =?utf-8?B?N2YyVnVyQk5EaHV3TWpvQmxSUUkxd2dwbnZEaDNidmxDZ2x4VHhUMnRKMkcw?=
 =?utf-8?B?blJUMDg5MnZRTTdybTI5eUhlYmpLT2Fza0FOQUN2NWZPNGRoei80ak5HRzJE?=
 =?utf-8?B?Q1FpWkxWcFJ1dXo2aWhOME1pVWx4Z1JtUUphM3hENkVlb3ROTHdMMDVUYThP?=
 =?utf-8?B?TC9TUDlEZEszUjBScXkzTlh1NjdWSk1RYkJVZkE1QmVqeTF1eDlJV1hVQURI?=
 =?utf-8?B?c0ZkTWljZHhueWNieFNXNnU3S1dBTzlYcUV1dmJkMmtxWWRLUndscngxaDZ3?=
 =?utf-8?B?akNiUlFLOTFib1gyL0hTYU05ZW9Lc0ZEekpiNTZsVUM1YVQwZmUySHR5YklN?=
 =?utf-8?B?dExnTklUc1VteEdCWlFveWdRUEkxajJhaU5TbjJtYi9xSzZTYktDZ1FzaFMz?=
 =?utf-8?B?MWFiRU5vV3JLKzd6Znpsb1dBRlI4Yi95dnpwZm0rV2JrTHdyMko4NzJZV2lO?=
 =?utf-8?B?WFRhN3VJZkF1b2Y3WFBqRDlJSkhrTTJqQ3pKWnpYUm5BdjlPMHorOVlHU0kz?=
 =?utf-8?B?MitzaGJkUWxRWGJ1a3hXL0xFNDdidlluZEtaall5aXgxeUgvcy85S01uRGp0?=
 =?utf-8?B?WURBcGZ1YmhhUGRsL2lOaWkvZ2dLNlE1am13T3RIcUlDcFc3MGJCcnIzTzZa?=
 =?utf-8?B?bEhUWFMxODVscXRBVmplaVcxa0Z0QVRFMDRUaG02eE82Zjlla002UjR5b3V5?=
 =?utf-8?B?WmdwT0F5elJvVThlMWdvOWxqMXVXT2oyOVRYdTkrWlpucGhHb0ZUT0tvNDF5?=
 =?utf-8?B?UFVKeFdNZ0tZSVZzMDdMVFhtd2tSNnAyMFZ5UmF3QnFWUHdzL1JhM0VUaTdK?=
 =?utf-8?B?UGtTMkQzd21udUpWVUxLWThMc1NSTXVLdG5EeGxCdGc2Zm5XUzZaeStheElB?=
 =?utf-8?B?Vnd5RmRYWHNhV0tUd0pMNTAvdHBLTTZyZkQvdnEvUm5pWlBKY2tUR3VMN1Vs?=
 =?utf-8?B?NWRuWSt4YnVxZFJlL0NRRUpKaU1HT3ludCt3emxUcjZFekNCR1NYZmNwQnZE?=
 =?utf-8?B?N3d1WTNEQTZ6cXJCOWpaRVZzanczeG5ETnIxYXRSTEJIdjdId1kwVGxmWXdE?=
 =?utf-8?B?YXJTOE4reDBndlNFaFlGbGlTRVVsUFBFNEt0SENYdzJGeDdhcUYyWTV1N2d6?=
 =?utf-8?B?cG9INm9NaGhTK2d6VElHQjg2K093bGhrb1lVVmJMNUltVEZTY3lZWFJBVm9r?=
 =?utf-8?B?NDV1SWZnK012QzFudFRNRWRxYWs1Q28ySFkwSTlJc3JhUW42dGxKakdjWHov?=
 =?utf-8?Q?b8x8SkEBTPJuZZ1u1ge+h+VQH?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84821537-b0ce-4ffc-fd18-08de3df4d234
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 05:18:04.3174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nUKrmpn8fuVNWu3vJWAIBFj/swby/TqvhbacPEESSGlaWxosuCTEJyr5oXj/a485KMCzHBDKNhRAg7OpDxw5Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9839

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
Changes in v5:
- Add R-b from Daniel for patch 4
- Patch 4, per Mathieu's comments:
  Move imx_rproc_ops_sm_lmm and imx_rproc_ops_sm_cpu to bottom of the file.
  Set IMX_RPROC_FLAGS_SM_LMM_AVAIL when scmi_imx_lmm_operation(shutdown)
  pass or m7 is started before Linux.
- Link to v4: https://lore.kernel.org/r/20251216-imx95-rproc-2025-12-15-v4-0-bf1064ea8daf@nxp.com

Changes in V4:
- Rebased to 6.19-rc1 to resolve conflicts.
- Address Frank's comment patch 4 regarding "if (ret != 0)" -> "if (ret)"
- Link to v3: https://lore.kernel.org/linux-remoteproc/20251122-imx95-rproc-2025-11-20-v3-0-9ae6ee619a78@nxp.com/#t

Changes in v3:
- Add R-b for patch 2,3,5
- Patch 4:
  Rename imx_rproc_ops_sm to imx_rproc_ops_sm_lmm.
  Add more comments in code
  Simplify if check in imx_rproc_sm_lmm_prepare()
  Update commit log
  Use dev_err for failure path
- Link to v2: https://lore.kernel.org/linux-remoteproc/20251031-imx95-rproc-2025-10-31-v2-0-758b2e547a55@nxp.com/T/#t

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
 drivers/remoteproc/imx_rproc.c                     | 250 +++++++++++++++++++--
 drivers/remoteproc/imx_rproc.h                     |   4 +
 4 files changed, 244 insertions(+), 13 deletions(-)
---
base-commit: 12b95d29eb979e5c4f4f31bb05817bc935c52050
change-id: 20251218-imx95-rproc-2025-12-18-644d2e105017

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

