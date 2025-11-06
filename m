Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013008.outbound.protection.outlook.com [52.101.83.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C372417E0;
	Thu,  6 Nov 2025 03:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762399876; cv=fail; b=TtrRLmXCpGR8LyLHB8E1nRSBATIYicTT/7dAn8/b/bUuzExi3z5C/C3UUTMCAGeOsnqBhq+d9hkdMPYLQQZtZhm8MHeDdruS9mlyk89ameO2yAtQa0L95cdZv4yWb2YjDvxKTjc1L6hQyDue3KzYMaLpYX6mWo9xX2rW7o1m0oM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762399876; c=relaxed/simple;
	bh=p46yHJMi6Hdv0X/Q/8Sj/NdQeh73SSgkFBYhVZvarAo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=rvpAdIgjpuWvr11+911+fBMFPSvRVTZhT6fl9v7cVLakhj0Tdtw4dV1z6eo+mAyGy2GTIly+DME0SK9DS9gZTdcvRbZezkWtqiwqxsYrDWcy1HBlDEfClQuyIpLXVDqIEHgsQoWDMi7g8LwYL/53ja1oc8A439v0kWaxWggPivw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Finv3WB4; arc=fail smtp.client-ip=52.101.83.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Finv3WB4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zegvaul8We6J24ARdjDwLhsaQx2W7/Ta9VxV1X+nwqa7DyRT4P4z+eW0LsQ5sxPABmD5R3kqaq4uSU6s0jXIe0wajvISrMyiPxqDHYThNptImzdHCJnc1FOukfrAv1is5Gnpke2XWX+0y05Deq5y2HFA3YD1Pt1jbCD1K9/f0k/celoN/9sL/jZ6c/6YPj99rixiGaWkgx1sJ5XWa2Ga+3blhy+fqnU/iT/kC2TbKfY+pzh0tWJzALBNLy5TpMhQxPQYHhZ7uEvA7qHWWRhIOKqA4IjPnkWrIqVLjjOCZFlCN/zpz5WWzVnbev22zYy4Dd4aI3hzvvGCj25ffelLiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=64QVLc8cGUfZENk7MRBk0lJp87eCEUcV6S1lcOA7LG0=;
 b=Lc5YLR7jt775KWFOczFPIr9iMgkfpCzu02EBcJfCdiTA6OXCxLTreGjoDDdQox+5nmaTOnwxI1j+iPmxFpBIzn9oUMGzOhaV9XKw531NqSR2RD5+odwu/0CzobGfCWfPodTEQkewAbEgxI1BPNL83KDXmWvMxoI0B/a4GzWHy/delBnOjeaiuCDjdbgKYjZt8Cysfk2mcNmnfMpw5+ZUQwt9uP9gx0NeogsSDWUPBY3+xlVX/b+fKd9R9LcntdZrXC1x2VJgXDnyaSHrL+M3jsRdBTbJoskcT3i/iQvpq850jnkBhX2VSEdZ75ut7VlvdOSapDXvLyWDhnAPRoGafQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=64QVLc8cGUfZENk7MRBk0lJp87eCEUcV6S1lcOA7LG0=;
 b=Finv3WB4Ra/wdlARH60SPjrU0bWNkMaiZj+wUKYeuzNhS3k8pTMD9mjFCjGTdcgkfq5AL7o//t3JXQ7cvz+7/v5oHHqcjqbyy5vD//uQElCnxb5XR/Nof07kPLLY+rXVIQCM/A6RpKsnYoGeRSUx5fkPdM7P/OTDKcN5zx376ThnZhyja1QS/BBRJA2ojP6NZGxIqMHJ8lZf6460es4ve8ILmzm/K581l+/dYRMLHNgsSqFu5NiUkXZt/uYQsE1r/rso3EUOXbpSjhahtAXShh7biNSfXv11eSNcgGVqnNIy3D/wpvzHlexM8pZ7HNchN4PBDC0InIXR8TF1KqI0Ew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI1PR04MB6813.eurprd04.prod.outlook.com (2603:10a6:803:13c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Thu, 6 Nov
 2025 03:31:09 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 03:31:09 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Thu, 06 Nov 2025 11:30:30 +0800
Subject: [PATCH 04/11] remoteproc: imx_dsp_rproc: Use dev_err_probe() for
 firmware and mode errors
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-imx-dsp-2025-11-06-v1-4-46028bc3459a@nxp.com>
References: <20251106-imx-dsp-2025-11-06-v1-0-46028bc3459a@nxp.com>
In-Reply-To: <20251106-imx-dsp-2025-11-06-v1-0-46028bc3459a@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <frank.li@nxp.com>, 
 Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762399839; l=1769;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=p46yHJMi6Hdv0X/Q/8Sj/NdQeh73SSgkFBYhVZvarAo=;
 b=sdr9UBOtXQOSEerZg22VHyaITfQcybY5FjMIET1PV1lv7TPjiCrn5vrxR4mozbV/oCv3HJJaW
 0XzHGTHwi44BUnAXuylwmbIp0z832NdbJlMnAVsoIY/Z1xjTZtom+FO
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2P153CA0028.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::15)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI1PR04MB6813:EE_
X-MS-Office365-Filtering-Correlation-Id: e3b1920b-6ea0-40f3-c2ce-08de1ce4ed93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|19092799006|366016|7416014|376014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TUNVR1Y3VkRxb1paT2VHQlJraG1EZFdMeEx0NmR6VExteGZHVXB1Qkc3Ky91?=
 =?utf-8?B?NjdYcE1qMWdkcURzc2N1bExLYURBSFpJakM2b2xwRjY3Tis5Q0MvWlA1Y0NO?=
 =?utf-8?B?V3I0dXpyclIwdDN3TE80QTJnaFpWcmErVDRtNGFtd0dXRWVzUFVzdW1LQUdL?=
 =?utf-8?B?WVcrWWZWYU1BblNBOHFyWWtya28zNEtUS1VFdG1wTlJic1pBeHIrRnM3MkRz?=
 =?utf-8?B?bzRoaWNMc0RJQUlRZjRXcVQ3SnBicVliU2dNR3JqUW5JVThYWjZETXA2bGhu?=
 =?utf-8?B?Sm5Rd0RaWkIwenNaTFRQRnlUK2ZuRHEyRVdTMHE2NFFiQTFvVXZUNnREK3hQ?=
 =?utf-8?B?Vkg0Zi9qSDVXem1mNHN4ZXFYOUwrV1BSTE9IRVk5VTdUR2VRWjhjMFlzK2ox?=
 =?utf-8?B?NUxiMlVxTC81Lzl1TEw3akJiTWdrYi9tZ2xZVVBLVytoYWY5cUJzeXNpcmZw?=
 =?utf-8?B?WnBhditOcEV4bDAzQ3lpUTdtYnVhcTdPd3JZL2xmNzNHMUE2WUZZcFpLYjAy?=
 =?utf-8?B?U3IvS1h3RjBiU1A2ZHlpT0lOYXl3VEZxenIwZkJvQnNlTmkrSUFWUjBKaHZE?=
 =?utf-8?B?d3FidW9CVGg0WG4yUTNLUzhwdHZPbHQvK3V5amVCVlE2S0pZdVpabExwMHNE?=
 =?utf-8?B?bnYwYXp1bXNiajFIK3dERjJJTHk1OFZldS9HSmM4b1h5YmMxY2piMVpyWTFi?=
 =?utf-8?B?MUtqZ1FlQnhpT1JVL3kxTURLbnlWUkVxTmNnTVh6eVBuUmlSRzZYcjVXZDRQ?=
 =?utf-8?B?amxYVVM3TERXOEpjNHZ1UVdYSVRDV2hpZGsrV0hpa3V2ZHBlcVB3T0luRnE5?=
 =?utf-8?B?YTRUeTJWMmJabUUxRHBuR2tRN21vdmF3VHUxYklVb1VnOW53b3VLL3FsQ0Jx?=
 =?utf-8?B?ajlVa1BLQnZ0Q1hpYTgydis5S0t1Z1UwaWNGSS9XUTBwVzgzMkVIeEo1STBK?=
 =?utf-8?B?TmJhaFRxR2wvL2M5dEdaRkRuSStqeEdzZFFNSm9melVFMTY0aFQ3ZnhOK0tv?=
 =?utf-8?B?OHJNMEwxNDVnb2ZaTENIbFNKb2llOStPeWY1TU9NamNrYXB0REI4cTdlR25o?=
 =?utf-8?B?bzMyRTEzUE9pNkgzcm5vK2t3ZmVmaWcrYjAwWHFobFdiaHZ6QkM5dVFpRzJa?=
 =?utf-8?B?dEUxOVlvWitsalFGbnNXS2lGWTVteUEyNEVRVEhsa3FUS0diM2lOYVB3QjEr?=
 =?utf-8?B?emJWL2VSeFNnVVMrMnRVQ21Td0Y5RmpQSFhGaWx3L1RQRml6RWtSWHlKdk9j?=
 =?utf-8?B?SFhQZlR6UWtnWTcxUzU5WmNIYUhWK1FRdTRNWlBGejNlMnRyS25IaG1hTEN1?=
 =?utf-8?B?d2NnK2g2SVFJVm5jK0ZnUjk4QUQ1dkpObzVDZUhlRitHaHdQdmo0bTkxSFFL?=
 =?utf-8?B?aEFXVnBZTlJFMjhHN1lyQTJzVEpFcUk4cFZSd3BvdGNxNmd3SGZpaExZUUpO?=
 =?utf-8?B?VXVUc2dBaEYyMEJFSmtpekdRa2huUjdnN0ovZndYaHY5amY4WmVZQk9LdUJP?=
 =?utf-8?B?a2l4eFVvZm1qWkZvM1p1V3JuVkNYS3pqRVZBL2ZsTGcxN3ppOVpCRUFtcUFn?=
 =?utf-8?B?RnN1bFh2MG1mOFZtMFB4M0tXY0NTRW9rS0pteFB3U3BmNlIwTDBLbHo2Qjlq?=
 =?utf-8?B?UGRzRldvb25kVldxc3o4ZlR1SXR0WWdGTEVQZWRsVWNlSFAyTHFJd001dzVk?=
 =?utf-8?B?SlJQdGRndXliQWlwcVJDZndZQ0s2UDQ5Ull3cnNrUWtpa1pTeitqNzFRQXFv?=
 =?utf-8?B?bFVQSlh2NVU3NGljcG9qWFkwVHUzYjdaakkxVFdDaUpNK3NZUjFvb1BvSmtp?=
 =?utf-8?B?cHBRUWdEZ2dCNFVoSURpd3I1SXRPRldiaEdhRW5sVTZHR05yMjBhYnNXWFlv?=
 =?utf-8?B?Zms4c0NJeHJGaXkxZG9tQStuVTdsNGRWNzA1cHpZbko5YjQ3RFNCYlp1NUw0?=
 =?utf-8?B?OXJUbEpENU1PQkhwY1pXc3pSR29ERVozQlpiL0pPekEwd0RSVnRVUGMzU0V6?=
 =?utf-8?B?MWdtbEFDcTd5M096Z0cvYjdFK2NMZUdDTmp4Q2hsSlBIMEEvN2lRUnNBY291?=
 =?utf-8?B?SDNrNXpNZkRvR0J1WlZBL1poRll5T3dTbWV5Zz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(19092799006)(366016)(7416014)(376014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NHRtRXNqek9hVFU1QjVsekFGVTFrTDRZa05YazhKbTdwcXJabFpSaVpVbC9Z?=
 =?utf-8?B?TWFqc09jcW01ZExLRWRRdnN4UUNZWHJRZkxjZlhIRFZPTE1QcHZQT1NhNkZ5?=
 =?utf-8?B?OWRGR01CdEpCSFllSFVHUHR6NzVlcTcrWVpMNDhoZ1dPL1NmcmVNa1B2S0dT?=
 =?utf-8?B?N0ZEeGVqSnRWMUZPVVZabEdPdG00amtTTGlyYkhCRmlxNlcxRVR6aWxxSUNT?=
 =?utf-8?B?UkVrbllPd3ZTbXZvbWdkQjRCMC9sTWZpSHpNMTdsTTNpZVVwSzZqSkFyd0lG?=
 =?utf-8?B?K2RhNHM1MGJFYVZVbm1zc2gwWGQ5YXhCYk5aOFdrdWxQaThad1RpRU1aZ0FU?=
 =?utf-8?B?S3NDTi92SFN3aEsxN3Y0dTVIdEt0T0E1MEp2aERGQTAvb21qaXlXSnF5WEV6?=
 =?utf-8?B?cmEyc1owQjMrSGhuRlYzMjU3UXNBQ2F1OU9XREw0OUpnU0YzcWtQbDVxbGtO?=
 =?utf-8?B?MEtZRVliUnM5a0x0SWl6clJCL1lKemtPS2R6aDhBSkVMbzJmWEdNcmk1dlpa?=
 =?utf-8?B?VWR1d1BjaHRYN0VHYVFXOXJUY2lrY1hDdS8rMGd5bEFnSWxIWGdSS0xuUDd1?=
 =?utf-8?B?SkFPWlpYdzczSm9GMk5rdWZ0SnJLTmROcTl6NnMvd2VqZ0tIQ2w2cjhqRmdk?=
 =?utf-8?B?MDdCVEN1OXlKVmRHUWJucVpmQXpZbTZMSmNMbmN2b0NzaHNtcmxZandIWlpQ?=
 =?utf-8?B?Wlp1Q3cvdFNPRk10NnBBWE8yQmd0ZmdLN0dFenp6RmV1b25ZR0xDWmlMVkVJ?=
 =?utf-8?B?L1owRjR6OWdMeFlRWFNFb0NrdXNBUGFzZHVnL29QN1VsNUplMnVtaldFZEZE?=
 =?utf-8?B?S0ZXUFFRRmZXRUhpZlVCYmRVVWpyM0d0SUVGcmJDUGI0cWt3N0VRYVN2N3BZ?=
 =?utf-8?B?WWNTcUVIT3FWN0FyblpuTUY1TXM1V3JBaFlaMTNPdTJ1Rm1WS2pjTEdpYVJa?=
 =?utf-8?B?RzMwZzJrcU9FZmhlRjNsc1NoM0ZlUy9tQ2IrZGJPYngzRGJoOHZ3VFh5dzI5?=
 =?utf-8?B?OWRQY2M3UWxYb3dBbGRHQ1NkcXdpNjhST1pPNU1VVEZXdXNkSklFbVl2UFpG?=
 =?utf-8?B?MkhKSFYyQVNJcDk2ejRqY1kxK3JlM0E5S21EeDZ1b0FmSUYwbHExNHNWMWNm?=
 =?utf-8?B?d0VGY0xWb3ZSU0hYM0tYdHhvOG94djdxSWQwTW0wSXhNMFZVODY5R1Y3enNB?=
 =?utf-8?B?MUZMVGVELzBIbHRLY3ExMXpPeHFhTVdCbFg1NnAvUzFDQ2pUaXZ6UG1veUUy?=
 =?utf-8?B?Z2pMdit0dUhkUDhxaEhGTFArczdWTTVaQWsxSEZ2S1hCZkhCT3E4U0lsWlZK?=
 =?utf-8?B?c0gyT0RGRmlLOXM5aWNDUkxZcTN2QWJkZUZicnY0UFN5eFR3Q2drM1l3cTZX?=
 =?utf-8?B?b05LMXFCVm1FZFJ5VDRkcUVvOVFlTnlpNmFKZmlTUDBHQTNwRklRZ0p5Y1JE?=
 =?utf-8?B?eVVyN0FPVjAzeFdDQ3dJSDZ5THM4NEZWSXV6ZUVnYTBOMEVQTXhqMkdaLzZG?=
 =?utf-8?B?RTNma01Zc2RwY2tFYXpnYXdTZHZlck9UQ3VHQ0JYN1JiQUlLU3RsL1grMUJk?=
 =?utf-8?B?N2tnbFAzTnV6Nzgxb3ZtcXpsRmRiK3NSUHZGUVluZmE5dW5Od21laUx2a2ky?=
 =?utf-8?B?dkFsK2NwbkUwdGdlaFVJYXk2ZFVFMk9GV1lNanlnVFBTb2Y3SGJkMGc0eTMr?=
 =?utf-8?B?OTdzUGlyQkFpSUFYOElOdTUwQUU4b2ZvUzVmelBZM3JFWmlGNXM0WXEzWG90?=
 =?utf-8?B?VWdDUFJ6bkZSaVhQQzRuRE9yN3phMERwYVhXMkRKalhGbEdnYTlPd1FtVjI2?=
 =?utf-8?B?QStlNk9hTm9MeGFSRUtTZ0xhS0NNR1lkZkZrNUhIUnJnTVR4TGdKWFJodXFl?=
 =?utf-8?B?bG4zZkJ3QS8zM0dWN0NLYmRUbmQ4dDBtQzEzOTNIQVQ4N05KMkxWbjFtTVdY?=
 =?utf-8?B?UG1DTzNKcGZCVUI4S0t5cjdPN0pDYVl2TTdpN3dyMHdWNmN6dWE0cVZnQkV1?=
 =?utf-8?B?SzBkNktDU1NTVFRtLzhwdVNib0theGRGMmpCNTk3SXhBbUhpSTNIRTZCOGlZ?=
 =?utf-8?B?dCtMeDFrWFZGT2FFbHE2OEtBRGxDOVJsbStqZSt0YmRCSzJ1WkJiazlxUHdt?=
 =?utf-8?Q?gvZdSMRf8BiQ3g0QwBOtt8eb2?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3b1920b-6ea0-40f3-c2ce-08de1ce4ed93
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 03:31:09.8895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SpDdEGjv4anUrTQBqTQpS+xbKSBcJtCc2FypPVautaC/y5ris2zIAsZySW2t1Wh31MVJIDJmypN3E1kGZ3+QAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6813

Replace error logging and return handling in rproc_of_parse_firmware() and
imx_dsp_rproc_detect_mode() with dev_err_probe() to streamline error
reporting and improve consistency.

Reduces boilerplate and aligns with modern kernel error handling practices.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_dsp_rproc.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index f5d0aec52c56664d6074272e276edb0c4175c9ea..87f4a026c05fbf1c9371058290b2d33cb94b9e54 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -1150,11 +1150,8 @@ static int imx_dsp_rproc_probe(struct platform_device *pdev)
 		return -ENODEV;
 
 	ret = rproc_of_parse_firmware(dev, 0, &fw_name);
-	if (ret) {
-		dev_err(dev, "failed to parse firmware-name property, ret = %d\n",
-			ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to parse firmware-name property\n");
 
 	rproc = devm_rproc_alloc(dev, "imx-dsp-rproc", &imx_dsp_rproc_ops,
 				 fw_name, sizeof(*priv));
@@ -1177,10 +1174,8 @@ static int imx_dsp_rproc_probe(struct platform_device *pdev)
 	INIT_WORK(&priv->rproc_work, imx_dsp_rproc_vq_work);
 
 	ret = imx_dsp_rproc_detect_mode(priv);
-	if (ret) {
-		dev_err(dev, "failed on imx_dsp_rproc_detect_mode\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed on imx_dsp_rproc_detect_mode\n");
 
 	/* There are multiple power domains required by DSP on some platform */
 	ret = imx_dsp_attach_pm_domains(priv);

-- 
2.37.1

