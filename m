Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED08378F44;
	Tue, 29 Apr 2025 02:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745893186; cv=fail; b=TSFwIIMlQvhhKVu40a+Oxry4fQjt0vJ032Smb3c+XhHGBO92S+7O6mVfAF+gEmTp0FE15jArxo3pZxn9swUpCT4CUhDqFBOWHK7tyRqgwDE+C5GBvNHnOlT+VZssqxvJYDeDgcLtBoa4e5wpAwbGaahiq4/WGCZ8FRbu1Wthfec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745893186; c=relaxed/simple;
	bh=4D/qobkzScoumjl+JxsE3Ewggkqpd11Y6DBBtJ8n1Xo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Pae4F4MaQ+cTmZm1A/p1b91wYbQk92ZvKTe0kq49/ROmbM0kK3khLNDnjHWWK0naWJ2DstirfHysbDPzuRmsDm0zCzDy0QdUyYtL7NGv5GRH5GXMfsZaBjKUE9x2etto4fu3oJFDP7ggA3I5CCGZMEVpPTPUS6F3wLLt6l5tEX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SMkfQN009261;
	Tue, 29 Apr 2025 02:19:30 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 468pf93pk2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 02:19:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e0/uj2QzYVqapltFAhUBXeaAeLv0CQ873sjWjWaxPuTqB2lwI7+gVruX4JQLn0eOAPJaqZq/6GNqZqOgMpZEd52vCPwI36p/a6KZ8xJ2TfBXda44pZdB09dTvQh8rFottwH9SAnLJbNUlD3KrkUJaxCYbjYdX7qbekP/O2cBRbYdMr8ZryCDaU0OuKNZvbne0yplHWrpMFI7/OGXGLPU3vNZ33IhGnc/oqvXgiL2xB/TavD45AN8yhyUxw4D1U3B4ZnpiMEPiSRQ6G+IF+/S18UTRkB0TkjFk3YwsRYBlykDRwRKC7ipbJc+R1KRx8/F6O1ZagwahqbabepORhzvqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p7RMlN7ciNQVe1XoAYNjmfG8uQYpEGBPotA42V7Py30=;
 b=WcQRXkfCU2H62iST06wFY5bLIFEOpSkz0XGiwpg0efDaJIXI5V3QenlL/5JSxHUrucltB28gV1ovMhAbHa7dkdu1XZ9IraDZ5yLs5ZH2CtOmuBOjGBlFAxmP+J1Kp/vNkdROTCIz7QfyxzsQJdqsBkY9ycudHmONZymIZZkd32mSiiSMcVM4357bOFj22Bm8hQ269TTrfu2VwfquC2T/Q0lyMMK4hdolRBa3HxV3URGnglCA0iX97DI9o3VO7QlN+Ux1tN2TdH4jgfARaL1JvAH+cYW9l7wTZQB/1Bjx3E7U9lXrDgLzgAOlWj44DOc+7P1mUivNqdJiXiLgHKi/KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW5PR11MB5764.namprd11.prod.outlook.com (2603:10b6:303:197::8)
 by IA4PR11MB8989.namprd11.prod.outlook.com (2603:10b6:208:56c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 02:19:27 +0000
Received: from MW5PR11MB5764.namprd11.prod.outlook.com
 ([fe80::3c2c:a17f:2516:4dc8]) by MW5PR11MB5764.namprd11.prod.outlook.com
 ([fe80::3c2c:a17f:2516:4dc8%7]) with mapi id 15.20.8678.025; Tue, 29 Apr 2025
 02:19:27 +0000
Message-ID: <5c60024b-5797-429f-bc0b-72ef58cd2253@windriver.com>
Date: Tue, 29 Apr 2025 10:19:19 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/2] remoteproc: imx_rproc: release carveout under
 imx_rproc after rproc_attach() fails
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: andersson@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com,
        linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250426065348.1234391-1-xiaolei.wang@windriver.com>
 <20250426065348.1234391-2-xiaolei.wang@windriver.com> <aA-xnA_zFn8UlTDQ@p14s>
