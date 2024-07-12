Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010003.outbound.protection.outlook.com [52.101.69.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859B32E3E5;
	Fri, 12 Jul 2024 08:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720772770; cv=fail; b=Ffwqzl+0WakDKhNmpP7TmF/DE9l9aExIb2yuRGKZON4rWvtq573hyJi2lNW7JkSA8ro090NdGnyJIk11BFKYLMxU6McXLoQD7PQ1W8UTzOKwQxl9rxILJZTk+oQ68sK5WgaTgqINu9QF0u6ogtno9ytbmH2ZePDmxLHWlvc3ISA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720772770; c=relaxed/simple;
	bh=xGYDfKpsona5KzQLPgocm97k/0yn+SUFf9wNJcGYNLg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=MlSPnP788PodSyjkbOiPad4VOUA/kMgsYXx+uHS1dubwvHkskMeMqqNvf6YRGtOqnBgqUWFv88M3NoACe9pYf/MvOMjSvnQ7nbUI9guwZ6RGZE4eaIrZW3vR0ylbwOCIArjKI7EJ2pdVYYqHAK/nxRwZ/rm+zz2PPw6GrwmHgDk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bO05qAgN; arc=fail smtp.client-ip=52.101.69.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bO05qAgN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QrcCGA+WBPiGMTnMPo1IKpXTj9SSh8fK1Qcbjzn8CsaRTcLRG08NUKpjllgHc2Uyeka0gLOMesd2tx4jT8RDIOJ2pBg+i9RraMyrLsKA01MRSeUKApml+ZoiIIWt6Ic774++/G2DDJdBhIeXgnuFkXtyAXQQF3e0LZGpM1r4LzDdiH5Kp+YqDHZDd8fLqZUe659gewhqfZPC8zK5GtTlIc/owBF0+S15qkKxtpbfjOQUk6tb5UJZllxltt1FJt4ZWCBKzvZ50T+MTrWKCLPTAsEgpgGi8cbdoFlcTYAyYhOgF3qlTDKHe9ftKHOD/ALpeHcVHOkmIjxBA77eicPm+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vKXMiTqaYlAeFcfVRMSl+kE94XTGFTZfh/amtvB+/tc=;
 b=nvkkKP23x/RRlzkq0OcjsR39cpjbyavRvj+bE47wWqYjDtr8/76IhpnjyFRtsyLzOl/W8rMc1BbVmgVNwoBqPmZjUuuhJ4eRUVFZk4Kh8RSnLmGueB4PhPFmQSf3yX7ivn7QqrmM+QXhFK/X5pem50KHKjiApdbeHSMfpzSc/9ADK4Skg8nR1fj4VJh/jEF2JcFvYMFxtM2MDR1bJiZT/TBttLQ+xvIFQQ1bcf9Z1CWvFALjjfBZQqe8ZQYxlgr8jbkDm0qeJm4AZKSZSy6V/CZJK1nMuRSlc5PPB5/XXGgseGu7zm5fsN4HmlE/fITaP9EitJu/z9oyz1aHXp/nTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vKXMiTqaYlAeFcfVRMSl+kE94XTGFTZfh/amtvB+/tc=;
 b=bO05qAgNvwWouwVWQ37UP2JulJ143zyielhPpJbtnSPl3kWoo8RlcKI5kFyIUzAwZgabAe3ZBJv6nN13a9aw+qgQdqASgeyFGJWiZrEm1qlqU5HPOG4qBvtGIGmwYZudTHC2k3VMh6qetcrqcU374K9KpMzF8Ur3pgDR2UO0o5k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA1PR04MB10865.eurprd04.prod.outlook.com (2603:10a6:102:48a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Fri, 12 Jul
 2024 08:26:05 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 08:26:05 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 12 Jul 2024 16:34:55 +0800
Subject: [PATCH 2/6] remoteproc: imx_rproc: use imx specific hook for
 find_loaded_rsc_table
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240712-imx_rproc-v1-2-7bcf6732d328@nxp.com>
References: <20240712-imx_rproc-v1-0-7bcf6732d328@nxp.com>
In-Reply-To: <20240712-imx_rproc-v1-0-7bcf6732d328@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Richard Zhu <hongxing.zhu@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720773307; l=2180;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=5OwRNu3cAz+Ue3vFIv3+yTH/B5Et9HcjPjl6alTKnUo=;
 b=v90UbQqD4jNEucmhcJp6dCBH7dL4H7jYSrAZE7VhKXG0SopTZ9Q7djq+aZlWO/dv07yQooNUW
 mL712ueYeuLBDlci6atMOOKanvtMz4w45/1qAumz5qaS0K6tG4gFXOc
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2P153CA0013.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::12) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA1PR04MB10865:EE_
X-MS-Office365-Filtering-Correlation-Id: d670bc45-095d-4cd0-c4a5-08dca24c45de
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Sm5ST0FIdlJpWkJXalRHbGRBNGxRRkJvOW9pK3JIbFVqak51dERSemZXNi93?=
 =?utf-8?B?eDNZeFcrdDkwNHZpRXpjdFhheVA0ZGRUNmd4UzVrYnBBQkpPMFR4TjlHdlE4?=
 =?utf-8?B?dW5LRkxCTklHcUdvamV4aThEMUtOZjgyVXhPTWtFam1ETTJ6cmhpWDc5eDNL?=
 =?utf-8?B?TDJvM0puZmViOXdRQVEvMnBabkVtTWZOY0N1YjNVQ25lTDRyU3FWbmxVNW9Y?=
 =?utf-8?B?ZHlkOUVkU1RBWEtZUUxleGtJZXhNaXNBZldEbjNnaHNGOE1VcW9YKzA1MWNC?=
 =?utf-8?B?MytkQXJIYU03VW5wNU9TR0I2QlpiR1IvZk4zZ0ltcndCbS8zeWkvbmcyTEFo?=
 =?utf-8?B?YXFXeFpEL0F0aURRakFsVVN3UmwyRE5EaXp2VHlXRFdsazBnekZkeHVSTERE?=
 =?utf-8?B?TzBxUmpUd2NlZWFDZmdXM21kV0txa0s1azhqdS8wWXB1Rld5QVpURk5NblBv?=
 =?utf-8?B?K1J5cVlKd0tPL2JZUW1lU2RZWFIzRGIzRFIyK1VRSXoxQVVaUCsrKzBiZStB?=
 =?utf-8?B?TGVUOTdWRC9kQXRGUDNlRXFQQ29aMUZ0ZmtZTTI2NTByazR2ejB6V1lMaThj?=
 =?utf-8?B?ajQ1dUxJemJJZm92SUxzdUFmTytwRm9WNDg1YmZRejQ1WUpEaEl2T25pQmM3?=
 =?utf-8?B?bGRtSVF4clhFNjNtemRyUzRDMSs3SVZPM1FubUU2a0tHbmQ5aUtvSk5rRkp0?=
 =?utf-8?B?UGgwemw0SnE2Z2U0TCs3bTU1U2pUeXU0NXR1c0NSZUxhQ0NTa0pxZUtIVklK?=
 =?utf-8?B?LytXK0UxL2pwZUtuSlMvb1UzZVQ0VUFvVTgwa0NuK0dpRnlrRG04RHNVVTlp?=
 =?utf-8?B?dUFWN3BlMDRQbFhPenFlUXFWYmx2Ny9vOEhNMGZhVkdHVWM3dlVlZWVCUkh3?=
 =?utf-8?B?NGM1d2R0Ym5zcFdZclZXSktSem1wUlVMUTJDaU8weDg4b1RlSzNsWFNHZHdS?=
 =?utf-8?B?Z3pVY281aUNEc0dsamFYN0dmR0s1Mitrc3NTaEthTVJwK3dWakdZM0cxMG1J?=
 =?utf-8?B?NlV5TjVPQzJhcSszbEFyYmVBbm9QbXBWVWpqWGxzNUI1cnJhOHhxZFZjcHVp?=
 =?utf-8?B?K2daMEtVRFBhcnRDOHJ5SnhZcURHdXo3SzhJSTExbXpGZnp3TFQ1QUlEMno0?=
 =?utf-8?B?R21sNFU4L3dUU0pIQnRUME1nYW0rTXlqQlhQUnMvN2VJeUtDc1BqenhCd1RV?=
 =?utf-8?B?NTI0MEx5Z284dTd0YjBpNHJxSlFQNnRaY3FhZmZNWTV3UjBKQzdUb2JvdmY3?=
 =?utf-8?B?TjBkTFQzdzN5RXdKVlpqVVBpUldVUGpYRWVFU2JmYkQyNFJCWThXSi9RWkN4?=
 =?utf-8?B?NEFOanpSd3NBb01JV0o0ZnQwSCs0VGlEYU1GQ1FwekpLLzR6ZlRGQTlMUlVq?=
 =?utf-8?B?QnYwemV5ODVLVElYL3hYa05xWG1IV0RwKzFHNyt6QnpxZ0hNZ0RaMHc1WVEr?=
 =?utf-8?B?SHBVK0t2MUs5ZllCUFU3b1NST1B6MUxHWDZOMS9EZXBob3NqVzZmTit4eUpr?=
 =?utf-8?B?ZFFGdW1uMUQxa0NJOW91OUlIMkxLN3BnY0VHd2FOaHdrRUsrWTZ2OTAyWnhS?=
 =?utf-8?B?YlAyby9OTFJMclUrenZzNmo5a3JidXA0NThzM3pVNEwxUHdLeTlET1ZhSks2?=
 =?utf-8?B?bUh0ZFdLTWJURmV6RUhYWHlleitrRGsyTnA5WUp2VUFHUzZnT0JzTVpOV0c5?=
 =?utf-8?B?Vy84WXZJOThicVpyU05pbmhxOS80YzFJMnkrd09YY2t1cjhNWlZzcTBaODN6?=
 =?utf-8?B?bTF2cjhKWFVnWGdCSDNEbXRXMEVmVnkwVmd5MTVWYVNtQ21mdFFLdVgwVG9P?=
 =?utf-8?B?RlJrd0tpSmk2ZGlhTXVHWWI0V3FsaVcxemtGZno1Tkg2RytCOWtRVHZSZmUx?=
 =?utf-8?B?MklqdU1EVTdVQllSVmFHWml6TlNCVEROZ2hqL3NqZy80d0E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MDVYbDc3VDZkTDYycVQ3OG1xVm9LN2FUSDQ4aFpQOURyTHBtbmw3VWZNei9x?=
 =?utf-8?B?STduYWhrYWxWZkZZOHdkUCtsVENLcTR2T1IvZDZIYVhuSmwyZ3A2azRnMElw?=
 =?utf-8?B?bFgwOFJkZ2wyU2JFRHRrSEZBZWVOMEdBQTVZR3BGT2JsOUJXejVzSktOczFC?=
 =?utf-8?B?SG42b2poQVV4NVIrRUdQRDlST2lBUHNFN25WczNXN3VmbytmZnMraHZsMXBp?=
 =?utf-8?B?ZjZsQkV0cVR2ejEwQmpkRUdtWFRCNWk4ZllldWpjbGw3OXkyVFhlcWNZOU9i?=
 =?utf-8?B?QU9iUEtFRXdtekRwdUdEQXMxNWY2NXVxT2tWODhJNHVuV0JCYVZnaTRUQjUz?=
 =?utf-8?B?MjdtUWRmU0ZCOERZUW5lMERUYjF1MVNKWWVFMThvLzVoYzJSbEdWYy94VHBt?=
 =?utf-8?B?YzlRSUtwR3lhMXFWLzlJeGJoNlFPaVZSa1ZJN3owaDg0SlZyNVBiMlRheUEx?=
 =?utf-8?B?emxxbExQU2tsbFo4NG9LMHAvL2R1ZHFUaTViNlVtVXlyNjl3aDlNQVFzMHNV?=
 =?utf-8?B?eU5XTndndzlkakVXK29LejlhdWtyZDBSM3Q3ajBRdXB5VDZDNjdrRytXSG9m?=
 =?utf-8?B?MnFuOG4zVEM0SjhxT2FBU2dDTThySmVwMEI4VGpCTlF4N2RrNzZnYTBERVFx?=
 =?utf-8?B?djBKdGhCc3NIOVl3UVJNU0x2WDVUSmtFSGtWelk2bVVWVjZMZW9oY3FmTE9X?=
 =?utf-8?B?RFptTmxrTzlKMVk2cE1acnQyYnNvQlY0bElFUFp6T244QzhZTmFNbVgzU0E5?=
 =?utf-8?B?OXdCRzR2bFI1SloxQUw0RWZQd3I5ck8vSGRlU1B5OEFYYjVxdnRsL0dET3BG?=
 =?utf-8?B?a250dGFVMUxmRHY5S0tSZU9WMmF0ZVE0NkhTQ3JvaldUOEM4ODZkZEFyTndD?=
 =?utf-8?B?MjNBL20rR0R6QzhjYjRuNExXVmh5UVljK3lGbWxVSlFWaW1Ra2hyYVJETm1W?=
 =?utf-8?B?MVNyajhJQ1l0ZVVXRUh4Y01KU0Q2NHVNOURGU0NLbkNnYjVwRDRLZDlMQUlN?=
 =?utf-8?B?QnUvTWF1Y3UwMWRDUWlQYkVnZEVhTmJjSDZ4MmpwOXVCR2lGSWRkKzhtSkFo?=
 =?utf-8?B?QkI5L1JiaVdKZVJVODB6ZHdKWDcwaXFaZ0lHTVlTYUdRUUxrVFR0Zm9kV3B0?=
 =?utf-8?B?UkoxbExKUG9Od3g5ZWhoYzVCa1I4R0ZNY3VyMDdmdkRTWFlaQmJvNHBHWlJs?=
 =?utf-8?B?cmdPUGo4RmFjSzFYNXRKSzArR1RDNytIVTB0QWNRbE9EYXhUaUJwSTRDU0w3?=
 =?utf-8?B?N0tkYVFnNG5BRlZuOFUrSTczcVBoc1ZOZm1FbHRyR3lob0NQUmIrTnpFZnYw?=
 =?utf-8?B?ZVozUUtqdCtJUy9GSkVzcU41cjVBNERTcWtZNGZkYS9yQWo3S0FRSjBwZlRn?=
 =?utf-8?B?ZUlkM0JPemJWeUlHQmlHbm1xa1hHWUN2Z2EzYjJ6MzAreFRkRGlITzgzcUlB?=
 =?utf-8?B?TllBMjZzQUJHb0hPbW5HMEE3T3BJWUZ5TWRpN25PMEFrbStyZlZ6eURXV0dX?=
 =?utf-8?B?eGlSazBQSER3aVhOenI3U002d1Nvb2ltaklEczlHeDBiRXB6ekkyR3N4M2pY?=
 =?utf-8?B?VHVjMXhNMzNUTG1zY3VxOXBMRUNhZkJTZmlrWFpPTVVYYmgycERaa1JheGRQ?=
 =?utf-8?B?ZWFET2NzUjQ1a3I5ajh6dzZGbisvVFpMbS9TOGJ1d044RXgwRXhpanRVM3N3?=
 =?utf-8?B?NUFWanE3a2VTNUx3ZUVNUEFoT0ExZGN2L01oYkR4RXExUHpYb1RKNFNpczVK?=
 =?utf-8?B?SmtDa3NVUDV5bkNjT0Z0UUNZb0lGaXNFYkFUOHZkY3RVdSt1bGl1NUJXcTU5?=
 =?utf-8?B?T0p6YURzSWlQTFh4VTBFMHBpY1MyS29oMGpONVd2KysxcFFuS0o1YXdra01X?=
 =?utf-8?B?eENXUjc1TEl5RHR3UjMxT0F6TVg4Q25VY2VwNWpsTWRmclAzYmRSWG10YWdR?=
 =?utf-8?B?azVjSjIxTHNPbHVjQjdHRUpzK2JueGZYREhZeUwvVG8vdXJ0d0h3S0lkYmxK?=
 =?utf-8?B?cU5DZk8rdkhOSTVSQU8zMURGWnZnSEwzUkdXNnN4V2hzTENreWVIcVV1c0cy?=
 =?utf-8?B?OGhCWkVHZEZZUjVuQ2JXQzYwR3lGTGlHTGtIejNsU3dBOHRKSUFGZmVpV3dm?=
 =?utf-8?Q?+xUeCmu4VXrO0+KJk2XTl7VPo?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d670bc45-095d-4cd0-c4a5-08dca24c45de
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 08:26:05.4425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MXiVTd5iGMxbIMaCoBgW0hjEzOhwRwO1Ac8t1Gojwzvo7094xQGEcJsfyrtg2HgglvNXiX0uC1WMix0JoNmOaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10865

From: Peng Fan <peng.fan@nxp.com>

If there is a resource table device tree node, use the address as
the resource table address, otherwise use the address(where
.resource_table section loaded) inside the Cortex-M elf file.

And there is an update in NXP SDK that Resource Domain Control(RDC)
enabled to protect TCM, linux not able to write the TCM space when
updating resource table status and cause kernel dump. So use the address
from device tree could avoid kernel dump.

Note: NXP M4 SDK not check resource table update, so it does not matter
use whether resource table address specified in elf file or in device
tree. But to reflect the fact that if people specific resource table
address in device tree, it means people are aware and going to use it,
not the address specified in elf file.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 3c8b64db8823..48c48b53a3aa 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -666,6 +666,17 @@ static struct resource_table *imx_rproc_get_loaded_rsc_table(struct rproc *rproc
 	return (struct resource_table *)priv->rsc_table;
 }
 
+static struct resource_table *
+imx_rproc_elf_find_loaded_rsc_table(struct rproc *rproc, const struct firmware *fw)
+{
+	struct imx_rproc *priv = rproc->priv;
+
+	if (priv->rsc_table)
+		return (struct resource_table *)priv->rsc_table;
+
+	return rproc_elf_find_loaded_rsc_table(rproc, fw);
+}
+
 static const struct rproc_ops imx_rproc_ops = {
 	.prepare	= imx_rproc_prepare,
 	.attach		= imx_rproc_attach,
@@ -676,7 +687,7 @@ static const struct rproc_ops imx_rproc_ops = {
 	.da_to_va       = imx_rproc_da_to_va,
 	.load		= rproc_elf_load_segments,
 	.parse_fw	= imx_rproc_parse_fw,
-	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
+	.find_loaded_rsc_table = imx_rproc_elf_find_loaded_rsc_table,
 	.get_loaded_rsc_table = imx_rproc_get_loaded_rsc_table,
 	.sanity_check	= rproc_elf_sanity_check,
 	.get_boot_addr	= rproc_elf_get_boot_addr,

-- 
2.37.1

