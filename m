Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012028.outbound.protection.outlook.com [52.101.48.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A9530B525;
	Wed, 24 Jun 2026 22:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782338529; cv=fail; b=joNTh/eSY34y3ESUC06k++QElCMhTMlXhqXgXxwA1YxtXgXqaqeNhnHMguh+JmO17o32C93rSF80jjiGLKOSOWNd5ltw8TfTrysWjEytsc2vrtAZzKTbHJZqIVuuVK2wbdRKNC0hS+3llhlDawexdViuKD38hNG4cFe2RkytGRU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782338529; c=relaxed/simple;
	bh=722RyH3NR8NGWF5Z6eFxMWo3bg0MlCe3PTF2N2apf94=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FBvVtql0CcIePA4MX0i3yqKXeTXUq4qR5rnjFt2YNuA+lbw1v2AXPSE1jY8LuXV99a2PEYKVyzks3RIEnnABdYZnMpMjB957Sjkr35yqh+1CW05XCtB56IFYGfFATrbDRL8xOSX3JlD5Tq5h1OsbtkC73KF3Q2EiIs1cZJ/qFpM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=cj1tw5fw; arc=fail smtp.client-ip=52.101.48.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="cj1tw5fw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mmxllC+uwnFi/Ry0xEXfSOGjEmEt4kttkx3oQZ1ntVjUf6z7MXw0KI7ZcU2+Cl/ECO64BwS0u89wCd1aqht2ERjx8BubnBy1nrvBn392b12js8+QSCUKqwgEJaB6UHPiWZehx+rp2Z+RcrCitBNE8QaDhZKdQ8Wp84dS1wgjBlazmVhiFpgej4aa6gKET6F8qcoA+pUw3OjnwX6vqCh7JBErMSQb5SHjcPZIVlD/7ixjKeWEYed5JWkNaOr3GI6sT37bbAO2nGwzR69FT7Xrdx5lQGrzhX/8Pd/GLJ9Ue3h4vuSXbNHXElUduWDM+M4IAyW08Ksx9aJ0Y1olLFhrpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=65zLMK1kVtm5R8Rh6TtFO0gkqkGYkSPFOBcLbs/u4cM=;
 b=uQkVNQVcV+8ZBxUcXzAfdJT1eEKWqmVA2svxwgvF6xTjSIvX75eqy44GMVjMlbdTDaHD/zTB22RBYCpDl8SkqmsnBlGHcBa5bBYGm8sEm9PP1WdmfXfT5VAupCsgPeNJffhIo8HwgYzGYdTzqtWmkMFk4UBt2FNg2W2if5VdAbKyGoOzCmsP98yysycwQP0onc/F8g8dZUnlh6STNZIi8h3OkFH14uTlyrXkLdR6JJhpDDaYipywHM8gS+hxDWGAN0Cdtcq+uvj1+lWHHTGUVbH7RUfp7qS9lykmugSUgyf/1ByuByA3OqZHMj66geLiGc206ZPvut5Ll8CcsS+TXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=65zLMK1kVtm5R8Rh6TtFO0gkqkGYkSPFOBcLbs/u4cM=;
 b=cj1tw5fwfegyDN8yszrsPaOTryS/cbSx8gXWIByko0cz8jubkfJnr1ORalOR6PaWhMuC5o7+A7IIkLybgaIsCAn2OHs5ySE3Z9UZbDF3d45B6OqkKsaGlx4gQpB4x6plfBl1dg/uMYlBREPAwsOtKBlUwqbfMWo6Kj9TWQyGVwg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6448.namprd12.prod.outlook.com (2603:10b6:8:8a::7) by
 CY8PR12MB7244.namprd12.prod.outlook.com (2603:10b6:930:57::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.20; Wed, 24 Jun 2026 22:02:02 +0000
Received: from DM4PR12MB6448.namprd12.prod.outlook.com
 ([fe80::62c2:71cd:7fdc:987a]) by DM4PR12MB6448.namprd12.prod.outlook.com
 ([fe80::62c2:71cd:7fdc:987a%6]) with mapi id 15.21.0159.012; Wed, 24 Jun 2026
 22:02:02 +0000
Message-ID: <03a7819c-2060-46f6-a72b-caf52b47ba32@amd.com>
Date: Wed, 24 Jun 2026 15:01:58 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] remoteproc: add AMD BRAM-based remote processor
 driver
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Ben Levinsky <ben.levinsky@amd.com>, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, linux-kernel@vger.kernel.org,
 michal.simek@amd.com, tanmay.shah@amd.com
References: <20260428142633.1854251-1-ben.levinsky@amd.com>
 <20260428142633.1854251-3-ben.levinsky@amd.com> <af4FoowZg6myMzMI@p14s>
 <d904a2da-9ef8-4a1a-aa4b-782bc75d21ae@amd.com>
 <CANLsYkwxErFjaOJ0q1wT_59C1WGp_24d0nOksFpk-LaGq6eDGg@mail.gmail.com>
Content-Language: en-US
From: Ben Levinsky <blevinsk@amd.com>
In-Reply-To: <CANLsYkwxErFjaOJ0q1wT_59C1WGp_24d0nOksFpk-LaGq6eDGg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0349.namprd03.prod.outlook.com
 (2603:10b6:610:11a::33) To DM4PR12MB6448.namprd12.prod.outlook.com
 (2603:10b6:8:8a::7)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6448:EE_|CY8PR12MB7244:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e273421-bf1c-4c1b-932c-08ded23c38b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|6133799003|18002099003|4143699003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	Lrq1N1OLwPgWji2Cy08sefRZ9zGfqrs/DDOYKndstkT0CXAfHOR5kzNmTQ33diRlb1QPgFJLM7OG2EHVRRyWSNDhfPZWBdgqHBjMLqh2wHfOzvf7ydhnZArUhytv1354SwOSaXO4nxunmsEn67JcJoO3cnKKxCYK7RxkncBinB04viZqQXR81/xHxnEG4fE67vzg86VTjVSkg01JMLw8wb3c0dLLlPV2Y1Hlc2QpuyLnWGgVoGtViqG2PdhZ4k2+cBonhS9umRLZvMsRDlG2Jb4p26GtqevLUIWS4k75UBRHg2skAIWp7AXS1OGYuceeTMID7zRTTWd9PMcyhJaANnQfCBhGQCVA8AM8YARejBREHyjxs8T/lAB409+uqkzwVmv19B0eDL29RASFd8fTtw11E8Zu92UoFxEAQiQdYvjWBAzppUEIwLl20cTzvaZAxiMNCEfgh3gvhNetC5nHN3H/r3+J16i0CtDYd29WeP9imqlNIE37OWoIvamZVT+nwUztnTPCH6RE+2NwDL1wILxa7YVD8YAXcV6e5Y+ISC+XHkOI3KWHsVueovO7VgSO0KnH5MNp2FI8UsYxy8Ck0jIZ1ifR/zrbftoy74FueYhNvQuL4iRG4pkQTfCCMpLx5XH0ilSGRMgdZoiPpjgGB9PX1xypREKOeill7Lep3Kw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6448.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(6133799003)(18002099003)(4143699003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0lrUmVSTUI5NTZKb09DQlRmalNIQlJ6dFNmWkdJWmxKMUlTdDBSeVVoWDh5?=
 =?utf-8?B?TXA1S0o5Qy9VYTY4WEEreFJ1K3dsVktnTUpTdURuc1FnZHpmQXZhcVpIUlF5?=
 =?utf-8?B?OEpDdTJxNVFTZEMzbjlBbGhVUUxYUmw2MFd4MlhpUGpkc1pNRzZTa25nTWpT?=
 =?utf-8?B?UDMyVGIvSWZObS81THR5dUdRYUV0SjRzYzJCUE56L0RqbEhVcGkzRjJnZFVZ?=
 =?utf-8?B?RHZrS1ZHSEVZK0s3Rm1zTnZzZTZQUFZ5ZmlwMTJmRWdHS2ZEUU1Dam8xV1NV?=
 =?utf-8?B?MGJWOWUxQi9RYlVvSVp4RHVBTFR6U1VrdVIyalFYZFc3RnJiQ2FYMmF4SnZ5?=
 =?utf-8?B?VEZOTWxSL0NmeFovUzc0eXE5OCtyTTFJVkdZRlJkSGxTZWZTT3J3Q21FWk5J?=
 =?utf-8?B?VSt5MERmTFdWSDlublR4aGFKYWdQS3dBZEowenlYTERaa3dxNXovWHNnelov?=
 =?utf-8?B?MUxoVmJnaFdNTllxMnB1ek1QVkY5bUNtNGdJaURTdk85V2VjaklQMXphVE40?=
 =?utf-8?B?alJrZ1I1NjNlQnhhZWxyOFJic1RTT2JzdmxnYWJEUHArazFzSTh3MUtZZm5h?=
 =?utf-8?B?NjU2UWNLd210RTNRTzBtMHJDUC9tVnpReXhJQWk3Q2lnS1RMT0p4S0c3cXlV?=
 =?utf-8?B?UUNMMTFkaTFnNXlKSitVZTU0WHE4bElyVElHVkluRlZhTU5OZVYrS04rUWpM?=
 =?utf-8?B?MWFNYkV4d2xDZ3BvWXNWcFFzOVJSMTFEL2p2VHdWUzhkUnNrQklQRXNsQ2sw?=
 =?utf-8?B?TzRtOE0zanEvRWZqVVgydTUyTXFYMnQzRzFCc1oyS2NISzUwN2FLMHNnUTRS?=
 =?utf-8?B?aUF0MEdlSmQwWE8zUkRHbVowTGZaSUFMNGJEZkRqaGFyMDVHM1N4RWFTSXU2?=
 =?utf-8?B?MFlaTE9Gd2RPdVNHZTQ4RGtmK0ZVaUluK0lYV3VzNWhkMUpaVUZKRHlESUwx?=
 =?utf-8?B?RjhMQXZlRWEzNTlFa0ZwWUZXaWtLQmpRYmgrckdKYWZOd3B1ZjUxeTVUczho?=
 =?utf-8?B?OTk3K2J2MjhPR1gxNnMySTJkMWlXSnNXdHRCRW9kdTBkUmQ4ZmwwSms5OHh4?=
 =?utf-8?B?dWxjYU5mR1NBK01TcXcxdVh2NlBRME84dURyNnRKOWlhd3JERlFxSTFCZG5N?=
 =?utf-8?B?RGJLaXVtcFhHRDI2ckFHaUg2bHBtR3J2WHA1dmJQMFlEckNtUGhKVDFkcFNM?=
 =?utf-8?B?eDRPWkpvWm0vcFBPNmJJSEpWb0RqbDVaaWRsa1pxRnBNOGFKNGIzcjZxcGxu?=
 =?utf-8?B?WGF3SFR0Q3lsOEg5MzVqNlRma0RXYXpDVldsZGxjQTJyK0FXcEZhcDRrMWVY?=
 =?utf-8?B?ZjVLWHFGZzNvbUVGRWNHTkZYN0orSFJpemRWQ1Q0dzYrRk5kOWw2ZHhScWlU?=
 =?utf-8?B?b2dXbEYxZnl0VTJtSDVWOWtWNk5VaVNaSFlmVk1VTlpEMEhTTnlPREtpeTlu?=
 =?utf-8?B?VENJTUV0aFUvMjNrdkg5aGF6ZkhGNHozK3BNRDN3V0VhZ0ZOLzVNRlY5Tms4?=
 =?utf-8?B?YXp6aU1wM3pCb0oxWitRb20rMmxCN1QzN3VYWHhBT3ExNEZzYnVzZHdsaElD?=
 =?utf-8?B?djg0N0g0b3NESWFSVStWTkQ5V1VyakZuSWl4RHFYbEprWE55a1U1Q2Zxd1RB?=
 =?utf-8?B?eTY0bUZtV3dUVWxTUjNOcGZCMTJ6bHNtWHJZOFFsMDJJZFhvT01xa0UyOVZ3?=
 =?utf-8?B?d0ZmbFlwSFJaVEU0OEZsdVNRaXNwbVQ2elJNOEU5KzRocFp6Y1VIU1dtN21l?=
 =?utf-8?B?cm5tdStYTWx3MEg2MTk0MjlxWGtFcFFFM08vcVlML3VCM1BiYnBMQVRrdTND?=
 =?utf-8?B?MGs1VTRwdTNHOU8xZkNzbXA3dmpIZ3ZIdmZqVVAwbXJ3M2p2QVBBVmZ2NVRi?=
 =?utf-8?B?WUMvLzNDaGJRcnMvbEJqSE1zTWJlM2kyKzNjSFdLZUtqVkorcXhYWnMwN2RB?=
 =?utf-8?B?MDRyOGk2TUp2Ky9UcDZOa0Q1R3JqOXN4TWVURWN4L1NGYkc2SGFrZzI0bkp2?=
 =?utf-8?B?WlI2Qm5HVGx1SElESDdYcDE2MjBJaDlSOUp2U2FkclNNNDE5OSs1MGVlYVlO?=
 =?utf-8?B?Z0xOKzlDSGlMSmQ0K1R1NDhDTzZIT0JnOHgzbUR2M0hBOTE3WUszeFVxbHk5?=
 =?utf-8?B?VnBzSGhVRm53VytVVkZHdmNGa255SmxKVEhTV29WRFVONVNub29CY2dCM1pz?=
 =?utf-8?B?NnFpK1E2aFdoWExNNnVCdTVZVnJ3cDNJeldlUjRCUUxxanRFWk9WU09SQjc1?=
 =?utf-8?B?MS9nZnFLOTRYSGk5WlJPLzNQTFNOSzJ1TW9iK2ZDc2YreFBjVUR5K01JcGly?=
 =?utf-8?B?bkJPdGkwcHNmTzVpeUJTSjk0SDNYRk1wWDk5VGhLbC85M0lGclJEZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e273421-bf1c-4c1b-932c-08ded23c38b8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6448.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 22:02:02.6151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +xsVoHvDsgb7TAHP+72RlPK7XUgq7OxMMNFQyYTiRUQwVnkgH6g5SJHUMdS7/CqCNUbP1Luxf5/24vCvsIRp4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7244

Hi Mathieu

Picking this back up now. Please see my replies inline below.

On 5/11/26 10:41 AM, Mathieu Poirier wrote:
> On Fri, 8 May 2026 at 10:59, Ben Levinsky <blevinsk@amd.com> wrote:
>>
>> Hi Mathieu,
>>
>>
>> On 5/8/26 8:47 AM, Mathieu Poirier wrote:
>>> Good morning,
>>>
>>> On Tue, Apr 28, 2026 at 07:26:33AM -0700, Ben Levinsky wrote:
>>>> Add a remoteproc driver for AMD soft-core processor subsystems
>>>> instantiated in programmable logic and using dual-port BRAM for
>>>> firmware storage and execution.
>>>>
>>>> The driver parses the firmware memory window from the remoteproc device
>>>> node's reg property, interprets that address and size in the
>>>> processor-local address space, and then uses standard devicetree
>>>> address translation through the parent bus ranges property to obtain
>>>> the corresponding Linux-visible system physical address.
>>>>
>>>> The resulting translated region is registered as the executable
>>>> remoteproc carveout and coredump segment.
>>>>
>>>> The processor is controlled through an active-low reset GPIO and a
>>>> subsystem clock. The clock is enabled before reset is released, and the
>>>> processor is kept in reset until firmware loading completes.
>>>>
>>>> The firmware-name property is optional, allowing firmware to be
>>>> assigned later through the remoteproc framework. Firmware images
>>>> without a resource table are also accepted.
>>>>
>>>> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
>>>> ---
>>>>  MAINTAINERS                         |   7 +
>>>>  drivers/remoteproc/Kconfig          |  14 ++
>>>>  drivers/remoteproc/Makefile         |   1 +
>>>>  drivers/remoteproc/amd_bram_rproc.c | 243 ++++++++++++++++++++++++++++
>>>>  4 files changed, 265 insertions(+)
>>>>  create mode 100644 drivers/remoteproc/amd_bram_rproc.c
>>>>
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index c871acf2179c..172539971950 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -1037,6 +1037,13 @@ S:    Maintained
>>>>  F:  Documentation/devicetree/bindings/w1/amd,axi-1wire-host.yaml
>>>>  F:  drivers/w1/masters/amd_axi_w1.c
>>>>
>>>> +AMD BRAM REMOTEPROC DRIVER
>>>> +M:  Ben Levinsky <ben.levinsky@amd.com>
>>>> +L:  linux-remoteproc@vger.kernel.org
>>>> +S:  Maintained
>>>> +F:  Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml
>>>> +F:  drivers/remoteproc/amd_bram_rproc.c
>>>> +
>>>
>>> There is no real advantage in adding this entry, checkpatch.pl should be
>>> sufficient.
>>>
>>>>  AMD CDX BUS DRIVER
>>>>  M:  Nipun Gupta <nipun.gupta@amd.com>
>>>>  M:  Nikhil Agarwal <nikhil.agarwal@amd.com>
>>>> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
>>>> index ee54436fea5a..9a2a887ede8a 100644
>>>> --- a/drivers/remoteproc/Kconfig
>>>> +++ b/drivers/remoteproc/Kconfig
>>>> @@ -23,6 +23,20 @@ config REMOTEPROC_CDEV
>>>>
>>>>        It's safe to say N if you don't want to use this interface.
>>>>
>>>> +config AMD_BRAM_REMOTEPROC
>>>> +    tristate "AMD BRAM-based remoteproc support"
>>>> +    depends on OF && COMMON_CLK && (GPIOLIB || COMPILE_TEST)
>>>> +    help
>>>> +      Say y or m here to support a BRAM-based remote processor managed
>>>> +      through the remoteproc framework.
>>>> +
>>>> +      This driver matches designs where executable firmware memory is
>>>> +      described in the BRAM-local address space and translated to
>>>> +      the system physical address space with standard devicetree address
>>>> +      translation.
>>>
>>> Not sure how this paragraph helps decide whether the driver should be enabled or
>>> not.  Please remove.
>>>
>>>> +
>>>> +      If unsure, say N.
>>>> +
>>>>  config IMX_REMOTEPROC
>>>>      tristate "i.MX remoteproc support"
>>>>      depends on ARCH_MXC
>>>> diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
>>>> index 1c7598b8475d..5c39664b50c3 100644
>>>> --- a/drivers/remoteproc/Makefile
>>>> +++ b/drivers/remoteproc/Makefile
>>>> @@ -11,6 +11,7 @@ remoteproc-y                               += remoteproc_sysfs.o
>>>>  remoteproc-y                                += remoteproc_virtio.o
>>>>  remoteproc-y                                += remoteproc_elf_loader.o
>>>>  obj-$(CONFIG_REMOTEPROC_CDEV)               += remoteproc_cdev.o
>>>> +obj-$(CONFIG_AMD_BRAM_REMOTEPROC)   += amd_bram_rproc.o
>>>>  obj-$(CONFIG_IMX_REMOTEPROC)                += imx_rproc.o
>>>>  obj-$(CONFIG_IMX_DSP_REMOTEPROC)    += imx_dsp_rproc.o
>>>>  obj-$(CONFIG_INGENIC_VPU_RPROC)             += ingenic_rproc.o
>>>> diff --git a/drivers/remoteproc/amd_bram_rproc.c b/drivers/remoteproc/amd_bram_rproc.c
>>>> new file mode 100644
>>>> index 000000000000..9383964b6046
>>>> --- /dev/null
>>>> +++ b/drivers/remoteproc/amd_bram_rproc.c
>>>> @@ -0,0 +1,243 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +/*
>>>> + * AMD BRAM-based Remote Processor driver
>>>> + *
>>>> + * Copyright (C) 2026 Advanced Micro Devices, Inc.
>>>> + *
>>>> + * This driver supports soft-core processors (MicroBlaze, MicroBlaze-V, or
>>>> + * similar) instantiated in AMD programmable logic, using dual-port BRAM
>>>> + * for firmware storage and execution.
>>>> + *
>>>> + * The firmware memory (BRAM) is described in the processor-local address
>>>> + * space and translated to the Linux-visible system physical address with
>>>> + * standard devicetree address translation.
>>>> + *
>>>> + * Reset is controlled via GPIO connected to Processor System Reset IP.
>>>> + */
>>>> +
>>>> +#include <linux/clk.h>
>>>> +#include <linux/dma-mapping.h>
>>>> +#include <linux/gpio/consumer.h>
>>>> +#include <linux/io.h>
>>>> +#include <linux/module.h>
>>>> +#include <linux/of.h>
>>>> +#include <linux/of_address.h>
>>>> +#include <linux/platform_device.h>
>>>> +#include <linux/remoteproc.h>
>>>> +
>>>> +#include "remoteproc_internal.h"
>>>> +
>>>> +/**
>>>> + * struct amd_bram_rproc - AMD BRAM-based remoteproc private data
>>>> + * @dev: device pointer
>>>> + * @reset: GPIO descriptor for reset control (active-low)
>>>> + * @clk: processor clock
>>>> + */
>>>> +struct amd_bram_rproc {
>>>> +    struct device *dev;
>>>> +    struct gpio_desc *reset;
>>>> +    struct clk *clk;
>>>> +};
>>>> +
>>>> +static int amd_bram_rproc_mem_map(struct rproc *rproc,
>>>> +                              struct rproc_mem_entry *mem)
>>>> +{
>>>> +    void __iomem *va;
>>>> +
>>>> +    va = ioremap_wc(mem->dma, mem->len);
>>>> +    if (!va)
>>>> +            return -ENOMEM;
>>>> +
>>>> +    mem->va = (__force void *)va;
>>>> +    mem->is_iomem = true;
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static int amd_bram_rproc_mem_unmap(struct rproc *rproc,
>>>> +                                struct rproc_mem_entry *mem)
>>>> +{
>>>> +    iounmap((void __iomem *)mem->va);
>>>> +
>>>> +    return 0;
>>>> +}
>>>
>>> The above 2 are identical to what is found in xlnx_r5_remoteproc.c.  Please
>>> coordinate with Tanmay to split that into common code that can be reused by both
>>> drivers.
>>>
>>>> +
>>>> +static int amd_bram_rproc_prepare(struct rproc *rproc)
>>>> +{
>>>> +    struct amd_bram_rproc *priv = rproc->priv;
>>>> +    struct rproc_mem_entry *mem;
>>>> +    struct resource res;
>>>> +    u64 da, size;
>>>> +    int ret;
>>>> +
>>>> +    ret = of_property_read_reg(priv->dev->of_node, 0, &da, &size);
>>>> +    if (ret) {
>>>> +            dev_err(priv->dev, "failed to parse executable memory reg\n");
>>>> +            return ret;
>>>> +    }
>>>> +
>>>> +    if (!size || size > U32_MAX) {
>>>> +            dev_err(priv->dev, "invalid executable memory size\n");
>>>> +            return -EINVAL;
>>>> +    }
>>>> +
>>>> +    if (da > U32_MAX) {
>>>> +            dev_err(priv->dev, "invalid executable memory address\n");
>>>> +            return -EINVAL;
>>>> +    }
>>>> +
>>>> +    ret = of_address_to_resource(priv->dev->of_node, 0, &res);
>>>> +    if (ret) {
>>>> +            dev_err(priv->dev, "failed to translate executable memory reg\n");
>>>> +            return ret;
>>>> +    }
>>>> +
>>>> +    mem = rproc_mem_entry_init(priv->dev, NULL, (dma_addr_t)res.start,
>>>> +                               (size_t)size, da,
>>>> +                               amd_bram_rproc_mem_map,
>>>> +                               amd_bram_rproc_mem_unmap,
>>>> +                               dev_name(priv->dev));
>>>> +    if (!mem)
>>>> +            return -ENOMEM;
>>>> +
>>>> +    rproc_add_carveout(rproc, mem);
>>>> +    rproc_coredump_add_segment(rproc, da, (size_t)size);
>>>
>>> I'm pretty sure you want @res.start instead of @da, and resource_size(&res)
>>> instead of @size.
>>>

  For the coredump segment, I agree with using resource_size(&res) for
  the size, but I think the address should remain @da rather than
  @res.start.

  The binding describes the reg property in the processor-local address
  space and uses the parent bus ranges property only to translate that
  window to the Linux-visible system physical address. That means @da and
  @res.start are not necessarily in the same address space. For example,
  the BRAM can appear at 0x0 to the soft-core processor while Linux sees
  the same memory at a translated system physical address such as
  0xa0000000.

  rproc_coredump_add_segment() stores the address as a device address, and
  the coredump path later resolves it through rproc_da_to_va() against the
  registered carveout's device address. Since this driver registers the
  carveout with @da as the device address and @res.start as the host-side
  physical address used for ioremap_wc(), passing @res.start to
  rproc_coredump_add_segment() could fail to match the carveout when those
  addresses differ.

  So in the respin I plan to use:

          rproc_coredump_add_segment(rproc, da, resource_size(&res));

  Does that match your expectation for this address model?

Thank you
Ben

>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static int amd_bram_rproc_start(struct rproc *rproc)
>>>> +{
>>>> +    struct amd_bram_rproc *priv = rproc->priv;
>>>> +    int ret;
>>>> +
>>>> +    /* Enable clock before releasing reset */
>>>> +    ret = clk_prepare_enable(priv->clk);
>>>> +    if (ret) {
>>>> +            dev_err(priv->dev, "failed to enable clock: %d\n", ret);
>>>> +            return ret;
>>>> +    }
>>>> +
>>>> +    /* Deassert reset and let the processor run. */
>>>> +    ret = gpiod_set_value_cansleep(priv->reset, 0);
>>>> +    if (ret) {
>>>> +            dev_err(priv->dev, "failed to deassert reset: %d\n", ret);
>>>> +            clk_disable_unprepare(priv->clk);
>>>> +            return ret;
>>>> +    }
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static int amd_bram_rproc_stop(struct rproc *rproc)
>>>> +{
>>>> +    struct amd_bram_rproc *priv = rproc->priv;
>>>> +    int ret;
>>>> +
>>>> +    /* Assert reset before disabling the processor clock. */
>>>> +    ret = gpiod_set_value_cansleep(priv->reset, 1);
>>>> +    if (ret) {
>>>> +            dev_err(priv->dev, "failed to assert reset: %d\n", ret);
>>>> +            return ret;
>>>> +    }
>>>> +
>>>> +    /* Disable clock after asserting reset */
>>>> +    clk_disable_unprepare(priv->clk);
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static int amd_bram_rproc_parse_fw(struct rproc *rproc,
>>>> +                               const struct firmware *fw)
>>>> +{
>>>> +    int ret;
>>>> +
>>>> +    ret = rproc_elf_load_rsc_table(rproc, fw);
>>>> +    if (ret == -EINVAL) {
>>>> +            dev_dbg(&rproc->dev, "no resource table found\n");
>>>> +            return 0;
>>>> +    }
>>>> +
>>>> +    return ret;
>>>> +}
>>>
>>> This too should go in common code or simply replaced by
>>> rproc_elf_load_rsc_table() in @amd_bram_rproc_ops - the choice is yours.
>>>
>>> Thanks,
>>> Mathieu
>>
>>   Thanks for the review.
>>
>>   I went through the remoteproc drivers to scope the cleanup points you
>>   called out.
>>
>>   For the plain carveout map/unmap callbacks, the same ioremap_wc()/iounmap()
>>   pattern exists not only in amd_bram_rproc and xlnx_r5_remoteproc, but also
>>   in rcar_rproc, st_remoteproc, stm32_rproc, imx_rproc, and imx_dsp_rproc.
>>
>>   The xlnx_r5 TCM path is close as well, but that one still needs a wrapper
>>   since it clears the memory after ioremap_wc().
>>
>>   For the optional resource-table parsing, amd_bram_rproc and xlnx_r5_remoteproc
>>   share the same pattern of treating only -EINVAL from rproc_elf_load_rsc_table()
>>   as non-fatal. PRU is similar, but has additional firmware parsing after that.
>>   Other drivers such as rcar/imx/imx_dsp/stm32 also tolerate missing resource
>>   tables, but their current behavior is not identical since they flatten all
>>   errors to success and only log.
>>
>>   For the next revision, would you prefer the following approach?
>>
>>   1. Add a small common helper for the plain carveout ioremap_wc()/iounmap()
>>      case and use it in amd_bram_rproc and xlnx_r5_remoteproc.
>>
>>   2. For the optional resource-table handling, either:
>>      - add a small common helper for the "missing table is OK" case
>>        (i.e. return 0 on -EINVAL and propagate other errors), and use that
>>        in amd_bram_rproc and xlnx_r5_remoteproc, or
> 
> I would prefer to go with the common helper that returns 0 on -EINVAL
> and propagates other errors, and apply it to other architectures such
> as stm32, rcar, imx and imx_dsp.
> 
>>      - drop the custom AMD parse_fw() path and use rproc_elf_load_rsc_table()
>>        directly, which would make the resource table mandatory there.
>>
>>   Also, for the plain map/unmap helper, should I keep the cleanup scoped to
>>   the drivers directly involved here, or would you prefer that I fold the
>>   other exact-match users (rcar, st, stm32, imx, imx_dsp) into the same
>>   cleanup patch as well?
>>
> 
> Proceed with the other exact-match as well.
> 
>>   I want to make sure I take the direction you prefer before respinning.
> 
> I think the best approach is to send out a cleanup patchset with the
> above changes, followed by another respin of this set once the cleanup
> is merged.
> 
> Thanks for being proactive.
> 
>>
>>   Thanks,
>>   Ben
>>>
>>>> +
>>>> +static const struct rproc_ops amd_bram_rproc_ops = {
>>>> +    .prepare        = amd_bram_rproc_prepare,
>>>> +    .start          = amd_bram_rproc_start,
>>>> +    .stop           = amd_bram_rproc_stop,
>>>> +    .load           = rproc_elf_load_segments,
>>>> +    .sanity_check   = rproc_elf_sanity_check,
>>>> +    .get_boot_addr  = rproc_elf_get_boot_addr,
>>>> +    .parse_fw       = amd_bram_rproc_parse_fw,
>>>> +};
>>>> +
>>>> +static int amd_bram_rproc_probe(struct platform_device *pdev)
>>>> +{
>>>> +    struct device *dev = &pdev->dev;
>>>> +    struct amd_bram_rproc *priv;
>>>> +    const char *fw_name = NULL;
>>>> +    struct rproc *rproc;
>>>> +    int ret;
>>>> +
>>>> +    ret = rproc_of_parse_firmware(dev, 0, &fw_name);
>>>> +    if (ret < 0 && ret != -EINVAL)
>>>> +            return dev_err_probe(dev, ret,
>>>> +                                 "failed to parse firmware-name property\n");
>>>> +
>>>> +    rproc = devm_rproc_alloc(dev, dev_name(dev), &amd_bram_rproc_ops,
>>>> +                             fw_name, sizeof(*priv));
>>>> +    if (!rproc)
>>>> +            return -ENOMEM;
>>>> +
>>>> +    priv = rproc->priv;
>>>> +    priv->dev = dev;
>>>> +
>>>> +    /* Get the processor clock */
>>>> +    priv->clk = devm_clk_get(dev, NULL);
>>>> +    if (IS_ERR(priv->clk))
>>>> +            return dev_err_probe(dev, PTR_ERR(priv->clk),
>>>> +                                 "failed to get clock\n");
>>>> +
>>>> +    /*
>>>> +     * Keep the processor in reset until remoteproc has finished loading
>>>> +     * firmware into the executable memory window described by reg and
>>>> +     * translated through the parent bus ranges property.
>>>> +     */
>>>> +    priv->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
>>>> +    if (IS_ERR(priv->reset))
>>>> +            return dev_err_probe(dev, PTR_ERR(priv->reset),
>>>> +                                 "failed to get reset gpio\n");
>>>> +
>>>> +    rproc->auto_boot = false;
>>>> +
>>>> +    ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
>>>> +    if (ret)
>>>> +            return dev_err_probe(dev, ret, "failed to set DMA mask\n");
>>>> +
>>>> +    platform_set_drvdata(pdev, rproc);
>>>> +
>>>> +    ret = devm_rproc_add(dev, rproc);
>>>> +    if (ret)
>>>> +            return dev_err_probe(dev, ret, "failed to register rproc\n");
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static const struct of_device_id amd_bram_rproc_of_match[] = {
>>>> +    { .compatible = "xlnx,zynqmp-bram-rproc" },
>>>> +    { /* sentinel */ },
>>>> +};
>>>> +MODULE_DEVICE_TABLE(of, amd_bram_rproc_of_match);
>>>> +
>>>> +static struct platform_driver amd_bram_rproc_driver = {
>>>> +    .probe = amd_bram_rproc_probe,
>>>> +    .driver = {
>>>> +            .name = "amd-bram-rproc",
>>>> +            .of_match_table = amd_bram_rproc_of_match,
>>>> +    },
>>>> +};
>>>> +module_platform_driver(amd_bram_rproc_driver);
>>>> +
>>>> +MODULE_DESCRIPTION("AMD BRAM-based Remote Processor driver");
>>>> +MODULE_AUTHOR("Ben Levinsky <ben.levinsky@amd.com>");
>>>> +MODULE_LICENSE("GPL");
>>>> --
>>>> 2.34.1
>>>>
>>>
>>