Content-Language: en-US
From: Xiaolei Wang <xiaolei.wang@windriver.com>
In-Reply-To: <aA-xnA_zFn8UlTDQ@p14s>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY2PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:404:a6::34) To MW5PR11MB5764.namprd11.prod.outlook.com
 (2603:10b6:303:197::8)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR11MB5764:EE_|IA4PR11MB8989:EE_
X-MS-Office365-Filtering-Correlation-Id: 64230b7a-e504-4901-1391-08dd86c443d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NnRWcXZxWXlSRmRZVDM0NkU2MGJYZlhZdXg0L3ZYaTE1L1pqOUFzVnhKajJl?=
 =?utf-8?B?czVtOWgxM2c5bW52VTZnZFM0ei9kaXZBbWdvWGNJNldGRFE2S2l6emFjMjVG?=
 =?utf-8?B?TmxwbnF3K05CQ2JPK0ZDa1gvd3Z6REFrRTJRTFpqODlnV3hlTmZkUDNRSEYr?=
 =?utf-8?B?Y2s3MFBGSURqNW5yQk9LYnEwbUdZaWhYblI0bG9KcVc2KzRSZjBVM1A4Nlc4?=
 =?utf-8?B?ekJ2c1lNbkZuT2Y3Mng3NEQ5Z1Z4dzg1N2xFd2llUzZUdXhHWDkwL3lZc2tK?=
 =?utf-8?B?dzBTTE5TM1BFbzlONEt0TlBDMlpyUmF2TXZ3a1dVVDhmS2ZyUmRQN0dwcmNu?=
 =?utf-8?B?YXNVM2R0L21rYVZ5WUNOdTdmU2hhUWRkWGxMWk1hREFLY09CNC92N0VPVGVW?=
 =?utf-8?B?MmlRNWs4dVQ1d2VBWTRCZ1JidDUzTzRDdC9RKy9tcmhoWGdvMEpMaEZUL3FK?=
 =?utf-8?B?SUdPT2Q2Q05sOVUvQXcyb1hERVJHR3VvMVM2Y2dlSlQ3SXdacWFWLzZlajZo?=
 =?utf-8?B?MWMvR0RENGtQcGpZZjc3OHV6cy9jUkRjc0t5dlZMeHFZMm4yWVFtMWJZWEw2?=
 =?utf-8?B?S1FPbzltRzFrajhzYVNhYldSdmlhbC9TaUlINU9PNWhyeFNBVzljTUJmQTQr?=
 =?utf-8?B?ZjVuciszMVlHNFhFYndlelNmaEdhR3BZbm43TEZnNHNyM2JMdW9RSU5FL2ha?=
 =?utf-8?B?RUFzQ1pwUHJvVVZ0dmt3UkprcUQycHBneWRUYnpLY3FxNlBhTWRod3JDdlJl?=
 =?utf-8?B?OUR4d1BSeDgxL0RyYjdwalpJcm1nbU9ZckFWbXRMeUorbnJVaTZxVW50RFBR?=
 =?utf-8?B?Y1RuM0toTmNJNldHWXJ2YkJmRmZDSU0ybFdsNldCc2RDTE5jRGxlZmxNb0V0?=
 =?utf-8?B?UUlUK1BKTU1CcUkzQWtnakk1U0xBb3V5bjNDZ1N3REtVQ0lzc1hIOUhjL21R?=
 =?utf-8?B?ZEpPQUxkSXZjZkVQL2JFb3JuQi9WYjZoUS9NOWpsdG5sZW9jVisrVVhWaDA1?=
 =?utf-8?B?WUxzV2o3QnRxdWNKdEsyTitDS3UrdjArUXRWemlvRmVEWElsQ0dkL1crcmdC?=
 =?utf-8?B?WE1JeURiSU8xemhrT1VtdEJ2NTJYWXg1NFJtVVRKdXdqa0NRLzlVRDNUZjhr?=
 =?utf-8?B?MmpwUEgzM3NraTlxNndRYkpYZWtLZ3J0Y01Lanc0T3pZQzhXcmVRUDFUOVp1?=
 =?utf-8?B?aE5mL1o0REh4UEExYzBGd3hZSW9FSUgxOVd4aFA5bld4czJhZjFFOU9CTFJV?=
 =?utf-8?B?Mjk2M3FPQ0tmbHl2aXgxbnoyNWlBVkU5bTcrRlJ1RmZkOXE3SVNkd0lyWmoz?=
 =?utf-8?B?TzJ6M1pWWWhRNEdwK2ZNZmpuNXl0c05oWkdibkhBVUhqMTM4QzJENUtlU0ZK?=
 =?utf-8?B?S1k0QytzVzFjenVUZXc0elBhbXd4cWtkWnZvVFNTc0czRkxuWTlIa2toYjll?=
 =?utf-8?B?anNXMzJSMi9jQXloM1Y0a010VEIvc0dJNkYyWmtHZ0tNZmt2UkRUUzJ3MTRW?=
 =?utf-8?B?TVdKZUJDcHJmMzN0eU52dEh2VVIzeXdLMTJDV1dkS1Zta0ZJUFd5UHMwa2Qw?=
 =?utf-8?B?VU5BbWxIM2ZsQnA3QmxXN29PTTN3Q2lkTDNkT3V6RFA5WmZBMzE5NmZNNWNG?=
 =?utf-8?B?QXdPV3VQenlKc0wwQ2lYdURpTGhwc1VidTdNdk5MMzhPTERORmFEeHZpdlpi?=
 =?utf-8?B?clRMdUgvdjc4elRhVVJrNGNZeHBEMkoybzBpL1RMbWFsZW1FeTVkZnRzTHc4?=
 =?utf-8?B?dTAreENuUVpoUExoQVdrc2tWcThPN3F3S05vM3BCaDFDWnhKMWJqYTZYcmdy?=
 =?utf-8?B?VXlvRU9zV2xBbnI0S1pieTlvb0JZbzU0ZUtUdWYxVmxNMzdxcGNKN0RXMDRh?=
 =?utf-8?B?dy9ORWtEeXVGRW5EL1ZhTHQ5dm5WRjNIelN2WlBVK2lWSW5rQTY5ZWVJRGFG?=
 =?utf-8?Q?lkJq5sSIqRA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR11MB5764.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WkdoWnlaZWF2TGdIREtWVnhzNmsyT0JPWCtrNGtqNjdxeDFOYXdxT3prOWxz?=
 =?utf-8?B?VmE2cjhNZEZRRlhKOVpMY3BMNzZ2dEd4WFYya1haNm9NSjlVaTJGb0tnZjJP?=
 =?utf-8?B?ZHpNcWpCRjdzQkNsQng3dGxIcDNQSkNObGRMdXBwVTZCcmtySk1SMDJlTUNQ?=
 =?utf-8?B?dXhrUXI2QWFwMCtmVlpzRExHSHczNiticTlJSjRiamtGU0lzcmlxdmlCTzZx?=
 =?utf-8?B?ekx0aFNhOXErNU5CUXllcHE2VHVpT3ZUSVJiYU9obGlnTllHbkpDaXJMcExr?=
 =?utf-8?B?QTdTVzJkOE0yT1hvVllyS3g4eFdZTlc5WHI1UFRuelZ1KzlZSTliTWN0WjdI?=
 =?utf-8?B?bDFFUUpNWEdHeGg3QndVak53U0tMZS9QUEZpY3dENkF2UFh4SmswS0F1QzFT?=
 =?utf-8?B?MVhqcmtxazhKcnhnZ3M0bkR6RS9PR2R4TndGdkx6aXdpU3U2d0JmeUV3UzRr?=
 =?utf-8?B?S25uUUo0Q09TSUdjbjg3OUorTmtqWlI3RnFaanN3Q1NteUlKMFR0TEhzRE9R?=
 =?utf-8?B?T1k2Y2tsdnV0SnlUU2ZmWlE2enRsSnZoWTFta21BRS8zaElyQ3BvYnNBb0t1?=
 =?utf-8?B?Z05xN3djSTI4UTdvc25URUpsMEVxZmVObDU3K29NbThmZTN6aUNTam1iSjVz?=
 =?utf-8?B?VzJFQ012MXdWeWgxLzdCTmpEektmTkc1TUNsdmhPNk1zTzRGaDdick1pcXVY?=
 =?utf-8?B?VU5pSXQvYUFHUjhVekJQL2N3dFdIWkpwWWY0eFIrRWx6TTJYSSsyN2psVi95?=
 =?utf-8?B?T25IZGhEeTlVV3Y2N0FkS3BQN3gwQkRlSVJkVXI0SndRckdqMjFpMzA1VExH?=
 =?utf-8?B?a1R1QkdTR1pnNk1wcWpwVStFNllJNGJlbEJTRmtHRHRlWmI1TWlEMVZueC9S?=
 =?utf-8?B?aEZFTS9oUmp6MDJRRTR3bm5KRjhJRDZHNEI2cDFjTVpFQTJhcjZUZlZhZENR?=
 =?utf-8?B?ZmpUcE11VlZYV1NGdFVUcklxaFVQUTlyTVBzcHpKOTcramQ1dVVBZ0RzdjNx?=
 =?utf-8?B?NUpsckRKUUFickNIY0ZvRysvQ1NndDRtT1NYM3J0eU45RzNBZStKSTFXMVpN?=
 =?utf-8?B?L014N2FyZS9MeWhxeGI0RTZ5Z2U0MmdZU1BWU2FGYVpMb0x2Z3RzL3JTVDJZ?=
 =?utf-8?B?M2ljYms2OVJ1U0Zqd0NCRXNoK0RjMENpSnl2MDRvaVBqbkdydzNCZ0h2YkRr?=
 =?utf-8?B?SE9TaVRiRjNZTzZHNXZKR2s2QUhqb0FwdFQzM2Z0NEVoNzVRZDZNZlFOWXYz?=
 =?utf-8?B?THFoeWFYMU5jalZ3MnRhM1FRNWxUSVdEd0FMaHczUkxyeWxSRDlBeVBSTzN1?=
 =?utf-8?B?MmZKZ2grTmRXVUV5R0kxMHUxNWFNVG5LNkhNaXZzZWl0cGtPRERRZVZ6b28z?=
 =?utf-8?B?ZE95RkhURllwTVBieW10UThBRVFJNWJieEZUemtqemtLSG9oZ2RrTkpwS0p5?=
 =?utf-8?B?eHhtM00xWGUvek0zK0ZEYVVhalp2UzZRbGVFTUdzZVQvL0J6Rm1KUE1YVElJ?=
 =?utf-8?B?ZnczQWdjck11YWxST1JRTkR0NUpXZ240RzNhYWYxeCtySi9FQ3NzZGUzMGt2?=
 =?utf-8?B?THl2NkNvYjM5QVp4ZmhCbGQ5R0ZhdDhrZ1FBQjFxL0hpbGZhNzdDS1duclVX?=
 =?utf-8?B?UGVORjdyNERBdUYxRHR3YkN2dW5LU2kvVFlmSjRwSWtHc3M0anNDYU5qdGhh?=
 =?utf-8?B?ck9OeVBUTS9hWU5USHFJdUZ5MXY5QnpyeW51UnRqVnFQbC9pZGlUNy8vOUZJ?=
 =?utf-8?B?MUNLNFllbjRIM2E4Uk5aRTZ2Y09SZ0J1cXB2WXpVOVVmbFVBTmdweDhrUFRt?=
 =?utf-8?B?ZmpyQ0tHaXZmU2xKb0hDbk43NnRucWtMWWU2VXpvcEpIczhuQU50emdqekpQ?=
 =?utf-8?B?SGZmTzdQeTNxc2RGTFBUcUxUT2h0RU5KaGlxVXdqaDAwMmxSQlNFbTllYkh2?=
 =?utf-8?B?anY4cWpIM0lKTHljbFFqdVhSSjhwMmloTWg4ZGpBQ21kbi91U1VvdGpSdVlQ?=
 =?utf-8?B?c1JyZ3hmbFd0QjhuYkMxRUFOZlFHTEdhTXJUTlJXb1d3NEVDSWgwQ0dJU0Rq?=
 =?utf-8?B?V3Jhc3IwRDhiRkltdUx1bVgrcHpSSjc1RW4rcUdvMFhLbVh0TUF1Ykt4VHQ3?=
 =?utf-8?B?Yk02MUZnZ2VuckhYWThMK2tET2I3OVNjSi9ub1FqOUU4SXg1VklTM3BYckt5?=
 =?utf-8?B?MGc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64230b7a-e504-4901-1391-08dd86c443d9
