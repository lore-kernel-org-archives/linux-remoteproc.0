Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDEF29B769;
	Tue, 29 Apr 2025 02:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745893258; cv=fail; b=X1wNBnh32B2QLD5s8R0gqI3Fw3D93nOn5oWFQB1//HTye7ki6fDMLBDhNIwH+8VeHIifzFc25IZtDIjqcb7+BgeFfgBeAfLe1mtTCcTKpHgoBabjPTTHTusDks5+Qc+vRTDogpoLTUhPISqwrHApnLDvIV7aFpgufKqoZgMcAnY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745893258; c=relaxed/simple;
	bh=h+Jw5xcciSomsyfMRLFL7FwnjPSviLLD4ySdnQK/pF0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qtGMzpEUW07nkMwcv7FSG8/zDqk7qXkwUzksWJLdyFKfuJ/YBDY6GgeWSjmWWk4LRBzUPdNy8AHUDGxsH56lm0UzX6GS3K8qmHzpoar4A3vodMgCMsFfHwzN5sdyd6KaAFhzYJBCqVvtnzL+O1dEujeMQpUJPPvt+IkmF2peiWs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SMlGsf014840;
	Tue, 29 Apr 2025 02:20:45 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 468mq1bsbp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 02:20:44 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mNJzndVVPYiCafrpBik3LFVzDPv6twuB+/n5UwVVh3DlhWpiYWuauhBTtjT8FVWlwKw88c3Ihqvnv9urGpj+HQCpFvitqzjau+4dwwOrx+6x7UmvkWvA8oDLShsru1f54CtHqAuZiB9CbzLurA3Pn9rHxZC5JHzQCKuB1bnsL+o2JcqYq8SPcYxaMVpwR0xSgzbQ4S5Yrcj4lPGVkybM2HnM0k9zNCgzgIgcZosryU0ymrIdRfPJVVd0W1gvqXohXr8aNpy0avMmoCUmk9FYLeXdEoRHFiFF97sKz00xYeQmlmBM35KoBJU8BTxM5qnIMJd1gsbRgfE9T/iRB0Xpag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A66d+omB04X5djYkrYowlGqVCRzgfc0tehj3ZagG8FU=;
 b=uuGBx5PuG4UQawCKdh/sBzU8RJ0IFsFGHWRCG/w3GKos07GmYJA6aJ2tuzUTeYGLD7pmx0w943p30/97Spy+zqcTX7P7Hnf3bg1nWDyOzGmE0uq6vZCTUJIgoT5dbyN+0/dE2zPbd7IHZu9Z1k/ME4ZzF7jU37awGg67LkI5TF6Fp8OxPnSKEwanZDmvL3Y7x38u8J4kBWtHCtrRfNlrVpMHWiTsArHO2kr1I1Zl4JdKGDeUszUliT9zm86eSZu4baYgqz8z204EybEE87bz/MEYuCQlfjACsH+nglJM74S5D9mMFV4zoirJ5EaqMZsCHW0KOscOcNumlqSd6mTrzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW5PR11MB5764.namprd11.prod.outlook.com (2603:10b6:303:197::8)
 by IA4PR11MB8989.namprd11.prod.outlook.com (2603:10b6:208:56c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 02:20:43 +0000
Received: from MW5PR11MB5764.namprd11.prod.outlook.com
 ([fe80::3c2c:a17f:2516:4dc8]) by MW5PR11MB5764.namprd11.prod.outlook.com
 ([fe80::3c2c:a17f:2516:4dc8%7]) with mapi id 15.20.8678.025; Tue, 29 Apr 2025
 02:20:43 +0000
Message-ID: <09bab7ab-badd-4a7d-9ba5-5dd7181f6a6f@windriver.com>
Date: Tue, 29 Apr 2025 10:20:36 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/2] remoteproc: core: release rproc->clean_table after
 rproc_attach() fails
To: andersson@kernel.org, mathieu.poirier@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250426065348.1234391-1-xiaolei.wang@windriver.com>
 <20250426065348.1234391-3-xiaolei.wang@windriver.com>
Content-Language: en-US
From: Xiaolei Wang <xiaolei.wang@windriver.com>
In-Reply-To: <20250426065348.1234391-3-xiaolei.wang@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY2PR02CA0042.apcprd02.prod.outlook.com
 (2603:1096:404:a6::30) To MW5PR11MB5764.namprd11.prod.outlook.com
 (2603:10b6:303:197::8)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR11MB5764:EE_|IA4PR11MB8989:EE_
