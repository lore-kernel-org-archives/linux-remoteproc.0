Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010066.outbound.protection.outlook.com [52.101.61.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E867CA45;
	Fri,  8 May 2026 16:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778259575; cv=fail; b=K2aun7vGuTOvGgTgFJvxgxRCJ1CGm3BMTuJPFpSwWOcOwkggOz/qmyrmFs1GIuCaChX+RafK/VpGO3xOsUC1O1lx+CpV576ALnISOpdhm9eD0Ebjk4nMQ55OagFAGmELWViavweI6EAZZGeH7kqR+NoXiIczIk0wZ3lYmWT7TZk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778259575; c=relaxed/simple;
	bh=ZSj4bQAPat0E3nDxxLfFmF+6t8MmJvOjeGfRAMr5raw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dv0gYg7r3Cmq6TLaPjOH6uErIoQ06ERNeBo3jVyUy5PXtNKslibSpvJq798p7zssXuaYeXKy07C1GRgAZ/dRKI7PKiuUEQx5hMpHZRPzi2Rz9aKWKNvpbaSHGdv4RoQvYni+KWbrszKv37LA5EJPpx3BTlAhp/SbafrBQGSQbjw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=A4ygcGqU; arc=fail smtp.client-ip=52.101.61.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="A4ygcGqU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A1qjQdzoXRKciTeKPfgfz5FMWWz4c0FcLKfcG8Dk8IaYcU1Pa9O+nCQ96wAWrEPZooPC+QrcogYPxiSyi70Y27/o/xNnaWY5Sxc7GqBBkze5UphsQyHCLHCYgUR4wwSkD4Q7oqvcNo4DCThZ1rFbodPDArrFSZexvQfsqGX3ncUIwdY29K0z892DlMzlIkOa/qvSVA5LnFOnawxjjBWoa5hMT2B5VOnJDxxmnc8rMiRX4MaAA47UzAREjHok+iK+r9m3x4jASsmujKvADrSIEiEzqBPUQUe3IwB5XDmBwa2xyMiwdxS06qq/B0NIZTgOkdACnoasezN1aerlLJ7uLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uascw88TMcXPH7usMit9sUJWoktW3Rm7v7nfuD9NU5M=;
 b=UDEhwUTL/rUSjIKAUczulAb5krMXvBru4QGI0xRt83q5eC8JHU5j1VxBQn/8N5d6tHRGhFyHeRwYwoxTHuOvqnd1XWf5pwYLfPPxBxTdBjwkgQV83bkp1eLVzXqdS6ar5IILlvsZNS5rQqqdP270dNPYMCYcBl9bdwYnpBrV3VhE0So7eXaiqembXfmgPfbBHEh7grPd+XEP/IU/iTaIJzmxy2ry8J1X5veqgd4iWqYXqsRYiYVJx799EiSduRcU1E/59bGbxbze5Y8pKR7CDnB8o9wUfzvt62aSjSOi8ins42EZxCvqMIOx9PEP1Vd86J6IEQrCI1uGEnIcMO9oOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uascw88TMcXPH7usMit9sUJWoktW3Rm7v7nfuD9NU5M=;
 b=A4ygcGqUdDQ1fXTAnn+v4vsfpQLVgnl5SsV5Cf5GlD0jaaYvsRgETJQ6PnD1vRajenev5F91BQAry/G3q5kTYuybaCMX9CPhIdQyuAYIQyFGEe6+x34dGsiYVLZDyElSKoxyv76zMlzTWar6QLu2HyCtUjp7V0NM6qV3aE+7gnc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6448.namprd12.prod.outlook.com (2603:10b6:8:8a::7) by
 DS3PR12MB999217.namprd12.prod.outlook.com (2603:10b6:8:390::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Fri, 8 May
 2026 16:59:31 +0000
Received: from DM4PR12MB6448.namprd12.prod.outlook.com
 ([fe80::62c2:71cd:7fdc:987a]) by DM4PR12MB6448.namprd12.prod.outlook.com
 ([fe80::62c2:71cd:7fdc:987a%6]) with mapi id 15.20.9891.016; Fri, 8 May 2026
 16:59:30 +0000
Message-ID: <d904a2da-9ef8-4a1a-aa4b-782bc75d21ae@amd.com>
Date: Fri, 8 May 2026 09:59:28 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] remoteproc: add AMD BRAM-based remote processor
 driver
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
 Ben Levinsky <ben.levinsky@amd.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, linux-kernel@vger.kernel.org, michal.simek@amd.com,
 tanmay.shah@amd.com
References: <20260428142633.1854251-1-ben.levinsky@amd.com>
 <20260428142633.1854251-3-ben.levinsky@amd.com> <af4FoowZg6myMzMI@p14s>
Content-Language: en-US
From: Ben Levinsky <blevinsk@amd.com>
In-Reply-To: <af4FoowZg6myMzMI@p14s>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0070.namprd03.prod.outlook.com
 (2603:10b6:a03:331::15) To DM4PR12MB6448.namprd12.prod.outlook.com
 (2603:10b6:8:8a::7)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6448:EE_|DS3PR12MB999217:EE_
X-MS-Office365-Filtering-Correlation-Id: 07b8e43d-0af9-4dd4-bd44-08dead232bf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	tsln7yaHHL3iu2w83bG1QT9XkW+lrxG9h1mlDc97mbEPjmKH8GSCsS7zHcRXiF3Y4NEiXIjSGHTdtYS0WwCDRof+/FmNq0WY28OHOcFxkziujP5MTNgXRGzWSW31qD4/2Ev6yb/z4DdDukiKWYjbzm4tun++pONnDXRTUA1ZujqWZrNfiB0NiM8yNvKvwcjrqcuckr83Fzpv3EHFq7qG6gQi3oJSlczJoElR7pWSu8sik8YUtQpYS9yD2RuuLkT55xqez9aWK+7aEXrDm4tz7qFtXb2OXsoF0LYdQMVN2MJgsAZTSMoMd813xc1gJ3EBFTg2xPJbsDLoG29bm3frjP2PsZNrBqjKiN+qraWYlrIcpVVOYLEpvMgbAH+7uEcxMqPTuna1iDlatMKyI8eIpoCxkgAmT5ll9SEuX3GFLEqLXyhzdFimRzhHASx0Hp3vgK0/uRbDTNKHXGX6EIvnf+bAia6x8L3u2WH5BaEIxcEYOXy23I/iMau8Qm07B8TBOcZj68DQ750jQFo5fSpHqHKpzRCs1zmomMjmQ1s5O8M3b4ozkU/PM8tIq6tidA3amIFEHb2xk9UakoOqE8TWpUwuMbdfp9SD/eFfnPMylFsFikfckNgH7/19GeLsrCo10RIxlSlaBMCC8GlO30uX9fxwAx6dNyjlQTk3Y1JPuO/F5SGYwTJQs2Z0z3UXx4Op
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6448.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WWhxVGEwZ3d2SUZVakRxNHVyRXVrbCthYVhUWE03azJYQ01RbmVqVUZiQWlU?=
 =?utf-8?B?NHlOUmFhRmdoTUtuTHFsRm9jMGgzdjJjMTRRb2llVkhzWGI0YVNLZXhlWUpZ?=
 =?utf-8?B?SzdKZjFxNk9ML2tqNFhCSkZaR25DYXN4UmJzT0paK2ovZEVGT2o2QTFJajcx?=
 =?utf-8?B?TnUxMVFsTktKT0VRV3dlaklLWldVNHd0MDlSM3d3STdhRitSZEp0NUFhenJy?=
 =?utf-8?B?OVRUdlAzNG8ybjltb3hoWE5nS0poRy93SkJPZndBeXRFQVVkcTZEdzlDNFBh?=
 =?utf-8?B?UWtPYmo0SEZkUVUrRnpXUFdUeXl1NjRDa1ZNdFJxc003V1FwOGl5VXd4NjBv?=
 =?utf-8?B?bHFYZ0N6bkdqeFRqc0V1ZXNCR0pSa0NUUC9oV0VWdWFadkRPS2laUFpRNXJv?=
 =?utf-8?B?bGJpRE15VmFwWmJhMExJcVZNQnNXMllESUhLUTNmS3dEa2RwdFlGazd4QjZq?=
 =?utf-8?B?RDBPYW9xZWpmMUxwSnVDTloxTWlTOWlyMzBCcGw0eS83TlZmTzMwbnBzd3VB?=
 =?utf-8?B?R0oxcit1ZEdmZkZlc0U3Z1lQNWE2MG5QZG8xNU5memk2UWIrc2hQUXJQMnZE?=
 =?utf-8?B?aHJ2eXNVNDRsa0s2SFB0OW1kckNQL0ZRVWxNTjcrVlBzWk02Z0NrSXdVaVE5?=
 =?utf-8?B?NTBROS9STDVVMWJtZFdjU0MxcnZMQzkzSkErUzVlWlpKUW9lSFg2QUJCR2R5?=
 =?utf-8?B?WVhVM2x3VUJYY3J2OTFXVSt0YlIwV0ltOGpOcmsrRFV0bEJMUktaTnVXTm8r?=
 =?utf-8?B?Q2VaRy8vL2E2VHdzU01DOWNHRy9nZ2g0SzRlRWpMSHRrMEh5RzNHT3hkUE9W?=
 =?utf-8?B?Y0V3Z1NaUnNDSVZubG5jUURiOExEYVk4L0I3N0xtaGVVSEhaUXVBNHkvcnM4?=
 =?utf-8?B?b2Q1Y3MxVEtyWVg2bnhTbHREQ2FNcEl4dVp4TlVPdy9CcmZZTEhISWYzTmY2?=
 =?utf-8?B?M2FKdVRZcS9RSWh2SWkxT3MzK0RKWVlHVS9aUDYwaFhKbEZWdnUrQ2s4dlVl?=
 =?utf-8?B?TXFxRDNtRllNdGFEbnRka2VFOWN5T2hCQUVWdEFoTG9ZejYzakpnVW1ZU2l6?=
 =?utf-8?B?d096QkpqNmhzZFdkZDdFa1VsU0lzRUdkSUlqTnFoMGVnVDhIUlRUUFlaeGFL?=
 =?utf-8?B?OEsycWNwWTRnQzRueThuekNwS0hXN2VuaFhaZFYwUkZBNEM2cFhYZWxrcWtP?=
 =?utf-8?B?S2JqelEyTFlLOERmYjBySmpaTUp0NHRITGcrbDBNMlFmWktXWWtKSy80T2d3?=
 =?utf-8?B?TVZQU05lV1hVQVZ2V0UvcFFEa2h2b2lQMFFJaU5mbHVMemZBbjhOZldHakpI?=
 =?utf-8?B?NkpVVDNEb0Y2eUU2WFhwVDBXV05JMyt1MjVMdi96YTE5ZGo2MXBTK2Y4M1Av?=
 =?utf-8?B?T0ozNzJQbENVQ2l3OHJ5TUJ3RHgrNFlVZEtGUjBMZ1cweERrUGx4WXhCTXhP?=
 =?utf-8?B?K014ZkFJQ1JVREdqajhqbnZublJRYm43ekM0TTRVa1pVWWxSM3lrZWNsU0dO?=
 =?utf-8?B?QUNwMGppa0JOZDlmb0VVeFhpdDJiakJodm9YTlJGV3YrcFV4a01sa3FnMzRX?=
 =?utf-8?B?RVlhN2VqWWFZY0FNQys0YnBhWVVzeC93NmZIc1hDOWdpbGs3NkdJR1M1SzBV?=
 =?utf-8?B?VTRNZjNqV0laMktVVW13NFlUYW5nenZ1bTBrdTBMb1Zlc2VmbmlBWjdYaC9m?=
 =?utf-8?B?RXJGQnJNWmJ1NWVuclphS25leFVCbnFVMXJHWnhiZE45UDhMcnk2MG1PcWVu?=
 =?utf-8?B?dEY5Qy9SMzdwQzVpa2M4VEJ1eittRVc3ZmFleUdMdlF4ZXJycFNGanpHdm5U?=
 =?utf-8?B?aEljMGNYRmxTQlRCTXN5dlBNV2Q0UjdEbWNNTnVkK210T3VVSmFvUVE5dzZL?=
 =?utf-8?B?UEF5T0l2ZkRZejNrRjd0elp4K0pHY1VENXdpRW9BTW1wMW1VZnpXVDFTb2JT?=
 =?utf-8?B?aGZVaGRCdDJKOE5ZaWIvSEJWaVllc3dGVWQ4KzJwOTVuWS9CWHdWOWVLWTJz?=
 =?utf-8?B?b1lLTExSd2NJSVhUTFYwUHNFckozRHNOZEtQeXROeUpPWVI2N0JYaXN3ZmpZ?=
 =?utf-8?B?VFAyZnVsK0N1YU1vMzliWk5PNlVybHVSMUZIdTI0RTk1ZzJjdE1EbnpWNjE1?=
 =?utf-8?B?L202cVdWa20rMzd1YytaQm9ScXhwTGo3dnRPTDk4RXVYL1RlWVJzWUFXZGFC?=
 =?utf-8?B?Y05wTTlONnE3RVRzajduWUFJUHVTUGVEY05iK2VRaWZ0SlpmeXNldmhSMDZE?=
 =?utf-8?B?OGRtV2luVkxDMGJXbnZzQnJOUmw0N3JKMjQ1UFlJb1VZOUhXRFlSUzhhQzc1?=
 =?utf-8?B?VUJCS3NRVnFLaW5LOG1hNUthZmFjSHNDOHZEVy9nWmI4SkFvOVhEQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07b8e43d-0af9-4dd4-bd44-08dead232bf3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6448.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 16:59:30.7617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RXH1xJrAShPi/NrwuPfvyVksfhOQn4UKEITsyJEQpAnLGjuSegXpK/I91FQqn14IeUriu4bljZakyQrgWQrIRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR12MB999217

Hi Mathieu,


On 5/8/26 8:47 AM, Mathieu Poirier wrote:
> Good morning,
> 
> On Tue, Apr 28, 2026 at 07:26:33AM -0700, Ben Levinsky wrote:
>> Add a remoteproc driver for AMD soft-core processor subsystems
>> instantiated in programmable logic and using dual-port BRAM for
>> firmware storage and execution.
>>
>> The driver parses the firmware memory window from the remoteproc device
>> node's reg property, interprets that address and size in the
>> processor-local address space, and then uses standard devicetree
>> address translation through the parent bus ranges property to obtain
>> the corresponding Linux-visible system physical address.
>>
>> The resulting translated region is registered as the executable
>> remoteproc carveout and coredump segment.
>>
>> The processor is controlled through an active-low reset GPIO and a
>> subsystem clock. The clock is enabled before reset is released, and the
>> processor is kept in reset until firmware loading completes.
>>
>> The firmware-name property is optional, allowing firmware to be
>> assigned later through the remoteproc framework. Firmware images
>> without a resource table are also accepted.
>>
>> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
>> ---
>>  MAINTAINERS                         |   7 +
>>  drivers/remoteproc/Kconfig          |  14 ++
>>  drivers/remoteproc/Makefile         |   1 +
>>  drivers/remoteproc/amd_bram_rproc.c | 243 ++++++++++++++++++++++++++++
>>  4 files changed, 265 insertions(+)
>>  create mode 100644 drivers/remoteproc/amd_bram_rproc.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index c871acf2179c..172539971950 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1037,6 +1037,13 @@ S:	Maintained
>>  F:	Documentation/devicetree/bindings/w1/amd,axi-1wire-host.yaml
>>  F:	drivers/w1/masters/amd_axi_w1.c
>>  
>> +AMD BRAM REMOTEPROC DRIVER
>> +M:	Ben Levinsky <ben.levinsky@amd.com>
>> +L:	linux-remoteproc@vger.kernel.org
>> +S:	Maintained
>> +F:	Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml
>> +F:	drivers/remoteproc/amd_bram_rproc.c
>> +
> 
> There is no real advantage in adding this entry, checkpatch.pl should be
> sufficient.
> 
>>  AMD CDX BUS DRIVER
>>  M:	Nipun Gupta <nipun.gupta@amd.com>
>>  M:	Nikhil Agarwal <nikhil.agarwal@amd.com>
>> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
>> index ee54436fea5a..9a2a887ede8a 100644
>> --- a/drivers/remoteproc/Kconfig
>> +++ b/drivers/remoteproc/Kconfig
>> @@ -23,6 +23,20 @@ config REMOTEPROC_CDEV
>>  
>>  	  It's safe to say N if you don't want to use this interface.
>>  
>> +config AMD_BRAM_REMOTEPROC
>> +	tristate "AMD BRAM-based remoteproc support"
>> +	depends on OF && COMMON_CLK && (GPIOLIB || COMPILE_TEST)
>> +	help
>> +	  Say y or m here to support a BRAM-based remote processor managed
>> +	  through the remoteproc framework.
>> +
>> +	  This driver matches designs where executable firmware memory is
>> +	  described in the BRAM-local address space and translated to
>> +	  the system physical address space with standard devicetree address
>> +	  translation.
> 
> Not sure how this paragraph helps decide whether the driver should be enabled or
> not.  Please remove.
> 
>> +
>> +	  If unsure, say N.
>> +
>>  config IMX_REMOTEPROC
>>  	tristate "i.MX remoteproc support"
>>  	depends on ARCH_MXC
>> diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
>> index 1c7598b8475d..5c39664b50c3 100644
>> --- a/drivers/remoteproc/Makefile
>> +++ b/drivers/remoteproc/Makefile
>> @@ -11,6 +11,7 @@ remoteproc-y				+= remoteproc_sysfs.o
>>  remoteproc-y				+= remoteproc_virtio.o
>>  remoteproc-y				+= remoteproc_elf_loader.o
>>  obj-$(CONFIG_REMOTEPROC_CDEV)		+= remoteproc_cdev.o
>> +obj-$(CONFIG_AMD_BRAM_REMOTEPROC)	+= amd_bram_rproc.o
>>  obj-$(CONFIG_IMX_REMOTEPROC)		+= imx_rproc.o
>>  obj-$(CONFIG_IMX_DSP_REMOTEPROC)	+= imx_dsp_rproc.o
>>  obj-$(CONFIG_INGENIC_VPU_RPROC)		+= ingenic_rproc.o
>> diff --git a/drivers/remoteproc/amd_bram_rproc.c b/drivers/remoteproc/amd_bram_rproc.c
>> new file mode 100644
>> index 000000000000..9383964b6046
>> --- /dev/null
>> +++ b/drivers/remoteproc/amd_bram_rproc.c
>> @@ -0,0 +1,243 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * AMD BRAM-based Remote Processor driver
>> + *
>> + * Copyright (C) 2026 Advanced Micro Devices, Inc.
>> + *
>> + * This driver supports soft-core processors (MicroBlaze, MicroBlaze-V, or
>> + * similar) instantiated in AMD programmable logic, using dual-port BRAM
>> + * for firmware storage and execution.
>> + *
>> + * The firmware memory (BRAM) is described in the processor-local address
>> + * space and translated to the Linux-visible system physical address with
>> + * standard devicetree address translation.
>> + *
>> + * Reset is controlled via GPIO connected to Processor System Reset IP.
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/dma-mapping.h>
>> +#include <linux/gpio/consumer.h>
>> +#include <linux/io.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/of_address.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/remoteproc.h>
>> +
>> +#include "remoteproc_internal.h"
>> +
>> +/**
>> + * struct amd_bram_rproc - AMD BRAM-based remoteproc private data
>> + * @dev: device pointer
>> + * @reset: GPIO descriptor for reset control (active-low)
>> + * @clk: processor clock
>> + */
>> +struct amd_bram_rproc {
>> +	struct device *dev;
>> +	struct gpio_desc *reset;
>> +	struct clk *clk;
>> +};
>> +
>> +static int amd_bram_rproc_mem_map(struct rproc *rproc,
>> +				  struct rproc_mem_entry *mem)
>> +{
>> +	void __iomem *va;
>> +
>> +	va = ioremap_wc(mem->dma, mem->len);
>> +	if (!va)
>> +		return -ENOMEM;
>> +
>> +	mem->va = (__force void *)va;
>> +	mem->is_iomem = true;
>> +
>> +	return 0;
>> +}
>> +
>> +static int amd_bram_rproc_mem_unmap(struct rproc *rproc,
>> +				    struct rproc_mem_entry *mem)
>> +{
>> +	iounmap((void __iomem *)mem->va);
>> +
>> +	return 0;
>> +}
> 
> The above 2 are identical to what is found in xlnx_r5_remoteproc.c.  Please
> coordinate with Tanmay to split that into common code that can be reused by both
> drivers.
> 
>> +
>> +static int amd_bram_rproc_prepare(struct rproc *rproc)
>> +{
>> +	struct amd_bram_rproc *priv = rproc->priv;
>> +	struct rproc_mem_entry *mem;
>> +	struct resource res;
>> +	u64 da, size;
>> +	int ret;
>> +
>> +	ret = of_property_read_reg(priv->dev->of_node, 0, &da, &size);
>> +	if (ret) {
>> +		dev_err(priv->dev, "failed to parse executable memory reg\n");
>> +		return ret;
>> +	}
>> +
>> +	if (!size || size > U32_MAX) {
>> +		dev_err(priv->dev, "invalid executable memory size\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (da > U32_MAX) {
>> +		dev_err(priv->dev, "invalid executable memory address\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	ret = of_address_to_resource(priv->dev->of_node, 0, &res);
>> +	if (ret) {
>> +		dev_err(priv->dev, "failed to translate executable memory reg\n");
>> +		return ret;
>> +	}
>> +
>> +	mem = rproc_mem_entry_init(priv->dev, NULL, (dma_addr_t)res.start,
>> +				   (size_t)size, da,
>> +				   amd_bram_rproc_mem_map,
>> +				   amd_bram_rproc_mem_unmap,
>> +				   dev_name(priv->dev));
>> +	if (!mem)
>> +		return -ENOMEM;
>> +
>> +	rproc_add_carveout(rproc, mem);
>> +	rproc_coredump_add_segment(rproc, da, (size_t)size);
> 
> I'm pretty sure you want @res.start instead of @da, and resource_size(&res)
> instead of @size.
> 
>> +
>> +	return 0;
>> +}
>> +
>> +static int amd_bram_rproc_start(struct rproc *rproc)
>> +{
>> +	struct amd_bram_rproc *priv = rproc->priv;
>> +	int ret;
>> +
>> +	/* Enable clock before releasing reset */
>> +	ret = clk_prepare_enable(priv->clk);
>> +	if (ret) {
>> +		dev_err(priv->dev, "failed to enable clock: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	/* Deassert reset and let the processor run. */
>> +	ret = gpiod_set_value_cansleep(priv->reset, 0);
>> +	if (ret) {
>> +		dev_err(priv->dev, "failed to deassert reset: %d\n", ret);
>> +		clk_disable_unprepare(priv->clk);
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int amd_bram_rproc_stop(struct rproc *rproc)
>> +{
>> +	struct amd_bram_rproc *priv = rproc->priv;
>> +	int ret;
>> +
>> +	/* Assert reset before disabling the processor clock. */
>> +	ret = gpiod_set_value_cansleep(priv->reset, 1);
>> +	if (ret) {
>> +		dev_err(priv->dev, "failed to assert reset: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	/* Disable clock after asserting reset */
>> +	clk_disable_unprepare(priv->clk);
>> +
>> +	return 0;
>> +}
>> +
>> +static int amd_bram_rproc_parse_fw(struct rproc *rproc,
>> +				   const struct firmware *fw)
>> +{
>> +	int ret;
>> +
>> +	ret = rproc_elf_load_rsc_table(rproc, fw);
>> +	if (ret == -EINVAL) {
>> +		dev_dbg(&rproc->dev, "no resource table found\n");
>> +		return 0;
>> +	}
>> +
>> +	return ret;
>> +}
> 
> This too should go in common code or simply replaced by
> rproc_elf_load_rsc_table() in @amd_bram_rproc_ops - the choice is yours.
> 
> Thanks,
> Mathieu

  Thanks for the review.

  I went through the remoteproc drivers to scope the cleanup points you
  called out.

  For the plain carveout map/unmap callbacks, the same ioremap_wc()/iounmap()
  pattern exists not only in amd_bram_rproc and xlnx_r5_remoteproc, but also
  in rcar_rproc, st_remoteproc, stm32_rproc, imx_rproc, and imx_dsp_rproc.

  The xlnx_r5 TCM path is close as well, but that one still needs a wrapper
  since it clears the memory after ioremap_wc().

  For the optional resource-table parsing, amd_bram_rproc and xlnx_r5_remoteproc
  share the same pattern of treating only -EINVAL from rproc_elf_load_rsc_table()
  as non-fatal. PRU is similar, but has additional firmware parsing after that.
  Other drivers such as rcar/imx/imx_dsp/stm32 also tolerate missing resource
  tables, but their current behavior is not identical since they flatten all
  errors to success and only log.

  For the next revision, would you prefer the following approach?

  1. Add a small common helper for the plain carveout ioremap_wc()/iounmap()
     case and use it in amd_bram_rproc and xlnx_r5_remoteproc.

  2. For the optional resource-table handling, either:
     - add a small common helper for the "missing table is OK" case
       (i.e. return 0 on -EINVAL and propagate other errors), and use that
       in amd_bram_rproc and xlnx_r5_remoteproc, or
     - drop the custom AMD parse_fw() path and use rproc_elf_load_rsc_table()
       directly, which would make the resource table mandatory there.

  Also, for the plain map/unmap helper, should I keep the cleanup scoped to
  the drivers directly involved here, or would you prefer that I fold the
  other exact-match users (rcar, st, stm32, imx, imx_dsp) into the same
  cleanup patch as well?

  I want to make sure I take the direction you prefer before respinning.

  Thanks,
  Ben
> 
>> +
>> +static const struct rproc_ops amd_bram_rproc_ops = {
>> +	.prepare	= amd_bram_rproc_prepare,
>> +	.start		= amd_bram_rproc_start,
>> +	.stop		= amd_bram_rproc_stop,
>> +	.load		= rproc_elf_load_segments,
>> +	.sanity_check	= rproc_elf_sanity_check,
>> +	.get_boot_addr	= rproc_elf_get_boot_addr,
>> +	.parse_fw	= amd_bram_rproc_parse_fw,
>> +};
>> +
>> +static int amd_bram_rproc_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct amd_bram_rproc *priv;
>> +	const char *fw_name = NULL;
>> +	struct rproc *rproc;
>> +	int ret;
>> +
>> +	ret = rproc_of_parse_firmware(dev, 0, &fw_name);
>> +	if (ret < 0 && ret != -EINVAL)
>> +		return dev_err_probe(dev, ret,
>> +				     "failed to parse firmware-name property\n");
>> +
>> +	rproc = devm_rproc_alloc(dev, dev_name(dev), &amd_bram_rproc_ops,
>> +				 fw_name, sizeof(*priv));
>> +	if (!rproc)
>> +		return -ENOMEM;
>> +
>> +	priv = rproc->priv;
>> +	priv->dev = dev;
>> +
>> +	/* Get the processor clock */
>> +	priv->clk = devm_clk_get(dev, NULL);
>> +	if (IS_ERR(priv->clk))
>> +		return dev_err_probe(dev, PTR_ERR(priv->clk),
>> +				     "failed to get clock\n");
>> +
>> +	/*
>> +	 * Keep the processor in reset until remoteproc has finished loading
>> +	 * firmware into the executable memory window described by reg and
>> +	 * translated through the parent bus ranges property.
>> +	 */
>> +	priv->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
>> +	if (IS_ERR(priv->reset))
>> +		return dev_err_probe(dev, PTR_ERR(priv->reset),
>> +				     "failed to get reset gpio\n");
>> +
>> +	rproc->auto_boot = false;
>> +
>> +	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "failed to set DMA mask\n");
>> +
>> +	platform_set_drvdata(pdev, rproc);
>> +
>> +	ret = devm_rproc_add(dev, rproc);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "failed to register rproc\n");
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct of_device_id amd_bram_rproc_of_match[] = {
>> +	{ .compatible = "xlnx,zynqmp-bram-rproc" },
>> +	{ /* sentinel */ },
>> +};
>> +MODULE_DEVICE_TABLE(of, amd_bram_rproc_of_match);
>> +
>> +static struct platform_driver amd_bram_rproc_driver = {
>> +	.probe = amd_bram_rproc_probe,
>> +	.driver = {
>> +		.name = "amd-bram-rproc",
>> +		.of_match_table = amd_bram_rproc_of_match,
>> +	},
>> +};
>> +module_platform_driver(amd_bram_rproc_driver);
>> +
>> +MODULE_DESCRIPTION("AMD BRAM-based Remote Processor driver");
>> +MODULE_AUTHOR("Ben Levinsky <ben.levinsky@amd.com>");
>> +MODULE_LICENSE("GPL");
>> -- 
>> 2.34.1
>>
> 

