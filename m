Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011013.outbound.protection.outlook.com [40.107.130.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4833126DF;
	Mon, 15 Dec 2025 07:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765783511; cv=fail; b=WGFF1z82odTX7IK5LKa57RbgSf7bKGzKQGKkw/bCwMHzWw13+z2S+NUeFCyl1N3Ns9b1ruDE06xq/7ncGjZXKOOkkxKJilvyNNWfgxPEyS2gSJ8WuvFGCJBnsTVTZnX02c/ZS/uI+PEoC2Kc74AJmtFtVQkXKhm1kCxYWkGzNP0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765783511; c=relaxed/simple;
	bh=JXJxXjL/eTuiw4MLhVNVcolkvs9x2e2K0ysfvp7CJls=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=X4u7jTAOhkqTnCrnVJYWxZC5zIAJMMwRR8lLko05+i0zNX4RNCFQ7Kl6dJtD2UGHpWcr2e9rnXdDd1Sa+f+BKvcIK5Rjs9jpCLDkvohEIVCSKoZpdxY1ONMa24THFw1JQb+6CTbFHNy84ZGZPaWGSbyVFol/OE+O2TpSxg5BC9c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=QGB9VCGH; arc=fail smtp.client-ip=40.107.130.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="QGB9VCGH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QlZUeErZX23VIvRx+tfTC2fwy3rLoX5LK0fu1nghE8CctPNGJ3u5CEkmaBUFapzpmfHDyydvpym3xN4rfrTmNbZNhFK+Ehc6uEXYz6H0r12TakVB+TdyTg6Tvdoqs9H8eH2iNxNQ3zNbUxFWwUO9mCZzitngxMBOL1rwHjRUVyfhq6VPwpIBUldKy6y6/ty+4md0LDUwLAGHpse/qq3yG9QWzHdfYk59t0NZq/KvRYZ4KM5jhYedqh/fD6egC7Z0uuFC4Q/vhq0Y8/JuC/8px2w3k6MV1C15siaYpT5SNlKH5iLPRQpGj4UNqPS4R1bpMVBwWUs4OpEof10nDb88WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X9RIe5C+ixic34UMg1pMUszJDZ3QCX3RvGAtcRsa/ls=;
 b=u7JCMY02ZVW58R7Aa1C6Ny6haxzA9YLYSojBSYQYufLPjS6CQAp5TxqJVFspbgqjYpn8gDopZTBrmD5f3RJtljWBk6ygYF7SHCbHACFdIECz+FyZcArVp3nmZ4WPMRlyC6d8ScDHkB2Ulve+ry5Y1lJ4rdNdLMpB55kH9/fFSiqdXh0nDXup4ojvsaUvPRdDtNQc/Sd5dNT9pe1OFruv13XOsj9tJd1jFFkhgpjIgBfcHpEshcY8YRMUHuwW6NKBfTER5dmkCuYF/BNmqvlRuvQxrqAitmXpN/ImJ6U8YIg/0PJjkyIg6QQAH45Hs+UlLV9gwmfpHzNw5hyDn4UtNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X9RIe5C+ixic34UMg1pMUszJDZ3QCX3RvGAtcRsa/ls=;
 b=QGB9VCGH1GbqhogPcmjn6xWoi1EqhMwa3EjW0mfxM+tbWfPGuvsfEn07FG2r4usN61PSIKWQyXna9rwsnUpGfD5mpEEie9zm/DSwcl85DB6yuWQ0iH8PUaka+KcPZf+N8DaItCTI2VbZX148dF+sLcF8MLFKqU6JYAcaPLQ0f1y7tqIh4uSF+lLbzFXxoukmcpo+slv5tgEaiLz4wbzDR7CkbX/EsTP2mpBNK+kvhbIHI0eTEhMDFxyAn4QoNAjalYZYJSKwlkbkyCEquj7MMesWLpCiTOMA4ikMKtpONQjGg+knoafB7GhQhGQqlpAUR0XxK8Xv/HSOtVCiXbDU5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB7213.eurprd04.prod.outlook.com (2603:10a6:800:1b3::8)
 by GV1PR04MB10477.eurprd04.prod.outlook.com (2603:10a6:150:1cb::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 07:25:03 +0000
Received: from VE1PR04MB7213.eurprd04.prod.outlook.com
 ([fe80::93cb:5423:e3b:9a0d]) by VE1PR04MB7213.eurprd04.prod.outlook.com
 ([fe80::93cb:5423:e3b:9a0d%7]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 07:25:03 +0000
From: Jacky Bai <ping.bai@nxp.com>
Date: Mon, 15 Dec 2025 15:26:05 +0800
Subject: [PATCH] remoteproc: imx_rproc: Ues sync handling in rx_callback
 for i.MX7ULP suspend
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-imx7ulp_rproc-v1-1-4e96cebc4bc6@nxp.com>
X-B4-Tracking: v=1; b=H4sIAAy4P2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDI0ND3czcCvPSnIL4ooKi/GRdU3NLS0tjI0sjY8skJaCegqLUtMwKsHn
 RsbW1AMurc2dfAAAA
X-Change-ID: 20251211-imx7ulp_rproc-57999329239b
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 peng.fan@nxp.com, Jacky Bai <ping.bai@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765783581; l=4844;
 i=ping.bai@nxp.com; s=20250804; h=from:subject:message-id;
 bh=JXJxXjL/eTuiw4MLhVNVcolkvs9x2e2K0ysfvp7CJls=;
 b=MHa9DzVOv5uxmJZIFJ7ZG7CamNwYbYeTaRhMwlsyyoz+YburPRzzty0vN3z95XqI5ds7S2vmG
 83hdUCsSRTUAmhsh5JvwF6yxulpqzkODDCePGhVG6mYMW+YhCP2sXV4
X-Developer-Key: i=ping.bai@nxp.com; a=ed25519;
 pk=ckFjCfRynXBjQGmSmzOVI5hggMD9XnnNlwj/jcO/j1U=
X-ClientProxiedBy: SI2PR01CA0035.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::13) To VE1PR04MB7213.eurprd04.prod.outlook.com
 (2603:10a6:800:1b3::8)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB7213:EE_|GV1PR04MB10477:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a2642b1-b517-433e-e0e3-08de3bab1011
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MzhjWVJqYU9YS2wzS2EvbHpoalJyZmFOcUY5S21IeUtCRysvWmh6aUszRzRh?=
 =?utf-8?B?OHZNRUhZRTdzYm1mQ2RtRE5JZFBJdG5WLzhEUVVxSWk5cGx1Rm96dk1IUmRL?=
 =?utf-8?B?R0VwZGdCWkxvVGF5aURKN2NUMmdVSEh1YVV2ZWV6Y2JXYVhaQWRidUw4K0tI?=
 =?utf-8?B?RlFGSW1YNkRuR1o1L3hDTG1Ca0xZTy9Dc2VwSHQ4UzZXeWdpM3IvSlluL0Vx?=
 =?utf-8?B?VGVpa0tYZ2pWd0xkWXRTMDJCRWx4WjUrMHZxVGwwN3dDL1Z2TDBqbVB1ZFB2?=
 =?utf-8?B?NU9NVVZpOWppWHVhTng3bGxZbnRMTkROaWRKUTd4L3hjZjlsRmY5TWdxQ3p4?=
 =?utf-8?B?eEJYZ3BnVEFWNm8xSTY0REVaN3V3enJHeXNKUkJEUFFZakxlamJKRE1IQ0k1?=
 =?utf-8?B?cEVlNFRhT1drclp5TmRpeU93c1hEcHhMRVRzZEVlZm54ZWJ4Tm16aitTUzBj?=
 =?utf-8?B?UWdrVGZkem9yazNPUHZFWVZVQWNzTitjbWxseUJ1VUVRNE5kS0RSeUVrVFo0?=
 =?utf-8?B?ZE1XVXBIWWp1bUJQS1BHVk1XMHZNdGZ1K1dhUlFweUJzdGJvL0V5VzgzNDRm?=
 =?utf-8?B?TEVVWm5ML3UwYTN2aE9mMHYzUFdhRysvZXJQNTh1OG5RSW5HMEJNalk5bG41?=
 =?utf-8?B?YW12Z0dPQW1hVDNDQjh2QUx4R0Q4TjVUZmxiblNFRzlaaDU5bCtsOHJ4dnFx?=
 =?utf-8?B?S0kwRERCVml3cmF5Si9KRlZNeEJFY3FBVlhQWE5hNDVqeExVVytOVlJyQzdK?=
 =?utf-8?B?NkRvanV5NS8xU2hDcTdVd2xWUXdjT256djQya1ZBaGU5TkJYR1NVSExvV2JD?=
 =?utf-8?B?ckdBR0xzTWtyWkplYVdLME9raVJCZFh3MnF5UEpZQy9QUDU0Q0NLelZDSEV4?=
 =?utf-8?B?cUFyajd6SGVKaFVkVWF0S3BhakNYeU1jS3plaWdHMUI2RXRQRG9RUlFXMC82?=
 =?utf-8?B?Y2R3aURrck5SM2dqdm54bDBJelRQZmF2OHFsV2lOUUVrYTVqWXBJRDhqeWd6?=
 =?utf-8?B?RnZjYlRKNlVMdC9EYXV1Z2J2MDVGR1N6N2UyM3VaRXp1QUh4T2ZBaUt1Z2g0?=
 =?utf-8?B?djV5L2ZKYlk0QU1RMGhDam5RODZnQitZdVVvb1lJRzZhcnJicHk0SHlkeE9k?=
 =?utf-8?B?Wmh2bktIUXYyN1lVM3ducmNpejVwbnlsNWc5dDF0ZzVYU0tOVU4zYU1uakYw?=
 =?utf-8?B?dVlXejhqVDZCZzdPZ3ZqWTc5MGNlQjFyRTgyZUkvL2VzT2pwa2tzcWxidjRV?=
 =?utf-8?B?Wll0d3VUYmVKcnFaUUszbHR6VENUbE1yNXZiamZndmVZelYzYnhncHBnQTJY?=
 =?utf-8?B?NEpuWEcvV1FYQklHYkc2d2FaS0J1TUZyL1g4RjBmdmtIOTU0ekRxbUFNVGRB?=
 =?utf-8?B?amo5K1kySm9rVVFwb05PaUpOK3lYL2h2MWNuSWorV1d5T3BLVXRpWTRqRWZN?=
 =?utf-8?B?b2YvY0kxYmFKR2tRelhoeTBzbnBocnZwcUttVE40R0tZSmwxcmdYclBWV25H?=
 =?utf-8?B?QXdPbkdkVXU2RWhlVEdPeGYzd3ZxbUsrQzlvaGxtV3QvaGE2RUxaVXlKN2N4?=
 =?utf-8?B?b21TK2RzT09XMG1TUzhvaklTNng2cys5NTlzbmk5Z0h5ZWhkcG5lcGwzNlJz?=
 =?utf-8?B?QjZxVDBuUE5kMEdwYUdMMVQ5WjN5NUFlZjFSZnNOTkJOOVBwVWwwS3JoWTFm?=
 =?utf-8?B?VlVaL1pmSmowV1FONHE0Ymc5MU1LZER2cUhoeVBOdndJNlhoc0VGSXFWZUZD?=
 =?utf-8?B?cVRXTHdCZmNVRlRacUx2RVhvWlpEZXp2cVdyeXRTK1Y4dXBlYlQ5VithOGFl?=
 =?utf-8?B?SmFVRml2dFY2NFV3dEt1S1g2UmJqZDlxSWVuaHpOQWVtMHA4SmRiK1BUYkVW?=
 =?utf-8?B?SU11VnpLaVhuSjJxL2Z2b3lPb3dPc3c3aEJSdExnZWNyY2h2VWVaN3g2YzZt?=
 =?utf-8?B?UW5qSklYUDZJaUozOXNvOU5laGE4TVh4cHpEdzMrUjE3djZsY0RpaGg2YzFP?=
 =?utf-8?B?NUgzaENXb0MyeUhmdXhWVEEvQW1xamRMY1Y2b2ZnbThZT0dvTkNXV3NJQ08v?=
 =?utf-8?Q?QUsCCx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB7213.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eXR0NlBsZGZTbHJpRzFic3BRbG9odE53VjY3T3BFbEtxc3Y4a3ZSQjI0dFl3?=
 =?utf-8?B?TkdxbHp0a1NzYjFtcHVFMEpMQm9DZmo3QTJ0aktmOUJlWVFMbVNzUWZWbjdM?=
 =?utf-8?B?alpsUG80akRJNHNzbncvRGNRNkQwZ1hmYnVaWmp6My9tUHpRZWRrcjFMbktE?=
 =?utf-8?B?MUZ5SDBIM3pGZ2pCUVVyeFZVZk5kV2k5U0lDai9ZMDVxZXV5MGEvNHZxZENL?=
 =?utf-8?B?aHZSVWxHL3Ztb0FjalFxUktXQ2JZR2pINjBieER6K1AzY3NSVk5uNUlMMGQz?=
 =?utf-8?B?ZHdZOFZwdjFZMXlLcll0RHd0SnQ4UlhYVGJxc1dTMjJQd1pvTkJSTDRFY24z?=
 =?utf-8?B?amhQeDZFSFZORWpVbi9UMzUzSUM1UWJsa1AweFBJc3lnaTI3M05ZNnVrOWtP?=
 =?utf-8?B?T3RTQzJIQzlINjJlTm1DQXJ1NGZBbHpQa2UwTDcxRk8yT1FpNXNsSS9hQ2RQ?=
 =?utf-8?B?L1VLTGxRbWttWmM5dmhjNXVOM29Qc2I0bHpQbzBjQ2thVEtyaVRyN1lkcS9N?=
 =?utf-8?B?c1JkMldzYVoweXA1RTJOTWtFMGFLNWprcXN1RjNDQVBsYm1DTmNGT1p4TXBv?=
 =?utf-8?B?V2FOdkJlKzdEcU1VQ3FMSTZPZDMzVlVDbklHc0w2dXNhRXNEbTlMc05CZ1dZ?=
 =?utf-8?B?MUloZzdITUp1SHdQbWp5QmhiWnRMcEVKSEdNSzRxTGY3UWdwOGtMMTh4N3pZ?=
 =?utf-8?B?SFloZ3BOZDFrM2VFOGhLMnJwYWdaMDNyMXhpa3hNcFpLSWl3UlUwTmtISEE2?=
 =?utf-8?B?dXF3T3Y2MUU2NXBGN080MVNWQ2JEVUM1ZkkrUmVqR21xZXlmYTVVTmtqbmkz?=
 =?utf-8?B?djd5RWR0UUgxUjMrVXQ3TFJnZVVkYnhIZ3VCaXQ3ZE81bVhraXg4YXZ2M2cy?=
 =?utf-8?B?TSs5UkxJRUNtakNzbjlCS1VTbFB3OW9vcGJmaDgxT2NlU0ZXMzZSeS93QkF2?=
 =?utf-8?B?Wm80SHlrOGJmWkRUOVlMNXdEcVR4ZmtqNzFIcEFSTFFDL2FTUU5CdFUrOFVv?=
 =?utf-8?B?STV4aHV4cU1Wc1VLbThHcmplSlVFTkFIb04yQmVRK2d3eHQ0Ryt5QUVJWFhK?=
 =?utf-8?B?MWg5S2VXc0ROL0lpcVlIdlpBdm52L3dIajdTeld4d0ZYdHhEMjJnd0VLNEF0?=
 =?utf-8?B?SUdPK1Z1Rk1YM2FHZjZwbmE0cVlBUVM4djh3OGhEQ3JoU3FaY0g4THQwaSs2?=
 =?utf-8?B?U2NPVGNjUUpSSWFvQk9aMnVPUHNTV0RwdTRyMi9GejA0ZmkvUFZMbjQvZWor?=
 =?utf-8?B?QlFnWlNrc3FvRFQvTFk3TDNIWE1DVk14cWtxb2ZCcGtrMHFuQXFLUGxWbFlF?=
 =?utf-8?B?WVhZTklCWmhmbTcwV1Vob1hsWUxIWHFvQmtETVlOckw4eFBwVnFmVWdWd0Nz?=
 =?utf-8?B?QkpOSEVGUFRid2RwbjRPNnIvem9Zd0lkem84YlNVOGFsbldJcDY0KzdpODIv?=
 =?utf-8?B?dUlYb1NHcVQwbWpPQ05Nc2dQMHN6ektYYzVLZllUNDFvSlNnd2NNWi9OMFpJ?=
 =?utf-8?B?c2IvTkVINXpsclN5bHRrS1pBSmwvZ24wMG5DOWZJRnFaSzRnZG0rMGxNNnZn?=
 =?utf-8?B?NjdjTkJoN290UXQvdUlLRTR0Q0IrR1BvOXhOZlpzYUtPL2JqU1c3WHhORU5N?=
 =?utf-8?B?Lyt2c0dickhMVmJVakpOYzJpcXU0OGsvcWxiYmt5V2RiSG02NGtybVB0dFFF?=
 =?utf-8?B?bmFIYlAycHhKRHpQZGhFTC9ybmRWUjN5bkFkVmFKYXdjMzVLYXJjM2JFc1Jm?=
 =?utf-8?B?ZG96R3hhM2RDeituSnpGeWFicG9SbW9tQ2tCWjhucVJYUmhzeHVHRG5pQ1pQ?=
 =?utf-8?B?WVpXR01iWDMzVGdBbzE5c2ZwaUwwWDZIaFdKRHVGUVVHY3VBbTR4MXBCRkdq?=
 =?utf-8?B?ZjFEcnBwSURBdVNJeGdGS0dGZ0JZL2tiVkRoTGtNOUNyYXowaU9hN2lKSVMx?=
 =?utf-8?B?UWRMaXd5V2FoYi9zNkttQmdKZjFSeDlqbFdTREJVcGsvaERHZ1NGaWsxUFJY?=
 =?utf-8?B?REhGRVFQeTMwa3FPQ09XVXNLSEo5dFVlUnN4R2RzbTFLdDJ2STdRT1Z2cTNi?=
 =?utf-8?B?UW90M2h6ZkRFTTJYbk9saCs3NWFlZ0JzczVqY3VVZmVzc2dFNER3OFQvYnlY?=
 =?utf-8?Q?E3tDWd1M26i/tanBIhgFF9HvK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a2642b1-b517-433e-e0e3-08de3bab1011
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB7213.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 07:25:02.9736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MZQ9JcQeQ9EYN3MR1R8h7XT44MhxK059cIMBsWMNjH9SH9nENjQb/FFrzqgvGCTP4+BiBqi+Q7KNxgh6sBSM5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10477

On i.MX7ULP platform, certain drivers that depend on rpmsg may need
to send an rpmsg request and receive an acknowledgment from the
remote core during the late_suspend stage. In the current imx_rproc
implementation, rx_callback defers message handling to a workqueue.
However, this deferred work may not execute before the system enters
the noirq_suspend stage. When that happens, pending mailbox IRQs
will cause the suspend sequence to abort.

To address this, handle incoming messages synchronously within
rx_callback when running on i.MX7ULP. This ensures the message is
processed immediately, allows the mailbox IRQ to be cleared in time,
and prevents suspend failures.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 49 ++++++++++++++++++++++++++++++++++++++++--
 drivers/remoteproc/imx_rproc.h |  1 +
 2 files changed, 48 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 3be8790c14a2ccc789dd40508ec274000ec09978..1127c56388fd94f296c80db5c01a5d431d669c4d 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -22,6 +22,7 @@
 #include <linux/reboot.h>
 #include <linux/regmap.h>
 #include <linux/remoteproc.h>
+#include <linux/suspend.h>
 #include <linux/workqueue.h>
 
 #include "imx_rproc.h"
@@ -111,11 +112,13 @@ struct imx_rproc {
 	void __iomem			*rsc_table;
 	struct imx_sc_ipc		*ipc_handle;
 	struct notifier_block		rproc_nb;
+	struct notifier_block		pm_nb;
 	u32				rproc_pt;	/* partition id */
 	u32				rsrc_id;	/* resource id */
 	u32				entry;		/* cpu start address */
 	u32				core_index;
 	struct dev_pm_domain_list	*pd_list;
+	bool				use_sync_rx;
 };
 
 static const struct imx_rproc_att imx_rproc_att_imx93[] = {
@@ -725,7 +728,10 @@ static void imx_rproc_rx_callback(struct mbox_client *cl, void *msg)
 	struct rproc *rproc = dev_get_drvdata(cl->dev);
 	struct imx_rproc *priv = rproc->priv;
 
-	queue_work(priv->workqueue, &priv->rproc_work);
+	if (priv->use_sync_rx)
+		idr_for_each(&rproc->notifyids, imx_rproc_notified_idr_cb, rproc);
+	else
+		queue_work(priv->workqueue, &priv->rproc_work);
 }
 
 static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block)
@@ -1009,6 +1015,38 @@ static int imx_rproc_sys_off_handler(struct sys_off_data *data)
 	return NOTIFY_DONE;
 }
 
