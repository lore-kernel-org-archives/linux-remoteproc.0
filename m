Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013039.outbound.protection.outlook.com [52.101.72.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDF2233155;
	Wed, 15 Oct 2025 13:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760536413; cv=fail; b=J6cb/gLq/W62CtWPBuPWwJs+OxXFDDfK4uRGSDiJcxlAH9caScsMsiz+x56soJxeIh28ggxiqUpbzkKSC+vD8WwlBAld9Zq+PoRC8el59D73LFBo0IKNNUWAA+KR7mToK2BIGbDIwY1x+SEPdLTwS899b3+VHQGiupokXmgdeLc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760536413; c=relaxed/simple;
	bh=XdnmGmvE8X+mMbNryrB2jfnyL0kWI6PD/SVoLiexQ/8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=M77cu/tECzlXx7tE2KH8gUeDyu/aOmpSBE2W1xUrTEtwB/Tv/VuVi7CFGeYzO4UXQ055xatjQ1dzI8n94ZevUrP8QIW1eM3bpaMJpDyPhM5V8vDFA4t4Ec1UHhw2OHqe2KVppKvTxA9xU8psjABZvHM6HZRM0aD/8JnQnnqbetE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bMhk/LSZ; arc=fail smtp.client-ip=52.101.72.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bMhk/LSZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cAH+bBJkaduI0zrXPIFqGrskW06Kgleeh8NMusrkjggl5GAgJH2E4cnl50W2ikNSUfw6Be8h0ItZpgzAeb04s9GfDbVEXPRQfnhcPNpkPJRdUr0Waw9Lvs0Xh/CwHGG1IXD5rcm7UuqBBwMxGN9FCnYd5JwAs1TfWlabJ5X8v1nThyfeGQgyJDcCYPr/BDwRV3+XAPryLao8nJm1uQ2gt//Yvx8IHMA+CYRM7ajqTgITduJI7twm25c2WtVwpeu4+YSbMNANDWZzhY+/4dALR/WK6hQtc90kbeGGlOAHAPS6E6S7GmKucoJ69jRB6YrzNAGaapLMhdSwVc0P0ysy0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FQTFDvEdei1wnzSz09E6T4vmbX922gbrByDq4b5TYgA=;
 b=Q/zezuJ5fOoLNBb3oYmDlJ3PsL53JNoM5sgBuX5I+npmCfLkNBPXNhFexDFh06m4b/it5yhSLzjoHHTkTIXPCEqrPwxypdO4bCsg2oTuJDvYgRhvn68hLtP8mDTtJanhyOCUxuhscTtxX6LMGfYTrVWWuw+RijORL931S4whw0g1JGMoSmaQVSqaJQ2UXCOTsNG1O+VnBjCLbwaN00yA2moGEjNGaH7FrLM89JLcgskXI71Ypx3YC79d29k3u8ZvWux216EcQ6R1bVarQOeT3KRYlaRL/NYYiSLfxbtx54MW0Kq4EYchVB2+lAlsjQUNw6J77Fgxh/bxNHEVb6LOsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FQTFDvEdei1wnzSz09E6T4vmbX922gbrByDq4b5TYgA=;
 b=bMhk/LSZCpNbmnFAWgUkblkPVnZIL2UsnWad8QVCxGMyAeKBw5gEEyLtJIappLENunGQHqvydTU220Itq6t7bBKHJHz0q4vszsqKyngvcvEf4g1RIxHCgB8VGho5oWnTMTUATO23Z4DeuebKc9EeBeZVBmonX7AVb/GGlO3wHLEbDHhKJ4CJaMaaF/qCr2fAYJncfvnvs6ocw2GjTmzTa+QirM1nwS0u0k75fdhTxAVraAXdljw8cmVkjtsLVZkTDJPQUE+nRBVNWkCKpnI0Bfpm7DMZk5878mghYCcArPWZ390YDlcnmFhWQNmvBHQsfkAyldkrm45eFHOsYgTvEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DBBPR04MB7612.eurprd04.prod.outlook.com (2603:10a6:10:202::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Wed, 15 Oct
 2025 13:53:28 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9228.010; Wed, 15 Oct 2025
 13:53:28 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Wed, 15 Oct 2025 21:52:55 +0800
Subject: [PATCH v3 1/5] remoteproc: imx_rproc: Simplify clock enable logic
 using dcfg flags
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-imx-rproc-c3_1-v3-1-b4baa247358d@nxp.com>
References: <20251015-imx-rproc-c3_1-v3-0-b4baa247358d@nxp.com>
In-Reply-To: <20251015-imx-rproc-c3_1-v3-0-b4baa247358d@nxp.com>
To: Daniel Baluta <daniel.baluta@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <frank.li@nxp.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760536394; l=4888;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=XdnmGmvE8X+mMbNryrB2jfnyL0kWI6PD/SVoLiexQ/8=;
 b=8Fl7GEAwLwRpz/5ICzBdaXO2g5yEVoH9nt0euWPpq/iSDASJbUOu0vmB1UZRlBtm309EUb646
 YZqb35qj8rgDvxo3QPde5CO1dNddiQ4OhB/4CTPPArXRjQTzsb2ULcz
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR02CA0110.apcprd02.prod.outlook.com
 (2603:1096:4:92::26) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DBBPR04MB7612:EE_
X-MS-Office365-Filtering-Correlation-Id: 85230e4b-7ab3-42e7-03c1-08de0bf237b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|52116014|376014|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TGI4bDFXWVFiSEVVRWwyQ0Q3VzM4dkpETE9yaEU1NXJpRTFjMlJ5aElkUnFs?=
 =?utf-8?B?YWVuMHc1amlXekwzSXc3QlNza2U4YlE3b2ZZYlZMWWR3a0JzZUpyQzA5VFBQ?=
 =?utf-8?B?cnQwRFpsV25QZm1TL2lhWDU4QjlUR1VRaS94eGxnTjR1R2gxeml4Z0hOV3hU?=
 =?utf-8?B?alRvMlVwalpiRDFBRTYzOGtreDA4ejZpNDVJd0JpQ2Y2eUR0eEJ6MTE3Sk8z?=
 =?utf-8?B?c3FWR05Jdm5lVjZNTW1SZmlTR3hFOWJpOHB2bm1kQ3dpTDd3OENTN1hPQlR6?=
 =?utf-8?B?R3cwc3ZxT2JQRGV2dFJoVzFpRDUrbVgwMEMzNkJTTkxHNWRzZjB0Zk9kRlBD?=
 =?utf-8?B?anByVmlPRW1nc05WSXd5RkxCVlZkOFpBOXA0Tkw2cyt3Mm96SWpZMFFkQ2Uz?=
 =?utf-8?B?TmZXb2piRWRwZEdJUnJ6TXEwNlVpN2EwOFJ2ckVJL1VFckpMakdiVlI3SFU4?=
 =?utf-8?B?ZHRzWk40UUsyeGtqVytXQjA3WTlBQlNFSjdJek1UTSs4WFo4aGxNaXp2WnQz?=
 =?utf-8?B?VUVzQmZ3Y3NTSkxzR21neFNqQ0QyaUpRM1ZsMjJtWU9IU0V0V0Y1d2ppZ1lY?=
 =?utf-8?B?Yk5hSER3Qllaczc4SzVEZ0RQWEFLWTZvSHlyNmtFN3g5ZWlKTkw2bGJJZWNU?=
 =?utf-8?B?bzNCNVdMQi94aUJZZWhCZHF3NUswQXQ0TjFJa3UvL1oydXdqR2VxbWo1QVBN?=
 =?utf-8?B?ZWpGbFVKMVlOaVRvVFJPVEtWY3NsNG1WZEtpaEpwYkhWMTg4T2RPYkZiN3ZF?=
 =?utf-8?B?a2tnWFRFVThhRExkRlVxQzg5YVJhOGhiZGN6b1FLdzZ6WmJjaFpQSTNJeGFk?=
 =?utf-8?B?dllXeFpIc2RPU252MVRPa3VZSlVFb2RhdHVOdU4yUWh5Zi8wS3pManhwQXZV?=
 =?utf-8?B?WVN4bWpib0tFcWwxa0Z2UW1YOGYydDdJNStNWDl5aHFENStJYmt5dXV5bkN5?=
 =?utf-8?B?OU1yREptcWxCWVpoSzJOR0pXTENyU1AwdFpVZXh4WDgremRuY2VZYmpaU0lz?=
 =?utf-8?B?SXB6dS9ucmd1V2xIcEhoQ2VMcVV0cGNOb2JSZm5TUndwU1p3M0ZjMEJlZitz?=
 =?utf-8?B?VStBS0NwTFBDaE9vRVBJZGZBYUIwV2lUVkJXYlVxSFdlZHdFY2pSS3l5amY5?=
 =?utf-8?B?d3JrcGxFY1lyZTZVdk00ZWUxdFBmaWQvVEx5cjF4dDVNcGpMM3BVbkhkUDNQ?=
 =?utf-8?B?ODNjYktpTm4remV5aUY5RHBGciszK3hBVlQ5UFo5SlUvSExEZHZKR2dCZUF1?=
 =?utf-8?B?WXdaNFNqY0swWE4rVDJnejFXR2xRYU9GbUplSzZSRG5wZGtCN3pMazRQMUps?=
 =?utf-8?B?eXhXMGJSRFhhelF5VU5TVmVHK0crV3Mva3lBaXFtb3J3V3VUUWZRUkNieUpW?=
 =?utf-8?B?TTl0Vzl3alJnOXN1cFVFaXhmMUxKODhzbzdQZDAwRkZYWlBCcFhHT3Jwdzcz?=
 =?utf-8?B?UEdiQWxhNDBxVFR6bVBTTEIwWmRWa0o1MzRsTU4wUUVDZ2tJdEJqd2hHdW52?=
 =?utf-8?B?YmsvNWgyOFRMQU1FTlN5OFhnUUtKWFpsRjJoeWpWR2RaODZVbm14dDBCZk5C?=
 =?utf-8?B?MHhkbmhxMDVUUUZ3ZHhZdWRWc3hjWGFHNnExOVdIRWUxMGtZdmJPWWFtNWFh?=
 =?utf-8?B?ZTV5OGlPcStLa0N0ZGRNQVBaeTBUY3VaVzNZeFFzM3F2M3Yxc2NxSnk4TnNy?=
 =?utf-8?B?Ym1ERlhmYXd2RlIrMUd2T25jUDc1R1VVd3hlMFVSaFdCbTF5V09ub2d0dkxP?=
 =?utf-8?B?VU1sZEZQTzBSV2RkR0t4ZXZWdk9WaWRWRFZQVktMcFZZVThOenk2aDIzY3JE?=
 =?utf-8?B?anBJUmFnbDVFTnBJamdZcmNldHVIbTNsVmNmRWNrSU00eXVZR3VhcWlyWUJ6?=
 =?utf-8?B?akFtUFFzN3JHaTBVTUhrTGdwVmYwYWxsRWFNTDlYMEdBRjU4bjBoOFBoeVlV?=
 =?utf-8?B?SkpMQ0pzMVR3aWpod3dMWW56ZTNuZWprQk84R2dTREdnTzJzb2VEU0trSzZ0?=
 =?utf-8?B?ajhGMzlFRmZ3OFpOQzVuUzRQQVNaM1UxWUt2RHk0MWtpcEl2dmh2cDZWZFBP?=
 =?utf-8?Q?dKCtCN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(52116014)(376014)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eXI4bDdvQmtpZFBacFdKSVVEcU5xS0NVS3A1STRDSmNyeXVSOHAxRTdtdlNy?=
 =?utf-8?B?NWsxTkJscTZidkhTSjNGNmNvWFlxb0hGSEJ5S0gwNEdDcitheWlzN2dOSXEy?=
 =?utf-8?B?OXIzQnBEUUtJSDFlWkxoNVV0dlJ1TzdqdDQ2Z1ZlZHZUc1hvVDdOOENYekhQ?=
 =?utf-8?B?ZktKN3F4RXVCa29DOWFpSFFzTjU1QVR4N2k3Z256M215bTJWT09IdzJNR1Z2?=
 =?utf-8?B?eTNRajBpMlhoS1B5WWozOUZER3pCaVJqemNVTEFDTTRpc24zUVl0eStJZUVi?=
 =?utf-8?B?R3Voc2pLTk53VEw2MmYzcHZkZDVldnRaZGpvRW5EYmhVYUVNQXYvUVBCZWtF?=
 =?utf-8?B?aXplRjBsaXZlZDBuYXgySlFqdXNzWTVVMWVEbExWak1uYmJZRUhDcmlZMmZm?=
 =?utf-8?B?cmVDY2M2OUtERFltVEN3VWE0aHR4cHd3dUxMcVVUSHJ4U2J2Mnh5b3NtcHQz?=
 =?utf-8?B?TVRHeU1SdlpvUE5WV2EwNnh3NFhpSFI2NVBOYlVxWFNDc2JuS3hpaSswTVd3?=
 =?utf-8?B?OVpOZisyU282T3gzNTY3K282a0hsZFIxYjRQOXhVbXBua1Irc0VYMlFUcWZU?=
 =?utf-8?B?NVgrcEljaU9wa09yZXFiS3d6cG1UbkhEaWgvclJmWlBiV01WRi82Lzhlb3do?=
 =?utf-8?B?L1RmdkJ5Z0ZRMlhOcmVLUVYrN0NsbWdzVGVBckhlTk5yVTF3UnJCNWFsYjJR?=
 =?utf-8?B?RmtxVHloak9sMFNjamNOeGxLSjlwcWw0c2sxcUZ1U2pFQ2x3bnduOWdqOVhK?=
 =?utf-8?B?ejVaTUNJc0NuMEZmOGJjRzBUTGdJSXhTenhIckRRTWExbElkQWM2Y1ZMSzBE?=
 =?utf-8?B?ZWJoVER4MzBrK1ZpT0gwVm1lR0lqeVViQlZ2TTVMcEZYOWNSTVZDdkM0anQw?=
 =?utf-8?B?bU5kZUtkRmtVT016MjBtYzh4RjRVZ2NDZzZrYnMrT0IvVjRnUWlPd3laRDB6?=
 =?utf-8?B?cUMvUHdrc3NvbnQzMzVCclN2d2h4UzdsZ3N4d1YyTkV5TkZEbTlwK1M3STZp?=
 =?utf-8?B?bmJiZVdURGJ5YlpXMm9XcXhRdjFkMW1qaUV2dlNQV3VsYWRMcXRRUTRBRlVr?=
 =?utf-8?B?bVAwNFJYUTcydzMvQ2srMDBlYk8wUXFtK2lpalU1alQ4RVlUNVE3MzMydDdI?=
 =?utf-8?B?eTc4aXVIaVBDWWN5Nkp0QzA5UE52UCt0M1R4NVltK1cvNnpVbDlrWm84ZE11?=
 =?utf-8?B?cjNTeUxOMldLdndxUkRWTjJTTGVNM3RVb1l0bjJxVEZXZ0xwTmllbVZyZzBF?=
 =?utf-8?B?d0pxYytPclJWdzJOMjluVkEyOXBKdkJNZnhhd3MrL1VPZG15N21jWTRPd1Y2?=
 =?utf-8?B?eW0xak55Q3ZqV3M0UnZJclJkaGE1LzF0cEZSN2ROUmxHWE5PWGlIb1QvNUJ0?=
 =?utf-8?B?ek9hWDRyODAyZUxFQkg1bmJxZStZaE4yNjkwMDZPQU10SDAzK2ZZbkJqakFT?=
 =?utf-8?B?Nyt4cy9Ya2NsQjhEdkt3SkxUMENsWUovRlZLNytTeWhrWmVpeit1eS9tYytU?=
 =?utf-8?B?RkdxNXk1NFNFdGVYcTNmeUdwdnFzRHhTUE9FV2x1Wm8vM0Y5K0R5V01hV1hS?=
 =?utf-8?B?MmE5eWxMK0htZ0VLSGFyeDBlbzRXZFRJSHE3eFp2eW1jcnpBRXRuS0FZTmZq?=
 =?utf-8?B?ZDJKVEU4di9vRDQwT0ttTzBBOXUrc24wbE9wR0VRMkwzSUFjMTZVdVNHK05z?=
 =?utf-8?B?Z0U3UmM1a1h1MzlDYzFhNnJnMG91UVFLYklSU1Z2T1hMRDh5Nld4UitNL282?=
 =?utf-8?B?cS94d0s0Qy9ZMG5oUnZaZnhEOXhNUTIyMEtucEZnNEwrbE1heFcvNHh4WC9N?=
 =?utf-8?B?UjFTZGdNSXBacmFDV1R6YW5wTnN3d3hkbVpxclQrR0U5a0ZaUW5RUC9jL1JF?=
 =?utf-8?B?NjdxRVg0RWRTRE5Ea2RLUUhFQk9iSFBkWUxRa3dXcHVnRGVCbVpPUmRvVzBy?=
 =?utf-8?B?TzViMjNXVGhxTVRoWC9peEtGMURUYzRKQTRrWVkxNzBEMzlrS2VabmY2YjE4?=
 =?utf-8?B?dkd4MFRyVGtVRU5yVU9va1Y1aDhxMXArZzUyTERqVXhpanRNSkxXK2NOazJ5?=
 =?utf-8?B?OE1rMS9MZE1wWXdmSzY3MGVKT0pGcndaZHdCNThYUWtpUllsVmRTUjlCbkNq?=
 =?utf-8?Q?Bn/IcwT2AyPu92g9DCkJ9kVXO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85230e4b-7ab3-42e7-03c1-08de0bf237b8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 13:53:27.9510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k5p1WFJDI2HXwLNkWLWabGsb1YM+haaEnNcl4PNjrPY+DTSP0X9IlrCHwPFli1vXEqdwYAXKWnnfS5Z0yyCWyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7612

Simplify the clock enable logic by removing the dedicated
imx_rproc_clk_enable() function and integrate the clock handling directly
into the probe function to simplify the code.

Add a new IMX_RPROC_NEED_CLKS flag in dcfg to indicate whether clock
management is required for a given SoC. Update probe logic to conditionally
enable clocks based on the new flag.

Set the flag for applicable SoCs (e.g., i.MX7D, i.MX8MQ, i.MX93, etc.).

No functional changes.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 40 +++++++++++++++-------------------------
 drivers/remoteproc/imx_rproc.h |  1 +
 2 files changed, 16 insertions(+), 25 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 68e01b647b66910627fb2256c96c152f3c22c83b..2a71863c09e917719301e02c3cd535a2852abbea 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -1002,28 +1002,6 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
 	return dcfg->ops->detect_mode(priv->rproc);
 }
 
-static int imx_rproc_clk_enable(struct imx_rproc *priv)
-{
-	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
-	struct device *dev = priv->dev;
-
-	/* Remote core is not under control of Linux or it is managed by SCU API */
-	if (dcfg->method == IMX_RPROC_NONE || dcfg->method == IMX_RPROC_SCU_API)
-		return 0;
-
-	/*
-	 * clk for M4 block including memory. Should be
-	 * enabled before .start for FW transfer.
-	 */
-	priv->clk = devm_clk_get_enabled(dev, NULL);
-	if (IS_ERR(priv->clk)) {
-		dev_err(dev, "Failed to enable clock\n");
-		return PTR_ERR(priv->clk);
-	}
-
-	return 0;
-}
-
 static int imx_rproc_sys_off_handler(struct sys_off_data *data)
 {
 	struct rproc *rproc = data->cb_data;
@@ -1101,9 +1079,15 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed on detect mode\n");
 
-	ret = imx_rproc_clk_enable(priv);
-	if (ret)
-		return dev_err_probe(dev, ret, "failed to enable clks\n");
+	/*
+	 * Handle clocks when remote core is under control of Linux AND the
+	 * clocks are not managed by system firmware.
+	 */
+	if (dcfg->flags & IMX_RPROC_NEED_CLKS) {
+		priv->clk = devm_clk_get_enabled(dev, NULL);
+		if (IS_ERR(priv->clk))
+			return dev_err_probe(dev, PTR_ERR(priv->clk), "Failed to enable clock\n");
+	}
 
 	if (rproc->state != RPROC_DETACHED)
 		rproc->auto_boot = of_property_read_bool(np, "fsl,auto-boot");
@@ -1192,6 +1176,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn_mmio = {
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mn),
 	.method		= IMX_RPROC_MMIO,
 	.ops		= &imx_rproc_ops_mmio,
+	.flags		= IMX_RPROC_NEED_CLKS,
 };
 
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn = {
@@ -1199,6 +1184,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn = {
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mn),
 	.method		= IMX_RPROC_SMC,
 	.ops		= &imx_rproc_ops_arm_smc,
+	.flags		= IMX_RPROC_NEED_CLKS,
 };
 
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
@@ -1210,6 +1196,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mq),
 	.method		= IMX_RPROC_MMIO,
 	.ops		= &imx_rproc_ops_mmio,
