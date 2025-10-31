Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011017.outbound.protection.outlook.com [40.107.130.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7788829AAE3;
	Fri, 31 Oct 2025 09:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761901747; cv=fail; b=PpW5ARZ1yW3m9jP+XYbOlg3hv2GlADI84Ns6+pFZnGBKJZldqd1yKGFY0GuqMU0e8bWjKoiPqs+QYdmmwc3iQ+5zqvsiFGiTG8nDap3O+qE9ll9MaDp5wWDK2Gn7ALM/pFftl54fhvaLnsKdcnFwj2WBNY9bn4R3X41r9X/FC1Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761901747; c=relaxed/simple;
	bh=1IdvdlHpDhUNV3HXKNiupXlKwumYexWMX/ZPibfx6qA=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=FwVk82Vu4FsdaqOFMPRFNqrk8U9Yum1mKTAdY5i3m6xhgp2+aWKQ8uKY88cAIDpz4duzyOuJZdi5aakF3g166T3Ke6KJ4/sGM+5fRtTxnASIWFOdVFveCYpZD9OqCOEYpbodfXH7hsX3Aft+SItKaEgZwP0emKp99JWJX670pWk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ZN049zxF; arc=fail smtp.client-ip=40.107.130.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZN049zxF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=inu/aXpxGt3XLbjbERfyoTcgRNsOYkzQsdpKstw8sDZMGYRPDG2E8uqBTw/Rf/K43op+cPhsPzHFA2QXA7qjg1WAo8yEUXwHY/Lf4NTdHd3g53puCOBioTRbTTNvLa16nESu2+T8ugwxwqGvBx8etWW0574yY3jnszSOuZ/prCTKIGI3PLxVfcUKvBU6E3T+XTIFg0hgGnWV0Xmb4Vwvg1ByMGQhschI3W7o3mM6ceainZPCYQnYiZsx8NIlph5TcGJiDPQ5csHkZqlLsV27yqdrkPMKp58YyXDkeeWaAFjhTyEClR2DHISDs998NIL/6q4tIkkDd8SDR9vqSX23ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/7Cs+OapaXM4nL926QrgxJX2FA8iOchlk6ypwB3erGI=;
 b=Ui8OCC4zFTE/QjsCn1UPj/8wcWbrejv2wfEA2RMJMd8NI/pHxdD3oCZtWvAZ9bnQAQ9Eo2NbJgvUIBf+mq4bmvVF/NBI6JZ9JFs8iVZJzy59F/Zp8Hincs+G5/DHGs5mq92KH0f3POSSRuuUlHPHilUIGDYRVVxoJn+KXHwt/WkiXmMpIREZDkMSWxf+M7tuJNhebi77vFrZxSoIOD+TOD5oZIhzzIk0RQhiTUYHomZWpnlhmDzdt1qZzYP9rPIDUXHlwT0YAHb1eS5/57zkK8INf3ylLASh3ItqBH2fpTxalQy36PvZZMOlU4FnBK6q39I1DH95RzZ2l1pPxmXVMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/7Cs+OapaXM4nL926QrgxJX2FA8iOchlk6ypwB3erGI=;
 b=ZN049zxFKy9MAZYLj4Fu7cqvIQTap/MqxoXu4rUCrEino0+alXSRS2uzBee2qQvjZKQrnyZrBzm0+vppd0Wp0TRnVclWlmEGJUCl8YJUesWBbTCegu9nZd9yhwYDCduPd6QeNKqfRrWcWmOfx/wdVmDp9/C44qMrwsbgvGhSCIF74gL+kersVmlHgIaxd3Eqf1Bj8O9D2ZauWCcPWjLOdxQ8gWWFEBfsAw5Xpd385R8UYcoXnKUi9oinovjxWUNP+iZkqdMgdFV7scPdtbiV5xCiPFSmUHyioAJmJIF/XTrrpxWTaKvuQjWHkqQGSL/YdoQazo0XpvaFSdnTY25ESw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by MRWPR04MB11495.eurprd04.prod.outlook.com (2603:10a6:501:78::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 09:08:59 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 09:08:59 +0000
From: Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 00/11] remoteproc: imx_dsp_rproc: Refactor to use new ops
 and remove switch-case logic
Date: Fri, 31 Oct 2025 17:08:29 +0800
Message-Id: <20251031-imx-dsp-2025-10-31-v1-0-282f66f55804@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAI58BGkC/x2MywqAIBAAf0X23IJu9PyV6FC51R4qUQhB+ves4
 wzMJAjshQP0KoHnW4JcZwZTKFj26dwYxWYG0lQZXRqUI6INDj+BRmNWVOuZ5q7pqGohh87zKvG
 fDuPzvGnItaFkAAAA
X-Change-ID: 20251031-imx-dsp-2025-10-31-260b2b979258
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <frank.li@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761901729; l=1773;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=1IdvdlHpDhUNV3HXKNiupXlKwumYexWMX/ZPibfx6qA=;
 b=g5+ra0wzEriZKk6ccuv1UT/GjXT9ThQsRWQzEbquuqL4efzQbVPg7BjXNTcX7WizkQA3Du/zk
 +IdFYnp7dEnC7vCp4cUCyM/jEu0lb8Q5jAxCJQZhJgMDdMJowmsc03y
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2P153CA0010.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::13) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|MRWPR04MB11495:EE_
X-MS-Office365-Filtering-Correlation-Id: 3750aa47-846e-410e-71cb-08de185d2081
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|19092799006|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WHF0OHhIaWdVbjJyNmxzc0x2b3ZpWmo0UExRcWp6cFE3NUV1MGdxUUczWEZi?=
 =?utf-8?B?b0g2amhXUFEvTzF3Q0FIV2ovenFoZzNFNlNCbTg5TWxsZFphVnU4WTVFbXB1?=
 =?utf-8?B?QWhzN3NkNmNBemxwNTg5QXIwdWNnUjlNWFFad1RMZ2Y4K3JMS1BPOE0zL0k2?=
 =?utf-8?B?KzQ3b0p5VTBOQ0IxSjFaRFJmcVl5c2xrVVhJYWQ1cTdyVy8vdXY3cXZkV3pU?=
 =?utf-8?B?bGY1NEl3QmR5aGU4aTljczJ6Y2xoSWxFZnJIVkFNOUVlZzNQWVFnaU1KMlh6?=
 =?utf-8?B?bVNUVDVIWHZZcFRnM09WRU1qRVROeS93YmJrM2tWTlBxTzFrTXZrSHF2a3Z1?=
 =?utf-8?B?bnA2TTk0UEhFeWdVRmpDZFduYUd1aXB5b2JJbjVtUHJUUjVJTWMxTFIzSHlF?=
 =?utf-8?B?ZnFvRWt2TC85MFlHaFBHckcxaHBLTy9kTFUxRUpvQVcvbkRUdnIrWVdORHdY?=
 =?utf-8?B?VnRVcXdaR3ZlTWoxME9LQjRKaHM5NysvSlFVT0hGdHFldDVlL3lWc2tlWld3?=
 =?utf-8?B?VzVkSnhwS2NpZWgyZlF6TzdqZWhtclgwRm9ZbHlrNml6Y0F3UE40MVF1QjB4?=
 =?utf-8?B?UFFER2tJNnZFQlJxWk9qdTQyTklWWW9NUjgyajlIazJNWEVVZERick9RSjFI?=
 =?utf-8?B?WUEzcjQ1ME5CUUVXUVk3NkVIUWJnTEI1WFgzU1dvSW82djYxNTU4R29jV2tp?=
 =?utf-8?B?RDE1Yno5U3M3bys3NGNZUFNHTGNrV2ZDbmc3dDBWL0JUdFRzajQwb0VHWWp3?=
 =?utf-8?B?ZzM4enpIV0tHOHM3MUtoQ21nN2Izek0wNjY3TVpONXg0NnVTRjlCZ1VaNDdK?=
 =?utf-8?B?Q0tYNXZWblVPWUkxZnR5QW00Z1M4b2JsTkQzeVhZbHk2bEJRbDBEaGdkVXlC?=
 =?utf-8?B?RTVZL0FKQkpSRzdmTTlMOWtWY0JUa2ZTUHNkM3F5bEFZd2pBVjJYcVpVcmhi?=
 =?utf-8?B?VkQvVE9EcVVOU0JTWENCQmdFTGJyN0drb01iME81eDdqL0VJS01hRXhiNWk1?=
 =?utf-8?B?ekppbUdOY2lMUjVnRmU4NUxVWkNBY09LSWJZeE1DTExQLzBLNWw4ZUF0bm5T?=
 =?utf-8?B?TjduaVdSTWFQYmV2SWNYYnI3RkpETThMZE1KanlCbWU3TlBOblJHM3NuV1pt?=
 =?utf-8?B?YWUrV0l6NGFXTmc4a1BQdkJ3WXlUNVZ4L0tka0NGTjIyUUtPTVJDS1JEWXlR?=
 =?utf-8?B?Z0pqQjR0ZHVVcENBWlNXSDVXZ09kc2ZYbk53NEVhOEhLNkczNUg0ZXB2SElG?=
 =?utf-8?B?MEdady9zREJwdjdMbTJMZ1dPdG5JVG1MdVFhV29taExrRTJacGFsWVRqRG5t?=
 =?utf-8?B?akFyNTlOZzk5dnpwaVkrdGVFSkhUQk8rVTVQcmVmT1RjOVdXUjRMUHRpRG9s?=
 =?utf-8?B?R1pncVc2YmV2bzcxZVMzRm5UV2FtNFdVelhUclJmTWFNZis5U2w4RnFBL0dk?=
 =?utf-8?B?dUw4eGtkc3h1bzBhdVpza0x5MUhyYlpEZklGU0Y4YW9IZWszVzNPYjcxeHlt?=
 =?utf-8?B?R1FTS1VLeEhLTWdqbnJlNWJRdTdLOHRkWTExbW80T1NCSk9BT3pVTzVjaU56?=
 =?utf-8?B?RXR0UFpvekZmVCtnYnFSRWV6UjhjUlhlaE9FNUxWQ25TUGorUitmMWtUUkoz?=
 =?utf-8?B?OTN5bjAwa25Cb3c0UUcxT1A2TllwdXBKT1piQUJMbjlFWEZKZlpoRFQvMFJn?=
 =?utf-8?B?eVVhWXRadXk1TXowSjZpKzhvdXZacTRybnMvWUErTmdMQkEvS2RjdnNkUFU2?=
 =?utf-8?B?d2lsY21DcDlia3RGbTZMakZUM083ZGZSYjBzSG9jakdzMEtRUnJiOUtDWllN?=
 =?utf-8?B?NXhFOWhjd2JmNTFUVXJPK1EyMkJDM3pha3EzY3hMOWpsNU1yeTJNcUtBMzBE?=
 =?utf-8?B?aUdxRnhsNVI3VWJJTVZOdVUzVllwaXhsT0Y4REQydGJ2MllIcU5DWjRWd2Q1?=
 =?utf-8?B?SklQclA4OXNnWm1BMFJ1VmN4ZHlTWDMxeHV3MnlFZnhqRWZhYWd5UzlZcVd5?=
 =?utf-8?B?cjc5MmExaEJQcGROMW1kVzhLVHdURzZtWjZuaERUeklTYzdtZ3M5cHJqQXV0?=
 =?utf-8?B?NGYvZFAvMVBTeGczSGVmWXRvZitpOGNxRm82dz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(19092799006)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?STRFSTl6RHhHTEF2SlRZZ29hREZRdzNiVDFMK041ajJBV3ZxRzlYNnE5RHhk?=
 =?utf-8?B?QUNnUjNDNWxhRXozQXppNUJlMFFPYUpIMzlGTEI3TVRadzdzSHFSd0xGTTQ2?=
 =?utf-8?B?YnkvZk5EUVBsUGxDZit5cm9GM0Zuc2hnZlQvbGVPUzdwN2lUSVptL01aNXVZ?=
 =?utf-8?B?MDFPeXhmaW9CQkVOSVVqNzJtR1NBY2xFWnRNQVBCbFA0OXBqRjlsSEdjMStB?=
 =?utf-8?B?NnFiV1FBZzhsYzZXenlGem9vek4yRWVPR0ttdkp2R0E0QnF2RVRZc1lmTTV5?=
 =?utf-8?B?SW5xNkhMMUVHQTJnRFlORkFHazBNTWlNYVdpcFQ2TEs5aGpueFdIQnBSY3dT?=
 =?utf-8?B?M2VIRm9iYno3TFVOR25NOCtNZmU3UmlBUnhndXlOekNnNUZDeVBtRmJCb3Rz?=
 =?utf-8?B?YitnK1JBVlBwT3JiclF4Sno4Y1J5L3Y5NGJWTGU3aytSNUhMb2VPdWExOER3?=
 =?utf-8?B?YU9UdzBLNnhxUk5PTTFqd3pLYU1yL1g1RHZHcFQrNUJWK2lNbUVtcVlzUUNt?=
 =?utf-8?B?VGJBOCtDMFhPOFdjbXFqemZ1anVDLzROOXNjZGRvOWRqTXlvcHcrUjQ0VnU4?=
 =?utf-8?B?MDU1RVdIdjE4ZHUyblQ4UnJEamh6YWRQRlVQU01rNW81MUdlMWNqWWo2M2hp?=
 =?utf-8?B?eEZXTnVlUnpIV2Fid3FOSEFJbGgvelBKUEljR2FGVHh0d1EwemljeWl2dXdR?=
 =?utf-8?B?Vk9hbW50dmRGTVZHUmJKRzBDRGJNVjM4SlV5TlRsb2M4aGFxK0UzTDV6WThL?=
 =?utf-8?B?WVFqNVdLa3ZmQktqSzZ5M2hFcXl2MWgxUGoyUHJNQzdBTmtXYmMxOGtaRXQv?=
 =?utf-8?B?YjIxQ1IrWTh0VUZjejc0TklOS2l4ZDY0ZFlFSDVZZGdpNld2TWMzRGowZTJG?=
 =?utf-8?B?US9NZlBFT2ZMY2lSZERSUjZzSGFoSy9ieXp4OEllMlBrMUdXK0swaTVJc2NU?=
 =?utf-8?B?Uk9HQVgydEdGTXB3akZaVm42YkMwWmdmTE5DeGxZRmhsTllrWW9kSVpHZkFy?=
 =?utf-8?B?YkkwNWUveGhucXJiRTBZQWJJV012UkJQemRKNjgvRUhTVmlZQjF2VFduSm1i?=
 =?utf-8?B?YVU5TWY5ZlZVQXpETFFZT1NrZkhWa0NGdk9kUGVIOGIyalQzNWUwbFVBWkxk?=
 =?utf-8?B?UHFHTFd5WXc1YmlOc0pNcHdIZ25QMFdDU0tnMHRGNW1ZSllndTVCSkQ0RmZO?=
 =?utf-8?B?R3RLcVBaK28rM2tadHZBR0hTdzRYdzlKdFh4bVFhSlVaWEVUR0hrRGc4ajhp?=
 =?utf-8?B?L3pSM01iT0k1NXFlVlVrREtoeWFOZDFlZEoyWTZhNXdUUkdSeFlqRXZGSUpB?=
 =?utf-8?B?N1lxaEhxRjcrb0JIYWpqUkZHNjgvdmtmL00vSFFVRFE5TzNvTXB1cjA5cSts?=
 =?utf-8?B?R3NtWDZSSERmV2dUcDVKMFNjZzlyUHJsZytweWZwTUtBcUhTQ1hRcXhWdStS?=
 =?utf-8?B?UXNRYWNZVU9Kc3l4anNjVldhdEpYdkRuTUw0czcxQUt0V240UHBmbjJ2YjdS?=
 =?utf-8?B?U3ZNVEFmMytCL3ZHVHY0cFpsRWYzV3p6RjA2M3BqNktvRDRFckh4M3g4SXBJ?=
 =?utf-8?B?R0NTaitSRnlpZzhHQ1FGUzVwTmIrNDRqc2t4WCtNOFZmT3ZEVU5FK1BYN0JQ?=
 =?utf-8?B?akl1dW96U05yUmtaRFQvVnRUSk5qMk5wcWtxRW45YlZ2OVZEOE9lN2tsb0pN?=
 =?utf-8?B?RnQ3cVlPVnhkZUJOT2c2QVdSMGI0cE1PcnlmU0c5bmpwNSs0N0VIZklsbmU4?=
 =?utf-8?B?OTR1azdyQngyTWZHVjFxSjFXcXdFRXlaNkp4b3YxYWVQaHM4UWVTVFllYk9N?=
 =?utf-8?B?SW11dndaOW1vb3VuUi9zTkI0L3pnbXEvbXdQamtGbkhUVW9LMkRvZ0xIbUhN?=
 =?utf-8?B?aHNNSnE0RVo0WURWK1JidmJQZTZ5alZBYU9WUHBKN1ZmUkNEV1NsUURXQlY1?=
 =?utf-8?B?ZVVGRmRMQm83N2djeWp6NnBueGxub0tvZGF5SXJpdGc0S0R6WXE0SHNMSTNP?=
 =?utf-8?B?bUw0bXZoOWVPWjFqWDVHRHlBaHJ5dGRIcCtuckF1RTRBUDFhVTMrR0dzQlJh?=
 =?utf-8?B?WG5YckUrMk9SOEtCbW5vQUpXRkRqYkszZjR3c213WkdTZUVPM1M2M1dHMnhL?=
 =?utf-8?Q?hkarW13kUewFMY74Qhis2GQzs?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3750aa47-846e-410e-71cb-08de185d2081
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 09:08:59.1128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eHzNSj4OSpyUwNRhJeG2aA9eYqoKXbtN0wVUy48XkrVVGy1WKJ12waM0wH4hL8Ss2tbKw2AnowcXbUHdmj+8Ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB11495

