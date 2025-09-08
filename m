Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010049.outbound.protection.outlook.com [52.101.69.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E22B30B50A;
	Mon,  8 Sep 2025 13:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757336920; cv=fail; b=swfSw+moyevOsZuB36DmkbAbSw+yrhbTZzk5/rHZFiT/3WeBpZKSW5smdI1UxWVh1+4625um+Ismj3wODsoAKJ9g5ZFVrehQqY0e0VBn7XuZ/Gkl488TK9xSGKVSi/3j62HAf0RsUvifS0Vp2ToY632QlxVHDjlrKNdo22Fi0UU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757336920; c=relaxed/simple;
	bh=QZXlEQikAuUOqUKmc/lGqjDpflBIiIsbMFPmPyBJmGY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=PAAYf23HoNAVX2Uef8tXkPy/MNH0KPZYhW15x+2NZ8Rbw/rhIUDeUF2Ybg1S1KOqtJ8hNb3Rcawqk5XtY+AHr2h5K85StV7E+jolZduT9xpt7iaDNBWgq2Kxm5Mh/25Pa02TpskTZcxUFm0k9Zf/ZO2GFjBJrEL7B6HifP/3b7s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=DPv4CufL; arc=fail smtp.client-ip=52.101.69.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="DPv4CufL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u2nt4gZdxneFKA5nlOWQh6VcVTjgijedT2Hwq/+SnjXEwwgrFjlwMaZFO66UTnr1xOQ2bKPp8tdfXYgc6s9eddqNF1okO0qQ/3e7ui83tCy7dnsKPpmwfxjH+0iLdAScqeThxvj5TzACDXAqGCfeeNJYRApZOQR5mJhbrVYA1A9s2WV4S9Yjzg2oFHqd1/fx0Ud15kcgw3A60IfSCtQm993zZuMGpjfBpg7PXFFrJ1795m6kBxiHxf/keWDFVgLCJqoU9rl03hKG1g25E6an+ZQ8t1NhGHYD/0JotubTtNiOEN1MLhNdamUZndwqFYOYRLEVYhD8BQ7ATCPJXQ304Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=taEOQ/PfzJIy7+UcqqVKKPYnzK8wVKYoQ6TgL5CxEok=;
 b=vI8cRuQmnlINuowKB8meDSsedoQ9w9o0VxXuxQcjgadVkbZRfewPJh3AfjNIgmzZ1go+821xAwzLlR6rJ3NNP1BSpkF8rXQchhKtttT5MD/9kHwRBmV5xwwIs4/9YUFVx1kymqackWRLT7pGuZvOVHcAuF+AOnOCS+AeLHIIv+8O1jzqiVh+lU4PuEGZ+THpT8/f4Di4A+f0jaCDuH4ku36QOsXIyhSYK3Wum42d3TuWh2WP8n7fpA6azpRXQoc+VOYPAWfNWIg1DSZ3b+26v9ALtpgt1LWPUi07iC08Agge1PT9VN+qoEGKRIoiWWGC29c0y7+mglovZVXmCTyU3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=taEOQ/PfzJIy7+UcqqVKKPYnzK8wVKYoQ6TgL5CxEok=;
 b=DPv4CufLJE6VhwQwdE3yX2gn5DBOy+C0XEc7JNn5VTWb6lSXfEV/O3tDbehjyQPEeTXTeaB/a7YZ4PT/+LXCBIMymL02/BktDTNjye3+5534DPurzrecZ72ECIHpz1YgG/CEYR4jr2smn21vzL4lvoM4u3oawZfs/xb9XCEEd7WdT+RfdeTLaQHakDgmCphhfT0ZAqz8ICu2m7AX8Q9CLH0c48bkC4aKlnTqPUwGBPfHfjjRdVz0YSlePKjEQ4X+kmBha2/H8+G2MIbPsCAY1amxmh/ZTxlRXq5YvAHM1JEOlcU9J35ClZTnCZRYcjToaiPMMfMdKgLhw+zlvAAryw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.12; Mon, 8 Sep
 2025 13:08:34 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9115.010; Mon, 8 Sep 2025
 13:08:32 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Mon, 08 Sep 2025 21:07:38 +0800
Subject: [PATCH 5/6] remoteproc: imx_rproc: Simplify IMX_RPROC_SMC switch
 case
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-imx-rproc-cleanup-v1-5-e838cb14436c@nxp.com>
References: <20250908-imx-rproc-cleanup-v1-0-e838cb14436c@nxp.com>
In-Reply-To: <20250908-imx-rproc-cleanup-v1-0-e838cb14436c@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Frank Li <frank.li@nxp.com>
Cc: Hiago De Franco <hiago.franco@toradex.com>, 
 linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757336884; l=5425;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=QZXlEQikAuUOqUKmc/lGqjDpflBIiIsbMFPmPyBJmGY=;
 b=9T/o+1jeG2EIx9rItJ6HjsBZ3PPMOM1DNpnAn6jFfFig/gQBZ23jxBRj9df8jTOLiJzQpijiV
 b+p+YhXEIP1C0U3m1zFzUgavmzVK4Qd7WyngeL5dHAsoT7p1bWOtg47
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0022.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::16) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB8703:EE_
X-MS-Office365-Filtering-Correlation-Id: cc7bb463-5ab2-4b56-4f17-08ddeed8cfd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|7416014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NkE2Q0pzS2hoTjdrbmgzK1haS0dNYjZmeHE0VlBoRHVCc2kvV1FvaVBycWdE?=
 =?utf-8?B?NkwvQnNDaThvb2ZMUyttUGh5VUFZbzMyVzNvUTREOEhSamVRenVUaEYwTGZs?=
 =?utf-8?B?QnNDZmI2ak50Y3ZDSW1NZmx5Y0hOQnNlcHc3OTRXbGZuZGpCSjRFTERpK0RV?=
 =?utf-8?B?UVJ3dTZ1cThqTXcwWHFHeGhKcEFYYmYzQlVYd20rQW9LRWZaRERvRGc3bDQ3?=
 =?utf-8?B?Tk0yWjJDdXhkcUN1VU9IQms0bU5oSHBGNFBaS0hjMklYckRzT0UwRkdQZkZz?=
 =?utf-8?B?ZSt0MGhCdWgranU4MTBEeUZmdFN0dTdtV1V0YTZTL0JoYUtvNjh4Wmo1UzRV?=
 =?utf-8?B?OElQUzdMazJLcDRDV0VhZWdlSXFKZW1vZW1yRXZEVEhFeGNZaExYM1U4OFBL?=
 =?utf-8?B?V1FwMVJCenIyK1BmZ29MOFU3bmFGZ21DQUlGekJKMmVvQnFsajMyOVZ6cGRy?=
 =?utf-8?B?cElQc2Jjcm5YN2JTbUlqV1NtNEhnZmRXS0ZicHB6dHhrQUUvcDluNkxBbzhp?=
 =?utf-8?B?cWVhNEpoVy9zR1dIemx0YkdXRXloUi9vcHM0QTE0Kzg2QU96TmQ3cFFtc0Ru?=
 =?utf-8?B?K1BJajFHTWsvbmhkcFJVMHRsRCtwdXBYaXJkWWE3MXg3Q1hRVU9SbHZIK3J5?=
 =?utf-8?B?SUt1NDc1SVVMc0ZpT1pjRjduYWVxbVNmQmtHQXovRXJOUjFpMGhORjYxRmtM?=
 =?utf-8?B?WndxdnZxdHpVV0lWQVU2QnUyampQOEFQbmJESG5SZFg3eWZGcklWZkZMMFc4?=
 =?utf-8?B?enJ6R1g3NDIyUTM2M0V5OXFkR01sYmNmRTNNUWhxTTR6NmlQaDlvV2cxR1pz?=
 =?utf-8?B?UnZQTEt4c0oyNmU4T0JhZVZTRFRWTlluOGN0aDZiSElwcHV1ZDB5OXIyQ3Zv?=
 =?utf-8?B?MHgwT3NPYzNhejNSWUF2L0tRVDd3R0dpdjlTRkZmMDVXTW5zL1dENFVrd2VL?=
 =?utf-8?B?SjBzaFFwV2hjQkk2dWx2cXpwOWgxdkdvampHTk01MDN0UU9ZSE1pTG04Y0xW?=
 =?utf-8?B?TlR2Skw1WVVXc25vcFR5VWkrQS9haUFEaTBhVUhiczFvR3JiWVVvSDhOV0xu?=
 =?utf-8?B?czhnNS9RREZ1Yjc0dzlxQm1jb1Z1MmhjeUR5NHRBSEtoS0pVVDhmSHlFVks3?=
 =?utf-8?B?aHdEa04vVHM1eGZJL2duendYSzE0bmM3cGFLeTZraHdpV29SeHJWUGhHUGNF?=
 =?utf-8?B?dEpVdUVrRWdGTnY1MTE4RGx5alIxYk9JY1IzSzRtelNJbkNZazR3Ym13Uko2?=
 =?utf-8?B?S1ArbzIvT0p6M1o1WHZPdTU1Y2VDNnlzZHFUbmVOK3UwOU5HQmxMRy92cmtF?=
 =?utf-8?B?TTdVU0NpVzBkQlQyNXFnbmI1Y2VpUThHOVN6SDArNTFYeWtKK3pJQmg5VUFq?=
 =?utf-8?B?MCs3T1F1RUVONkR5cEpJZFgwUzFuSUwzY2ZPc0luQU1lTWp3NXh1UUJTcGtS?=
 =?utf-8?B?WDlhSmtWdUNoNUU1Z01JWnJRZjgxa3FWdHI0aHJPQi9ucDJVSzVBSWRha0pH?=
 =?utf-8?B?VFJ6Rk80cHI1YkMvUkJPdTAwdGhFN3U4TXBtV2Nza0NybW13UGlKaEs5Sllw?=
 =?utf-8?B?YWRMTGFxTlg1ZUY4R0Z6VUxFTVV5c3lCY2drRTR2eHVacXkzd0U0TzdkY2Zz?=
 =?utf-8?B?blY3OWxPSUdaajk0L1FYa3hTbkVvWGpDYldWN1dYM21aYS95bUovWFJzOE5m?=
 =?utf-8?B?L3VYbWh0M0ZOL0NjSkkzVUtidldkS21ST05yTHdXeUM5RUloUHVSTHVXU3A2?=
 =?utf-8?B?azliYXArenlleXM4N2JtR1pmbldPRUZ6ZmsyRGpMY09Rd3hwVjQrR3FkYWR2?=
 =?utf-8?B?bFkvcWRjTFk3UUI2OXdNUGdxN2NwTUsyZ08yTFZFQVgrTVRBL3pHbzN1NTN3?=
 =?utf-8?B?cjFHejk1Ulk2cHU0clVGWGNFWFdOWElYbmZPU3A5N2VDNXlsUHlGemJRM3R0?=
 =?utf-8?B?eG5wU1MyVmxBVFJ2RnRJbllRR3A2MWNPYWNGYjhydDFvUkpsbldGVUNVQ2R3?=
 =?utf-8?B?c0M0bjIrM0xnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(7416014)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWlydXZQVmFDZHBTYUtGOFlQSVcvd0JCelFFcHlTU0FIYmZxMFJha01BNVc5?=
 =?utf-8?B?SUZjVUhiVGMvVnB3OUw2OFlFa3pCeUZQdHladVFWR2JaZmthdENDcHFGUXlq?=
 =?utf-8?B?OUo3bVk0RUphNjVsSUlDR0VlMXRHSmdUSGE4ZGNONXJteS95eHJ0WlFjUHpL?=
 =?utf-8?B?d0Q3UlRrMmI1bFQ5SlVsM2l1ZG9pTkxXbSs3YjJ4UkZYNkpsenJhSlNXMElT?=
 =?utf-8?B?eVNTMHpXNUxtSjVpZGNXam5Dd1FHd242R29sMEhVWVMvS29sM2tqZkxHSmVs?=
 =?utf-8?B?R3RlNEw0Z29lS1JvM0xETEZkcEg5b25TSnd2NXZjWWI4b05idzZ3Y040RGw5?=
 =?utf-8?B?aXVhUjJaVUNlL1MyOEU4d3FwZWpaWk51ZzNGZWpzbWF6TFdWbTdOZHhuT2lO?=
 =?utf-8?B?dUo3Nk9wZUFsV01KK3ZSYUpnbXB0UzlOc2tGVmdIK1krVGt4RVJHcU43d1ZO?=
 =?utf-8?B?bGNpRG5qNVdPSXd5YTg1MWlVeHh5ZDZvM093d2dvayt0U2ZmcFYyV0pMUHlM?=
 =?utf-8?B?R2FCWFhTUkEyZGo3ZWR1TlFvSkhMNlNBeG1BTHZia280aUs1c0dWWkZiU2pu?=
 =?utf-8?B?b2hDVWU3R0pKZGt5REJscjRZN1VxcDBJN0R4ZFhvdjJRTy9CcGEyVytOeDVY?=
 =?utf-8?B?TWdzR0N2OUx3K2k0eDhWTkFtMlhQaVg2S2RBekE2ckdjYU55RktFbjRpbkxY?=
 =?utf-8?B?N1FTcVAvT1BmckhzK01zS1p6aHFYbVhqVWkwN0xDS3dmbEtlMm9SSDcvdUht?=
 =?utf-8?B?S2d1L1N4a2FGejhlRU1vZFF3a0VyTHgvM3E5RHF4QWV0TlRaRVdkdE4zVk9M?=
 =?utf-8?B?NHdvbXNqMUVnZWtsclgyMWxJL0pHeVp0cEYwcVlGUVJSU2tmTEFwd0tiWlpP?=
 =?utf-8?B?ZnhxdE1jR0Q0UXE1VkNIT0tiOHJWTzZ1T1dhOFNZNGZiRFdOYnZUOURqNXVE?=
 =?utf-8?B?d3RqVlRhYmpTblNjQ2lCRUoyaFJMdkRKak80Y1RERVJMZkFVY3F4RFNPVDRM?=
 =?utf-8?B?T1FLejI3bWlWNWlCVGMyZWh3RHBFSWF2YlA0eUVZSFlUUUtOSGN4MzA4b2VT?=
 =?utf-8?B?Y0hvbmVoMzVpRTdtR1RwTTJRVHZPWE5ValNTSUV2cDFmYWhVbHBpTWFFSkpq?=
 =?utf-8?B?alBUYjloM2xuY2NsOTFkQldiTkxKZHFVY2l4am5vc0Jac1U4L3BQdG5OMFBq?=
 =?utf-8?B?QjY0YWM2cjQ1bE1TRC9GTkpPSFJZY2tSaGo2RUZCaTU5VjJYQzA4cVVBQ3Fo?=
 =?utf-8?B?RW9rakVCeThWcmtkMGF6RHgxbHdZSFZvVTh1QThyUXBWdDZkTUw2UG4zeGsx?=
 =?utf-8?B?UWwya3QySUFXTU0yc1Iybk9hWmp6TEJ6SXBwMkVHMXBSVlJrYXd2MHFUZkNL?=
 =?utf-8?B?OGpEbHdmSjhNZmhyaEd1ZW5yK0Jlcm9Jb0dpRkNYaEV0cWZFdU1VY29PaSsx?=
 =?utf-8?B?Q2hXZzYwaTVRdFUzc21ZY0RndkdGYUxScStFZm5ZeG5jRGhHRDZvUkxZNnhB?=
 =?utf-8?B?SmJVWlQ4cjlkSkpkc0tNa1FWK2NUbmxEbFNKcHBTSnRpNlNmU1p5QmdpVVVa?=
 =?utf-8?B?aVNjWFFPMkxUcTBxbG53Nnk5VXdhbFFIYXRTRE9VdkV6U0Z3SmFSL1FHSlJF?=
 =?utf-8?B?bG1kVzRHNFFnZlZqczlYdGdYQk9UWkpRWWZvMkxvUGt0VGxwQUlPNUlINXJl?=
 =?utf-8?B?QXVrWmRJZzJ3dVlqSTdyYXZYVzJHQXFkSldWOWxhRFMycm82aHdsNll1dzBV?=
 =?utf-8?B?VzZFRmQzMCtMM2RXZjNPNUJic0I2bi9KYmRqRVlxa3BhWmNPVlFKQjRzTFpk?=
 =?utf-8?B?bXhNbFZYcnRSQlk1WElXaU5UbzZpeUJzOEF3WnJFenA2ZGp1SHFSOVFlMExn?=
 =?utf-8?B?Qm41S01VUGZJVThFL0FhQURDVDVBalVuUGRDYkZGWXNxYnB1bGxtV1VCcklo?=
 =?utf-8?B?L2wzQ3ZwS3AyWW03elJ2VnBpR0JYOWN0Rld6VHRqMGk5ZjZsb0JkKzVOL1V0?=
 =?utf-8?B?MWx0cWhXbmptaENBeEhCTUtMTUZMMGxhUld4bnJvenVuSzMxZlFxSURUeDdT?=
 =?utf-8?B?bUtGSEsrSTFXd3RhYktib3d5bHUzQnRWTU80bWRpaGxvc2Q4MEppZkdTemxW?=
 =?utf-8?Q?ho3prqDdVg4wfe/AQXNLXhVMP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc7bb463-5ab2-4b56-4f17-08ddeed8cfd5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 13:08:32.5097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NG2mdC4YkYjtmsCw7ucgJn2a+eqkKo1cmvsR/xoSBcZXd020iEeejPZxlUHI/42uGbUZx3ZU6xsysBPcaRW4Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8703

