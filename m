Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2068.outbound.protection.outlook.com [40.107.237.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1273B84D34;
	Tue, 27 Aug 2024 22:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724797226; cv=fail; b=XGjhD7PRqkPzdj/wRLUtKBj652qbKELqenVYCI/CnJ6GudqKAyUcs0lb6W4lbGrB3FN9xf0YxNOw0podTgiWcn6hPrRt0XiHlCnyEMUIzMAEL/6hD6irSaZ4cK4fZJ05HNR0XhfyREy49ohXEkMARX+9QSjta0aDClT7q+MszP0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724797226; c=relaxed/simple;
	bh=ucT1up2wVke8VurYb2cGpEeIcegGu+u7vdoIsHmsSsc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AuHeaieth+6J0JbNVM3u1KtG5zz/9GpCzSa5pjdBLI9KOFQWqk9uvQNvYCuG6EC0A5Ym7rqcaHzItTlxRjfK8EVTJUqOUZh/LwyLL8JDeIlH+suacbPhv/mp0pqTp2dbiz8ctYzL2Iu7/EQJ8tvYPcvgd5bhQ5qLwQ/TG6zA+kk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=CabttrIB; arc=fail smtp.client-ip=40.107.237.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="CabttrIB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aA/gatvpyB+5EpprfZQ/XNbXkK+zlXdB1q2/jDwi++UrBymMFyQ5ev+aFD/vSa8TY5Q4eb5QXsAs2srKUpa/CYr4X9FxzpwDGin/nMejjRjRCelPsinZ1mimE04Eshma2kjkrq7RlIo26+7VdUtS1TgH2i/Nr+iXV0cH0ojtWyNJRJlScKoziEt0RFLXuuXWfJAyWwouRsdY3XsB/wsG+5jw97J7Rhu/8+5/Gd15gHbwb5PXosl4Aoif/0+q+X7Hwr7GiEl0kiwz8sOLcc4s3cp/0ww2t644w0A/MGScI1fOURTTijSd4LWPgpdHYu0Vo7uDYhVZkTxWCE6codAyXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pBpOMNpnKuh9vNhp1mu3WcRkQJh4K6nGUQCHYgLRN50=;
 b=iKhQaOSt0ORm1sS8upsWL6ViocP0IMCZ+9UExoay3Eh7kbcdKmVebr3c48fC7Rik+4bvR7+X4Kd2XCv0CR+CqXNYIi4Nr75EI/H7mhzMJKw5YNOXl397tLJ/pfoukkd7iy+5keNNAMAxfIP1lbOM3TP5Ei1dV5grvrvHnHkhD2tZ7D6nB4rxH+hX9GmEUyfzFPaeyARFwv4i4jYdOR5AY3rD6+unz6S6ZBvRwuAimM+la+PzUW1ir3685vHRg5lKVShvRIB3tKMOmMOE13W2IWIV+zZOOFpcJiuLLEQwnmyqPyzccmm5TH8yInGjRWT4zRqpQxhoaLm5XgiNH/0oaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pBpOMNpnKuh9vNhp1mu3WcRkQJh4K6nGUQCHYgLRN50=;
 b=CabttrIBPfqj3EIbKTL5cQGqswYYRNQoEdlUoCy8YcX+CDJ8UeFVu46eojK/yPLCslNmDDnpnYoYs8Hmd8hGz8V62jV84ur8IsSbe1WNrP95VSv01kHOU6CEhpODKdbOCua9TGbhnc7u3Md32pWhREFrX4lLNwUnnTfk5n2lkPQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4956.namprd12.prod.outlook.com (2603:10b6:610:69::11)
 by SJ0PR12MB6877.namprd12.prod.outlook.com (2603:10b6:a03:47f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Tue, 27 Aug
 2024 22:20:20 +0000
Received: from CH2PR12MB4956.namprd12.prod.outlook.com
 ([fe80::fa2c:c4d3:e069:248d]) by CH2PR12MB4956.namprd12.prod.outlook.com
 ([fe80::fa2c:c4d3:e069:248d%5]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 22:20:20 +0000
Message-ID: <cfc767af-31f9-4cd6-baaa-14be7fd3496c@amd.com>
Date: Tue, 27 Aug 2024 17:20:17 -0500
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v4] remoteproc: xlnx: add sram support
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240819170937.3666806-1-tanmay.shah@amd.com>
 <Zsyr0+za1Wy1BjI2@p14s>
Content-Language: en-US
From: Tanmay Shah <tanmay.shah@amd.com>
In-Reply-To: <Zsyr0+za1Wy1BjI2@p14s>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0644.namprd03.prod.outlook.com
 (2603:10b6:408:13b::19) To CH2PR12MB4956.namprd12.prod.outlook.com
 (2603:10b6:610:69::11)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB4956:EE_|SJ0PR12MB6877:EE_
X-MS-Office365-Filtering-Correlation-Id: 21403ceb-99d4-497c-1856-08dcc6e66ff8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RmhmUjQ2azRXK0ZHb21NdFFKbzZLNVlkcEsvZFdHa2VKL1NxY3Y4U0ZYOU5j?=
 =?utf-8?B?QnhJdEJLY1dtUlZuZjZuWExuVVlPRFhaZGVINzkxZ0hUeDRlVTFnWFg5NEh1?=
 =?utf-8?B?Vnl6Zk5SRFgzQzhnSlNhNnBDZG5kWDhBaFN1WmZwbDRBbWMyZjFJakw1cjNq?=
 =?utf-8?B?ZVdEbWs5SUphalUyRzhOYlJuejN6MGxsZTdIUUdCdUFSS0VSb1RCWjFKZjA4?=
 =?utf-8?B?ME5uTDVJNGVzMFhoMnFHSE1FTmc2TERrZUFsak9mUzdnSm5mY2phRTRnMTlx?=
 =?utf-8?B?YldndW0yQzU4L0VQZFAvcW96VDExclN2elQvRWhVTzErVjY1MlJ6MjZhelky?=
 =?utf-8?B?NGpFTWE4cmY1M3VQUVdzTE1keGEvbWpuNUozZTV2TzZQN0FzUHdOVVdmazR6?=
 =?utf-8?B?ZmJ1L0piaFRQSjloUnBBTWFqempzQmlTcXZFaUN4anVORVdRc3FXa1pVdDhj?=
 =?utf-8?B?aFo4Nm5pWGlQVGd5N2JjWTY3Z1JzSE80dmp6dGcyTUJLdG9HZURYbEFHYlBT?=
 =?utf-8?B?VkVDS0txNkJQS0llaE5KYVhNUHFKNGNIaU42UnUyLzhTTzFYODh0TzRuaitS?=
 =?utf-8?B?RFowNnZiRXhTeVZnMVpoNXhkNU1tRDhwczR5YWJoYzJzQUY4UkljdUdMYmZn?=
 =?utf-8?B?Vm1kY1h4RkxrREhlVEhGdE1QSEsxbGNWL1pIQ0k0NDZReStnYkpYWXhPTXdL?=
 =?utf-8?B?ZHJCS0tqQlhCSDlKTzhmekIzRlRzSHUvak44OFIralBFL0JyakFWUXJaL3du?=
 =?utf-8?B?ZC8xeXhZeEt0ZnRQTkhMSXk4K3hMaHlwbGFSS1FoRk9RUkNqYlNnWStrZitE?=
 =?utf-8?B?a3BxTUI3bkhvSE5QbGJHQVlqL3hVVjBzM2JDMk1lSzkvVU9vcUNxaGhtS09h?=
 =?utf-8?B?SlN2Z01WRGNmVWc5QytLWW0xOUVEdG82MVkvNTRoRTZNR0tFcis4ejRWVjRY?=
 =?utf-8?B?S1F0SEtsVHJESmtIR1FTMlhGQVpMSEs2cVpsMGF5VXRRRC82dktETFpVMjVT?=
 =?utf-8?B?cHlhTFc2L3BicDgzNkNUV2dFN3pKR0Q2b2VTQ1N2SmY0Z015OG5UcWMvK3Rr?=
 =?utf-8?B?alhIaWNIajhtNUJEMDRDOEl0azE1bDFjVWQxYkRNdTBUNGZURUVHL2NGMS9m?=
 =?utf-8?B?ZVpiR0cxZXFMOXdCVVYyT21VdXFtRytmVnIyc3FXRjZYMExEa0gxZm1paC9L?=
 =?utf-8?B?TFVlNFlOc3FGMkFrTVFpcmtZSHYwWlBRczVLbGNQWU9xMnE5UU9JMXpmclBv?=
 =?utf-8?B?RWZ5SXp4d0h3enBvTFF6cWRQYjdlWVZ0TlduaHRGSWIxUGxlV3dsZDdZUHZv?=
 =?utf-8?B?U0tQOGJhcEpucW5LZjRIakRaZ240d3pRSmhvZzNuZEc5YjFia0lFKzkyeUNk?=
 =?utf-8?B?V2FsNkdsWmYzOUp3MUVWWlFqMWxrdnVFMkRSQzRabnJoUUxsc2hNQVpwbUtD?=
 =?utf-8?B?UStBVWs2K1dYVlduWjJNbnVFS3FZT0diNDIvWVY5L3hPczBXMk1GY3U5WTZL?=
 =?utf-8?B?WTVNYUxwRG5zS1JqWkRzd2hYeXpMS29JOW0zMXFDOFVpbTlJakc5QXlCUmc1?=
 =?utf-8?B?TmVPVGtwcENjdktTNFdEWlNSd2dib0N5RUxTZjExNGtxN1lvVDVpWmRUNkJJ?=
 =?utf-8?B?V1hJeGJUZ3kwc1dDMU1sMUlYRldtTDJUL1VKWTlxRHVaTDNjYTMzZVdrU3ZN?=
 =?utf-8?B?NkF2NWxhNnlGb1hWRThsZTcwTEtzVkxGMkRvZU9Id3U5Wnh1UThFc2Q2cTVo?=
 =?utf-8?B?b3hQRHBLMGZsUHpFOXZWRjBXV2xnNW5tUkg0T1RPalZzdnVLTXJtd0RJc1Ux?=
 =?utf-8?B?am93UTh1ZElJYWFIcEpFQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4956.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UXBxSis4TkxGUFRHSUlWcTJ2U3I4Z0FpZ2FnbVRDVE9aa1IwbktJcHE3UnZj?=
 =?utf-8?B?VWF0cXRCaFJZM1JwQUJGMTV2OHJhek1YdG5OV01CTG9VSWFOSS8xUlB5VWJG?=
 =?utf-8?B?K1BoWkdRQzRiZ1pnb29hazBqWHVmUFVtbXB4Z0xuVHRGVVlWWWpGRzl5b2pn?=
 =?utf-8?B?UWFKWGZBUWtTdlMwVm1Gd1RxY29FUE44eGF4RGN1cHJJZE4vMVZIak1zSjcv?=
 =?utf-8?B?TTk3cXpjS3htbzhVdGxnR1k2OGpsNWxOSmJFaXJydmNGd2d5N2Z0Ylkzdml4?=
 =?utf-8?B?VUhkc1Y0eFc2ZjNTcVpDOHpaYW81ckNLOE1ERWxLd1VrbmhqMXRpdnZMZCsx?=
 =?utf-8?B?aitFOGF3TzBZZUUzbXYxenFLRGdzME9WYVQ1c0hFZEJva2RldDFUeHN0eE44?=
 =?utf-8?B?aitwZTRvNnpzNzlOcC9sTDRpdkZtUHdxQ0Q3SkptRm5pckVWdGhGTHdQeXNF?=
 =?utf-8?B?UEZkNnBNbnpMc3V4U3ZDR3Y5cVVxT3haREMrVVV4OW5EU214MTlPa1VCTFpO?=
 =?utf-8?B?V0VuMVF5aWJ2WTl6ZE1YdzFYZ1lVM0xwNHdYMk1ZWFRBRGxLbkR3L2JnRkJI?=
 =?utf-8?B?WGFOOExDTktDZUxka080OVVUZFEycHFWQ0s5VmEzRDhSa2IwU2F2MFpzdFVH?=
 =?utf-8?B?eS80cU9XRWU0RkMzMHF4QTAwUk5UUjB2QVMrczJsSnZoc0IzNVVSTDR2U3Ey?=
 =?utf-8?B?L1o1cElNOGIxR1FhWGZIWGJCaGZETUh3cEZBS09oMHYwU1IwSUhGVmZvUVFR?=
 =?utf-8?B?NG5NcklKZGRzeGRhMHI4MnU2QkJxTkMwa1JORCtINmZFOXFZWmdvRUVxL2Fl?=
 =?utf-8?B?TzdiLyt5N1Y0RlN6VGw5ZUNrcWhPNGFEdHB1RXhPeFR6ZklmdSt3cjFKSWdu?=
 =?utf-8?B?V3grZFF3TkdGNUtZSmdwUG1hR25oZllhMGw2TUcvaHBHdURib1RSaGUrZEFy?=
 =?utf-8?B?TGtSL3FRZ1I2KzlpTUo4Y1U5RWNsakd6VXBGQ1l0bkg5TFFTZXhEMVd5Rm40?=
 =?utf-8?B?dEhyNytBd0RleEs3c1E1NnVWSmlTVlo3QzNqNG9GMWNqOWtmcDlqaFBkNlNU?=
 =?utf-8?B?WXVuLzI5OFkvZytvTTBQQm56WElia2hRb0k4OFErQkxtMEtjakRldXNXcFNy?=
 =?utf-8?B?V2tJQ0tOUzVQN2l5aUp3cGpLNStSb2tBMHUvRTFHZXlFa1hkS1lRbHRldzVm?=
 =?utf-8?B?b1pGUGp1WGtQMWpWTEVDcFBPOW5SZ2daeExMcXc2Z0VlR3hhL1NibkF3Rk50?=
 =?utf-8?B?d1hVNWFtQWV6UDhFQ0xPK2tsbEtEcmQxaWloakNsSGZQdjZMbnMvU2VzYWcw?=
 =?utf-8?B?R3krYUlUU2xHWmVpdHRweElsY2hoaUNoUlZLYkg4aXFxRGUrak9hSGloa2JR?=
 =?utf-8?B?cGdwV3dmN2N5OCtnaVYvQ09QUi8waVlHY21TMXhIVWRwbkZwV084MEVYaU5C?=
 =?utf-8?B?VlV1djdueTJuYnVMOEVrMkFZQklhZW1tV2d1RTBKbHN3S2JVNllCeS9VTGph?=
 =?utf-8?B?UmJnS3lQTlNmSkJJZ0N2YlhKYkgxSk5XaVhaV2d4YXdsWnlCRnQvV2VERURJ?=
 =?utf-8?B?ejhFek1sb0RMMFV4T05ZVmIyY0VjdHQ3TlYxUE9ybU1DRmFNWGFJYnlGdDFK?=
 =?utf-8?B?SUJjRHR4WmxaZms0aVFveFNzTFQ1S1lFM3kvMHp1enY4RVVlSjRHYVhNbHE2?=
 =?utf-8?B?MmxQMEtVQ2VQYVVmRk1jMHk0OFF4S2JFLzlFdWhHTmlOM0NLYUxINk1vT1lk?=
 =?utf-8?B?bmYvODVMai9DNjFveFNqQnJnZTZvYUwwUmdaaWh0cnFKOEdvZ2JUcTBjdG1K?=
 =?utf-8?B?ME9PajhYTHFSQXZEbGhjV2NtRUJoMG9vQWZuSzNxcDZYMnRDckJla2VuUDJU?=
 =?utf-8?B?azNub3dPUE41c0VaTTJYOWhzNlZ1Zkpmb3VldXU1anpRelpTK2UxK2VReVEx?=
 =?utf-8?B?SmgwSzRpam1vOXhCMDU0bnRjT2ZSbjdZQWJvdkhTcHZ3a2hVTFRYSk5qNU1V?=
 =?utf-8?B?K2lvL25OODhtZTRtcVBadTMwamh6aUxnMXdjZkNQb0diQitWYlFnUjRHRDJU?=
 =?utf-8?B?K21KSXdyd0M1UmpKSkcrdXRuKytLNmgxQ0FtRkpiTTYzZGFMbE93b0hrNjNH?=
 =?utf-8?Q?rhcb3Lz/6ApGF6VMliRiBKi16?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21403ceb-99d4-497c-1856-08dcc6e66ff8
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4956.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 22:20:20.4399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l6vSPSxDOA2HgKACiip7I50uVnEaxQa5OuBogF93BnAdRiBsl70aULALthCTLjWE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6877



On 8/26/24 11:22 AM, Mathieu Poirier wrote:
> Good morning,
> 
> First and foremost the overall structure of your code has improved immensely and
> I commend you for that.
> 

Thanks! I hope to get better.

> On Mon, Aug 19, 2024 at 10:09:38AM -0700, Tanmay Shah wrote:
>> AMD-Xilinx zynqmp platform contains on-chip sram memory (OCM).
>> R5 cores can access OCM and access is faster than DDR memory but slower
>> than TCM memories available. Sram region can have optional multiple
>> power-domains. Platform management firmware is responsible
>> to operate these power-domains.
>> 
>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>> ---
>> 
>> Changes in v4:
>>   - Free previously allocalted genpool if adding carveouts fail for any
>>     sram.
>>   - add comment about sram size used in creating carveouts.
>> 
>> Changes in v3:
>>   - make @sram an array rather than an array of pointers
>>   - fix of_node_put usage to maintain proper refcount of node
>>   - s/proprty/property
>>   - Use gen pool framework for mapping sram address space.
>> 
>> Changes in v2:
>>   - Expand commit message with power-domains related information.
>> 
>>  drivers/remoteproc/xlnx_r5_remoteproc.c | 165 ++++++++++++++++++++++++
>>  1 file changed, 165 insertions(+)
>> 
>> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
>> index 2cea97c746fd..6d2ac7b85c8a 100644
>> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
>> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
>> @@ -7,6 +7,7 @@
>>  #include <dt-bindings/power/xlnx-zynqmp-power.h>
>>  #include <linux/dma-mapping.h>
>>  #include <linux/firmware/xlnx-zynqmp.h>
>> +#include <linux/genalloc.h>
>>  #include <linux/kernel.h>
>>  #include <linux/mailbox_client.h>
>>  #include <linux/mailbox/zynqmp-ipi-message.h>
>> @@ -56,6 +57,21 @@ struct mem_bank_data {
>>  	char *bank_name;
>>  };
>>  
>> +/**
>> + * struct zynqmp_sram_bank - sram bank description
>> + *
>> + * @sram_pool: gen pool for his sram
>> + * @sram_res: sram address region information
>> + * @va: virtual address of allocated genpool
>> + * @da: device address of sram
>> + */
>> +struct zynqmp_sram_bank {
>> +	struct gen_pool *sram_pool;
>> +	struct resource sram_res;
>> +	void __iomem *va;
>> +	u32 da;
>> +};
>> +
>>  /**
>>   * struct mbox_info
>>   *
>> @@ -120,6 +136,8 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
>>   * struct zynqmp_r5_core
>>   *
>>   * @rsc_tbl_va: resource table virtual address
>> + * @sram: Array of sram memories assigned to this core
>> + * @num_sram: number of sram for this core
>>   * @dev: device of RPU instance
>>   * @np: device node of RPU instance
>>   * @tcm_bank_count: number TCM banks accessible to this RPU
>> @@ -131,6 +149,8 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
>>   */
>>  struct zynqmp_r5_core {
>>  	void __iomem *rsc_tbl_va;
>> +	struct zynqmp_sram_bank *sram;
>> +	int num_sram;
>>  	struct device *dev;
>>  	struct device_node *np;
>>  	int tcm_bank_count;
>> @@ -494,6 +514,56 @@ static int add_mem_regions_carveout(struct rproc *rproc)
>>  	return 0;
>>  }
>>  
>> +static int add_sram_carveouts(struct rproc *rproc)
>> +{
>> +	struct zynqmp_r5_core *r5_core = rproc->priv;
>> +	struct rproc_mem_entry *rproc_mem;
>> +	struct zynqmp_sram_bank *sram;
>> +	size_t len, pool_size;
>> +	dma_addr_t dma_addr;
>> +	int da, i;
>> +
>> +	for (i = 0; i < r5_core->num_sram; i++) {
>> +		sram = &r5_core->sram[i];
>> +
>> +		dma_addr = (dma_addr_t)sram->sram_res.start;
>> +
>> +		/* Use actual resource size, as genpool size can be rounded up */
>> +		len = resource_size(&sram->sram_res);
>> +		da = sram->da;
>> +
>> +		pool_size = gen_pool_size(sram[i].sram_pool);
>> +		sram->va = (void __iomem *)gen_pool_alloc(sram->sram_pool, pool_size);
> 
> The genpool subsystem API is used to allocate the genpool but other than
> being free'd int zynqmp_r5_rproc_unprepare(), nothing is done with the genpool.

API gen_pool_alloc gives virtual address, and that is used to read/write sram memory.
I think that is genpool framework's expected usage.
I am okay, to use ioremap APIs instead (like other drivers).
For now I don't see any problem with using ioremap_* APIs. 
In future if any conflict happens with sram driver, I will refactor as needed.

I will refactor v5 accordingly.

Thanks.

> Do you have plans to change that in an upcoming patchset?  If not please remove.
> 
> Thanks,
> Mathieu
> 
>> +		if (!sram->va) {
>> +			dev_err(r5_core->dev, "failed to alloc sram idx %d pool\n", i);
>> +			goto fail_add_sram_carveouts;
>> +		}
>> +
>> +		rproc_mem = rproc_mem_entry_init(&rproc->dev, sram->va,
>> +						 (dma_addr_t)dma_addr,
>> +						 len, da,
>> +						 NULL, NULL,
>> +						 sram->sram_res.name);
>> +
>> +		rproc_add_carveout(rproc, rproc_mem);
>> +		rproc_coredump_add_segment(rproc, da, len);
>> +
>> +		dev_dbg(&rproc->dev, "sram carveout %s addr=%llx, da=0x%x, size=0x%lx",
>> +			sram->sram_res.name, dma_addr, da, len);
>> +	}
>> +
>> +	return 0;
>> +
>> +fail_add_sram_carveouts:
>> +	while (--i > 0) {
>> +		pool_size = gen_pool_size(sram[i].sram_pool);
>> +		gen_pool_free(sram[i].sram_pool,
>> +			      (unsigned long)r5_core->sram[i].va, pool_size);
>> +	}
>> +
>> +	return -ENOMEM;
>> +}
>> +
>>  /*
>>   * tcm_mem_unmap()
>>   * @rproc: single R5 core's corresponding rproc instance
>> @@ -669,6 +739,12 @@ static int zynqmp_r5_rproc_prepare(struct rproc *rproc)
>>  		return ret;
>>  	}
>>  
>> +	ret = add_sram_carveouts(rproc);
>> +	if (ret) {
>> +		dev_err(&rproc->dev, "failed to get sram carveout %d\n", ret);
>> +		return ret;
>> +	}
>> +
>>  	return 0;
>>  }
>>  
>> @@ -695,6 +771,12 @@ static int zynqmp_r5_rproc_unprepare(struct rproc *rproc)
>>  				 "can't turn off TCM bank 0x%x", pm_domain_id);
>>  	}
>>  
>> +	for (i = 0; i < r5_core->num_sram; i++) {
>> +		gen_pool_free(r5_core->sram[i].sram_pool,
>> +			      (unsigned long)r5_core->sram[i].va,
>> +			      gen_pool_size(r5_core->sram[i].sram_pool));
>> +	}
>> +
>>  	return 0;
>>  }
>>  
>> @@ -881,6 +963,85 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
>>  	return ERR_PTR(ret);
>>  }
>>  
>> +static int zynqmp_r5_get_sram_banks(struct zynqmp_r5_core *r5_core)
>> +{
>> +	struct device_node *np = r5_core->np;
>> +	struct device *dev = r5_core->dev;
>> +	struct zynqmp_sram_bank *sram;
>> +	struct device_node *sram_np;
>> +	int num_sram, i, ret;
>> +	u64 abs_addr, size;
>> +
>> +	/* "sram" is optional property. Do not fail, if unavailable. */
>> +	if (!of_property_present(r5_core->np, "sram"))
>> +		return 0;
>> +
>> +	num_sram = of_property_count_elems_of_size(np, "sram", sizeof(phandle));
>> +	if (num_sram <= 0) {
>> +		dev_err(dev, "Invalid sram property, ret = %d\n",
>> +			num_sram);
>> +		return -EINVAL;
>> +	}
>> +
>> +	sram = devm_kcalloc(dev, num_sram,
>> +			    sizeof(struct zynqmp_sram_bank), GFP_KERNEL);
>> +	if (!sram)
>> +		return -ENOMEM;
>> +
>> +	for (i = 0; i < num_sram; i++) {
>> +		sram_np = of_parse_phandle(np, "sram", i);
>> +		if (!sram_np) {
>> +			dev_err(dev, "failed to get sram %d phandle\n", i);
>> +			ret = -EINVAL;
>> +			goto fail_sram_get;
>> +		}
>> +
>> +		if (!of_device_is_available(sram_np)) {
>> +			dev_err(dev, "sram device not available\n");
>> +			ret = -EINVAL;
>> +			goto fail_sram_get;
>> +		}
>> +
>> +		ret = of_address_to_resource(sram_np, 0, &sram[i].sram_res);
>> +		if (ret) {
>> +			dev_err(dev, "addr to res failed\n");
>> +			goto fail_sram_get;
>> +		}
>> +
>> +		sram[i].sram_pool = of_gen_pool_get(np, "sram", i);
>> +		if (!sram[i].sram_pool) {
>> +			dev_err(dev, "failed to get sram idx %d gen pool\n", i);
>> +			ret = -ENOMEM;
>> +			goto fail_sram_get;
>> +		}
>> +
>> +		/* Get SRAM device address */
>> +		ret = of_property_read_reg(sram_np, i, &abs_addr, &size);
>> +		if (ret) {
>> +			dev_err(dev, "failed to get reg property\n");
>> +			goto fail_sram_get;
>> +		}
>> +
>> +		sram[i].da = (u32)abs_addr;
>> +
>> +		of_node_put(sram_np);
>> +
>> +		dev_dbg(dev, "sram %d: name=%s, addr=0x%llx, da=0x%x, size=0x%llx\n",
>> +			i, sram[i].sram_res.name, sram[i].sram_res.start,
>> +			sram[i].da, resource_size(&sram[i].sram_res));
>> +	}
>> +
>> +	r5_core->sram = sram;
>> +	r5_core->num_sram = num_sram;
>> +
>> +	return 0;
>> +
>> +fail_sram_get:
>> +	of_node_put(sram_np);
>> +
>> +	return ret;
>> +}
>> +
>>  static int zynqmp_r5_get_tcm_node_from_dt(struct zynqmp_r5_cluster *cluster)
>>  {
>>  	int i, j, tcm_bank_count, ret, tcm_pd_idx, pd_count;
>> @@ -1095,6 +1256,10 @@ static int zynqmp_r5_core_init(struct zynqmp_r5_cluster *cluster,
>>  				return ret;
>>  			}
>>  		}
>> +
>> +		ret = zynqmp_r5_get_sram_banks(r5_core);
>> +		if (ret)
>> +			return ret;
>>  	}
>>  
>>  	return 0;
>> 
>> base-commit: 1a491aaf1d1ce3a1cf5190394c36f21d805c7e96
>> -- 
>> 2.25.1
>> 

