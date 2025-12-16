Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013004.outbound.protection.outlook.com [40.107.159.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FAB227A465;
	Tue, 16 Dec 2025 01:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765849906; cv=fail; b=OVdS2VF+eg72HNhD5RCozMyWL0kocsK+PSvPfEIJVoKNbsMnP8rocTayMFaa0KBuNT2yMuOaky8aI0YJEO6hUR34T2OG/6lu5vKEjZOXsgff/e3E5r+vcHYO2GLfsp1yvqnZZTT9kIaGKmq2zn7KaoIPo/q6TY1sr34lVEp7blo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765849906; c=relaxed/simple;
	bh=GzTZ3jBZHEP7ERAXCUdMx9Tlx1dyISSMb1JF/vivZ6s=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=YH4FDpHHgSbhsyuPUSPxF//mH01U1CI9SZHIJ06/+HYiCs3FaRRudI2DqsoqYZBWh0vGLWcZxCxn0f4P/0sTEl9NvisT7zG96XXMMnph6tcAqZTTo5uRcZUwE0DpKtRHzterzHBWi9VYZw4ia6mxTyQcJEyer4eV6p7VFOQBT9k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=E28u2M8q; arc=fail smtp.client-ip=40.107.159.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="E28u2M8q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YPOvDKjUqZoEDHldEdoHev2yUipzsV6U4H/yGtyFxFZghmTkmt81OsIYXi7szy9K7uieD0j/a/kM605bcQvXM+EgZHOyNHxTS6oVXJ9wJSbuYmpSrTUW65Oaf4WsdnsWoGS+TNr4B7GDt9C87vo+0V7qgm0LdZrM7LngQYVuYM1kW8RXmsnOzS5Wp68Ij6ntDQHbo/wB7ttFnAj+o623T3YFSF6zgy1FqNNqZaJh1+3WroZh1xDZYaj46I+03YfQUMhe5TtVcCLhBAdm1POhd5KJ1/CmH3q3CdTRbqMHiVbcX/bcvwzNkc6smmdDHiTwF1+GFbkm7JQu1E43/uKuqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wH3ZyL5xSdhaSj2naQrW424tMvaEJcT+AKmVkNkwiTg=;
 b=p16shikqrrha5vYWGPrSRy74/KRIdTElW9svJ1zMLgY6jcVkTLFfcidH6N4x0DN3WnVbtlgxcNmYsqur4ghGsvoSAFxv4F7sO7ufPBqGduEnrBWCkmAeseIrmFlloI/Ly2VwOVXgcb45Of0qQI/r0Uyz2mntG5KwM0G9ivgy7XeOXsdHiDvPrmmHzgChM0Nc6npCRT1+eEWober+dt4RKXmND7Z3cG6nXsThVtN7eIz6wG+RpgUGfbo4Xnq34QmF6OyGki8RcTvTWtcF19mq3Q7QEyjrydFg5NSXVsntevH0ga9LrcwGkZu7qsqgmvUF/LvoXP8nDbLUiM6ZpcLaoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wH3ZyL5xSdhaSj2naQrW424tMvaEJcT+AKmVkNkwiTg=;
 b=E28u2M8qBDb/rVqxqrVyJcvR0cdnmOlFEh1wXgSzXI40QX6XUxR0GzpTnxRoY/bYU3mDRNrXl611BCDf+jR0Syy4RLj5e9sq5fVfWKm8Qa/bTV/w9pMc8fVxp68htveHCtqambNyx0oYw34b7bv/ebfQBV5blk8wNHT8v/iylIGGK4WyS4h4Ud4w2y6XNtLMZOV1++F4L8gRtaleBQKIzzEVWtLTgxu+N5DQPE96nLTforU3f8WsXp8DFQQAWWzRjN8BiCPARDiRdHiHhMEqyM1ZzVKlPTrjv1zFlo/T2y9b86/f69tQpmUVgvVs+Rb3geCqX6qqBY6KksrnGucBZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM0PR04MB6915.eurprd04.prod.outlook.com (2603:10a6:208:187::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 01:51:38 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 01:51:38 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 16 Dec 2025 09:51:00 +0800
Subject: [PATCH v4 2/5] remoteproc: imx_rproc: Add runtime ops copy to
 support dynamic behavior
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-imx95-rproc-2025-12-15-v4-2-bf1064ea8daf@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: e051d2e0-7a9f-4017-f920-08de3c45a714
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WEo0QTM1WEtmTHdhVE5hSi85UGV6clhNQlIvNnBGOFUyemtwNm1NSXVsdXNJ?=
 =?utf-8?B?a2RRcGNKbUNkQ2tEeUJkU2kzZDlFakdZcGdaSHZRcHJBdGlWdkNITkZmTysx?=
 =?utf-8?B?VzYvWks4ZnZRZ005V0pOZ0hHcWNSNEhQOElkSlY5QnQvZjhMb3htdUI4WmlK?=
 =?utf-8?B?MFc3RkpNL2VyU2dna05Fai8yUjVDNVBPVXRSVEJ1dW9hZFdwa081V0o1SlpW?=
 =?utf-8?B?TEVTWjRWcW1kZzJNRzhMcFhvSUt5akdvL2k2SE9oWjBibkM2RCt6WFNyNTZC?=
 =?utf-8?B?aWJ2bm9XaGgwdFJCck0vb0xyZUZONGhYSkI5TU9iT1BSZGJiS2wrVDNxczE0?=
 =?utf-8?B?Z1p2RnZiL0lDZ0w2UDdjbXF3dWlBeEYzQlFnZGtOZWszbmVueWxxQjR4dnB2?=
 =?utf-8?B?TUhnTi9KaERuNU9XSG5XNEZpc1BiNkRCdDkzOG43VnNxazhiWVJySzBQUkI3?=
 =?utf-8?B?Yis3ZWlHdVQ2OTdveklIcXUzenI0OTcvY0ZCYnR4ZE5tUzZtYXZtU3A3bytn?=
 =?utf-8?B?MGViU1Vpd05aZ0E3aS9QN1lPbHMxQlpzdHhTOUhxOXJRbkk3NzNNVUp6SGdC?=
 =?utf-8?B?VnJkcldFLzZ4YVRHRmZlUVJYVlBLWmJScVZBd2lMb25PYW9mNWtOYWU4dzFa?=
 =?utf-8?B?aHZpS3RwUGJvcjB6U29PdzllVXJKQjlZa3hIdkcwM1BadE1mdFhodUxleXNP?=
 =?utf-8?B?MFkvbmNnT2JIS1czZnVNVExuakl2T2tNOHhxTnhNUTcza3lldktkUUdrakpX?=
 =?utf-8?B?dmhqZU9kaE1sTWpPaUlBUDNKbkJ1VmtDM0NTaFExQkVHeU9nL3ZYNDF2OUwx?=
 =?utf-8?B?WEtPM0t4d3NEZGJHVWkyQytMYmFjOXlaRGRSZjh4SUcrYWJYelBWRThvd3Np?=
 =?utf-8?B?U1J6Y1ZlMjZudWlyMEhwMHU1ZmlSOURaYVNRc0hPa1RIcTQ4bzRUcHpBbnFJ?=
 =?utf-8?B?Q21tV0ZJdjJycjd5YlFvZlhlVGRCRi9YNjJRcVFBRHRWTHJmYWlBeVNEc2xy?=
 =?utf-8?B?cmtBTWllNEJSOTRVSzlnd3g0YVQybU5ZSlpZZ3UyWXJtTktaZW1uNVY3Y0RJ?=
 =?utf-8?B?NWVuTzMzL05ZOWhKMkkzUzIyRi9uSitldkdRWGxEdWpwSWhhZG9zSmlKZmNk?=
 =?utf-8?B?ZFpFaU5lUWFhUHQ0eHQ2SWUvVzZYSXF2RlJ2eXJzVHF6Q0xqSmd6OEtjb2Js?=
 =?utf-8?B?OGg0TlVQaUZNY0NuanFsQlFYOVM4NVdZYjFEaTlickNPeHNFUmtpSUVoTUVN?=
 =?utf-8?B?eXdCV05tWXhPZlAraGlhTlVhVzh4VlVrU21zb3E4cHo3bkJpOVI0SlVtZ1Jl?=
 =?utf-8?B?YkE3OFowSWxGNXNrUnpFV3pjVEtjdlJJdk1aN0F1MzJOL0dleTJKZTRZNnJD?=
 =?utf-8?B?eG5OdVErcHdTbHRPb24zZnJ3SnJqNnh6cU1ReEpwZC92VkNvZTFuTFJXU3pj?=
 =?utf-8?B?ZktNMVpsREhUT2JuRkQ4d3NoblNOOXA2MFFVRlpiOW1BeHhqMnM4NzZCTnpt?=
 =?utf-8?B?REpGczl5TUxXWC9pMG1KWnJFVjhnQVEvV2xEKzBET3ZVYlFoVDh4UHBwRjdw?=
 =?utf-8?B?cnNTa1NvT25vaDB6SUVodmxZa3piTTBCV1A0Y0JLUHhWbWV3RDREaWlEVFFq?=
 =?utf-8?B?THlSeFNLak5rc3lQWlQ2Yml5bmNFRUNiZ3EvdVo1c0dXTUhZcng4K1h2YWFQ?=
 =?utf-8?B?Z1JqK2hjK0RmcHNLTWpZYVFISmxSbzFmT21Uc0NPcUNDd0taNzNvR0FSc05N?=
 =?utf-8?B?dGYxSjFhaDBVcGd4STFIZTA4eHNXOThIRzlUYTJFY2ZIcjFjVDZ0eDZldVNB?=
 =?utf-8?B?YmYrMXp0SW8rMFJqRXUrc3dxaG14UTRodUFkb21xVDBRYk1rK25zalR1U2FD?=
 =?utf-8?B?L1lUNWFiS0dLTzFZeUdZRzFickVMQlA3S1IrSXh3L2hVYzVWSVg4R3BuUFMy?=
 =?utf-8?B?cUozWFlpUWZITDVIcFY2alUvOE96NFZMV1hqbFRSdXhPVTY4VmoyVW1ILzdn?=
 =?utf-8?B?aEc2V08vc1RjSkhSZkVmTWtaQ2d4NmtBSEdZNlJhV0U0aEhOemgrUUJ6NW1F?=
 =?utf-8?B?SkdqUXNmMlNmSUg4Z0szLzNUMER4L2U3cnp3UT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dFRnT2VkWFZGUGFvOXZNS084U1I0MTNHZFVIdnRBdmJVQ0NSNTFkMjdTbUtU?=
 =?utf-8?B?YklhS3Z5NnkzKzAzd1hVUmpENGlaeFdQcFhXZXlJZkwxSW1FbWVOS0dUdUU3?=
 =?utf-8?B?cTNJSUVMazl6NkNNd3dsZmd1UFhrQ09GOVBVZ294c2lwVXM2elJWcHlORG96?=
 =?utf-8?B?U1p0L3ViYW1CZ1pmVk1ackZTMXg5ekFzZGluR0N4d3RIVEFYTG5sZitidG9n?=
 =?utf-8?B?WVpIK2xXdW1YTjZFVkhqc3laTm02NklRQ2dVLzBJZmlGekxOLzE0Vjl0K25k?=
 =?utf-8?B?dStza3lwSTdoM3VpODVLR3MxOTlnRThuTFlya00xYTRyakVRc1VwbUI1QlJG?=
 =?utf-8?B?ZU9UR1piVDQ2UEVxbzdOVDRpU0ROSjk2NHZWM3pQN2h5UGl2SWNWWmtYTjFV?=
 =?utf-8?B?cVNlUi9xVUhtV3NCOW8xRldSQ2ZkRUd3VHQvaXprWjdqYlo5SmZTaS9oM1pp?=
 =?utf-8?B?OVMwRFNDWHYzbElMeXh6VER5eFJwYTBtb0Z6bVJjQ1NzRm5UcFVJZnlvWC9Y?=
 =?utf-8?B?S2pha2FCM25rSmtlNktzRFNsVUFOd1VSbjFITWhpcFFFekczby9PdUE1RjJG?=
 =?utf-8?B?aDRESUE4Sy9pRGwzakdXeGprQ3BaZUg0bXcxM09RNEdXaXFOK0tSVmdiZDVr?=
 =?utf-8?B?ZTJJdjNERzhEL1B0Z3h6WDQwck8wY1FwQW5QWDJHN3UrVVpNRms0TEhEemxN?=
 =?utf-8?B?YmhkajJvWjFFQTB0MlB6UFhUNUZxM2I2N25lUjBjODVIRG9iV1F5VUgrWnRE?=
 =?utf-8?B?Zm1SRlZUNGdXTEtVeWR1R1JROHJGeWh5dEVZcit6azNkaUowdUFNVHRMM3ZC?=
 =?utf-8?B?ZWZJbTVsR0dJRXZnMytlT3plNDM3SDgyMzVKeUM0TTlYd2pxNTlsQTFGcW5L?=
 =?utf-8?B?NnhWT044OThERW50bVdwejJFQ2RPM2xzcXlzd1JvdnVHYWV1UElKaUFuUEkz?=
 =?utf-8?B?L3JQWlAzQnU3b2hxd3k4RXgxalpqS3gramI4VGE0RmpNYjRPUWJmKzNidUN5?=
 =?utf-8?B?S21aZ3pmZ1VLZE5VU3pjOG1EVVZFTk8yV3daN2VzcEFUeUpZQWhXaEg4V3Az?=
 =?utf-8?B?R2ZJdC9CTFA4TG0rQ2JYbXJ0NDZVb3Y0eHhHcGxpZmFNMnAwYmhDNHJhdDRq?=
 =?utf-8?B?QmNVNjNrZ0swNjM2TVBHTXM4Smh6V0FUNmwxNWJ6STBsMkxyNFgrc3NCRDFS?=
 =?utf-8?B?SlFFYVFDU2FTSHozUm9NcmdZUERtMkdkZGhpQkZPcEJVMGErN0E3Y1BsRWVa?=
 =?utf-8?B?YVM0MWNseXlyUjlTZW90cmNIVEU2ejlkUFkya0ZRcjlQZG1qSkRrSHcvcVcv?=
 =?utf-8?B?WnovYUxGcHdVVjFIc2NCNjdIb3JzMHoxNzcvbEl4cTV4dGlEa2w0Vk5TczQ2?=
 =?utf-8?B?SFhwRVlsRFZRVXBrVFc0YnVWTU85eFFWZ296NXoxWVVUWHVqaHhoeEVRQnBv?=
 =?utf-8?B?ZStnUjlGWDlQYXo2bjBOMlFpTEFuU2oyNVUvU1R3V3hFNitIZFkyWndISkp4?=
 =?utf-8?B?QkRaYWtabkRvQVRJK2hISThkQWM5cGxVdHdUanEra3NpbkhiMHF0L0gzbXFi?=
 =?utf-8?B?bVhialR1bVpxazN0V0xrV295cnBwbDJCWHlGU1Z0NWRBMXdMRWlkbmdpS0dl?=
 =?utf-8?B?Q1lDTGc5ODZoS2J5SGc4QS91alZDWlVlOHdHU25jQ0x4TmpzOUlRTk96d21K?=
 =?utf-8?B?TW55akVyd0JMcmZsQW81ZXBvZWFWLzdTcnNvcFpocTBBc1kzT0ZWcTQxTVFu?=
 =?utf-8?B?WWJkaEVDK2M2QXZuQkxNMkI3QWJKNW05Z3ZzcGszdExzVWp4Qkpib29IbUk3?=
 =?utf-8?B?Y1Z6bm9nMWtQeDYrRTM3VTV4eDVnc1d0KzgvUWZEcDdRMDczSEFDQjZFNEhl?=
 =?utf-8?B?UUpEMGZQTnNweDA5czd4aGhKVjRzVDJvWkkzSmdCeGx4eG9FZEFLdzBTVm9R?=
 =?utf-8?B?V3c2ZVE3NjI5Yng4bUo5U1VtRlBXQ0xlamlqV3lsNmZDbmtvdlhoNmp1MHB6?=
 =?utf-8?B?NHRzR1F4U0pTbjF5dHdiTXpMTEF1TkczVTlNNTlNbmN0NFpJQ3diREt0TzVH?=
 =?utf-8?B?MEJHMnpITEVUZEo1YXNpcTVLQVBwYlFiZncwQ1Z6ajF2aUNRbVduRUJWVk9y?=
 =?utf-8?Q?U0PnzsSo7Vz9eXYgutxu8W01U?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e051d2e0-7a9f-4017-f920-08de3c45a714
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 01:51:38.7882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s3YQ0/SD8KT2MkkFGxsPddkyJnwnMMWy0lZLGjMVYI7+4t0QPkEd2mhPZpL19Gw+pPQ/Vwl8Ugiq/a/DJ3NtWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6915

From: Peng Fan <peng.fan@nxp.com>

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
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 3be8790c14a2ccc789dd40508ec274000ec09978..6e50a9abd0a2c68c79909beb653567e0592ca2cb 100644
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
@@ -584,12 +583,11 @@ static int imx_rproc_scu_api_detach(struct rproc *rproc)
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
@@ -979,18 +977,16 @@ static int imx_rproc_scu_api_detect_mode(struct rproc *rproc)
 
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
@@ -1040,6 +1036,9 @@ static int imx_rproc_probe(struct platform_device *pdev)
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

