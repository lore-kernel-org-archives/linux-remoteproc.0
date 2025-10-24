Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012004.outbound.protection.outlook.com [52.101.66.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFC7267714;
	Fri, 24 Oct 2025 02:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761274327; cv=fail; b=DHn4ly+fp26WjU32HI8ni1u5yg2a/hdaytuflB7wD8n6MXygye3JYMiJ4dLBtcbxPArj4taPw/3uLzBdWsAHjC4vxlCmfokkuqKclg04qkqQTFCmU2E6z2i4zDhah+oX28vy+zQKy9wX5gcTsulJV1HJJsjM9+C3JHmO400xvQ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761274327; c=relaxed/simple;
	bh=aSQB1i1A0pV4B9LkBp5dvuwVt3rcmVw098vV6IXnupM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=fGYjkFVwyw3kNuC/lI7LD//Ved7vcRjw6Al8p5zSxp/wnzCW/ktZt0jCvruLcZ2Hmjnyh1RagonXOTAzBBVFv+VgdDhYpLiTp7hQ2UpeLfU9eXy17xvGaM7ZILKy6BaFQBdpDdOfQ9LswmNv7LzGDko/G6qfP7lsV3sKHp+I8mo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=AxeRmcPc; arc=fail smtp.client-ip=52.101.66.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="AxeRmcPc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pVbUej55KHq9vpRB1QK6QWXzyTUOg27RW9gAMEZE2KM3S/38r+QLgSe8pBcVkJncXJR6bUrQakdxshQ3VhXa/I297qOsNYSMZPx8BALFMq+tbn3wV2U/rAE1n8pE+xPlYzprcKwBKefKgybe93yr0tUbj9Y8sXVfQz9bpk5Qij/7i2JwlUAGXzNV7ZIxOgcgvt070wkI8OmMbJBM0XeqIQmizhtlgwm9j6PcgKh8VanHOwoW85BLo6ZecLT0vbk0WFJ4ueM0+yUlCg27q+joTCz/hhato/89IY67KDsToRCqH7ID95v9mWwHwt8dbSuqk164dBsoptG6N3JUOGKAOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EpFl6BthoJcqoTmPpFu40lRhlIHw48AlHrcSQduWyTE=;
 b=p6xijRVG2d8fFS1ENgdTDV13XJ3FXxmGVQx471RZaCZBPbwvIqOBtYRihskP6ZCYKVAB5u7aIVaoVvLUxxrEdI0fsBdW3xyIOyRGQ/1rkL603Dcn8xH0SkOuc3mvIeC9Fugxf4cuX9XtVtnUR2yAdAseNGSh58kshSr4ficssy8Sa7Z9AVAEpAvPaXtv+B2gekBKdk8e+I1LeCY+/xjNVFx9A6L9DcF07khpJOCGn3O4xvcZxmNUb3BMmDKCsxRr6ai3ztfQOTubW+YFKlsm7O1+xrHhNIeus42mhJaigi+Lu2uHIp4YpDO8Nocx4cLtW9xujZOM243Onlyb+TS3Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EpFl6BthoJcqoTmPpFu40lRhlIHw48AlHrcSQduWyTE=;
 b=AxeRmcPcjvLAgpBxTF106A9T0jGhHtVruMi1K4OUvfAjgYP9KN8I4zdmTOwNlHksIEDom/NDnnvxBlWheQMFtfUmJplLBuYZDIzCduxcMY/QGTEZ6I6K7HgAwX7glgx7TFLd/fEsZGy2NY0zQ5sVAsFrA/52KVVhG1/Td17hs2q+wc00YPABtfzhc5kPYC2qjzuLVZGzw/H32Ooy+CYKNCsHE+w753LvMLXw/pHPigpI4WTQlyDMI2K+/NaGtRjOSYMtPx1ou/+qS7kSXMGhZmPAWr6d7dDo+NGUZ+wTymQFIMnZYI7z32+sG3QjFe+FA4GKpmNP1diVL83X9z6R6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8197.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 02:52:02 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 02:52:02 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Fri, 24 Oct 2025 10:51:30 +0800
Subject: [PATCH v4 3/4] remoteproc: imx_rproc: Enable PM runtime support
 unconditionally
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-imx_rproc_c4-v4-3-af83ed3fdbba@nxp.com>
References: <20251024-imx_rproc_c4-v4-0-af83ed3fdbba@nxp.com>
In-Reply-To: <20251024-imx_rproc_c4-v4-0-af83ed3fdbba@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761274300; l=2082;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=aSQB1i1A0pV4B9LkBp5dvuwVt3rcmVw098vV6IXnupM=;
 b=IBXWLiB9MUZwdKXXQupNdSkRISWAXY9LTb74TOJ/ngPcMT8UWD1Fw+SP+vIsdr55khFRJiZIc
 0zPBXtSSiucD49OS3h7ww4OP7pcaqSO6a58chZoqse/Q72AbKnOp+6N
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0019.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::15) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB8197:EE_
X-MS-Office365-Filtering-Correlation-Id: cb88c349-8c8f-4e47-dad0-08de12a84efd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZUpxL0FlVzVHN1kzV3o2MmxoSTczcjhseHhFNnNROTVScFpNeUZ6NnJMb1Bo?=
 =?utf-8?B?ZHVQakZuYzFMTzhLME9WV1h6UHhNcS9LUVR4dm0zNmRrZ2dzcnF4WGc0VnlD?=
 =?utf-8?B?cng3SkN0YkdWcUF1S1BUMkgzUXMzL2FVRDRJNHlLUjJPN0JnWHNvUUtwNWlr?=
 =?utf-8?B?ZXcvY2lhNE1SWUhQSnZyWGxaOVdnOFEvVE1NZlg0OUt0MWlzZE9uQjJNa29k?=
 =?utf-8?B?cVpMSk5mMy81WFdGeGZDWjFMcndWRUpDN1RSSzR0ZWlzUnRiQUtWenltYldl?=
 =?utf-8?B?Y1J0Q2hXeFhrbTdRY3JSUXhOT2h6ckV4Mll6OW9Ydm84R1NmUGdhbTVoKzh2?=
 =?utf-8?B?ZHVva3A5d1NEcXl4K2JjL01NSFZoU3VOaFBxWG9nejNmL09qMEdYSkFweWIw?=
 =?utf-8?B?WG0rWGlrWEx5RVZOVjloSmtIL1FLNVQzQnRwa3dudlRsSjNJNG1jTUlIYkdw?=
 =?utf-8?B?UnVFbWFPTjNEcm9BQTdTYnpKY1JYd2o3ZXc3cWJ3dWVTSUI4aG16TkN3WFRh?=
 =?utf-8?B?ak0zYlVROC9vaEZzZVYzTll2VE1CM1YwbG9yUThwdThpa2EwSjdYb0grcEtW?=
 =?utf-8?B?elNzU2hROEdWQlA3VFh6U2tJYVVWQS9FWjNWNWxteUNpT1hMMmUvVmFrM3dC?=
 =?utf-8?B?NXJsbzFhdFkrM3haSk94VzdOdzhPQ3hJRW0raDl3clhGaTZ0MTk1Z1d3OCtM?=
 =?utf-8?B?ZmJZWDJDbHNUdTh6S0l6TEx5R0FYbDlnc0Jpa1BmNFRTNjJ1UDEyVTh6ZGdt?=
 =?utf-8?B?YWJRUWRENWVwSXRsN3lCZHpOUmN5UUdnR0dsSWZMWE91T3FYNERzUXkzdkU2?=
 =?utf-8?B?S0lBd3EvZkRiejhLaEJxZzZpQmVWc1RESjRDYzVFL2hPd0xydXY1Q2hsSnVC?=
 =?utf-8?B?ejVadWhaTEt2bnJGVUlvVXhiODNXWEpSVi9VQnd3MGtwdjJJM3UxdVZkQjY0?=
 =?utf-8?B?WkJIQVp0bUtNbkhHMGh4VFBadmNSc2JWWFAwelNtMFAzZUJ0MFdENzhuS2dh?=
 =?utf-8?B?bWJoVUVVVUlRSEw0Mm1GQ3lpQ1ErUVVaMmd4bXNwYUhFTnY3bHFwTkhET3hF?=
 =?utf-8?B?VkFsL2NuUFpVNXdzY3NsVWJqY2twTDJiSVd0YVVSUkRRUXRlWVF0SVFtdUlo?=
 =?utf-8?B?RmtHb21tQ1o3L3BaZzhaUXgrdDFPZEQwczN5OEliQUlFZS9zcG41V0VwY3My?=
 =?utf-8?B?cVg5NjZwZU92LzJxc2hGNTJkK3Q3ZEVSOFJ2S2xxUStuL2x3d1c2R3d2YnZI?=
 =?utf-8?B?M1NuNitvUnRRRkQ2a2pVL0pkdGhDODRNTFpGWkJJMzJkSkNBWEdSYjNKSnlX?=
 =?utf-8?B?UHBuaC8xYWYrc3hBOHVqT1A1SEs2UjFRYlpVSHdxSy9tb2F0VWJpZ0RiU3N3?=
 =?utf-8?B?b2I0cDlyYWs3VzN0K3NjR2RpRFZTME1aSjFyTDNMbnpGeWlOYjZBYUI1aFB5?=
 =?utf-8?B?WUlzd0RMWitnaVJpT200ZVBnRExzVFllanNWZWtuZllPRGZvZG9qcmNEMEZl?=
 =?utf-8?B?Y1B4SVlsZFpqT2YxdG1PRkRTd1F3V0dnTVU1RFNPMmpEeTlKbVEvWWZjRGFJ?=
 =?utf-8?B?QjVoTkdLR2thakV1RytQT2dhRDFGbW5rTmxvM2RqcGg0UUhjVkFJa0RvZ3Bq?=
 =?utf-8?B?VjZxcXdITncwQ043NEFZdGw2NGY5ekxabEcxeE1ZM3dYdUpINmZTY3JqbmZK?=
 =?utf-8?B?cllocE9QMlI2Z3VCN1BuOHAxeFdEL1hWS1czZEZBMWJzSWpYSWFEcHJRK3g3?=
 =?utf-8?B?NU1qMlUwZ0N1TklIK0FLZkd1d2J1QjduK0dYY20ybUdDOEs2VzI3U0ZzbUd2?=
 =?utf-8?B?Skdtd0xmVGtFTUlmcjVVdkQ3aWtISUlxaVRlQXNLaE5WWm1ILzhPbUh5bXhh?=
 =?utf-8?B?dWFzRmV1dnlmTDVHWjZIdWJseWFGbWFHS2R1azV6RXl0K3lPS2FnWEZ6NlZK?=
 =?utf-8?B?UU9KNUxBaWl0Q212UGhRNHdPbHY1WmtuYWVyWGxvMFVrTC9mTWlhU0pjdmw4?=
 =?utf-8?B?clVzNkZXK1ZyWGY5eGkzVHhOdkRHdHBVcjM5VFFOc3hXRnNneU5lWHFJUE9n?=
 =?utf-8?Q?weec6w?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZC9JcDk2WGM4WGNFUVBhN1VaelVNRkhzbkFhaUt3dWtjZjdwWE9Qbk8rc0M4?=
 =?utf-8?B?UDhWL1BheHYrdkpzOVVqclVLbVpMeTBvQVhJWFh4dVNsWkM1ZGsyMEdZYWha?=
 =?utf-8?B?U2dsRWJaLzBZalpoKzl6Mi8rQWdTNExNZTBFVzhtZmtGU3JyTHNZUWFNTlg4?=
 =?utf-8?B?VXVpWGNTdXl4UWkrQlpBdW1TcDVvVXpJbW1SVHRLSkVTS2Y1NmtsbUhkaTZu?=
 =?utf-8?B?SDBMZ1dUYkR2Z2p0Rlc0Zm5hL09CTnVpRFBQVGVoRVpQZlNkY2dtZ3lYT0Ix?=
 =?utf-8?B?cjRtNzh4Tm1sSnJnVlVnaXUwUXY4MERORHh1MVk4MFVMd0phTUFMa2hFaTAy?=
 =?utf-8?B?MEczVkd2Z2xKM1F5bGpqZldVeHk4K3VYS0tYYlYxeTVjM3Z6MVpJZE9oeXFV?=
 =?utf-8?B?SkVtSXQ0RDFLUEhjMzQrZnZGbzdRTTlYbjN4aU9UejFtR3duTGRMZUtHeit0?=
 =?utf-8?B?eUw2cFpWclp4eUxNOFNCYUd0UTRBWG1tdWZ3R0NMU3FwUXJNaUF1bno2ZFJM?=
 =?utf-8?B?T3JuWFRzaDU2T0o0NGV2dTdoaTJFVUJ2ait2akZkMUxDMndyaDRrTkt1eEx0?=
 =?utf-8?B?MHFJcHgvREVSMkZZSDlTTWU2Sm9OMVRtWkFiSUJJMEQ2Wk5tNUxKd0hnNkVr?=
 =?utf-8?B?ZXhDa0kyajREUHNJMmZnWkxEZHNyUWdQREd6Q1dEY3pKOC84anNIUmtLQ21U?=
 =?utf-8?B?Ly9vRFFOVTVDWEFtNkI5cUVuVEh2VkxhOC9rYkVZQjdYUDBONzZEd0RlNFY4?=
 =?utf-8?B?aExVQW1HTk4wUWJ0aG45bUFwUUpweE1idXlFb29tUG4zNXlTUkJwVHMwdjdy?=
 =?utf-8?B?MStLZ3R4QURJRGFBbjlpQ2Y2MTdjUVhqbVhGZVpkZDF6S1I0TmQ5bWhCTm1U?=
 =?utf-8?B?THdkcHV1YmVQSFAwWEhZK1BwZjd5Nm0yNWFYYlM2N0NkQkRENERmNDBoQ0d5?=
 =?utf-8?B?Rkptc0VSRXI4SjlxZTRHOEFzaWU0aFN6eWYxV1JuclU3b1B3alVLd21IM1k3?=
 =?utf-8?B?SVFubXhvL1ZHZUQxMmtabEpIVkRrcjZMVGMvTUl3UzUrNE1YY1NhcHVXSzEz?=
 =?utf-8?B?TFJNcXY3UHByQzd2dnVNYlRQM3RMaGNyZWJMQmMzczVJcGh1Wk9Mc2dSMytj?=
 =?utf-8?B?Q0ZnRG8wVlk4MVBoVHdtbjg3MDA1WjBHVkg0TzN5Ny81RjcyOElTUWhHaFJF?=
 =?utf-8?B?YzdEMDlMSVNzUzJVRWU5dmlucXpBTWZrY2VvbXFzOUlQd0drdFVRQmowWUR4?=
 =?utf-8?B?NmhmVU9hK0l1eEloSGVjY0ZSMU4xNDcwdEExR1cwL28yQzVLeldkcVRmQjRT?=
 =?utf-8?B?c3o5Z3NObDZuT0hvdVlUeHNxMGRlbWx1bkNiNG9USXFweXBkZzR3cHNVc3Q4?=
 =?utf-8?B?UGpZaTk5eUtQU3REU1pUdnRoV2dKWUlKQit5QlRsZ09VbVNWcnVkN0pxY3By?=
 =?utf-8?B?dWR5K2tMV1NZNzVFdHpmS0Z3aUc0bVh5Yk5naXFxdWMzZ2hiMENrYklsa1Ft?=
 =?utf-8?B?ZHhCUVYyR1NqazMxKy84V0NkYlRwQlRUbUo5bEwxZms2VHh1b0ExU0U0MjNI?=
 =?utf-8?B?Wi9EVUpkM2xKK2RDS0ZWTEk3bU0zTHdmaUh5bWZuUXpvajlGNjNOZ1MrZElp?=
 =?utf-8?B?VTZIUkxJT3JheGZSaitZU2RWOU5kdkVKUUdKaXVNVWtNSmVVWDRPTUtxRFlu?=
 =?utf-8?B?ODM3dlJQQkdIMnNYeEdlMVF1UXFuaE1ZUDEzQ1pxTjExREFSOW1xRkFHWUw3?=
 =?utf-8?B?MWtubUFCVWhWcWRzM2c2TUloQ1RXMm0xakxzaTV1Q2xTUk5KdDZxdlBmT2V4?=
 =?utf-8?B?Q3pSWU5OUW5iV1d5bjUveGJuZ1F0WDl6VkFTOHJjYnpxenAyTHRIMmtJNEdm?=
 =?utf-8?B?ZnR5cXdiM1E3S2NxS1A4NjlMRnNabWRJTENPNyswMW1tbENCNGlQZXA4aW9L?=
 =?utf-8?B?SEpzSUFCYlRrckMzTlZXbDhOdEZReElYc3JCVW5iUmdhbkM5YVZBaHJsTWsy?=
 =?utf-8?B?NExhQUFYbUlvRHBqYnhjYnpTTEIvN0xCQjhmTHdLdmc0d2JtdUF5UE9POFRr?=
 =?utf-8?B?QUVVTFQ0MlRRRDVQV2RuTFEwUzhhbGpvaWhBSlpFUk5UY0sza2dpYUt4TVF2?=
 =?utf-8?Q?JV6IPAa05n+5E4vNZZ3xXv8rW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb88c349-8c8f-4e47-dad0-08de12a84efd
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 02:52:02.5120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pZzmhcZ5Y/XzNIHTGHhOM6NY1DzVWWaWk4HFl0BVgT9GpUGGBshNzTIApDDEywgDNziOkehkIN6ExNFxQxowHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8197