This patchset aligns imx_dsp_rproc with the cleanup and modernization
previously applied to imx_rproc.c. The goal is to simplify the driver by
transitioning to the new ops-based method, eliminating the legacy
switch-case logic for a cleaner and more maintainable design.

Patches 1–5: General cleanup, including code simplification and adoption
             of the devres API.
Patches 6–10: Transition to the new ops-based approach, removing the
              switch-case structure.
Patch 11: Remove the obsolete enum imx_rproc_method.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (11):
      remoteproc: imx_dsp_rproc: simplify power domain attach and error handling
      remoteproc: imx_dsp_rproc: Use devm_rproc_add() helper
      remoteproc: imx_dsp_rproc: Use devm_pm_runtime_enable() helper
      remoteproc: imx_dsp_rproc: Use dev_err_probe() for firmware and mode errors
      remoteproc: imx_dsp_rproc: Drop extra space
      remoteproc: imx_dsp_rproc: Use start/stop/detect_mode ops from imx_rproc_dcfg
      remoteproc: imx_dsp_rproc: Move imx_dsp_rproc_dcfg closer to imx_dsp_rproc_of_match
      remoteproc: imx_dsp_rproc: Simplify IMX_RPROC_MMIO switch case
      remoteproc: imx_dsp_rproc: Simplify IMX_RPROC_SCU_API switch case
      remoteproc: imx_dsp_rproc: Simplify IMX_RPROC_RESET_CONTROLLER switch case
      remoteproc: imx_rproc: Remove enum imx_rproc_method

 drivers/remoteproc/imx_dsp_rproc.c | 344 ++++++++++++++++++++-----------------
 drivers/remoteproc/imx_rproc.h     |  14 --
 2 files changed, 184 insertions(+), 174 deletions(-)
---
base-commit: 131f3d9446a6075192cdd91f197989d98302faa6
change-id: 20251031-imx-dsp-2025-10-31-260b2b979258

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