X-MS-Office365-Filtering-Correlation-Id: 3796a7c7-54ea-4fa0-14dd-08dd86c4712c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MytYL01KQnVzT2RzOCtaRnJxQlhTWGNWWnd5aXRZcjk3Wit2akxmRHZMdjBo?=
 =?utf-8?B?ZUlFVHVKbjlpUFZNRnFmUFIzcG96NXJZaXpaYWMrdUtHeGt2ZFN3bXEyc3Qr?=
 =?utf-8?B?RVBjc3BLUzdsUy9naHNlSVpCaVVvVEJCWE5sNUhubStiWXZRUVZBNVJyQXlr?=
 =?utf-8?B?NkRmSWpSbjh6a3BQTGxmQmdwd3k1ODJPSzlqaXYyN2xTajdPNUcxRjNaSXI5?=
 =?utf-8?B?STRHWWRTdDg4M0toeHBsSk5uMTBIeGpGMFA2VXBzcU1kUi9nTExrelZDbEpq?=
 =?utf-8?B?OTE0U3lCbUc5OU1vaUROVGxPM3BaRUhGMzZmdm5FbXBRd1ZZS1FnN3dvNFJa?=
 =?utf-8?B?TkFQb3laWTFxNDNUL0dVL1BVaGJJbFdnQm1wbnQ3YUh6U01oNlZJc2c1dE9r?=
 =?utf-8?B?RUJmd3RhN0dDY2NwemM2VG8rUm92eTZPb0RmOHhLenVwSk54TENzMGFmSFhk?=
 =?utf-8?B?TWZDWTBKVjBucGQ0eSszenliakRpNnAzRG1wTlVXY0lFQmh0eE83c0wvcHNL?=
 =?utf-8?B?dFRxMGlnUHQ3d2lhTTRQaVZBY0t4S09kU1lKUmhLR2NITHhQUXdORE9NaGFX?=
 =?utf-8?B?WUpNc3NhaklnRVpxQjhvNlVsZStDQXBhKzMyWXdIQVVncXBJR2hRK0V6bEQx?=
 =?utf-8?B?eHFvU25ORHRJeHJoc0JESHVnUFVwbmZhcnBIY1doS0ZTdzM5UFlQdCt1Ym1j?=
 =?utf-8?B?aXNMSitubEExV3plYXBKbE9MeHAvUVdKT1U4OWYwQm45ZVYvL0NNS2ZONVBp?=
 =?utf-8?B?ZzR6dWFKay9uQndpSzF5dWJ0Y01IZFo1NW9lbEFXenJIZ2xVK05pVytLREEy?=
 =?utf-8?B?ZWp2S090OVMrQ2p6ZnY5N2k1TlpYcDhDeFZxanFmZTIxNUR3RHdscnJ3REUw?=
 =?utf-8?B?aHYwdk05dlhkR0g2QWVwbFBabVcwVnhEbzhxWDBqMTFwN3dDelpjRXA0aWEv?=
 =?utf-8?B?WHA2ZGQ1KzZpZG1BdWpVekJpZWgvZWdLRlpOWHRVa2R5Ni9CZzNmdjN4S3hZ?=
 =?utf-8?B?bm5GZit3OWVrVWh5cHdLblVKenpPOWwvSG1LMEc1SndlR09TenVSWFJNaGll?=
 =?utf-8?B?K1hUamVQTEZrNFp6WXp1VTNsOHM0ZDlqcWg3MTJyVUlXZFBKdE15RlRLMkt4?=
 =?utf-8?B?V3RpNWIrckMrWHQ5UnZINVc3SFRTUEdLYlVzMHdKQU5pVGQ3VndPbFNCa3JI?=
 =?utf-8?B?YjRmUTk3cEJ5YllFbkRsMXNMMVdOQ3A0UVBSSlZvQWd4TFFCYXhLYmVEcFFW?=
 =?utf-8?B?d0lrY3MvU3pUbWxvbndsbUdQRlgvbS9wc2d2TzdmdXlNcmR4ZXlQYTdTZUxi?=
 =?utf-8?B?dDRNcnk5eG5KUEFvU2pka1RLNGN4UzZ6Ujl0MEJuU001SC9hZmFMckVFdW1K?=
 =?utf-8?B?L1RCT1krTVMweCtzelpod1AybFNIa3UzaFU3YWVqQnFpVkYrUTg4VzMwRlVL?=
 =?utf-8?B?ZVYzM1pObVhMano1YzQxSlg2WDNNYjhTSldGUTNKK0hTN3czc1dGVmYzN0tw?=
 =?utf-8?B?VEI5ZVNhRjVZV2FLQUU4OTF5amtpbjBoalVXa01ZMnhTazhrdjFLTUp0UWlI?=
 =?utf-8?B?ZE5yZ3FJMDVHRU5DUXQyVlVHWU13Tm9QdCtaSVNwcHMvN3p6cGNxdDdOZVFw?=
 =?utf-8?B?d3NjdmFmTTNYOUoxT1BhbVl4dUl1NHJnTHZLZ2t5azZuVkNJNHY0VkZBUC9D?=
 =?utf-8?B?RDhQUGdiblhtT2x0VmErazhsTGt5dnVULzYzcjFiNzVwWWtpb09JSlNzQ1RU?=
 =?utf-8?B?VCtVWG53b3V2TzNJWkIzK2JocVR5b000RnhFVXFveFpYMHJjYzloT3FyWmo0?=
 =?utf-8?B?dFZFaVRlcXk3Z2dRZTFEQVdiYUZEU2VwM0Y2MFJoRXh1YWZnSDhPRGwrOWx0?=
 =?utf-8?B?NytBbm03amQ1SDE2NU1EaGd6eGxEMldDYlJFVm1XUEt1Y1FiaFdzb29BaGsr?=
 =?utf-8?Q?KmVUPfSrDFs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR11MB5764.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SnAxYnNwSFNDeGl2T1VlZ0xwaTdKNEIycmNJMFdMMmd0S2V5QzFzckpVWllN?=
 =?utf-8?B?TnNObjhWRzFLdDJBNCtTWlRzUjlCbDl4SURzNzlVVFpRY01POTVheWdOc0l3?=
 =?utf-8?B?Q0tjWERXaDBkcjFQTFJNUWJ3ZXFreDRLQnIwdm1hQnNLeHJFVUxreXcvRXNM?=
 =?utf-8?B?bDRZamQyYkFsQndRZ3FocVhRTDk3aVFHT2NCUDNXRlN0SlErYzNKdGpLelpT?=
 =?utf-8?B?dUplajZ2aFdMdlFZaktyRFV2aHA3UFJVU0ZPZVdYTGFDT1BraG5mU0xxNXQy?=
 =?utf-8?B?Mk9xR3dVSk9SczVTNlFNTU5tNVBFMkZRYStvV0VWWEZZbHBDcUp1cFhrT1ZL?=
 =?utf-8?B?Q3ZuR3BEdU9jQzZkSks3VkVqOHA1dGlzUGtSZlRjQkR1NkNFbXc2Z3Z4ZnZO?=
 =?utf-8?B?MjZFOUdES00vWHlGU2l6NTVmNnY1QW9HbVpVWmRGUUZQYUtYVTZoZC81ZWZW?=
 =?utf-8?B?M1lGRnBQOU9vQ3dyUXpWdzhUcEl3STZvTGFSYkhhUzlxNTVFdlFlWTBJZlhI?=
 =?utf-8?B?b0NFbFk5VFJZd3dGRFNzQUtRNWVLOFJBSElUeExjUERoVm56K2x2NTFUeW1H?=
 =?utf-8?B?QUxEYk5MVFBjazBrTks1U1N6ODVKbWxnOTZvOTFxeVpyNlFGTktVQ01Oa2RQ?=
 =?utf-8?B?eDNjc0dpY3NBc0dXU1hXekJ3eE5HTW01Qzk1NTMrUTl5OWFTTDZvcDdGb0pP?=
 =?utf-8?B?ZWduaHdReXFnd0ViNE00RkdJaFNEd2FQWDJ3WXBQQnF3Z2ZITmtSODMzLzhh?=
 =?utf-8?B?eEJBbUtaWkwwTWVsMWswTHpya2hmQ2pFS1JwcmNtWGFrOXhJQUhURHV6eHBH?=
 =?utf-8?B?WktudDZiSWlhWDN5TnBGRmZFWnhKeTJHbkRiV0VGQVM0dWwvcGprY1E5cHJP?=
 =?utf-8?B?V3d2YXVyRU9SWk5MdzZjNTFvWmxIditFVGdiODNYQjZxVWFtVUg4ckwvN2tk?=
 =?utf-8?B?WnQ3MEJsSWJ2Q0h0bU94bEhFNjZwYVIrT0ZFZGJwUHNKaG1DM2ZzZnIvMEEv?=
 =?utf-8?B?VmVsaXNiQmp2dFZSeElvcTVWYzZKcks1MURTU3hzNU5EbVNIdEg1N1JJNzh3?=
 =?utf-8?B?NUxyR1F6S2ZpYXBCUVhYa0p6YnpIOTJ1NFpCYktPS0NHSkVoUnhnaGdKb1Fa?=
 =?utf-8?B?ZmViSjh4dXJwa2NDTitPdEEwbXJXd0FvL2dVV05URXIwMU0yWktrT2kyb2o4?=
 =?utf-8?B?ckpLaWZ1ZUdSZzN1TGNlbDk1RUV3TmlEd1pLQ1FrQnovdEppeDlVT1oybVd4?=
 =?utf-8?B?d1NPZXlNK280VE90NzJkR1ZiOWdBZGM0WGQ3dVVGa1VBdlpON2NQcGRFcjYv?=
 =?utf-8?B?SVQ5YmdhRGppZlNIdVBicnVyeEhPR2VJby82Mk1lTndWUXN5V05LVnpEZnBO?=
 =?utf-8?B?R0hnNDVLd21FS0w0aGdZY2tBaXMvUE1DM3ArK1NGdEpMUmg0SzM4amJJUmhp?=
 =?utf-8?B?NS81dnZHVWduMWwzcUtHakxOdzY5UjNGV3BCTjFTaUlyblU0LzcrSFZ1YVdB?=
 =?utf-8?B?UTF1Q3F6OXZwTzQ4RE5XN0JVdmZ6Mkl4cnJCVzJmS005dXpTY3o3OFlEd2dF?=
 =?utf-8?B?aHBXeG9NdWEvTVEzK2dJdjZRWUxML2dUSy9JMWM1T01IZ0ExNzRZNHNabkhq?=
 =?utf-8?B?UmltZmd1V3YydGluZ21GYXRWeVR0a0xTT1FvcVNVN1RDSzJRQWdJSWpmcFJD?=
 =?utf-8?B?NlBnRlB5QU5OYjhhZGZiLzNXci9rbEZKOUJYUmY3NHNISkNyUlp5T1hNVmJj?=
 =?utf-8?B?eE44SU5TUmN6UW9tdEJCUFZxQkJzSTllZFIyODIxbkVYTm9KR0VoVjdPQVRS?=
 =?utf-8?B?ekxlbUt2T0VERjdhQis5R3VHM1M0OTd3MVEwMExCeUp6UjBHRUNzZjNrZXlz?=
 =?utf-8?B?a0lMYWY1eGlwL2xuUCtSL2YzMUI1N2NlWDVrUXJTRWdFeHVKSE9MQTYzaE9K?=
 =?utf-8?B?RUgvUW9QdFc3cFJlcmg3L2puc2xWR0pRTElaVkJlcWl1R0VtUURsN21Gbjgz?=
 =?utf-8?B?WXVHd3lQRTczWXZNUFp4MFVhWmZBNDZyMTNNaGdCU2pKWEx0aFJYZzY4b1Jl?=
 =?utf-8?B?bmZobmZLa2lSaDVuM241WVoyMnV1NmdVczRGUTJHemZaUzgwLzB5UWNrNk5t?=
 =?utf-8?B?WTJSOHZDOUxMT2tzMWxydDN1TFFnNmdaRk9ORjNINU1HVnprK3dvSE83a0Fk?=
 =?utf-8?B?a0E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3796a7c7-54ea-4fa0-14dd-08dd86c4712c
