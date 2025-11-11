Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011025.outbound.protection.outlook.com [40.107.130.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0B52DA757;
	Tue, 11 Nov 2025 01:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762825298; cv=fail; b=E+A3IuUV2rF4aRrOEyKnBCuq1F7NpGlrwjLtTJoEjKJ9Ago0e2MDiz6IrMrFYximAjWMxoLUzhJe2GTbBmvk6kpljKb7afOQBlfs9CDx6eSg7OcggJur5E8vFgndFiQhzbafWvGJ1VPKJkYHCk5jBcR5iqlW3MsAIGtmyvwru7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762825298; c=relaxed/simple;
	bh=ij8t3n2nd8wDFjGcZXm532mzD4yk8mdglUqVtDdNe04=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=QmrMeLJPXs/WVKhkDC6CFPK4zlDxeNKSAsOAEopN6H+j3eAbiKl+2X17Heg7O04yLJ041DnwckPPF740HC2m+LzoxhiJdjkqyqtf16C0MjuT/MKRWzwfUan5ZJgsJM8GoEfCf7cpRhKzexpe6QpbXlDa0izONnRg6tFKUU9spHs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=d9YQDVEq; arc=fail smtp.client-ip=40.107.130.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="d9YQDVEq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dOgSv4IBPl7YqNhmf41hBOM+I3ay4y5yv6WN952CAyQJuz9xfms2LIFE30Rbbxj967e5JH9DaAexougjqxOp6SmSpYfsflZS/myZXmTpP84ED9bTJXf/2hqtlLxl/klI2j+DNMatgYIKGHTtjcG1OX/32ql5nw3v0QYEand4UYtILlWr2X68q9DknMIqaoWBnj7TY/MEZ+kVU305XYPr9nmO9OAIso0KrjV5E1UbrxnFzCA8TAZTXlPllATXtzj6jOSHGetxtpt8l7gC3GeOaApZoThcLjG7RfZBRQSryZqf4ovOHteF/L/5g7fohqyL8nNehxUUjOYJ+8nNr3APBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IyROMaN5c4nGf/mOynrdcZm8n83SzYFZ0UWSxxp3pvc=;
 b=vtU0OOZeg3/pXkhMnwlMeGGuqJchUlfPQ1r/zVA//qge3E/hRtFAG/Hee6aB7Abo8USBtAguThSG/4xCP2jUzh5Cdh931uwZ8JWZFS314J2tPFGBjSlXH02cGiugWtXvkLTcXPpNClbyOlHdvnHwO57/qy0OziDQudoskNRUd79kZLosMCXYP8r7vf0zKTEB+mu7zIcdWSjG1uy4LKxa3sZZCJg3zpdV/s5qJO64oY5EW9PTFeb6siFyjnzkLfEvJRq84ajCaUtP3oktltZtAQbMOYujka05BILsKDXDh0CoVbKzdl1dHHD+PPmz5PQRKMJsRl9Efkvdhj8JTFNvdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IyROMaN5c4nGf/mOynrdcZm8n83SzYFZ0UWSxxp3pvc=;
 b=d9YQDVEq9HRWZzlT9JVbAsh6/odhWWB4dXkti+kjSG9gLYC6UVuLwdfQnZVcNNyVAlM2AeV+o3Zp6wLuiU+F0dnPp6svl2+wQIuvp/cGethx6Fuybrgio6i8svs7u/5d9UmK7dLMHOlWMhzwoi9zSnHlZczEmXoST8I4Yb0dlVzyf5XfhcZrYb7LTR0XVtV2id6EhIN0onItoYNMSZb2Hy1YpANtxagnvuXzDXgMSJgW/8pGp2YvSiwcT/SqOJCBgxu9Hc8XsyarcUlrQa59pxb6dLS6cshGXAbbR8+yk1ebAsFAlq05EjgmyUI+rOTpumLfz3lPvt6KpQWTFjES1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB8455.eurprd04.prod.outlook.com (2603:10a6:20b:414::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 01:41:33 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 01:41:33 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 11 Nov 2025 09:41:12 +0800
Subject: [PATCH v3 01/11] remoteproc: imx_dsp_rproc: simplify power domain
 attach and error handling
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251111-imx-dsp-2025-11-11-v3-1-d05dcba737fa@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6fcf4cb2-eb61-4c5d-4d2b-08de20c371e1
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WnprZk1nQ215NmZGNTd0WTlCZVlJR3Iwd1o1clRhUUJRa0doQlNzQnhiM0Vo?=
 =?utf-8?B?ajgwdURvOUczKzMvVlhFTGxNODZPOTBvWENwcEJrdE95d2ZSUWlWNkh0SFlQ?=
 =?utf-8?B?ckdXQ3htVjlUVlhkZnFtc3U0Rk1GZGJsSnYwOWpweEZOQnZoWGZSU2wrRHkx?=
 =?utf-8?B?YmljcDVoOExmUGNlQmRVbjA4aGFKNWM3b0dCaW83RXc1WjZ3MGlqUXZZUjRP?=
 =?utf-8?B?eGtYM01lUjZIbmZFUXU2V1pCWDF3TWhZVVc4bVVrcVlINWUxbHFOTlBEM255?=
 =?utf-8?B?NkRlNHd3bkxJSFVqNUwzZERlc0ZxemlpcFp0Y3RzR2c1TncyZXZOdGVGdHY5?=
 =?utf-8?B?TEdzajJFbmpKM24vOEtTVzdtUE9wRk9BRjBrc3F3TjZmU2owd2NPU2xMY1Jl?=
 =?utf-8?B?dThTMlZRUzZ4bVFiL0tpV3U3ZzduVitCS3QrQzVId3MzWlVMVTZoVWRxSlRn?=
 =?utf-8?B?M1ZycjFRQzFNSUJZVHo5emRoSXhaOENPL0JYUFljUWkzeGtweExXWC83ME1E?=
 =?utf-8?B?YzJQZjlXVmRXMUhhLy9vbkt5NEF1ZVcvTmZrUCtuUlIyVTZBY2xwT3FnSGl4?=
 =?utf-8?B?Q3NaUGlFMll4ZGtEbDVrRjdNTjRvUnE2d2ZreWZOTktWOEs2dzFiMXZBZTcw?=
 =?utf-8?B?OUhJNWdSdURMdm9CQVNhWldNbE5Zb1Bac1ptU3FqcXJnV1FoMCs4SmlXNHV0?=
 =?utf-8?B?TFpvbitjUWx6VFlObFR5YTAxYTVTc2ladExWQWJ0d1MzNFlDQ245L0kxZkcy?=
 =?utf-8?B?U3NNOE9aVHF6b200Z2tUOVQ1UUtscEtGK0UwbGhSVUtmTk9KZmlUMkNubWJi?=
 =?utf-8?B?dnE1RnVoS2pSUDNXOVNDSzd1TUhaSFRGRTdoeFNLOHErMVFnanpCN3NOUFZU?=
 =?utf-8?B?Mm1rL3JIU3BKa3BOVjhGMGFXR1M5NW41N01zYTQvRUdQQzF2OVMrMEZCQWlT?=
 =?utf-8?B?aHRkTzAvdE1LSGhSSFQ2OW5GaEdORmlMdkhJbzNzZWxkRWJmSnVjdUk4bk1M?=
 =?utf-8?B?MDZjVi9HMFVaSzRxL2lPdjFGcEw2YzNJYmtSVWNxUVRVNnY5cmI4SEV6NTVT?=
 =?utf-8?B?Z29hc0w4NXhORXlvUnp2SEJ3SE94Z0ZLTnRQbEY2dTZPM0crbWc4RVBKOUdU?=
 =?utf-8?B?OFRxLzByMFV5cUJpbFJYK0s1Z2RMK3Z5YmJwelVXYjhmSlJKYVVNNXhCaTBk?=
 =?utf-8?B?SFJGWjd0RktEVnpVdzBxL1d1dTBLSUJaRG9XT29GRUdFcy9RcnlpUUpPVzBp?=
 =?utf-8?B?RFROd2FjOE1QY2l5K3FoZy9wKzVOMW1WUEszOE5lajNLZDBWNmE1NVpCRVBp?=
 =?utf-8?B?bmh5eTh1R2F2anQyMkkxUC9KcWk2QmRkcFRnTXdmSEFKZFdtRCtqUkEralVW?=
 =?utf-8?B?MGR5MEsySU1VL21NYW8wa2FDbUZYSzZJbXgzUkMwQmxnY1RScC9pZTFSdmlC?=
 =?utf-8?B?bWRvdFUwY0NFa2Y0aDJ0RXlDTE1od2djRTUyalFFSVhZeCtLcmw4SW9zZmF0?=
 =?utf-8?B?Qmd2bmlrSGJjdVZMRlpXNXQwam1Mb2pEQnVXZXZ1Wml6TFN6WS9hUXBMMCtL?=
 =?utf-8?B?VStXcmx2bFJGdGxTUXI1Z1NoMVMzVHBOWlVJUzBkWnBaREg0NzREbU55cVJ1?=
 =?utf-8?B?MnhHbG56OEhHUVl3TTlsNzJYQUJLMFhMSnU4eDNqTUVJbWNlRXNOdmhTNXhu?=
 =?utf-8?B?bjhEYTc2Z096RzdMRDlTZ2xMNUd3Y043cmxPZXh5MlVIWHcyUmUwRHZ1RU1S?=
 =?utf-8?B?MkUvbGR4TEZiVU0ya3l5djcwdnlNYjhPVVVsWHZ4ZWFwbFBqV1NNZGQ0RUpV?=
 =?utf-8?B?K1BLSUdsSFduWGlLQk1YWWpmMzRUOTZrVDVhS0JKTEQ4MkFIbEN6akQycEx1?=
 =?utf-8?B?Mkthd3pMYWkraXYwN2lsU1dtK2dSS0Y4cm15ZUMrTUErakZvTFc3WFJCR1dK?=
 =?utf-8?B?TGxPczFrZlV1ZjczTHVESU43WVpkeWNtS2xLK0VaYkdoWTE1VWgwb3pwbTRX?=
 =?utf-8?B?c2FpRDg5bUw4SUxKd2l1S3NEU2FuUkwwREttMzQ2VDVOa1JGa3dxWmZzcUJZ?=
 =?utf-8?Q?M/YS/X?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVRER3l1ak5LaEVEWk5LeGQ2OFZkdDcxcVFObGxaaHluSFhLblBhcUp0UXFi?=
 =?utf-8?B?c25LZElIQlFMMFV2Y0dWNXA1YW8wQ1YwbFJveWgvYUlTYnlMVDd5cC9xNGpN?=
 =?utf-8?B?YklZVUp5SFFSWlYvalpURlBlNmVsN2pDQWZvdjI5bjFEbzVpVnpoZzJnVXk0?=
 =?utf-8?B?MzhISTdpclJyTGk4QWhvT2pmOGdQOWNuTnF3Z1g2Z2J3NFNDckQ3aUo5RUxF?=
 =?utf-8?B?cG8yZjZsdUNEYWdnR3ZHVXo3N3JvUVlzKzk2YlFmOWJGUFUvMDE1VEdObStH?=
 =?utf-8?B?V3hyNzVkay9lNWZhREpyMFNsZ3UvTXZwTWpUdURrVXZtTkRRK083Q1FKY2x2?=
 =?utf-8?B?MFpaVVZXa2IrNDh6OXRTK3JXMDAvT0ZhN1JlQzdXMjByQTVobkkzSUdBc25E?=
 =?utf-8?B?WlFyWHBWWlk1Z2pSMm5TRUZIa2szL3lCREl4aFFtbTQvRW1HMHBaSkc0dFVL?=
 =?utf-8?B?NnRyOEo3TG1XTHZyOEtvUkpCbUtyVjAyYVpyMTdaZGw3cWpiYVRZbG1LSnRn?=
 =?utf-8?B?bW5JNWpPS3UxcG1kNk1DM0NvbVhKTXpEZkZVM1QzYnRuV3prSGZreWNoQlZn?=
 =?utf-8?B?eloySVhaeUl3WWNFd21lL1BZc1F5Rk1zcUJEZnRNNkIrRVkyR2drckhCTm1C?=
 =?utf-8?B?dGFEcjZoelowd01Da09vdVZIRjF1aW9JTGw4dVc4bUdsalk0eDhlbGhNYkYz?=
 =?utf-8?B?cnhoSkZaTkU2MzJrdWxlMkZrcDVCQ1lSTFg5Mit4U1dCQ2pDa2lxT3VHZy8x?=
 =?utf-8?B?MmVFQmM1aVpXb3BEdkVJdlZEeUVIWVl0bS8yTFlINkMvcmszMmVEcEdObHY3?=
 =?utf-8?B?YS81OUk2VXNyaWNOaDA0VC94bVIzSCsvQ1RIZWVtTEJIRWM5SHJxU1dUWUxQ?=
 =?utf-8?B?ZGliZ281ZE9Odm1jZkpHR29RMTRSOEF6Ri85WXE0SWxWeFhXQW55VEFoWVNP?=
 =?utf-8?B?UDVIaEp6dzBBSmVqMWFkOC8vQUxCb29aRTR4WHVBQVFPR0k1SHhDem5FdlE2?=
 =?utf-8?B?WElKWU5ZOVVxL2puSVJDVklQTUExc01pV2RZNEpxODZWZ3FYeXdXVFRXWDJ4?=
 =?utf-8?B?TzNBdStuMlZpbGtySzFjekFRay80V0F5czdvOHRUbU9IUmdLdjlxTlBzY05R?=
 =?utf-8?B?SWFteUFtdTVIOVpoaG00b1hXbkFEZWRoSk5JMHk0RUV1VFo0NnJKRlBvb012?=
 =?utf-8?B?akU5dStLZlZ4MkZhYkR4SldIMTZFejVYZ2xaUXJUVk9RWHFlWDA4SUlNUlRk?=
 =?utf-8?B?akIwaGlRVXJ6b0lQRDBoM0V2ajAvRS9nS3ZFc3VjWFZBbGVxeXFNODE3VWI1?=
 =?utf-8?B?SUI1TnRyaHRWQXNHamYzZDliVGN0VVRQRTJXdkR2ZDB3RnhkZHR4RURyQ0Rz?=
 =?utf-8?B?a2Y0OUlIQmw0bWZnWFM0RitaclU0aEhZMmNTSVJtMUM5RjNHbjVDOExVYzB0?=
 =?utf-8?B?TmdUQ2ZLSm92dFlmK1M1QzBsWFN2TlBYNGZldEFsd2VsUzVKT3hBZHhWVkxs?=
 =?utf-8?B?eVduQjdkYndjeVBqbXU2cEQrS2xIOFloRG9WcTR5NFBHZGxQYzg0N05GWmJn?=
 =?utf-8?B?YSt4Z1o5L1JyVUUzY0lPcEY4WEI1d1VET1JualZvQjlCVHhpbEFJRzFrZUUw?=
 =?utf-8?B?VGFueFVmRXFqQTZNT01KWWZ1VDZEWDF3cWZSdnhhUVc5SEcrQzZaRkhDWUZQ?=
 =?utf-8?B?YmRmUUdNOFAwVzhlNktJOFEyc0xqY1JST0x6elVDNFo2SGN1aU9ONk0vbCs4?=
 =?utf-8?B?R0tjanU3YVFkU1g5M1pvQnRKSXd0VjBDM0F4RFpYQkhzaUd5MS8zZ2UxV2Ux?=
 =?utf-8?B?Yy93L2FRSklORzNEUUtKRjZEaE5qcEk2b3Q2Y2RWQllxOUtOVjlxeHo0NEh3?=
 =?utf-8?B?eTdXbmhCYUl2RXZ6WXd2UGdUMERsVDMvdHNXQ2F2dXVYYmNNbTE3amYyUHdq?=
 =?utf-8?B?SW5rcXo1QkxERHBVTjNUSEdDay9jRVhFWk9BbTYyRFJtOWZGamVtek9JQm50?=
 =?utf-8?B?TTFkU0lLM3F3c2xHaHdvOTBuRWRqVjF3bXozdEN1WDgrbFM3anFtckRhVFUx?=
 =?utf-8?B?dDRBZ3B2MzlSc1Rkb3hrUE4rNmtldzFoZGRBM0VsNDA2T1JCMi9UTGR6VDd6?=
 =?utf-8?Q?yOi6D3TjpPcG9wBpEaUvJejuq?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fcf4cb2-eb61-4c5d-4d2b-08de20c371e1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 01:41:33.6100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6kjdzaFbEqtkcfa+3j2fHjEsfrSF6DRm3pr1Ug4bee4x8eWa37C5fPqe5NRapEb1PjRlsaQJgQNQrKr5nURAKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8455

From: Peng Fan <peng.fan@nxp.com>

Refactor imx_dsp_attach_pm_domains() to use devm_pm_domain_attach_list()
directly, removing manual detach logic and simplifying resource management.

Also replace verbose error handling in imx_dsp_rproc_probe() with
dev_err_probe() for cleaner and more consistent error reporting.

No functional changes.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_dsp_rproc.c | 29 ++++++++---------------------
 1 file changed, 8 insertions(+), 21 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index 6e78a01755c7bdc28cd93f00fe6f74affc3d96b0..c466363debbebe8f91b908b3bffaa32e9bf8b9a6 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -1062,14 +1062,12 @@ static const struct rproc_ops imx_dsp_rproc_ops = {
 static int imx_dsp_attach_pm_domains(struct imx_dsp_rproc *priv)
 {
 	struct device *dev = priv->rproc->dev.parent;
-	int ret;
 
 	/* A single PM domain is already attached. */
 	if (dev->pm_domain)
 		return 0;
 
-	ret = dev_pm_domain_attach_list(dev, NULL, &priv->pd_list);
-	return ret < 0 ? ret : 0;
+	return devm_pm_domain_attach_list(dev, NULL, &priv->pd_list);
 }
 
 /**
@@ -1186,35 +1184,25 @@ static int imx_dsp_rproc_probe(struct platform_device *pdev)
 
 	/* There are multiple power domains required by DSP on some platform */
 	ret = imx_dsp_attach_pm_domains(priv);
-	if (ret) {
-		dev_err(dev, "failed on imx_dsp_attach_pm_domains\n");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed on imx_dsp_attach_pm_domains\n");
+
 	/* Get clocks */
 	ret = imx_dsp_rproc_clk_get(priv);
-	if (ret) {
-		dev_err(dev, "failed on imx_dsp_rproc_clk_get\n");
-		goto err_detach_domains;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed on imx_dsp_rproc_clk_get\n");
 
 	init_completion(&priv->pm_comp);
 	rproc->auto_boot = false;
 	ret = rproc_add(rproc);
-	if (ret) {
-		dev_err(dev, "rproc_add failed\n");
-		goto err_detach_domains;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "rproc_add failed\n");
 
 	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_XTENSA);
 
 	pm_runtime_enable(dev);
 
 	return 0;
-
-err_detach_domains:
-	dev_pm_domain_detach_list(priv->pd_list);
-
-	return ret;
 }
 
 static void imx_dsp_rproc_remove(struct platform_device *pdev)
@@ -1224,7 +1212,6 @@ static void imx_dsp_rproc_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(&pdev->dev);
 	rproc_del(rproc);
-	dev_pm_domain_detach_list(priv->pd_list);
 }
 
 /* pm runtime functions */

-- 
2.37.1