PM runtime support is safe and applicable across all i.MX platforms, not
just those using the SCU API. Remove the conditional check and enable PM
runtime unconditionally to simplify the code and ensure consistent power
management behavior.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 820b0cd5adbb17ce5665e7ec2786bca23f1a67ea..25f5cb4d414eabed7a166eb2a8ae5e20b6b4f667 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -1119,12 +1119,10 @@ static int imx_rproc_probe(struct platform_device *pdev)
 			return dev_err_probe(dev, ret, "register restart handler failure\n");
 	}
 
-	if (dcfg->method == IMX_RPROC_SCU_API) {
-		pm_runtime_enable(dev);
-		ret = pm_runtime_resume_and_get(dev);
-		if (ret)
-			return dev_err_probe(dev, ret, "pm_runtime get failed\n");
-	}
+	pm_runtime_enable(dev);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "pm_runtime get failed\n");
 
 	ret = devm_rproc_add(dev, rproc);
 	if (ret) {
@@ -1135,10 +1133,8 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	return 0;
 
 err_put_pm:
-	if (dcfg->method == IMX_RPROC_SCU_API) {
-		pm_runtime_disable(dev);
-		pm_runtime_put_noidle(dev);
-	}
+	pm_runtime_disable(dev);
+	pm_runtime_put_noidle(dev);
 
 	return ret;
 }
@@ -1148,10 +1144,8 @@ static void imx_rproc_remove(struct platform_device *pdev)
 	struct rproc *rproc = platform_get_drvdata(pdev);
 	struct imx_rproc *priv = rproc->priv;
 
-	if (priv->dcfg->method == IMX_RPROC_SCU_API) {
-		pm_runtime_disable(priv->dev);
-		pm_runtime_put_noidle(priv->dev);
-	}
+	pm_runtime_disable(priv->dev);
+	pm_runtime_put_noidle(priv->dev);
 }
 
 static const struct imx_rproc_plat_ops imx_rproc_ops_arm_smc = {

-- 
2.37.1

