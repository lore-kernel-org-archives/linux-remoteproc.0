Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013019.outbound.protection.outlook.com [52.101.67.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A665081726;
	Fri, 19 Jul 2024 08:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721377655; cv=fail; b=p8cZMABy3pvSB1Qo6trOKWBsbPRFHyYCHTT3aFejKLw9PQFB7UKjQ8Vts3gcB0MdK7RX0/RbeU9A51FOr96uIMCYyciNbHNbGip/uJPRemSHNoNFpjs3wMWd4sq3c17YXLiBHkkWwEbs8O4H9KNr1LmCiW42m6hJSX128XZHDIQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721377655; c=relaxed/simple;
	bh=q0Gek6k+OjnV6338kq2OtybrLk8NEEN+c3BxvHLABcA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=UcXWk3PX95+KaYKl93t2NLPURtkZv+spIimBQJa+EVgk1EuvizuLM13rSn5ypW/5ex0p9RWtTftIgB5L/zt36wBjevMGwM0/bm52Ab5YzoBNh45l4/RqndKFKCiaBXdVWHnOT+61aT89U2eA7T++CPm87ks2mxanUOzXmXVuj3A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=N1VvrUJZ; arc=fail smtp.client-ip=52.101.67.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="N1VvrUJZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pc3zMcISoH3TIUhUel4tLaLAEB618jGt9Qd0TmcJXt1xS/J0r9UJpmJ8Pp8nF1EHtc0yMxA+0aq3ni4h+KCwhXmlG97WOJ7QchfzqJiLtesvo76kBV896rq5Y8EWDzfJypYm90rp6v/qgGfn+r/hNiXJ87ZTVzvxk3KDgKWe/JRuBut77gtWC9QeNHc+DIvqzVYNSX/kkZFyUjxZAd2jFahhhNt5bSIdh6xG+4rn8qbwOQLStHmUFHwxnVtJ5/avGLM1DOg1kN6SNexDQikK13W/pEL4remcQ5AxUjZCRpi8v5+X88q2gAo8+f077rcJSn4kQOgf/26WKpSFY7ZstQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CueRkbqhz48rnYutf4T4ktNQ8uvs51G3cYlzWCavKy4=;
 b=wLi+Agj+AEWGKd15hmc6iBnurFINAQWVsqG6lMocOzvFY5yn4RZIUwsfAwnAyJk4OpBn6XI6cV5oyCyiIIkLO+A4sg5KzkaCB94tddJroUC63YExS7JEP+b8tSTMtfiahQf/lhEynu7gMcUpIP1/g/lZHb+eA0D93xHPZGC7wfm3zFZ8HICu5+748teTluzo5M0xAvDZtMEplALuv6lA4ElbUja+xo9jDDpX3dBTUJc7+Pq5S/HZb51487GtqjPwHS+jL21pHepBsVnwxCUd2/eKsFi1EGV4AEDmSLNcZa+F95AoVfyGTYxqp2C146DbxdVVW8QhYvEw/nx1cKmmHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CueRkbqhz48rnYutf4T4ktNQ8uvs51G3cYlzWCavKy4=;
 b=N1VvrUJZsbz2mcITqawEOU9ssbMJ4k59Kr06m6bguZNk23weMTVXXXd4vVuMFqWZhjs4QHQO/OQctjuwCRpPoVWp/iw0Jv4iEIAJMXASJ3Ce1mj2CTAnwRCdDbXZjTnRiFyK+2OZHExzX+STHst7SiKbshob4kj7YMKtXhqaYW8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA4PR04MB7904.eurprd04.prod.outlook.com (2603:10a6:102:c3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Fri, 19 Jul
 2024 08:27:30 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.7762.020; Fri, 19 Jul 2024
 08:27:30 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 19 Jul 2024 16:36:13 +0800
Subject: [PATCH v2 3/4] remoteproc: imx_rproc: initialize workqueue earlier
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240719-imx_rproc-v2-3-10d0268c7eb1@nxp.com>
References: <20240719-imx_rproc-v2-0-10d0268c7eb1@nxp.com>
In-Reply-To: <20240719-imx_rproc-v2-0-10d0268c7eb1@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Iuliana Prodan <iuliana.prodan@nxp.com>, Marek Vasut <marex@denx.de>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721378185; l=1109;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=ZF4X2mUEk5W+41kIPzV6kV8qVtCKJb1wG6vsUcranFg=;
 b=4oAil4sBNmb1moRx98l0b6xH8MYeYSCp2w2N22BuGbvTcWaP6DA6eQJsaGXvefgknaX80A4wx
 E+HOMRnkxpMDvMGLqPB8ILsZgbvwkY7EK3S2Jkrb36waN4fcAfa/0uH
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR06CA0232.apcprd06.prod.outlook.com
 (2603:1096:4:ac::16) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA4PR04MB7904:EE_
X-MS-Office365-Filtering-Correlation-Id: 2080e538-6677-4de1-c57d-08dca7cca16b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aCtzcysrNVdKSVJEdityZUs5NmpPTXV1V3NsQ2N1anU0WlFhMG1leEhMOCt4?=
 =?utf-8?B?bm9zeGZSNlVwYThBT0w3bDEwZmQxajhyN1ZPdWRCbE5PYk9oRG9ncXl3UEV0?=
 =?utf-8?B?K25wUkg1Rm01czRpZ0MvbElWdnJ4VDhQR3I0ZU92YW8vQ1h2RUZlQU52a2l0?=
 =?utf-8?B?Ym5kZXFUbVF0TUVFbm1jQ1haR2VINjEvMnpFOGNaQnRIbGljRmFzcnlCKzQ1?=
 =?utf-8?B?Z1lXc2U2YlBpRDllbWx5RDhsa21mWTFFTEVkZE1rQWFVOGRtelF4NkM4NHlw?=
 =?utf-8?B?enhuaDhVa3RqTVpHdXZYbHRvS2J4OC9ydVROeG11NWlaeERucWRrRDQraXhy?=
 =?utf-8?B?S3JWcXY0ZG85STQ4K3Ava1QwK21UZUxHSW13NVNlNFNUWWFwM3hsRnJHU0Rw?=
 =?utf-8?B?SFdNOUorYlo5K1BJSzdVT2E1djRlMzRtd1pVdkp4SE5wQXdYYU56NkZ6ZnYz?=
 =?utf-8?B?L3hNdnVacXhnNDNnL2dIMjQxamZuWjYzeG0xdUpEVzRxeEpXaEYzSHdPWW1W?=
 =?utf-8?B?Z1VHSk1reU5yWFZBbnhIcE05MXpOL1gxWHhXS0lkdlJ3bENEenVhUXAxUndG?=
 =?utf-8?B?K3lmRUdwaVlpbGNyNGdaKzlxSEg1eW9mSjE0NFdiWUJYVkxsOGhHNnBINWFE?=
 =?utf-8?B?bGY1d3VOdDQ4a0JTS2NHODdSNFY2RHQzUy8wOUVnMW5ZZDErK1dPWVF6U3N4?=
 =?utf-8?B?Vy82UEFBOHdndmdZUUlYMDRHV3BDSzBJNkpGc2ZLellzQ1IxV0dpUVh1bmtl?=
 =?utf-8?B?OEhna2E5UW5yTEZiaVhIZk9hV0ZMYnR4cnFBRUwxZUVObE14SUswUUlYUkx4?=
 =?utf-8?B?MElTa2ZwMFJoOGpDQ2svMmYwckQyYUVHRXR5b1M4Y2RHRy9leElSMUQ3eXJo?=
 =?utf-8?B?dlI0K0JhRTJSeTNMWFVnWGx0ODlTc294cUJ3bU1IcEJYRHBpdjJ0Mjlmc2xJ?=
 =?utf-8?B?QWluRGV2ZGoxS2MwakNKbTVCV01Hb3NENTdYYnQ2NGoyc0gvUE9UN2lQS1p6?=
 =?utf-8?B?dEhDc2RpNjBZaks1ZExvamJFVXJFYXJ6WUpnWjE0K2N5bi9GaWpVL0d3S094?=
 =?utf-8?B?QkU5K1R1TkRBbitUdUZ2L3JqZHhsS0F3d1hZbkpua0R2OXdpMkxzaDVndEt0?=
 =?utf-8?B?MUtpOERSN0NyKzN5VXZDalRhR29pQXdRd2tWNWxaSjloYmg1OGN2L004NUlV?=
 =?utf-8?B?K3hXcm9Zc0tkRDVScW1FWnJwTXoyVXdqVSs4YUlQQXVPZ0wzZ0pvOVMvK3lH?=
 =?utf-8?B?blNCS0hSUitIYlJHRitTa0w2Sm1pTHNMRDhoK3JJV04zdXZOWEVhQUxIV1RH?=
 =?utf-8?B?QVVJNllZN3MxVWRyRGVMZnhqQkYxNUNZM1BKY0xqMm9XRnVVVGNXR1FkM0Ru?=
 =?utf-8?B?bmhqbG9GZDc0dTFIWTRKQWdwZFJ0MnVQaUpxdmxIalNOaGVJc0xOTS9kQWdu?=
 =?utf-8?B?RGxoWEU5ZE1yekZIbXlJVmovTnV3TU5LOWN5RWhGQmp4MmdIT2Erby9YUXo1?=
 =?utf-8?B?ZEwvQVBwZlFCUllrOURGaVZCZ3dOdDBXdzdKMGJxRzVidnpZc1dLRFFySXZZ?=
 =?utf-8?B?SnQ1Y3FPaTVEZFZSQ3dJRjd6YkJ3TlZpcVg5NWt2MnUvUDQ2OElaOTNWN2Zl?=
 =?utf-8?B?Wi9YQm5Gd1pMNWZuazFrNWVkTG9XWG9kbWZXTTV3cGhFcm4yTUV2dS9xbEVm?=
 =?utf-8?B?VEFyaG0vSmFHOCtDTHpHVlhXS3N6dWJ3dm9UUkpMY1hUYm1nRDl6MGQwS2lv?=
 =?utf-8?B?dmN6OGNqT0J4QmZWMU1ocVBXNm8vYkxsd2dqYkYwQjAvZ3VZcklwWHFsQVFL?=
 =?utf-8?B?bVErbmo1UkN2ZVNKUXUvU25abGo0UGlGUW5hZ0ZGQ0dnUXlOdVUwOFBldUlj?=
 =?utf-8?B?dmRHdUZ5dUZheXVwdENnRXhaNTVSY2RoQkhMa1h2aWY1aFE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVlQNFZsUFZmencvd200Z1VoeDB4OUovMmpNRFJsaldxY01OY1k3RzhSQmhl?=
 =?utf-8?B?R2JDNEpEcTdTeW15NzAyZzFvbDRoVDlHeiswYTRzLzg1UjFDa2kxQUNHQ2Ns?=
 =?utf-8?B?U01KVWlsZlJKNVRyanJjVkNMN0ZPaXRrV3NaMFFobnRVNzlZbEEwdUxIMllF?=
 =?utf-8?B?TmlhdkVNWWF2eWhoSVkwQjl6VDJGbGt6bThEc3NmWWJ2Q2hZMGwyaHF5eDJp?=
 =?utf-8?B?SzFJbDFSd3Era05mUEtNMGkyckxOVkIrNGxVTVhHaXYzK1h0RWxpWWowTmYv?=
 =?utf-8?B?RlRBTkF6SXZyU0RnK3ArMlVMSVN4eUJFc1EzdUdHckFoQmZCVzFDYXAxOEV3?=
 =?utf-8?B?T2Z1ZDNFWjJoc2Jta3VIWElXQU1DU3Q3VnV2NTBXTXJJNVVwRXkvK2piTUlK?=
 =?utf-8?B?K3lpM0ltaTVMUVptQXhFNW1ydWh0YjZNcGxJdCtEbk8yQzkxRll3NWI1ZldG?=
 =?utf-8?B?QXNZeTUrMDdrS3dXZ3lMNGpZdTUvdjY5dnNNMm1UYm4wWTYxaTBlOW8zcFM1?=
 =?utf-8?B?NElIZzFJcUFnVW5DQXBuMkpQaFUyQWpVa0lOL0RIS2s3empvamVSWEZwdk54?=
 =?utf-8?B?VWgrSU1MWHlZSTdZOEtJcGJidk5FZ09SNUdFK3VkQ1F0UnN1UVhrZlhXSHlQ?=
 =?utf-8?B?UVo1UmNWMkNTSmlpUGxsVFU0QzIyVzFrelZRZCtRbjYzUEVOOWgwVk9hKzdX?=
 =?utf-8?B?YjI1OWhBNGc4QXF0am1keW5WOEdnUGZHeWd6M0srM3FndXUrUjIrSW9vL1Y2?=
 =?utf-8?B?bnJEa3ZkczNubi8ybWJrNGY1RzlKM0xCTjVYMUVlMC9DazRjM3cwdFFsN2lo?=
 =?utf-8?B?eUkrMHczYjRtL0FIakhma0FDVVlqSnpQc1JCaGRmQlBVT3ZvSlU1OTkwbE9M?=
 =?utf-8?B?QTVhTWtIYXlDb3V5bGFXRjRqMkZGRFNWcDRrcWN2c3d6eTUxd0NXVldRVXBy?=
 =?utf-8?B?QkttMDBQeW9FbjhlblM0OWR0bEw1ZFpFVlFKWDU2azFSUEY0R3RtaElrVnFR?=
 =?utf-8?B?cVZUUWkraTdUTnJnU1ZFbW1DOE80dmNkeEJvdk84QjJ6Sk5yUGFhSHI1L2NM?=
 =?utf-8?B?NEVEMDRQcGFJN0JJZmU2eW83T1ZsVC9iRUlJVVprTUVwZXl1Qi9Ca1BPZUxW?=
 =?utf-8?B?Ui9uTjNER1NUTnJsZlhYYWFsZ2ZBQi85OThFQUR6YjNxVHA5cHBLcnFVakh3?=
 =?utf-8?B?ME9ieUN4dXNnVkx6WUhaN1RWaGx4bWMrSDBqRC9qYURVaHUwNmFxU2l5QmE1?=
 =?utf-8?B?NzJMWFhjTXFnTHJVZWNHT0NlYTVKVUo1dWQ3U2Z6azN3b1hQMWoyT0tWdFBo?=
 =?utf-8?B?QjFXZU1FNm1CZzcwOXJiWTlCTHlkUzNNenBPbjErU2RUN0tQR0pwVnFYaDEy?=
 =?utf-8?B?SXpodmZTWUZOdXJnQzViODIzSVhCeEF0U1BmT0NHbVpOTmVBTnJpM1hRM0FB?=
 =?utf-8?B?VDFGbUoyRmdrNFlIVW1tek9DaVVlU0RtdmlTNzNWK1A0dFhwWXNmQTI2Q1Zp?=
 =?utf-8?B?MUc2T0JPUEtqOTZqSUVoMVVwb0RiWVB3RUZ4VCtHVEFCcjVqYlBadXpvWkpk?=
 =?utf-8?B?OWp3eGJYQW5yak1vcWdwS3FiVTd2SnlMamJXdUlGYVIvbjlqdkN1L3ZieTFh?=
 =?utf-8?B?UUNicUo1dmRtZXBxazhPWkdXMDhCc3BWUnRlR2NHSnJKKzdtRG5VL0ltTkpL?=
 =?utf-8?B?c1k1a2ZaWXdSWmMxcDhFS01ncEJIZm90V1JOUHB0TkIwblJabC95a1p2bjhx?=
 =?utf-8?B?MTlhMFJ5SnA1UmU4NkYyR2U1TmMvMGNrQk5vQ1dEMUxqUDlCbnlBVVBVQjBS?=
 =?utf-8?B?MkZuVk9aTVlJRkNCSkkrNUs5Uk8rcFQ4MTU3M3Bod2tsd1VqRkVyU3d2UHFh?=
 =?utf-8?B?M1VMT0xLOHJiS3pDOE5GUDR5SHpVcWc1blhqODJGSTJlbHpIeCtoWlhoNmNK?=
 =?utf-8?B?VUEydHpaSHlTcUppdXlZUjdaWCt3dVJVNUhoUEVHL2FtV25RbVdiSkRrYk1H?=
 =?utf-8?B?WlBveGFTdTVBUCtsTWZ1RUsvL3AwdjBEUFNFeVRsdENzNXVGaGljeVQ5aTY2?=
 =?utf-8?B?MC9YbHhxZ0FFL05KdDR2bDgrRDFhWXlWS3pzNzlaLzU2M3FzVEdhSVYwK3Ba?=
 =?utf-8?Q?L9lTswXT0+0jwSnqIWiDmkXO4?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2080e538-6677-4de1-c57d-08dca7cca16b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 08:27:30.3996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BBEz7bNy8sbKL2aBbiklVt5FJ2/N7qelYU+CESif0gEcHZfM0vsD+KO+7pH3rVasYj0Jj4hsatzWScI6fLBzxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7904

From: Peng Fan <peng.fan@nxp.com>

Initialize workqueue before requesting mailbox channel, otherwise if
mailbox interrupt comes before workqueue ready, the imx_rproc_rx_callback
will trigger issue.

Fixes: 2df7062002d0 ("remoteproc: imx_proc: enable virtio/mailbox")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 48c48b53a3aa..9e99bb27c033 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -1087,6 +1087,8 @@ static int imx_rproc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
+	INIT_WORK(&priv->rproc_work, imx_rproc_vq_work);
+
 	ret = imx_rproc_xtr_mbox_init(rproc);
 	if (ret)
 		goto err_put_wkq;
@@ -1105,8 +1107,6 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_put_scu;
 
-	INIT_WORK(&priv->rproc_work, imx_rproc_vq_work);
-
 	if (rproc->state != RPROC_DETACHED)
 		rproc->auto_boot = of_property_read_bool(np, "fsl,auto-boot");
 

-- 
2.37.1

