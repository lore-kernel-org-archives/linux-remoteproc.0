Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013053.outbound.protection.outlook.com [52.101.83.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0ADD2DE6FC;
	Tue, 11 Nov 2025 01:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762825345; cv=fail; b=S7L0kkJdE1h6LWJW7B7vjEOUdT+HzydGVPhvikoF8vt3wpEjKdI0dPQy98SVped8YRjV6cjy+sLrQ+snDeAiwaAqRDqNoKdqlVzoGIv5ZbJJ8Zrf4tCe3CMeBRHylp9u+eLlyqV6LPPMkFzv9U/Y+wO/5t8RJ+kWvLRpTNo7VuI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762825345; c=relaxed/simple;
	bh=W5HBerhV6V2HXlOuuW+1pXNUEUioYGPdX0YSTQ/tMbU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=SabvQckIf8CvetOp6H7gNs4c4wdgi32aEM+GOnWxOY1JgvzYZLXoSCc7mla2mbdCWXMfmrROD1/ZaAZKfm4PMlAucxYZnKP7V4CgP86TcS2lqKXLNkWKmqOokBl65SHYZnUgd1uCwqNboOUnbfjcQtbKiV6C5WdmFVvLxzU/cHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=VOdbKBXy; arc=fail smtp.client-ip=52.101.83.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="VOdbKBXy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BLf/aELASiHlZJ1MYyzK2nWZbbzZ6RdFl+CuIkP2aLgD1qTeIB6QXriwTmeQZfjX7giwiwPL1uiH9315Hum7cLmYqytiMmjDDOIOtCeZi74fw0mTSPcRpl3x1ol10SVfuigZT70VldQQ58vGZQsGApfyAtvdm7/RoXH0W2zo+YbEDaffe4UFZf0E7Ut3OMzpsb3FMiFiPWITb2809Md+4eYiR+p5CLgiE1Vcbuviku28GKTXWzgd9/SmGv9Tj/E/vWnbfTQPcNNz7q1gQiHKFJcN+TRGqDLVrQ4BeOya2fE/TWf02o8dAJX8pD8/efBfrulHx2dXTOA862/N1ymwdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=92460uPc1JawV3CNDNiLhEb4beTKipnm7MbBh8C+gJo=;
 b=zRWk0wpE1qPiBWAa4IT8oHEMeQhpV6Fefj85yXH6esapAQlWRMOzVPFWO2/BDrH/HcWfIEO7NPZ4NmkEKz4FH61u63ZD8krlfyHzUOcI84qmIEkVaxAoeU136V8RL2kX/EPKwBbwREy/+xslNZftIpQBolMPOHaMjICzvTvLKoOSyUV1oMOx9d/Kc+9IcsDuc+uRuuZ94Zg0d6XsjXLUJLxH7dP7jxbJWrryPeyA2ro0insVkI9IjCYlJtJW88vHhWNdZCTK9J5HOUSN40b5lH2nJuh5uBaHECquI/e2xKyraDWfLjOrLyao33ST5vvE2Dj9MqbnrxsHeDMicEyQFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=92460uPc1JawV3CNDNiLhEb4beTKipnm7MbBh8C+gJo=;
 b=VOdbKBXyL9cRdbW7sqQczYTd22W/7tI8WlmDbOEqjrELH4x1nixtQ9WytCJYCCTFZsybBQxBdoPSd0S0/Ylmsco76DpVvH8/9YktJtp9RJNNjqwWxJvjxUr4DyqUTl14lCSzIdq4XLoU2bov5APEQv5fxA1OuZ+krWc7KT9kcfFFMJW8opDdkLMOzyWpQdT8M4xxiYxdADZGnLe3aBunEkiTy+sei7DCZ2gMNxOuSS5WLHEfC9cVo7GIqoWb8lVvFu6S/ouh59nEejjbY5CAG0Ejy+yNs/uM50mqcyGE+sJ2b7U0uVMN3ytqedWvb+ofAslAr7HAWdg42gAVPyoHDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8039.eurprd04.prod.outlook.com (2603:10a6:20b:2a2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 01:42:17 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 01:42:17 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 11 Nov 2025 09:41:22 +0800
Subject: [PATCH v3 11/11] remoteproc: imx_rproc: Remove enum
 imx_rproc_method
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251111-imx-dsp-2025-11-11-v3-11-d05dcba737fa@nxp.com>
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB8039:EE_
X-MS-Office365-Filtering-Correlation-Id: 573b59a6-7e08-44af-8c8c-08de20c38c2f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UXpmUlpUNHdGTDlMQi93UEpyR2RHRlM3QUtsU09mMXpvQ1RMa3BVb2cyWjUz?=
 =?utf-8?B?dzloN29ZdzhWUTBERVJrOUFjMjZCSHhRNVkvcFd2Vy9oSGlzRkUrSTBpTTk5?=
 =?utf-8?B?MXEyK0x6Vi9IaDR1eUxmeFJXMjVsMVB0am1jNUdVdTRXQW5FQ2tNc09yRFlU?=
 =?utf-8?B?VTM1UWtDemJ2VG1GNWR2eVdYRDVJbzA2bnRadng3U2NMQkozcnJLOWUwWTd4?=
 =?utf-8?B?QkdHMVlZU2UzUWpIbGJESnlMa1dHRnVEdTJWZ3JsUytuSEpnWlJ5QW54dEFE?=
 =?utf-8?B?UFI0ZDJTNTc4Ti9ZbXFjWGlGdlNFUWpjZ0wwekhZTkF6M010K1h5T2YxMGVE?=
 =?utf-8?B?NjBSQ0hWaXNuSTJST2MzeWZlMnB2R2Q2Q3FSTUtpY1FOYjhuVEZZTVVsSUx4?=
 =?utf-8?B?T1RLVkNnOE92aFFlbE9yOVRFL0JXTXV3Mm5SUlNIdWpxT0NLMzZ5RHRkOUxB?=
 =?utf-8?B?RE11aU9PMSsxMWZweHp1dGkwUkhuaGlOOHlZSkEvUisxRllBSDExMDdRRmc4?=
 =?utf-8?B?UXN0N1RacUtCek1qek5aOTZyWmRXTWJSdXpvS21YNTZGWUdYYTJLZUNzWDhH?=
 =?utf-8?B?bXlhUlp5RHpZK0dkcDhLOEpLR2ZXK1Z5LzhSaWt2OVVaQjFsR2tYWFlZcFB1?=
 =?utf-8?B?TTJpOFRNcmw2cklGS0ZCL1lXWk5OOWRMMU84MUNtenIvSnZ0NHRFNXNjbkpV?=
 =?utf-8?B?eUNwOWtDMVp6VmxvZW16VWFjUWJXc2gxdkc0RTVwemg4N29FcGpuV2liekY5?=
 =?utf-8?B?ZEF1THF2VnNVQzNtU3dRdStxM1FCbFIvbC9SUVVob0lISGZHV1FjcTlQOEU5?=
 =?utf-8?B?T0RzUTFTS2w1TE5GMDVFT29DWnpmMUw4eU1VUlJvdVFaNzdjWmNBcFRuVVJy?=
 =?utf-8?B?byszemJqMjFwRUtBWm9tVEw5RmJGcWNIV08yZElveDU5V2FVbDM3TWtHYXVW?=
 =?utf-8?B?OG1OcTcvT0xwcm1QRmEreCsyeXNqYWhPNHhVZHBaTldEbjVqTi9jbjFaeDVZ?=
 =?utf-8?B?Y1VlK3NoeGtTQTQ2QVZZZXdaQ3lRMlBhbi9FUWdmNGhxWmE1Tk9WR1h2M0VW?=
 =?utf-8?B?SHpPQXRnUndwZ3VPblo0TDRJSEN6TkNZOFJEQzA3OVlCb2gvWituMXI4NGVa?=
 =?utf-8?B?L0FXM0tTMEtYMTJEVlVNN3VaZmYxRHFYUUNYdklxbkxpRnBRYnFQSmkxWDMy?=
 =?utf-8?B?MkJOSG5tK3ZFSFV5R1FQUDB1NUtESEhtYndXK01FcE1TYTcrSjZHcmRYazI0?=
 =?utf-8?B?N2ZFTkpwZFZ5UXQzQTZQOUx5Nk5iUU10RmtWMEl3K0NKNm45YlVWdGJPUjh0?=
 =?utf-8?B?L2NsM2orSFYxd0dBWFlBRzRzWTErN3JkQ2JLOFFsckNHUmhtUkQyMmYrenVu?=
 =?utf-8?B?YysvOExTN2ZmaW43RE1zYS9rQmI5bkJjNjExM05ONG12OGxwVm8zSG5tWEhz?=
 =?utf-8?B?Mmt6UzdvSWNlMkhhbXJsS2VESW1jd25FYm1iVDR3T0E2RHIvOGlXNmtkUXIv?=
 =?utf-8?B?VzYyRHErckEzN1hNaHRqTFl0Mmd1SDA2QnBRdjdqVG5RY3o4OUQ3V0Niblg4?=
 =?utf-8?B?cTUzK09FUUhPTHpOOWJldFJ4TmgxSlMrdkpwb2NQVUcvYkFab2wvRzBOc2k3?=
 =?utf-8?B?K29xMmZ2WlNlYjBsRG5jOEU0cEs4RTJtcVFqaUc3Tm1lWVpDaytvTHY1U2dj?=
 =?utf-8?B?bUlCb05maHU0UXRjWGl6NmlkQzFibHRxOGpzaGRRTnRxam51bmZ2dFRRZnF2?=
 =?utf-8?B?d0kzNlFCWW0rb2dQNXdYQjFSRlhqOVZKRmJLK0hSVTlacXNjZHlOV1lQQWpG?=
 =?utf-8?B?Tm0zSjVMN1JnbzVLKzRZZExmQjlWTGkvZGRRTUVxcFlpbTBGZnkzNzVMOEtS?=
 =?utf-8?B?Uld5cVIyUXRKTFdqSmpuY2dENjB3SHFDK05Hb0x2UGdOK3E1VzcrdGZvNlUv?=
 =?utf-8?B?Y0xEcllqa3AvZG4zMERzbW1WMkdweHhLVnlYa25iVEgxc3E4dWNOV0lmQ0Vn?=
 =?utf-8?B?ZGlCcTlWS01DRTdBSkU3RlVhTFJUREk1TnZUWFlmaEJ1R0JvZEprVlhyeUpY?=
 =?utf-8?Q?a74zln?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YXRTOFRJVmVNRm94ckNpUStZajRsYWgvQUJJbHBXTHZsSll1ZUF4UHNGa3FW?=
 =?utf-8?B?UTd1ZG1KS3dtRVI5bEcxNEZ6ZHVYYlZQUG5CU1J6eXhxWm5TZ1BJbXFUOFli?=
 =?utf-8?B?N3NTWnBCYjV2V09oSnpwWDluOWpQTkVFNnc2YWdsRmhoNW5aK2tEQmlXL0Zv?=
 =?utf-8?B?emhvTGZwL3VuWWV2QTh1TTB2eDFDOG13UFBvTTNMTFlYa1JkZjBZeFJSR3I5?=
 =?utf-8?B?YW1ZYlFXOWF0WVJlcGxZSmVQamRIWGIxR1VwOExLaUxPalJxTm5iU1ljZ0V2?=
 =?utf-8?B?ZXNDMDYyUnN1MkxnNTVNTEMxYURmeitZdjJOSVB4S0FJekx4VG9KRUtZaU0z?=
 =?utf-8?B?czAxQlNRaTk5SVNtQVVBNXBkalY4ZnE2UDFlWTJIYnpOSVdlUmc4NXhOenEr?=
 =?utf-8?B?UzZlNzB2U1puV2cwVkNjelY1YjlOOGhoZGJEUEMvYjllaW82M1A0dU1JRnBo?=
 =?utf-8?B?MmN0SCswenpicnBXNEk4VktCd1NhSmdXYzM2K1pwTXVDQVJXWHdMTlNXS2hX?=
 =?utf-8?B?bS9jL0U0M212Z0s3MjFnVkVJcWErNmR4aS9GS2F4K2ZkUldkK2ZTZVhXQVlR?=
 =?utf-8?B?RjVBZ0FvRSs2OHZrTTJjNFBwU2hlaVZESE9HVHJFSmMvQmpYcSsvTnBscENZ?=
 =?utf-8?B?cGFhWFBWd1JML0lra2FYUG01MFlnRmlnRWc0Vk9NU1p1VFRyVzF0RDU5UHlN?=
 =?utf-8?B?TTdjcGZTSWZrRFBsTFRkRVRFbCtkRHN1eUJkNHpXNlhFRFdDbEtSbVd5VFJo?=
 =?utf-8?B?TVhXaUlJQjlkSTNFTjJpbDB0WUZURVBVMTdKOTF4QnB0ODBTeklZdlJiNUR0?=
 =?utf-8?B?dnowckhsbWF6Mm1CZ3UyN3h3bWtOUm5oMFFPUXkzd1BYRTBEZjVtS0VjZ08r?=
 =?utf-8?B?bCtBVHk0RmNlbVBJd3dCOExRcmptMWd5aGd3Q3JCNGdtbFRkdkt5aW5wNTdx?=
 =?utf-8?B?Z2dnckt1ZGpxVzAyRGkwMUVyaVZTdjZwVWs2UFlhUkgxWjhJMFhQdlpha0k3?=
 =?utf-8?B?UXBmZzMwNWhTNldIaGlJNUFjajdIbXUwUVNOYUJoMkFYQk93bmUxZHUwMTN2?=
 =?utf-8?B?Zkgvd0lrUTFtUGZLOHpCRHBybkRpTHRIa3Y1WHk4R1dITW5KOWd5aDlNWGhR?=
 =?utf-8?B?WUtvdHlqZ2hjd0xwSDlwUHd6SzhsL1RWSzVPMTgyeEEweDlUUGZtNng5U1Nx?=
 =?utf-8?B?WnhBNlZidFJ3S0NiVzYvMEJtVEp0Y29ialJDTWVtSm9RZ0NqaUJSaVlyVHNC?=
 =?utf-8?B?bTkvRUpLNFI2eXRiQVFmL0FrOGE0NHRGaWRhVlVKSm5xRGc2bHdzNk42YlpV?=
 =?utf-8?B?aWdBckM2bHZTWHFDUGVCU1pDQUJ5Z3RSN0xFb2QrY1J2Y29ISS9GQkM0RURG?=
 =?utf-8?B?VEd2dUZ2Z3BxRHdTQU8wN0Q1emxIcmZXdXA1Y2IvM2ZRZXhmTGdFd0tKbGFT?=
 =?utf-8?B?L2ptMysrN1pJeE04MEVCc2pwa1hGWUlJMEhTL1NYSmppNWZ1d3JUcXdJNTlk?=
 =?utf-8?B?SkUvOEgwUFJpOHZ1d2R4OHloTHhMdFVXUVNOSDJRbEhHR0o1dkNQTVJTM1Iz?=
 =?utf-8?B?YzEwNm1hRW01RHJnUHZwd0dSenRYTkJjTDYzZzJrbGRNUkpkTVVnNEpTZjBR?=
 =?utf-8?B?Unl5ajZURFdjVjJxY1BUWWdRK05tOHNkd0p6TFhKV0M2c3hMVTNITzFvbGFS?=
 =?utf-8?B?WXkwc3VEalBISnRGN1U0bll0SVZmMWFTWWRsTjdBd2Znc0Z2cVFRMlNnZzJx?=
 =?utf-8?B?Y2t2T0pmRHZpdEliU203UUpQa3lhUFJCYXd1NzIvcDMzSU44NWNHYjZsRitm?=
 =?utf-8?B?ZUxVMDZ5UUhmMFFhSmQrdmZjYlhyS0F6ZWdJeHhyQUNiM01RTFFhNUZVZnds?=
 =?utf-8?B?eXFIbjhIc0k0aE9sN0RDYVRIUnZFa2hYd1BCNmV1VjY4MVYwM3ROd0RGb2VJ?=
 =?utf-8?B?RjlpanZkQzA1N2IxQmZGcktDK2I0aGduL1ZPRjB3SUlINEVBSjMvbGZyeDdw?=
 =?utf-8?B?MEdHUHZUNWhRTlc1cWIxUFE2TXRkRGtPRFpRWW9zVEVhZGlMQjlJYUd5Y2lw?=
 =?utf-8?B?L1Y5TW42WUZDclZndVU1Rmw3ZUFTZzBjMk14MUlYTWdTUVcrTURpM2N0SEpP?=
 =?utf-8?Q?VMad9xkSAAEgp1YnLjq/BVvTm?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 573b59a6-7e08-44af-8c8c-08de20c38c2f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 01:42:17.7065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zu4yt/GI4mRfObnTGYMJw3g6Q4hqnWxU/P8Z8Us51ZLsPzMQtsfOIiAynQAuSLg5HUvN6/xt5OUzWJbJjVOOiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8039

From: Peng Fan <peng.fan@nxp.com>

There is no user of enum imx_rproc_method after moved to ops based
method. Remove it.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
index 6a7359f05178a937d02b027fe4166319068bd65c..1b2d9f4d6d19dcdc215be97f7e2ab3488281916a 100644
--- a/drivers/remoteproc/imx_rproc.h
+++ b/drivers/remoteproc/imx_rproc.h
@@ -15,13 +15,6 @@ struct imx_rproc_att {
 	int flags;
 };
 
-/* Remote core start/stop method */
-enum imx_rproc_method {
-	IMX_RPROC_NONE,
-	/* Through ARM SMCCC */
-	IMX_RPROC_SMC,
-};
-
 /* dcfg flags */
 #define IMX_RPROC_NEED_SYSTEM_OFF	BIT(0)
 #define IMX_RPROC_NEED_CLKS		BIT(1)
@@ -42,7 +35,6 @@ struct imx_rproc_dcfg {
 	u32				gpr_wait;
 	const struct imx_rproc_att	*att;
 	size_t				att_size;
-	enum imx_rproc_method		method;
 	u32				flags;
 	const struct imx_rproc_plat_ops	*ops;
 };

-- 
2.37.1

