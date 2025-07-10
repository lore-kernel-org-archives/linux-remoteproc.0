Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010008.outbound.protection.outlook.com [52.101.84.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDF524DCEB;
	Thu, 10 Jul 2025 12:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752149410; cv=fail; b=af048HTc0CguZ3XwsXrXGZRC6EHczb43kkz2rmwzTw7HA62R0KtsuutyLBUdNQbAel1yVAOYOuJKfibXBbmuH8N5NXUeegA0onQwh1J2mEDK8wcPTttFKbgT1TkKPtzqK44BAdO0dnOUsOR+hiIwStKsvkjFv3EwHMWQeUXrVgQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752149410; c=relaxed/simple;
	bh=Gn8AanCwjay2JI77GrtpgXF6F5gweYuV9gKPS2j8sc0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=BCP6hV947jb7Kruj4N7XGnbErFtzpbQlO2it6I6W3EFkdA1qhzZOMJf0b/rdfSvEJixBxwjQOmmlzlNdmT8OQ1ypwy5dm3fyrqWAtTfXqO9dPzswNYG0WzfujUGzkZGKfNNFlvQ8MdnxPlh9shBbLZW9sXWoJMhOTWhT8D4V44A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=oNafRPT4; arc=fail smtp.client-ip=52.101.84.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="oNafRPT4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R1mCPG7OWTcT65ZaUlncGyKbN4PHAs2a5HlBXipsaHlqfqgBQLHc/gK9JztL2aEtpbmj/JVfVJATVMvnjy+mH6aN0qT5APFWkOyTzPjrA+jLx8UQ6g7Jj1qK5j1LkoWoC1l/YAq7xdG0sLk66vZaBBvU63BuYpxmKMboDCpcpo61NP42+q+bYu+Npme+Q/8eXhNTWfM3VcUH7rtV3pnFnnYJXQ/C3xChbKeLOY94zS5wVEzFgBOEUf4SUA6suRQ9sMt1d8MoPOdznfKtc1vE4UPagEkQ2Lk9xIsoLYSYNU0tDTGPakJnsjJFwUtfx+2xaB9K+fUC02imW1zFJVYKUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mq0NmtgjYej1VQuxWa5z1Q2xl6VISmwm3tPi1mnGGeo=;
 b=a4xxyHYUcFfeDvxWELa6Ra4eq9yJapRGsUuNFrZcRFQ7GAh9S5VEGxYILRNkgluS1vWis34+ds8xo5W1TvCqEZNEtaNFfhdCL3DzsKfiVyte0x8NeVC7ktIWiyD1EnSW5W/UbRA+3PODQab9yECslgtS+lMvoZnRzx1uScLf4imv3qSTWhxq3Z/RBWhpn66nq/40VM9aXk5ByvHGFlMgA5kLcxAx9fJD+GsOZnpDp9f/W44bNtSq+fev0zNKck/DQETq/soiBcO3q6oKa10PD4iuRWpORtcjxovRdl67EYOLvZsgyNSqG6N7qR5A1Sjy3zaJE1AXqiuR1E9evdxCkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mq0NmtgjYej1VQuxWa5z1Q2xl6VISmwm3tPi1mnGGeo=;
 b=oNafRPT4SwIFnvc3GXvKIU5YlD5Fm6WS/AqYo0eDPosQUcxUl7Fw9VK287qdPGFeE+l2qCJrmf7amI2MSqNnW5h9/Ga4qV7kyBf8Ztu+EWjjgZYq8eclY50UyE+B12lLFn66ZJQsoWg7YzY0bl1l8TG48vu6U3c3Z9lcgQLgMQ5fKjfuMLKVt1BjqmEX261KivSaXIi8MqWIOr3MAKjdigEc+J1FwSDNgln0FR+QQ5p39MlLv/OfL/nSElKHojSVAW4nFKZsqYiBCyJY4fqqr5N8Cv2JhP9vtjmIO/JTbyeuGS8sxJvuoAgASaL7xkxJV9bNSOnT8r2QBSgHQTwdzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA4PR04MB7983.eurprd04.prod.outlook.com (2603:10a6:102:c9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Thu, 10 Jul
 2025 12:10:06 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.8901.028; Thu, 10 Jul 2025
 12:10:05 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Thu, 10 Jul 2025 20:08:01 +0800
Subject: [PATCH v4 1/5] dt-bindings: remoteproc: fsl,imx-rproc: Add support
 for i.MX95
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-imx95-rproc-1-v4-1-a7123e857dfb@nxp.com>
References: <20250710-imx95-rproc-1-v4-0-a7123e857dfb@nxp.com>
In-Reply-To: <20250710-imx95-rproc-1-v4-0-a7123e857dfb@nxp.com>
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
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752149291; l=884;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=Gn8AanCwjay2JI77GrtpgXF6F5gweYuV9gKPS2j8sc0=;
 b=lngPwwqNFXzZoZvR7TBaxrAr9aWpZkV2z+XgoMiwrkjgbf9FUhMR4IPcqqUjCuuC74HmTBUo0
 drfW4ZgvG6pAUsTHmhYq0M2ilP+EIOeZm+t5BWy81EfcDYMbZsiF2J1
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: MA0PR01CA0071.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::11) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA4PR04MB7983:EE_
X-MS-Office365-Filtering-Correlation-Id: e8f237e1-f043-4c87-792c-08ddbfaab4eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|19092799006|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ekVTaU9LYnRWZmNLM1hnUFFqbURhN2N0alJiWmNvRXk2WGUyZmRFbkQ5Y0JN?=
 =?utf-8?B?eGRqMGprVkdCQUYrMHFTdzVDRVZrRzY3OHc0cUVyT2tnQUtmcGhGU1ltUzFI?=
 =?utf-8?B?UGk5U3NEdWpHNE5NbW5odlAvMHozWFRjYksrWmxwa3llbXUrRXJEdFQ0SjFs?=
 =?utf-8?B?UWh6KzRqZjNGaEhQbEhGdktyY2I4Rk1Mcjd3TnM2TW4xT0JrZ3hZU1NwSEZl?=
 =?utf-8?B?OWRoemUwUHFybGc5d1FVNTVsWGlDZ2J0UnB0L2VoS1A4NGdpUjQ4cm8xcHZn?=
 =?utf-8?B?Y2VuTWlUVVdaWTlBNXZrem12M0lvVU9IWW9OOTFNb3pEenI3WmlSZklFeVla?=
 =?utf-8?B?YS9EdUFOR28vQ2xnbjgvT1RXZmFaeE43aVd6VitkOHBxU2dOTUxEbHNzTzRL?=
 =?utf-8?B?OUxhNkRDT0dYd1JoZStYVXQyalllWHlpYWxVbzljRkdZWEExMkwyNlpMdEJp?=
 =?utf-8?B?VDBFZFBLQndFc0MrV29TTmJMQ2ZXMWEya085ZEdzcFY5a1h4eFljSTRUZDg1?=
 =?utf-8?B?dXRKSjZnWXR4TldYYVJHaGx3c2hEZG1VdTdQZWM5SU5wVXY0ZWxPem1CbGlV?=
 =?utf-8?B?VThXVDRSUjZsVkNFYkduMlpQNmdITTk0OU5hM0UyTzJOVkY5MWZJT254UDRq?=
 =?utf-8?B?OXpJc0tsLy93YU5SZEJ0ZjZmcnFPKzhNbnpEY0FkWHRJaFRmaisyaVdIa2xC?=
 =?utf-8?B?OStYVUZPUVlYeFRZOFZZSGQrN0FGcTQ2QVFzeHkyTjIzbEh5NHRxNk9sZHZv?=
 =?utf-8?B?VGExUk1XblJzd3FzbXJXVG1VQ0JscVNsSW9nRzdJZE1EczJvNEFRdENiL0NF?=
 =?utf-8?B?Tmg0OVNxYjYxd0RtVm56S25iT1lzK3k2L1ZicE9GWnpBRjZZR1hWakRTb3BI?=
 =?utf-8?B?d1J6RnZDT1A5ajdqSGdTVmQrR0ZjQWtsaGlqa21aRWw4YVpDaDVsc2RtaG5o?=
 =?utf-8?B?TWhQOUZKRW5PaVljUEFKd3AyTFgrNlRaMk85WjZvYjl1V3NQYitzamhNbWhm?=
 =?utf-8?B?WmhPaEk4QWI0aVRjYi9RUENjdjdsUHB0SFhYR3BGZEJQcndoeGluZ3pQc2R2?=
 =?utf-8?B?ZWpXNW43dGdlTnZkR1RFUUFkZkJIemdiRWFBeFB5MC81VDZGN2NscDFMcHpp?=
 =?utf-8?B?bzVXemlvc2FjWjk1Ym1zSkl4Y3p1cEpUNkpUMnJWb3R0SkVYTVRQS0w3NlRP?=
 =?utf-8?B?djdranUrT1VHMUF0MGZFL01yN3RWTGVSa2tMMnhlYXcraWhtQlNvelUvRlUx?=
 =?utf-8?B?ZzM4Q2hIZlk3akthQno4T3R0R2NnWkpkNmx0dkl0R3RmYnoxQ0lWTlp6Vk9G?=
 =?utf-8?B?b0xTd1B0N0xydVdNUi8yNGErTmtYZlJIQzhUNlp4K3d3SXJpeGlBUUdPRzZD?=
 =?utf-8?B?cndINEtKdTNBSWNkbUhDRHNudWFHS2xNWU1LV3NYK2llT3FzVUpZdjUzekR4?=
 =?utf-8?B?TXJRT2dQSWVveUU3SHdPTEJaYVFtald6T0daNHdGRUt0TmRIMlc0eC8rV2kv?=
 =?utf-8?B?SkRrR0J2emxVZ2hJa2dNc1RWVC9zQ3VYeFRhcW5SdTM2NCs5OU54VW1GWFZm?=
 =?utf-8?B?cFNUeFJUblhhdjBxTHVGcXZqR0FvWWhKazBnTFRxMUUvQzhuSXBBcW9EeU1a?=
 =?utf-8?B?VXZNTGRpSEl4S0UzS2wyM2pVUGNlKzA1OFpVN3puaUh6dk1IajdmVCtta2Rs?=
 =?utf-8?B?bmdiVGV1RW01QTlnM3BrZldlaXhvc1pKWFhLMmp1L0lkM2F3QUlCNTlEMys3?=
 =?utf-8?B?VEVaR1NyekVCU3NqbFY4Q3ZoQXJscU4wMEpGSUZaYXBVMXlmYTNmYlNjdG9T?=
 =?utf-8?B?Sk5lWTZTZVU5STY4eDkyKzdjdzF3cXNVU0hkMWpZeEJZY2tHRnJuUkZvMThL?=
 =?utf-8?B?OXhRLzFiWjYzRitva2hIZkJVODZJajVLMUF2OGtpVXd4Ky9Hd2R4SlA1YkFY?=
 =?utf-8?B?ZnREN3J2YUF4RkVrcHNGRjRaQWFDS3AvTXFBVjZmaGgzbjlqLzkySkw3UGdt?=
 =?utf-8?Q?8HX7khiYoja/ryAcSxkKkn9ehzFxZE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(19092799006)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmdvZm5kTVRSNitPYWNLeDFEcnZSLzBCSnpMK0JJa3krWU9GOCswdndsMnpy?=
 =?utf-8?B?UWxFeFBtT0crbEVhSWU3NFU3RVZhQ2luaFJORHVHQTVpbVR2dUNwMkRvYTF4?=
 =?utf-8?B?MCt1SXNlU0l3R0h3OURBTFlsb2oyYUw0RmxicCtXcGNsNzhMVUtOKzJkdGw1?=
 =?utf-8?B?SktnTk9mb2NjRExIdFVUNnhzbTZ2UWhpbHFtUmUwT2VWdjJHRENETTRQOSsz?=
 =?utf-8?B?TWFGUjNUeW1PUXdLMG1seDZpMEZ3YXF0TmNDN0xxR0Z3azZONVRIaEpiYjR0?=
 =?utf-8?B?eUtoZlVtYmthemZiNTBxMWFEbU1qVi9tQzFCeEZQaDR0TzlVa1FRWm5SVW16?=
 =?utf-8?B?SkpRQUNtRzQ0WlordnpNY24zbXdHSWVVZXhzKzJSb1UxaXZxUGtZWEJxRFN4?=
 =?utf-8?B?cTRtazY3WlhTZ0VBNEJqRnBpRERORHdBd3piTWFxVUFYaGIzakU3RzE4U3R4?=
 =?utf-8?B?SHpuTExWVnQxLzU2empnOFZyNlpQeWFtbkpjclBYcUZFNVFXSnZhbW5EU044?=
 =?utf-8?B?NnVmcXNHSVpmMzFEcXU4ZnEvbyt2dkVQbXpSd1ZPVjdtOERIbmJrRTNOMk5i?=
 =?utf-8?B?enE2aDRvU1FaVDlybU1QQy9JbzlkR014QThYaHlPUkhrYjQ3ckZ1T3FtY0RY?=
 =?utf-8?B?OU1xR1RERnpJcWVWdFRvT0lpNUF1UExObWZON3p4RG1MNUVpRE0zOWJ1MG1H?=
 =?utf-8?B?RVZOODlTUWo2bi9SUC9yZlhtemFva3FJWWQySXVBTUw3YVJla1VuYWpxL2VI?=
 =?utf-8?B?aU1NN1ZiWFgzdDNRb0NHbkVpbGUxVjJ0K2tZdTgvT1F4SjRWN1J6cnZNTU1k?=
 =?utf-8?B?WG9ZMis3YWlyNTRibDZUZ0dYSnZLUUk0UWRlTk5ZcHFRU1VmWUg5WEtnbzJM?=
 =?utf-8?B?QnhZdFVkVk13Rk1uUmNub01ESkZDbFZTTnZQVHgzZXQvMjFLVjkvbkRwM1Vu?=
 =?utf-8?B?ZjltcmFkSmx1eE5yUUUwMytQc05xdE5tVCs2QytsazI4aG1ScnpxS1pNNy82?=
 =?utf-8?B?c0VLNTlieDZHZ0RIcGs2N0hkUGNtVzZVdXd1RjB4UmhIanRhaUpzaUNsOGdD?=
 =?utf-8?B?MEhPY3lXeHlINHhLUG5EMXdlSmFJejZxNDFkNFVOYURsU0hBNWxORUxvYmxB?=
 =?utf-8?B?MWxyYUJFRWdkN3lNODVzcUpMdEU3a1AyOG12TW9jcUVqbE1ZUGhaUUZVVjR0?=
 =?utf-8?B?azFaRUlIc1BTVERxdGtJekxmeGM2UWVoRnNjVno2aFJOcFN2YzJ4VmxZM3Jt?=
 =?utf-8?B?NkVUTjFGUkFvekFpK0lTZ2R5Q1d0RWdra3BuanczM2tjQ3RQSXFoaS90RTcw?=
 =?utf-8?B?S1pGdEpYaVBvQlBlVHNYZm1iYklJUWM2bjVKRUlkUVJIT3dTcFMxQmZCdWYx?=
 =?utf-8?B?cnI5WW45SmpYMVNiVHBCQUpVNUNqU2JrS2lFcFk5dUdlTkpLNmNFa2VLUHk0?=
 =?utf-8?B?Y0o2VFVManhxNjJNUlpFeHBLd25UL0F6ckNDMk1ucWhjUWxwQ0k4ODNyaDNQ?=
 =?utf-8?B?OEhGeUVqUVNTWWtiQm9ZOWJvL2NzZ0ZieS9LWW5TVFJDMVd4TnEyUXJDcU5J?=
 =?utf-8?B?U2p5TWNyVGg1My9YQm1QcUx0WDZCcnFBM29GM2lrcVJDR0paRmVCdXRGN2pI?=
 =?utf-8?B?WFVDMVQ4eHl4Qy9GOHF1SGkwZy8rV240bGV6b05ZTkF2QURQODhNaGxTQnZr?=
 =?utf-8?B?Sk9QeWhpTzQwcms4djBzU2VRMllmYS9wVEpwd2pmcUZHOXQzSmt0RC9lRGQ0?=
 =?utf-8?B?WXVkRktLY05iL2pELzNVWXNnTUVTcmVBcW15L1hzaWdPR0pXc1RSODd0ZTg0?=
 =?utf-8?B?dDN5bWx5ZUZrSlZRci9jS1VzeWo1VStnZ3NJR3h1L3dLcFgyTzE3RThHaW9L?=
 =?utf-8?B?a1ZrVFRqbVFtZFdGVFBHZzV1eThMYjFLeXlnUXpMSk9ZS0VMcFZlSlNPdkhm?=
 =?utf-8?B?YlFJMG5wMjREY3ZUdDhNaTdMbm9CRXFkTXh4aVRCZTVFWDlqYjFreW9BaGkz?=
 =?utf-8?B?bkZVV2NQSFFubEw0SE4yUGJLeFhTaUtWcU45akw0VkFvbWIrSkt6TUlEM0FE?=
 =?utf-8?B?dTFPN0FOWGp6azI1K09CRzZEU1JtZ1RpbVZZZFdmM3BQNFEvVU53UnlkMlQ2?=
 =?utf-8?Q?BhQv7z2kmvzVDVy5RxBryXftV?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8f237e1-f043-4c87-792c-08ddbfaab4eb
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 12:10:05.8964
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9s/MyAqgO0pOvB9pK3lCmoHXXgLo7Z+mpyRcyCucirXpVMarF47s95BzFrrgJznCsW3q66frgRdX0ks3OnFvbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7983

Add compatible string for the Cortex-M7 core in i.MX95

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