X-MS-Exchange-CrossTenant-AuthSource: MW5PR11MB5764.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 02:19:26.9294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MCYkBMgzpc4dvub2e8jCncjo+bUpfeq+MvWxRaoAcnTxhOQdjj3Sk4vi1/WCaYb6cmWnpJY3Hos6qlPVkTaFUF3IWiKPD+bR3n7KIH/OI3E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8989
X-Proofpoint-GUID: w9ZYVURyWhdPP29dYJ-RJuY6kLJy__5G
X-Authority-Analysis: v=2.4 cv=EavIQOmC c=1 sm=1 tr=0 ts=68103732 cx=c_pps a=smr7v+wKk2SgYJk0SwJNKg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=t7CeM3EgAAAA:8 a=rjqC7Sof8tKlXaNZ4ecA:9 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDAxNiBTYWx0ZWRfX/Jn17fASsdTp 0RO3QJyoms094Kb77xkFjN1H1CFp1P/F+QEeMQgC33epu6y0J+GceXFl8kXI+UDOjXhRCG6E7Lt r9DRzhcPFx0dwtNfkvU/wHzdd+2bM4lBqWmpBsA6x+DJkIrc6moxYDE0VqNLYcHW7A/jxAgjljx
 cULU3aJ9vaYlQorR2DqvIrNRRlLrAdvcjLOf8YawUMsGK+5QqymxYwXHSRfJi3gnsoxhmpIqisX TItNFZDseZk6ePcLJtHjEe/UPEY1QXBsIxss/Rs4h4TOPS3fmDT0kP5em+j2QZWIT47Zh9eQidB euAtxd5PTK/wVcvKlD/ao0zNYuZS92Lt4hEhKqUEG5+q2ZK1RCgq2Cc48tYkyYPMVXnpaMbjdcM
 eOEum/X6VouIGaYFCw/pKNCpssNU6ukQ0HF+G+fLU658vmDeaUotdDtLboUEwzCOybCyrtUu
