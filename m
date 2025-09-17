Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010021.outbound.protection.outlook.com [52.101.69.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC35424A06A;
	Wed, 17 Sep 2025 13:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758115186; cv=fail; b=dhSoptmezdLalVP5nqaWSWx/IU1JHcCresB3r0YV6UcqxM59648VQ10d0TpD3oWUbAgIq+CIsEBgh8LATUhC9J89T2Oc21zFHDjmGCPWX3F1IJ7P75gm6qOqhhFZDC3IWZ7sbqh7qf3g8i8oeq+dvuKVtzCOSF0Y6Vqop/91s7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758115186; c=relaxed/simple;
	bh=DswwFWtFlDjvaxJO2YzmaVkND9khUNAnAA0x9LPf4vc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=okVuosgLFE7+bFPeG2OarG3kd3H5YuvAawCR9X9740uXd+ux+JLuUSJFBVSKEtETlYA1NWRwcyK54aZEZksei4thrKBtK+q5r8vKTSnArl19BG3WmmA5i9AJYSvxe5kS7RS6k9qr3v/1Nf7PA1yRUfmgWBuNp17F1aDn/mfHQ3E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SdcAptIT; arc=fail smtp.client-ip=52.101.69.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SdcAptIT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q5zHITQhR/ONjnm+0FLRDPTf4dOBcLd31Wy117EXB/iH68n+n45S7uztpP6P4efLFlW0bB870kC2G7O5l7mB8dSq9ciTx54hjueDCIMqtJNEuT+IEt9qCGE36doTgXogb1puZ75N7X677+FWYO2m4ssXIkD1wMoKqXqiudb5sOoPsIpxVunm/7JnuzmkI0t/2/WXQ9xLP0ovxGdm/IYQsiiS6xtdUFRsldQWihS6if1vAW7FBD6dY/W3b33J0I484L9VZNkLPB/Vm9L/I4ECOW6N2IRQ3hyFHgnuPFLACkeOhMfdSYHKdM+i+LYXT21uH1Uj2olkGYL3UyHTqp2l+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5snXDkxF3jv3gx1sKS+33LYSZua219/DceMklZyEeU4=;
 b=BQdrOTlo8d4tW3Kus2vsogl1Kcnn/a56I+AY6hDMYo6aM9i/95qdxAQZD42UqhWuZp9A35Pd6wFY4wpu1Ml2imYsnTt9TtQERQgcY5gT1fg0qBD0vuFAsA2bk6RzSwn8AbenWYzEPdmJ9dDOlfPaNA6jIPIRsT7nFvzLUB4ghxbviq68VlEElgrPlwKBOwV5vCYRbpWBa9ieL/byDHp9VfLARlLGlHOl0WP1o1BaaqBhA1TsxSXpuEJ7up4r/RYtDQibk5dsmIuqlTA1p6j8BjfZTv0PTnuV/N7Tr+lpFyTXnGzwqbkFDnoNKAOvRFpp0MR5IHSU9SECcnN2qcNlMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5snXDkxF3jv3gx1sKS+33LYSZua219/DceMklZyEeU4=;
 b=SdcAptITExydxhZbc04RSpRsyjyKhjF4bFITbQ0zMpH2kFW1dfS/rkOA0hRMDJ8r6qqQ71rh4RWE/1QVvFh2eH77KqvWAcInn9ruQpSEkhIXNrhg2gA6sanOFFs42Pooqw68shovH8/m9eKe0QbaxR0fsK6d0B6USrH9FKXw+kuKwq0KqQ+f8W/MEbYO4nG/IwNMRi4fZmOLELahkMpU2eGxFtqrYyocYDH0kRnkqs5u+Sp4DMKIoioaRySBoBVSsnFtBDoWBylGERTbi0dr8e95w5s45Ugi/+j5MVzq8nIqbISbKOol9OtqttX1FlUm6juiQApriRVNlblnRuAEIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8325.eurprd04.prod.outlook.com (2603:10a6:20b:3f6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 13:19:42 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 13:19:42 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Wed, 17 Sep 2025 21:19:13 +0800
Subject: [PATCH 1/6] remoteproc: imx_rproc: Fix runtime PM cleanup order
 and error handling
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-imx_rproc_c2-v1-1-00ce23dc9c6e@nxp.com>
References: <20250917-imx_rproc_c2-v1-0-00ce23dc9c6e@nxp.com>
In-Reply-To: <20250917-imx_rproc_c2-v1-0-00ce23dc9c6e@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Hiago De Franco <hiago.franco@toradex.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758115170; l=2775;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=DswwFWtFlDjvaxJO2YzmaVkND9khUNAnAA0x9LPf4vc=;
 b=g5uhm3jZkqz7iyL4elGG3sYMYdfmcGFag87v/k3nITO9qqzXwl2gztFHwKo0tDjUPIpFeDDnw
 oRVm8YHyJoeA/kI/jaxK1NAwUn4fzijV47yjWeYJWoumznFg74YdE9O
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG3P274CA0016.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::28)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB8325:EE_
X-MS-Office365-Filtering-Correlation-Id: aa8978b0-52e4-418e-8266-08ddf5ecdc97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|19092799006|376014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NHZTdSthSFhsbi90Q0xqVk5hRFZGUmZnTUF1dVFzWnJxcDVWMWV1YVhLZ0JF?=
 =?utf-8?B?Zm1rNERsbldEQ0FtUmFRcWJXa1kyaG1QaC9rdEZ6MXpRZWNzR041VGQxQVFr?=
 =?utf-8?B?YS9maHRTVGMra2ZZTHlSa1YzVWlFK0YxQ042NlNXSXVUUDRuTjlQeVA3d1Zw?=
 =?utf-8?B?RVRBc0tGY1NRa29XTE9Sb1VERldBV2lidlRtR3g2YklhRUVQTUFGQTkyZVkr?=
 =?utf-8?B?ZHp1MENqM21ucXh1dU56bkhMYkxyK0ZWV0NMb010dEVpdm5FbkcrTUxpMnpZ?=
 =?utf-8?B?b3Joelc3aFZZWmxPbXJFSmxPdW96M3JaQzk1bWpaeUpXN284OURmbHlVNGVy?=
 =?utf-8?B?Wkc4QjkrMmdzbXpPeERVUUo4aGNrTXRmSWdBbHgxN1J2ai9qVnRST0QyQmIy?=
 =?utf-8?B?UEUxem1NOHNJMzJmeVpJRmZjQ2RadXJtYWptZFp5YWEzT0FTdGxqdDhGYStj?=
 =?utf-8?B?Wk1ROTE2QjFIWkFXazdRVCtucUhTbFZGYnIzUk5hR2hoWktEKzBFRE9zNU5z?=
 =?utf-8?B?YjZxOGdSRDUxa3F5Q0dVRDhhQ2NFK2pBNEQzMGM3NnNVcWVUWklGaytjaXFo?=
 =?utf-8?B?Z1NPQ21kYTh5WStuNGUxQWthRklldVlQR3V2ekgwMSt4MWNKVjZiWk9oRUlU?=
 =?utf-8?B?aUdkMnZ4OVFuTGpZVytsQ2xTVmtwN05IajVqVy9SVFZyck02UEpaeElXcS9l?=
 =?utf-8?B?ekF0RXJiZmg3MityUHJIQkpFSm03ejdqWFpsTDR6dnRMWjlxTmdFVUpUZUFM?=
 =?utf-8?B?NVl2cW43TzhhdTZON0pLaEgyK2lQc3dwRTg3MXpnblppYnFiR3RhYnRqNjF4?=
 =?utf-8?B?S0ZTSlY2WTl0VXg4TnJKbkQvUzAzcGx4eHFycUxuWjJzL1hDaWhyL1FrQmhW?=
 =?utf-8?B?NFZac0doZlhQMHBxVExzTVBCeVhxVUVJYVVHVUdoQWtkUDJDSUFhS0Exa1Vp?=
 =?utf-8?B?R1FjakVnM1FlQ3k3dWZUMStlcGxxN21JdVJ0VnJFTzR3czRUdWdBRnI2ZDVL?=
 =?utf-8?B?Zlo1ZWVjWHJrdkVuekFPTkJDSS9WKzdDU0RXMDM5MFljR2RaRHpjWnRLZUZL?=
 =?utf-8?B?aktONGhocGVDaHFIKzBWd0c2ZzQ0dGlSaHJ5N0RHQ1oyZW92bHBrQmNMbVNE?=
 =?utf-8?B?b2RGdTNYUTVWdjI4bHpUSjdQb1pNelptVTFHUTdvYzZkdHNGV0dsNkpKSDJT?=
 =?utf-8?B?dGJXSVdKT3RmWTlIOFF5ZUJuQytsRkRKbURSTnNLSlNpRVhuM1VuZFlzUHFp?=
 =?utf-8?B?L2RObisvMzArbmU5RjJRajg0dHdTd21Kd0ZXTUxhbzl1eGZEVmNOSGluQWEz?=
 =?utf-8?B?TCtZU2JVN0ttYlE4N1E5T0kvRjFYTHp0MUVxa0E0UGpZZlhtMkgydWtWdkQ5?=
 =?utf-8?B?ZFFhRk1vSkJWcCtQYzE4TU02UHJEcHB5dTFQK29hUGxDaEdwN1RTNGNCQkN2?=
 =?utf-8?B?QVJXMHRUMktReWNIUmVMZEtmMmtvdmQrRnVBeEJ3UWJpZS9rVTdGMU91ZlYx?=
 =?utf-8?B?bGFFcVAwbkoySjRldWwyMVN0akhKd3ByMmtKcitiUUJnMXRBREhYYUt4TXg0?=
 =?utf-8?B?KzBwWmhVVkZZL1pLN04rREoyMjJJbXBTTnhjZkhnOE56aTJxbG10dDU2Vkgr?=
 =?utf-8?B?UGlieU45REdFUHpwaGQ1NFRSc2JUUDYxa0Jzejdhb0JQdUE1ZE1xOVVJdytx?=
 =?utf-8?B?SFhnZVNGQVc0RWZGZ0piYVVoTXN2ZnhadW9pak1XL2RXNlNXSjF5OGM3YytM?=
 =?utf-8?B?ek9MMGF2b3N5dE0xYlY2Mm16NDdkMG9tVnhLakZqOUE4cWVmTVNSUURGTWor?=
 =?utf-8?B?MjY0OHBNQzhNaWVLeDVLS1N5bVJBRGp4ZTNjWXprNUdrM2dha2IwY3ZwbWEw?=
 =?utf-8?B?NDNCWG5ESFp4RUxheWV2djl4VWhkYWo0d1FNOUgyWWVHV095clFST1JxUFJD?=
 =?utf-8?B?OTk0QnVGSlduM3dEQU1qRUhocFZHcXNUNkxmb3FwNHhzeGNSdkZvMy9kdzhW?=
 =?utf-8?B?Q0J5UmthTGZBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(19092799006)(376014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGp4NXN0aFlKNDQxeXZXT3EwSDJhcFpCdEVjanhucW54RVpHSkJLL3cvUEl0?=
 =?utf-8?B?WFBZR0FtOFE2Tyt2VHNFZU5LVExkamxLSHcxcEE0WW1ocitYQWd6YXlDRkQ0?=
 =?utf-8?B?U296eitrL1Erdk44WkVaSW5GY3ZNNlhQbEZ5NXdVbWpjenpFakg3MEUrcUQ1?=
 =?utf-8?B?VkoyWTVJaEJ4NFdzQ2JueGx0RzdJcVpPd0RuaUpYa2VZVXEwQ21HNkk0T05G?=
 =?utf-8?B?c0g3R2hqMm1UNDlIT2h6YzlkcUg2RnlzZ25GMTFKTzBpRUt6eWZWOTFMaXJl?=
 =?utf-8?B?Wk1SYitudXhoYTFOMFNhVlJrNTg1YWQ0c0dYaGxBWTJSS2tiVXdpaW1NYnBm?=
 =?utf-8?B?UmtEOWJYeTNFazY2cE8rTVBCZ3JWQTNOemJzekluenpkVU10SVhKZGdwSjNi?=
 =?utf-8?B?QXg0TTAyTXllNjRRL3gvNjE3d2V2ci9EaFJFSjB4Sm1Qa2ZITndHc1lsTjhN?=
 =?utf-8?B?dW8yN2Y4dnRiMHd1TzY5MkViNDVSZEovbjhxeFA2T2d5Uy9iczdXbk9BbVkw?=
 =?utf-8?B?VUlVbE5OclJwSlNwb1ZLeTVkNmo4SlhJQ2laRUo4Y0cxNnNsUnRPY2ZqdnN2?=
 =?utf-8?B?RzZqWTJIWkFjRGZOMTRRODkzYWkvbitZQkpZM2VOd1pacitvV2Q1OExvZUEw?=
 =?utf-8?B?WHlkTlZMSmJpMFUrRHpIc3hLcGwwcSsyT2F5WTV6aHd1enJNL0xORFVpWHBX?=
 =?utf-8?B?Q1ZqbDVlQ3VRZEFwRlI2L0dZVkdxdERYb09uaVJLT2ZkUU93TjA0Z2h5N3g5?=
 =?utf-8?B?K1VDSk5hWlVnb3BUSTJOa3ByS3JhUlJIQWl0YjR4YjhxblZDOUw5ak13dTV2?=
 =?utf-8?B?VEUzL05Ib2pod2pJcVdkR2JHTzdKK1F6cWxXRkltRXRZZTlKL2MzNVlFN3d4?=
 =?utf-8?B?U05SVzRUTW1pWEN1ZnY2ZnMyN0tpR2ErRCtxNmg1NWZXZzVrSXhyWUNDbkQ3?=
 =?utf-8?B?cTRQN3hSdWRRaG13Vm5pUjBrVzRVMDNMdVlyUEg1SGIzY0o4bXFOTDkxR3Rr?=
 =?utf-8?B?YlZwRDdRWUd5eUxLbVlkajhaanRzSEcvMktWdjU1ZGVjN21Uc0M4UVo1bG9C?=
 =?utf-8?B?ZFppcW1GZ2dMSUpnRkMzSUJQZi8xamxHNFlsVUtHZDBvWWtVMDRTMG9zTFNW?=
 =?utf-8?B?QVJMU3dHR3puQmxNSVg0QTVoZ0FlWlhKUGVLN3Q1Q3p0TmppRUx4RjhuaUlw?=
 =?utf-8?B?eTN5S1lPTFU3b0Zuby94TVUrUndpNStrK2RDSFo0Zjhqb0RDcUtZTHk3QTd0?=
 =?utf-8?B?QzFjZUNtdk81RGFXVlh2cmtIZ0RndnhkRHpoRjhaU2ZVYkFWMlRmMTBOU1VB?=
 =?utf-8?B?RU9HVzhoc3lQMGdRVkxrQ1RNM0dhQmR4ZnhQS3dwa3dXZWhZK1JjMXB6djIy?=
 =?utf-8?B?RnBTR2lOakNWT1NGRk1xKzNYenpuVmRlSWJ6U3YxcUpQYzJkcGJmOU81SVEw?=
 =?utf-8?B?SElRMys2TkQyQXVVR2xMU1RCVzNJTnBLVlducUtHdzk1d0xqaFpzZy8xcnQ5?=
 =?utf-8?B?TWpDT3FqMThvdGhCL0pLNU0zRlNSTlJBR2psaXFRc21sV0t2eUZWMmtia1Vk?=
 =?utf-8?B?aVNXZlBYZi84UXNISWZtcGNzdDNlNEVIOHhuZW54ZHBUMUZwbnptOUNkWGRJ?=
 =?utf-8?B?dTcwMlZzK0xRM1dYVENlMTVVNU1za0xkMURYaC9SWjh4VHRYa3lkaVhzRlVm?=
 =?utf-8?B?bnhKT3VtNXNIM2RzaGVUZGdBQk9LOUpOUnd0UEpobld2VUNFYVRDQ1BPT2pu?=
 =?utf-8?B?L1A1bERnMUo0R3ZlT0dnT05zeWhSa0tMcW5tbDdXYmVxNS9mckpWYnZyZkZs?=
 =?utf-8?B?MjQwZ2FZbFFZNXVaSVVFdkFHUkFENUNBMnVxQ05waGRWUjh4Qm5QNzJSSUtp?=
 =?utf-8?B?ZGNqNUNpWjdsZnhZbXRnanNnQzk2RXVudG9MZE1ESDdqeHpQSzNnZ1Y1ZXhO?=
 =?utf-8?B?SUdxR2NVeXB1citoRGxsRDhseEJxQndmanlSQmJneHU4VTRoNVBHY3VsRGNI?=
 =?utf-8?B?SjY0M3hWeUJEMlFUWTgwbmU3YVJIRDd1U0RobER0bVB6Rk4ybjdUaE95dzFJ?=
 =?utf-8?B?WXFOdEVMeE9OL01HSG40dDFXZXFkT0ZDcXBuTkRCQTZvL1JvUm9BYm5aa1Ni?=
 =?utf-8?Q?lypK3adLZCq02uwEPnHqMAYSC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa8978b0-52e4-418e-8266-08ddf5ecdc97
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 13:19:42.0312
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xpV1dGFmBeCi4YiMvYzFEdRBn6bMf1V2NsY56ZkOJX2gY/rHqH2GZYWfj9AA+lepEgSuRcoI3U2rVHSEzNwEig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8325

The order of runtime PM API calls in the remove path is wrong.
pm_runtime_put() should be called before pm_runtime_disable(), per the
runtime PM guidelines. Calling pm_runtime_disable() prematurely can
lead to incorrect reference counting and improper device suspend behavior.

Additionally, proper cleanup should be done when rproc_add() fails by
invoking both pm_runtime_put() and pm_runtime_disable() to avoid leaving
the device in an inconsistent power state.

With using devm_pm_runtime_enable() for automatic resource management and
introducing a devres-managed cleanup action imx_rproc_pm_runtime_put() to
enforce correct PM API usage and simplify error paths, the upper two
issues could be fixed. Also print out error log in case of error.

Fixes: a876a3aacc43 ("remoteproc: imx_rproc: detect and attach to pre-booted remote cores")
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Hiago De Franco <hiago.franco@toradex.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index bb25221a4a8987ff427d68e2a5535f0e156b0097..12305f36552fb5265b0953a099ea0d561880e3ff 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -1046,6 +1046,13 @@ static int imx_rproc_sys_off_handler(struct sys_off_data *data)
 	return NOTIFY_DONE;
 }
 
+static void imx_rproc_pm_runtime_put(void *data)
+{
+	struct device *dev = data;
+
+	pm_runtime_put(dev);
+}
+
 static int imx_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1125,12 +1132,23 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	}
 
 	if (dcfg->method == IMX_RPROC_SCU_API) {
-		pm_runtime_enable(dev);
+		ret = devm_pm_runtime_enable(dev);
+		if (ret) {
+			dev_err(dev, "Failed to enable runtime PM, %d\n", ret);
+			goto err_put_clk;
+		}
+
 		ret = pm_runtime_resume_and_get(dev);
 		if (ret) {
 			dev_err(dev, "pm_runtime get failed: %d\n", ret);
 			goto err_put_clk;
 		}
+
+		ret = devm_add_action_or_reset(dev, imx_rproc_pm_runtime_put, dev);
+		if (ret) {
+			dev_err(dev, "Failed to add devm disable pm action: %d\n", ret);
+			goto err_put_clk;
+		}
 	}
 
 	ret = rproc_add(rproc);
@@ -1158,10 +1176,6 @@ static void imx_rproc_remove(struct platform_device *pdev)
 	struct rproc *rproc = platform_get_drvdata(pdev);
 	struct imx_rproc *priv = rproc->priv;
 
-	if (priv->dcfg->method == IMX_RPROC_SCU_API) {
-		pm_runtime_disable(priv->dev);
-		pm_runtime_put(priv->dev);
-	}
 	clk_disable_unprepare(priv->clk);
 	rproc_del(rproc);
 	imx_rproc_put_scu(rproc);

-- 
2.37.1

