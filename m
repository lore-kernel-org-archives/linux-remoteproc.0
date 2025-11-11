Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013016.outbound.protection.outlook.com [52.101.72.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D30347FD3;
	Tue, 11 Nov 2025 01:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762825314; cv=fail; b=lu8zWBqa/BadPoKIPc9sgevkORwgTjXfWVSyhgLDfvAuJSAjDirQs0g+ArI0/JjaB3Kc6SS/di3uQLPt2aEoaiFU88LyWBOjrllGZpz+BHi3OS/9MLE4T0yis8dMrhoWZR+HU2fpvKM083ijIUbzp9StxMUa1RtbBNzDoZAp0QQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762825314; c=relaxed/simple;
	bh=Fq5IvWSmKCviejA/PZJvB+ddjqBumt7WRoqyafXnxBI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=AGZcZ6mPSnFpmIr4T8Hbc35m+cfyAE7/nekLHc3gAHMFQUTnGTwr21Oo7R8K/ejIAgwL1C4NlGUIj03qoXzpNroC0QMWyxwgn3XVl25VAqOQSsb7wVHaLmQ0LprSPFwJUFjCywxrpcZl/hB4wOvRe6T3OzIHFqZcOLbEe5swK2w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=RrKdygFO; arc=fail smtp.client-ip=52.101.72.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="RrKdygFO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NkwKBCR4RRMfT5Nvb4usogPFppwf4qeMbGhvbW80k10zDV1Ugl3ac4eaYMx+iKiWS6w3rjoVEAnh4T+I1JDJmLUJjJFGsiFIN5bNIPwjGvaxgUIbbHlATY+OAhOxYLXE6bJdS8M6YytAvzWoWJEb/Mz/Au2gSvW9req7XPIEramRenoFt68Z+dmc63N2UqqQhqGusb3ktpkFNFea3TK5hyjCRcZiv1MbOqFzWbK9iFCBLpQHVtl5n38N+b2Z5LOtj57wMmvtO1xrdQKTU6nzuFf7NGRW5OLnAVfYYLPEKxW7bkARfilvEe6G3RtFswyN78I/p1h8JCtUwHLoV+k1LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1hZfPcFU0TTXuNLWx4bPXq9j2hRbCP44xdcc8ZXUF1g=;
 b=dguOfI8O0vbIklY4PKMvlXMJ9ly9l9ABJtgieQsDVdREk9XUmGmPVvJT6+/JiuVjnACnlJ7mB4aomks/5NXy9eX9BfxkMuQcuxJSSE+d66pYpFlkq3j/x0TrW8U3qDPzSdRHy/fcyIKf19E8lE/ezQmstUvvDc94zxQ7C/X7iSWZuqMPL+K9j3Zlq/gE3VtKNdZYB6QcvGKenzS4JaI/w/WwizgcfsoaxzTlVY3xSAWn7rS3x8qh1oULgDaOylLN+zpLfqSzv6+lMXzhTVGnv0ISB2EFKoh0HuSi8EPp3MJG5RAUv0VYWNXCsgs6XtMJWn8hnSpcQuEnggZnYsHcLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1hZfPcFU0TTXuNLWx4bPXq9j2hRbCP44xdcc8ZXUF1g=;
 b=RrKdygFO7Bi3I7tuLVs7yYA9Q7pBKHNPxjeDj/cpy3Tl2Pr3JnsK7/VNy+kU/BxIxOvqt0HOyuASx9O0Mh0MrMPvsvGMExe8hEDTAq8hD14dwLRYhimI90qxQ8nH9KZpdYFit2BUh1k+knfE/ODw5YuBOv55HoW71dlaUdv2e5rglp74iWalk01HCtfNPkoah9fIDQpC3IxFQG0vEom+Ai9SlJFfh7X8OQA6Pj9+drvxLfisJovEaSVBh0XshjA+mRGR5mOv6j7G9jUwDTp7WRolVOlKrUGTZj5/Mwtb0in5oio09kII8F09vkjGIyRfz+CsD9qi5K9TMIXKyHuuwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8039.eurprd04.prod.outlook.com (2603:10a6:20b:2a2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 01:41:51 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 01:41:51 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 11 Nov 2025 09:41:16 +0800
Subject: [PATCH v3 05/11] remoteproc: imx_dsp_rproc: Drop extra space
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251111-imx-dsp-2025-11-11-v3-5-d05dcba737fa@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 70276013-22d8-4aa0-f8aa-08de20c37c53
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U1dXU25BUnBlZE54RkI2ZTN4WXg2Z1R0SzVvc1E5U1BHT1h6MlNHQ01uQVdW?=
 =?utf-8?B?bXQ1ZFVoTkQwKzZVOTVmc283Rk5PckFPbk5xRjNwdVdjdklJRHJqWXh0alZa?=
 =?utf-8?B?cE1iL1JXeU1kK2g3enA0MnROTEYxSGFDaHpVNEFVam1oeUd2M3BKSWhwbEZh?=
 =?utf-8?B?T0h0am8vOWhTT01tQUFScmRIQW16REkyOFBnTk9OQWxmVzNoVnlxM0h1em9q?=
 =?utf-8?B?YlNocldCdmRZdDdFb2F0T0srbERSckg3L2JmN1dZNHp2QWpNcit6M2VwMEYz?=
 =?utf-8?B?RGxLVzVMMit5aS9SeTBKdG1VMUs0bkVnN21XbWZ1RFdyQXBzM3dEcTdES0tj?=
 =?utf-8?B?VkJ0WVRCSkhYc05wRlpCSXNqZENLd0JQOWJETm5OVXc3UUdaWHRJN1hieWVx?=
 =?utf-8?B?WHQvbmxzd1U5WHM4WEhnOS9uTUZ3RVdhMGs5aDJlbVBCYm93SncrTkpmUUtO?=
 =?utf-8?B?bDJRUVQ1QXdaZElFTzdoNG9icC9sUzBRanF0NEtyOG9qamdob1c1L3FEWi9Z?=
 =?utf-8?B?N0hFVndnTE9JS2dlVzN3U29LMFRzbkZIQnF1blZmRUFNbGMzd01LNXV6MUJD?=
 =?utf-8?B?VWFpd0FQTDdueFAwanc5UTVzcW9uc1FOd3VVd0ZWTGM5SE9HK2tsU2ExeEMx?=
 =?utf-8?B?MWdaQ21XMHAxRUlQM1REb1dORTl0Uzk4aTVXRElFUGNiQ1BWZEJBRmhOK2ls?=
 =?utf-8?B?NzVxR3RiNVRHb1MzWmg1b1YrcnlwaXltUnZuMGp0cnAxS1E1ZmpvOVRxR3Z6?=
 =?utf-8?B?dlJsTVJqQzZ0Y2ZCbDl6QStaWm5yNVZWcWxQL0JSdjBHQUFpc00wSlZoVXdS?=
 =?utf-8?B?dEJmUFRFMEw0NFd0c1BnRlI1bm5VSDBtWG03YlM2OFAzQ1B4SFZJQ0VzN3VE?=
 =?utf-8?B?Qm9ocmxMb0pHeTlQNjlaKzhYbnBMTVBHZXBjOXcvQVB5T0RDZmZ0ay9LNm9L?=
 =?utf-8?B?MndUZzgybWxOdXhHeTlUVDEwdzg4VDlmalFYR3A3TEh3d2t6TjhwdStiUUM0?=
 =?utf-8?B?MGlZeE1VOFNFQXhxNjBDNEZpa01wMWt2RmZIdUdxM1pxRVVaekVqWnExYytE?=
 =?utf-8?B?cVhqek5pd0JDdVcrdU8yYWxKSGVCV1NVRGVUU3JIMndDaGRVZE9UeXNKMS81?=
 =?utf-8?B?dkt2Njhsc3lzVHNxTVdPUU9LTlRQWmo3WUU3OHdSeFhLUGFrSjBwUTBub0py?=
 =?utf-8?B?VXJoV0dHNmliS2w0TnlDeFdZaFZvTC9SZXV4Qk5UMWFxemQxQ2lXMzV1aXZq?=
 =?utf-8?B?TVpqWEJRbEZmdVBXQUticWJuekpWcngrWEp3ZTh3RmVZb3ZlSGxoK29SN2pa?=
 =?utf-8?B?ajlDQUZLVTI2cDE2QlZNVDErRmtQdUVGLzcrQWNpa0JYVCsxNk9lVTc3eFd6?=
 =?utf-8?B?WUtud1llMUxCRUNNdU9qOWswSlJCZmhUa0xWSlNYQVdESG1qei9qblBZL2Vj?=
 =?utf-8?B?YUNlSERmY1IzQ0R6aTJSTGNqcUNNNEJRcXpWcXJudkhLQkZJSm9PNS9xcHdX?=
 =?utf-8?B?dDM0bzh5VEIwUTBMb3RNa21TWWZMSUZhSXUwUDA0K1kwVFc3MFI4UFVXMkls?=
 =?utf-8?B?ZE9IUnNrTUxrY1RPUi81bHpkcHIzdkxZcEhmcDNZeFFRMys2S21YcGNwWnIv?=
 =?utf-8?B?ZktoOXE5R1Rxc0cxaVVVMDBxaW82T2tHYnlYTFkrMHpsdWppbzV6WEl4dDR0?=
 =?utf-8?B?Ymxza3hVTEhRTlRuQ0RYTHN2N3kzTjJMdkc2am9McUVxVXdRcFBoV0JieEhp?=
 =?utf-8?B?dkdvYjJaRGdFbmxrUzE1MlhsSTIxdG8zR0hWRGd1U3ZabEZvWXZTdUZiT0Nz?=
 =?utf-8?B?SE10c1BkYXVmNTE5d1lJOUtubHlNZHpqYkVhUVh0R3hKRElKQTFYQkJabVJM?=
 =?utf-8?B?cDV4SXJlUjVFT2E2M3hqSkZJQ0V4NWpDVFFTdFVDb1BvVFVHZ1hCRW8rV2t3?=
 =?utf-8?B?Y0hONTlKbWZ5clFpd2FvV3JVZjBsY1VlN21NNGdScThiNnE4cTdFeFQrdXRQ?=
 =?utf-8?B?L0svZ3JINUhkTlRNdWJxWjNVb1oyT25sK2RvNWgwemg5RlUxTWxiVy9XcVp0?=
 =?utf-8?Q?gAkBcu?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MnNoOTFGRGZuaW9pa0FDUGZUL29LU2ErR2FndUlrMWQwcGdjRTh5MFpnOEgw?=
 =?utf-8?B?QzZqT3BuWUtSODNtS3pwM0VhWWtpdmMrNjlHQ3J5ZklRTWgxTFNxdU8wRkFi?=
 =?utf-8?B?R2JOaGxiNjM1Ulk5Q2ViSjR5dUszdHNSQ2g3L0VRRHlqRTRaL3p0UmxJdTJM?=
 =?utf-8?B?eFJ2dld6RE9GS3hXdXdod0ZZTHJNTUZWVHpkd25qTHhKNk5UbXF0YlpEK29K?=
 =?utf-8?B?VGY5L3k1YjlVNlRGbXdEcjU3VWFJUkIyeit1QU9qWmgzRTZrQUhlRmFiRkda?=
 =?utf-8?B?cDU1UVhtenVPWTNMUHd4SURLQTVoTEh1cEVqN2M2UFZPcm5Cc0FLOTNyYnY4?=
 =?utf-8?B?VERGSC9PYWoraFluVzZRKzBZb21NS0I1TEVMMkNsdnkwaWEyam5IdmgwZFRL?=
 =?utf-8?B?T3RrNmxrRU1PUTJHd2gxVGtqVE9zdWRSWDhyUzk2SDUzR29QcHdNL2NVbU5K?=
 =?utf-8?B?dzl5dEtoUDgrbXRjTGlNZldzSXZzN2FKYkV4R3dnT2c4Y3Z5dHBkM1pQSFIy?=
 =?utf-8?B?aDZDV3IzZFVNTm51U2NPL3RuUFBPVURPSkFEdW5qdWhGYzE1a3JXWTFXV3Z1?=
 =?utf-8?B?V3MxZGhUcnJGWSszclZzc1YvdE9UR3lSRXI3Q0RvaGs4YUNQYWhLVFRKN1VY?=
 =?utf-8?B?WFhZL2srTDA5SG42S0s0YlpjRnMraGFROUIvdDB3WjRpK2RyK1Z4cUFQOXVn?=
 =?utf-8?B?SU1qRXlaVFE2eXpUMUh4YW40VkR1WlJDVjduUWVJUjY3bm04enhOVld6Z3A2?=
 =?utf-8?B?UVpyWS8yTkVSblcrMVlvcElRSDdIYVhJWVpvSVhDdFpjZVh4MjQ2Nm9zbzJT?=
 =?utf-8?B?NzJXVVovMFZQWjZhRURYWlRsdEh4QzkxS2V0ano0bE9TUjNzNWRJZmo5QWx2?=
 =?utf-8?B?b2JnTEtEL2Fkc0dnM2lUNVdBWXZJRGpBYWxUWldERCtVUWpOcDFrNEtEVU8x?=
 =?utf-8?B?bDdJRnVuRk5pRzdSM0E4SWFLdnBnWGlxaThmL1NXL1I2VysvRmRvZFo1Y2xW?=
 =?utf-8?B?d3BBejNrcThHZGt1cFcreU91cW9XQVlHSkpTN0FGYUxGVU5sUm95RzNNRlR4?=
 =?utf-8?B?bXE5RVZHYjVDdS9oWlBsU21QMlhrZ0h0aldwcEpuT1ZQd0NzR1pjRnhwYXh1?=
 =?utf-8?B?UTV4dlJCMmZoWnR4M2ExcmtZNkxOeTZNU0llMHhiQk5FOWExQUc5Z25Ld05K?=
 =?utf-8?B?UjFkcGFmbHdwMms2SSs4ZGpXMVh3MTU5TGtVU2Z2c0RVTjBEMEVyTXQvYkJG?=
 =?utf-8?B?MnVJT1ZEdXJaUjRONUx3UlVSZy8rc2F5Ny9BekpwR2RHeWNyelNPYk05U0dE?=
 =?utf-8?B?N2diaDk1WUI1eC8vQ3V1Y1BETjFpTkNDSDlMYlh6alNLZDVIYUVUTE5kRm12?=
 =?utf-8?B?ZWNjR3ZYS3R2eTdvUmNZV1BtdW1FNXEyOFJacFhxSDlRa1c1bW9ZVDNJNis5?=
 =?utf-8?B?Q0U1cEdIK0orTWdXQ0VLbVZic3dHbjM0b0dGbW9yNi9reEFEWjVob2QwdEVL?=
 =?utf-8?B?ZGJxdmtLNlpEK3JHOFBvYUFvcGpFeWJCWG1OWTA3QkdXdHZqNVFiWjlWenE4?=
 =?utf-8?B?WFpjVzJkbW81czY5QWpYU2c3ay9rZWZEYTVqQTN2OW5tMFg3RVJBQS9lSmF3?=
 =?utf-8?B?Y1pINEQ1OXBJOFdkWTQvZmU2QXhhK084MFNlRTk3amdaL2o4bHFYNy9lQmUr?=
 =?utf-8?B?dWJnR2pERzVQSUllNWNGVHk2T3hwb1N2c2MvVXBES25ZeitoMmR3aFdMbmls?=
 =?utf-8?B?dE9JQzRtSERhTllkeHl6cXNlQU1ybGJldmNNTlhIMGhrQVQxWndvbzl6a3h3?=
 =?utf-8?B?aVpLWWExZHlMZlRWRWJSOVlsb01zcVJQTE1oZFN3Qmd5T1VxZnhiYU9nRG1B?=
 =?utf-8?B?bXR2MkZNNTJQbm92aXlJQWE2ZHdnK1R4UUZBS3ZybjFEaHRwa1RiSUxSbS9n?=
 =?utf-8?B?cU41SEdQRTJDTFVVZnNJaVlBVzI4Yy8zMjJIQkhaSTFnTFhaUXhBRnF3bGFi?=
 =?utf-8?B?YlVkOHdwOG1EcEp6Nmc5ZFh5eEI2ZGlxSjJaWkJrTVorcDNhYktnelM3NHhN?=
 =?utf-8?B?RVNWWWFDd2ZobC95dHZSRGJ5SXdyQWZONml1WjJRYmYxeEhsUTJOQjZRb3k1?=
 =?utf-8?Q?Rkw6SP3JF8fRRhdszJLpjzmjS?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70276013-22d8-4aa0-f8aa-08de20c37c53
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 01:41:51.1501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wFd8sA97v3D/Ux3Dwq0BlUVAHTfGc9iE9sUG4C9Tw+Elj5inYuFFR3W8O0uxn7D/1bRrSWry8NTcL28yuT+LmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8039

From: Peng Fan <peng.fan@nxp.com>

Drop extra space between return and zero.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_dsp_rproc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index 87f4a026c05fbf1c9371058290b2d33cb94b9e54..1726aaa1eafb9ac1a913e3e2caea73801b86dc09 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -784,7 +784,7 @@ static int imx_dsp_rproc_prepare(struct rproc *rproc)
 
 	pm_runtime_get_sync(dev);
 
-	return  0;
+	return 0;
 }
 
 /* Unprepare function for rproc_ops */
@@ -792,7 +792,7 @@ static int imx_dsp_rproc_unprepare(struct rproc *rproc)
 {
 	pm_runtime_put_sync(rproc->dev.parent);
 
-	return  0;
+	return 0;
 }
 
 /* Kick function for rproc_ops */

-- 
2.37.1

