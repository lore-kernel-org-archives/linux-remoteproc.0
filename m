Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013004.outbound.protection.outlook.com [40.107.159.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1F429ACCD;
	Tue, 16 Dec 2025 01:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765849911; cv=fail; b=G2OYzO+fsXRFpPb3f5skOW5MIxtq+SxFgld1wSwKoKMI1UVuPhIBOvJeFsbA/UDHS0oXRfjb4E0VyTKOA5PJVh2rgvFq2E3dKWZR1YF6llJuY93skshVRXpFmVAjJdwaVxpeeFR950AmnJWLrWWbuvgnNUHbHW/hly/LpE9M4AQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765849911; c=relaxed/simple;
	bh=Ffdii574OYx6r3PcnfvWka2Lx05yTBtW46jZOu1Yv2w=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=HPqH8NghSu5G8wQS8Tn/KfivycUDELnAoe/yXASErgT+KkoutHR1JRgIL3XhvadyU6uz8gCr1dEqDoDCqLS3dWMuw8thhXNkKYu4Nnp945aP0KC/oiqRJNYwRP2dhqUZ93Mr0vBsLpYjdBH4xObIexPgZv+C4KwwiM4k7kHjt5I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=TnFlQkqc; arc=fail smtp.client-ip=40.107.159.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="TnFlQkqc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T7s1Nf+E0HHqOlzeyjbW8sr8q6txOLPq90sF3MeZ3b94q2qgmg828me2Q4kL8UkKuSaYxnsIxFff8cjqiT0cE5Z48FZ0/HkxZ1ijTqYujW8AGYpTqOVYmnxpSjyFif+mvI+wuQinMgx/7E+JxR6EheUZOmS18O/BvGfAd4HKXxcDQATS2AWLY9tfBtIVew+Y5YawfjiZE1JSE5vI7xuFHeitBszIpCs//b3LlnVhNsQ05Tnr3jc4zRlZeAIO3MZBFm3wjQYGz8Cmvg2nTFGSD6eIDLKhoGZ6AjiOsd9aH0rTyEHgXUo8En3H0sEaNZPOQHLJNP92o/4Qibp/TDoTug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YNhAwtJgE85Scu3/eFP81IWvOudpMg24rjk7P5F1pk4=;
 b=dBsX68grJ9IHLTvmo0QfnBsz6NZHFbHHmqL1oYKk7oFPlqNdrpwVLDE0N/lZ6fzkdg/lw1vZm3NxxwIDDKhwnDgfc8qvWlhV2dG5f/kCUcr/o3EI67bLczZQc0zQPKp8gu2wawE69S0OmhHtV3VfTClKGiIXixDrt0F9xtlDP099GMzczXaitZIzVfzoFgqvZ5jtLzRRQpAd8CNj3tDyMFGPWQX/UtffInPHo+Z7NzF9hk8pUPo4X4pBR0D/nP/Xw++L7II3mkkUx6c5pjnk3cJ4yBkYBZFyOo5+w+cAR6shGVyJjOJmuei88Rk2tFchZ85ISCwNtSQ2KK41xZR4BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YNhAwtJgE85Scu3/eFP81IWvOudpMg24rjk7P5F1pk4=;
 b=TnFlQkqcWs9xxKPBz9JIXOgyuXNd831eIzjjWvdn7de15LBTphGKp4pNu7DveMHrnTkcGKYfuOp2UnEYdA7NvoGFhsOKLujXVWh6tw0Qmxce8KMCop7Rpbw8CLnBqjJVpwiQNKFMsSQGNsoXDRa0sOfIpxGsTSbRHlWuPrOSnSWUGtAbhk8tilpvHxNF2aN/rBstkv0KREH3HuxhfJjjE4xfoFaTcJnNlDdC0AvosvxXdpeeOf2MkyW95wglYEq3YvSZBNdPtJYT1kxKksVj5xadhDU9oveNb6QLXV7cF6dHEOvvYHGgWYTXqS+K9e8oCgt/LPCPc7NU0ruSKSirCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM0PR04MB6915.eurprd04.prod.outlook.com (2603:10a6:208:187::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 01:51:43 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 01:51:43 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 16 Dec 2025 09:51:01 +0800
Subject: [PATCH v4 3/5] remoteproc: imx_rproc: Introduce prepare ops for
 imx_rproc_dcfg
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-imx95-rproc-2025-12-15-v4-3-bf1064ea8daf@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 3588e59b-e109-4df2-fca2-08de3c45a9d4
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M0JISnJEYWEvM2szRUxXOUZNa2M4anhyc293cFVLYzB5dXVaWEpTQ1c4VHpl?=
 =?utf-8?B?NjZZVkZ2dnhmK2ZnQ2p6Z1lhZ0E4MzR5Tkk5NnRpejYrdG1QVEF4RkdLRjlR?=
 =?utf-8?B?NjJ0NXZpNENhNU1FSFkyL3VwY2gyOUhiSWVudHVuU1VsaGk0MGkrZDJXVjFy?=
 =?utf-8?B?NmdGS3BqdlFFeDF1YXNuU2dUUVlUd1lhMzIrWC9RblFkaDhnMHd6T0hTZVZD?=
 =?utf-8?B?aktBVkdXZjBSVFBDVHhHbjZNMC81MWpWZHpmR0h1Z1lkdnIwR3YzcnY0YWIz?=
 =?utf-8?B?UTNNUTFvNk91elgrQzljSld1ZEY1dHZFNFc2K3RGRXRYcWlYdUh0ZTl0Ykwv?=
 =?utf-8?B?ZUNKRWo4Y2F6MWVnSVdWbTRjL1h1eSt5d2pkNk5HKzErVFJmSWd0ZTBxSHdK?=
 =?utf-8?B?eERNZGVKUUJQNzZ4a2ozYUd6RW8wN3dwNUFGUVFJSjhLY05vWHZaUnhzZXR6?=
 =?utf-8?B?bitHRTU2TWpEN0R2ck80bHE0dGUwTFBWUHRGdGdCWnF1VldpZ2NZWmcyakQw?=
 =?utf-8?B?endBSXhVWnJmSUlCNTNmOWp6dzNxTm5KaldkUFB3aVBlL1hZT3NyNVhYOG9G?=
 =?utf-8?B?N3phSGRGekdwN0lZRldIVkVRQ2NneUtjNTRMVHBob0g1S3hnMG1NUDlNemky?=
 =?utf-8?B?MUozZlU4b0ZCYkdCSitLQzhidFhPT3lmcklGTGxvQ0hneGJtZVdoMkVDeWlu?=
 =?utf-8?B?K3ZCZWJiRWRnSmlXRVQvUm1xZDFUQlpnc2J4VGszeWJMc1Nva3Vjdmd4Vnhw?=
 =?utf-8?B?aWlBV2d0UkQzQVlaWHpxT01sbm1SSHRraTUvZk5WT29ydVRoUUtVUXNrK0c2?=
 =?utf-8?B?YlBaUjJHUnA4Yzd0YzFIYjFDaWJNSXd5ek5ibituSzZtTTE5S2JnemloWHh5?=
 =?utf-8?B?TXlKeWlCMy9aWm8wQTVHQnpjL25QLzhZamoxS3BWVmVmM3pqUkFERVBxOWIr?=
 =?utf-8?B?ZitEZVhTbUxaSW00UW4ycVhobjdESG93TmZHRjhlMTZKckljbnZ0SkdYc21Q?=
 =?utf-8?B?VzJDcDlDa2FEcW1iNW1QUHdSSHJ3VXZuNzkvRzNrTzQydWJGSkdEOHZBcnRr?=
 =?utf-8?B?ajVqRk8wMlAyUFJkK20rUXBtekZXVjhVWGdMZEk0NEdXeG9jOTJmZ1k1Wmky?=
 =?utf-8?B?bldYNVhiWTgzTlJDZWlaZ09GTGxBcld1aThVZGVyb3N3Wkl2cjNUT24zSUUy?=
 =?utf-8?B?Z3N6ZzFPcVI0d3BnVWNmVkRIQmphWTkwNExFYldnMGNMRUgrbENCTmJKSlBN?=
 =?utf-8?B?eXBFOFpOeUV4RlZTNk9MVlVhdThsODlUaUdhQ3VpcGNSSjE1SFFTMGZwa0U5?=
 =?utf-8?B?clkrR0RMR0J0QUpkZnB6UVpYaFczOXhCUTlISDdyMXhwNFRQUnFGWGM2aDl1?=
 =?utf-8?B?NjhrU0VRK0s2WGpZNFdnVjhGUkRsaEs5K3J2bnlmd2crTWZaM2VuUHhndFZa?=
 =?utf-8?B?V1E2K0ZHR2RWMnRSNmpXRmhKSmpoaWJTa3FKdUZrRjdXZUZRRWkxcHhoNnpE?=
 =?utf-8?B?YjhxVU10dzgrZ2kvOGRIN0tUYW9HVTY2Ri9abWhFb3ZpQXh6dzRLWE81cEZw?=
 =?utf-8?B?NnZVbkk1VTlBaHB3TmJWR3Z0VVFCUW9SYVFMSWJFOVF3aVRjd0tLSVRYWDli?=
 =?utf-8?B?dzg2RXRHYmU1cGROV1FjbGhIQ3E3ZzZWQzJINDB2RjRaNGxHcllaQUxqb01W?=
 =?utf-8?B?T1dNekg3NlZ0dWNQMDRWZEdUR1Y2YkxFMG1qSnZHdmt0b3pYcGRSTEpZRlg2?=
 =?utf-8?B?MUhFNUZ0YkN6V20ycm0zaDRCa3U4anRPb0hOTkJlaDdyeTE1Q1cyajBwUVR2?=
 =?utf-8?B?dDlSNGlFa0VjbHVHNTBXeVZ0NTArVFZpS1QrUWU0WnEzSUlTbGV3czBWK3lm?=
 =?utf-8?B?dFVzc0kxanhmQjhETmdXbWk1SnJQZGFWU3ZOdE5CTDhFNm9mc09CQXk1Snlj?=
 =?utf-8?B?K3NRRUJTSjZDaVc1QmlsTUlGLzFNRFRQVnA4c25mZkRpcnA3UjBhdE44dHJ2?=
 =?utf-8?B?SWRjWVR6ZVFEL2dkTGR4MHZwamNiOE9NMit2OHc4NzJmeU05TDhwbVgwRk5n?=
 =?utf-8?B?QmJSOW1pZXdaeVZsc2dUL0IzajZkeUptQVFDdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2RLSnhDREF5cjNGT3FVRk5JWm9lKytaRkl6ZnA5eXNjSU1EWXIyQlh2MkNP?=
 =?utf-8?B?RGx4MlhpS2xOTStDZlZFZjlLRWFyM2JYUlJ3bVJjQjhYTWpyZElnUnVvQmtF?=
 =?utf-8?B?Y3g1NVhtVDliV3BNZi9WTlcwcmZIakMzR0pOajVCWnI0NWlHQ1ZJVTZlYWlS?=
 =?utf-8?B?b09kTklPTklUUnRPeHFDZXZkQjJEL0toWnVtWElLbHd3V3l4L0lXWkt2SXlB?=
 =?utf-8?B?aG1ya1NUMkcrSmJyVEJ1bTRiWFk4d3RraDFQd0xpWE9xN3NOZU50RE1rODBK?=
 =?utf-8?B?a1A3T09xQzhmRWM0WjMwdlozMkcvbTRkTXF5dUlZTVRpVW53cFp4TmNVT3Uy?=
 =?utf-8?B?Zk5QdHllTWZTc29pWVhTVzZZM0ZvQk9tWlVKM2gyMGprVjdCRzJXcE5tQVB0?=
 =?utf-8?B?a1U2RDcvVWlYMmI1VGt4SmJDL0orZEtpMHJtYUdQcmMzb3BhZmxUc3pwelBp?=
 =?utf-8?B?cTJzbFM4a2pYaTFaSDBja2tOR2RkYUsxb1dvSkJDSFJra2o0bTM5ZnZid01B?=
 =?utf-8?B?YW5heGFObW1TOXZYckF3anh3QmphdXAxZENpc1R1dnNJUlYzSVpwOU5wN1dT?=
 =?utf-8?B?R3BlQmtQYzk1dFlWNlNieFZLZjZOQmV6MzBESm1kb3hRREhzYnM3a0FaVVI5?=
 =?utf-8?B?c3B3WmEvQVZkcGRmempPa002SEhPQk5YMlEvYWpvQXBtNUhMVnVHeS9Lc0xR?=
 =?utf-8?B?aTA2OFZnc0R1c1FMT1lrbE5oQkp0WHNTaVkwdnhkOGhiU0RrUFZtT2hETGR1?=
 =?utf-8?B?SHdUL0ZSci9ydXdjOGNnOXNOd2Z4NFJFY1huRm9wMWR3U21rSXdTMnRXSytG?=
 =?utf-8?B?cFJ6UExSZURnWTlQVW05d0dqekNvMWRieVRyeldKMW54bTFuUjJMcU1DWjQy?=
 =?utf-8?B?UU5xQWZ5OEpESy9RR3k5WitGUURPT0VJWW5qZlNFQ1BWc1VlYTNjc0Q2T0pE?=
 =?utf-8?B?RGI3aTZnazFxS20zS051a2FuMGpQT201TnJYUXdlZ3FGdEo4cHRTcUN6VSs4?=
 =?utf-8?B?cUpwLy9XWUMyR2xZU3hvOUl3Y29Rb0F1RG1NVVZiLzF5NzBudU04OGhLRDVV?=
 =?utf-8?B?WmxYUTVudmcwMW9RT0o1MjhueDYrSFg2c0Zlb2FGV0tRTmtqRzBKQ1h3Vk9C?=
 =?utf-8?B?M2t3Nlo3LzNZTTlLdzJReFJVMlJycUFTS3dvL2U4dCs0NWNTOERyR1ZMMk94?=
 =?utf-8?B?clRxM3dwTWRGejc4MVhRUzl1K1RkWERhcGZ6Sm5JT3Y3VmFVTEtLRHo4aUhL?=
 =?utf-8?B?RUFQM0ZtWTllNmRhbHoyQkVpblM5NkNIWk1Wa0twdjVBbC9xQnpoYnJRTlBu?=
 =?utf-8?B?Uldzdk1RNmNMZ0I3SlRaWGhJdm9SZ3JuMnlQT0FQL2tDN0N5bVVNcVA5cS9i?=
 =?utf-8?B?dk51VEpjd0tIM2FxOHdCd3V2aVNoTDhuWXBTczRZOGxnOU1CUWxhbWtJaHpU?=
 =?utf-8?B?NTVPVEhZeHkySjVhUlpzNVNqZk1XcE9rTEFzYnIyOUdmL0dUUE9JeDQwd2pC?=
 =?utf-8?B?OGxka2ltUFB2NHZrTitzYStSRWo4alZYZE9TOWZrYUZHVjFycDIxSG5Qc2lZ?=
 =?utf-8?B?cnNrWFV5SjkzNHgrQW1sWFVKYWJ6aXJrQ2xraVdYdnhKR2pQeGlZeUF0Z0w2?=
 =?utf-8?B?ZFFIU01TdUVtU090cFU5ZlF3TWxWSFV3RTduSnRTZ3BqTWUvNDZRMnR6YllC?=
 =?utf-8?B?QkRiWUt3ZVc3NXcwRDN1U0YrcndqL044czVuTkxwN2dydW5WS2lhV0g3UEdy?=
 =?utf-8?B?Si9icWhqbUg5Qm96cndSYVZxZUQxL3dDcGx6OVZ0ZWtnUE5oeTB4REdZcG82?=
 =?utf-8?B?ODhLSUVDa0UySG9vVm9ZakM3V2ZIOENYVXBzaVdUU0hnOFc4US9NNUVXSk9D?=
 =?utf-8?B?MDZ1SW5ldGZzdFdna3lEWjEvcklDbVB3M3JkbE1VdnRTdGVpeG10ajdteVo3?=
 =?utf-8?B?bmIzbmh1dUdHNmUvUzhRYnptdk1aa2sxM3FBeWJyQlVXcFlxYXJyTDhOQjZM?=
 =?utf-8?B?YTk2NmE2S1lvREtmWElGZlpLVXY1TlJCL1FQcGZ5WGRoQmxYU0ZkejBMSWRE?=
 =?utf-8?B?bVlrVXZneHRBRzljL2VBWS9pcVJuNUNuNDF5NDN0OVlWVkxmVkdxVjJ6Mlhw?=
 =?utf-8?Q?/Mb9wkIaiJ9YcJNNjupoFDAHu?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3588e59b-e109-4df2-fca2-08de3c45a9d4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 01:51:43.3938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k/QhSxsBMCfvzEmfZSIbW4exQkykoeNw1RPz+u6wCPfRa8VG4ClyuYITBrlYnQfzy5iATXmBmm7qnRDJzTfpBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6915

From: Peng Fan <peng.fan@nxp.com>

Allow each platform to provide its own prepare operations, preparing
for i.MX95 LMM and CPU ops support.

No functional changes.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 5 +++++
 drivers/remoteproc/imx_rproc.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 6e50a9abd0a2c68c79909beb653567e0592ca2cb..35585235c683e6327c3e6db65d5d33253ffba327 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -527,6 +527,11 @@ static int imx_rproc_prepare(struct rproc *rproc)
 		rproc_coredump_add_segment(rproc, da, resource_size(&res));
 		rproc_add_carveout(rproc, mem);
 	}
+
+	if (priv->ops && priv->ops->prepare)
+		return priv->ops->prepare(rproc);
+
+	return 0;
 }
 
 static int imx_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
index 1b2d9f4d6d19dcdc215be97f7e2ab3488281916a..37417568a0ade2ae4d6a4e3d0f139ea52b185254 100644
--- a/drivers/remoteproc/imx_rproc.h
+++ b/drivers/remoteproc/imx_rproc.h
@@ -24,6 +24,7 @@ struct imx_rproc_plat_ops {
 	int (*stop)(struct rproc *rproc);
 	int (*detach)(struct rproc *rproc);
 	int (*detect_mode)(struct rproc *rproc);
+	int (*prepare)(struct rproc *rproc);
 };
 
 struct imx_rproc_dcfg {

-- 
2.37.1

