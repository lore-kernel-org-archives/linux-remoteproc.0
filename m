Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.2
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793259059;
	b=dWYBeSFJxWTNyMtPxuxlY2PJMWQ3BOtx+eOuTaIsXWb1nJXTITfmzNhzMzWcGLQ9lYtU
	 /a8NiyN0Z3PyC07eCb9xYfqSTLwYWrNkHFbddfo6g+jcPmPxjciYmmj0pBlbN7CraFqiF
	 l5WiBQ66/BUef58qYK3BMIZepZVzsESdSQnuGCAyPc/I+o3btxcN4QW0eKz0KIssgctuI
	 WqhYa/T+O1LmfVxqlLNS6n+xF2zKPJgZCOvWrmnvVZ7OrFd14p4OEj73btQKaqBtnADlu
	 spboFriQOqLbLQLyZQ9knMgQf4lmeOa+O2q7lqpreSbvC0h6+EL6fOzo1tzQsYPFFIQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793259059;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Subject:Date:
	 Message-Id:X-Mailer:Content-Type:Content-Transfer-Encoding:
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
	bh=Y0IY5uRKgeGiZNM/otVllNsK/JEWN6L9/YXXCqY6omQ=;
	b=5NaGRyrPA9shCadMHfCXz6uPGdku+GjhX1jrYDgYU8D0TTOdwBdYrfuzmxYcXoOsujhc
	 SYtcBu8PAwuH7OboHz3j2VCa2gObmorF7oJeDm4H7z7TCDBPhHcsrVuet0tnn/eymFhN8
	 J+sfobofajtk8BiX7V4eZe+twgiiGafuK+Hcn45v5GyW3JniBpopYU8pyWX7eAC+gldv/
	 eFMeNi6AE6jxRKgMPlaBHstnScKGx8t49Or6Z2ALzv37UL4HhQyJ+hAvJ+sMPQfxCzNO4
	 JcAM+onkd4XyfGxM0y734X8YjA6QFIU0bG5n6o+ZNhlnJmlfs1M/q7KfBOphPL1mUTA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=YQhKHNNl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.2
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010002.outbound.protection.outlook.com [52.101.84.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB11D606A321;
	Thu, 29 Oct 2026 07:30:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB11D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=YQhKHNNl
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y+WN5547pIJas+tPw/dIxyXqTU21FCL64/AS4HM3ELLK2rM+OgxgvSKyYIbgIpFvKDlQvnI4q9fCMrLWUDU502tzOnz5FuNQscbNUP42jwu/IULlGo2se4EEoCZsmwFvs86LaLc70Qaqq+s/DwdnBAAxcjJ8cMIX058/4A4liGeNsIPfO2p9gmAXgWnIFWngqx7AYuxahFiVh2xYtcziZJ8/9uRcDihBK4l1wb+QTG8LnW5cksxcdJZWEcFc0UkpnuY/3QVGsAAxQ9sgXDVl+WeVHiY7Rbxe2zVqPgbSd0R4ZE5XpqHgTCwqoKQTsZZHE7Slqyl9afeWVOHyWnzjMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y0IY5uRKgeGiZNM/otVllNsK/JEWN6L9/YXXCqY6omQ=;
 b=wANEKCrmhAK0AjZB5DpF/gqaTpzbB7H+4TawOmrikTo2+8ucE8S8U7JN+6PGNG5iViZGooyMNj+inoiGnuETVSg88rv6ks4A0NRC4RkHM/QzavZ7K+CsRC7nxCCaBkRE/HjCZSG+Ihwv2SSwVAg6FAt0JO3PIZVWIR4UckHJoH8ACOda4Lwn2tx4W9sWLuUeccDNPOsES1eHSuOYEoil/fZnkAK43U6WEKa7c1gdDaEJoCj3U2WId7VIDD7q1Bwzx3cWntHitzw+cmERdv0NLRywFg+9fkbFJ1TFgD5fGRikaDpXJn6QQhqkPTdubfGL00mHMSA+Z5/opzLknSUsiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y0IY5uRKgeGiZNM/otVllNsK/JEWN6L9/YXXCqY6omQ=;
 b=YQhKHNNl9QHC20cFeIkUVCNqWmmKuA4gf0cANlUopJSfS/Mld7FKfaoDCJfVkzahfIhigYUtfdnyg6bx3yTfSuEfCLv8mzJleb8QUL7RV73ZHInk4dMGoxqRE/8rrEnpFNiU74zSufvFjZI9vxFSdkK4V5EJ4Pz2pB6WvjHsE31G6v4BjLKoZ6fc8GFNq584oSD88VFc/L1eAtkCBipi3frbHCb9IhNqtegbw6DMlRrC92LATB705OeWaOl2wk/kqcit8wXwXklo6GIo+ilsvqHKAkJjTIlJ2ubgJjLs1pOVuFCaIicl4hUHb/ghpUsSnB2TeKfA/12oKvXj3919Kw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17)
 by AMBPR04MB639722.eurprd04.prod.outlook.com (2603:10a6:20b:789::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Thu, 29 Oct
 2026 07:30:55 +0000
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa]) by PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa%6]) with mapi id 15.21.0569.008; Thu, 29 Oct 2026
 07:30:55 +0000
