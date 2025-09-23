Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011039.outbound.protection.outlook.com [52.101.70.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9342E30EF9E;
	Tue, 23 Sep 2025 05:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758604647; cv=fail; b=Uo9MqVYdrsYZfKXeizud7jZ2wNe9KrR4gJpglrCR0xlmiYaz9Xq1Gc4ibKoGuxuOBwIpWl5e5Jtv4HdRbSOBV3t+e84n1wRNXFWLZdVfsRSlgwr0Q+9Rcd1b7MGvLbZSWdOlOrLTPzTn2mkU/qOv2g8FFECDo5Z8H1HOSzXrF7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758604647; c=relaxed/simple;
	bh=1d9mbsHmcu9gRNqcfXLbJ+CSpL30IViUqbopCkfXdIM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=RXBBs61GERzKZzCHNPo250dQVnrr/34ycMKzJLgo21b6J62LDPLduDrA4NjrNBG0c4A8eG4/6vmFMHhUCuvbyfGzitMiqqa0Pegqth7FqrD3nBql3l4M0Ur/K8Lvy9Y+oBbX21yD6zywxut0TUUonmJNgeGiiwbouN7EFM4zkCY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=LDJL1tqB; arc=fail smtp.client-ip=52.101.70.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="LDJL1tqB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qru+RZdVLfOSTNiwQZO7jkAhMefXtcMu1xXMdDdPoZnvhIgpgkbIcXGcWLstrGtvRP9G4m6SlTb91+EQqAhgsxS4jSX1wW3FkXa3PZ7MepZ20V73Nqem22scl8XGDAQJIaP9ZWxOEexLEmQ0Hd2n9re78zlm/WnkSMIOlS97/rlKgD+150jH2qZGTvPSGU2A+EKFSljNYIJTwtt/DhA8gU8anE/0ZnVByvLFvLj/MoSSGhXxidwJAXckECSzmWjYUmY22FnXZJul6aTff4+3s5t/R90LDXCYuBR6iFgWMjd1EmSSoYbCQ4xQEg1I9pn35KVYZeA7EB24c3kH8ctckg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7eDUYsa3CWw6A47wTpbAneTH3Z2L6+y5nLHO17VG40E=;
 b=lWSrmVBipVPKpNEeaCZLN440ywOYZVwyo6V9Pb/1INV7HtOKqZsck3tgQDNM3HLFcrHQ4/lDK+R6G6mFD1/EoFw8F/hgKw2qvGZd4vc4nyAngl9K+AI+wQ5l0PeLhe55A55VSTBJVDTtVSDYencSuYXsONKHYTW5ADeHgNPblYwyZsGQ7vLlqhSO6qDMQIPBY/tuSDwGZxxwRvOQ1tPyNZObnNDK8KbeEZESjhrywWEiE5U0gFzZgd0ibmM2bpxlwxj+kPS1M0LOlsoYhFPPd4GPn3UkErypieqpkgNWgkzjUAr47ROkjp3oAKNrEZt0H4sIt2FYDJktPtTp8L46FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7eDUYsa3CWw6A47wTpbAneTH3Z2L6+y5nLHO17VG40E=;
 b=LDJL1tqB39YorvdaDP4I3s0lcPXxWEfxTmhzd5DKDQVyBQdP7pYsToW0o89qM5rFkbkhj0S/gPLfFnsa9zytoa6HgaNL/AhULe/tAPxRaMDooO0vdwaORT1DLHWzSIl5DxAZGk0B9wXcKc49ODIIAcnU9AOKT3AXXO8MpUXgbz6XiWA6PRI5C0lrEOjzfW+mQMxPPZxWjl1nVst/VB9c4cnfltBOgdBU2GFQ7eeZIZq7D6PvVwu5Gw8PsGXmkb0yBQFAxK5n6mj+zLDeOX9OJmS2Pmnt9lpSKSdfy3O6OALdaTIuBdWImjI5toFi9vz/uh1JwfnFzAFGhLSGOEE4zQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS4PR04MB9340.eurprd04.prod.outlook.com (2603:10a6:20b:4e8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Tue, 23 Sep
 2025 05:17:21 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9160.008; Tue, 23 Sep 2025
 05:17:21 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Tue, 23 Sep 2025 13:16:37 +0800
Subject: [PATCH v2 5/6] remoteproc: imx_rproc: Use
 devm_add_action_or_reset() for scu cleanup
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-imx_rproc_c2-v2-5-d31c437507e5@nxp.com>
References: <20250923-imx_rproc_c2-v2-0-d31c437507e5@nxp.com>
In-Reply-To: <20250923-imx_rproc_c2-v2-0-d31c437507e5@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Hiago De Franco <hiago.franco@toradex.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758604605; l=4521;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=1d9mbsHmcu9gRNqcfXLbJ+CSpL30IViUqbopCkfXdIM=;
 b=vgjGt1bpmO/iBPqJjpCg+8dNF8CA/AovsoDl9tU+P2X9k0I+qeKTi/IgQ7Xgy7z/k5Y8GRCCA
 jlhqhxHLsX1DlKGykNlMAQ3KEPU5jqak1XhxI8wl2xjneyEqTf8Tigk
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: MA0PR01CA0070.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::15) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS4PR04MB9340:EE_
X-MS-Office365-Filtering-Correlation-Id: dc457360-1414-42d4-9713-08ddfa60794d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bEtpbDQ4NlNsK2dLZ0JDYzF1aWJmZXJwUjBwem96eStLNEdkTkV1ZFlNQUFs?=
 =?utf-8?B?WUVZWWo4WE9YbUozRTRGYzc0ZXpTdWZFblZ2UEMycDVMa0hYZTA1c3ZubzIx?=
 =?utf-8?B?NUxGUUxwandCVnMrK3d2bmVDeDIvSTdic1N1eHdzQWFGSnJZUFgrWm1KeS9n?=
 =?utf-8?B?dU9CQ1Iwcm50Z3IyWnh4WWFROW82bnBYS3pqQUxac245NU5rUmJVV1lhMHFx?=
 =?utf-8?B?L0JiQnY0aS9IdVpqMkRxaGUvWnpxbmE0NmRjMzlYM3o2dFhmS2hxdi9DaVZq?=
 =?utf-8?B?cTJWLzQzTkhUc2FBQ0tBUzBTSit5OG9WRWJIOU9FRC8vemd5QXdjbllkdy81?=
 =?utf-8?B?OUprbVdpWEMrZjZDd1IyTDhBQVM1Z3UzbS8vdml5T0RncFFodzB2Y3lPYjNw?=
 =?utf-8?B?cXpuTU5SeUpITHhrVzZQODZUUDZmMGQ2MGdCTHdGN1BiZzZWKzBCZWNKcXZK?=
 =?utf-8?B?SFpSaVFSRis2S0xFekpsT3dsVlp0M2NwdzBQM0oyUnl4SkRrU0xaUXlDZVpL?=
 =?utf-8?B?OFdwb2ZOQTNlUzE5N0p3R25VWktRVGw1Rm1OdEFONkRRWmw3RGdNRkpRM3RU?=
 =?utf-8?B?MWVVQ3ZtNGVEMUlqVFprUVBHSDc5RVFFR1E1bDlNNnY4MjdUbG1URm1sSHRN?=
 =?utf-8?B?YUxRdElpSkNMaXlWR1NHWERQamR6TkFsR20wcnh1SkhyeDBBRFRxVUN1TFVz?=
 =?utf-8?B?Q1N2eGxPZnh3VXVjN3lDL2N2V0J4ZEdqWE5yYnRxSXI5R21HY1dzWmZUUlJo?=
 =?utf-8?B?UzhvZjZnTTEzZUtYK3VqaWlidlA1ZDVJRHlUQno5b0s0RGQybHM4YmlBbUt6?=
 =?utf-8?B?cUpCVEp1N0NsZVVMYmx4RUdjZjVxNnhRQVhDektkSzhRckk4SkpxQktEeTJv?=
 =?utf-8?B?Mnc4UzZFVk5zeG1XaFE1VW8rdVBSSG4rSWRveUhta1IrNHlqc0ZHL0FrL2VD?=
 =?utf-8?B?dGo1em40enJqeFkvT3ZHVGkxTllMNUEzZmxBOXJRcGxyR2tNNVpSZ0x0eko0?=
 =?utf-8?B?Wk1qMnVrYmlVdkQxS3pBNmZIZUk0NW5CTFZYamM3WWJxNGNKckxXQjZOd1E4?=
 =?utf-8?B?ZHg4cS94djdvV3REcTdjZktuWjQxU1o4Nk82SWZhOFQ5S0JGdEVSR2FTbTVj?=
 =?utf-8?B?cndHdW1MNmFGL21YeG5rb29VQUgvaTlxNTd0Y2ZCWEJNTkQ2MW1hMXZ2aUhY?=
 =?utf-8?B?YnUvb1dVaUVXcTVScUpTd0c3NllxKzVuR09WWEk2cGY0UlZlTndUYWdBMUtR?=
 =?utf-8?B?cmVjR3RTTVhhR0hRRDc1TW5kMjZscmk2dHdqa24yUUpXQWc3RGhtZ1gxUjdx?=
 =?utf-8?B?dWFJQ0tnQTJkcEhqWEk1SEFwcHRmOUs4WUpKUHAyR3creUZpd081NXFtUkRE?=
 =?utf-8?B?ak1DOU1XTnRyaVhrSmV3SWo3OVlRMHdYVnhNWk1saCtVdEpMVGJ3TnlpVnh0?=
 =?utf-8?B?ZkIyY2dKTHlFOUNZbVNvejFqQk5qQmdUdzBlT3dJRWJkcmtwall3TjVEWUhz?=
 =?utf-8?B?VjZnc0grOWJidE5QMTk5STQrSUUyMHVTbEdtUC9TWWNTbEIwM1hMRGxHdEk4?=
 =?utf-8?B?dFlHN1BYTlRXYWdUU2lHOU5GWExvR0ZYY2gzZWhQZ2RlTFd0Y1JkQTh0eXZE?=
 =?utf-8?B?Z0FhYTlPN0NraEdPK2FHQXFIditsbzQ2bEdXeEtlQ1NwZGV3dTllTUdNNVdV?=
 =?utf-8?B?cVRMSTg4UDN4cTVXenRZRG9ZVzdIcmNIc0hpZSsxdHk5eGNQREo3eDkzRENF?=
 =?utf-8?B?UStCSUwxZGk4VnRpN3VLTU1ISFBLdlVHdXRjVjFVbUdHNjJPR1VMaUUzVzVB?=
 =?utf-8?B?NWZtNWdFUTZCSkRPODdOZWc2a3dlcW9iWTdBTUxCZi9ISFRTK3RhYWZiUG81?=
 =?utf-8?B?ekNCMzVKUXowdHdDQlZ0Y2ZlZWpacDI4R0Rka2p0akRDcmRaaEdvWEs2UFpk?=
 =?utf-8?B?L1p3T2ZVUU8rYVNkbVg1RXdEZWZLZ0hzekI1RkJZVXpvMkM5QlZZU3FjR0VE?=
 =?utf-8?B?Z1FET1FBcW5RPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eEg0ZnFoWmtsNWNOSWhJTzVQK0kzOEtIQjFIdnFscGNxaUh2aTJ3L3U4K3FR?=
 =?utf-8?B?RkZHMklTSURtbG1yLytlYllPeVN6SlZTTVlEeWF3Ny94UmRkb3NMWjAyUDV6?=
 =?utf-8?B?emc5ckFjVU5HV2QrWTBtb1pieGpwbFVydHJPT2tiRWhoSVRISXJqSXNzdnFG?=
 =?utf-8?B?OFBKdEY2d05tNlIvVnRTbkNhR09wNWlTWjBPUmpQcGFFOWlPQ0k0YWhvZTZB?=
 =?utf-8?B?QjVUMGttdHhZQjVNSFpxU2ZUY0ticHU3YWRNRWd2bFNsTlBsS05WbEhQdG1m?=
 =?utf-8?B?cU5IdEM3cjRrc3NWTjEzMmNyWklLSGpZWldmRDdIdHVrVVhvclIrUnVzYkV6?=
 =?utf-8?B?V01nRUprRzE2YldESzFJSmI4aFpiRnczK3AwUnpwSEEwbFcrdEVTa3VqZUd5?=
 =?utf-8?B?Z0N3Ty9uZSt3RlAxRnVjUVcwemVqNHQwWVhNeFBHR0FxZUs5K3BGZ3BIWHh5?=
 =?utf-8?B?UmlwYVhUSmtKQUsybzkrcWgwU3R4YTJxdVM4U0IrQUZUWHRsR01pQVdOcW9n?=
 =?utf-8?B?WnF5ZXZIZUlXSFZRMEl4L3Y5YzV1ZHdoeU1OWmpqUnNyTE5mQzhXUkNHVW9M?=
 =?utf-8?B?YzNlY3RhcnZDY09ucXRBbGR6emFqTHBmell6OVNIaDUxdG9RczdneXZrdTRj?=
 =?utf-8?B?bkVZMmFmdDFnaGRocGlCL3pjTFlQSkxMTXdsSFdIbStqMDlZSGM1b0dRS1Bq?=
 =?utf-8?B?TXZwMk9NMm1teCs3L0RVRmhGRjh5UWdBallUNUN0dTErRkE2UnU1bWhkazg1?=
 =?utf-8?B?bEdndk9vMVc4YjhlYks5djdCVlVuakUzc1h1WDlqVkxtdnhuYmZmZWZNemJl?=
 =?utf-8?B?S0NGR1VWRTFsTFljTFpjajFwRWVYeWg2TUt3UnNycE9ieGZCRzdQTnJoRnNB?=
 =?utf-8?B?U2JtOVBTaWhGVlhmdjJWVTBUT2ZHQitjdzBoeitJcU1UNi91UGlzT1Zzd0hB?=
 =?utf-8?B?aG8zSlZwVW5VeGxlUXd0aEZSbjNKSG50M2RtSWk0UmVjcEdlU01nY1d5U2RB?=
 =?utf-8?B?UkpFNTdSei9zSmgwYTRHVFR1S2NwVmlSWGZOdC94SFM3aytSNy9YMzRkOVlH?=
 =?utf-8?B?Qzd6dDYxNTZQNHdtL2tYN1BLT3ZRVlQ5ZnBGNGxQVDlxeU5iNit3ay9KT25G?=
 =?utf-8?B?UEl3a2xOM0ExaHVSaFl2a05UakNLTDZ3QXBocElsOVBGWUpscnpHZjV4c1Ex?=
 =?utf-8?B?VmlZaStCdnNTMWd4dnJIdTZJaWJmcDdUQUdXVEJJTHY3M0dQT0lDUXlLR0Jp?=
 =?utf-8?B?N1lyQ0I5aXA3NEkxaG04aHV2THFKYWRxUWNEWDdXdnlBRnZ1Mmhva294cC9B?=
 =?utf-8?B?NUYydExiTHl4NDRkYTMyb0RvRjJ1cXJnbW1OVFBwdmtLWVIvdlYrVlpvVC82?=
 =?utf-8?B?R0dyNXhrdzVwWmJ5cWljbUhQdEJUZVkwNmxHTWF5T1pJQzNkT2NoL0xFNFMz?=
 =?utf-8?B?eDdBdWFMWkh6eDB0ZlNHaEFVWjBkUDc3bnBkUUVNSWlKdWdUUi8zNkczYklM?=
 =?utf-8?B?TWZTNVFBZHdCcXV1NEJYMDIrZ3Bmbnp1aWFubXlmZmFjQ0VoTXdYY2tEOC9m?=
 =?utf-8?B?ejlYeGpjeTU5ZnFJay9CMGJGcU5yT3hrVnpObGJDRWZjc0kzbWpVMXRLUzJv?=
 =?utf-8?B?eks5VFlIOGtiVm5HOWE5TDZtWXhjMFEwaU9pSitqQlBkZi9NNkkyb3BpcnNi?=
 =?utf-8?B?MlF2MlY3b2hzbjlsLzRYVnN2cWk3bXpNUjJkK01uaVBLVWx5M3BXYUpCcFV0?=
 =?utf-8?B?SUVQNVBJTkVtZTErbXh3Y1ZCeDVZUG5Gd21yN0tpeEVwZVJxU1lsNElsOEY1?=
 =?utf-8?B?dWVGaTNzZ3NBUGI2YWRuUUppZ2RQVTZtbFhXLzllczdhbnlkaVpEaTRjZzJ6?=
 =?utf-8?B?Y0xGY1YwR3Z1V21xWlZzK0ZoUnl4bUUxSlRjVFJuMVBCcitGV1VyZlZHNEhh?=
 =?utf-8?B?bGJiZDMwbzRhQWNENGkrZXFwbkM1MGxyY3BzRGxrZHZxRFZnS2lJRDNvcU83?=
 =?utf-8?B?aUhhSW5QUVhMK1FONXJhZWdRME8yV0J5blptSDh6QUxnYU9GNlJRUTZPY21C?=
 =?utf-8?B?ZFVQNUlCcjNMaUd0L2dlbmhuV0kzZ25BbUE2Uk40Y2NoQkF2MFZRYkxwc2o2?=
 =?utf-8?Q?wIR1taVNtRj9/dKjIaD86Nbdf?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc457360-1414-42d4-9713-08ddfa60794d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 05:17:21.6884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fVH14LBCx1IzswUVTbLt6QFzgdJEJ3Ri3A+by45qt4nxW3bxwbPgUOUTQcYxe5dMHC7C+vt9Gf/gUF0KZQl1pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9340

Replace the explicit call to imx_rproc_put_scu() in the remove path with
devm_add_action_or_reset(). Ensure proper cleanup of scu resources and
simplify the code by leveraging the device-managed resource framework.

Additionally:
 - Remove the IMX_RPROC_SCU_API check from imx_rproc_put_scu(), as
   devm_add_action_or_reset() now exclusively handles SCU cleanup.
 - Improve error reporting by using dev_err_probe() for consistency and
   clarity.
 - Drop the err_put_scu label, as it is now redundant due to the updated
   error handling approach.

No functional changes.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 56 ++++++++++++++----------------------------
 1 file changed, 19 insertions(+), 37 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 42014b42bd8d3b46b1a898969f0419e2e6a71528..a53ff186d218f54123e1ce740b0277a6fe95a902 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -796,13 +796,9 @@ static void imx_rproc_free_mbox(void *data)
 	}
 }
 
