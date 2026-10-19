Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.26
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792436164;
	b=WJXUJldONdd7Y5gcRTy2NcTtv6I3+Iseq/GAt3PFCeVBQsxU4nUcLAnDnPHdeZLs1V4i
	 GHIVDPmIRpaLq8j0SVqe12n24+ADSMjZVv7qn8jA8k4twX68RyHdB2HxJuztL+WvJO3eH
	 ytlJ7Q0ddHhrRZxTHNSbK+Qm5y4mo3a0iGEz7XcZ9mLJCl2dycgZtX0FW1H0N4CKXOjQy
	 0uy1BHdMJGjPri4IafVKVPZHOtbG/RF31VYjqFo6/42yhKJJcuKEagGy9am55pe2aeiJv
	 HMRNL2AD/f8BFWhSv6JuzdoKffBfjycHa/jwTZdeUQUrt+X0G3f/OKXGU87yZssTyJg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792436164;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=5SiJjbthzEoN7p4x0pljo76HDhBNX/AzEQ3LMR0Ev5k=;
	b=GR9hmA3/lxnDpFBloY+rkypwjz3uGrDjb/6f4GK+sA9iJ75p4m+lHZJlD6nZw8mFpixp
	 8ZAkuJ8wa9jT7q4vX9Rp3kCO5Yjl+GLVwSgVJJBR2iv1KvWnOZd1WkaRmWZICU8cr7AVo
	 twBD06arKyaOY/WH5qDDu6UhvrlzO8cd8/FXuVybiHnMraRdipfxUKlkCy/qruP/UepuC
	 sIVnV3a2a50Y08+ZGY83cc5h4dWs2eHgVwYivPne8XHblIlDJyngW1t1RGu6isQCA3zRJ
	 GUH9knQdXYN4VPMjMGdan/mgfSJKs2Od3VVK8Z+J7Em+xTGV/Sr7qnA7xF/5+UateuQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Mzte5hWl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.26
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013026.outbound.protection.outlook.com [52.101.72.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8BE606A321;
	Mon, 19 Oct 2026 18:56:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E8BE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Mzte5hWl
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K1eAuh6v9DzBLB1GncvpSrCWReazMjm6PFlcuqDC6HORJ7wNZe+V/6qUSPOE5GAfVcFAu4f7OEmqK4MPT+ibQzBLUK4XT9kiq3vLmnzT1c6GgSjcGww5E0XyP3AJwtADPNmxeglW+wCqc8pEJ8BBHAU69DG81Nj+d4NNJnxLD+owta1XoSVDGA/hT0bkGCYfn17nTEQRqeW8victkBF5CvmlQDu5wvKGw+ZPPKATgCPdZtk8kL+MFhV5s9fb3HDVmn9rF9FtURMEZdV3j31thi/+cxSgYTvLM6E+pXneSKwVfddTdP6uPcgOkAqeNt+DNAEpvo5gbnXFzxXZ2GZPOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5SiJjbthzEoN7p4x0pljo76HDhBNX/AzEQ3LMR0Ev5k=;
 b=ZQ77fQ529mt5ayQdtYa+Qn8PBONt45NpcDPZFi7hgk/wanndkyv5C2TlJpqrxhoQ++u7OmUwM/3+UpwhsamzNmejrNgcBLE5OXlzSBnF1/bpG472S7BoAJ/AyGLlFf2l5CoTqSJoJ50ur7j7wrC5E0lXNk2xESnhk3NkgOYsdbK0Bp9cGQ60F49ikH2CetVHxBZkKW/+JXi9FbnXkXkf5od4/Sljftz2njEiV6M32fISijgnNzQYu8rn4Wy0ftReuGdOZz2bDTCfdYj4btzFCej0Gp7Dqfe92E7WL0GTBWtfZJRep5fHtBgTaqbYB2VOQtB/OFxn3qc6j9AnZd3NJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5SiJjbthzEoN7p4x0pljo76HDhBNX/AzEQ3LMR0Ev5k=;
 b=Mzte5hWl0JWYXZFbOFx1KW+bXvoWc0x3T8VgfBvbqcpTKITDeQwVvMvCYsjD/igA0+QUtrGu03pGoHDuArkOziBJOxOh6pEyh+CDTJZe0agRhnD/t/X+78tLLjOoX5U0qanRWDX3JB+000p26Y02sWMRNC8TNXcGk/LIDZ7Q+f2IbOnvxTJg1QnBiPsUJQkVo99Fhk0cE6goHcJLvWu6CW/e2pau0Oc++MXK9WvMkM4cN+yQ7kPAwi7Hmb1ER5fHLKTMRiLUZL9ZUYbFc7FqbMFPpu3q/hwMu+JLE0hatfiqkCiZ7JRqPhW59pOPWkNnB+jd9uAwxxy2bQjp129uog==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AS1PR04MB9287.eurprd04.prod.outlook.com (2603:10a6:20b:4dd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 18:56:00 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 18:56:00 +0000
From: Frank.Li@oss.nxp.com
Date: Mon, 19 Oct 2026 14:55:48 -0400
Subject: [PATCH v6 1/3] dt-bindings: remoteproc: imx_rproc: document
 memory-region-names to avoid hidden ABI
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261019-memory-region-name-v6-1-2e46b2e7d667@nxp.com>
References: <20261019-memory-region-name-v6-0-2e46b2e7d667@nxp.com>
In-Reply-To: <20261019-memory-region-name-v6-0-2e46b2e7d667@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792436151; l=2416;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=JNU9WHCwkH7lc8AwC+4LA2Tu1omzJo4a1dOXGwqAiGo=;
 b=vYQ+EvRSz3RUJ8hkWSM/m+547Rh5OwVTVzlR/bJvi3B859yCvVdsZYeCGrtPtm6TuBSzS/fJU
 Sre7w6mpknxBW3vEcl9guqaTiFp7nP0dOblQ3p7oGTnwaV2SJjlbZIM
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8PR07CA0020.namprd07.prod.outlook.com
 (2603:10b6:510:2cd::12) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AS1PR04MB9287:EE_
X-MS-Office365-Filtering-Correlation-Id: 5451ac74-ff06-412b-0c85-08df2e129dec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|19092799006|23010399003|56012099006|5023799004|11063799006|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	4L+IozFBG+4bTw0A0DoTL74srVvXQWX+IMmZnROWiu7y2EE7fPkP2apcV2ZUx2ctkyjQzLAwOCPxDra2vcZZ4565GCaLdxkgHRs8QvLaHKY23oS6RVSXb/HFk/tsNc9k8gKJWye9E//Gko/2RH6jjF+3F82r8USvKlTU3baAwkZZDXWehoc0/bVcYX4+OnoktfkY9eAi6VCnu77mEgRtYLGaC+H5HR9760fF3SPDah9L4BGSz4puV0OgNXt4bOP+my82RwAmKEXAIJAq+632bFkC/19FdF7UcastBmM//dkLpWZe/HT46Ns835l2iOh5TetwujFl90ci9OA++47mjn9qmLghc1bhMaPFAwh8N+6uaRVWHjesaMLzaRV+QysmKxsRLfDzKVlCVTIdhkAoZ/Ef2msZLgsfneh3WUuVpZpFPuD4MsEHOtbjjtdsBTEcT2h2UnH47C0YvZbO5pdvuCVFggVQSfWIrwDgSu0iODjgf61w7/D6Lc0HaSPXEIJ0cRGSen0bAbal8ijcmrVBP4RbRrdipORbXeFQailXEzqSB4Fj28yqYG5WqyCkacM4Dv/sTMeojRdfjtMN5CwlzQ4WEHUAWmuyqjrgjHvfqs/S92MuHQp76s/fGPLlNNj+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(19092799006)(23010399003)(56012099006)(5023799004)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1NVQ3gvdmxSRk1PSmhLWWxsbjFXbU5pRFQram5ZeFl1VjdhazdtR2RWKzFu?=
 =?utf-8?B?M2ZLdU1ucEFGMUczN3RmaWtWSnNuSDdrWmhCSWtPdEd4YWhTSWlYTkp4N1Fv?=
 =?utf-8?B?QUwvci81eGdHbjd0TWhQT3NsQmxBRkN3b1dKWnJJUGpXaXNGQVJnN3hzbHhi?=
 =?utf-8?B?TmpUSDdhWFM5NG5QL2JBZXV1RDZLNVNCTTN4djdyZzRraXR6S2RYZVhRSEha?=
 =?utf-8?B?Q0NxVEk5ZUs0VWtUOGtzTVhFTERLV1o0aStJVWRML3pEWnRpUmF0SG1uTlRo?=
 =?utf-8?B?SEVSL24rSzBPSEFVb2ttdFRGUGx0R1A2TkkzcVpwSHlkU2ZtYW9VY2tQWk9u?=
 =?utf-8?B?ZjNyam45MDVnTWx6MXcxR3I4VDhQREJTK1JJRk9xelRPTGN6aE5JaStndUw3?=
 =?utf-8?B?UDQ4S0xmcFZlYjFCZDVyTnRNQVk3K0hQbVJ0UTEzN0dMM2dUbm1OQ1U4RFhk?=
 =?utf-8?B?SnFHSVlpNGxKcERhN2tZcEpuQnBDUzE3ZWVjYjVnalJsOHZNQmpDOWJnazRT?=
 =?utf-8?B?enpyNjFrMC9qSnVwT3lFU0NmTmNBWjV0Z01SR2tmOFZtZG5nM1dxS0lzcUln?=
 =?utf-8?B?cXNpR01rOHVYaFpTSmFFbHpqZFVZc3V5aWxOcTgvMDJnT3FuTlBqa0pJa0VC?=
 =?utf-8?B?MDM0Ykd5amoxa21EN3VMMVU2VmQrNTR4R2hvQzg2TFBBTXg2djFBOFVURHph?=
 =?utf-8?B?aTFqVUNiRTU5akMzWHh4dFcyb29MT1JMOTM2cVRKSW4ydFd4UVhQWTltT0Nj?=
 =?utf-8?B?TC82QStVWExkdWhicUIxUzFkeUVsc25VQ2orL090bzV0eW8yZUpnNG03UW00?=
 =?utf-8?B?S3lURFJVS3N1emYrTjJncmZCSkJLU0paUW9SUG4vclJCN3pXcmNicW40alZn?=
 =?utf-8?B?cHNFYlNKSXFUQnlCdWVNUk82aFJkMzV3Y0N2ZmV2d3Y1ZmptSTJRZWxuT0dJ?=
 =?utf-8?B?NEoxQlVMWFUrcUZvTmxOcEo5c1pRTGdxbTdQREhNQ3pOSlFMd1lPNlJIOThR?=
 =?utf-8?B?UFc1N201SDFDRjFnUThYZFFsT2thcWVxZThZeXVlbzVZeGlydXNtekF4Y0VI?=
 =?utf-8?B?b1dpa05BNnFyTTFXVXNzUVE1RUZZTVNLMlFxMmc4eUd2R0NQMFJoMUV6SzFw?=
 =?utf-8?B?c1pTekRsMTRsc3dYT0ljZnJ1K0pHU2xFTmhteXJOV2EvdDVQMG5WT0pyY2xr?=
 =?utf-8?B?VmkyNkdoN0RIQkk5Z054OWFBYkdCRzN3Qk0xTkdDMEVOYmcrdGZhcmJmcG9V?=
 =?utf-8?B?d0hUUUFhV2J1U1BIdndjTFpOTkxNc2RkcFFLbmhnQktpZi9pcGJ6dlFPb3Ez?=
 =?utf-8?B?clZJSWU0b3c5UXU2OVJaOGdDYmJCTDNBc3dnTXZGcE94dVMvdi9LT3plbkZr?=
 =?utf-8?B?bm1kMDA2YXRFdUxSbnVEQ21RQjQvS0VVYnBwVTBvSXlta0VFUW1QenZ3NEJp?=
 =?utf-8?B?andLSitCTk9IZFUwcU10WWtYNWtjd3dCZ1F2L3pFRmllamc1S2JST0VDWFQx?=
 =?utf-8?B?SW1GMVhLMnFJaDM2ei9CdXVLeXkwcTlQNEJGcFlpaVp1VjF4MkRLdnphUFVx?=
 =?utf-8?B?WFlYcTN3VUgrNFFBcjdqYmVRWktkRFdyWUZRYWl3L2tXVzl2VUpkWWJVdlJY?=
 =?utf-8?B?RWFGaW9mZnBlVXBnUys5NWphcVo0b2Y0bGhvNU5yMFUrL1Fwa3Ira05nS2cr?=
 =?utf-8?B?WnhpWWNNOGFvU1VsZ0dBOHNkVytMY0Q2bEQycTVVMmZYYlV2VVI2WmlVbGpK?=
 =?utf-8?B?Umc4QXVKUlRqL1kvSGNUNXlpOUYrQXhjSnhkb0tPN013SVpOWkVoSkcySFVa?=
 =?utf-8?B?bm5ndlpsWFJYK0pLNnozVVg0WVdldTlPMEdkTWdsQnBERVpjVFVMb0pMQkNK?=
 =?utf-8?B?NGNqWTVLQWRuc0E3akcybDVnNXU2cVgvODNhVEI3RWhnQmxqL0xQVWNkcVJ3?=
 =?utf-8?B?R1JPRTdzb2lqMkE0cnlEOW9ySXBpYVJvNkZOQXkxa3FrR0FFNnRkdlpaT2Qv?=
 =?utf-8?B?d2RDZ0djLzhyWUNuZDlianFZNU5NbFFTdExQbWhxTk9zZ29EUnk1amY2cHdT?=
 =?utf-8?B?a3RQNnpxZHU2NldHekw5UVlYeW5TRHBFWGhnZnZHS055VURseVBvOTJFTWFr?=
 =?utf-8?B?UFRRMFdyU0hnajFwNjRpNVlqd2drVTY0REVIT1FZM2p6MGJyLzh3M0NYWTVy?=
 =?utf-8?B?ZzBKOWJKK3RYN1YyZExzdVg0QWdpaWJ6SzFFMEJZRUEzWktNT3lpK3dNY2FR?=
 =?utf-8?B?d1VsbHlRbFNzenA2TFNSUFh0MS81ZkpVT1l2bGlMR3BlalJSQUpKMjdwS3J5?=
 =?utf-8?B?akxXY2hNcUZwVFRZM3FaaE9tL3hYcTZDSklBejd5eHVTanR0L3lrQVQwbEhW?=
 =?utf-8?Q?JL+Fn0JJR1SP27z/Wf1yIoiBdJ7a5gYWWFuP2?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5451ac74-ff06-412b-0c85-08df2e129dec
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 18:56:00.4363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o7Eb/W+lTIM4W0DZRtmYIqiuG+5Qo/u/+fiZckOrtmxKlETPK5lIIYagTBGkWf2ux7kke5HZQP4hWYPNqN17xZuVFhTbH6h5z+jAgXxTQ2tvBxyy/vVK9KUxklP/kCgi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9287

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Document the optional memory-region-names property.
 
The driver currently derives the memory region type from the referenced
memory node name, creating a hidden DT ABI. Since memory node names are
not constrained by the binding, incorrect names can silently pass DT
validation, as seen in examples using "vdevbuffer" instead of
"vdev0buffer" ([1] and [2]).

Add memory-region-names to explicitly identify the expected memory regions
and avoid relying on memory node names as ABI.

Link: https://lore.kernel.org/imx/a3602ef8-2b77-4cc3-adef-2c4cba08a5d9@nabladev.com/ [1]
Link: https://lore.kernel.org/imx/alexXTYQHUs76J7v@SMW015318/T/#mb9dc709ff3adc24d9db6d30c973f37b580f6f1f9 [2]
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Use optional property to keep back compatible with old platform.
New platform should use memory-region-names.
---
 .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml         | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index c18f71b648890..f87036299a7b6 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -62,6 +62,15 @@ properties:
     minItems: 1
     maxItems: 32
 
+  memory-region-names:
+    minItems: 1
+    maxItems: 32
+    items:
+      anyOf:
+        - const: rsc-table
+        - pattern: "^vdev[0-9]+(buffer|vring[0-9]+)$"
+        - pattern: "^m(4|7|33)-reserved(-[a-z0-9-]+)+$"
+
   power-domains:
     minItems: 2
     maxItems: 8
@@ -134,6 +143,7 @@ examples:
     imx7d-cm4 {
       compatible = "fsl,imx7d-cm4";
       memory-region = <&m4_reserved_sysmem1>, <&m4_reserved_sysmem2>;
+      memory-region-names = "m4-reserved-sysmem1", "m4-reserved-sysmem2";
       syscon = <&src>;
       clocks = <&clks IMX7D_ARM_M4_ROOT_CLK>;
     };
@@ -149,6 +159,7 @@ examples:
                 &mu 1 1
                 &mu 3 1>;
       memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>, <&rsc_table>;
+      memory-region-names = "vdev0buffer", "vdev0vring0", "vdev0vring1", "rsc-table";
       syscon = <&src>;
     };
 ...

-- 
2.43.0