Introduce imx_rproc_arm_smc_{start, stop, detect_mode}() helper functions
for all i.MX variants using IMX_RPROC_SMC to manage remote processors.

This allows the removal of the IMX_RPROC_SMC switch-case blocks from
imx_rproc_start(), imx_rproc_stop(), and imx_rproc_detect_mode(), resulting
in cleaner and more maintainable code.

Since this is the last switch in imx_rproc_{start,stop}{}, remove
the switch-case.

No functional changes.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 69 ++++++++++++++++++++++++++----------------
 1 file changed, 43 insertions(+), 26 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index ea34080970c6a5a9b035ef0d389014b8268660a9..5fa729f4286f6ac939357c32fef41d7d97e5f860 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -285,6 +285,15 @@ static const struct imx_rproc_att imx_rproc_att_imx6sx[] = {
 	{ 0x80000000, 0x80000000, 0x60000000, 0 },
 };
 
+static int imx_rproc_arm_smc_start(struct rproc *rproc)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_smc(IMX_SIP_RPROC, IMX_SIP_RPROC_START, 0, 0, 0, 0, 0, 0, &res);
+
+	return res.a0;
+}
+
 static int imx_rproc_mmio_start(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
@@ -308,7 +317,6 @@ static int imx_rproc_start(struct rproc *rproc)
 	struct imx_rproc *priv = rproc->priv;
 	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
 	struct device *dev = priv->dev;
-	struct arm_smccc_res res;
 	int ret;
 
 	ret = imx_rproc_xtr_mbox_init(rproc, true);
@@ -320,14 +328,7 @@ static int imx_rproc_start(struct rproc *rproc)
 		goto start_ret;
 	}
 
