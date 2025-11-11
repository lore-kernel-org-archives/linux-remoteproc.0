Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011061.outbound.protection.outlook.com [52.101.65.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57112F6923;
	Tue, 11 Nov 2025 01:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762825302; cv=fail; b=iAI5VxkBZzRujRP1dqjh+ufOYIkUf3cu1zsNqNLRA7XFiddDWzliEMLM6E24nrpkUU4l1rWuXA7bPO4yJiJoPnNGGwuCQAPVfU+E1TR+39JDWvIIkcpcnF2fBmg9O09RvBnj8boQMQoxB9qBMO1Y3muexWcUEcOQiBXBEVuQ7jI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762825302; c=relaxed/simple;
	bh=tc+LmmQ+xzWQeBObbwMixhwruyikLlMHMARclSmw0Ms=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=m2Mvgo6RccIaV3XB9LiNpIR0rsw0cLhR1u1yl8+siQR6QF/f0Fb011QO1SFCZ1cN8tA/UxMmCRVMwMocasMSj3nLTLd8Xb9B0KVJQP0DPk+Hv6gH2eNpEVGmUKpDCluB600H/fjQh+cow6pxn0lk0sdBKUZ0QJtAqR+kdw+uJrE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=m9lCK3IV; arc=fail smtp.client-ip=52.101.65.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="m9lCK3IV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZaNwHwUzcdYI4sl0jBfkBvC1JMz3iVcFhEqC1uLPgujOKRfrrKAeK73mNleG0TK0QHzPJO568+qk3HcDfCKPWpH3r2WTsnyP+y1AVHBbpPA51Gjv4mA9IOoOkUFqPgTjJfGkz/ftZkH50vQRTBYRyyh6F6Q+YhyFBqTZ8BAu5Yfqp8G3t/WhLy3hYS9zMMlsPo/jSDqnU4QVuIZjXtoe49LTJ6aye/yfVq9knmKhBGrvkYYTPSQkVvZ+YvbQdzISFSE36QCuEhyRwVkgPwTM8nTqgu5qIrcMtXcZBia8ETRrcWmRhiOXVgBPD6J2wzEBpsHQEjzBegCRiVbDQfH16w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C+8Q9dljdn5mD7otM8RZ92is5vHpGCRtkrfnyA8zU1Y=;
 b=Nnvtdo1fJEWBC8CNXAm0MkmNMdfEiEuo8R/kmQpycRV5MBTj5M0/vAQrKO+5ozPhWjZ7OfiEVPBS2S2f+Ng8lfUTUe1RdMP5zr1VdOn9uqtxtiQe+xI6DIWRC0Sl2jKilPeGvmlQVnnkzF+K5AcsKPGqH+K7vzZh2JmNjjEktp34/2T7zHclIaHzuAQOS0OGvJB46aVMpaAWH4TX2mfvqFbohBZ1+5eovMhLW1FQHOYc9ZZc9mag23/PRCsTttKtpcaxLb5AUKfsHtFAxqiJEG3umSiDZYbTvT2Fv8DRtw9/yVurjVeqNkxmWpyPp1HV31hq79aV69smPwQXlQvZxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C+8Q9dljdn5mD7otM8RZ92is5vHpGCRtkrfnyA8zU1Y=;
 b=m9lCK3IV2mQEr2+qoJZihed5uaJGF93suYgmHrSSXyDXF0m8wg4M8RQPce3lwKu2IQAY8ifg7746Ppw7KnIQs0JUOSHQYe/JiZA6IGFGZaYD7r9R68fmtSziNbS76yKnGXOZK19CWQQfWNNY7mdU6TWRgb7/Y/reny9XEQhIczT2dUVb1pn3fepEl3WOy3/mjgbqKlLvAdPzmPgl2z7Z6gJKsmPdQHwDd8WsXA48z50IAYbuoT/8dLi6Ajq5L+NaQ6qCJtAMLZs/n0nJw40Uibrn7AlAeoEhoCVgb1CDmGWqiVnWlqp6Uo/GgDYxAYA+7FHqE5O/g8QAZ18ki620wA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB8455.eurprd04.prod.outlook.com (2603:10a6:20b:414::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 01:41:38 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 01:41:38 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 11 Nov 2025 09:41:13 +0800
Subject: [PATCH v3 02/11] remoteproc: imx_dsp_rproc: Use devm_rproc_add()
 helper
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251111-imx-dsp-2025-11-11-v3-2-d05dcba737fa@nxp.com>
References: <20251111-imx-dsp-2025-11-11-v3-0-d05dcba737fa@nxp.com>
In-Reply-To: <20251111-imx-dsp-2025-11-11-v3-0-d05dcba737fa@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2P153CA0017.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::10) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM9PR04MB8455:EE_
X-MS-Office365-Filtering-Correlation-Id: 56ed36ba-44f0-4a7d-c1b4-08de20c37498
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aUFrd0gwN25zS1lKQVJxMGc1OU1FRndiRFA0bUtCci90VVVkV09LcTI0L2JM?=
 =?utf-8?B?WlprVW1NcmJBMnNzRktRdXRaWmYxQzREREVPTzdIanhYYU9GcjlITmkxSFJT?=
 =?utf-8?B?U2R4VW5CS0gyRUoyR0czaHhkMm5yaXFlZjdxUDVMb3hsUlhRTVlraGpLaTl4?=
 =?utf-8?B?OWFXa2FOOUdRTzVvRUM2UEZsR3h3anlIcUZJT0FnR0djbEFJWTJxU2ord1hy?=
 =?utf-8?B?S3Z4ZldGeTVib1JwTFdiR3VFYWwyRjVESHh6aTUwS3J2UTJHZ1R6VzlkM2Fq?=
 =?utf-8?B?NUFwZ1d2bFMrKzlrcnpUOVVZUHBodTNGeG4ycmF3TldETU1YMStzOTRQbjBC?=
 =?utf-8?B?a3BoajNZMnpEUWp0dUxoZHlmc0d4VVA2RjFBVUpsejBtcWJWZVg4eFNUSVpY?=
 =?utf-8?B?bWxQRnVrY1lLMVh5amhBSjZkL2huaStUMm9BYnZuaktBK29aemIyekt1UllO?=
 =?utf-8?B?RnJQdjFPU2pGSFJKclNiZzBmZEpSMVNGQWVwRk84SU5PTFVnRFNYN1Rqa1p5?=
 =?utf-8?B?MFpsbURzaEEzWmMwZjVYc3B5dnBnZ2NMKzMraTZEemxuRFNoTUR2VzExWGJn?=
 =?utf-8?B?aWNNQndGcXZhL2F5Z0hJRW8wTzIvWGhIbzFseXRkZnRYY2pBSzhGdC9HTzVO?=
 =?utf-8?B?NEV2aXNWUUpUL1d3RVRleXNZMzd3dkR1TFMwOHEzeDB5RktHR0N4QXB2OXlY?=
 =?utf-8?B?QkFtRUl2SndtMFVGQXdVU0VjNjdXSWJPcjJIR2hWS1JhU0R4S0R2S2FzK2Zs?=
 =?utf-8?B?MHM2OUE0S29CdkFSR2lURVJ6YnVHbXFDdVdWcnJQRXplRGhXWVg0dHh4K2h3?=
 =?utf-8?B?YWM1ZXZUNFEzUlJVRm81cE9RVDlpM2x2c0Z4MVZoNWlkZmIvdHJsVDBjQVNO?=
 =?utf-8?B?MzVMdU9vVUZHRStUdGVrR1BXMFd3SzlNdVk0bjFhdjdjUkFYWGVIcUcxVFlY?=
 =?utf-8?B?L25CNnJsdGxuejM2Z2owNWlYeXZPdmZ1QmRHdm1zZGk0ZmFFK3JLdkE2SDUw?=
 =?utf-8?B?OVlwa21iUk9jMTNrRDdKOGtZQ2tOOFNKeEF0K1VIUXZtQWpYeDc5WlBzUWt0?=
 =?utf-8?B?eUtiSk0rZkh1VmZ2QVpYOFFQUWhJU3BSRmYyaFlvSjJUNjhYdFB4UUd4eTRE?=
 =?utf-8?B?VExFRUFHL0hYc01xRUloZVFKVXp4dnlFdmhlL1RyNjhGcjRzOFBic0Faeis3?=
 =?utf-8?B?SC9HbFE2UnJUTG56M0VTc2FySFhkZXlzQjREODZkeXJkbU50NnQyMXhVeURG?=
 =?utf-8?B?aXpiWVVYSFdiVjd5aXFpQUxQK2k2T0FGWnFZN1A1U2Q0bkFvNWcvZ3FJYlR5?=
 =?utf-8?B?alJZNmhyVHpZdWIyTE50NGt1dXBYNlRIdG0xSmpTMmlJZEdHOG0zY1l5aGFy?=
 =?utf-8?B?c1plNHZlOHk2S0dPeWR0TmdIVzBjSVBraTRUTGJ6Ukh1NDdLZVEzcUw1K1dm?=
 =?utf-8?B?K3Zjc2xocUg5bldWT2dYWG5TeHhyR3JQc21PK1BtTGdiTkdYSE1UbXZnNWNC?=
 =?utf-8?B?b25IRVJaOE5RWnlrcjhxOXorRkY0M3Y5Q25mRWlFejF2NzBKK2kzVlNWbzVs?=
 =?utf-8?B?ZDFlZXBkNldLdFdVV2krUXpJa0szdlN5T2U2RVkwMEd1bzJSSXFDS3lhNVRi?=
 =?utf-8?B?S0YyeGNGOEVjRC9mU3p0cmVTbXprSHArdFBPVFJMTE42R1VSU0swdzVseWZi?=
 =?utf-8?B?amNXSE5OTmRTMWh0ellkaXVBZnZaS1N0QWxydytCbzIyZG00N2ZVaGNrb1da?=
 =?utf-8?B?QWVuMTl4eWlWNWg3eGxIc3VsdThYdVFSRlBDWE9GWW1wYUtCcmdwSDdKSzR4?=
 =?utf-8?B?R3Z4b25wb2ZYZXBLVkhRTHgvMngrQnpsQTkwdHN2Si80MXczVUE1UENjcCtL?=
 =?utf-8?B?RUpFTkRqN3dsTENWWUpWV0Z5cmp0dk4vWlRNNkZsWk9vbi9kTWtXcXBJeGZq?=
 =?utf-8?B?ZXBqelFVS1BPekVyVEcvTmg5RktmYVhvMmpKajhwcXRlcjdQTW5rSlFsYVlj?=
 =?utf-8?B?VktMM0p5VmJ2RzB5VEFaYmIxazZHajN1WkE4bVpvd3c3dGZIOVFXODMra2k0?=
 =?utf-8?Q?3OoP2W?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUlTRUlub2V1WVpva2xBSXhVSVozT3RaaWEyOXdFZW9CQWxrRU1YVlRJTnFV?=
 =?utf-8?B?NkczNWZKbUJZbmtvNUpNM1d2dG9rVytnY2Q3UWZrQTNKNUNTNGRpSVc5RThk?=
 =?utf-8?B?a1JQNDZ1RHpCM0FVQmFvSlNRN0NwL1hmN3BJYXhidkcyRTU2cnRqS0U1ZWJ0?=
 =?utf-8?B?czh6K2p2Y1B2cW9OdkdscEgrOVhwWGZYMjM4RjQ2WlljUVVmWklhcGtNT2Fq?=
 =?utf-8?B?b3lzc1lNWE56LzI4QnJXTGpSQ2ZudWRaS0xwVWtMZzdlRmV3cWllK242d1ZZ?=
 =?utf-8?B?dFpOb2FSR3lRRUlwenNQOGVrZVdjUUxrakpNNXpQZGZJSitiajQ0eUovRVUy?=
 =?utf-8?B?eUxPWmZEd0JYVGVSWjVUa2M2MFA5a05pbC9WQ0F2MGcvS3YxV3hndnFvSmhk?=
 =?utf-8?B?bjc1M2hnYUEzL3VzMC95bHpqdjc1Y3NBZ1owY1VZOHFTNmtqSUNwbk1PTkhJ?=
 =?utf-8?B?TmxtSHFxQW91YjJOM0M3UHFvaU0vQ1padldpbklGWDVhdVRGSkNoeXVDVjgv?=
 =?utf-8?B?Q1JVQzNPaUFqWDgwV2FvS2lOUDlDNzFIZGo4U09Ja1R4NEF4WThrSXhrQ200?=
 =?utf-8?B?K3VsN09GMmtvM3JpZ1BuSzFKZDIvTHE4WEE1TzUxSXFRaWE2TWJiaGFVN3Ro?=
 =?utf-8?B?czJtSEtpaTVaTVdUb2NHN2EzbU5LbmNrcUozMVBhUlJIbmEvR09wU0Z1aktz?=
 =?utf-8?B?T0pXdzJ2SUdYbE1lQnY4UFBHZVRtUE9NQ01KcVdQYnd5aXJ2S1FZcEx1OG5G?=
 =?utf-8?B?OVJ4NkhRNGhuUnR3UEtXVkFwcVhnL0ZzdlhmRzRPRWQxeFoyVTErZTJGUmMv?=
 =?utf-8?B?dUg5Wk5FTFFveHBtSEVOdksvbDZYYW1GM0JVcUNTak9mQjd6UDBYUzJhMlds?=
 =?utf-8?B?TGpOQXhQMThRbmJ4NTZja1hhN2pvK2svUnVsTnorRVhRQU45aU8vMy9URDQw?=
 =?utf-8?B?ZWlkUmpFbm9DMUpvMFFwUGxNQWVhOGpWdUZwT01XMVQ2RmhqMXppelVlcEJn?=
 =?utf-8?B?cjJUNkh0bTRBZEtMV2R3Tk5SVGRiWHorRkljTDdqaUdGNS9VcGxlVElnTWVF?=
 =?utf-8?B?bUZrKzBLSWljVTBlWUVWZ1J2RWhEa211cU5oRXNvcGJrOHdyMy9oR3p1aFRi?=
 =?utf-8?B?eWZzR0VBdGlyU3JzM2FycWgrSXFHcFY0K0dibzRpbnMyWGhiVGEwWUhGeE15?=
 =?utf-8?B?eGtPdU5CSUtRZWJxK0VmOE5ISG54OW0xbTN2MHM2RVEwZ1Z5b2pWZWQwSnJr?=
 =?utf-8?B?WC9pZTJlamZwc25rRTcyYXFkMkFNNVBZbXJRQ0xRUDQ4UDZ3TmRxbHVmMXhv?=
 =?utf-8?B?Szk0UFRnNXlpTGxqNVowVy9ZSDBWYlA5ZTdKVDhHRkRzcFZhMmVoM1huMkxw?=
 =?utf-8?B?Ri9yT2Z6WFcwdEZaMi9HbVJmY080TENpT3lTWTF4VW1mT3ZERkFNS2pLNFAz?=
 =?utf-8?B?OHdISzBLamYxWmlIL3BTL3NXa09ZdzkrYi9YdldwcFNqemRuWFQyNzFtWUJM?=
 =?utf-8?B?dk5SekVBSXBxYXRtZC9CblFnSklFNzNLTmpGdVphZ1R0SGFxSk9za3FMbXJK?=
 =?utf-8?B?YnFrMStQbVFtZ3U0dWlSem5YbGwvbnVHUzNmVUptV1lCK3ovQUVYVHZ3T2p4?=
 =?utf-8?B?Nyt3eVJJNlQrY3Y1MmdYRm0rQ1BhVkRGN2lyRG5zaWdOSUMwb285TWR2YWt5?=
 =?utf-8?B?cVV1Sm1vQkwwcHJJTzRnZDVTYXZpb3d3SUdOODB0UXJLT2ZCQTZEM1JwSjEz?=
 =?utf-8?B?L3NGKy9VWkswYkFtWUdDK09KNnlBd0FuZzliRU1JQTVYUTFjOXYvays2cDBk?=
 =?utf-8?B?TnZPZUNTQXlUQnlqUWpUeEhaQllzY1ltb3VQK2lIMXRqcW5uSHRqcmZyWHVC?=
 =?utf-8?B?TTEyaTlDOWs3OHQzQjhocU1CUDdQVDhLREs1WmNabW5vakZEZloxTFp5OXRz?=
 =?utf-8?B?ejhWTmpEdklyMTVjNzBJT1hlUDU2TlJDQ2h4U3lSU3JnUGIwNVZOd2swaDdC?=
 =?utf-8?B?VzNldys5K05UL0JEd1NoMzkzNCtjMTNlQjhFQXJzMXdWSDJQTDZuOGF3b1VF?=
 =?utf-8?B?RUNSaWNuVnVOeStmU1ZjRE1sMms0V29xcVpDTFZsQVYzSlQrTkFpRTVlcXkr?=
 =?utf-8?Q?vP3M+xqQTyGNQk4TmbzBClq8Z?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56ed36ba-44f0-4a7d-c1b4-08de20c37498
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 01:41:38.1323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e4SBxy9kfhZ89og/1q1hxl9Br8XYB8DD7urM38kCPSuBXeAb/LxnGOvGvRQQ8wCLlcBHyJUGBRR4gCZ6rUsZ6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8455

From: Peng Fan <peng.fan@nxp.com>

Replace manual rproc_add() and cleanup logic with devm_rproc_add(), which
ties the remoteproc lifecycle to the device's lifecycle. This simplifies
error handling and ensures proper cleanup.

No functional changes.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_dsp_rproc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index c466363debbebe8f91b908b3bffaa32e9bf8b9a6..df6a4126538d22ff6e02145edb5ac13c2d72c949 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -1194,7 +1194,7 @@ static int imx_dsp_rproc_probe(struct platform_device *pdev)
 
 	init_completion(&priv->pm_comp);
 	rproc->auto_boot = false;
-	ret = rproc_add(rproc);
+	ret = devm_rproc_add(dev, rproc);
 	if (ret)
 		return dev_err_probe(dev, ret, "rproc_add failed\n");
 
@@ -1211,7 +1211,6 @@ static void imx_dsp_rproc_remove(struct platform_device *pdev)
 	struct imx_dsp_rproc *priv = rproc->priv;
 
 	pm_runtime_disable(&pdev->dev);
-	rproc_del(rproc);
 }
 
 /* pm runtime functions */

-- 
2.37.1