From: shengjiu.wang@oss.nxp.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shengjiu.wang@nxp.com,
	daniel.baluta@nxp.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	andersson@kernel.org,
	mathieu.poirier@linaro.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	p.zabel@pengutronix.de,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/4] Enable DSP device for i.MX8ULP
Date: Thu, 29 Oct 2026 15:32:53 +0800
Message-Id: <20261029073257.84594-1-shengjiu.wang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR06CA0013.apcprd06.prod.outlook.com
 (2603:1096:4:186::18) To PAXPR04MB9351.eurprd04.prod.outlook.com
 (2603:10a6:102:2b6::17)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9351:EE_|AMBPR04MB639722:EE_
X-MS-Office365-Filtering-Correlation-Id: 86ce079f-9a08-48b9-b6f2-08df358e9128
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|23010399003|376014|7416014|6133799003|18002099003|921020|56012099006|11063799006|261028144727099003|10067099003|261022075727099003|261022105027099003|261022115727099003|261022113327099003|261021123027099003|261021130227099003|261021121427099003|261021135927099003|261009223027099003|261026121527099003|261026140227099003|261026130827099003;
X-Microsoft-Antispam-Message-Info:
	MBgNVyyn/mekyeJgg2F9Yz4F29SNoTZ3GlcbyEpjgiycjJ19r3haxiMuHMBexV31lc54kv6M5rOokWr+m/h1s5a7wTMI7CPQaISDTAsxzKIAJ8OSv1eUeNy4x1EZ0URdQaI7K81XtNQywTGaOgFk/FckBf0M4otT9pc3sDjOPu/wS8QoOf9Tk4Z6ELKD4B0+6iNaCtc+XboY3YeMCd6AY5rHLCsCpVR2gF2Ht52p2LdYvwQEMSQgjOATpJdnBJnm9NcgHFExlhVnXAX384MLO0qikGMnZUVL5FPeSlSFiiZU1B+n42s6kMgJJ0sl1LIWYxadiwYtdVauXBSFtUj/8vnMxwQLDEljJx3EBXu0Qu+armC0lnS7UCxky0OqHHy5Vsb/xSQBkRt62Z0rQ+gEy/d6CG4Fj4lW41A4/3Q4k13Nyvln9riTOcTm/zU9N+MAxzQtKbY13pDckxNR3+1RdABqW6uLZoCC6II8QERTywPu7r1O+gkC/fJazRxKYssFYj1keJDcdyei4CpXUbcveDVy4zOBgISJLwrcnZMN3bXt/BF1C/0gUkBlDBFbIpC3BW3d5hZkKTDyH2TpRW+aBAgxzwIipiEZGOdLTD41zEVUEDIBKO6gUbdyvH7Qi+Wl4/G0Qct2Ok+qJlpRp7cPFe3HVcREAJ/+0TfTXs2Z6AyTR3YXf367Q1nAAl0sVmQv5mx7OqrM7PoWlLnQOn0tlA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9351.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(23010399003)(376014)(7416014)(6133799003)(18002099003)(921020)(56012099006)(11063799006)(261028144727099003)(10067099003)(261022075727099003)(261022105027099003)(261022115727099003)(261022113327099003)(261021123027099003)(261021130227099003)(261021121427099003)(261021135927099003)(261009223027099003)(261026121527099003)(261026140227099003)(261026130827099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUhPVm16b29uTEdXVWdocjNtdFI4d1lrcUhIU2ZrQmF3dHdJa1JVcDZjTDJi?=
 =?utf-8?B?N2ZraFlqSTZwRG5aVHRVWWpTdmt5LzN6cTVuVlIzaVNsYWx3VzNCNm5pdHJ6?=
 =?utf-8?B?M0k4dlZZbUM4QUJzTVRnQnZPVDBhZnhHbDNIQWJ1RUFTZkh4YVJJLys0TDVt?=
 =?utf-8?B?ajJQQmwxTGNQSUtibnBBMGJ3THpYZ2lpb0VCZGFvNFk4dWJpVVN5dGl6Tm1V?=
 =?utf-8?B?MHUvaGt2MTRrVTF3V1V4RFZkYytNYTZEYm4xNVJld2ZIY3lLa1gwb2JGc0FE?=
 =?utf-8?B?Tm9oY2c2VjNvNFNVZVhyMzFVVThtYURLSEVGSWEwSnRtYUF2Z2huUWQ3Vm4z?=
 =?utf-8?B?em9Pd0M2UmF6OFlnbndkQno0RDMySEJiQjUxSFR3Z0h1UmZiL1lnTWc0bG1I?=
 =?utf-8?B?cGMzbVNZQVVsRnlITzNwb01KRVhydzVaL3lQcTdpZDBsTnU4d0ZGeGpmSkFi?=
 =?utf-8?B?dFNQWllqV01HUzBBdDBBNlp4b1lHSDBOV2RrdUw2UHZ5MFhicXY0QTRYOXJV?=
 =?utf-8?B?MnJKMU5PVHZmMXVyS3FzYXR1dFpGeE8vSWNSZUROMkdpV3lBL1NyelE2MitV?=
 =?utf-8?B?RzFkdllsNXpkNi8vUGMvMWQ0cnpUM0dJL05pcjVHMTJpL2tPVEpMYlFrTUhn?=
 =?utf-8?B?ZmlXYlN4dGxjVWNQMllDS0xjcmlUY0FhM2RPU0V6Y0RkdUd0LzVVSXM3Y2kw?=
 =?utf-8?B?TE1aV3ZCQnVhbUhYRUZoaThHQzdSQ0JnbFVtNFozbVVoTlFUUmZneTlDSFZ1?=
 =?utf-8?B?cCtQOUtVblZCOFpocm52QlNSUjNVUFc0UXhHTXRvenpPRWNuQ3o3bDVTeUR2?=
 =?utf-8?B?MTcvb3RUbUJHb2hDYzNpSFV3QU01QVBoU3RxZ2tSNDVXNko3ZWpCZHpjNFdY?=
 =?utf-8?B?ZlBFZXViYmE1ZEFleWpNTHRLWFlWVjRteERwSksveU1pV013aXpJNTVRZG9F?=
 =?utf-8?B?Yjliek9LZnMxb3AyazJZZmpvbCtNaHZIdW5UWVNwa3ZZTmF1Y3FLR2x3RGZ4?=
 =?utf-8?B?UmFpb09Rb0VCZEMvV2dIbW5SM29tcEJIV0oxS3RyWVJGb1VWejRtNWlIQ1NH?=
 =?utf-8?B?MnFsREZ4c09KOVJwRmtETmNOelN2akswN21weWZQZ1hmdldKa05FUGNQNXR4?=
 =?utf-8?B?ZE54OUhkbWltVEN1bzBIRzZtYytBS2JIUzM2bnVodFBzVTNaMVRRWjZvdnVo?=
 =?utf-8?B?RUtRSlM5M0NrbjI3ZGQydGV0Q0xFbXdFU25sN2hvY3d0dUd2aTg0aFcwcEVN?=
 =?utf-8?B?c3RZcXEvYnJXaml2ZGZUb0d3Rm16WS9pU3p3dGpzMXF6alhXdTFpYWpobEhS?=
 =?utf-8?B?V0dNTnltWC9rYTdmVndpUTd1eWU2M1hON3phdlNXR2lmSm9YZDNYUUlocjM0?=
 =?utf-8?B?VVdJQkdBZUh5aUduY1Q3NG41UXA5WG5zaGZUYng2ZWVCRFg5bSsrN1llRzJh?=
 =?utf-8?B?dHJyM0JOQUFuSEtrR3d3WlpMQ1pVRG1CcEswMFoyNVJOSzFwaUNKQTNraWpV?=
 =?utf-8?B?RFM0cmJaWGdCeFRNTVNPdG5mT2NIS2hSbHlsL2dXbTVncTVmdjczK1BZN1lT?=
 =?utf-8?B?cVNvYmE1L3JWb3NXSmY1aWtTbmFEK0pBZ2RpeEpvQVhvcXpWb0xKT2FSUGxs?=
 =?utf-8?B?RkoydkhSUTVLNXl6eEhZb3dSWnd0MHN5S1dUVjFsUU9kMDdoSjVEQlhLcXN2?=
 =?utf-8?B?VlR2NlZsdU84R1NUUE1pSHo5b3BiYnV4MkFKMjkxTDRIZTlsRE56Rm94dlJM?=
 =?utf-8?B?ZzJyYU9IaFFHT1dGVWV0Vjd4UW84c0VoNXVDUHdHUzF0ZDN4b1dKMUZOMzBM?=
 =?utf-8?B?eEdmbGFZVVAxaUFVb2IwWXBMK2dGS1RYNUN6Qzk1U0dvditpa1FqQmF0bEtq?=
 =?utf-8?B?ZDFKTEdrQ1F1S0ZXUjJYbGg5M0I5elFOc0RYWDkzVDlNRHpyY1FaTm1KbUdz?=
 =?utf-8?B?cCtUaWE2M256OTZrN2dKdWxkWmpzQ1pXOU54MVMzTm01NlQ5NFBZSi80cUkv?=
 =?utf-8?B?bE9LMnM5ekJLdllrYk5jcmx6UGlJcTNxRFc4anR6T2dQNkZ6U2poMjltUE9N?=
 =?utf-8?B?TENEa0NKb3MxdXhsTnRZRTdSYkpRS3lIa0RPdkRub3RZWHBHamE3Y2Z5Rkw2?=
 =?utf-8?B?STh5MU14ZlJ1UHhMMVFFT1NMR2ViSGQyUkdkRmhSVFlKbWNhczQ4a2JmTW1Z?=
 =?utf-8?B?WUlEbG56a0pzOThPMDBaLy91ejVEcHVVekZyVmtjOU5VQzZDcS9NNWd2bFMy?=
 =?utf-8?B?eVRMV2lpaFl4L2xSYm5maWNnOXB0eEc4akw0dnFiYkdqOE5yQUk0SVM2RDFr?=
 =?utf-8?B?ejA1QjQ3dEJVQjlscjU0QjY1TmZpSjN5N2FQdW5nd0VnaWl1VnBkVzUvbENY?=
 =?utf-8?Q?KLnDsHSw9WQ18aHexd0Sm2YiuPP4NltDS5nxn?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86ce079f-9a08-48b9-b6f2-08df358e9128
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9351.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 07:30:55.2269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9OTTB4hYB/b6FsF3lnvfvkPW723jy9/721bZ+90uO81kwS41i/4QYgtu2sVHW5yWRVlPFL8UCYvNqHRYRLaEyya7+gA56BZvIIcRKo4f+BhX9vnpONVfRs/Y/wtGwc1r
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB639722

From: Shengjiu Wang <shengjiu.wang@nxp.com>

The debug reset control is one of the HIFI4 DSP’s reset mechanisms used
by the debug interface; add documentation for the optional debug reset
controls and update the driver to use both the soft reset and debug reset
controller APIs (the soft reset is already documented).

A HiFi4 DSP node is added and the DSP device is enabled in the i.MX8ULP

Shengjiu Wang (4):
  dt-bindings: dsp: fsl,dsp: document debug reset control
  remoteproc: imx_dsp_rproc: Add softreset and dbgreset handling
  arm64: dts: imx8ulp: add HiFi4 DSP node
  arm64: dts: imx8ulp-evk: enable HiFi4 DSP device

 .../devicetree/bindings/dsp/fsl,dsp.yaml      |  2 +
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts | 34 +++++++++
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi    | 23 ++++++
 drivers/remoteproc/imx_dsp_rproc.c            | 76 +++++--------------
 4 files changed, 80 insertions(+), 55 deletions(-)

-- 
2.34.1