-	switch (dcfg->method) {
-	case IMX_RPROC_SMC:
-		arm_smccc_smc(IMX_SIP_RPROC, IMX_SIP_RPROC_START, 0, 0, 0, 0, 0, 0, &res);
-		ret = res.a0;
-		break;
-	default:
-		return -EOPNOTSUPP;
-	}
+	return -EOPNOTSUPP;
 
 start_ret:
 	if (ret)
@@ -336,6 +337,18 @@ static int imx_rproc_start(struct rproc *rproc)
 	return ret;
 }
 
+static int imx_rproc_arm_smc_stop(struct rproc *rproc)
+{
+	struct imx_rproc *priv = rproc->priv;
+	struct arm_smccc_res res;
+
+	arm_smccc_smc(IMX_SIP_RPROC, IMX_SIP_RPROC_STOP, 0, 0, 0, 0, 0, 0, &res);
+	if (res.a1)
+		dev_info(priv->dev, "Not in wfi, force stopped\n");
+
+	return res.a0;
+}
+
 static int imx_rproc_mmio_stop(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
@@ -365,7 +378,6 @@ static int imx_rproc_stop(struct rproc *rproc)
 	struct imx_rproc *priv = rproc->priv;
 	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
 	struct device *dev = priv->dev;
-	struct arm_smccc_res res;
 	int ret;
 
 	if (dcfg->ops && dcfg->ops->stop) {
@@ -373,16 +385,7 @@ static int imx_rproc_stop(struct rproc *rproc)
 		goto stop_ret;
 	}
 
-	switch (dcfg->method) {
-	case IMX_RPROC_SMC:
-		arm_smccc_smc(IMX_SIP_RPROC, IMX_SIP_RPROC_STOP, 0, 0, 0, 0, 0, 0, &res);
-		ret = res.a0;
-		if (res.a1)
-			dev_info(dev, "Not in wfi, force stopped\n");
-		break;
-	default:
-		return -EOPNOTSUPP;
-	}
+	return -EOPNOTSUPP;
 
 stop_ret:
 	if (ret)
@@ -867,6 +870,18 @@ static int imx_rproc_attach_pd(struct imx_rproc *priv)
 	return 0;
 }
 
