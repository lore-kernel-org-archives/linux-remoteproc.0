Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012045.outbound.protection.outlook.com [52.101.66.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C162DECA5;
	Thu,  6 Nov 2025 03:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762399885; cv=fail; b=XeOMUKZfKF4+03AazHDzEhp1A540tSnDj1/LnW5zG1qqpBjKJWqBVbotCOmXinrqZ3qTTI0L/kLFx7fsj9eoZco0m9nEqhPacK511bsVy1QbXiWIwsmz+j9AnQA8exm9+KXTp5/1U7TifxvJpiFNnY0HAikXrGiKjk0RlZzcJhs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762399885; c=relaxed/simple;
	bh=Z19UBLIlnL3g+Vw1kO633FUT8iiXU2JzyLxoSehCLzM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=t9a6ES1P+pY+CCnN3XdiE9joZH6FPwIDTMWKbbUFD3Oh5JfSRP2LWLHj0CQDSgQ76R6kYDCGp2cVMvKL03doBZKN8pVPBPlntpb9dH+On3rT9Hw2YsMfMVuI90iuiMMpU4UyzD6sTBVGwfD7FLA685ozXgsD6MVEvYqVL+QU8i4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=f6eYPbas; arc=fail smtp.client-ip=52.101.66.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="f6eYPbas"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gylGi+n50J9G5vRKEh8QvrCvVGWQiMVxX01UPPxwyhqD5QRXxkFampB7FvT/rfnAccfSinKQTCxtbYeEd5Tvew+Rji7RItolIWbNfqwmDjXdv4PkzOfYsp8HGFohBDRFaszrGtrlq52MN9VQ1i5m36kHOE8tiGbumKB2oU4s6B1HSDTgv69pwN0NXmNc53EhAbpfeHB7rs4e6j7vlEinWaNahOMvaTE9AxG1y+481V28qdyP9i2n74cKV1oSjGQOa/Wrx5i+zQOrHmk71ngGk7novUKLl4E8sYIi9SzQ0nOQBsF9fCeaBe/PDt+DXmjOrE2Ou/Jg9GOpI8tfEUwgKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/4ISHg9YXVkW2NrrgUUu7Zz1jQcfVLSfopDDEsNdBy0=;
 b=H+Qcyo9wvKy/7zk3ZqMNzrBTTMcf5fvGB2Svl/9uoaGzH0F0CZdmk3j6kdaZq4KM+XaKituQwj0hnqK681cA2C66tzE0ekhUgUc2mSevgB1hPmNi36HX2wXpd59jaOjr3ORYxIDTQhccPFHypv8qpXzBWICXjRsSk5UAfi8z3Xo2CW0t556NV7cVekn/ujpDxpBWCesTnAIdmNjlih2PobQHbY3GUJAtLFUeDkoxj1BbUZ3VVUhLluorp0dVvL0jA9jUqs+yNkpJR4Z+SH3914JD895QFdEnofczbEMxlsnXzkMY/O/EtRs7kW6IhSNSll1r96aqdKI8sYzZTZQ0cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/4ISHg9YXVkW2NrrgUUu7Zz1jQcfVLSfopDDEsNdBy0=;
 b=f6eYPbasONGeNFJLmOqMc0RfOOfJBO/Yn5oDI+OcE060lEs19VseWzUWFHB6PR6IOsP01OEtHDsJnop9ZthCQek/x37cRGQkXieF4QZO5lUL2HndVEneWZqL1th4/6XRwxnMtB9N1ZcSrIHKYXgm+ckhTlGu04f6Q8ku8ujs9pOsQmlSwhwMwmM8vMPluymB+q87uEiex/PCR8PwPVDNY5U0yCPPAbgsPHyLQTUtuGBdTQe7HppM+peoL9mefzjAiA/XohUBBW9s1P6fSHHAO/xGuruni8LEdYcSp7gwrMLSpmZEwdvx2hXkutEx+W1ilSJgbl7XF18Jb+AXPBvsIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI1PR04MB6813.eurprd04.prod.outlook.com (2603:10a6:803:13c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Thu, 6 Nov
 2025 03:31:20 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 03:31:20 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Thu, 06 Nov 2025 11:30:32 +0800
Subject: [PATCH 06/11] remoteproc: imx_dsp_rproc: Use
 start/stop/detect_mode ops from imx_rproc_dcfg
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-imx-dsp-2025-11-06-v1-6-46028bc3459a@nxp.com>
References: <20251106-imx-dsp-2025-11-06-v1-0-46028bc3459a@nxp.com>
In-Reply-To: <20251106-imx-dsp-2025-11-06-v1-0-46028bc3459a@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <frank.li@nxp.com>, 
 Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762399839; l=2460;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=Z19UBLIlnL3g+Vw1kO633FUT8iiXU2JzyLxoSehCLzM=;
 b=xPz7AQf53HFURkriaIdUhx818g1/xKUD1SrK2vY2Vz8gm5/VGxl13sRaTjpTRdj8hFU4jNnLk
 FsTJVOrDjT7AzwLHw6iuraHXKC3CLneSfZgKpk6LscnxlRTIE0uggBX
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2P153CA0028.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::15)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI1PR04MB6813:EE_
X-MS-Office365-Filtering-Correlation-Id: 5055fff7-cf5f-478d-146e-08de1ce4f3a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|19092799006|366016|7416014|376014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aWRCcWlESlBDbHg3N2dyT3g3RGxldTBrQWZFbHNIdUlubE5zWmh0OVp4MTkz?=
 =?utf-8?B?c1ptbU1VSURaa3pRVGRBU0lGbC81ZmhrdXc2UUJzUHl1QTdKWlFpcjdGQ0p1?=
 =?utf-8?B?cUduaDk0eXlVZ2VxeWVlSFcrS0JBQkpna3NKWjVHbll0a1B5cEgxVEZsZVky?=
 =?utf-8?B?WExNa2hWUTdFd3VsWDF1eUdOeTMrcFB5TFgxWXNPUWs4N085eGovU3pwdzQv?=
 =?utf-8?B?ZWFINkJ2R2VORXI2d2ZMMm9QV0RseldSNzZzWVJxSnVnVlY2a2paYjQwRzFC?=
 =?utf-8?B?QXBNK2xYaXVoUmw3QVdScTkwRnlOd2tsSk4xZldHa0pHRUxsMDlIR242Zk5V?=
 =?utf-8?B?MEJoQ21WL0d2QU9rZ2pvZGhFaFZBaWZscXA3c2o1RW9PUEtQckowbmZ5R2dB?=
 =?utf-8?B?NXhDalA5SWZvVDlQai9KRzZBNFFDY2NLRk9kSHBwVmpHenhianBUdldrdFNM?=
 =?utf-8?B?VDZZMmhISEJYdnMxRzRjUTdHVytnRkszenRDRVlUbG9SL2kraTVCMC9nN1hl?=
 =?utf-8?B?U2h6Tm5iTTlOR002UzQycWwvRGt1LytXSnNFSk1WWmZkOFJOZ2ViektQd3J6?=
 =?utf-8?B?dERZWmVtVEhZMVJFd2JiNEYrUW0rWHRRbVVvemM4c3BhbFFDUDZxZmo5R3Mw?=
 =?utf-8?B?Wlk4Y3RUMFZpQ1QvZlQ0UkdBVnUxcjBRajd4T3ljcVBvclRwbEgwMjhSdGZJ?=
 =?utf-8?B?NlBWTCtOOUF0VUtBKzhCZ0MwbzBvMmUreFozVTdxRUU4Rkw4Q0daakoybDVp?=
 =?utf-8?B?eXZLSUpMN09mbU5yeWhqZlQvNStZa29uaC9wdGIwaEhTRTJ0S0NyZExzbllj?=
 =?utf-8?B?L3pZN2duM2VYL1JhZlN3eGNKbGhIUmJTSVIrNXJmdE9ETTg1bFprTVVWZzhE?=
 =?utf-8?B?bDNnSDlTZlExeEtHbUpOd0tCS2ZWOEkxUHFDQnRKc0RIeVZCSUZlMDB5NDYv?=
 =?utf-8?B?eGtFNXVXd3JFZFk1TUlIM2JvSFl0R0gyblNPYnFaZDVpdzUrNFRFZFNVZjZJ?=
 =?utf-8?B?UWhWbzBMWnE0TG5ZVEZCOVN4T2hnQWNOd21hK1hsNEh0dnVGUXY2VnByKzlW?=
 =?utf-8?B?ZnNHNzZCUmhTcEhwQU1qWThTaHZRYmk5OHlXd25hdFh4cEFjQ1JPMS85T0Fh?=
 =?utf-8?B?UFpQQzA3RW4yKzRGaGQrQWpCTkR0anF4YlFUZVlzSURKMWgxRE5DU1laWFBo?=
 =?utf-8?B?YlBmbkhpOTlCTlJOK3ZsYlczd3Z3TVJqVzZkc1dDamFGQWkrVjgyWVAzdk45?=
 =?utf-8?B?Y01LbzdqRzJCMHVRUUgyZ20zUjA2Z0tFY2UyTG1ZTFBBN3pqL2VLR21tcnJh?=
 =?utf-8?B?TTRRTWVUbDRLRzhXU1IyaU9lNFRMOGJpbXVzeCttdVpZWTV1OVhQL1Y3eTVC?=
 =?utf-8?B?NERsU3VPR3dOcFlnVWJ2MVBTSk45Q1BxdW8zcEwxaU1wZHNEbFhCSGw4UGRl?=
 =?utf-8?B?NjZObXFXY2xsaFBFZ2tvSHlMd2czZmt6TGcvRURvUUlaUkR2TnNpNytwc09R?=
 =?utf-8?B?OVhFQlNrcjFlRlhXMjg0djNFSm16VGM0VndRQ0VkMUV6SUhIR09INjY4b3g1?=
 =?utf-8?B?dFdkRVJmZWxHRnBtYnR2S0xnK3BIalE4dGt0VGJBOElqL1NHaEo2bFROZUVR?=
 =?utf-8?B?cnAvTWZOQkZuS2N3YlF6K0tqK2FSN1lHOU5pNGY5VExaYm9ETXFsd0liaHdF?=
 =?utf-8?B?cStwNWpoTnhyVVJEQ2xDVXM2cC9XcmxPOGRJWEJkWkJyV0pUKzFKYkpocWQ5?=
 =?utf-8?B?R3I0c0lxV1JWSnROT0JHVUdJaHFWRVBZWUpQUHhOUXdxMWhrR1RlYzA5b1lH?=
 =?utf-8?B?NC9kaVFUSWdQM3Y1UVM4enlPYzhiYzVib3B0VlZ6ZUZWMVQxdkFiZWhLTHBQ?=
 =?utf-8?B?emI1bkFYSzVJeWJMOE1RYzNFMVpTRTFxZWtQemVpY0RwUmg3cjRvWk91SGJz?=
 =?utf-8?B?NEJqZVBxUHgvaTZ2a3FibGM0akJIQTN4Z3psL0VzU3p2VGo1aHE4VlpNRW1D?=
 =?utf-8?B?NWZxaFdHUVZjM0VWZzdvTkd1UWZjQnYxVXB6cUJZZmk2NUZJVU5jRnhwMzda?=
 =?utf-8?B?SzhTT0lHNmlFMjZYV2cxTkJnQnVSNVAyWm9MZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(19092799006)(366016)(7416014)(376014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UWdvY3REVFVqVElOMVFnR2VkZVE3ZU5jT2xKUGxKREpzWXNjdkYwQkFld1pa?=
 =?utf-8?B?UzNnTVREbk8rM3p3VllOMk9Oc2Nib1BkK2UzeFhEZ0hyQllaZ0F4bWNkcXcv?=
 =?utf-8?B?dm9TQzB2UmdGbHQwZmwzSi9RdlNCa0FWbjdvRS9oNmtTYlY4cGZYN3VjVXVy?=
 =?utf-8?B?eXNkMCt1SktLYzY0RS9ib2M4Qlk5YTN5Sm5tODU3VmhXZTFjdHlyQ2RhZ3dw?=
 =?utf-8?B?RXhtclIrd28zSlZYWVNpT1djQ0prSDJnTndPZEkrNnB4d0ZleUdoQkJsMUxH?=
 =?utf-8?B?aURscXB5cTlPLzlQY2dLV2hKMXlxVG9QcVI0ZjBzNVI5OHpZN2hvd1k5bm9D?=
 =?utf-8?B?MTJzT0tnS0RmV3NmdnVKN3ZXYlpjMFo0RW5SZmVMd3YxdjJUdnhxanppRDlH?=
 =?utf-8?B?NWNPSGxDWXFVTU5lUDh1dWRGVk1qa0FnRWhiTUpLdEd2aWtDMkFRODF3UFQx?=
 =?utf-8?B?dWlWMUExa2hLQnUxVHBWVVNtSVJJczNxYVZMbkJFRkRBNHFqVEZ3NHdSRVlR?=
 =?utf-8?B?RVJJMkFWVk1JSURkODNGSklBYk54YjFwT1pTMDg1L2h5blRIczgxaHpDVVAw?=
 =?utf-8?B?c3RnaktRV081QkZydmFpdzA2dFdjekEzTWprREZDYktLN1pYenhsQU1IQldE?=
 =?utf-8?B?TlNydWhSbE5iWGtSais3L004YVBDdjNEUDlBU1Y0M2lBY3dRUDhxUTJMMWwz?=
 =?utf-8?B?NzNQSDVGbk1JQS9qSno3R2hDRHQ2akVCLzVhUDZ3SlJ5TnVZSU4zdkpmd2hR?=
 =?utf-8?B?MEtHcHp6M0ozaVRteVAwcmI4aDdLZ3VJZDlzN3VOcytPalA4NjVjMzZNUldM?=
 =?utf-8?B?VlIxaGhGN2ZkUTJrNitjT1cyS2tyRmN6M0l1QlJTUTVMU2srSmxSUUtSOGN4?=
 =?utf-8?B?MU55cks1V3IyY3JPVEwyUElJZlVWL01vbWdGUHhHWDJWTWdSQlpJSGpra3Y0?=
 =?utf-8?B?M2RpYWdUR0VidlIybzdSeUNpOVlvMXRxRUVyM25kWE5QYTd2RGV0dXRsN0NX?=
 =?utf-8?B?NEZDWTBhRlFhbHBnRUo1b3RSTGZpem9ZUnR0T0RmYU9CWERWbE5MOWNXTDVu?=
 =?utf-8?B?UXpLVGxkWENUTkhxY3BKS2ZwZVROaXh2YjZTU0pZa2lKa2FuRU1WcmYvN2hu?=
 =?utf-8?B?SmtuOVZUbThmMXhxUjZXR01mamJjR3pUZlFuSHY0WjZZeC9XWkJMZkZYVkJV?=
 =?utf-8?B?ejRxbzRQRGloaXlXOTgwaEdkbHBGVmU4Ri9MTXkxV1pvVXpVUXZDUUJTS3JC?=
 =?utf-8?B?TjN5OENkdnk0NmgrZG0zVmpCaXRoTXBJUTV3K0tlUW1OMWUraG5aaDlXSER6?=
 =?utf-8?B?K0ovbE9KcDhsNGxkbWVFci9MTzQ3SWdKd1Z5Sm1yMFh3bk9jK0hXODB5WFZH?=
 =?utf-8?B?NEFuSGJ6Zy96NHVkUVVQYjI4TW1GWHM5MVpDOU9DODhBeHFsZnRZRjBlcGhE?=
 =?utf-8?B?SENvcm9QejZHZ2UxWFkxcCttcXo4V0hTUnpzZmlVSXMySTJFUVJCSE82RlJI?=
 =?utf-8?B?SUpNN0NJU3J4R0ZIZllDOEVGR2k1SE9zN2dtaHp3RktLSTJZZW8rZUNwbGJU?=
 =?utf-8?B?VHlTRnRJb0tsOHA4cXNxVHBrSlVRUTN6MnY0NkhkRDRIMElTZlZLNWJ6NGUz?=
 =?utf-8?B?SjNySElkQ2RjWVdCbXhEZGkvRXdHemNoRnI1dkkxK2gxWHY4R1M4SjNlUGJD?=
 =?utf-8?B?cUdtejRxNDNCQ2hoMW1yajhQejRYWGtlV2N0WktuWlp3U3FNQm9mbTVJUXJH?=
 =?utf-8?B?UlRKTVdFTWc4ajFOY0FBWk9oK3M5aFlwVCtLbFFKQ255ZDhZUTA0K0F0UFg0?=
 =?utf-8?B?bTJqNDdPMTEzU2R6TDBWNTVVb01KbUdPS2UwTEhkVUw1cExRcVE2M2hkR3U3?=
 =?utf-8?B?R295aE9MckJHVEJBVVVKOHpWdEU1ZXdLTXRDYmh6TXE5VFpJUzd3cVAxR3BS?=
 =?utf-8?B?R2dnWGYxYi8wUEowSTBnL0Fub3k1cUc5c00vT2VPN3NqSmhPeHdIcUZMQ1lh?=
 =?utf-8?B?L2tFdW5uWi95R0huYVBkV04wQmUzbzU3dDYrK01rWTV0Z05QQzN1U1FZanpN?=
 =?utf-8?B?bjh5bUdqR3NuWGZKYTlZWlJBeS9aL2s1YzRNTjlXYVFVS2JlL2k1eUJmMDNt?=
 =?utf-8?Q?fzUriiJX7PRdeAmkQJ4or26sM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5055fff7-cf5f-478d-146e-08de1ce4f3a5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 03:31:20.1074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9iBvCjcAmTAa0Z86lWSoVME9rrL+u58++mfvyz8VtVJHMB5ynRlSq7FoEs8QEKRcpAAUaa8f09MVm2cCukKc0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6813

Allow each platform to provide its own implementation of start/stop/
detect_mode operations, and prepare to eliminate the need for multiple
switch-case statements.

Improve code readability and maintainability by encapsulating
platform-specific behavior.

No functional changes.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_dsp_rproc.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index 1726aaa1eafb9ac1a913e3e2caea73801b86dc09..833b1bd4019614157f0bedf09bd348caab802eef 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -404,6 +404,11 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
 	struct device *dev = rproc->dev.parent;
 	int ret;
 
+	if (dcfg->ops && dcfg->ops->start) {
+		ret = dcfg->ops->start(rproc);
+		goto start_ret;
+	}
+
 	switch (dcfg->method) {
 	case IMX_RPROC_MMIO:
 		ret = regmap_update_bits(priv->regmap,
@@ -424,6 +429,7 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
 		return -EOPNOTSUPP;
 	}
 
+start_ret:
 	if (ret)
 		dev_err(dev, "Failed to enable remote core!\n");
 	else if (priv->flags & WAIT_FW_READY)
@@ -449,6 +455,11 @@ static int imx_dsp_rproc_stop(struct rproc *rproc)
 		return 0;
 	}
 
+	if (dcfg->ops && dcfg->ops->stop) {
+		ret = dcfg->ops->stop(rproc);
+		goto stop_ret;
+	}
+
 	switch (dcfg->method) {
 	case IMX_RPROC_MMIO:
 		ret = regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask,
@@ -467,6 +478,7 @@ static int imx_dsp_rproc_stop(struct rproc *rproc)
 		return -EOPNOTSUPP;
 	}
 
+stop_ret:
 	if (ret)
 		dev_err(dev, "Failed to stop remote core\n");
 	else
@@ -1085,10 +1097,14 @@ static int imx_dsp_attach_pm_domains(struct imx_dsp_rproc *priv)
 static int imx_dsp_rproc_detect_mode(struct imx_dsp_rproc *priv)
 {
 	const struct imx_dsp_rproc_dcfg *dsp_dcfg = priv->dsp_dcfg;
+	const struct imx_rproc_dcfg *dcfg = dsp_dcfg->dcfg;
 	struct device *dev = priv->rproc->dev.parent;
 	struct regmap *regmap;
 	int ret = 0;
 
+	if (dcfg->ops && dcfg->ops->detect_mode)
+		return dcfg->ops->detect_mode(priv->rproc);
+
 	switch (dsp_dcfg->dcfg->method) {
 	case IMX_RPROC_SCU_API:
 		ret = imx_scu_get_handle(&priv->ipc_handle);

-- 
2.37.1

