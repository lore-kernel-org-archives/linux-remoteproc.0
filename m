Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013004.outbound.protection.outlook.com [40.107.159.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F1D264636;
	Tue, 16 Dec 2025 01:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765849925; cv=fail; b=FCpgvFlKwqZvEQPI5HLXY4UGi4u8ORC2wc4obmJR4OxBI3AZOwJjWLlA3qUVzzEc+pS2kTOQkr04xSaIQDWgTdgy91Bw4BnlIWKU0F2SdumvYtytNWB/bddEYA2MoUwGNDUalxuOmwd0PDnN/8HUPE9WWmcg+kakJCJf3Wm75jc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765849925; c=relaxed/simple;
	bh=bdDmrCRazoydn4zTNkq7oeDNQFIwYrhTcIfOZIHzq/Q=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=tp1cx6zCdRNPklVxsjlSuhueCqBS8B06Ps1nme60Lm9QojU2k0bnJoVAt3J7ZtUrskujNuQrdbk9taScP0u00fOCBoxJlrxy8JRO1qTIYbrj909L+xLsqh4IzcVJO4HJj/SPApmjExlxI9EvvtHxL67XF9WGa6U9vapx1b7qAyw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=aGwF/Jd7; arc=fail smtp.client-ip=40.107.159.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="aGwF/Jd7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jMmDkRblYkNoKUbWGZ4X2bJrONx2umH9rQt88V+7al8Yj2gHsBCYAPkPhc38m6SZ75HPaU4dFa3DXM8+Xkt/U7W4ImRhXf6YmS7pFk83G3+smP1+nO07j1+lzoysAC49PeJ31rU/OCs/aRkRrIPZvRmkaMkTztwH5LV3D0aEvBMYL4C7HUps9nGRRydcz8ihj44jT4e8/IxJ46nXwqLQKMBc+dY6Km/+gOGXrCZwDcLfuC+m4CsxXNQyyu17ffCQh+eHJeo0v5byOhFQbsinW1B32qiYiQ0E7ci/J0VHq5TamBxhRcsHPaKlHrYpSiiAk6/cLJcw3iRiDYs6+vRpcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V8xj7osk5Niy7N1foPGRJomTiUzhLeI4oYL3vzF26D4=;
 b=Ej4ry/KQTp1PEgUdi5l3m+2lSpLiyoSQdbyCepVMCvG5rDJwMqVSkRpG9vePqSiqvRjTn4cF2Jcx69dQX4t+g/p0wulnHuxUfb9QyoqkP64QFRnfUhSlcpOl3lN90e24Zq+hubMmnUU4l0N0rn1MRUjGIXKnJcjexzxmoKmGId/I+BszhSGan/tnLf25YDxJ51AHZeTjMYMdW0s7QY2OVr2eVwJINRT/Db7C6cwFaxgGiEf+UH3JadgHVCQ8ec764151c2dbJ1A5NTBUbbq7s3/amKzYiwOqmeZsuZ7C60rWv59Q5Anm9uCCijtZUYuyBypnwXhuPsGbcYUJENaRFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V8xj7osk5Niy7N1foPGRJomTiUzhLeI4oYL3vzF26D4=;
 b=aGwF/Jd7DNSCtvAwL15ia1kY3A/ndpjbc80XV0IfxtjBqhqlc6xwNbyOawLoUEbTNTLJPAc1jQQzUKL1+2AE42FEYTdFGgCLfwKGJ9X1gMjQR9Jj5WnN2hFbafAbSPYftXkYXvLBgDbkvEhy+19FC9Tz5GZ9RqAsySCh2ZehwQXCycbUTMhqlhP4e363ljFwg75ONkJR51h50JAWA88mWkIL/L6aEKwQGQFDqKegP6Dx3YqUCVKUUdhdsQUOLfCDog/tOxkug1lZuOiBos/K20Ujh3eGetmZiKPymD/n3FpdZkKfLbaAeeto/5l9dRuqGPwORP0ApjvnSfqU6Z/M5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM0PR04MB6915.eurprd04.prod.outlook.com (2603:10a6:208:187::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 01:51:52 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 01:51:52 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 16 Dec 2025 09:51:03 +0800
Subject: [PATCH v4 5/5] remoteproc: imx_rproc: Add support for i.MX95
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-imx95-rproc-2025-12-15-v4-5-bf1064ea8daf@nxp.com>
References: <20251216-imx95-rproc-2025-12-15-v4-0-bf1064ea8daf@nxp.com>
In-Reply-To: <20251216-imx95-rproc-2025-12-15-v4-0-bf1064ea8daf@nxp.com>
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
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR03CA0120.apcprd03.prod.outlook.com
 (2603:1096:4:91::24) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM0PR04MB6915:EE_
X-MS-Office365-Filtering-Correlation-Id: 17452d5f-ac6a-457b-94ec-08de3c45af4e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a21PN1hNNmVNNlI4Ty9kUGRxVW9jZDZZWVc1Z0g2ckU1VGlqbDFNNmZBbmZ1?=
 =?utf-8?B?RVEyTmlRcFA5ZlBRd0dXaGtoZUNxSjVoRi92SFBTdGpSSC9rNTRoUGx3NURo?=
 =?utf-8?B?YkhSRW4yWVJTcG9pSHhiT1R2TVYyYXZXQUtEVklsQkRBTUlWTFFYU1Ezclk2?=
 =?utf-8?B?dFlyalZ6S3BEcnhBcng2NXpzY2lvNUI5cnd2NDQ0L0N5djNDSFhjdmtoOEFx?=
 =?utf-8?B?WDIzUXphNktxUUg5VEJzQk1iVDBsdjRISFZGYWFPRUZydW50YWl5ZWxVbmV1?=
 =?utf-8?B?TWZLMldZbXlOOHdoQU51Y3lMdXFicDN2M0R5cktESXoxQ1RHdTVtdXBaeEdK?=
 =?utf-8?B?Vy93aHpHTWNrWmFmenpUUHBxdE5lQXNxNFVHdHJsR1crcGVqQ1FxUWNXckRD?=
 =?utf-8?B?TytnVmVSOXFEOTlwbkplL3pBMUFTVEc0dFJXQTZFZmN5anRsd2hkM29acjhT?=
 =?utf-8?B?Q0o0T3Y2Mmk0RjBLUkxyZWVyZUZ1U09QTm9ac1VQZ083UWhIZDk4cThPNkZr?=
 =?utf-8?B?cS9Tak0zL0k2T2c2UlhEb1p3alcyTldieDFGbi9DNjUybDkzZUJ0eEJoVzlH?=
 =?utf-8?B?WU85bFAreHB1Nm5RL2RyWDNFTWZKeS81RFFmQkVqNXU1ME04eW01dUlVcGlU?=
 =?utf-8?B?N3lVUlU5MGtkN0JFZjhSajFTMVRBR09FSHlPYXBhMTlTNkIyaldVcW9kQXBy?=
 =?utf-8?B?UzhwMXd2cDRCYWNJSy9Pb0xZeDVnbDVmR2Jadk5RakVBdUdFbTJ6a1Rod0VI?=
 =?utf-8?B?Y1M2SFN5VSs5bmh1cGxRckxkTjVxZEZ3SFY4RUNiaXRPVlBBd0Y4cDlYck9z?=
 =?utf-8?B?NGhPVVo4SlJtaXRobDlaRWhYZkl5WG1nS1o1TkEwTlJWNmtXZ0x5MEFBZytK?=
 =?utf-8?B?bGUybndGeUpNMnZ6aFhhVm5DMW9ibDM2UmQ3eGpQTkxrQURCVkZGTVQ2eGVm?=
 =?utf-8?B?ejhROFExcnNkQUJMRmZiTXdraVU2TmptVE95Z3ZJbk9Xa003NnI5T1dibWxO?=
 =?utf-8?B?eFhMMENLSkZEZjFvSWlTRVBRSEpxR2NsWGxseVhidmllRXowVkM1Tmk0aVNo?=
 =?utf-8?B?NWxBWWEvT3RMMjluWnFCZXg4SWc1RE8xOStqb0FSc3FLeXZKKzc3enZST1M0?=
 =?utf-8?B?alBKVm54VXNYTDBPNVdPc0wvaVVNcmNZZVg5NmdZdjdOdXhpaUVXUkQxbGha?=
 =?utf-8?B?QjJmZko0TTRHdDVaOGRXRzBhOFBpd0QzM05haUFEMGdUWmx6Rjl3VlZhQzYx?=
 =?utf-8?B?NmdqdHZtSTVWbEUzY0VWMXlrUTNiZjZ1ZVNGSm1UWU1DdGRmWnhxNnNnLzZT?=
 =?utf-8?B?cVBDK2tpeXhqSUdMMEVCUkJJdHc5MDBLSDlmdGdhclhlRHpaMXp0bUQ4Wmhs?=
 =?utf-8?B?ei9ieS9GVkdGMmg2U3cwL0hNNXhEbTZzVXRZL3ptRFN3ZlJsNmdzNzZoelhB?=
 =?utf-8?B?blA0VEcrTVFBelJCaHhPK09GeEFOL0VhRitLZmRuZVNBWmdadWZBZmt4Kytx?=
 =?utf-8?B?WXJJU3pJWlFyL1ZYQUFveWczYzR3TWlTWFNScFVsRFpOV3U0L1dZVXcxQ3N5?=
 =?utf-8?B?ZTV3am9rb2lreTdJcXRWTmdEZUlUTk5Dc25vdmpuQ0wwOVoyWitxQ1owc2RY?=
 =?utf-8?B?MnNmN2RkL29wbUl1YzBNZWtxOCtxM0g2eU9XeUhDSzFBelJyMVE0OE1FUWJt?=
 =?utf-8?B?eWRJYklIMDRVUE04K2YySkllbThIQ1dsUVh5VnJ4UlFBZnRNRUpndE45U3Bm?=
 =?utf-8?B?eWlVd3haZ0FxRDE3WU1FbENjbzgvUUYzYTBIcGt0NWpud09SNnhLRkk3akxX?=
 =?utf-8?B?YnV6c3NxeDVmcnNmN3ArVkJzalNuUmZrOEE2VnB0T2tQanpWSml3MFByZGZ5?=
 =?utf-8?B?c0lYeWtyNnF2cjN0dnBSUm9LZVl1dXhqcTdQN3gvazlhT0Jlc1RPUFkyYVpK?=
 =?utf-8?B?YkwrM3RoVTF3SDJwbXZld1NkQ3N5ZmM1T2ZLK1JvSE5ieVhmN0JkeXBFeDAr?=
 =?utf-8?B?a3lOSTZWVnR1U0YwWThuZjJBa3h3Qk9KeWthaGZvR0I1eHhubUp2T3BwS3ZR?=
 =?utf-8?B?bEpGN2ZaZHdGTEJVZ3RMeUorcmh2cXFYeXQ5Zz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHUrRXlkZFgzcnN3Skk3T3NPU2h4MnF5OU1vOXpFMGdNUk0wdGZFWVZvekNU?=
 =?utf-8?B?L080Z1hSMXQ4YjZTbzA0UWpHbTYxcWdmQVJTNVZpOGNxTDZqcjdSMmRKL0pV?=
 =?utf-8?B?TWpWanNyUG5JbHRHaDVINEQxV3pMR3VaeWJRb1VyS2h5cmlEZSthU2ovbGpZ?=
 =?utf-8?B?VnFCcmxxczdXRXBZUThHSGoxZW1IRHVBUTJWZUFPYlU2ampJWHVFMWpSbjdp?=
 =?utf-8?B?amZVVjFIZi9yOEpML1QxOXNnbXNiSHNvMVlDT0JaWHIyZGVHMC9OUk9lKy9U?=
 =?utf-8?B?ZjJINFpkUllUSHpmWnE3OFFxMHpYYitUS0hGOFJMMy9CSCtOUFAzWStsZGhL?=
 =?utf-8?B?K2ErdW5mUzBHK09Sb2NoUjhIZWxEdW5wTk1zdCtUYmlGQWp5S2U0SVFvVEJ6?=
 =?utf-8?B?ZzhIRmZ3RS9FT2xHU3IrQk43RE5TeC84SUErck5TNlJUdStMMWFtaTVva09j?=
 =?utf-8?B?am9hWlNwV0ZTVUx3WCt2L3M1UG5uT3l5dUFGNjdvODZnVEJDREdOdDdvU3hZ?=
 =?utf-8?B?N05BT3BXMlJYN3J6UFNQWjJOTWhuRE90OXpTUDdJYVhFbUttUDJNL1lYUXhG?=
 =?utf-8?B?UWg4VjkxRWw4NmRMdjFRYkdjVDZxOHg2ZU1neDA5aEZVV1AvbWl5M0J2ZnlF?=
 =?utf-8?B?YmNDM1doQXJTbE5kMTEvYkJIYkhpN1k0Tk16MXZMaCtaVkdZcUJrZTNkOHZW?=
 =?utf-8?B?N2pLYnF0dG1jNU5yV3FEMFl3d1B3VU52QkVnWHNBSzZiOU1hbThsQ3RXNlM5?=
 =?utf-8?B?TG5ZYlN6dTRzQWlieFZFNVphVCtuMXhFV2xmRGUvajlsa3RmSmhaRlhwNGdW?=
 =?utf-8?B?dnczektETmRXY0FIRWcvU0ZCTlFqRUlsMkF1b1dUWUtrV0owRXhRSWpvc2Uw?=
 =?utf-8?B?SEFWMmlzaTlLbHFRTk5YMENUdHFnTzBJSVhUUU84akxlcXA0V2F0cGsxTjht?=
 =?utf-8?B?WkRLWG1HZ0E2TGpaQWZXNUpQSDUyOWkrOEdHT1VjNXdxckxQWFZLMEQ0Sm81?=
 =?utf-8?B?OGU0eUNGKzVzSzJTM1dNelNzV24rSXpYRUs4NG9OeDdkSmVSUWVGelBJa0lh?=
 =?utf-8?B?b2RnMGF2djcrWThTYi9vc2xhMWlxTWFjVmNCVW5tZkw3SWxWb2Y0ZVRoaXlm?=
 =?utf-8?B?Z1FpRzl1OGxuNWNDTEdCUDdTWWRDR2x1M0hoZXNHZmh1OXY4eDZjV0lHNkdL?=
 =?utf-8?B?Nnk4OUU4OFpnRlRpMkxMQ1FqUDl2d0plVWJsdDZENUh6WTFlZ0JQTHNIcjBi?=
 =?utf-8?B?ejdkckdlODdmbllKQm9Hb056aEd1dXBYQ0RJZlphU3Z1eFV1YlVlcDcxaEJj?=
 =?utf-8?B?Uzk0dHJibm1KZ0grY3ZZelMwVjc1MVQwMWxUMGd1Zjk3c0xWS1lzSzg0b0E2?=
 =?utf-8?B?cWp6SG1HT1FwbHFXVmJveVdzb1ZsbDVkV25NbUtNK0p1OW4yVVZtdUtpWm1R?=
 =?utf-8?B?YzZXMWJldExLSmh3QTZxUjFzWFhpZkw1bVBma2hHdWVSMnBaL2lCZHJlS2xT?=
 =?utf-8?B?b1dHNnJORHBMVmpBNHZkcFNybnV6QUlIcFp1TWNIbFZNNDc1UkxTSC9xUnQw?=
 =?utf-8?B?TlVYVWRuV2VxQ09jN2RHQnRWbTkrc1ZNYmVuUVpXWXNQSEY0Qm52Z0VLTDlk?=
 =?utf-8?B?RmExZzJENDhrT0t5WVgzYTVCTUFXY0VnMFV3UWJVRzlnOEtqd2pqR1JoTDJM?=
 =?utf-8?B?SGtFUFFUMHpzU2dXMWVpcGJvdlpxV3FVU0dXcTJhcThDQi85bTd0TlBSNGVU?=
 =?utf-8?B?c3ovekFuTlEwWDkxZ0VybXQ1WlA5VUFRa2VMRzQxdlVhRFZuTlVFNmM5WlNw?=
 =?utf-8?B?bkpoS21QSFRqaXdrcHFMMlU3UllrT251ZWRPc0hxems2RHZ1amg0VnFRSnVq?=
 =?utf-8?B?SUJRSDdCVXQrZ0RBdGhTSWhKVFM5M0JFOStjaDVrOXo5aXk1RkYyMEcrdW03?=
 =?utf-8?B?QVYwdGdTdFdhMTZEcnlhNXl5OTJrbDMxVzdhYkF1TVUxWHM1aEVUdExWd1Az?=
 =?utf-8?B?UUZQcU02b3V3aHR2aUxvYWdLSTdVTHhqWWZ3Ly81MXJWREhQd09Tdnh3ckpM?=
 =?utf-8?B?UWw1MVhrR1BsTnQ3RzZ1enhXMnlTK3FVakljR2ZKTThnM1hiZGE4ZmwyRXFa?=
 =?utf-8?Q?y+E+fUIp8kkPJz4/897w22KV+?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17452d5f-ac6a-457b-94ec-08de3c45af4e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 01:51:52.5913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZMSwx7kg2vnrkFtWq6LNZB+ZOhraLQVI7e1gzSzqPcUnKXOT2jD3AEZZJ76e5ZPwWoNpIE1XNVLiSTXD2+DgGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6915

From: Peng Fan <peng.fan@nxp.com>

Add imx_rproc_cfg_imx95_m7 and address(TCM and DDR) mapping.
Add i.MX95 of_device_id entry.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 55e555f2b5dd63e7d82996437e792a8152c91521..b2d0be0afc995a6c285c8afd4e294f95491ebb7a 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -130,6 +130,18 @@ struct imx_rproc {
 	u32				flags;
 };
 
+static const struct imx_rproc_att imx_rproc_att_imx95_m7[] = {
+	/* dev addr , sys addr  , size	    , flags */
+	/* TCM CODE NON-SECURE */
+	{ 0x00000000, 0x203C0000, 0x00040000, ATT_OWN | ATT_IOMEM },
+
+	/* TCM SYS NON-SECURE*/
+	{ 0x20000000, 0x20400000, 0x00040000, ATT_OWN | ATT_IOMEM },
+
+	/* DDR */
+	{ 0x80000000, 0x80000000, 0x50000000, 0 },
+};
+
 static const struct imx_rproc_att imx_rproc_att_imx93[] = {
 	/* dev addr , sys addr  , size	    , flags */
 	/* TCM CODE NON-SECURE */
@@ -1431,6 +1443,15 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx93 = {
 	.flags		= IMX_RPROC_NEED_CLKS,
 };
 
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx95_m7 = {
+	.att		= imx_rproc_att_imx95_m7,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx95_m7),
+	.ops		= &imx_rproc_ops_sm_lmm,
+	/* Must align with System Manager Firmware */
+	.cpuid		= 1, /* Use 1 as cpu id for M7 core */
+	.lmid		= 1, /* Use 1 as Logical Machine ID where M7 resides */
+};
+
 static const struct of_device_id imx_rproc_of_match[] = {
 	{ .compatible = "fsl,imx7ulp-cm4", .data = &imx_rproc_cfg_imx7ulp },
 	{ .compatible = "fsl,imx7d-cm4", .data = &imx_rproc_cfg_imx7d },
@@ -1445,6 +1466,7 @@ static const struct of_device_id imx_rproc_of_match[] = {
 	{ .compatible = "fsl,imx8qm-cm4", .data = &imx_rproc_cfg_imx8qm },
 	{ .compatible = "fsl,imx8ulp-cm33", .data = &imx_rproc_cfg_imx8ulp },
 	{ .compatible = "fsl,imx93-cm33", .data = &imx_rproc_cfg_imx93 },
+	{ .compatible = "fsl,imx95-cm7", .data = &imx_rproc_cfg_imx95_m7 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, imx_rproc_of_match);

-- 
2.37.1