-static void imx_rproc_put_scu(struct rproc *rproc)
+static void imx_rproc_put_scu(void *data)
 {
-	struct imx_rproc *priv = rproc->priv;
-	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
-
-	if (dcfg->method != IMX_RPROC_SCU_API)
-		return;
+	struct imx_rproc *priv = data;
 
 	if (imx_sc_rm_is_resource_owned(priv->ipc_handle, priv->rsrc_id)) {
 		dev_pm_domain_detach_list(priv->pd_list);
@@ -944,6 +940,10 @@ static int imx_rproc_scu_api_detect_mode(struct rproc *rproc)
 	else
 		priv->core_index = 0;
 
+	ret = devm_add_action_or_reset(dev, imx_rproc_put_scu, priv);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add action for put scu\n");
+
 	/*
 	 * If Mcore resource is not owned by Acore partition, It is kicked by ROM,
 	 * and Linux could only do IPC with Mcore and nothing else.
@@ -1110,7 +1110,7 @@ static int imx_rproc_probe(struct platform_device *pdev)
 
 	ret = imx_rproc_clk_enable(priv);
 	if (ret)
-		goto err_put_scu;
+		return dev_err_probe(dev, ret, "failed to enable clks\n");
 
 	if (rproc->state != RPROC_DETACHED)
 		rproc->auto_boot = of_property_read_bool(np, "fsl,auto-boot");
@@ -1125,52 +1125,35 @@ static int imx_rproc_probe(struct platform_device *pdev)
 		ret = devm_register_sys_off_handler(dev, SYS_OFF_MODE_POWER_OFF_PREPARE,
 						    SYS_OFF_PRIO_DEFAULT,
 						    imx_rproc_sys_off_handler, rproc);
-		if (ret) {
-			dev_err(dev, "register power off handler failure\n");
-			goto err_put_scu;
-		}
+		if (ret)
+			return dev_err_probe(dev, ret, "register power off handler failure\n");
 
 		ret = devm_register_sys_off_handler(dev, SYS_OFF_MODE_RESTART_PREPARE,
 						    SYS_OFF_PRIO_DEFAULT,
 						    imx_rproc_sys_off_handler, rproc);
-		if (ret) {
-			dev_err(dev, "register restart handler failure\n");
-			goto err_put_scu;
-		}
+		if (ret)
+			return dev_err_probe(dev, ret, "register restart handler failure\n");
 	}
 
 	if (dcfg->method == IMX_RPROC_SCU_API) {
 		ret = devm_pm_runtime_enable(dev);
-		if (ret) {
-			dev_err(dev, "Failed to enable runtime PM, %d\n", ret);
-			goto err_put_scu;
-		}
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
 
 		ret = pm_runtime_resume_and_get(dev);
-		if (ret) {
-			dev_err(dev, "pm_runtime get failed: %d\n", ret);
-			goto err_put_scu;
-		}
+		if (ret)
+			return dev_err_probe(dev, ret, "pm_runtime get failed\n");
 
 		ret = devm_add_action_or_reset(dev, imx_rproc_pm_runtime_put, dev);
-		if (ret) {
-			dev_err(dev, "Failed to add devm disable pm action: %d\n", ret);
-			goto err_put_scu;
-		}
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to add devm disable pm action\n");
 	}
 
 	ret = rproc_add(rproc);
-	if (ret) {
-		dev_err(dev, "rproc_add failed\n");
-		goto err_put_scu;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "rproc_add failed\n");
 
 	return 0;
-
-err_put_scu:
-	imx_rproc_put_scu(rproc);
-
-	return ret;
 }
 
 static void imx_rproc_remove(struct platform_device *pdev)
@@ -1178,7 +1161,6 @@ static void imx_rproc_remove(struct platform_device *pdev)
 	struct rproc *rproc = platform_get_drvdata(pdev);
 
 	rproc_del(rproc);
-	imx_rproc_put_scu(rproc);
 }
 
 static const struct imx_rproc_plat_ops imx_rproc_ops_arm_smc = {

-- 
2.37.1

