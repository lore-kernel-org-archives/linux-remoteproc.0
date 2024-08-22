Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2070.outbound.protection.outlook.com [40.107.20.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3F11CB318;
	Thu, 22 Aug 2024 13:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724334020; cv=fail; b=O9PnKpnovgNLQZ2zHj5Gr6dKzg7QIV2dg9JvsAK21TxzmVc7OJNGgixaFon01pleIeao1MhTAu4sj02zLCyCw9qQMSuForu6hiyael4GmMzbWCWS6Zjk1vkgvCdrRPawpZeVwW/7L/UbNjjaXy0Eth7biF/Pj4QyB0jdq8CYHlE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724334020; c=relaxed/simple;
	bh=GXhkHNqL0+RWEHovKYViiMu/YGS8tXK6n3z7gvAOEks=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=W/ydDm8Mn37VkpMY5+zykOju92KoY1Y/Pl+kNvW8C+KqldAnfEVHR+jWlMReOlXUl8Y1Xk92ts82AdcpOdEO0+ZRFlGf8hUZSq2E5V+p1F8K5zgIin9U3bJAVJpZpRdv47GUU/AvNy5of4cCVShZRvoX2MJgpZE9DTdIJBeOs+E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=nMt8JlBF; arc=fail smtp.client-ip=40.107.20.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="nMt8JlBF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o4z5N9eCWWgdq1rON3jmOm1xH7sPCfX/qK0VXXV2xX0Na2Utx6IG3zG/PNSu3WI3HJmOKxfV2eAcJSdDKte9slH09cxFZORbhSGq33akwEqIpJcrCDFQbwmaswlAxXlN8MMuvA4gxm2dO3C+YAzHsXcBmCmqIq/RbBWFHOZ34y3d3pc0PS0Li9J3lki6AKc37lPkeWs3bnwTxI+kwTkpYH/nU7QinjbKhXxcBuK0xSsMcnDUgYSnRu9DnS0OQ7l+G4TuulN+daLe4vKLyekFVp8ifjiwnqO6oX57C7K8rrNLEngjHHZUeLvyr/2/vt2uo26lWCLXdeBKEkOwc2utbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X/4TdqO7xD4oZ98hwQlEfiM3HWZFuD3eY8KClVy6sZ0=;
 b=LMYnTu2Vcx90KacGtfn2cZ/ie4baSoQqvp6mANeQwaCoJRsmVB6B5s41k3gY2NOekg0stTpc6v2HVSJ8YeJJAwkEhwcuzfFR2jVuCcmzL1cYNlCNDMTKhqx3nNdLQzhKFddHopUOoTuybyjvm0uEqb5GuBUFm4UBSfuAKMWunyNhwNGpPOGYxbVbLAfQAKJ1aDjQsbkY+eVEYuCzNsUrKuW4LCGbjku9SGzK8dESLlwt74VoObPu21+u0/Kie+9w2+RFXFuyWf8yNLIFyEC2uBVtM3PlaoJ9UAMCksU9m5Lchzt01HuqJ2k7Ll2dNZdNEbsLbmfbfDk79p4MeStx4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X/4TdqO7xD4oZ98hwQlEfiM3HWZFuD3eY8KClVy6sZ0=;
 b=nMt8JlBFtOW5his0WZvwTRNCO+aOD0nGuQq/Ht3rQW6FJoGza7jGrBGo9TNAHMDtsdE8l4QmQSv7Y9EHvX5mRFqHE9DvR6cHEt/TKjIRGg5IRUnpzO1O5NvlBsPmHY4ccaurjrFgjCFcCFuOQZaio3HDXVcv5Mh6RThLEEqFHg8hGowtO4r0I0Oe7r5KBdQ6xQor3xK5jcou1NSG3+IQs/cYi9HrNrfnFDdvogPMK4Pvt7wXemzfHRpxW64rX7az7IMpEKcbFP4CFzwiM7LnWfr9r6cSs8F580RD/KKT6/GJ3zh0g6q+mtHuOHbEiaIxmZPqY9q8bmxWh9ASQBEIHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV1PR04MB10126.eurprd04.prod.outlook.com (2603:10a6:150:1a5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Thu, 22 Aug
 2024 13:40:16 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 13:40:16 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 22 Aug 2024 21:48:49 +0800
Subject: [PATCH v3 1/2] remoteproc: imx_rproc: Allow setting of the mailbox
 transmit mode
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240822-imx_rproc-v3-1-6d943723945d@nxp.com>
References: <20240822-imx_rproc-v3-0-6d943723945d@nxp.com>
In-Reply-To: <20240822-imx_rproc-v3-0-6d943723945d@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Iuliana Prodan <iuliana.prodan@nxp.com>, Marek Vasut <marex@denx.de>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724334552; l=2358;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=+g8vBcVQ1XudqDTT7ofwoWn74vmRIC6pTXYhqi5R1K4=;
 b=Li1vQN6WF44YVokSWNMP5DC0qafyE7fZk0Fy9V/IE8zlbISCYc8Ttn2faz3OmKCGLtfOF+XOq
 CHuvfo0Xyh3CagD8w7pwOJMrxS0gDaqmR5mzIEuxlCNrSJf+3ZCJK3A
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR02CA0051.apcprd02.prod.outlook.com
 (2603:1096:4:54::15) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GV1PR04MB10126:EE_
X-MS-Office365-Filtering-Correlation-Id: e346a209-f7d7-4ef3-e0de-08dcc2aff4fc
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U00xVHFIRjNYM0lVdUQ3N09IKysyWjdvM25tUUUwRlcvd3ZjRzQyRjJPdUZP?=
 =?utf-8?B?cEdWUXlWZVIvOUkxUmRzMFVaNXBLNGdlY0g3L0Rkb1lDMGxLUHpRTG9GanB5?=
 =?utf-8?B?N2pwd1R3VS90S3ZKVFYrbTRadFZDVHpFLzF4WFE1UHJsS1Bud1YwSzMvYThr?=
 =?utf-8?B?TzZqY25rM0xHbGsybytLYTBsK2lEVmtzMWcwcGRDZ1NPQ1BobXErUHA4ZzlY?=
 =?utf-8?B?V3NSdG9ILzNvUHVpaFI4YVdtQmtpRnROTUVZdWJMcW1pZVVrNGc2aGZUSTlj?=
 =?utf-8?B?V0hrU3VudjlnMXZZb2hHMmRhcTRSR2tQSEFxN2Y4djhhK2tNakNJSUtTT0Mz?=
 =?utf-8?B?NjBaVy9Ka1A0MUtHSEhiS0RmTWJkOFpVbTdaQ2NMV0VyK0YrQStYckx6ODNo?=
 =?utf-8?B?QWpvK0ZmMi9BRWhVV0krcXlqeWZyTHB1M0Y5TDQvc0c3SUkya0h4Q3gveG8z?=
 =?utf-8?B?VHdielQwekZIdnk3YXVGZzNSc3hSTDhwRFVtcldscm9MY3RDbVVIRXhjNFRt?=
 =?utf-8?B?Q2hpOElxTDQ1a0IySXF4SDRlU2RpcHg5UW8zUEF5TEgvWmJDd0h0Y094emFF?=
 =?utf-8?B?TEMwZkhOWjNaK1l2SG1kTXJJemlKaGJvdE40WTdrUi9YeEIyd1hDZlpON29v?=
 =?utf-8?B?L1VZKzVPY25xWjRWUU4yZDJES3NHenlrQ3h5dFlIL3V4N0hJcUNJa0dBWFVq?=
 =?utf-8?B?Y2NwMzdwZU9tSHhFUFdoZWg3KytHajZKSFk1U0MrWkVQbVUralF3MG4ra05S?=
 =?utf-8?B?YXZLWEtwYWRxOG5JN2N4dEZqcU05NjdaWG5hc0g3YWZPdzZkdStFbEMvaU5S?=
 =?utf-8?B?bUViMFZnVEN6S0tnM1hqcnpJRmtJd1I3OU1SYktuZnF6MVNVZ3VXVGpOaDVV?=
 =?utf-8?B?QndaZGpKNk44T212cHBGbkxwQXQ4RkxaM0NLcEFUbVJXQ2NQL1VTTGlkck9H?=
 =?utf-8?B?bElUNWZHQW4wQWVJU3VZcGt4Ujk0REtET0hEa0RCemhsOUh3RGM5MmE2Tndv?=
 =?utf-8?B?RXgrVUF5UWVRYnpCWmVmcjlKMERRTndzSFpGYlhCU0ZlZEFFaVRzdDJUcmZo?=
 =?utf-8?B?QjhvVmtiZ2J3bVlhWjltZEt4ek9EMDNWcE54cUtjMVYra3BlZ3N5cm8vZW9W?=
 =?utf-8?B?VndyY2dyV1V5L2IzTUlGSDZKaUZpc09VK2xnTURrMzhDMmdRTTNhaEZ6NEUy?=
 =?utf-8?B?dVFUd3cxdFJZQWVFcTgycEtTM2c0c0grRUEza3dSekJRS3p2TDZDcjBHb2Nq?=
 =?utf-8?B?d2hLaDFhbGxJZHlycjV3cjBtOUVsN1RhL0FSWk94UExRb3M1YmNHMlcvK1l4?=
 =?utf-8?B?MG9pd3JWMzFtSGNRWjN2aHJCVkNzYSs3cjN4aENycFIvMGx0WW9NNVBpUTFp?=
 =?utf-8?B?MjBvZThwSDlTd3FqNDc5ZSt0b0ZRcStOeTBQRHJxZStka0N5cGYvMmd1NXNJ?=
 =?utf-8?B?MkJrYzVhK1hCdlhoRzg2VDcweDNYUExvN05nZmVPeUR5Q0l2Smh5Qm1uTFhi?=
 =?utf-8?B?RXg4cHJsbm1rQ2J2Q3UzZlZRMmZ0cmwzQ2RaQVM2WjIyTTlzNklOblBVMUtK?=
 =?utf-8?B?QStoZ1VxUzhLbEpNTnBZV3ovVkxUeUVndSt0T0ZDSEJ4bHBHU01EQVFnMEpV?=
 =?utf-8?B?Rkh1Uk9sOVJ6TlVrRDl2RUVzSXAvS3R5c1JrTjhjcEc5L2FvV1p3UkQxaitE?=
 =?utf-8?B?Umhua3ptNzMvd0UyS0JFU0hnYnplQ251YlFHU0YyK2FiQWtwU3NXY3dYVitM?=
 =?utf-8?B?RGtGUjdzaWEybGN0M3NrMXRYKzFpemJMMHJYbExlVmJrZGJLQmhWeGxaMFJB?=
 =?utf-8?B?T2laRWxGUHVsWHZWWEtWV1kvVlR2WlRzcEd0ZVBvbWtpY042OTVVZXQ5bkVO?=
 =?utf-8?B?SDBOemUxR0I1SWNPOFN2WHQ3WTBEZU9CYmdzSVpVWHNJa3c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eHpGdldHaUxLZEl0cTk5N0V6cTZVcnppc09uekVMOXpKZXROK2xxaHNMZW4r?=
 =?utf-8?B?cXZVaWZCRi9FcXZqNGVYd3BBYTlZQ2ZFUjhxUVE1QU5EWG1pbS9wQjl4Y2FY?=
 =?utf-8?B?ZHViTEIyT2F4cnovVGtNUHcrZjZCSGZmL1ZaY21mcmVUVFVTQnk3Vkd1MFI1?=
 =?utf-8?B?bVBYQjNBR0dDRzhZWnpDYWVOTUtxRkIvcnpjakJPNlBRUXZqN2RNZVB3ejR4?=
 =?utf-8?B?QTQ2Sm1Wd0QwdGkvK0R6QWcxY2xuaDRSbmdVdUJ1QzEzVW1uZlVvRnR2RVNF?=
 =?utf-8?B?OXVGdk5Mb3BaaEs3ZzRFeVRRcmNGanRyM1U5RzZXT05BSmxwaHhWT0RyMFVq?=
 =?utf-8?B?Nmc5YUhEcEhhbTIzRmtkbGFVY2k0V1ZGZDZmSlViQXljdDNqcnNXeFBpaG5K?=
 =?utf-8?B?NEM3VDFCVHVLZlIwbFVadE96cVFRT3RER29xdGhnN0prenZHTkZzd2drb0xW?=
 =?utf-8?B?UUJlRGZDampaZlNqWDMzUDMvaWZpRU9XMnpmR01mVlZFd085SXBadkNLTDRm?=
 =?utf-8?B?V291aXU1QXI0NHFLRHNGeld3ZVljUE9RK2d0c1N2dGVrVjk1bWMyTXQzcTZS?=
 =?utf-8?B?V0dtWnpUeEd4U3dWSU5YYjdrS3pBUkRkN25PUUQwbCt1VDhiRmRFZWNIWHdJ?=
 =?utf-8?B?cldXRVRoRTFjbmJCdkZpNm1yRHMreUMxL0pFN3hrTWtFWmM1QWo4aDZkQSt3?=
 =?utf-8?B?ai9Bc2tSL1FuNW1kZmZMbkZIZFdyTkNXWTVNdjB0S0JTVVhENXJtcmNzNHcr?=
 =?utf-8?B?bzNLai9xZzhWL0gvYk9jd3pZamlkd0doeVNxZlR5OVhvVTBLTUhFbzJxVlFH?=
 =?utf-8?B?SDFBS3h3M0dKU0h4WDJ6a0lLNlhmQ1NFSTFJYkR2Y0ZCdjRrQmN5VGxTTjhn?=
 =?utf-8?B?YmtKNk9Lb3Q5M041Yms3STg3bVZyOXhZZTE3c3VkSzZ1QkN2b2QwbUN2U3Vq?=
 =?utf-8?B?bzNxZ2dSQnU2RjZFT0IyekVvSUhiSnRJQlhXdk5PaFNDM3dVOEpnZG0xYjUw?=
 =?utf-8?B?b2k2aGVXWnJ2eWdUL0NHcjYzZy9OQ29OcEs4eVMxYnFQUENFNm05eXBNaWxo?=
 =?utf-8?B?Y0djVllxM3loaUdFN2ZPLzBRSnpyeXA4L2V5V3lKSHNkSXF5MGRVdkFoNVZ5?=
 =?utf-8?B?S2RvTTY5dmQ0clVxT1l0T2tkTC83MGRYZjZWWUMvd3RuVjJFOWFVTTVoa05i?=
 =?utf-8?B?L3ZmN2NRcFFmZVVRRlphY1pYY3BqN0ExVVNVRys3YW95L0pDckZoaEZPTnpK?=
 =?utf-8?B?YU9HMzBXSGF1K0kxazJsS3crMzMrQXB5NjVYTGZmemVKZVNIekZxWUpxSjkz?=
 =?utf-8?B?TVFDUXF3Vm5QRU1xNW9wOUd6RG5FaktmWi82M2RaNGlCSm9qbTRxRDJtM3Bs?=
 =?utf-8?B?REhKZXdZWFFrSTUycEpOdXRreUFKalQ1a1JZaE5XZktxQU1jLzBpM0dUSEpV?=
 =?utf-8?B?dWwxNDBWdDBOUkNKSHcxTCtGZEhLQ3U5Wm1GNjIrNVY0cm54MmFMMkl1Nldx?=
 =?utf-8?B?d1JRVTRKRHJBS1hHcTBkR1FxOEVwaWtnRW1rOEpOajBKcDVmUWRZZmRvcE1U?=
 =?utf-8?B?UVJsaEMyOHJmbmlHUWJJV3gwbmRjWVViMW01VEdmYkkybk5oNmQwTkpTTzBu?=
 =?utf-8?B?SnZVQ3dEZ2JOVkk4VTBUa1NBU2xlcFgrWGZzam40S1JxWnB2VHhQd0k2SXh0?=
 =?utf-8?B?dEtQYkwyTWplVVBUV2FRdm5wOVZLQmltbDRsbWFxODBYaVdZKzFGMTlQTEE0?=
 =?utf-8?B?S212QnloSmQyYk5abWc3eTdyVFN6eFp5OGkvTTJhKzczbXVyeFExUmE5cHRJ?=
 =?utf-8?B?ZGp3NUpwSDA3K0hac2x6RU8wb3ZjRFF3Um4vQnJmUWpIbTZueXpOL3ltdkNU?=
 =?utf-8?B?eXdFTDUxSEp6Y1VheXplcU5tNEoycHBncHhlcE5aSW85OTBzbTAzRHV2bEVW?=
 =?utf-8?B?Wml5ZkZYaG5ib0pLdXpkYm1BakdTREVFMHJSNm41R1c2U2xYcmdRanp3NXJB?=
 =?utf-8?B?akZ6azdFY0piQmxsS3dZbktTMkljVDdDVXhpckQ1UEs0L0JNMkd2S1lmNWJB?=
 =?utf-8?B?eFhsV3Q3MUVFdFR4NVkrYXBXbXNyMDB1UG0zOUxudUpjazJESGc4eUExTEY2?=
 =?utf-8?Q?YqmMd/4mMm55tHyM7XSlO1nMS?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e346a209-f7d7-4ef3-e0de-08dcc2aff4fc
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 13:40:16.8789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4t9oTKWcEC4rJTe0LGygyPqP9g2+pAX4UPL7fi1vGZ8yRIJSEu+DwrZCL41h+SlToW99BjJeY+3mfm3yxCzeFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10126

From: Peng Fan <peng.fan@nxp.com>

Current mailbox is blocking by default, but there are cases where we don't
need to wait for a response.

Linux just needs to send data to the remote processor, so let's
allow tx_block mode to be set (true/false) depending on usecase.

No functional changes.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 9744b004bd77..22677f581067 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -90,7 +90,7 @@ struct imx_rproc_mem {
 #define ATT_CORE_MASK   0xffff
 #define ATT_CORE(I)     BIT((I))
 
-static int imx_rproc_xtr_mbox_init(struct rproc *rproc);
+static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block);
 static void imx_rproc_free_mbox(struct rproc *rproc);
 
 struct imx_rproc {
@@ -369,7 +369,7 @@ static int imx_rproc_start(struct rproc *rproc)
 	struct arm_smccc_res res;
 	int ret;
 
-	ret = imx_rproc_xtr_mbox_init(rproc);
+	ret = imx_rproc_xtr_mbox_init(rproc, true);
 	if (ret)
 		return ret;
 
@@ -629,7 +629,7 @@ static void imx_rproc_kick(struct rproc *rproc, int vqid)
 
 static int imx_rproc_attach(struct rproc *rproc)
 {
-	return imx_rproc_xtr_mbox_init(rproc);
+	return imx_rproc_xtr_mbox_init(rproc, true);
 }
 
 static int imx_rproc_detach(struct rproc *rproc)
@@ -794,7 +794,7 @@ static void imx_rproc_rx_callback(struct mbox_client *cl, void *msg)
 	queue_work(priv->workqueue, &priv->rproc_work);
 }
 
-static int imx_rproc_xtr_mbox_init(struct rproc *rproc)
+static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block)
 {
 	struct imx_rproc *priv = rproc->priv;
 	struct device *dev = priv->dev;
@@ -817,7 +817,7 @@ static int imx_rproc_xtr_mbox_init(struct rproc *rproc)
 
 	cl = &priv->cl;
 	cl->dev = dev;
-	cl->tx_block = true;
+	cl->tx_block = tx_block;
 	cl->tx_tout = 100;
 	cl->knows_txdone = false;
 	cl->rx_callback = imx_rproc_rx_callback;
@@ -1083,7 +1083,7 @@ static int imx_rproc_probe(struct platform_device *pdev)
 
 	INIT_WORK(&priv->rproc_work, imx_rproc_vq_work);
 
-	ret = imx_rproc_xtr_mbox_init(rproc);
+	ret = imx_rproc_xtr_mbox_init(rproc, true);
 	if (ret)
 		goto err_put_wkq;
 

-- 
2.37.1