+	.flags		= IMX_RPROC_NEED_CLKS,
 };
 
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx8qm = {
@@ -1248,6 +1235,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx7d = {
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx7d),
 	.method		= IMX_RPROC_MMIO,
 	.ops		= &imx_rproc_ops_mmio,
+	.flags		= IMX_RPROC_NEED_CLKS,
 };
 
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx6sx = {
@@ -1259,6 +1247,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx6sx = {
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx6sx),
 	.method		= IMX_RPROC_MMIO,
 	.ops		= &imx_rproc_ops_mmio,
+	.flags		= IMX_RPROC_NEED_CLKS,
 };
 
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx93 = {
@@ -1266,6 +1255,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx93 = {
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx93),
 	.method		= IMX_RPROC_SMC,
 	.ops		= &imx_rproc_ops_arm_smc,
+	.flags		= IMX_RPROC_NEED_CLKS,
 };
 
 static const struct of_device_id imx_rproc_of_match[] = {
diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
index 3a9adaaf048b396102feeb45488cd2ff125a807a..a9cba623560c85ea37e47401c392c06dada500aa 100644
--- a/drivers/remoteproc/imx_rproc.h
+++ b/drivers/remoteproc/imx_rproc.h
@@ -30,6 +30,7 @@ enum imx_rproc_method {
 
 /* dcfg flags */
 #define IMX_RPROC_NEED_SYSTEM_OFF	BIT(0)
+#define IMX_RPROC_NEED_CLKS		BIT(1)
 
 struct imx_rproc_plat_ops {
 	int (*start)(struct rproc *rproc);

-- 
2.37.1