+static int imx_rproc_pm_notify(struct notifier_block *nb,
+	unsigned long action, void *data)
+{
+	int ret;
+	struct imx_rproc *priv = container_of(nb, struct imx_rproc, pm_nb);
+
+	imx_rproc_free_mbox(priv->rproc);
+
+	switch (action) {
+	case PM_SUSPEND_PREPARE:
+		ret = imx_rproc_xtr_mbox_init(priv->rproc, false);
+		if (ret) {
+			dev_err(&priv->rproc->dev, "Failed to request non-blocking mbox\n");
+			return NOTIFY_BAD;
+		}
+		priv->use_sync_rx = true;
+		break;
+	case PM_POST_SUSPEND:
+		ret = imx_rproc_xtr_mbox_init(priv->rproc, true);
+		if (ret) {
+			dev_err(&priv->rproc->dev, "Failed to request blocking mbox\n");
+			return NOTIFY_BAD;
+		}
+		priv->use_sync_rx = false;
+		break;
+	default:
+		break;
+	}
+
+	return NOTIFY_OK;
+}
+
 static void imx_rproc_destroy_workqueue(void *data)
 {
 	struct workqueue_struct *workqueue = data;
@@ -1103,6 +1141,13 @@ static int imx_rproc_probe(struct platform_device *pdev)
 			return dev_err_probe(dev, ret, "register restart handler failure\n");
 	}
 