X-MS-Exchange-CrossTenant-AuthSource: MW5PR11MB5764.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 02:20:42.9461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yXPf+ADPIoS6K2liRHLEg+VNmQQ97icXMJHARWPQySv8z9Jopz08um3sPg2S9t0GtnhyR9jocnppLB4Urg8LarzdO6m2Z3RmKGVKiIY6Yvc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8989
X-Authority-Analysis: v=2.4 cv=KsNN2XWN c=1 sm=1 tr=0 ts=6810377d cx=c_pps a=pa2+2WWV+ihErLhOOf7pAQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=t7CeM3EgAAAA:8 a=AnoVNgs6OrupFnauJBUA:9 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: o0EFJ0emXZIi3lHhY83Dse1I-FxfoLyj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDAxNiBTYWx0ZWRfX1eTlesXuhd9W pPExzXdHt6nqxvzRVNiUxuSVtB2DG2XQPxd+UqeFhKoNoBlLJcJe+T1p8K8wz++sXHciSEbe5dd 7/JvjJbvS02qXDX4IkYcDjMoCnbT/N6zHPf/f1VfHXpZQNJ7JatLVNi3wVLzgGTpCB/oapIS2r7
 IxJqgZNvWV18Myzj69pslmnC7r4Is0ApPJm7dzL8Nge4RzijGOhDuPD39iGHtjPZyAig1hzrNJn Ej9sPzsZfChBAag+xCKVtEXXg46vdqXVK6TAuIlFJOU/Ogp+kvt3ECzTmam9NS+AVhfwF0+g9r0 E+rEXQVAfk3AqiJMJgaY5qurMXGDaWiu4mnhhAowDm6K+PBhOwxIogknl//0yOfduVB8Tnj9mvS
 3SKiWjJvSqZGnZvHGBVoufUQEWCMwjZD/IyyiCHzmpxmzXXReNUImkJi0ouB88aWs1nYLd+A
