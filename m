Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2043.outbound.protection.outlook.com [40.107.237.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBF75FB9A;
	Wed,  5 Jun 2024 17:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717609652; cv=fail; b=PsCTmusqfhT2PiP3F8Vjwtf/1TWzH7sfqkx0DBm5Ld0JwqqVMuojGLI1xkf88yIDyworLttDqPMdWtZ4O+W2KYJHd8sNcZ/fykzOJX4EilxzOBG5YjqvqquXIXvHFhaKcvMj5SZWJkmqMeV75MOAGSkr5qR/+XrZFCMsUCNoNy8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717609652; c=relaxed/simple;
	bh=kodXXsSQ8QaZLIueqZyj7yCQJJTo1vEsSrF6geOipmQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rXEy8hbxamA4e2Q6DSEfIItd1MV3ERshd6OEdVlPzM9WfupCtJO83guKMx9L4Hu+rgBSBzXUCl0Wux4p1xwvMcpfeJeIvJ08xabBjRZlCngC3zBGvQMcWldrvxB7Z2SSNy3W2WcIUbDSKniCh1R/er1zMEp47yHIsY2fel3k0wU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=aVpPz4eN; arc=fail smtp.client-ip=40.107.237.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="aVpPz4eN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LtzuUwzDCU7Q0wICIZ5wB8de01bk8K/Woy/PyCq/YStXieWpdUBn8mf2aGN+Rqq24iq3kKvUchEkLe8z7CcVa16uktoOySuDMpB8i3si/MV2egBExBQcN2M2PBoNJWQqVS++iLHmIcSN1vsVqffsxdAQHNbAtVUz7w1GI3jTD6xLSbfH3mXqKmd2tc0tb9VmsuBxNsJDmrq28Hw7NVTJsVnb9l8//fD5uXGq4AT2Bvpz0h3rhnK36NUosPf64TQJzpuCLyOyOTt1JYEUa2amN57+efFWeoDHOaHJreyPerdfzXLSxDufUGBMotaSmxShFLdKkpvzOfYWCXm+s2e2aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JpFITwI3KpKJrz4d8padOtl0lyIb0wQibuuFIWGdKAE=;
 b=MWt6aulkhESVlWqYMpZcvR9jV2P7tjEqhWxtORA8wa0MjreAeLZZSrKqc05nMKXUpZnTzKnpq+e4XoUmlbmKcNwGdaXFS8h91XVtfloaljfBZYI+5Na2xV0KXLjQxhmUiNZ4Sxe8fF+ZWJNeE8GbfKZo4Gtuh7xTOzXcNqc2yd7eNBjs3vIybfrROOe1ugcDgwLfTlRND9eZzuM5nO4zZ7Ld3iyLWRj8mq6lVqjWD38KaI13W+P5ZyVZCUpq7B2IprO5IXUeSWFdsYfvrfOd6WnJx4gX5/RY89RP2ShcxmzMya99jed8mpEwWRWTfzQ1P3uYA/VKPIXCTF/ZgDVIYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JpFITwI3KpKJrz4d8padOtl0lyIb0wQibuuFIWGdKAE=;
 b=aVpPz4eNFu+TnFicOrRyzBrkUiKxa3r44iJ3LyYBJsNPYVwzSw8F8AEUwKjP4+CPb9kNK0RJlO20DI2dqEFPVWJagcFeRTWWtx2ttHsqnhDNgCiYtWsy1dCCBRydWHGp/MjEItHAOYD2cSEOx9s0Rx7/z/K33GMbV3U0clKVrkk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5874.namprd12.prod.outlook.com (2603:10b6:208:396::17)
 by DM4PR12MB6184.namprd12.prod.outlook.com (2603:10b6:8:a6::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.21; Wed, 5 Jun 2024 17:47:27 +0000
Received: from BL1PR12MB5874.namprd12.prod.outlook.com
 ([fe80::5a16:a4db:8bed:1f5d]) by BL1PR12MB5874.namprd12.prod.outlook.com
 ([fe80::5a16:a4db:8bed:1f5d%5]) with mapi id 15.20.7633.021; Wed, 5 Jun 2024
 17:47:27 +0000
Message-ID: <4b401ee7-73b8-4974-848c-5a181c0bdb81@amd.com>
Date: Wed, 5 Jun 2024 12:47:24 -0500
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v4] drivers: remoteproc: xlnx: add attach detach support
To: Bjorn Andersson <andersson@kernel.org>
Cc: mathieu.poirier@linaro.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240603203437.973009-1-tanmay.shah@amd.com>
 <chqsvuwi7gukbw3l2y6xoxmd3lh6vlqhs2wjd4lylbhsg5m2hc@vnmesij3xoiu>
Content-Language: en-US
From: Tanmay Shah <tanmay.shah@amd.com>
In-Reply-To: <chqsvuwi7gukbw3l2y6xoxmd3lh6vlqhs2wjd4lylbhsg5m2hc@vnmesij3xoiu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN1PR12CA0068.namprd12.prod.outlook.com
 (2603:10b6:802:20::39) To BL1PR12MB5874.namprd12.prod.outlook.com
 (2603:10b6:208:396::17)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5874:EE_|DM4PR12MB6184:EE_
X-MS-Office365-Filtering-Correlation-Id: 5635b1ef-0aea-4846-ff7f-08dc8587906c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eHo1MmU5aEhJd2VBQy8ydm0vTjAxUUR4QkRPUXJNV2FrQ21wcHR5K3IvY3RF?=
 =?utf-8?B?bDJMUnZsNkIrOGdtRVAwQjhzWGpkYkNxRFZ1WFJ6RGxweXhhVGd3NElCUEJO?=
 =?utf-8?B?RVJ5MU9ocUhxRWhZbHZac1BuZ2lqTEw4OTBZMHQvb0NoNmVHZEhKSmRlK2la?=
 =?utf-8?B?SUpFRzJqYTFxSVpWckhXNnRvRDFIM3NZWGwwME5sdUNJaWlQVXVjRWhwQWhV?=
 =?utf-8?B?dWhqRlFiN1U0aFh0cVRGNzRUam11anI3WGQ1Z1VnYTRwVnpTd2JsMTBKL3ZS?=
 =?utf-8?B?RmdRNTByU3lDVG5ReHY0ZS9jOGlKdHY1bnZ1M2RpOXhNVkxrM01scmlNV1Ew?=
 =?utf-8?B?OWxaeTlvcmlOWkJ4c05TSHo0cnF3WWNudjArZVVMZVY2Q1EzdzVMQ0JKa1ls?=
 =?utf-8?B?QlRFeEhUeUE0SG0yM3g1eElVc3pZVUJSdnJaTjBBdzl4R2NLa2Z3QnNFTnlt?=
 =?utf-8?B?S2tOSHRLS0l2cm85R3NrQkgxSHN2Yk9YUngrTUdmS1dXNDlyQmV4VEhCbEhP?=
 =?utf-8?B?a2JBUDZxTUhoK2NYdkVPRzBDbDhDQ3Y3ejBJUlY5cnUrL21wZFhKVG11UG9B?=
 =?utf-8?B?VFQyQXkyVDFZNzFvRmlvM0paWm9MVlVDWlZNNnFzT2Y5TGdTbHR3ZG5PbjB2?=
 =?utf-8?B?Yy9TTW00cmE0MndkaUVpZVNGTG1DanRKWTN2bVFVNmxEMTN4Z3hmMmVydDJX?=
 =?utf-8?B?emdmRnF0dHArOTlTbWJpcDRmK25rZVRiV0dUalJmMlpyd2hNL1VoY3RnMEJN?=
 =?utf-8?B?YVp3czV4MmRPVlZhcjhPUWtEd2x1NlA3QlhPblc4TDZTT01XdDdlcloxcVhL?=
 =?utf-8?B?d2huaVEzYzJ0NnRTWkJTNURVWkdiRnFaVnVLY0NNOGtQenE0YmFsaWJtWDZu?=
 =?utf-8?B?c2YyOUt1V0dRd0pKZEhxelBPbEg2YzdtbkJ0bzZIZUJGOHdCQ3NwemlyOUY2?=
 =?utf-8?B?eDdqNUFqU0FUcDdqdGZqb3lqY3U4aDcvQWNRNHJWY292UmgzZ0Z0QTRkamZG?=
 =?utf-8?B?QmptVk1GOVVRY1VoRnc4YUdzNHZ6SkxDZG9pUFBWaXAxNStaSGRpeDZCaHQz?=
 =?utf-8?B?L2w1WXFGaFplS0xvemFtTW1pOUg3QmxrVTJmUzN4V1NsZ3dpb2dNT29WcUM5?=
 =?utf-8?B?aUFYTGw2bVVsR2IyV3MzZ2o2VGxxc0E0blZLWDBDSGdoMFNjc2ZhWmI0Sk5o?=
 =?utf-8?B?akhnMjFGOTlZV3pLNVFmcFlBNTN6S3gvN285NEtOdHpMalFiR0Q2U0tMTWt1?=
 =?utf-8?B?QytwajZVZTF3OCtTU093aStDdmVlV1JLOWMvd2d1SFJZU2VORDJ6U2JVcW1J?=
 =?utf-8?B?eGdXeWN1aWxhQ3ppd1l5Wk5KYmdIeTRxcThzRXZTUzRHMzJOOTk4d1hoVjNa?=
 =?utf-8?B?ei9GQ2pxSC9vVTRjTG5ZMzFJZVRlVjBZeVNuVmRDLzR2NmkwTHcyZ2ZUbFo1?=
 =?utf-8?B?c2dQZHh5ZmIxWUl1T1B3cHJZYzBNNVF6WVB0ZUhGMFFEcUhiVnIyVHNMRklm?=
 =?utf-8?B?a3o0c3g0TEl3ZjEzUDFEamhKTlRnRFd2WXIwSmZCYkt5dzB6RVpKbFpkL2dh?=
 =?utf-8?B?bVhTU3hvcjYyZTZLMWtHUVFHcFJyamZLeERvSjNYS3BsZUtpWlJ0eUdwU1J5?=
 =?utf-8?B?ZTJLRTRINDNYeXV1SnJLL2xML1FFR3psS3QvSHJJdnBzbW9oU3NMckNDbDBY?=
 =?utf-8?B?UEFmNzMybWhYSVgxQ2w1WmMzcDRrY3NGRFhpS0N2YnQ3LzUxeHJ2OU5pb2pY?=
 =?utf-8?Q?3uasmp3bGHsLUe+wZdHMSypyBS/b7yAFROd2rS+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5874.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?LzBxSHcwLy81TDA2UUZmUVdDbjYvOTZMREJIMlhQVXBBUWd1L1J0NE1qeG5h?=
 =?utf-8?B?b0dVOUUyNDhybVdDenV4VlprYm5nQnpSdmtKbFpiVWhZUSswQW1FREdUNkxD?=
 =?utf-8?B?SU15SG1hZEw1OTM5RlNwd2NUM2FiV0FRL09VWlYyMTU1V1V2SXhISVNiaFJZ?=
 =?utf-8?B?U2k1MDM1djZCbjBsMU1vMEZ1c1pDc000SzRUeUpJTzJkVGNHSzlzZzBYREZY?=
 =?utf-8?B?eURURjA2Y253QUMrdDNFN29Kd2lzb2JBSWcxZEpGTzYwblNFaVlPeGprNnhZ?=
 =?utf-8?B?d3p6WTZuVXJITnhrN3VXTGRQQ0NuSU5PcWNzV24yZVgybU50UUJtc0t6VHVS?=
 =?utf-8?B?NmppL2VVWFZwTzFvMkY1OVY0ZFJCT2FzSzdrMnNGOTJhRHBVd09pV3doeG1Q?=
 =?utf-8?B?NmRLdFhmOGtYVmMzNHRJN3d3ZFhPTFhkWHBLc1U3Ukg5TFRkQWxoNms4OEsr?=
 =?utf-8?B?MG05cjdzeFR0b3NiSU5XWFNnVnp3ZEt4bW0vYTkyd2lycm1tRi9BZmdkSWRQ?=
 =?utf-8?B?d1FJOVZSdHhZRVI4NTc0eUtTMnNrc0FEQzJhL2tnQTFORkd4SWNKVW1Fa0dQ?=
 =?utf-8?B?OWVTUzdXa1I3Y0pocUlTdEx0dEc3aGd4VFlWdVIrdlk5d0dQR1M1eTg2bVND?=
 =?utf-8?B?eFRxQXhyY0h1S2FTdFVyQkE1MFVRS0htWW1rSzlxTU54VGZ1L0dXck5vRTQ5?=
 =?utf-8?B?Y09XZ0FnYk9pdVdKTy9NRW5SZDBhNE5FZ1l1dlZHc1hadit2QmFhUVpYOElF?=
 =?utf-8?B?NDUxMU12YlFCd3N3KzVFT29FYXN6Q0RZcTIrdStNUGJjZTF0TVdSL2VEZWp1?=
 =?utf-8?B?M3Flb1Z1UVRUZEp0Wk51c3pVYzdTa2gwemFZeFFSZWtvQUZPU1o0SVRnNnlI?=
 =?utf-8?B?SEE5dkc1RU12UXZoWFF6b3FYUE9nS0dWL0FIbkd1ekhSTFkyQVJudXllRnVS?=
 =?utf-8?B?S3ZGNTU3QWNGTDFLeHNNdDFPaStBeTFOUjRZVTFndFBlT2lGTG40TEYxMnZl?=
 =?utf-8?B?NUFGUlZTUUJSM0JtSFF0UW4vSzB4MWdFamxYVE9yQlV1T0FlTC9pRjExTmpD?=
 =?utf-8?B?V2NZRmNWdWgzTHlrM2FEY2JCOHgvczlTdmJaendVQWRGSS90TWZXVUI4RXpL?=
 =?utf-8?B?MXRuZHlWVi9pcUFlUkR3TnhmWThRMHJsdUxuL0RzRkhlQ2dkV0hyZVlaSlVT?=
 =?utf-8?B?M2N0dVdUVkg1WWQ1cEU0YnQxemFKb3N5Q2FWOXNIcWdQL0xrNU5oVXBTbjJD?=
 =?utf-8?B?V3lPb25uVlRLWjZDY2lKWjg0QzJZL0crN3UwRUZ0Tk5VV2FITytKMW5XUExG?=
 =?utf-8?B?NTNQTzRTYVl0b0crR3pWeCs2Z3doUWo2RWxvRllsTXBnbWVzMzlXdGhadHFl?=
 =?utf-8?B?ZkV5VzNtWk5QeXZhTlBtTUtvdzZRdWpXZVVqdjN6OTFZRVMxM3Q2S1VjdG5C?=
 =?utf-8?B?T3d6U1lhMHJnRWdxRXJnMDV0cHo2bFhNV2xTa1NuZFdxNllzUzQzWnJSbFp6?=
 =?utf-8?B?WGVERS94bVE1eHZDbTY3UzRiTlcySjR4QlpBbkFmWjhPbm1rR1kwTFNkUFFq?=
 =?utf-8?B?ZStPUDdIREQxRERqMnpqK1hDQ1AyZUNUSGlKR1BmdVRWVXhlZFFrOFhMWFcz?=
 =?utf-8?B?cWMxNzZEdTMvRGg3VVhCaStkWFZHNU1oOXdRcktjZXBmamNRUUtvR0ZDWm92?=
 =?utf-8?B?MzhqdEliakFqcXc1djlneEZ0RjJ1TWF6RjhkMk9nMVJCdHFtRS9WaGR0ZUZF?=
 =?utf-8?B?ck5ab2ZUUkF2MlZCS1Fkd2R6dVY0WS9hYm11Tk1YWGhJTzM0WEgweTAyZm9v?=
 =?utf-8?B?ZlN6aVJ3Z3lUN2ZmWERuZ1Jka1ZFMkNzMXhDdHltUnRFWUJhcldPSmJkTnRt?=
 =?utf-8?B?YUs4L0xqaWUwcnczd29hdGdpcEc0TzRhODRJcGxuUWtOb0VZak5jSFhjOUdp?=
 =?utf-8?B?Tm5DeGVWSVlnU1BBTnJDVjhsQlRhRGNERjhuRHplaVVBSlVCVVNGVEoweWVq?=
 =?utf-8?B?Mi9PZHZydFVDRlhsQlhNWWxscDhpYkM4MHRGdU1ocEVxd1FNV0lzYU9DTEJa?=
 =?utf-8?B?LzlESEE4eTlNajhmQzBFWnNIZm93NG1YMG9uTWhCNC8yUnN2Y3BteFlaYmZo?=
 =?utf-8?Q?dbML+STYkEq0X7I/sRx2D6iak?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5635b1ef-0aea-4846-ff7f-08dc8587906c
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5874.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 17:47:27.1060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G4fRi2gjhK6/8UV8OAeQ3lpwCaiN+ZJ+3IgwGb1NXuj0qxA8ZiFlwDdve1qcbX5H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6184



On 6/4/24 3:23 PM, Bjorn Andersson wrote:
> On Mon, Jun 03, 2024 at 01:34:38PM -0700, Tanmay Shah wrote:
>> It is possible that remote processor is already running before
>> linux boot or remoteproc platform driver probe. Implement required
>> remoteproc framework ops to provide resource table address and
>> connect or disconnect with remote processor in such case.
>> 
> 
> I know if changes the current style for this driver, but could we drop
> "drivers: " from the subject prefix, to align changes to this driver
> with others?
> 

Ack. Will be fixed. Is it convention not to have "drivers" ?
If so, from now on, I will format subject prefix: <subsystem>/<platform>:

> Regards,
> Bjorn

