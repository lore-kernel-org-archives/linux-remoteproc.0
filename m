Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.70
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792785199;
	b=JhxnfEvgKeVCv9eNVvkffhST1yVa6TfjyGAs8jcUMtlJBvxq82/bbdTC4xg3ZoRR72Gs
	 8Z8IvGHs6j0j823bctzus3tG9OwGtNdWu00+dbKIatNNSeeCb3J95F1UflbDjlBMmWajs
	 0dX9Vul9n7mX9FSFg+ipF7N4lxlA7u1TzSGfVeipd2K9JM1GQ+BHd3HoNUFk4QYeSPXtj
	 ec0zVZn4CHkCjjoNYNAt3lqOoayypqyplxEGvsZClbauuPoWkWlmfqcwsC7JYLQHcdlyZ
	 LmyeLLmuUld9sjyA0LriUbzpIGHsRosNrbnadrnFyxNjkq+hkZTQ3nSs5y4djFlqDPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792785199;
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
	bh=uPI4fxg2vvkT6cpRSdpH1zbjZdWuHuHHvm8p1wCSTwg=;
	b=n5ealo9giGcLNCaDh19SvVp2VGekgIlukYQmYm3C10HP0yIRhyEr83EANkgj8zpUxQ2X
	 j+vyqVx6ZelAYtqsxxX7uyXSJHxXDAOUhkoEUQIuMPAw9CkRZCPeuUhtijQ1m80PKrHGG
	 kJXuTPW8E1qCuOR/N5EM4EtwIdQX9ZI8YPi7TSmiobkhsU9Gkq+3+7r8mw4BHDmcCVqcp
	 3NBAM2mdl2yqRffjOM3svm46avGNFmKtE278Qrh3VC+csR03KG4y9t5a6saeSqUFVVmtu
	 +aLoTunTgIjQknSD0hIlPPkJmfRo5UDNa1bUYW+0OCBpQgKDFXpTrum51QcS6RGt4Iw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Fp7AhkuQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.70
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013070.outbound.protection.outlook.com [40.107.159.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A72606A31E;
	Fri, 23 Oct 2026 19:53:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95A72606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Fp7AhkuQ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RcFD0W0Ci14omTlPtqKJyrJ+3SRqU66VXBMqPpHOtlQEv1jrfXuFH6c0EA+ZXXIKIG8hWo0d1tpNK3WSvc8gfVYLEtEtoZ2Gz1Q5az8vfbDhqN9r/9pwJXa6kch9mndCROehF74/TON2dL3FiUVG22BAk2YXGZfCBpskdq62n0B9likLYuNE8q9siVdd9Ec0mnWtvfVLgRYBjFPt2FgCmn3/jayCuZn+Wua41TrV8z0ZQTKgR9jO2Pf26r/sSYtqSvSb21mZHFkiF/Q8nLUJOwkdO7Y3nuApsxSVV9qNm9BiA8fxOumxWVkX8eXDo1N3Q4mJGJDN45/oLJheIzyN+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uPI4fxg2vvkT6cpRSdpH1zbjZdWuHuHHvm8p1wCSTwg=;
 b=nx8B0SEaANBNfJwbV41K4ljvKgDRBvCR+Oh2TyQSHe2QfrbE+Ev0yeewcGCQN8xvqUyrUzGtXlBJC1mqYLxR5PdEja9LY0+pWS52O5FtxbwFQKj8ufxkRQ+KxOhBfGCoV10vRALailq2zdhivvzwoAe2wcKQBF3r+LmULXyx4myEp1UmOUTE5IuUoNJh8O4yVG7YmTIkv0QG5fmcMBU+w7/JU/kRdcWxsSO7zpdnyAduVkGqTOPbtuOzNOIwySjl60Zjs1yJ4URT4bAVSSVaPWQPNiSSOEGe3W0WUISruPkjirXFaSj1Ua2YlVHkfq8awMsmC7Wa2qZ8P97rG543rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uPI4fxg2vvkT6cpRSdpH1zbjZdWuHuHHvm8p1wCSTwg=;
 b=Fp7AhkuQVJfoNea6FHLGsn8qhA8qttOpR8BUVItvsC/eGK/zhEARY1gcJ+VPjZrfCjkBuK/ColeqWHYAA2jaEak20WYFco1wPr3ZKGcTdbF712RQG7OsfR/lf65Ekn1+bqt8TR8R9WHVubij/dgJf5WcJojKsBRjOfO4dB8MZQ9I7lAe+hQj1ud9BrkSWMsUVOxltIXBjiF7N1vO1yoFznjOgxTQ53KCrTDSPbxwwpL/HulHzRWjURG3AVOUzJZ1UqBcZYVe+N1VFWx18/4b4JwUv6Y5QE/FduenPxnkVYAclLF3S3SNMg1WB4PqIBbzXCG6G73pmEo2MJzrmdrgRQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DBBPR04MB7978.eurprd04.prod.outlook.com (2603:10a6:10:1e9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.19; Fri, 23 Oct
 2026 19:53:15 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Fri, 23 Oct 2026
 19:53:15 +0000
From: Frank.Li@oss.nxp.com
Date: Fri, 23 Oct 2026 15:52:50 -0400
Subject: [PATCH v9 2/2] remoteproc: imx_rpoc: use memory-region-names to
 avoid implicit ABI
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-memory-region-name-v9-2-ad597887dfe9@nxp.com>
References: <20261023-memory-region-name-v9-0-ad597887dfe9@nxp.com>
In-Reply-To: <20261023-memory-region-name-v9-0-ad597887dfe9@nxp.com>
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
 Frank Li <Frank.Li@nxp.com>, Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792785180; l=2672;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=ZUUBVHziPESvBSakm7WkmRGLkc7plCQjHYvv5adZeec=;
 b=3vwRjjgFV+O82JRnUSnBfICe2qWCcw5k6r5Z431F4y+IOlLXLts+y83UuxFvKWz9eyAdJtjV+
 W8HGtZ1oUCHBls9ZHF8aE5O7lzPRCR/3iVt2WF0Qs2qOR8Zz+i5Splg
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8P220CA0025.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:348::9) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DBBPR04MB7978:EE_
X-MS-Office365-Filtering-Correlation-Id: 03efbba0-f133-43ae-3bd7-08df313f4742
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|19092799006|376014|7416014|1800799024|18002099003|22082099003|10067099003|11063799006|56012099006|261009223027099003|261022105027099003|261021121427099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	o8BwBAxUsH3zQoA8fW1cC4E5E7v/Y4ySQYqpchDTcWT7DDgGMZEXf4QE2dMRN/XMfVQ/XFuvvm0K7EEDQIRkPV6QQAS1PfnxPAQ57fSDASjW8s8PtvD23BJSPtwjrvyc+lOA6Z/fnM1Rzm+jkEore3aVMZanDpRmw+E5hyHCXcGHY+Cj41WXk2s+k9di/XlNrCicRA72cR0kNQTHW59Qv+plUacT40EeMk1tuN8P1mytUcVYV8HbOdGnw6SBExCkxdZ9nf66b3Ms5u8DRsrx94Xphxor1n8+Lnw1F2y23aHRf4aQqURrQd9Su/47VbiE6+sEIyKtzQGaII/Y2CYoyIcEouEDvKWLfNJxZhO84NdvZl7pXJvHky8MxFicdhy/vCsy3Ai9IN5S2pCnssKEjNwYjXvJsP+0KGXaWL2N3T3b8/8ph+AAYnG9MWOdA8aogr/r4cVoyPm4bbAZ/jdM5zxnBwVbJ3l6rGh4N7RlvFHBG0O6PDYtBa3M8caXfc+lVhOHeYL3HI//kCiBiKobfZUnOlpezTq3zBHwWRHAof32z2BhGmjFDbbofKg7HGVg/UPaO04eeQYKnugHAvXnAdbMfKMWjBrKKi2wVZyKnY7GGR8Z4nBxG81P05WbHAbg
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(19092799006)(376014)(7416014)(1800799024)(18002099003)(22082099003)(10067099003)(11063799006)(56012099006)(261009223027099003)(261022105027099003)(261021121427099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TDNHYXpjbUhmOFd3YnhRN2JjYVJSd0poVGgwTnFqWVgvNlBhUUxpeXl6MnRx?=
 =?utf-8?B?WEVUK2lLeEhTNnRNMGY0dVlhNWF4VVllWk9kTTZrVW55eDR5NEVSMWdRWDE3?=
 =?utf-8?B?My8yMFNGQ0hRbFEyMEdtSlVsN2dYM2lqbm1VQlBueTBqUCthQWRKaUlYK2VB?=
 =?utf-8?B?c0NUV3VxcWpsM3FuOXcvQ1Era2dSSytnWHRsTHVTMnRPUG5mNk9NTHNKVGpx?=
 =?utf-8?B?R1grU3BIck1qcGgxSjdKd3lXWEF6UlFwc2xqbmVMTjJhbnRiUGRRYm1NMFZK?=
 =?utf-8?B?RTNUcElJcGtPbUFVdjBkc3QvQiswYW9QZWplUlk1TS82VWJ6NVFGbzZEMFVo?=
 =?utf-8?B?VmQ4N0hLMm0rMlRWSFlEYU5uQUNBdzJ6WXhyR2tnYXFhY1ZwOTJOR3ViYWxM?=
 =?utf-8?B?Z2NKZ0VOdmxYRmhFeS9PemdUcDFPQUpTTm9KYXFDMThzcll0Ymhsa1A1aHBp?=
 =?utf-8?B?QzlhTzltWHNaU0YzNDM0M3FQd0hvdEFCSndOYTFOWlZIL2NsYk1WMkJ4Nnhw?=
 =?utf-8?B?cEdMcTRyQURKckxFTEU0UzhHc0JDRFAyaXJXUGJuS0djdGVLWExiRGRQQkwv?=
 =?utf-8?B?eHIyTklhaUtqemp3VnVQTkQwVjZtL3hILzE1MFZQWjhOS0YyR3ZwM2RTZHYr?=
 =?utf-8?B?S3BZekJ5NGtZRXBQUzgzRGZHRG5MUHZ0bUNKU01zaURuQTVqUkhjUzd5T0NE?=
 =?utf-8?B?K3ZQYmR2VXlaLzNmelREVUg1WWhxSHdwMW05amo0eFZEc2dXUHFtb2R5OWVj?=
 =?utf-8?B?V0ZIZVB2aEhndlovMDQ4RWZ4VnFzVXRIVEpqUFVFd1gybmJhOUlTWlpGZE4x?=
 =?utf-8?B?UmZNR0lrYTlBOXlUcEk2cnY3MWNXMVY4TDlDUXZKU2M4a0JuenRPSkdlT3Bm?=
 =?utf-8?B?Um9ocGtaVm9Dc1dLanlYYTNYL1lOUGcyS1pLWnlCY25nV053S1lqY1dtT1RS?=
 =?utf-8?B?ZXFjVjhQUm95ZmpCQjAvb2pGZEp5SHBNd3pGRmFIUE82WWJtNkYrOEgvN0I2?=
 =?utf-8?B?aEg0Sm1QMlNIa2c0ajNySk9VZmtSZ2drUTB6bXlqWnRrc1llK1pMRFlhTWp1?=
 =?utf-8?B?bVdlUzFJYmh5cUdMR2NFMjVVd3g4SkhJcm9UVkhLZzdLZmkycVFRN0YxVFJM?=
 =?utf-8?B?SWIxVUFPeFR1eHNYOVJLV0g1QWFEZlBnWjFpZTUybGt5Y21qM09MNFpIeVFE?=
 =?utf-8?B?TVpTK08rUVNnTzJibm1SMG9OdTh1SmxIcFJDTGVmZDI2UVNvQ0UxbVAwQmVk?=
 =?utf-8?B?YXFjK00zNHpxdEVIaWF4S3FwbXIzVTZlc1ErbjJ0emZaWWNEU3dKMFpXV3Zz?=
 =?utf-8?B?ZnBJS0p5dTNWRUVzUklnVTJOK2FWQ2tuYXVVWW1uMWQzVXVHUnozazNud2dl?=
 =?utf-8?B?dlZmVzY1R1krMzU0R1lPbm1wa2k5OHY4NGtFclB6dzRvN2Rlbk10aFIxdHVK?=
 =?utf-8?B?U1lxdzlnb3dXbnpJRWk5TUZvQzBuNVlFVDQzcnhraG4rOHFOZG9aeFZRT3BF?=
 =?utf-8?B?MWJUeG9pVEdsNnVibUJWWjlockUrMzdoNm03VGlWdWxYdUMwUVpya3ViSVl3?=
 =?utf-8?B?eXFQc29hQ1FFa1NZUW1DYklZSUxjdlN2QW9qQXpSZmRuUEZkVFBWeVVJK3lR?=
 =?utf-8?B?NWxOKzJpNXVpQkl4VGxDQ2FtSFROcm9WOTZXaVk4QTBjNnpPMkNQVVBVWFNC?=
 =?utf-8?B?WGlJTGtpM0FacXEwb21KaU1Lek5UcEJLa202YU12ZmpwME5tR0k5VjN1NWlu?=
 =?utf-8?B?TEVib3pwOWlhYlhKQWtORkNDd1NERndITWliaS9QT3JKVE94NEJ4UlR4TVRS?=
 =?utf-8?B?MUUyNDNnMURKWi9XbVhERUowZXBPSWFreXNzNTB4ZFlFSzI5dTliVGVzWW1x?=
 =?utf-8?B?NnFxd3pTYW11NDVNUE1ZVVNLZm83c1IzT21ySVlJbzdhdnE3Nm05VktrYnhX?=
 =?utf-8?B?azcwUmVTZGduU2w2UFJTZW8zMUQ5ZmVrcmprV2hieUdubkpUZElLQ3k0Zk1l?=
 =?utf-8?B?b1BBUFhUQ1VVN2k0VUdFMCtuV1IwZUdHdWdtL3JBZU9xL1RwV0FHWG92b096?=
 =?utf-8?B?Ymh0a2dmOU9JZSt1T2dKYW1OazJWb2hEaVp5VkdwaWpHTzM3ditoWlRudlJN?=
 =?utf-8?B?a0szeWI0OGxuR2lqN1A2dDU5eE9EQlFPV2EvY0lJeDAzRlVPN0tuRnVQRnFt?=
 =?utf-8?B?Z3VqME5CUzkwRWVzMW1mZzNnNUpTa29VL1k1ODhxdTRMN1lrMTBkdW82N1RE?=
 =?utf-8?B?VUtLN3I3d1VWVythVTRoa1k5dEl1RUg5YjZKdVZkNTd0ZVBvUEdjTzRDNWU2?=
 =?utf-8?B?bWdqbmxSOFdzUmZKUWwraTJ0Ulk1S1Rld2x3WSs4OTl0Sm5pdkJ0RWxvVDla?=
 =?utf-8?Q?US/cV7RZuIA6Va09pty31sOMY7V5mMeK+kbod?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03efbba0-f133-43ae-3bd7-08df313f4742
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 19:53:15.9144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EtiLg5UBqU9AtEPy9bmYGBlXj//GIV/s/n26mqKf5OguQHWQNKSUn6MX7OHaXgllTqqzsfASNKyFmS7IMo8O0wvIgYE4C/mzBjAMfvKqYE3zWneJg65T/ZOSFmcSPcHs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7978

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The driver currently derives the memory region type from the referenced
memory node name, creating a implicit DT ABI. Since memory node names are
not constrained by the binding, incorrect names can silently pass DT
validation, as seen in examples using "vdevbuffer" instead of
"vdev0buffer" ([1] and [2]).

Parse memory-region-names to identify the expected memory regions and avoid
relying on memory node names as ABI.

Link: https://lore.kernel.org/imx/a3602ef8-2b77-4cc3-adef-2c4cba08a5d9@nabladev.com/ [1]
Link: https://lore.kernel.org/imx/alexXTYQHUs76J7v@SMW015318/T/#mb9dc709ff3adc24d9db6d30c973f37b580f6f1f9 [2]

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Francesco Valla <francesco@valla.it>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 581bb07f5893f..2707040f16d06 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -635,6 +635,25 @@ static int imx_rproc_sm_lmm_prepare(struct rproc *rproc)
 	return 0;
 }
 
+static int imx_rproc_rmem_to_resource(struct device_node *np,
+				      int index,
+				      struct resource *res)
+{
+	int ret;
+
+	ret = of_reserved_mem_region_to_resource(np, index, res);
+	if (ret)
+		return ret;
+
+	/* "memory-region-names" is optional */
+	ret = of_property_read_string_index(np, "memory-region-names",
+					    index, &res->name);
+	if (ret == -EINVAL)
+		return 0;
+
+	return ret;
+}
+
 static int imx_rproc_prepare(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
@@ -648,7 +667,7 @@ static int imx_rproc_prepare(struct rproc *rproc)
 		int err;
 		struct resource res;
 
-		err = of_reserved_mem_region_to_resource(np, i++, &res);
+		err = imx_rproc_rmem_to_resource(np, i++, &res);
 		if (err)
 			break;
 
@@ -823,11 +842,17 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 	if (nph <= 0)
 		return 0;
 
+	if (of_property_present(np, "memory-region-names") &&
+	    nph != of_property_count_strings(np, "memory-region-names")) {
+		dev_err(dev, "invalid reserved memory name count\n");
+		return -EINVAL;
+	}
+
 	/* remap optional addresses */
 	for (a = 0; a < nph; a++) {
 		struct resource res;
 
-		err = of_reserved_mem_region_to_resource(np, a, &res);
+		err = imx_rproc_rmem_to_resource(np, a, &res);
 		if (err) {
 			dev_err(dev, "unable to resolve memory region\n");
 			return err;

-- 
2.43.0

