Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2088.outbound.protection.outlook.com [40.107.244.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B805419D894;
	Wed,  5 Jun 2024 17:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717609525; cv=fail; b=NGT7QRoExReyh+2s/At2lHCiX3AsD+3FbO0WXBgYcoJaC5LrOX/xAZtJrM8OIfSBGD3a2RqFYOvonVsmFBPT55xom3XvKRqj6QOBlxgznWhl2KcsGCwiC6kyp1BO6h/Y3taLUyvanxoq4rSSVSSeCPjyyqgLGCpvd39OH/aV14M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717609525; c=relaxed/simple;
	bh=YEtl4yoFJVaU470Ic9eryBzQ/fSxYdqXHjfhkkdtaJs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Gviz/ZEBfvSU+qyYJ6NxIJGw/pld9sEI/rXYpuRxV/G9jIRl4Rgr9dJCowGFP964Bsg69OkwdmzBbApDFhZ1H2Br+uwc2zjB+XB4eooFENCNf3AZL9Hh35HUjMk62p7mXcI7APT7da8Zs6p9KsboOVKAWg3KhrmYkU0uh5HMUPM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=VF6XYbj5; arc=fail smtp.client-ip=40.107.244.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="VF6XYbj5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=amm1JSEr4ITwIgrp6amN895hDtpX/upKYS5vTXPa8zNGyrCu5hL9ypBFg9c1FJKQbLYMpRhUJEUUu0SKody2XQYRIamzpGv7mXlsAGrfEbR3eM4nQ5pRYOZgv0cM5+LM/FeSTBXlYZwJGt2fxR88+R9pk0Bmqm8Gr32DgfLzvcmLqZKpuTxlfwH9HkdXks+DioPuEtR3/zQSlGF3w7NnmmgUD1jK0uLdCTBgLATNvy1ZGPXgDzbfSdBRsn/RR/a5Pavd9adIFyXp67O//Q1h5x2EHpHjsh2o4fQHF23thNlDxEcQRKhAZVW+ztWeqQzi9ZierRXmHvxsJJ33dRoWVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HXB3y8+eaKfzSILXjpjEYzOherAWdqz8dqHj4/10l3o=;
 b=O6Y666/P+KlK2elnNtBCKhrmNb/TFtH1+VDBSiGCfkJ/ZMPb5csKRZ8KkugoV1o+gv4LeTK49X74+OdMWMBX/xWkbdoLifp9Y6+hOChOB0eBQIf0UeibpD/JyjWxy6ceUsNK9M7IsmqOdiTvKnAmrNL/2uZs0SkZN1Fq7A8QZzQQomd0DfykXXpFFZsI2WcTP3WR/vfXMRLCU4NP4OiqaCKEg7dXja5E+En+AEyOR0BxvR6e4DzRVVNil5JDm/okgXEchw9BtfM1D56SrmofYWuIZWOZ2ksMoFS/x3hN7WNz61zEQ7+jjbgujOyCEyvkUIpsHdkaAbXu7uh5XhdGkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HXB3y8+eaKfzSILXjpjEYzOherAWdqz8dqHj4/10l3o=;
 b=VF6XYbj5Iry9a4l1rI6nsk1qoseiwf7bC9np0JdHhDSDNst8GQXLQjbkCU8zjc8UU/7qkypXHiBD6LHGfx3u3PAnC6j1uDcW1diKdu/zwMHLV5OiRXZmhoPaCCnspgc0/QscGoRJ7WHMp9Kk87kXKY7XjlKAjYxwdb+XY5//4ZI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5874.namprd12.prod.outlook.com (2603:10b6:208:396::17)
 by CH3PR12MB7666.namprd12.prod.outlook.com (2603:10b6:610:152::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Wed, 5 Jun
 2024 17:45:20 +0000
Received: from BL1PR12MB5874.namprd12.prod.outlook.com
 ([fe80::5a16:a4db:8bed:1f5d]) by BL1PR12MB5874.namprd12.prod.outlook.com
 ([fe80::5a16:a4db:8bed:1f5d%5]) with mapi id 15.20.7633.021; Wed, 5 Jun 2024
 17:45:20 +0000
Message-ID: <640b84ab-ba52-48bc-839f-aaed24ed963d@amd.com>
Date: Wed, 5 Jun 2024 12:45:17 -0500
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v4] drivers: remoteproc: xlnx: add attach detach support
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240603203437.973009-1-tanmay.shah@amd.com>
 <Zl80Hanwo5siD6CG@p14s>
Content-Language: en-US
From: Tanmay Shah <tanmay.shah@amd.com>
In-Reply-To: <Zl80Hanwo5siD6CG@p14s>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR18CA0004.namprd18.prod.outlook.com
 (2603:10b6:806:f3::13) To BL1PR12MB5874.namprd12.prod.outlook.com
 (2603:10b6:208:396::17)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5874:EE_|CH3PR12MB7666:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d3284ed-ed77-4741-c797-08dc858744a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?akxJSTNKdzdGZDhVV3JORHhadWExRmxyT0FnbnlhTVBXL0F0MjlTV0ZMSEtB?=
 =?utf-8?B?SVc3VGRDV1MrVGY0bFB5cHlGVGlOQ0x6c2RRVFhuSjFvcE1pOEVaREhHbklp?=
 =?utf-8?B?Z29TWDl6SU5oVDhJMTFpb1E5ME9YMlVkNEl2VW10c2lGUUVqYVFXYjZEd1Ev?=
 =?utf-8?B?N0RTeCtFZ0hYb2NvMUFpVUJTMUh1bEdHWm9ZejRDcEt0UEhCK2tJUTVZRXN5?=
 =?utf-8?B?THBVV284ZGF0dFNJcnU3T1NYZnBmeEtnWFJBWG9jVk5pZUVqSlpJV3RtcFAx?=
 =?utf-8?B?RFJBZmE5WVdsM1orZEpSRldCejZlSWd2M0tYbUZuOFJVbXJGSmhNZWxpamtR?=
 =?utf-8?B?NGtSK05objhSalBFeHRlVTNONDRyVFloc3cxelRwb0RlbXpnWld3WkxaU0ZX?=
 =?utf-8?B?TEQrZUcwR2tOSkdFR0JuL200L2M5bzUvTDByeDNNd2lNbjR3T2JtU2JDSENX?=
 =?utf-8?B?VUdWVzNOeUZpT0RWQ2tkSGY3MWVZVWVxUFJPUnpGamxZRmZIRllZbTR0RTIr?=
 =?utf-8?B?RUhlblFHREE3UldtSXIvdjF5VjhYYzdEbmNraVZBbGx6WUFkYzNJSEVTcEt2?=
 =?utf-8?B?YVg2aTU1SjhXRnZWckVCR05mVHFsVkpYTW9IQjd5TW5FMEZiV01ITERSOFJk?=
 =?utf-8?B?WngzcHdqNFZsNTZZUkVhYStGdDNUL2JuVFByS3RaWk03dXE4ZG9XenlONWxj?=
 =?utf-8?B?NHpIU3Ayd2lMZGhGa2JJSXFDQXk3Ulc0N3M3UzAxSTdEUkxaNERCV2t6bS9t?=
 =?utf-8?B?RUwwSlh3R29lSGhNUWFZbFN1cGpNR3JFdXh4SHZBcm5PckVoQ3FVci9FU0ls?=
 =?utf-8?B?cU9tNTFEOXA5QVgybjNZNHgrZzZhOCs5OXJRU1VIcWg0ZzMxeXdhcEVoSUlJ?=
 =?utf-8?B?YVpFcFQvVEpvcWE0UzV1OE1ZUDJYZUhhcGNyWjhrMXBRSkVEME4xbVNGbEQ2?=
 =?utf-8?B?Z0cyT0JSbHNpcFFmbVNwVjYyYzlrbW9PNWpuWmRzZVQ5TlFCQmozTENsb2gv?=
 =?utf-8?B?bmNKMmcyMnZkUlNnM25uU2tzeVR5dGpkUEpOMVVoMTQwSWQ4UFhra2FnQ1JL?=
 =?utf-8?B?cXZjQnBHOGZiUFROR3NlZ1RCK1NTdGlhN0ZOYWtRcE5DcXllMm1rQ0twRm1U?=
 =?utf-8?B?ckx4WWZGbFIvZ0loK0c3Q3ZSc1Z1VlBLUjRsL05DTEVsU0VGNURqaFdmcGpP?=
 =?utf-8?B?MkYxK1NvTi8wN29NTk01VDZpVUF5MzllVERNOEpiOUJGbUJVUTJVS25oblgx?=
 =?utf-8?B?cUswL0hEbktkS0VmcExVZUZManQ5WndIZUsyTE1aTzd1MkZYVVlJcHJpYzYx?=
 =?utf-8?B?empxQVB3V2VHcHExOEFteFp5Z1V4RUlrN1dFUVBvakI4ajlBN1lBUzMwdlhl?=
 =?utf-8?B?OGxLMlVqMHhHV2RsVUptNFlGSkJ6T1VDSzg4RGxpMWdXZGh6b3ozRnBUYlR1?=
 =?utf-8?B?bTRRMkdyVDdwVDRqUUowZUFuend3SnB2RzFzZG9DdyswbTcvWWhwV3ZMZFlV?=
 =?utf-8?B?dmQwWGQxSmxUZU1INVRuMGJpS3FzalZxWVdqdEZjT0ptZVJoWjRmY0hrdmNp?=
 =?utf-8?B?Snl2TVc3QjRnbS8zQ3d3aVNKNDkwUjFKc1JqaTRwOGdWVnFDK0lFN3A2bWlY?=
 =?utf-8?B?ZGN5TkpLUU9WWUptcUJsaE5JbW95aTFHVkVTYkttVG4wN2lEUzFiYjQxRFFX?=
 =?utf-8?B?cnJJMnlUQldBN1RHc1plTkJ4Yk02ZG1oYTNqSVV4VjNYeFlMOGs1M3BqSGR4?=
 =?utf-8?Q?eWspTCfQf0NYT6wm20hZoGj0dmGjoEBLXgpoD6Z?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5874.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXhjcjFpMHBGWEVhQ08vK09Vb0NJRjN1empLaXFDem5HbVYxNnh0NDNzNkR6?=
 =?utf-8?B?WXh4RTJ0emRZamhnbGdEd0FUV1l6d2VKWVRaalllYkVnQ2Q1bHhUMk9PWmIz?=
 =?utf-8?B?WnBBekowZFU4aHA2eWsyTTBrcDhsb1l2a1FYOXhIQzlTSmtQRnZIZ2pyak92?=
 =?utf-8?B?OXZGTU9BSEtyaSt2UEdRMU9vakYrbVJrT1p5YkRXc0dSYkNvT2lKQUtTN29Y?=
 =?utf-8?B?bGxKZll5WHFRRFRZN2Uxd3ZMUGk1cG5XT0pJenpZcXVXKytQZDF6YW5URDN5?=
 =?utf-8?B?UEF3amxSTlAzaTVoSkhhQ3hleDJYQTIxSWN0bUFuaUtNbUc2RzZBSWVzRExP?=
 =?utf-8?B?K0R0bE1jLzBZTmlNMFNkOU9UTTNsaVl4SHBYbzB0bEFuY3I2OE1nSFRoQ0FO?=
 =?utf-8?B?ay9WcGd2UlI5YXA4Q2tGTGVXL2NUL09HdmxBekk3ZGV5djZ5blJ5aHNDSlFB?=
 =?utf-8?B?VkcrdS9sRVBmczdBNVI1UEpJeENVSDVLc1pzM1NFQWtweUpDRVVvNmlMeEhB?=
 =?utf-8?B?NmJxUnFHK0d6M0s0Yms4MmcxM29IYTBvUzgyQTgvWTJ4a09YQ0U1OGdjdElE?=
 =?utf-8?B?bmxLVE93QUpUcWhOUWVBMHc2eEs0ajRYL2ZIVlJkclBrMmxXdWc3NFY5a0NS?=
 =?utf-8?B?ZTNGVGIvcEJrR1VMaENCTGlrZVEvczJIRkdtOXprTU9lNktJdEc0cTN5UUM2?=
 =?utf-8?B?L2JmUXoxWjNBR3F6VEpydFFON0t5bnkyZERKZXVhSHlNRDY3ZWpYYVRKb0dZ?=
 =?utf-8?B?OXRNT25pdmo2MDU0MjRiUkhhemxHTW82UGN0bGtRQ1hqbUNjVWQrcnpqVlQ5?=
 =?utf-8?B?WDJuajUwbXVsSGFWK2ZpRE5vUlpOeExuQmRkaW5mMkk5ZnVQcklpNlB4S1Jy?=
 =?utf-8?B?czVoMUdPTVUrR0YrdVVIK0hPTnkwSEFJTHVVSnN6Tmhna1FnaS9CRCsrZXd3?=
 =?utf-8?B?Z2U3ZXFIbXJ3RXFGOTJHdmtTUE1pdDhnbENLWnpMUWIrS1VYQkxqTU1LY1Jo?=
 =?utf-8?B?TzhhZC9OR1NFQkozalUvSDlkdjY0NWlLNHpIREJZdUNTRHVXMVY0aEk1cnJS?=
 =?utf-8?B?MCtqeTZaQlFBb2VTT1grNUROSGhPZnkrNnpyWUFZUGZwZ05PaUdWTjdGcUlW?=
 =?utf-8?B?UWZWeE1nVlpjd1JLUTVQeTJPOFR1NEF4Zk9jR01SclFwSVFURDYxVWtra0pY?=
 =?utf-8?B?Y0htcUxOSWMzaThuMXFOWFJKRmszSE5XMWZ3LzY5emk0ZHJrOFNicmxaRDE3?=
 =?utf-8?B?aWF0ODg1b0R3dUxiUk0yZGJFTHBCMzFCc3hnTjI0ZnZ4ejBieWpsTWxadkNi?=
 =?utf-8?B?cmwrb28rZ2tQaU5VbUJwdXgwZmJ2Y3ZZZUt5eURidTdNTkh5RTlLK1RNK2g1?=
 =?utf-8?B?KzVGb0dwbnp4SFVIT3dPcXo5Nkc1bDdVaER5SXc4aklYSUFQMjNIakpObTFa?=
 =?utf-8?B?TFg1eWpOZE1QRDNpV20rbGRhZ01rME9JSmFjNS94R3pyTWthVEMwNFZYbHpJ?=
 =?utf-8?B?RmVWdTNwdjhvbkRiemlLSzBDZEtjVXBKbk1oMWJRanM5anRHZHhWVHJzUVBY?=
 =?utf-8?B?aDBBZnhYRUdzcUY1dllGNU9kNDdpWWNLUENuZlJpaVVXemQwSjVjK2NZayts?=
 =?utf-8?B?M1N6NnArOTNHRlU4TUwwQnBKZ1VFaGg0dzdQdXZqaXJuRzJLU2ZVNHprMElR?=
 =?utf-8?B?eFNQUEV0Tit2UGs0aFBscEdUTkRycmducnJpcWZzdUdleW81aUozdXlMU0JE?=
 =?utf-8?B?MEl0QkpZUjgxUC9BSUxJK1FEVis1ZXVyTE43VUdja0hlWnBiR3pYVTJwc3dp?=
 =?utf-8?B?S21WQi83NnIzNGRvQmJjVW9rS1QxekZhOXkyNlZITkhGZmlDbm83Q0xNb04v?=
 =?utf-8?B?QmZrNXNRR0k2NnM5Lyt6N1k1blZib0Eya1pPM2ZQdHE5TDJLa0xjTVFJREVM?=
 =?utf-8?B?Z3NTblVXTHpDRHcyRjc4VWs5OTdDenpUZnZjdjZ5a0RTZnBGRWczVWFpZHdY?=
 =?utf-8?B?ZWhMQUVpd2dmOVJHYkRWalhGcVdjN2ZGM1RXZlR2QW0yK1BDd0ZQUC9qYWZ2?=
 =?utf-8?B?ZnRTRWtSenVTRlBCUnFaWS9TOUh0N2twaGU1YVI3MksxVWsxZkl2N2pqczZx?=
 =?utf-8?Q?EniyH5P+uI9x4LHtuvebRHxCA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d3284ed-ed77-4741-c797-08dc858744a2
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5874.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 17:45:19.9653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: guo+VgzQLQh+cUIVwLmXUV7wTTGptpIT2tckI+xYj9euoG2RNSuYkoPo8xYN24UE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7666



On 6/4/24 10:34 AM, Mathieu Poirier wrote:

Hi Mathieu,

Thanks for reviews.
Please find my comments below.

> Hi Tanmay,
> 
> On Mon, Jun 03, 2024 at 01:34:38PM -0700, Tanmay Shah wrote:
>> It is possible that remote processor is already running before
>> linux boot or remoteproc platform driver probe. Implement required
>> remoteproc framework ops to provide resource table address and
>> connect or disconnect with remote processor in such case.
>> 
>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>> 
>> ---
>> Changes in v4:
>>   - Move change log out of commit text
>> 
>> Changes in v3:
>> 
>>   - Drop SRAM patch from the series
>>   - Change type from "struct resource_table *" to void __iomem *
>>   - Change comment format from /** to /*
>>   - Remove unmap of resource table va address during detach, allowing
>>     attach-detach-reattach use case.
>>   - Unmap rsc_data_va after retrieving resource table data structure.
>>   - Unmap resource table va during driver remove op
>> 
>> Changes in v2:
>> 
>>   - Fix typecast warnings reported using sparse tool.
>>   - Fix following sparse warnings:
>> 
>> drivers/remoteproc/xlnx_r5_remoteproc.c:827:21: sparse: warning: incorrect type in assignment (different address spaces)
>> drivers/remoteproc/xlnx_r5_remoteproc.c:844:18: sparse: warning: incorrect type in assignment (different address spaces)
>> drivers/remoteproc/xlnx_r5_remoteproc.c:898:24: sparse: warning: incorrect type in argument 1 (different address spaces)
>>  drivers/remoteproc/xlnx_r5_remoteproc.c | 173 +++++++++++++++++++++++-
>>  1 file changed, 169 insertions(+), 4 deletions(-)
>> 
>> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
>> index 84243d1dff9f..6898d4761566 100644
>> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
>> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
>> @@ -25,6 +25,10 @@
>>  /* RX mailbox client buffer max length */
>>  #define MBOX_CLIENT_BUF_MAX	(IPI_BUF_LEN_MAX + \
>>  				 sizeof(struct zynqmp_ipi_message))
>> +
>> +#define RSC_TBL_XLNX_MAGIC	((uint32_t)'x' << 24 | (uint32_t)'a' << 16 | \
>> +				 (uint32_t)'m' << 8 | (uint32_t)'p')
>> +
>>  /*
>>   * settings for RPU cluster mode which
>>   * reflects possible values of xlnx,cluster-mode dt-property
>> @@ -73,6 +77,26 @@ struct mbox_info {
>>  	struct mbox_chan *rx_chan;
>>  };
>>  
>> +/**
>> + * struct rsc_tbl_data
>> + *
>> + * Platform specific data structure used to sync resource table address.
>> + * It's important to maintain order and size of each field on remote side.
>> + *
>> + * @version: version of data structure
>> + * @magic_num: 32-bit magic number.
>> + * @comp_magic_num: complement of above magic number
>> + * @rsc_tbl_size: resource table size
>> + * @rsc_tbl: resource table address
>> + */
>> +struct rsc_tbl_data {
>> +	const int version;
>> +	const u32 magic_num;
>> +	const u32 comp_magic_num;
> 
> I thought we agreed on making the magic number a u64 - did I get this wrong?
> 

Looks like I missed this comment from previous reviews, so didn't address it.
Thanks for pointing this.

So I think having two 32-bit numbers with proper name, implies what is expected and less chance of errors.
With 64-bit number, it's easy to create errors when assigning magic number.

However, if 64-bit number is preferred, I will change it and test it.
Please let me know.


>> +	const u32 rsc_tbl_size;
>> +	const uintptr_t rsc_tbl;
>> +} __packed;
>> +
>>  /*
>>   * Hardcoded TCM bank values. This will stay in driver to maintain backward
>>   * compatibility with device-tree that does not have TCM information.
>> @@ -95,20 +119,24 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
>>  /**
>>   * struct zynqmp_r5_core
>>   *
>> + * @rsc_tbl_va: resource table virtual address
>>   * @dev: device of RPU instance
>>   * @np: device node of RPU instance
>>   * @tcm_bank_count: number TCM banks accessible to this RPU
>>   * @tcm_banks: array of each TCM bank data
>>   * @rproc: rproc handle
>> + * @rsc_tbl_size: resource table size retrieved from remote
>>   * @pm_domain_id: RPU CPU power domain id
>>   * @ipi: pointer to mailbox information
>>   */
>>  struct zynqmp_r5_core {
>> +	void __iomem *rsc_tbl_va;
>>  	struct device *dev;
>>  	struct device_node *np;
>>  	int tcm_bank_count;
>>  	struct mem_bank_data **tcm_banks;
>>  	struct rproc *rproc;
>> +	u32 rsc_tbl_size;
>>  	u32 pm_domain_id;
>>  	struct mbox_info *ipi;
>>  };
>> @@ -621,10 +649,19 @@ static int zynqmp_r5_rproc_prepare(struct rproc *rproc)
>>  {
>>  	int ret;
>>  
>> -	ret = add_tcm_banks(rproc);
>> -	if (ret) {
>> -		dev_err(&rproc->dev, "failed to get TCM banks, err %d\n", ret);
>> -		return ret;
>> +	/*
>> +	 * For attach/detach use case, Firmware is already loaded so
>> +	 * TCM isn't really needed at all. Also, for security TCM can be
>> +	 * locked in such case and linux may not have access at all.
>> +	 * So avoid adding TCM banks. TCM power-domains requested during attach
>> +	 * callback.
>> +	 */
>> +	if (rproc->state != RPROC_DETACHED) {
> 
>         if (rproc->state == RPROC_DETACHED)
>                 return 0;

Actually this will avoid whole prepare function.
I am still adding "memory-region" property carveouts for vrings, vdevbuffer.
Instead I can move above check to add_tcm_banks function, and can avoid
modification in prepare callback.


> 
>         ret = add_tcm_banks(rproc);
>         if (ret) {
>                 dev_err(&rproc->dev, "failed to get TCM banks, err %d\n", ret);
>                 return ret;
> 	}
> 
>> +		ret = add_tcm_banks(rproc);
>> +		if (ret) {
>> +			dev_err(&rproc->dev, "failed to get TCM banks, err %d\n", ret);
>> +			return ret;
>> +		}
>>  	}
>>  
>>  	ret = add_mem_regions_carveout(rproc);
>> @@ -662,6 +699,120 @@ static int zynqmp_r5_rproc_unprepare(struct rproc *rproc)
>>  	return 0;
>>  }
>>  
>> +static struct resource_table *zynqmp_r5_get_loaded_rsc_table(struct rproc *rproc,
>> +							     size_t *size)
>> +{
>> +	struct zynqmp_r5_core *r5_core;
>> +
>> +	r5_core = rproc->priv;
>> +
>> +	*size = r5_core->rsc_tbl_size;
>> +
>> +	return (struct resource_table *)r5_core->rsc_tbl_va;
>> +}
>> +
>> +static int zynqmp_r5_get_rsc_table_va(struct zynqmp_r5_core *r5_core)
>> +{
>> +	struct resource_table *rsc_tbl_addr;
>> +	struct device *dev = r5_core->dev;
>> +	struct rsc_tbl_data *rsc_data_va;
>> +	struct resource res_mem;
>> +	struct device_node *np;
>> +	int ret;
>> +
>> +	/*
>> +	 * It is expected from remote processor firmware to provide resource
>> +	 * table address via struct rsc_tbl_data data structure.
>> +	 * Start address of first entry under "memory-region" property list
>> +	 * contains that data structure which holds resource table address, size
>> +	 * and some magic number to validate correct resource table entry.
>> +	 */
>> +	np = of_parse_phandle(r5_core->np, "memory-region", 0);
>> +	if (!np) {
>> +		dev_err(dev, "failed to get memory region dev node\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	ret = of_address_to_resource(np, 0, &res_mem);
>> +	if (ret) {
>> +		dev_err(dev, "failed to get memory-region resource addr\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	rsc_data_va = (struct rsc_tbl_data *)ioremap_wc(res_mem.start,
>> +							sizeof(struct rsc_tbl_data));
>> +	if (!rsc_data_va) {
>> +		dev_err(dev, "failed to map resource table data address\n");
>> +		return -EIO;
>> +	}
>> +
>> +	/*
>> +	 * If RSC_TBL_XLNX_MAGIC number and its complement isn't found then
>> +	 * do not consider resource table address valid and don't attach
>> +	 */
>> +	if (rsc_data_va->magic_num != RSC_TBL_XLNX_MAGIC ||
>> +	    rsc_data_va->comp_magic_num != ~RSC_TBL_XLNX_MAGIC) {
>> +		dev_dbg(dev, "invalid magic number, won't attach\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	r5_core->rsc_tbl_va = ioremap_wc(rsc_data_va->rsc_tbl,
>> +					 rsc_data_va->rsc_tbl_size);
>> +	if (!r5_core->rsc_tbl_va) {
>> +		dev_err(dev, "failed to get resource table va\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	rsc_tbl_addr = (struct resource_table *)r5_core->rsc_tbl_va;
>> +
>> +	/*
>> +	 * As of now resource table version 1 is expected. Don't fail to attach
>> +	 * but warn users about it.
>> +	 */
>> +	if (rsc_tbl_addr->ver != 1)
>> +		dev_warn(dev, "unexpected resource table version %d\n",
>> +			 rsc_tbl_addr->ver);
>> +
>> +	iounmap((void __iomem *)rsc_data_va);
>> +	r5_core->rsc_tbl_size = rsc_data_va->rsc_tbl_size;
>> +
>> +	return 0;
>> +}
>> +
>> +static int zynqmp_r5_attach(struct rproc *rproc)
>> +{
>> +	struct zynqmp_r5_core *r5_core = rproc->priv;
>> +	int i, pm_domain_id, ret;
>> +
>> +	/*
>> +	 * Firmware is loaded in TCM. Request TCM power domains to notify
>> +	 * platform management controller that TCM is in use. This will be
>> +	 * released during unprepare callback.
>> +	 */
>> +	for (i = 0; i < r5_core->tcm_bank_count; i++) {
>> +		pm_domain_id = r5_core->tcm_banks[i]->pm_domain_id;
>> +		ret = zynqmp_pm_request_node(pm_domain_id,
>> +					     ZYNQMP_PM_CAPABILITY_ACCESS, 0,
>> +					     ZYNQMP_PM_REQUEST_ACK_BLOCKING);
>> +		if (ret < 0)
>> +			pr_warn("TCM %d can't be requested\n", i);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int zynqmp_r5_detach(struct rproc *rproc)
>> +{
>> +	/*
>> +	 * Generate last notification to remote after clearing virtio flag.
>> +	 * Remote can avoid polling on virtio reset flag if kick is generated
>> +	 * during detach by host and check virtio reset flag on kick interrupt.
>> +	 */
>> +	zynqmp_r5_rproc_kick(rproc, 0);
>> +
>> +	return 0;
>> +}
>> +
>>  static const struct rproc_ops zynqmp_r5_rproc_ops = {
>>  	.prepare	= zynqmp_r5_rproc_prepare,
>>  	.unprepare	= zynqmp_r5_rproc_unprepare,
>> @@ -673,6 +824,9 @@ static const struct rproc_ops zynqmp_r5_rproc_ops = {
>>  	.sanity_check	= rproc_elf_sanity_check,
>>  	.get_boot_addr	= rproc_elf_get_boot_addr,
>>  	.kick		= zynqmp_r5_rproc_kick,
>> +	.get_loaded_rsc_table = zynqmp_r5_get_loaded_rsc_table,
>> +	.attach		= zynqmp_r5_attach,
>> +	.detach		= zynqmp_r5_detach,
>>  };
>>  
>>  /**
>> @@ -723,6 +877,16 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
>>  		goto free_rproc;
>>  	}
>>  
>> +	/*
>> +	 * Move rproc state to DETACHED to give one time opportunity to attach
> 
> 
> "one time opportunity" ?
> 

Ack, not one-time anymore. Will be fixed.

> Other than the above this patch is sound.  That said I reviewed your work from
> the airport, which is not optimal.

Okay. I willl wait for your comments on above, then will move forward with v5.

Thanks.

  We'll what turns up with the next revision.
> 
> Thanks, Mathieu
> 
>> +	 * if firmware is already available in the memory. This can happen if
>> +	 * firmware is loaded via debugger or by any other agent in the system.
>> +	 * If firmware isn't available in the memory and resource table isn't found,
>> +	 * then rproc state stay OFFLINE.
>> +	 */
>> +	if (!zynqmp_r5_get_rsc_table_va(r5_core))
>> +		r5_rproc->state = RPROC_DETACHED;
>> +
>>  	r5_core->rproc = r5_rproc;
>>  	return r5_core;
>>  
>> @@ -1134,6 +1298,7 @@ static void zynqmp_r5_cluster_exit(void *data)
>>  	for (i = 0; i < cluster->core_count; i++) {
>>  		r5_core = cluster->r5_cores[i];
>>  		zynqmp_r5_free_mbox(r5_core->ipi);
>> +		iounmap(r5_core->rsc_tbl_va);
>>  		of_reserved_mem_device_release(r5_core->dev);
>>  		put_device(r5_core->dev);
>>  		rproc_del(r5_core->rproc);
>> 
>> base-commit: d7faf9a16886a748c9dd4063ea897f1e68b412f2
>> -- 
>> 2.37.6
>> 

