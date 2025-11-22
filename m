Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011064.outbound.protection.outlook.com [40.107.130.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA0726F2BD;
	Sat, 22 Nov 2025 00:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763773148; cv=fail; b=bj0vnExoVfRIURk1jESoqFwfp77PKHf6aSyg9HBCBGDdpdQEfV2sUVknCs9Es9cz+gnsGhQmnGoKlTGJ9fcHaSS+uCKzo+L8Py6uCn1ahXI7k6cYEeSySmxWiMckUGDCkP3GhwQktrbQypwwtZNodrYlPhobRgnE+cIKi1R8+S4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763773148; c=relaxed/simple;
	bh=QFgcq+/vJOPBQnuarzEiamOM0pOuWoqrW07EYj+I1xQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=d5tYrZeqrmM0oxsCDQpoqsr3pYasdVUi0DNdEKpjWSGU3EQLmuRy3GjpueJi9zZBE47G6/Ae4LbTu3DDy33k7LdJ1wyhvKirg3OicBZedOFR+g1dkfKkR6OiSvxKxKMSjNJOzNeHATSqmN1Z0gmXYecQI+HfG8CrAJ4N4txV2HM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=wF35D41i; arc=fail smtp.client-ip=40.107.130.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="wF35D41i"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GYMtXWsftNTkUyd2T4px2XAx1XsWVQt8DkFnCEosFmg503IoaFxotoS9uQfpmGn4LbOGQikJ/5xHd7xbsi46hJkGS2rKGchspDZQKLgFE49EyEVGGzuG3y9rwNH7RvfQ6DcMA8sHJMpqNIzjt6Cr5h7vyccOvowmQF3/zWxJPGTTCADBPrp4CBtZFG4rNirJzkiKLgUIez2VTt9bt1r2cuzEUeH1/DHdWEITxFn1U6bhfRFP2yq4Qm2udOoGC6pXXFa/IznqDvx1XVFKUPQn/MUMZUqWcN6WJLHue2XGXIjGfkJRYoM4Zo7QBMXpLx1Y0McCScb7wzz85VCc7zI2Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SojN5pku4BIlDFi7rFsX0vkaX+5Una4ScDr2wyqLx70=;
 b=dnKXNxYzQdxClQXyerkkF4N6k2lFD1AF+SoC0lA5nUT+texhfv9MksbwbmOklA4c5NUbpomz8/uWxCDqhQcbpzUvkKXXGT5DUs83ZAzzxcsiY5mAhufC3ltrszoWTozpBLEf8BcSHzHdW48CHW/ujJ1hNg95MjHnXwjLdKpfF1t5cgMSChCgGuVqAf+BMI3OaL1OhkD4ijDjF4JxCZb179/Z1VF0ENaN7Kj+aWQrZNhBQ4Y/VzWZqWsj65CiRz5HF8lckJjOfb7XZAe00OYYFddWRhO7KgdPEpfW5SNi0pLpI2ixyQDjiWM4eI4kjNVwadMaiA0jaajWvRKnBdbalg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SojN5pku4BIlDFi7rFsX0vkaX+5Una4ScDr2wyqLx70=;
 b=wF35D41iyxUxLmZD+0hJfAbAaTPCFyyj1gptC7t5gf38O9W8EKg/RfedEy/uzi18WUPYpalxkifaddaeEHZKo5PXpbcJcXmQCcJ9obv0r0kskB9tyWCeb79h9ggjnp61aiaFTGRD8GMJAMpWjuT8pyqZLGtuXUsD+ao/tM1qFvHUa7s9d7a2w5P+bnCVtEZNHwzRq8ZCweGhRHDOin6EFVAhtjrjEy26eZSzuFADT+/GHs252Tj9zRDstnhOqT0sRsk9XJiAEl9mDrtw0k2w8aC/rnioe3zX9bJr2vs0QxCvmbXUU/RruL+plQRHKdf8REHSgiH3x3fDxXaugIKSzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DUZPR04MB9917.eurprd04.prod.outlook.com (2603:10a6:10:4d8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Sat, 22 Nov
 2025 00:59:03 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9343.009; Sat, 22 Nov 2025
 00:59:03 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sat, 22 Nov 2025 08:58:20 +0800
Subject: [PATCH v3 5/5] remoteproc: imx_rproc: Add support for i.MX95
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251122-imx95-rproc-2025-11-20-v3-5-9ae6ee619a78@nxp.com>
References: <20251122-imx95-rproc-2025-11-20-v3-0-9ae6ee619a78@nxp.com>
In-Reply-To: <20251122-imx95-rproc-2025-11-20-v3-0-9ae6ee619a78@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI1PR02CA0058.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::9) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DUZPR04MB9917:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a7d6515-08f3-435e-4546-08de29625489
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|7416014|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZTZGRjFNT1pOZ3lCdSt0NW9RSE1EWGtJZllCY05ZK3JrVDFLd2lmeERIRmpX?=
 =?utf-8?B?VXdxRlUvSTJOT2U5ZS9jUTArSCtGREFvTWJ0OUcrbzRlSEdLTlN4MEhXWnhu?=
 =?utf-8?B?Z0ZGbE5ZcElqL01mSFJPcFprb3FwQWowZVpWZ3plN05qcCthaVJDdnlad2Vy?=
 =?utf-8?B?RllQajBKaFJBL2pVWkxoVU5VODhvWmVwUjFUcUl3aHhEV3k4cUpwZjRvalNp?=
 =?utf-8?B?TVNxekw0akU2U3pIYVhVbkNtQXpMZjJvUVI2bTRIRHh3YUsvRUMxcDd5OVJy?=
 =?utf-8?B?WFdCOWt0d2NpL1h6Z0pkMUxSSldyNUZOdDl2UjBoMEFwRDZraGhkU2JYdUUr?=
 =?utf-8?B?dUF6QVQ0MW81TlZmelA4UUFacUZOYVhWQVllOVpZdnBWT1RTVDJvaDlQMkNv?=
 =?utf-8?B?OEZMSkxtbkdMTG1iN2JvNXkzZXR5WFZRRzRBbGp6dytpU2hlZnhFTXAzck5k?=
 =?utf-8?B?Z09MVTN4dDB2THlMelc5elVneXQ3My9FcDkycHJ5dGl4b0N6MEZJZDVINThF?=
 =?utf-8?B?WWowYm5JdklsNWNVcTZUK0h2UUF4ZzZudGptY2pYS2pBL29ubERLOHNjQ0NH?=
 =?utf-8?B?NlpFdkE4SGVXMDlSVW9WK1RZQmxjVGNteUlkbkZBamtORmM5eWJnbTJFdGx2?=
 =?utf-8?B?RE4zUUJHOFdFdU1ZVVA5QUZFaXlvUFg5NTBpWVVocWFXM1h4cmoycW5RSUtz?=
 =?utf-8?B?b2xpT1hCTFZzd3BleDl3UVNCaVBETTlFSXl1cjRLRFRjMjJndU55V2VITmpq?=
 =?utf-8?B?Ky9ZQ2JTMC9id2p2L2twTC8yNjFpRk9XSk9VUVBMSmwzK0J6SHA2YndTbkE5?=
 =?utf-8?B?cXk1MFVPSTVpQUd3NEcyZU02K0N5elp3Unl6ZXBkMlBwK3VyWmNLa2xveVV2?=
 =?utf-8?B?b2ZkUEx6RzlucFRtbnpYMXlhUm9qODVLMVBIWE9nTGdFcTJlc1NtY01Qa3Nl?=
 =?utf-8?B?bWUzeVJKMzYyUmVFOVFYdktOcHd0dTdIWEo5Ujd5K3g0YWVQVi9NMTZEaGRH?=
 =?utf-8?B?bUovTm9pU04za1JUbS9JZTR2VFBqUVZpaWE4MmZWUjlQM2h1dm9tNXBnTEJR?=
 =?utf-8?B?akV3UjFGcklZSGtjMHA5THZ5TEZHU0NSYUJIVTBzdzEzZDh4VG9VMkFnUXJu?=
 =?utf-8?B?Y0pPS0VTeHEvaTJnQXEvcHdvWlE3T1NFTUEyQWJCaHZzSUp0YWxKSS9STkEw?=
 =?utf-8?B?U0ZhRHB3cktlL09tL3d2eVVCRTF5OVJuTkFhb0lnYmpoeWVtVHh0MWpKMytX?=
 =?utf-8?B?WFVCVGZYMXc5aW1vLzgvSjdDd0F5NEdBZWovZDF6by9raXVrdUM5K0xueEMy?=
 =?utf-8?B?NmFPY2lQN0hxR3RabE4yMHlJckJNTUF0alFUN3FGcHNKYlRkclJqWnFGRVpI?=
 =?utf-8?B?aHM2aWptaUtpZGlLK3AzNjFkblY1TjhYdERoQVQ0Y09telMvUGZnRHdyTW1k?=
 =?utf-8?B?dFZUdnYyUjJOVk4vZjZmMHhhb3d5L3c4ZC9zS29vWWJ0bTEyWXAxaWltcGs5?=
 =?utf-8?B?L1BJOVFpN01qcExtZU1EMWpSZlhxL1JhWDAxZ0U3ZjMvZDY4YTVodFBDRU45?=
 =?utf-8?B?Q0pFb3NuMndwSk5UN0hLQUVvS1VNcFhwa1VJTENJNzBISGlLbXNXa3pTZWky?=
 =?utf-8?B?a21SN0xuUmxtdDBCOWdaeTFOMzkzbHhWSW1QT0lFSlFFR3ZVaDk0QmgrWXJG?=
 =?utf-8?B?dEFMbjZJYkNWTENVbGppeElyNnhYbWN0KzE2UFhTbS82c3hIU3BqUnFaZG9Y?=
 =?utf-8?B?SzVybVM0WUFaOHUwNTd6bUZUeFhoazB1cC9EZUpCdTlGK0NjUmdWVUpFTTgz?=
 =?utf-8?B?YTRlWWdOc2tlSWk5dU0rTTBGcDA3WlA3MzhSb2tXcU1lNlN1enB1M2ZqckhL?=
 =?utf-8?B?Nlp0TUlpZkNWQXcvT1k0S2hsbmNXZGxvUTRxOGR5S3I2dkluOW1zRlRhYnha?=
 =?utf-8?B?YVIzZC85RER5T0dCcFYyTmNxUXdoQjV4N3Q2MGZvL1ZEWTVlVUJxR1Y1eSti?=
 =?utf-8?B?UFRsK0N6dFhvSTZWaEJHUFJBcmFvTjhyUVBEb1dIL1JwcFNHQ0VOakZTbW5K?=
 =?utf-8?B?RXF3RURSaGpEWUdmb3J6ZHpJc2M5RGJFN0FSZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(7416014)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TnpCN2ZzZUFMVXV1K3A0Skp0VVEzNGtwZjAxM00weG9ldUFvWDhRMjNaSTRG?=
 =?utf-8?B?cTNFRm1oWkFXZWlzRDUySGVxNlZheDhQSUY2NlVQbVBJQ1pMLzNEcm14WStl?=
 =?utf-8?B?MXRoWURUdEl3bUJBSjhSNS9Ia2xCeHRSTXp3WUwzU042V2FLSXhjNnZ6bm1o?=
 =?utf-8?B?LzZNMlBQcG45ZTlRVEJRdXhVSTFpbGYrUzVoSEF2SEtBVEtGekpTbE9ZOHBH?=
 =?utf-8?B?SzE5SlVnZW9yQ2lnRDV6L2gzUzVXREdBU3FEdlZISjIvMHVOeEhyV0ZlWFZq?=
 =?utf-8?B?V1paSndxSmdtdFJnenF3aWRYTHF2enhOYTd5Yk41cTlpTnByS3kvVVZDTUpn?=
 =?utf-8?B?RU5USlJLK0RtOElIN1FlSVIwb2xvMnZZUnVVc3I5aytMZk1WNDNZVEJJOFh5?=
 =?utf-8?B?R2hZNTRLZUlIV3FQWHdjUnBuU0VDMjJqVTZVUFRDZUFkd1pORXAvbVlsOGgz?=
 =?utf-8?B?clF1RDNZZHBTNWsrTktpMzNxRVRLQ1hyLzRnMzRkYXllaXYyUG9waWR1YVNu?=
 =?utf-8?B?aTRVOGNKN0FqZHNEUFFaWEwvYnZlNWJKWGp2OFRqcVpBMVk1b2U5MzRJOW1Q?=
 =?utf-8?B?ck04R1RPdWg5UFF1bGpDTkpxa3NNWlVUQnNmcHE2cXlkN1dieXM3YWkyd0ZU?=
 =?utf-8?B?M1hkdFI4aHJBV3VFQVpPYkk1OEgraGFHcU05RWl5ZlNPeWt5LzRJcURkakZ4?=
 =?utf-8?B?bU9xcmp4WnY2a2hvS3BmWXM3VU56Q2hVQ2gzMGJBLzJpM3NDSmYrQzNUV2xx?=
 =?utf-8?B?V2JMdEc5blBxSDlnUEZJNU9qbFBBa1VMdVJSN0V1RzdGQmFRWDl5UmtpR3Z2?=
 =?utf-8?B?dFFKYytVdDYrWC9zVDM0R0lROU9XQjM0REdiNWxCT3FqWFoxdHIybTdqLzVZ?=
 =?utf-8?B?VlhFWkVhL0RnUlkzcnZRMlBCNUlLakFoWlNNdlJDNGwvRDRXOUlSLzR4R3FM?=
 =?utf-8?B?bXd4MzB1OFNGRW9iNE1hNE0ybU5LV1l1NkIvM2x3WUJWZnc4MU5zOWd0bUt3?=
 =?utf-8?B?cGtTUVdjRG9FdFdCL3ZuNmY1WmxLRFlNcktPN3E1V09BSVdTZnRjMmkwMUQ0?=
 =?utf-8?B?VDhOdXJvSGhEK2M4enVBdmVBZTErU0p4bW5iRFo5Q3N5SHRZUEZUeTVVY0ZX?=
 =?utf-8?B?RTdjRm4zazVWemw1TGh2L1dhWlBrNkYvUUU5bGZlY1ZPUWZqVUV0ak5LU2Jh?=
 =?utf-8?B?MUFrUG4vNlVXKytyRC9RSkZKbFpRRW1UWjlOUFluYWt4Z2xuMlhoaXo4d09a?=
 =?utf-8?B?Wm9BK2FlL1E5OEt6YzJJT1V2WTFTUjZ0M2tLdWZJQVpBeTFlb0hJL29HUWdP?=
 =?utf-8?B?cHN5QnhFQm5qbFlXN3FrRUxLYnd0Q2k2b2Z1Z0pPRlZaeUlXSloxOFhVM1N6?=
 =?utf-8?B?MHRCZXUwRXRsRUxIblp5VzU1Z1BWKzcrZjFiMEEvQys1cy9xaWE0QlNSSEth?=
 =?utf-8?B?eW1jSVBXNmJEWTVnQ3JGeFhpZlhUbWswMjF0RnhFb1FobjBCT2JVZ2tpeGRn?=
 =?utf-8?B?NDZmbmtkNk52eVlCS0ZlS0laNnR6WEcwUllEQ0FTNUtrbDROblFkMmZMK3JG?=
 =?utf-8?B?YmUzTDlzWVdraDFCVWx5UkhnSTlqTitHRE53ZENWUWYxOC9xMXc5akJlTGhl?=
 =?utf-8?B?MVJpVjZkOEIwSWIxZmFlS0xSeXQwTS9zanFMUFlLcG9qcWFKcDZCb29LbUVs?=
 =?utf-8?B?MlRLMWcrM2dBQ3Q5RTV4bm1WTjlJTlBaLzNDSmdqcHQyL01DNzJwcjRQY0xz?=
 =?utf-8?B?RytCeFc5RW1wOTA4czM2aXZ4Q20zdXpuMkFKeXA5U3pjY0srbW5WWmZ3ZG52?=
 =?utf-8?B?Vm5HUU5KckZCRDJJZElPTTZXMFN0RjRvQWwxZG9JNUxESzBEZ0FQUGVPUEhU?=
 =?utf-8?B?Q3dhcUw1NHV6aE8vT25MZkw4K3g1ZmdvRGdLTEZ6cnhZU1ZkZytCS2VQVXNQ?=
 =?utf-8?B?eGNyZXRtUk9jSTNPSW0zTlB3OFNZUktuN3lzQjB2TGVWVyt1emJBTFBlODFa?=
 =?utf-8?B?T2M0TWhhcUJteGNLYmZZamFsd3VkbmJKaDVIMDlRV0VHcWtMQ3FaK3h0OU94?=
 =?utf-8?B?VHlRd2RzMitSY09hL0NNWkQ1TnFOT3RRdkxHbEQvZUpJT1RmKzg5UFRpQ3pz?=
 =?utf-8?Q?TuNQ1dEZ+7Je6rg4SuIpzdkFH?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a7d6515-08f3-435e-4546-08de29625489
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2025 00:59:03.7998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5k6oU029mKEWTp74fAvKdK291kvbQusvfd8AF8+KbL3h3qJjK5bI1HkAZR4pCEtzYoHqgQ5nMZ+QjSCbZAguAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9917

From: Peng Fan <peng.fan@nxp.com>

Add imx_rproc_cfg_imx95_m7 and address(TCM and DDR) mapping.
Add i.MX95 of_device_id entry.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 2ef5789f6f2a00d9159cd54e67ae9b2b96f798e8..2ff32f01c804d3a120468d0e2e8832c5c67dabb9 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -130,6 +130,18 @@ struct imx_rproc {
 	u32				flags;
 };
 
+static const struct imx_rproc_att imx_rproc_att_imx95_m7[] = {
+	/* dev addr , sys addr  , size	    , flags */
+	/* TCM CODE NON-SECURE */
+	{ 0x00000000, 0x203C0000, 0x00040000, ATT_OWN | ATT_IOMEM },
+
+	/* TCM SYS NON-SECURE*/
+	{ 0x20000000, 0x20400000, 0x00040000, ATT_OWN | ATT_IOMEM },
+
+	/* DDR */
+	{ 0x80000000, 0x80000000, 0x50000000, 0 },
+};
+
 static const struct imx_rproc_att imx_rproc_att_imx93[] = {
 	/* dev addr , sys addr  , size	    , flags */
 	/* TCM CODE NON-SECURE */
@@ -1445,6 +1457,15 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx93 = {
 	.flags		= IMX_RPROC_NEED_CLKS,
 };
 
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx95_m7 = {
+	.att		= imx_rproc_att_imx95_m7,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx95_m7),
+	.ops		= &imx_rproc_ops_sm_lmm,
+	/* Must align with System Manager Firmware */
+	.cpuid		= 1, /* Use 1 as cpu id for M7 core */
+	.lmid		= 1, /* Use 1 as Logical Machine ID where M7 resides */
+};
+
 static const struct of_device_id imx_rproc_of_match[] = {
 	{ .compatible = "fsl,imx7ulp-cm4", .data = &imx_rproc_cfg_imx7ulp },
 	{ .compatible = "fsl,imx7d-cm4", .data = &imx_rproc_cfg_imx7d },
@@ -1459,6 +1480,7 @@ static const struct of_device_id imx_rproc_of_match[] = {
 	{ .compatible = "fsl,imx8qm-cm4", .data = &imx_rproc_cfg_imx8qm },
 	{ .compatible = "fsl,imx8ulp-cm33", .data = &imx_rproc_cfg_imx8ulp },
 	{ .compatible = "fsl,imx93-cm33", .data = &imx_rproc_cfg_imx93 },
+	{ .compatible = "fsl,imx95-cm7", .data = &imx_rproc_cfg_imx95_m7 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, imx_rproc_of_match);

-- 
2.37.1