+static int imx_rproc_arm_smc_detect_mode(struct rproc *rproc)
+{
+	struct imx_rproc *priv = rproc->priv;
+	struct arm_smccc_res res;
+
+	arm_smccc_smc(IMX_SIP_RPROC, IMX_SIP_RPROC_STARTED, 0, 0, 0, 0, 0, 0, &res);
+	if (res.a0)
+		priv->rproc->state = RPROC_DETACHED;
+
+	return 0;
+}
+
 static int imx_rproc_mmio_detect_mode(struct rproc *rproc)
 {
 	const struct regmap_config config = { .name = "imx-rproc" };
@@ -981,7 +996,6 @@ static int imx_rproc_scu_api_detect_mode(struct rproc *rproc)
 static int imx_rproc_detect_mode(struct imx_rproc *priv)
 {
 	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
-	struct arm_smccc_res res;
 
 	if (dcfg->ops && dcfg->ops->detect_mode)
 		return dcfg->ops->detect_mode(priv->rproc);
@@ -990,11 +1004,6 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
 	case IMX_RPROC_NONE:
 		priv->rproc->state = RPROC_DETACHED;
 		return 0;
-	case IMX_RPROC_SMC:
-		arm_smccc_smc(IMX_SIP_RPROC, IMX_SIP_RPROC_STARTED, 0, 0, 0, 0, 0, 0, &res);
-		if (res.a0)
-			priv->rproc->state = RPROC_DETACHED;
-		return 0;
 	default:
 		break;
 	}
@@ -1170,6 +1179,12 @@ static void imx_rproc_remove(struct platform_device *pdev)
 	destroy_workqueue(priv->workqueue);
 }
 
+static const struct imx_rproc_plat_ops imx_rproc_ops_arm_smc = {
+	.start		= imx_rproc_arm_smc_start,
+	.stop		= imx_rproc_arm_smc_stop,
+	.detect_mode	= imx_rproc_arm_smc_detect_mode,
+};
+
 static const struct imx_rproc_plat_ops imx_rproc_ops_mmio = {
 	.start		= imx_rproc_mmio_start,
 	.stop		= imx_rproc_mmio_stop,
@@ -1199,6 +1214,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn = {
 	.att		= imx_rproc_att_imx8mn,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mn),
 	.method		= IMX_RPROC_SMC,
+	.ops		= &imx_rproc_ops_arm_smc,
 };
 
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
@@ -1265,6 +1281,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx93 = {
 	.att		= imx_rproc_att_imx93,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx93),
 	.method		= IMX_RPROC_SMC,
+	.ops		= &imx_rproc_ops_arm_smc,
 };
 
 static const struct of_device_id imx_rproc_of_match[] = {

-- 
2.37.1