X-Proofpoint-GUID: o0EFJ0emXZIi3lHhY83Dse1I-FxfoLyj
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 phishscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504290016


On 4/26/25 14:53, Xiaolei Wang wrote:
> When rproc->state = RPROC_DETACHED is attached to remote processor
> through rproc_attach(), if rproc_handle_resources() returns failure,
> then the clean table should be released, otherwise the following
> memory leak will occur.
>
> unreferenced object 0xffff000086a99800 (size 1024):
> comm "kworker/u12:3", pid 59, jiffies 4294893670 (age 121.140s)
> hex dump (first 32 bytes):
> 00 00 00 00 00 80 00 00 00 00 00 00 00 00 10 00 ............
> 00 00 00 00 00 00 08 00 00 00 00 00 00 00 00 00 ............
> backtrace:
>   [<000000008bbe4ca8>] slab_post_alloc_hook+0x98/0x3fc
>   [<000000003b8a272b>] __kmem_cache_alloc_node+0x13c/0x230
>   [<000000007a507c51>] __kmalloc_node_track_caller+0x5c/0x260
>   [<0000000037818dae>] kmemdup+0x34/0x60
>   [<00000000610f7f57>] rproc_boot+0x35c/0x56c
>   [<0000000065f8871a>] rproc_add+0x124/0x17c
>   [<00000000497416ee>] imx_rproc_probe+0x4ec/0x5d4
>   [<000000003bcaa37d>] platform_probe+0x68/0xd8
>   [<00000000771577f9>] really_probe+0x110/0x27c
>   [<00000000531fea59>] __driver_probe_device+0x78/0x12c
>   [<0000000080036a04>] driver_probe_device+0x3c/0x118
>   [<000000007e0bddcb>] __device_attach_driver+0xb8/0xf8
>   [<000000000cf1fa33>] bus_for_each_drv+0x84/0xe4
>   [<000000001a53b53e>] __device_attach+0xfc/0x18c
>   [<00000000d1a2a32c>] device_initial_probe+0x14/0x20
>   [<00000000d8f8b7ae>] bus_probe_device+0xb0/0xb4
>   unreferenced object 0xffff0000864c9690 (size 16):
>
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> ---
>   drivers/remoteproc/remoteproc_core.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index b21eedefff87..6226e2d12a97 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1656,6 +1656,7 @@ static int rproc_attach(struct rproc *rproc)
>   unprepare_device:
>   	/* release HW resources if needed */
>   	rproc_unprepare_device(rproc);
> +	kfree(rproc->clean_table);
>   disable_iommu:
>   	rproc_disable_iommu(rproc);
>   	return ret;

Hi Mathieu

For this patch, if I use devm_kmemdup() instead of kmemdup()

in rproc_set_rsc_table() function, is it better? Also delete

kfree(rproc->clean_table) in rproc_set_rsc_table()

thanks

xiaolei

