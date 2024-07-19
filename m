Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011061.outbound.protection.outlook.com [52.101.65.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5307B6EB7D;
	Fri, 19 Jul 2024 08:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721378408; cv=fail; b=HemKcUix6yILypr868Fz0f1Wj7hQi6wzxYCV4w2V6FkkIFzK+AyG92a4xXDnf/VWGUrenAG0GHzTY26zaCvhuI6FGpDcMTEsMfFWyxdJjHsq1Vv3S5vcp7DKjnHjsgZmY3O+jLb/7kQ4AgSeT80bsLK79IqTo+FUvoLiF60wHVQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721378408; c=relaxed/simple;
	bh=pyLXoGKfN+cr12IIXgnVFa4xXqdfkMoy+eADLcv9SsQ=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=NmguV1OXJyvhO1b04BdNQxzlu5LoVxT9VLB6o5KxHEDmE1Lz9hNdisofn2GRytA/eiSq36vX+2CyK7Q3MKq+lg4VMTD8ZI9xFEY4DPYQTIZyP3i/ILToPlWyqNLdD+Go49U6EisNdwmrQdd/WL9UOQ+Aqn05JMC6nwGcFP1cujY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=dRr94l+Z; arc=fail smtp.client-ip=52.101.65.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="dRr94l+Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zCD8O2960si4yBSJ3d5htylaK4y7usQ3I4OCL2v3ClzRjf9p/oz1ofj/OIQjSBQnQxrsYCn1lDioVX1dWNw6b0MagWIUsfDlxakJr8Zfv1a0s4NFSz3JtxWR9j25lTUeFu5Uvw2RoT8xcuNsYhXUPJ7w5UAgTYgIOf5fT3Jz8vOSXEM3YOmlOVa5xyIfsX6QuOYirLu1UrluArPEyDchGw1mW6Sfub8E4s2g2kj9yTjXLMmVZKh7ul1c/VSuG30d03D7CtNXnnlNjofC7RnDuDljEbzewGwpIXH4MyvWhYTK8Df7L14exCrE7jp/0Ozgm1eE9NimC0iCB3X2nUqHdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FbHCPyB6vSj7mzlSEbnqu6DWDnvQa3wUMAtCk6a40Gc=;
 b=FKuozmplw1vHJuPRsBYRHELfWE67dyUD1Sq2a9Lw+Qfai8IS39WZP4JBQRGET38DcLBa9SZCdeMRAphnOciN7YsfViRLjzdse4+RSqWVSoYbH+IAda5ufHAlGefR6fwb8Cyc35Bv8IfS2GijQOgFJc/jnrOXLHp853t/dCcsJ5g7dHm4KzrPSE106ZlGRncO25nGDcN4WHOPVNXejqM/SaOpW+Ky4V7g03JkdPiJd3r9YCZHl3RbTIuvw7y6o6gTZW2mivbNhYoIsKKNymwCs2edy/a56V++0Ixtdg7f4PPTeC9GlwV1DXyRCetUbxhufX2lf9JP+BSNVWXwf+0Ihw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FbHCPyB6vSj7mzlSEbnqu6DWDnvQa3wUMAtCk6a40Gc=;
 b=dRr94l+ZJX9lvGNymjdnSyMwKtSVsPJR8/31DhM6kAeVOK8nmEiPvmFvXe67TMm72QtdcdVeL8TVd6X5Weh85PeAvQzxI0HVRRjsabLXu9aZHi3CfruabtppX1GQhtD12pgQwvOxOmBzWRrL0XVcN7nsPLANe3pS2/EFXcnrgbM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB8PR04MB6812.eurprd04.prod.outlook.com (2603:10a6:10:f8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18; Fri, 19 Jul
 2024 08:40:03 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.7762.020; Fri, 19 Jul 2024
 08:40:03 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v2 0/2] remoteproc: imx_rproc: support non-blocking tx for
 i.MX7ULP
Date: Fri, 19 Jul 2024 16:49:02 +0800
Message-Id: <20240719-imx_rproc-v2-0-cd8549aa3f1f@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH4ommYC/22MwQ6CMBAFf4Xs2Zp2ayly8j+MMbQU2QOUtKbBE
 P7dwkUOHuflzSwQXSAXoS4WCC5RJD9mwFMBtm/Gl2PUZgbkeOFaIKNhfoYpeMtQdbIxWkmrKsj
 /KbiO5r11f2TuKb59+OzpJLb1XyUJxpk2tiu1xFZidRvn6Wz9AFsj4dG7Hj3MnuAtx7Ky2hnx8
 9Z1/QISzzQg2AAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721378951; l=1415;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=pyLXoGKfN+cr12IIXgnVFa4xXqdfkMoy+eADLcv9SsQ=;
 b=yiZB1yvyIYD6WTRxB7fSoYG+znDEbpfSJHzm0HMRUJFoR4oCyYXQ0slCPFnPGW/YAiSXR/pru
 IluqiY5tf0qAy8bqyS3mYxOSJOx/yjdyJ5D8wEdNWIBBBATee2Sc/Zc
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR03CA0129.apcprd03.prod.outlook.com
 (2603:1096:4:91::33) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB8PR04MB6812:EE_
X-MS-Office365-Filtering-Correlation-Id: ddb8699d-646b-448c-3147-08dca7ce6234
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZmwvUjZIVThORVJGVTQ2djJQR25sc0VtVjJadHFaZzRLdm1JcnpsY00yQlhK?=
 =?utf-8?B?ODRCZGFkM252M2d1azVyZGk0Q1gydVZzNytOY3BmOWloQmJIUytoeURITWdD?=
 =?utf-8?B?MTcrMU40czlYYWFUUEtWSDluOWFYdE11OE81WDlFN3JMWVdML09lbjRCK0Ru?=
 =?utf-8?B?NGFna3UzY0ZqOGhWOEkvOXg3RElCV3hPOW1xOEJmYWNNeVM3Y1dZK1pjVytO?=
 =?utf-8?B?NDNLMjFMUkxCZTFMaXVNZFlZTnpwN0Z4SUpQVlRydGUxMmFQaVlOaXc5VnFs?=
 =?utf-8?B?ZFN3Q29palhqTnJCQkdsd3ErK3lzeE9KekZwNVVWL09VaE0zTnZZMFhOaXcy?=
 =?utf-8?B?bFJVWko3ejFPWTZ5TVlObHdhK1hKNEZHd1FkTUpUdDB2K2h2eDdTMnM4N3NV?=
 =?utf-8?B?R1FhaVRjM0lzdTZvRHhOWW54djB3U1pNZ3ZmVVRFSGN0OFh1aHpOVjdpcktT?=
 =?utf-8?B?RE5HenE4REkwQ2EzZ2xxUnJMVXQwakwxcDFQZ1FKQnlCeWtDeHoyNWY5OXgy?=
 =?utf-8?B?SFVVaUVOZkhDa28rdHRPRWx5QlpjWjNsTXovMHYvVk9PWjF4RlJra3A3Z3BY?=
 =?utf-8?B?dDl1a25Kemt5alRncUx4OGtTd2h4UHdwN0ZzcDdMV2FnNExCUit5R2kvb3N6?=
 =?utf-8?B?WXhyZ0FJMjhSbzhXNjdmRnNvMTRGdTFTWEZBRzAySjRDN1pYU1htWEd3Vms1?=
 =?utf-8?B?bVlOS2FPaUFJZlF5aWVBM1YrMDEwRkh3eFFjM0Y0c3kvVGFmOURGSCtrMXIy?=
 =?utf-8?B?R296SEdlYlZsWVFOSDZHaEdiY2F4eFFyK2U5NUFBZUVDMSt3cldpQnlRdWdw?=
 =?utf-8?B?ODlsamFCWG5nL2VRMVc2VHRZWTVjWm0zK2xHb3R0VGNSVk1Rb1VPOGlUUWdK?=
 =?utf-8?B?QTByZUVCUStublFWd1lneXdHYnRxL2o5SStyNGlndU5TM2hMNWx1clAyZ3lI?=
 =?utf-8?B?SUZlL0xURTVaUmY0Y1lnVW00cyt3RkNranN5bStCTlJLUjFiTTZIdk5Zc1p3?=
 =?utf-8?B?T0Q0Y2lodXp6TzBBcVNqaTVqU3FjcXN4UkxkeWdFS1Z1eUxXdzRNdnc4VVRv?=
 =?utf-8?B?N1FBa0MvN0phZ2NFZ1lLbGdYd3o4OWZZc3g5NHR6cmF4T0w3czVJVzR0ZE92?=
 =?utf-8?B?WHUrS0xEZk1FZ2RmVmZva1lLVDk5UnlmeWNrR20xMllRaFBYZ29TK0VLbkZp?=
 =?utf-8?B?bkF3QkNEWHJGY0IyWkJONEMyb1FVbnFCditkb3BnSmJwU0c0TWJRVlFiVEpi?=
 =?utf-8?B?UUo4WjFDNE5Ia2R6SGZpZUgrZllKcjRucjNpY0EwcVNFTFFyQ1B3aVNra1pF?=
 =?utf-8?B?QUFJRnhheU01aUhuZnQ0Z1drUlBnaXRaQTZQWGZ2OVkvdis3Z0lPdEpHQy8v?=
 =?utf-8?B?VXJhaHh3WXVtRzNnaHd6ZW01MTJUamMxUS9ZVG5BNm1IcmdGRHJnTTcvdDR5?=
 =?utf-8?B?YWZXVEZBRHZBd1pKN3FzY0toWWtYekpScTFwMDFEUVZZeDYwZ0xtN1h4YlJT?=
 =?utf-8?B?M0ovZHdlNFo1cUxEK3l1R0tzQmpUMUhqckJEQzJ6ejlSUXpwVk9wQ3hGV1k1?=
 =?utf-8?B?NjM5N2h6QnFadGdvNU1hT3Bod3FtUzRCUC9rUkJmRDVnVmtpTWNEMndoTjFI?=
 =?utf-8?B?eWNNUEk1S2ZaZFdrTy9lSVdrMXZxMGFkM0lvVk1tckFzbFIrcWN4SE5LcDRY?=
 =?utf-8?B?Nm15VG9NcE42QVYraTBnbm9SamNqY0lPRi9Gc0hPaDk5RWpiaUxjaVhPYUFz?=
 =?utf-8?B?RUxoUHQ0NFRSeVFDR1QyRzJTd2RzME5DREFjM3VibkhWZzhQSkFhajN2Qm9G?=
 =?utf-8?Q?+GATE8U0bnl9hovQPbyFlgfW7P+iyLJLomUhk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b1c2TVRsZHZoOWZ4WnROR0tCcVlaNEhlaUFmd0g1VVArYmxIRFh6V0JRUGgr?=
 =?utf-8?B?SXdDL1NvMGc4MHpLcmhhaUNUbS9yNW1qV1QzdW42S2ZvUWltRHJJd3ZncUtU?=
 =?utf-8?B?QjhJWUxYMCsvcVhycWFzdE1sWVp3RkszQWVzTjZjVFVQMUpYOEEvRm0vMGFC?=
 =?utf-8?B?b3FweFA3RG1kbm9WSlRSTHB5aHlMVXV0Y2k2MEpTcjdLT3puOUFIVXdvdUdC?=
 =?utf-8?B?bjRJOGxoQ1oxempXaGxmMFJLcTJ4emk4cnRqYmx1aUtTb21vdmFRQmlxcWk0?=
 =?utf-8?B?OXE0NFZzRXMyTkRlRmVkQnhiNWJwSEJuWVd0aWpEUld0d3U2MWU2QW5vKys4?=
 =?utf-8?B?RC9TQjQxSEZoUzJOclVOOGpBclN2S2FGbjlDNVFyampZZzFaeEFwVitDWWFY?=
 =?utf-8?B?cFpwWFRqUGlqWEFHLy9Kb1EraU00SUZjelc5UU5hQkNCR2R6S0ZQa3p0ajRR?=
 =?utf-8?B?azJ6Y3h4bmJVZGR2SmlNRUlDdS9zYXZMWFJFRzg4VHgrYXhGZzRZV1lyS1NZ?=
 =?utf-8?B?UGV5T1hzeis2VG8rOHpBT1FkQ1Z1RStodENJOEVEMzJjOWRvU1ZTNlhiK0w2?=
 =?utf-8?B?RGhCTXhqWHpzeUVrWS9PYzJDSW5aTjMrbnB4VGFhVUtLQ092ZVZyUi9EN1FU?=
 =?utf-8?B?Qmg1cG9iWlNxeFpSbHJJcG8vSW5rUndHaCt5TFducU5aSkJUbG1NRnBIaXBO?=
 =?utf-8?B?cEg3dml6Z3BFMGZXa2lYQnJkOVpOdVV3amlnclFoVk5zZFJTUUZRcjg1cXJu?=
 =?utf-8?B?Nmx2M2hyYmt4bVdsQ3lscGZiU3ZDd2NZSUFLVUFOSit1K2QvUjUyTlhNKytG?=
 =?utf-8?B?Z05NNlVCb2NES0ZVNWdxWTRyTmp4V1VJd1NJVG81TjdJYnUxMSt1MHdudHNz?=
 =?utf-8?B?M3B3SGMwYWMzR3drRGkxbmwzRDRWWFpVWXRzaHArbnBuN29jeGlZNnV1bERa?=
 =?utf-8?B?bW9iMFUySjFzbWpEYkg4ZFZEUkE0NXJsVTkrcWQxOG9XVDlzS2RPZEQ5WFpx?=
 =?utf-8?B?S0pib0dJZUpNUHpBM1lrRXoxdmRJaGlKWGdZVGpuWCtYU2NwdDY4aEpQT0RV?=
 =?utf-8?B?VUF2NHN6ZCtMNHQ4QTA0ZC8rTlNlZWIveWwvOXgydGtzR09nYlpjTmZ6SU5i?=
 =?utf-8?B?STJDUUs5Z1NTRTFKZUN4b0ZSQmh1VGtYdkxrZnhGREF2THhkdVRHMnVVUkdw?=
 =?utf-8?B?a296V0NGYi96dDFNdXNwSkU4cnE1SW5HaXVqVWJQZTh5RFJiaGRvN2hWSWVh?=
 =?utf-8?B?SEpSaVN1d3d2d01BY3A1Mld5ditLUGZpR3RkSWlCOUpUQnpibC9mNzQ2eHJC?=
 =?utf-8?B?elFselUvNVU0TE5JU0gyMXhtZ2VjT1g4MlBSQ2liR01CaUhxTUxwcGNRMHRl?=
 =?utf-8?B?MUY3SUZiWFAwZWlUaFVTQU1QdWN4bVNXSnBCUkJmKzhQZkNGQ3dZcERVZmJL?=
 =?utf-8?B?cXhoSnYwSXFzNnBTaXdVRHBRWnBQaURJUkZKb2FjMHdOV0NwTThyaFlHM3pM?=
 =?utf-8?B?RktpV3dTWUowVVJNV1FqOHN2dGVUQUxlTTl5TmlhMWVmR0szRTZOMlZZcElq?=
 =?utf-8?B?Mys1NkNrS05UVmNKcVRNUmsvZnZVZ3FZbnp0bnhqWmtCRXJSSHRQTDlRNlVr?=
 =?utf-8?B?RkN5Q1AwUnVZSnFCbHFYVWIrUURyN29DcmdTN01WNFFJekdMNFJ6NXVpWExI?=
 =?utf-8?B?dG9tUEV1OVlHLysrSkJpd29rME9DbDhlNHdBRUtYcVEvVTVuS1AyMFhJVm45?=
 =?utf-8?B?OFIzNWR4UUI0M3F6aHQ2VWtjTVNRZWFFOExoSFBrTFhnK2x5OW5IUTlYQVUw?=
 =?utf-8?B?NzFUWGlxbm5zWnFZN0VSeTM2YTZabFE3cVRjUlR1cm1ybEFSUTFLWkYzRnNW?=
 =?utf-8?B?WFhBZ0N6UFhHMEdWcWxHbFZwb3prNndJY2NqTmFrdFhLQlZlaHVrM3FSYVRY?=
 =?utf-8?B?cHZLUGZmenhrNWNhMUtpMStYc3RoNHRCbGtaU0VSSkRMVVBkcVNpYzdUNFJI?=
 =?utf-8?B?dUNSMmMwT3cxYWFzbmNOekRmTHBiSzhYL1RoRmhpSUM1ZDBFYjgzdXBNRGNl?=
 =?utf-8?B?WXJwRFFFZE9nbFl0R213UzZwYjM2c3l6WXp4R1V4NGpwM3ZJdEdsNTBoaG1M?=
 =?utf-8?Q?ff5RO/EelnV7VIIIQv5T15r0H?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddb8699d-646b-448c-3147-08dca7ce6234
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 08:40:03.3460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H2wnpuU+Kodc8bNFdtXLqEVNURc3ZOYgf2QnEw0rp/t+VIi1XxJIPy2b66q58MGHHCbTmHi1gz5CswQwkCWXEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6812

The i.MX7ULP Cortex-A7 is under control of Cortex-M4. The i.MX7ULP Linux
poweroff and restart rely on rpmsg driver to send a message to Cortex-M4
firmware. Then Cortex-A7 could poweroff or restart by Cortex-M4 to
configure the i.MX7ULP power controller properly.

However the reboot and restart kernel common code use atomic notifier,
so with blocking tx mailbox will trigger kernel dump, because of
blocking mailbox will use wait_for_completion_timeout. In such case,
linux no need to wait for completion.

patch 1 is to support non-blocking tx mailbox channel
patch 2 is to switch to non-blocking tx for system poweroff or restart.

Based on patchset:
https://lore.kernel.org/all/20240719-imx_rproc-v2-0-10d0268c7eb1@nxp.com/

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v2:
- Separated patch 5,6 from v1
- Update commit patch 1 with adding "No functional changes"
- Link to v1: https://lore.kernel.org/r/20240712-imx_rproc-v1-0-7bcf6732d328@nxp.com

---
Peng Fan (2):
      remoteproc: imx_rproc: allow tx_block to be set
      remoteproc: imx_rproc: handle system off for i.MX7ULP

 drivers/remoteproc/imx_rproc.c | 48 ++++++++++++++++++++++++++++++++++++------
 1 file changed, 42 insertions(+), 6 deletions(-)
---
base-commit: 0de2e1d9af457b2eb010636d59dfef569659783a
change-id: 20240712-imx_rproc-25f3ab753c58

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

