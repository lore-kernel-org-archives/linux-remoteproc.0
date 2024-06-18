Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2053.outbound.protection.outlook.com [40.107.94.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845E413A400;
	Tue, 18 Jun 2024 16:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718729135; cv=fail; b=ebMfnfwTq/CSHsg8HQmChz+PayxuLbJwHkairJspk2KyMEn4y5j+11dID2G34+ykOtdIyphwyRFAE1SnAcTLe954GLaiodb/N15Rb6vXNvET2TIp+zC7/zzCXdRCKo5BoAxvvYSluQ8h1UW5wanV+rBvTZmYt1FGdR7617nl3eY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718729135; c=relaxed/simple;
	bh=48isvOiSPC3GwIq2kA36ICBAg1ankQ3pG5KcXEcGoiU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fyvow12DIa+mDnmV//il0wo18BiJC+D7I+hA/9JWqugQjlFb+oadnJmstAZRiIp2A5UzAi4HtvgWLh96nz0nTNoc0Z8x3bxsDRn/cRifaTVDpwKNMZ8JMdn2Bw16XjkBwnEbf6RaVFNS8NV2KGRcU/D7llZpHDlobPh0ZAlOS78=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=VqkeQ6j8; arc=fail smtp.client-ip=40.107.94.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="VqkeQ6j8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gh2wS1VKtDpzk36nS6Atodza4+SzhxQQYOE5IsCMpbYjspdDAdsGI3dNBNktENnEyuHPdFYOU81U80gg8Z0u91yQyqPzOnNMBNSg1Vn1mEq+YoDrqi0+lsbyLlcyeVBXLguKM7tcKY99CzMrg5IgmOxoVeEckmwF/lJFAw8GQ0B1Z/vXRa8Q5+PJJPsiMYJiW4hB6/JoF+AirjsbAFVJu8/zWbkey/xHruv00G5dOk+/sL+2kgQlMsQgOtRqNarJcYcq3UUBIe9V6h2kHXFt42pBRN125hJ0O3tV5onvzA4InUqSX1ArfPgxy/gMsAvKU+AQ/dObd0nMuhCYxrwjrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PtM8fCJFLXbnLV6VaKHCdOfFgdxlWTr3u//amL4nD2o=;
 b=ifyKF/Fi+VV4nmcxWqRMDD1t4+P2ZcOFsluGZfcECy58h04xl01PsYBPJTja5NknjCeADqTctzLsbNWylah4XAI8PnRQbOTqVzNci4tNhZAZFWLEaEPcata3lGyUlCE2mbNXcn9HxWSQFyiThgvsU5E0byH2k3ztq7NCKqgUp/yhk9W5Zlbye/WxyMTYchRu+EnAPHj+KReQA3A5OvIsn+8c9yx4JUC6IFdbb88RM32umn3jSW9xoBAexOn86IQwHBAasPf6+5SQXoOP0COSDtGy86LT2Q+e/7+WCOwR+8CQe2x3lW+uVblzAycu2hRySp6lEnvKMaoEO+gqBCboBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PtM8fCJFLXbnLV6VaKHCdOfFgdxlWTr3u//amL4nD2o=;
 b=VqkeQ6j8nILA7DBxFLHuFyRXBjmt70+Aw1XJoDP4sUEiv8uEoSnqp2mBxeunow88tQQHm5vtv9Yr3BLlcb4qIOk6knl5ZL2VsEqihSD6T1I/JWbEYupxwk+g3BbHwxmSQ7Y48Z4FPTLAaUo8e982TTHpbsv8tJRuu+Mm/+KRE0E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5874.namprd12.prod.outlook.com (2603:10b6:208:396::17)
 by SN7PR12MB7299.namprd12.prod.outlook.com (2603:10b6:806:2af::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Tue, 18 Jun
 2024 16:45:30 +0000
Received: from BL1PR12MB5874.namprd12.prod.outlook.com
 ([fe80::5a16:a4db:8bed:1f5d]) by BL1PR12MB5874.namprd12.prod.outlook.com
 ([fe80::5a16:a4db:8bed:1f5d%5]) with mapi id 15.20.7698.017; Tue, 18 Jun 2024
 16:45:30 +0000
Message-ID: <f51ec569-195a-4434-8f3e-36401aabef89@amd.com>
Date: Tue, 18 Jun 2024 11:45:28 -0500
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v5] remoteproc: xlnx: add attach detach support
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: "andersson@kernel.org" <andersson@kernel.org>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20240610154227.3104790-1-tanmay.shah@amd.com>
 <ZnBY0UtG9fyfxdTh@p14s>
Content-Language: en-US
From: Tanmay Shah <tanmay.shah@amd.com>
In-Reply-To: <ZnBY0UtG9fyfxdTh@p14s>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0038.namprd11.prod.outlook.com
 (2603:10b6:806:d0::13) To BL1PR12MB5874.namprd12.prod.outlook.com
 (2603:10b6:208:396::17)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5874:EE_|SN7PR12MB7299:EE_
X-MS-Office365-Filtering-Correlation-Id: 144e2c7f-3db3-45d6-7974-08dc8fb6108c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|1800799021|376011;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b0pQbkkyd0pXZlBFVVhGS21rWC90b0NQZHp4a3N2NkswYS94a1dNNnJDTVQ2?=
 =?utf-8?B?U2lJYWtDeCtHbzJlNXI4MVQ2TDZ4SXFFRjVsamtETldscmFMSEVOdWpwUGUw?=
 =?utf-8?B?Q1pNMXluRkpmdzRTTkNGaFRpYU56NFlsNm5hZmRWUG5YUm56bTRlZktmUXFa?=
 =?utf-8?B?WUlvT0ZXaDk2eDkyRWRNQ1dkMHV3K3ZRVDg1cklpbkhZeUNlM1poR29lTDFz?=
 =?utf-8?B?UnppRWxGdW9DU3hKM3ZKSThGNFI3TFZIWWdCdGVvOHdTeWk4UENtajRBcm93?=
 =?utf-8?B?S09EZnRPV0NrMmFFVG55QytmUjhWNHh4TGFOZTgya2RBdlp4YVM3cEVrOXMz?=
 =?utf-8?B?VmN2NTRFUHllK2JkSXh1RUN6b2h6UlljclpjelNSNDNUYzVWQmdpN0N6Z09r?=
 =?utf-8?B?ekw0YUZjNTlMVHJIS3liMzI3anY5N2NSZDZBbWQ3d0lpd3AyOHdZYVQ3NnAx?=
 =?utf-8?B?T1RqUUpTeTZNR2ZXVGY0dEVmaS9HTG8zdUpINTFVckRFQ3dHKzhXdGFLcjAv?=
 =?utf-8?B?c0hOSmlBQk9jN3JOcER4TDVKTVZkR2tLVEwweEsxc0lhZVhYaWxqalRMQ1Vx?=
 =?utf-8?B?SlZ2QW9JUWk0WStWaDBSaEFvRVVJRHRDclV0QVR4QTJwZ2xLRHJicXlMeUI1?=
 =?utf-8?B?d0hwSXVUZXBnMEk2ZmhuMjdySUpjWDhmSWxzR0tKTlNQcUxJWHJRVzV3SXds?=
 =?utf-8?B?RkFOK21uOW1rU1VqSS94ejBBN1FWVkRXbmxkOEI4QTdsaDZENFZ4Nm5sd3lU?=
 =?utf-8?B?M3NNblNsM1p3NVZlNms1OHhvcW1UTFpvd0tocnV1TmhHOUFzQ3VFR2RyM3lU?=
 =?utf-8?B?Ym9GdmhGZkw0bE00VUF4MnRMTXM0emlqR1dnUnVjVXY5eHBoczByejNnYUp0?=
 =?utf-8?B?Sld2YkVQS21LQmd5b0FGeXl2NW1qVkhEdWgrcWR6UHZuZ1ZIdElPWUIwSHhy?=
 =?utf-8?B?bjcrMk9uQUgzblhvYlN6MDZPOUZHLzVVUmlQTmZ3UEJlbWUxVndMa0xma0Yy?=
 =?utf-8?B?cVMwd2xkR2JKR1RZYURUMFQ5NVQwZyt6ZUxHNTRqRWdWZkVkM0pzUmRSbTFi?=
 =?utf-8?B?M2Q1NEU5YUhodnFzeGNUa2U2RWE2ZkhNT1BpZG45Vk52d0Q3Nk1oR2Z0bUxM?=
 =?utf-8?B?Y25SQ2txdmNKTUlFcCtBdXU2MkF6OXorMVI1VkpDekYwTERnYU5vQVhoQ3lL?=
 =?utf-8?B?K3FqU2N4M3RVSTRCL1MwYXpzcTFoYk1FWGdYaHRvM0xGSFF3TzdCYkN3Qnhh?=
 =?utf-8?B?NUlpc2VLU0Y0VTNVeVgzb0F6SWM4aERxeUZGbWxkSUg0aG9oWmpBWDBOL1Rv?=
 =?utf-8?B?amhnRlZETDcwNStZMExQTXlNMWtwUkJndEhza1JFVmxNajRCVVozUGFaa2hW?=
 =?utf-8?B?dlRIVUhmTUZqNnJBTUd0NnB2SklFb0JxOTN5dW9kWVNnaXNLeDBuVGRFSmd4?=
 =?utf-8?B?TGsrbEh0NWsyVEwyeWlyUUZNQ0gzdEt0TVg3LzRRNnAwcnB1bzN6UjRSRTdM?=
 =?utf-8?B?dFRKbVNtc3lXVVpBWStCQWdPWVljRGpwM080YWNYOW85cjFsSnh1S0lPZFkz?=
 =?utf-8?B?N1JVRXNIamVoRUx3UXhPNkZJTGwyNTNYbXlxRnlNekF4bDZlUVFPWlhKQzhV?=
 =?utf-8?B?eFVFVUtNOW5JdDNhRkZJVmE4MkM2bk5PTTZqTWRwdndMT0FJWlhxRlRSblp0?=
 =?utf-8?B?b1BvQnlCckVMVmZBNk1rNjZZRnlYbDZ6ZUk0d0daNnZ3Q2pwaEJOMnhINUZn?=
 =?utf-8?Q?nBWgF3l4A9lNUS29ihaPyCgd+SKE/0Jxqy6hMW+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5874.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(1800799021)(376011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?clFRaGo4SDF3aFZPVktPcGpMM2JPclMraXNvZXREZzVNSUhmMFlOZzRrVDlG?=
 =?utf-8?B?aVV0OGFqQU1QWGRiYkxybUxMeFljeUg1WFM3eVpubHNSckR3enBNQmtnUkFk?=
 =?utf-8?B?UXRZczhGaDljMGQwdFdkUUUzSVZMc3J0UCswUGQwM1RreHJxMmtBa3NVVDQw?=
 =?utf-8?B?RERnYmZWcElSbVNaOUpkbVB5SVYxR0JWSzkvalRBdFREWC9zeHgxVm42WmpY?=
 =?utf-8?B?SlYzMnF1Y0IzS1V4d0tsSXl0dW9XRTJkeEZmUUJGRVhvS3VGSi91dWlpSzIz?=
 =?utf-8?B?aVVRM2prUVVLKzJDdkZBa1J2Uktlblk1YmpOTzVpWUxKbDE4Q0xMbFYycTNX?=
 =?utf-8?B?Y3lVUzN1SVMzcUpNcWdmdExiYVVacFlkY0NsOU1pQzduN3ZkVkxuR0VnUXU3?=
 =?utf-8?B?Q2lyYTh5WGFPcEVsdnRqT2JmQjdUZkRWV2ZPSllaSGU4YkhTckZrZVpjUTZQ?=
 =?utf-8?B?Ym91cFlQcW9GTHVINlNINGVTdFdCeGUyK0NBWkJTRm9JSDBpY3Btc2d1a01Y?=
 =?utf-8?B?L2tuVGx0RHl2RjRMMVJiWFZpQU1jaDU4TFZtVEZ3aXU0SEdFNmprZktaY1Nl?=
 =?utf-8?B?bWpnN0hvdk1qV1FlTnBiQ3daYnlMb1gzVDJMY3c1anNKOWFIS1phSWN1dzJK?=
 =?utf-8?B?cGZVcGtZSHgvcXoveFA4ZkhzV2lNOW8rMm9JT3NWV2h1VTRDTUpUcTc5Z2ZV?=
 =?utf-8?B?REhQaTBxWjNldVhrTkVycDBYOFk0cHRNeS81ZStraVo3MG9leUU0MWh1RUJY?=
 =?utf-8?B?a1VUTVQ1NVNtcEJISDl5OE1GMkl2SW91dVpnRUdBRkF1NVk0YWtKS0drenZ3?=
 =?utf-8?B?UWRkWkRBc1hNdi9pOGVLb1hWSlJyWkt1eWRUMmliSTRMMVRNdGhjTUVqcC9Z?=
 =?utf-8?B?MnRGL2ZMazR1aG84U3NGNWxJRUx5VlBXUnZDQktISm5sUFhKT2F4ZGRRUmtM?=
 =?utf-8?B?QVRXWkloVWVMM2NSMXd2VnVHWEN5YzVFNTJJQm1Fb2RsT0c2NHBVRzBPdGRj?=
 =?utf-8?B?QWRqeXVzNU8vSGErUU52VHlvRUV3WkVkcDZwUVJnUDczbEI2T080Ym5RT2FW?=
 =?utf-8?B?MVJtSXFwSUdSeHF2a3RIQWJOZmRaZnZzL0tjNUJFZWpCYWZIeHcwamxKa1Zs?=
 =?utf-8?B?RVF2NldCREErdkhtdDY2bzIxUnNSV0UyVmhSbXk0d3hGQ3M3UExKaUhpKzJn?=
 =?utf-8?B?T0JGQm5sMUpzSGtWYURPSHlRSEpHN1VIMW5nblZRVytLZXExODA0cE5yZVdW?=
 =?utf-8?B?WFI2Vjh0U1R6WTNvcFlQek9vN3NKQ3FWTCsvRHdCOERxelJKUVZDRlhPbTJz?=
 =?utf-8?B?NTVCa2RaUXo3Z2gvelNCYXJkcU1RKzJRWE80SGNoRmhZMUhZQUVVb0lhRWs0?=
 =?utf-8?B?eEdUakI0Vzd1eXlRbkVBR2lYeVduUSthaDdSWXZxYzM4MmFzVkI2Z0ZRVDQy?=
 =?utf-8?B?RGFQZnhyV1B4REZuYmFOSlJaNStyNFIrUk5IbCtVYStpRWJWbXB0TlpmQTlC?=
 =?utf-8?B?R3VKVHBKbWJ0UmMxZ21CNjRhVk5XR1RvYUwzMWJoK2VRMjJYRnd5Y1lZa2Rs?=
 =?utf-8?B?dVJYSzlDaHE1dWl2R2U1VDZ6czNOQTJidlRjbnl2NC85LzNIMnQxWFNSUzQr?=
 =?utf-8?B?MVM2SzdkbTV6dk1SVFRhRmlUcENIMDQ3a09sSXVBSVM3NFFtVFJ4ZVpFeXdq?=
 =?utf-8?B?WFZqL0hkcDl0V3lzZFQrNkJjVldQVnJUaGxYQ1RQK3NNcEp1Nk54ZElOc0dt?=
 =?utf-8?B?VE00OVpicUlXelZyckc4Q2RSWXBTcGplQStoTUg0SHdiaWExRm03bGxGaHpm?=
 =?utf-8?B?azhkZDRIdmsxT1dzUGE3bXUycFZHWHlNVm4vV0o2cEIvbE5QL1gwcEpsRjRN?=
 =?utf-8?B?U2pqRjd0K2V2RmdqNkRENlBvVWtHR0ZpVG1SVTBPNXd5MkIwVDlKRnRRVnVx?=
 =?utf-8?B?QkFtbWhzb1JnODEzKzdWVU9HMytMdHdRakdyeWJOU01EMktQMm5RRnB4QUI4?=
 =?utf-8?B?V09YdlZJdjE5eUhuVW5lQkh4bTlVR0pLZFRaRXJxeDZiWFZtVEhBR21uR1o2?=
 =?utf-8?B?YW9uRjdSY2NhRzM5RDQ4eCtSQlVzbnRSUzVZdlJIcCttSWZLS0REbk0yQjJT?=
 =?utf-8?Q?ZBT/02PjiaJXuRPuCLtU+54pd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 144e2c7f-3db3-45d6-7974-08dc8fb6108c
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5874.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 16:45:30.5825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C0VtLgQC+Wa4RMSvcpKp1onHD4KLEg0U69jk8u4uSlWdKjGZDym0bZMAYuPCTaUx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7299



On 6/17/24 10:40 AM, Mathieu Poirier wrote:
> Good day,
> 
> On Mon, Jun 10, 2024 at 08:42:27AM -0700, Tanmay Shah wrote:
>> It is possible that remote processor is already running before
>> linux boot or remoteproc platform driver probe. Implement required
>> remoteproc framework ops to provide resource table address and
>> connect or disconnect with remote processor in such case.
>> 
>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>> ---
>> 
>> Changes in v5:
>>   - Fix comment on assigning DETACHED state to remoteproc instance
>>     during driver probe.
>>   - Fix patch subject and remove "drivers"
>> 
>> Changes in v4:
>>   - Move change log out of commit text
>> 
>> Changes in v3:
>>   - Drop SRAM patch from the series
>>   - Change type from "struct resource_table *" to void __iomem *
>>   - Change comment format from /** to /*
>>   - Remove unmap of resource table va address during detach, allowing
>>     attach-detach-reattach use case.
>>   - Unmap rsc_data_va after retrieving resource table data structure.
>>   - Unmap resource table va during driver remove op
>> 
>> Changes in v2:
>>   - Fix typecast warnings reported using sparse tool.
>>   - Fix following sparse warnings:
>> 
>>  drivers/remoteproc/xlnx_r5_remoteproc.c | 173 +++++++++++++++++++++++-
>>  1 file changed, 169 insertions(+), 4 deletions(-)
>> 
>> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
>> index 84243d1dff9f..6ddce5650f95 100644
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
>> +		ret = add_tcm_banks(rproc);
>> +		if (ret) {
>> +			dev_err(&rproc->dev, "failed to get TCM banks, err %d\n", ret);
>> +			return ret;
>> +		}
> 
> In the normal case function add_tcm_banks() will call zynqmp_pm_request_node()
> but in the attach case, that gets done in zynqmp_r5_attach().  Either way,
> zynqmp_pm_release_node() is called in zynqmp_r5_rproc_unprepare().  This is
> highly confusing.
> 
> I suggest adding a check to see if the remote processor is being attached to in
> add_tcm_banks() and skip the rest of the TCM initialization if it is the case.
> 

If we move this check to add_tcm_banks, then I think I should perform request_node
from within add_tcm_banks only and remove registering attach() op as well. I can call
request_node from within add_tcm_banks() and then avoid rest of initialization.

I am not sure if without attach() registartion, I can still register detach() and
it's valid. I will test this.


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
> 
> Shouldn't an of_put_node() be added right here?

Usually function documentation explicitly ask if it is needed. I will check
and add if required. I will also check any other references in kernel.

> 
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
> 
> Can you spot the problem here?

Ah! It's like use-after-free problem. Address should have been unmapped
at then end of the function. Surprisingly My test passed on platform, so I
didn't pay attention. This will be fixed in next revision.

Thanks,
Tanmay

> 
> Thanks,
> Mathieu
> 
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
>> +	 * If firmware is already available in the memory then move rproc state
>> +	 * to DETACHED. Firmware can be preloaded via debugger or by any other
>> +	 * agent (processors) in the system.
>> +	 * If firmware isn't available in the memory and resource table isn't
>> +	 * found, then rproc state remains OFFLINE.
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