+	if (dcfg->flags & IMX_RPROC_NEED_PM_SYNC) {
+		priv->pm_nb.notifier_call = imx_rproc_pm_notify;
+		ret = register_pm_notifier(&priv->pm_nb);
+		if (ret)
+			return dev_err_probe(dev, ret, "register pm notifier failure\n");
+	}
+
 	pm_runtime_enable(dev);
 	ret = pm_runtime_resume_and_get(dev);
 	if (ret)
@@ -1202,7 +1247,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8ulp = {
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx7ulp = {
 	.att		= imx_rproc_att_imx7ulp,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx7ulp),
-	.flags		= IMX_RPROC_NEED_SYSTEM_OFF,
+	.flags		= IMX_RPROC_NEED_SYSTEM_OFF | IMX_RPROC_NEED_PM_SYNC,
 };
 
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx7d = {
diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
index 1b2d9f4d6d19dcdc215be97f7e2ab3488281916a..0e3e460cef4ed9340fb4977183e03143c84764af 100644
--- a/drivers/remoteproc/imx_rproc.h
+++ b/drivers/remoteproc/imx_rproc.h
@@ -18,6 +18,7 @@ struct imx_rproc_att {
 /* dcfg flags */
 #define IMX_RPROC_NEED_SYSTEM_OFF	BIT(0)
 #define IMX_RPROC_NEED_CLKS		BIT(1)
+#define IMX_RPROC_NEED_PM_SYNC		BIT(2)
 
 struct imx_rproc_plat_ops {
 	int (*start)(struct rproc *rproc);

---
base-commit: 5ce74bc1b7cb2732b22f9c93082545bc655d6547
change-id: 20251211-imx7ulp_rproc-57999329239b

Best regards,
-- 
Jacky Bai <ping.bai@nxp.com>

