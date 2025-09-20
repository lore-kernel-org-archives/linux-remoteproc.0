Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011040.outbound.protection.outlook.com [52.101.65.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D972F99A5;
	Sat, 20 Sep 2025 13:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758374110; cv=fail; b=BsKVnaAT249sA3yvvubpH0tX9iI+Yc7Ll4RVKEExzU/fVIKlvr/liZgda+LZ6gV0FZK93lqMebvSWU2M+0BDaLpM/YGMZsDxkWzUWQLFiDEpY0zHzjWz4LqrtuanltUG00vPhj4y2/2Cof1JQDAdH6i4THH818I75HjImK9JVRg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758374110; c=relaxed/simple;
	bh=e5dxqP6QQC8RxHeiLHzrIXq7Og9WOtfbNq6b4AboIME=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=c1RGjSaw/OQcBDwk61cUjwp1ydEbD2jkle+VQV/M/TGuxD62L9unEuxVImc5jbxlrxZZuVD92cbElcrYaaLiHrI6l7tVlr770Szc94FdmcK7ez3iba2UgU1E93QLET4iwpyr0rm3IyUxl7uSuJKJBaHP0f9qz+zwxQKCTE+Z+Ro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ipuBDykv; arc=fail smtp.client-ip=52.101.65.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ipuBDykv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CL2/JwUF+9OM4UZGJtPENyqrzcTwnsjHHzQSuxG2aDWmgOp/MhJqxiug2pzY1rPAuMeZROgtjH8RuzdmwM+hyIiCPk+xwQjj4V2oHOvjv7qt4eUoFF97DnMjjWaZYZ6ROZWMwb9CwK8ibVYVkfw+/0vB+BQGOV2zWP8vaMicqElN+YowK4OdtgiaSKUJkweXCwOS6er4qG/Ea+Wd/cpkrce58xC6N93vK+PcNNCo8+evnum1ukE/5XX8DsG+NvMMEWnxH+SJJp9eUiStOuWzQ5FxqLPCtXoKzyjU56+lBd6G9/cOjmC5GCvUe4Wp74B30HkUkaqccmxVDhzh9BIDGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RCmNfSFxxB7zgBuvZEooE6xedknyrJv8B+ilZKJTRCY=;
 b=VnVahmgcRSiCaH4GWb8HbsoUXzCHnnECMCLQZsb4v2Tzci+x3yJhcKKVcC5J7PNxFyOerkDO43FLuWoqSUSwtt6R6FKLvudIjkZCW4h5krA/eUW8pIaMvC4alPhbSvaQwjEb3SnkqhgReGb4KefixklN49MggjYGnurJrDZmBXUlQS6CjhgJb3NoTR6GZiqEBJCWBQzxuuqUbnJaC0hqK2UU6PGhC8SwOB63zf1lA1c1zJhDMi0rm4ULVOtI0kuWh8O4aJTefqbX1Rk5kbXabMWGnAeigvK8aHWC1hJL/oqLUoQ01LETp4dHoEra5C/Boipu9UVra8wRZPQ76F0+ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RCmNfSFxxB7zgBuvZEooE6xedknyrJv8B+ilZKJTRCY=;
 b=ipuBDykv9oA0uDM1bFYSkHzn9sGIub+QTrRNWQazLQcZ9c3fXPaPTsz0LDOjsj2KS8Ud8wBB+Ngxn85BG+L+JfoE5xUFlaCv8NgNUpK+MXNZkWV0anAeTl8qSAKO1kBLjAJ/bmWT/3gs46dOk2hTzSwyiUQIjvue58dVR+50eRdMaGJyMaoDyZIWsVi4rKFP+YEtDIW6t8CJHMQyi9E2O7s8zQxU2se6tS1dWqTKREdObrMVfW4T5CVCPzmpQ5Ina2gtSCvsQ5YAdWwFQDYMg6SHV5OJv9RWegmQSwNVVTgCUNyxoZB3UQF1310ouyzNi/roi5BD/3z04pGTIkxcPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8833.eurprd04.prod.outlook.com (2603:10a6:20b:42c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.18; Sat, 20 Sep
 2025 13:15:06 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9137.017; Sat, 20 Sep 2025
 13:15:06 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Sat, 20 Sep 2025 21:14:36 +0800
Subject: [PATCH v2 3/5] remoteproc: imx_rproc: Enable PM runtime support
 unconditionally
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250920-imx_rproc_c2-v2-3-3351c4c96df5@nxp.com>
References: <20250920-imx_rproc_c2-v2-0-3351c4c96df5@nxp.com>
In-Reply-To: <20250920-imx_rproc_c2-v2-0-3351c4c96df5@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758374085; l=1840;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=e5dxqP6QQC8RxHeiLHzrIXq7Og9WOtfbNq6b4AboIME=;
 b=5W1Ka+ZDbbKOq3cNTeC1EO6aPUTw0J3WuVMRxLNlnKoY6fAmj0O/jztE4NrUC7J59dDoJSIQI
 orPiffzqQ9eCvr187/3+wzRmOXLW7HSIezwOIj4+jszgsH7O2yUxhCw
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SGXP274CA0003.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::15)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB8833:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d1c5815-b57a-41c2-2359-08ddf847b775
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|19092799006|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TTdGc25UbENtSlB4SDhpNVVjS21FWTBZTXlXV2I4TDVYSE54T0QyR2hHZU4x?=
 =?utf-8?B?d0JTd05ReTJEWDRLTjgvcGJnYi9QcVBFU1AvS2Mxc0hxWVBtSVo5SFBMNDhs?=
 =?utf-8?B?V0x3ZXZ2emw2cjdRZnZTOHhvV3d5YU9kOGplNjVZTyt5V0RmQ2ozYnA5OXlu?=
 =?utf-8?B?NHhVSEpBUFpNMGNCL2s4QVZJaWpMQldlQzhVRXczVEJpWWYveG8xM05hVVd3?=
 =?utf-8?B?bzJNV2IrWWtXS3M5ZGhiSWZpdGF5bVBjNVBObU56OW1PZVlmZ0cwcFp5NEtq?=
 =?utf-8?B?Q0RydHRWL0VYUlBWdXY4Ny9Td1poZkd3MldmRnJ3RFd2aEtpZncxZU8zejJa?=
 =?utf-8?B?eDVaU2RhUWdIako1RzNXTDNOWXdiRHoxRjl6ckdSbGluUEV2elduWkVYOXZR?=
 =?utf-8?B?YUg5RVY2ZWVVUXhwZkJ5Sy9TRWZ6QTVpN0VrQWt2U2JBYlB3cjA2UkZsazVQ?=
 =?utf-8?B?VVVHTlB5YTlqT21zRm8rWVhNcExkNmVzWmN0Z0dKOWwvSU9taGRHYW01OUFP?=
 =?utf-8?B?bDg5Zy9qeUE1MHk3MHdHSEZTUmdLN0V1WjJ2dGllalUxekJGRGUzb29pSDRl?=
 =?utf-8?B?RWxad3JGV1Z0WC9STGJPczVnejlvYzJNZ1c4OUtsRUUxOXRkc1loZ2ZNanpa?=
 =?utf-8?B?SkpzdVd5UlNoWW0rYSswdk5oRjFPcnpFYnEwMWYvSG56cHAwRDlYcjd4ZDlM?=
 =?utf-8?B?VC92ZWNZLzZQRFRNV2VFOUZYMUszUTZsVnZMckhIRG1GdFBmUzVaRmxlMU9q?=
 =?utf-8?B?TDdzWUsrcmQ0T0djdGFMcXNweU1SNCs4ZE03KytobHpwRjlJVkIvME1jbVda?=
 =?utf-8?B?eFJIVHo1WStBbVJYbHpFUlU5S1J4czRCbkhyY3JncklmTURpRlFsdDZHUmJw?=
 =?utf-8?B?ekYyWlpqTHA2VTQyS2Q4Z0p1ZnBZOHBsV1lNM3NLeU45ZXZhT3hrWlBlUGp5?=
 =?utf-8?B?Si8zMUNIM1JzWWNBTGI0OHRPYUlwMEl4VjFDTy9tdEczSytmcHlkZ1RRVTR3?=
 =?utf-8?B?L2xOVmJVOHlFVEg0YUU1dGtWUlZhb2ZZUDkyd0JuNXdmeTMyY2wyZndIeU9C?=
 =?utf-8?B?SWdiZWZ5L2JLUXhid1ZYOG03YVlrcGN4TUxxdHlxV0JrZm9YWldQTzY3ZG9Y?=
 =?utf-8?B?S3EzZzBOZHFIT0l6b28vajROZjBFVXVvQnV1VnJGMWEzM3duZUVJM01PQmRy?=
 =?utf-8?B?UHdlblN3cGFIUGEvdUJFSFZsbEFFbDJCL3cyR3FlVVQvWUNmeGh2dGpwU1BI?=
 =?utf-8?B?eW55ZHBIMEZRaEo5RjFNSCtackEwbUcwMlN2a1VuV2tBTGRFU2dBRGl4Lytj?=
 =?utf-8?B?dFdtN3J6OU5PMnJ6bC9kaDNhc2pEY2FEaUVnSDIrNVpRcTlLMGNjdzFWK3pL?=
 =?utf-8?B?aUh0ZW5qVmRwbTBDNlZOR1dwVDRibzZVSHAzSjd3blk0cTIxbUUrSStOY3Qx?=
 =?utf-8?B?ekZNcE9RZ1ZLRDZhTHdkRVhoZ3ZoVVJleU1TTXJlQ3FiWVFkT0hnNENOb1VW?=
 =?utf-8?B?cEd2bVBQT1Vta2lWaFJCY2pLYWpUTktzK1JpdllNaURUZGx4VHJGTE5zak13?=
 =?utf-8?B?U0wrNEUxUFlyQlpXZHl6ajdBU0V1NDdMOXU0WFVYaHJVcWhWbDlwUktqRzNC?=
 =?utf-8?B?MWx1eDNSSlFndkhJS0dPMlFUNzIzYlUwRTVjenVwd0dNMXQxVTNtRVJxejA1?=
 =?utf-8?B?dmNXMTJqNkUzU1NZcjUwbk85RFYyc1FJUUlaVXF0WEt5SWtNQjBGNmp2YVda?=
 =?utf-8?B?MUpmQkVTeWVHYVdIU0J1THZKNEx6eEx0T01LaEpwaTYvR0xNaU9rclhDbVh1?=
 =?utf-8?B?dThiZldYWlJUcWVPR1BEaTVldjZwM0N2eWJpVHBLWDRoU0NyUmVEZnpvWG92?=
 =?utf-8?B?dnIxWWcrMUdCOGgxemFpV25oL1AzNS9hUC9lVERiYVl2UjlNNkV5ajQwbmIr?=
 =?utf-8?B?Z1VGS0tISXZrbk44MzRtRERpbEN1bW9DWjNTd0EyK2YzNVdHSGMrZFVqdXpE?=
 =?utf-8?B?M0hrZWNzZnlRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(19092799006)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z3g3OHpyOEluL2x1dWh0K3Fud1VvZ25kUnc2VXFWdTkwWnRXaDVXREdqYUN5?=
 =?utf-8?B?NnAzUUFGUHhNK2RFODNQQmlpZkE0SDVPWVdTdStSRTV1dXFONDdzSWVsNUUv?=
 =?utf-8?B?Wi9FYWZubEw5dThWNHpTL2xVZFhyeWZjZVJyaWxOODVhWU9ibXZiSVphNkU5?=
 =?utf-8?B?b3h6am4wR3pCcGlWM0JFcGxqYkhPNnkrVE02ZnNJczBBU1lDR3ZUTC9OU1o3?=
 =?utf-8?B?cWdzRE01VEJnN1NmYVZ4UzhOTkxrQ1B0dExEOHhYV1VMSHNGak56OTU1aEFO?=
 =?utf-8?B?LzhnTkVEblhZN3NVK2lhb3V1aUFqU2QwYmpXeUl5VGRzSmVXQ044dmVLYnIw?=
 =?utf-8?B?dFh6VVhkQTF3S012UDAzYXNhTkY3cjB0NXBkVGpKZmRvNmtIR0w5Tk80ckN1?=
 =?utf-8?B?R1YrYmUvU1hYaitzdjZiVGRWeVYwcmZKWEZ2U0JscFVFbUc5RElDU1VKU3ht?=
 =?utf-8?B?SU4yYWR6TkIxYzc4bWJGd1BnL2IzUE9kMWQ3QlkxcVRRWWY5enpSR3FPVDBh?=
 =?utf-8?B?RGp3eVhDVHRGWEIzSGdlTDlVekxzR2JwK2h3YVVlYUJxeHRLK1k4UmVqRE9p?=
 =?utf-8?B?enZrdnVSQ2NYOXJzdURQUy9rU1FGOS9lQnk4MDZWZjNPTU9Rc1FJdWlMSVA0?=
 =?utf-8?B?U1pEWEdIZG9Ha0ZoL2hhWGJxbXk5eURuZ3M3UTJFcUdra3NYNk1rRy9pYjFE?=
 =?utf-8?B?N0kyNDZuMHJMSWxUY3E5Nmg2Y0FLMU5aOVgvbmNjVFJQRnlrUDBHZFRyaGtF?=
 =?utf-8?B?L0U3WTlRYjg5R1pmWFNCRjZPbjU2UzZ1MVp5MVcxT0NVeGFBUlRTREszNWlo?=
 =?utf-8?B?OENoWDQ2RlRqcGttRE1HTkdEOFN3SjJTdnY2OEh5NE1sSEQ4TnhrMWt2TmpD?=
 =?utf-8?B?NHBtWDBoM1dPMXJUaHM4RWw4d1ZOd1VSMTFFY054aG5pSkx3NjhwUWJWQVdi?=
 =?utf-8?B?YWpHajVoYlBsN01qZno2Q2h2WkI1QS9EVXQvMnRPOWtQenhHSU9jTW96RHU4?=
 =?utf-8?B?S1FsZ29EYWRvUDNYUTZPTllMdHMva1VOSUhjRlRudWp2ZnBWOVBSZDVIeStn?=
 =?utf-8?B?aDZ1UkdndXhTcVUrOTdhaWpUV1ppaEQ3aDhaWHpBUDdLRmpBMGMzYlM0dlNY?=
 =?utf-8?B?bVpSTS96eXFZVmgrTHFwaUtjUi9QOUNGTDZ1bHhib21FNURpYmtWaFM5SjVa?=
 =?utf-8?B?VmNnNE5lMEUwMStyTVRaa2puYnp4K1JBaGF4K04xV1NVTVVaNUdsM3VOaDBn?=
 =?utf-8?B?ZUthYTdmaFVTaWhuY2lDRnRJY2RGaHVFNHNVK3R5STB0T05zOGlENE03QlZq?=
 =?utf-8?B?K3BRU0daWGoxcmJvL2hrbE43d3VNa0tUVmVLeVM4cFZDajJiUGhKM05HZ2Ri?=
 =?utf-8?B?RXZVMmpTYmN0VGpvay9oVkVRV2Q4ZWlxREIyR3QycVJWcW55QnlOVXZFbk5G?=
 =?utf-8?B?NVRJU3VtZTJaajVlUThlR011Uy9MeEFYcTdTaWNNdmttaUtmY3NmRXlMWGZx?=
 =?utf-8?B?WlJTZ1VjZnUrdHZ5K1Q5TFVQd1k4ZlU1SkpmOENLcWpWaXlRMVZlaUN4TU12?=
 =?utf-8?B?ZzFXZmcvNWl1eCt2VEloUHc5cWNrbjdPUVFEUUlUY2hyMnQwRm9Sb2NHVmhi?=
 =?utf-8?B?WWxGSlFOelUvbFpObVVVRUNsbTVVM1Bhd2hMK0c4Z2NOeUNGTE55R1VGVGM3?=
 =?utf-8?B?TkhHWm9sdnJWUGxZNGZ3VFkxMDVZeTZDWlJYVXo5clViT1JNNVVOamdsa3lO?=
 =?utf-8?B?ZmtRQnhEL2Z3T1pJaXExZ1BPWkFsL1NibHhYUVlRc2ZmNFBScXg0eUlIWWha?=
 =?utf-8?B?SWNBMWRYaFRWWitWM1FyL2l0S1NaRHB0TUZpMWJwVGZqVWs4cWE5UFFjMU1S?=
 =?utf-8?B?Q2pTQzVwaU5hZFdKTGt0MnllTFJXV2hBNUkzcitWLzlDWU1qR2txeithK2ph?=
 =?utf-8?B?eFNVVkZpdEd3anBMZ2pRcitOR2lYSVMyOU5BV2traVJHZElCcTc2R1l0L3ZO?=
 =?utf-8?B?M3YvdDdkSC9aMTlCV0xSdXNRS0pMQTdCcjdwUkY5TWhncDRBVnZyQThyMnU4?=
 =?utf-8?B?ZHVUZ1BOaklhOEJWSno5WXFGcC9TMFFQcEpoM1FRRURhdXZ5emQyWXRDTU5H?=
 =?utf-8?Q?t0vakXJd2xRfnScPCwRVSzU7p?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d1c5815-b57a-41c2-2359-08ddf847b775
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2025 13:15:06.2037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GnMVp8zPEDKYycaZ1vAPik+ciSKmj/cQQ7lhUyYx84TOFUAqvAWrJr97wJ8jQO6NBY9kF5fDAKXd/PcIsiHUyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8833

PM runtime support is safe and applicable across all i.MX platforms, not
just those using the SCU API. Remove the conditional check and enable PM
runtime unconditionally to simplify the code and ensure consistent power
management behavior.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index a621a934a7ba5fe454e420d8dd20256d3655d560..afdf7ba73783512016c3016cd1bef395a28847b9 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -1126,19 +1126,17 @@ static int imx_rproc_probe(struct platform_device *pdev)
 			return dev_err_probe(dev, ret, "register restart handler failure\n");
 	}
 
-	if (dcfg->method == IMX_RPROC_SCU_API) {
-		ret = devm_pm_runtime_enable(dev);
-		if (ret)
-			return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
 
-		ret = pm_runtime_resume_and_get(dev);
-		if (ret)
-			return dev_err_probe(dev, ret, "pm_runtime get failed\n");
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "pm_runtime get failed\n");
 
-		ret = devm_add_action_or_reset(dev, imx_rproc_pm_runtime_put, dev);
-		if (ret)
-			return dev_err_probe(dev, ret, "Failed to add devm disable pm action\n");
-	}
+	ret = devm_add_action_or_reset(dev, imx_rproc_pm_runtime_put, dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add devm disable pm action\n");
 
 	ret = devm_rproc_add(dev, rproc);
 	if (ret)

-- 
2.37.1