X-Proofpoint-ORIG-GUID: w9ZYVURyWhdPP29dYJ-RJuY6kLJy__5G
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 mlxscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504290016


On 4/29/25 00:49, Mathieu Poirier wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> Hi Xiaolei,
>
> On Sat, Apr 26, 2025 at 02:53:47PM +0800, Xiaolei Wang wrote:
>> When rproc->state = RPROC_DETACHED and rproc_attach() is used
>> to attach to the remote processor, if rproc_handle_resources()
>> returns a failure, the resources allocated by rproc_prepare_device()
>> should be released, otherwise the following memory leak will occur.
>>
>> Therefore, add imx_rproc_unprepare() to imx_rproc to release the
>> memory allocated in imx_rproc_prepare().
>>
>> unreferenced object 0xffff0000861c5d00 (size 128):
>> comm "kworker/u12:3", pid 59, jiffies 4294893509 (age 149.220s)
>> hex dump (first 32 bytes):
>> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
>> 00 00 02 88 00 00 00 00 00 00 10 00 00 00 00 00 ............
>> backtrace:
>>   [<00000000f949fe18>] slab_post_alloc_hook+0x98/0x37c
>>   [<00000000adbfb3e7>] __kmem_cache_alloc_node+0x138/0x2e0
>>   [<00000000521c0345>] kmalloc_trace+0x40/0x158
>>   [<000000004e330a49>] rproc_mem_entry_init+0x60/0xf8
>>   [<000000002815755e>] imx_rproc_prepare+0xe0/0x180
>>   [<0000000003f61b4e>] rproc_boot+0x2ec/0x528
>>   [<00000000e7e994ac>] rproc_add+0x124/0x17c
>>   [<0000000048594076>] imx_rproc_probe+0x4ec/0x5d4
>>   [<00000000efc298a1>] platform_probe+0x68/0xd8
>>   [<00000000110be6fe>] really_probe+0x110/0x27c
>>   [<00000000e245c0ae>] __driver_probe_device+0x78/0x12c
>>   [<00000000f61f6f5e>] driver_probe_device+0x3c/0x118
>>   [<00000000a7874938>] __device_attach_driver+0xb8/0xf8
>>   [<0000000065319e69>] bus_for_each_drv+0x84/0xe4
>>   [<00000000db3eb243>] __device_attach+0xfc/0x18c
>>   [<0000000072e4e1a4>] device_initial_probe+0x14/0x20
>>
>> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
>> ---
>>   drivers/remoteproc/imx_rproc.c | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
>> index 74299af1d7f1..c489bd15ee91 100644
>> --- a/drivers/remoteproc/imx_rproc.c
>> +++ b/drivers/remoteproc/imx_rproc.c
>> @@ -595,6 +595,19 @@ static int imx_rproc_prepare(struct rproc *rproc)
>>        return  0;
>>   }
>>
>> +static int imx_rproc_unprepare(struct rproc *rproc)
>> +{
>> +     struct rproc_mem_entry *entry, *tmp;
>> +
>> +     rproc_coredump_cleanup(rproc);
>> +     /* clean up carveout allocations */
>> +     list_for_each_entry_safe(entry, tmp, &rproc->carveouts, node) {
>> +             list_del(&entry->node);
>> +             kfree(entry);
>> +     }
>> +     return  0;
>> +}
>> +
> I have reflected long and hard on this.  The problem with the above approach is
> that we do almost the same thing in imx_rproc_prepare() and
> rproc_resource_cleanup().  Function rproc_resource_cleanup() is able to deal
> with empty lists so I think it is better to fix the "goto" statements in
> rproc_attach().  More specifically, replace the "unprepare_device" goto
> statement with "clean_up_resources" and get rid of the "unprepare_device" label.
>
> Please see if that works on your side.  I am good with 2/2 of this series.
Thanks to Mathieu for the suggestion, I will try this approach,

and also thanks to Peng for the more detailed explanation

thanks

xiaolei

>
> Thanks,
> Mathieu
>
>>   static int imx_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
>>   {
>>        int ret;
>> @@ -675,6 +688,7 @@ imx_rproc_elf_find_loaded_rsc_table(struct rproc *rproc, const struct firmware *
>>
>>   static const struct rproc_ops imx_rproc_ops = {
>>        .prepare        = imx_rproc_prepare,
>> +     .unprepare      = imx_rproc_unprepare,
>>        .attach         = imx_rproc_attach,
>>        .detach         = imx_rproc_detach,
>>        .start          = imx_rproc_start,
>> --
>> 2.25.1
>>
