Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.8
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795105761;
	b=3PCpGboHPTucnZBLSImi+sdsgBgbBETH8MtbnRlwGqzgWiBJMIdgfn4VjAXWTendSy44
	 9MizmtpDVRxHqQ8aUrgkFvl7KS5/3M32Oh7AkkVr+J3iZ+PMJSlz94KpwPYZgGz7Y4wpD
	 c5+IvhV9T6QaC3IbK37UpYMw0tt8awRTvjGy4k7PY1+eINjCmDt3ejmNeOQkUEN6KS+by
	 rUEUsCAQufjKFiwlHCOui+RHBtZqVBJEXf11sWYG4m3Rvj2Bg0fyPa0Uz5SdPg6czIkKP
	 ZRbqSSwoZgQow7W5byWHKJd326Px1HTv0nzL0pRUZyL5Ln5xuNH0K9jteW74Cg627mw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795105761;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=EBPrPnrqVRG7lnJapZ7mNpSnw/nx4oijY3uua+atJZI=;
	b=lXDmbVBaOC349WYN2T59f67JSQtW/isc093vt0h3h3vbCwicSqdpWvYuodCGYfjb1vfi
	 yVb296zL+9Bsk1wj7mahOrMxp3apqOQ87HunTQABuyTMjU744WYFChxf2CZD//IXaDZ5h
	 pFXYX/O/d2h9g2BjMzQAMT8xEJDfJca1L8WF7u0c4gQ+efkw+tI8cYAQVzETS0cyCIRdI
	 db1FGu19pF3/YB6kl0j2CETo8G28FCJHxDw2WsZhp8aoYPGxXLrWApRxiMv9t+Ul5oDek
	 +ehLFZml27oBAaY1G1mT+JQ0fyGrNkMQ5BRjrjm7YUUWWp+kuU8ZY4lsB9YF0wxNZfw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ogsm17QL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.8
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010008.outbound.protection.outlook.com [52.101.46.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05533606A324;
	Thu, 19 Nov 2026 16:29:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05533606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ogsm17QL
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rv3ov8ixgzN+jBSbeW2bOqNJYtEy/OuOA5oAG9r8oVxUzRZqNbcr8/bh09ypZSw5jAgA1RBgAGH4Ec1UMeLWqd/7s6OXUNOU3HZJVTBTM4x/x9GeDOFjNFWUuZf4ay/D7aAWlEx3uJA5WmeAFdgDA6KZyOqgifAUgpgH/e0I3hYu9EpWHruOV3F1g1LkD+4uj04BdD/m+TqSxmSIBy+cmm1gA7rttwzRMf8xjjR+tZTa/cUgjQcYRKiS0x8tKKpcN9EXS2ejxSHm/EIiMRZGQnju4FFlJ5lhIODLEzW7s+WfzfYlQ2xF1hr1ZMMqKHCZBi1Glzu9Sd9WCuDcTWO01w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EBPrPnrqVRG7lnJapZ7mNpSnw/nx4oijY3uua+atJZI=;
 b=OU/q3GPbFFGCPvPQBrin4Rp01AkA/8I4IFIr9Vwx7J0blsyn5L1QSho/6YtGdfKvdaMPYr/Ejf9+VjML3hs/fjj/hiUpopSYCyXmUyfFDXb8TQ6jvvNQUVAD5JOXQ1jPqeSWm0JiJ4B4hh3etwu6pAfSwKVRNEMzMgKn9I/xb9aOss4A13wxGcv3RxgTRJrtep6KezNLXMD0e7D2LxGx412TSHPuUfAZdoS8yeQKBQZXNzvslji/2+KsIH5pcUbj9cuJR6sT3W7JiyXbMcfgjmf+aXX5tIJgyggrGt2eA1HQLsICKkclcSlakaxXvyNnWy/fy1MR1znFdx965if3Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EBPrPnrqVRG7lnJapZ7mNpSnw/nx4oijY3uua+atJZI=;
 b=ogsm17QL/Wf1M6a4aptMy4Vc+GhJdIOMFIBCL0zGlXTX97rYLRj8V/MKSeplzJEhQQ5JCCokRvtz42CcpGOwySwLt0YU8r/2IyJFK4c56OfRj0EUsDFT04Z+Ku8Eq/gxeftGnjVDI7RG9mzoM5QM7F4m9mc1ADkpdDQuq3ETTwk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from AT6PR12MB174769.namprd12.prod.outlook.com
 (2603:10b6:170:116::6) by DSVPR12MB999286.namprd12.prod.outlook.com
 (2603:10b6:8:41a::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 16:29:17 +0000
Received: from AT6PR12MB174769.namprd12.prod.outlook.com
 ([fe80::3903:e1e2:f33f:ed44]) by AT6PR12MB174769.namprd12.prod.outlook.com
 ([fe80::3903:e1e2:f33f:ed44%5]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 16:29:17 +0000
Message-ID: <ed41c398-3476-4160-8c8e-d7b85e3b32c3@amd.com>
Date: Thu, 19 Nov 2026 08:29:15 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] remoteproc: amd_mbv_bram: Bound device name
 formatting
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
 Ben Levinsky <ben.levinsky@amd.com>
Cc: jassisinghbrar@gmail.com, andersson@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, michal.simek@amd.com,
 tanmay.shah@amd.com, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261105051902.1646651-1-ben.levinsky@amd.com>
 <20261105051902.1646651-2-ben.levinsky@amd.com> <av8gg6d7eKwpfcTQ@p14s>
Content-Language: en-US
From: Ben Levinsky <blevinsk@amd.com>
In-Reply-To: <av8gg6d7eKwpfcTQ@p14s>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH7PR03CA0018.namprd03.prod.outlook.com
 (2603:10b6:510:339::15) To AT6PR12MB174769.namprd12.prod.outlook.com
 (2603:10b6:170:116::6)
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
X-MS-TrafficTypeDiagnostic: AT6PR12MB174769:EE_|DSVPR12MB999286:EE_
X-MS-Office365-Filtering-Correlation-Id: f4cdad20-0b3d-41d8-cfd9-08df465a41f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|366016|6133799003|22082099003|18002099003|261009223027099003|3023799007|5023799004|56012099006|4143699003|11063799006|261026121527099003|261102123227099003|10067099003|261028144727099003|261021121427099003|261022105027099003|261026140227099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	MsZi7IyNaYQlGDq4B7vYxHoBMkJ3AG3y/npazypeHdK+/MuXL69aMOmtayO1D4+JQ/OY/TdM+hYnJdv1r6S21aOqKsK0QKzgHTrfcceHjweZLhpzia+8u7Qqg/Zormkd4gNlDDLIg7ls6j/ZRYe/NDUW/oZG4wU+SCy1kWdNA42OI5DzeAjI2MQcGBq1qvtYw+ko4ZJ7IbaDYMxbTjDtcFSQBJdw0QVkfGsiC/H/ZbGY/uAhyw4DoOD1EP3Cv7DmP89rJhdLxBYX5st06u/beAMS1sFVj2/suuo8uLpuSCBxAqhaBgbTzpWo0mpknNgn06hGPvT2U+vOqhbMzToX24b3bBPT1XSuo+k4yC1R1S4R9ce8MDtuWzeKeoz7RhJuEmc2LML00DqM2LRc73+ysiLrypqsXTDUp4u5nwsmoQtI85XsDXT5t/7WeDtXwTm9aqWz4ufkEUZUmuWjpFgyhMNMytMXHYIr3qIy4LBxe8h+x/NbZsLsJ3/FGQZi1ayIsrFIvwlTLf/VrcV/tbi9tXeKGEKvNYzJu6JgSCB0CvFYh1/VV4VYj2Dv6Kfg4DBHbAw7rOaBra7RvKN58hsE1mC00XOq4qnd9tb7by8gifZcxF/gde0XVMJQfrOUwFlR6BzTZEU00vCc0fEqXYi/iqwoLcq3TPu2wMZzj9CpSgY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AT6PR12MB174769.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(366016)(6133799003)(22082099003)(18002099003)(261009223027099003)(3023799007)(5023799004)(56012099006)(4143699003)(11063799006)(261026121527099003)(261102123227099003)(10067099003)(261028144727099003)(261021121427099003)(261022105027099003)(261026140227099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YlhNRHJtemNqVGlnYWZtNU1tTDdLdWtjYURINUtSNEJLWXlvRzd2VkxYTFAw?=
 =?utf-8?B?OFlYV09xekJTRkwxYkNZbDh0aHVlU2loU2tKOWtPZkdnYXROYVVqWlY4VkpV?=
 =?utf-8?B?cHVKejdWbFhlZ1o5UTljMlBXNTZzUDZTbmNuZDJKSVdHY0xYRm9hMTBGZTQ5?=
 =?utf-8?B?RjZNaGFFVURhM3Q0UUQyR3pKU1NtaFZ4SkdhVXhWdUhKL2drMlZKQ1JqL1hJ?=
 =?utf-8?B?NEhjREFFQkFMY2JVMERQZEVJb0l3NnlqWjhSd1pKSE1Cd3IwMXZwbWZSVytP?=
 =?utf-8?B?eENST1ZhWExQK3d0OHRMalR0TnBXZ09YTWN2c1pKWDQ5ZkRickdwR3RqcFNW?=
 =?utf-8?B?TkZ1Q3NkQVg0Q2ZvMEhZMnFJS3RxeDFrSUxheTdPQkFsZGxaRnZQYWtNK2pz?=
 =?utf-8?B?cDVTTEwwT1R2RFlrSFh2TTZrZk5aYi9IVjg5SElONGFzVEhNUG9VRFA1TVRo?=
 =?utf-8?B?MzRoOW1Yd3FwdWFWY2RhcGkzancxZEhLY2FBRFp3MG9TSCtLL0RCZEZKcFF0?=
 =?utf-8?B?RytzNms0eU9STUxaam05dTF4SGdsNmEzTWk5NE9VUnVSUWhlQjY4OUpuRHBk?=
 =?utf-8?B?MGJFQ1ZwQ2RnVjROT0NCaHRTVXR3THNTakVWN0hldU1RWUcxRy9VMHlUZDM5?=
 =?utf-8?B?bUNCZ1VYQkpuQ3hyRmJtczkxMmsvZ2dpVTY1aWRaeVVPa0JWZU1zd2hPQVcw?=
 =?utf-8?B?Zm9KR1NuWkNlaGJVNEFaa1BOZUs5N0hUWGQ1YlV1SWFYMVF6Mk5pTHN6Y3lv?=
 =?utf-8?B?dHBtdnN4YUo0R1Bwci9yOGt0ZzlPb3l1MnFyOE5FY0ZtSmJyamNnWUxCVUsr?=
 =?utf-8?B?SFRkcEpESXpiNmtUbk5xZnJVYWZveXZZVGtMc3NaekJ3Y1AvTjRUc3RHcFJu?=
 =?utf-8?B?RVlYVmdmaXpidVFHZnFkYmJoQWNueEVFT05uNHRjN2g2VkdsOGhRUmdQa3JH?=
 =?utf-8?B?bWgrMVNNdkRLYTlmTG1Jbjd4TWg4ZHEvOEpCdkJUNUYrclBBZlhFdzRHTlNU?=
 =?utf-8?B?dXVZYUhyTGFieXFhRno3NGdSbzE3eC9xcnNWYzYydTNrRnBhSVlucjd0b0Rj?=
 =?utf-8?B?ZGdOdlhsb0U0cVY1bzdZOU0rWkcwSTdKS1JETVl0ckFYOGNISzFwTGY1S002?=
 =?utf-8?B?TGlFQmFTeVJqOHBEbjRLNXlGeUhnVDV4K1lTeFZ1ZkpkbWNVVnN0SDZIL05h?=
 =?utf-8?B?UU5xUzRlbzM3L1BleWJCRVM2SElNMG9EYjlXdnFZajhYVllXTTJ5bi9mdmxa?=
 =?utf-8?B?dlpRL1B3ZkkrMWJUbGNmVW1hZFdnT1lTSzN1YUJqckhiRS9NLzRPcG5MY1pq?=
 =?utf-8?B?QTQxR0YrU2xTZEZPbzl2YmlkYXNLWlVZYzY4N2ZvaGlQazFtaXVFQzEzMkMx?=
 =?utf-8?B?dlpFL0JXcUVJVGxTbFlQaldHczZtbzk5a3lacnc5dElxNWdnQlgyWHViRFN5?=
 =?utf-8?B?RGg0ZTF4UGo0ajk4SXBDR2pWM1NaYm5jSHkxYWh0emNMYVZEU3pZZGpKelZZ?=
 =?utf-8?B?VldWREw4MzBvRXZicmxEZ05aeHVKbFVLeTV3dW9YMzZZZ0tRNURMSEVWMEdZ?=
 =?utf-8?B?c0dST20zbmpYZ3FiVk95VEZkTkRaNTEzOElHeDBlcWt4MHRQbjZKSllIellH?=
 =?utf-8?B?UWZmSFZrREczcEF6N3k1WkRvVkJiQ3Z4TG1zNGhGUHhsN2taZUV3eFJjKzlT?=
 =?utf-8?B?VDlPSGlsNC9DTkpDK28yeGQrQXpFVUlSR3RsK3RXSStrTCtySG5qNVhUYXVj?=
 =?utf-8?B?bXNHbURVRDZwa0Z0bFRKdVJmTEVmNXR2MjdROStUeHU2bkZvOGZtNDM3R2Zs?=
 =?utf-8?B?QWNBbHNCR0w2UUFnU2MwdUtGL0Y3MVp6ZHJGSFB4WGtDYk9FOURQVWREQitG?=
 =?utf-8?B?MVRCdFFHR0d6RWxWRVBSMFRCSmdTbFZjOW0ya2lXUkNMRHlmVlI4TE9YaE12?=
 =?utf-8?B?dEloOUp5L0ZidEFhR3FxUGJCL0hQeWZIYkVMU0UwN3hzb2FVWTBBeHhnWExn?=
 =?utf-8?B?ZzlDYThaR1Z3L2ZoRUlKd3k4KzZnWkZpK2QzUTVwMnFGZkdwbmVzb09TeVpF?=
 =?utf-8?B?Z3c5T0R0K0svRzJzRXoyMzlteHZCUU9MTENOM1ZJVENRczZzZ3JVelN6b2Fy?=
 =?utf-8?B?TUU2NERETXRWdFhYYlJVbWpJUGVCRWswaXJ6ZDk0NUlHaTc0SkFkMC9mS2Jq?=
 =?utf-8?B?eE9QVzkzVnUzRzZuanBxbmV0VE4xaUk2TVowZVZBblhyTTIzeEZHQlhwaUJk?=
 =?utf-8?B?bGRkWUpaUHA5dXpQQUR0UWNBVDFKUnB6RXFRVzA5Z0NncmZ2MGcvNEhJSVNH?=
 =?utf-8?B?eGVDeGJMU3B3dnRvNGRBeTUxMXZhRHNKbmtEdERJSzNwZFJQNnUrZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4cdad20-0b3d-41d8-cfd9-08df465a41f1
X-MS-Exchange-CrossTenant-AuthSource: AT6PR12MB174769.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 16:29:17.8414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /TeKCybVnsJz4jJp8CwAUYY1kISD2tgr1pibWZRsZBaQhWFWdaq+syAy2g/mCOgK97Ew1LypPaWlt1tF1IRF3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR12MB999286



On 11/19/26 8:14 AM, Mathieu Poirier wrote:
> On Wed, Nov 04, 2026 at 09:18:57PM -0800, Ben Levinsky wrote:
>> rproc_mem_entry_init() interprets its name argument as a printf format
>> string. Passing the device name directly allows percent conversions in a
>> DT-derived platform device name to consume nonexistent variadic arguments.
>>
> 
> I read the last sentence of the above paragraph 6 times and I still don't
> understand the problem you are describing.  I'm guessing it was generated
> by an AI.  Please refactor.

  Hi Mathieu,

  You're right, and sorry for the noise. The changelog was written with
  AI assistance and I should have disclosed that on this patch as I did
  on the rest of the series.

  The concern was only that dev_name() ends up as the format argument of
  rproc_mem_entry_init(). In practice, the name of an OF platform device
  is built from the unit address and node name, and dtc does not accept
  '%' in node names, so I can't point to a real case where this goes
  wrong.
> 
>  
>> Pass the device name through a constant format so it is always handled as
>> data. Limit the formatted name to 31 characters to match the space
>> available in rproc_mem_entry::name while leaving room for its terminating
>> null byte.
> 
> What to you mean by "handled as data"?  Moreover, the size of
> rproc_mem_entry::name is handled properly in rproc_mem_entry_init().  What am I
> missing?  I also suspect this was AI generated.

  You're not missing anything. rproc_mem_entry_init() already limits the
  name to sizeof(mem->name) through vsnprintf(), so the "%.31s" adds
  nothing.

  Since the patch doesn't fix a real problem, I'll drop it from v2 along
  with the Fixes: tag. I'll also rework the changelogs of the remaining
  patches so they describe the observed problem and the change in plain
  terms.

  Thanks,
  Ben

> 
>>
>> Fixes: f87b4998994e ("remoteproc: Add AMD MicroBlaze/V BRAM-based remote processor driver")
>> Reviewed-by: Tanmay Shah <tanmay.shah@amd.com>
>> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
>> ---
>>  drivers/remoteproc/amd_mbv_bram_rproc.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/remoteproc/amd_mbv_bram_rproc.c b/drivers/remoteproc/amd_mbv_bram_rproc.c
>> index e4a103cf8455..6cf33c7b7e64 100644
>> --- a/drivers/remoteproc/amd_mbv_bram_rproc.c
>> +++ b/drivers/remoteproc/amd_mbv_bram_rproc.c
>> @@ -72,7 +72,7 @@ static int amd_bram_rproc_prepare(struct rproc *rproc)
>>  				   resource_size(&res), da,
>>  				   rproc_mem_entry_ioremap_wc,
>>  				   rproc_mem_entry_iounmap,
>> -				   dev_name(priv->dev));
>> +				   "%.31s", dev_name(priv->dev));
>>  	if (!mem)
>>  		return -ENOMEM;
>>  
>> -- 
>> 2.34.1
>>

