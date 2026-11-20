Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.67
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795197058;
	b=00U4LkC8/4rYlDNf0110wQSM3m6H1RhGLqvTw0ZJlA0RRT2X26YKo077yOF2nL+ZxBmZ
	 8BQX0d5GOTN+0KMRDmYWSZZLgWxdlPBl6oe63pqjh3dmYudLlzvQKmHTDC90zMAQjn/rI
	 TOx9epSenfL3F8Z1vSquDIZJ4QCYnHeryZ3T1iyaVBFe2Qt/7lJNEEwzH1kmohOA+78J9
	 FQ7tpgY3o0oHCexzyltaG7G4tCHuNUwERpwxWJUk/auS3Rv2PGxpV7OEPW0Hor03wJ9lD
	 x2U3syWTJ9ItkG9zZFTzEfM2GEqU+csYRurUVY84MNxVa1gBnye9WLHFoAjKpFcl/dg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795197058;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:CC:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=ZAaM3PPcYj6prax/cLNFDANHV9je3gyM288P/Z0iZrc=;
	b=zddhBwSKbWjIC+5HI4n2Vg7XVLlVBd2UUco3penTAyhk2CblGsL1qor4UNORzzVhPVOi
	 U41IUSnKibsqZMKAagOcwcexvLNZOPNracYbObvJLCpBw/DdnKiUtduEDoXXev0eVkPlb
	 rJH9JdJnpMPaNbPALaUNh8JJKvTUbZ/GiHnEV16Cn64ZJLMz/x1Q8vkz2DM/b75wIgO5z
	 HoAL1VSl4Z5gfsWl6BsJmllEa7Pgpm37ghAgKuJT9zCKVnUdgrqHn48rEOfkbN9IVnDxY
	 aoN2OsvHXGY700hUI3Ytk/6AWfUi1IAMPaUtYAaqKqzlj41vBI5d6HqQMdqCCdy1Y/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=LSKfXDvj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.67
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011067.outbound.protection.outlook.com [40.107.130.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E6A60A2604;
	Fri, 20 Nov 2026 17:50:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32E6A60A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=LSKfXDvj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NswFMb5K0u7CKNZMTW4ZKfQPkw1L8zP9RuFqwrpgSVI30uj1EBWGfhLng0QZyI+FH1NfNvnv1KVrCYrZrbjdBSSiWRANNeL839TrnLV6JAz0kn32LnHupWxEJE/5ldh2Wz4v4uUSCq4SErczcAXXI00pzQdYdDA2qd5+hu9L4B/mnA896JQeKCiqSv8iH/3V+V79U0pfRVsM1Zh7Kau146puqFVjoqPl5LzjzhfvdeV7c4o3Wz8MY7XZ8X/yFUea5/n0d5oJZmjaXf41CNLkpHJJU/oG0DhMfVfBbAaJhdYyrLvNHjlr8qzjHtkG5JQ5aT/si9CaMxMY+zSowIYoJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZAaM3PPcYj6prax/cLNFDANHV9je3gyM288P/Z0iZrc=;
 b=K6o/Phrkyd+uYR/Qq5bLxHbtS4L3DI0egEmOKKMBn7b07+yzOS64HsW4tjA1KCueXHIHNSVEYo13e99VBjCRtQZfDSWyXIkSR3quNfhdhySa/Vg2/8X/MNjMvXMkITRV7icyUzLN6+0IK63tqVikaWZrTV2EvmuxeSCej5osW58Wfv9Ct8t4+BzaDX/xwGoLR8qbCsUn5rRxSlmY+VcUvs/eOPMtsbEEahVvE/q4V+KXeZDXulH0cfh5JdG+MBm9KkhvCus1MCCMcDxT/7uJB5QB8CKIZej5LXCOug4T9NQFafPstlm/ox9K2SyA3toXxP+Tr/9BIg18rWl7wLP31w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZAaM3PPcYj6prax/cLNFDANHV9je3gyM288P/Z0iZrc=;
 b=LSKfXDvjM8w96x5ybS+34XdjlYnWhSebC4V9HCtICf8elNjIr22G3f/uZVSsrydot4wHj0hoZ5Lw+0rcOSE4HCeR/U7k0gwcyymBD6VDlDYLNdZltSywAuQw6rJzxP9+Nfc2I/0ZDUGN+JzfhQW8kNvawhjJj9a8ZcordbMB3SBo5KpJrvv26Gq9q5C5FnQXQYPlEt2JljM5y9A2q9RDMev8ncZezHnNULHdwVTNj9GtCLtkUTzqYf5DoYUnsYW5TyaKtiWxJGH7eCM/NBTjluxUnzbziyu3SVSt75jw9z4vS0vbyON6+CTCMPShX7QhIL0u1Ycxl69fewDkvjGllA==
Received: from AS4P190CA0006.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5de::9)
 by GV2PR10MB9586.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:2f8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.8; Fri, 20 Nov
 2026 17:50:50 +0000
Received: from ZR1PEPF0000E45E.eurprd04.prod.outlook.com
 (2603:10a6:20b:5de:cafe::31) by AS4P190CA0006.outlook.office365.com
 (2603:10a6:20b:5de::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 17:50:50 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 ZR1PEPF0000E45E.mail.protection.outlook.com (10.167.241.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 17:50:49 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Fri, 20 Nov
 2026 18:51:36 +0100
Received: from [10.48.87.127] (10.48.87.127) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 20 Nov
 2026 18:50:49 +0100
Message-ID: <4c542301-a80d-4f14-8651-1307ac783794@foss.st.com>
Date: Fri, 20 Nov 2026 18:50:47 +0100
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] virtio_rpmsg: fix config space alignment
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Francesco Valla
	<francesco@valla.it>, <openamp-rp@lists.openampproject.org>
CC: Bjorn Andersson <andersson@kernel.org>, Tanmay Shah <tanmay.shah@amd.com>,
	<linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20261101-rpmsg-config-size-v1-1-65686b445b22@valla.it>
 <au4QVFyk7Zzc6y2u@p14s> <av8V18TntRP2U6hQ@p14s>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <av8V18TntRP2U6hQ@p14s>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZR1PEPF0000E45E:EE_|GV2PR10MB9586:EE_
X-MS-Office365-Filtering-Correlation-Id: 214520d4-be65-4d60-d308-08df472ed04b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|376014|36860700016|1800799024|18002099003|22082099003|4143699003|261022075727099003|11063799006|261026121527099003|261102123227099003|56012099006|261021121427099003|261022105027099003|261028144727099003|10067099003|261026140227099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	AHRaUszRBUst8pgjIl7e4DVDL1FMs1zDXw61KVArygEBLwb4kMarljzVL5GFsR8HFnECYXiPBvMDjkZTnWPCauENTfQaFqXfWfZJx6Q4Lo6gWR5HIvn6mO9IXCoeWljfEkmH0RTaoibAjOGx3ClBkwUYBh89VTjIB2KaLmTR7K7Vxh6kDjLTDqJFv6KUpmLbshykntFRFbLZ2rqTco0Pq0RqgJ+GOWAQUTKjFX9HBXHr4a4VnPR5tobhtfkCqwwtY062cC67B5/dq/svOYwyU+rDezJytVXeR956sZ5hzU58IQ855O/K7tw5j1fTw+QOu9BhRmJgWk50v3zUd9Zm8eAAXTyixcjm65uGZBEPY568AfEJMRUQeH/7JMWfqHaD2FR1Js2DODcfv8uaUq9KTmPwSlwRX5cyDBBvI9UODGlxpJuyzGbpXgq1MIZ9YxHPyL/lW8Kza1vCXWFaHRJ5EPsZeukXEJeq9Ceranc4T3fTayd7u8fY7jVX8NPxwooCwj4QEAAso5fbIxU8r4Quvya8Mo7uKjl5R5StDInhtbrQ/kZ/Bav9OH8tQ/7f86HBQ+YodZ6akNGIiFYOjJNRKtx8eQppxGRp/xLvE503T/HafD19uoBW7hu1FW6Cuikpfl68T1vqC8o6n/WnC4DBnYeQju+HAof0axkYv+vEl+Eum9ZTPrzhHDFDzyIdjUZmzpNjMTrhLRPwNsRpA6QNVw==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(36860700016)(1800799024)(18002099003)(22082099003)(4143699003)(261022075727099003)(11063799006)(261026121527099003)(261102123227099003)(56012099006)(261021121427099003)(261022105027099003)(261028144727099003)(10067099003)(261026140227099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	s1o5A4/w61b0LfVmTsQS0Tqttd7AkgOL5AM0GrMJySavVLhxVxusZor7lmFzIrp5GKJxB35hPnPrIbO9ln1ADbxR/iDwgSzLv1nRe7BeTJeC6NTu8QkyZ1zpPmyxDPvXuO3+ZbQzmeHVyxoN0sAj+7bWJ6v5qclxG5S8lD3rwFBT+1U/8T70r//O4hXs3/GVHe69k4F/+uJgOtrs4mtiXKUWfugIoLtbGU19DDz1oBm4qEJVTpUcG9tlclBGFwpeqqz7R9S7k29EfHmP8XG/KECvj4ksQJcoGcVA/BQwxuMdOOe/3QKEPVdNP1n1YDyT3bYgQ1cTIhSTZKhGkTyPpLD8jYX28CKM7BugCIv0fH5sIU67CfGwNP4RXwWNXxM9JZvFQEQX0FgpsH4AwmCPvWL5oJNVu0tZI7cCcRQOOrkLmaWKtGRXme1maqpXb3pJ
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 17:50:49.8268
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 214520d4-be65-4d60-d308-08df472ed04b
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	ZR1PEPF0000E45E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB9586

Hello,

Sorry it goes out of my radar.

On 11/19/26 16:29, Mathieu Poirier wrote:
> [Adding openAMP mailing list]
> 
> Heads up OpenAMP people, I will merge this patch in a week.
> 
> Thanks,
> Mathieu
> 
> On Fri, Nov 06, 2026 at 11:37:24AM -0600, Mathieu Poirier wrote:
>> On Sun, Nov 01, 2026 at 02:54:03PM +0100, Francesco Valla wrote:
>>> The comment for virtio_rpmsg_config says that this structure is
>>> naturally aligned to 32 bits, and this is desirable by some
>>> architectures that don't get along with unaligned accesses.
>>> The content of the structure itself however isn't aligned, and the
>>> __packed attribute prevent the compiler to add this alignment.
>>>
>>> Fix this by adding a padding byte.
>>>
>>> Fixes: ca96ea25e51a ("rpmsg: virtio_rpmsg_bus: Get buffer size from config space")
>>> Signed-off-by: Francesco Valla <francesco@valla.it>
>>> ---
>>> Hello,
>>>
>>> unfortunately I missed this when the original patch set was sent, but I
>>> think it's worth fixing (or at least discussing) this now before it
>>> enters a stable kernel.
>>>
>>> The same support in open-amp has already been merged [1], but maybe it
>>> can be fixed before the next release there too?
>>>
>>> Another, lower-impact solution would be to fix the comment, but that can
>>> then led to issues on architectures that does not support unaligned
>>> accesses (e.g.: AMR Cortex-M0).
>>>
>>
>> Thanks for bringing this to my attention.  I agree with this patch.  I will give
>> Arnaud a couple of weeks to reply to this email though.
>>   
>>> Thank you
>>>
>>> Francesco
>>>
>>> [1] https://github.com/OpenAMP/open-amp/commit/744376f566c3ec7e06a7d093d785295b78aa486f
>>> ---
>>>   include/linux/rpmsg/virtio_rpmsg.h | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/include/linux/rpmsg/virtio_rpmsg.h b/include/linux/rpmsg/virtio_rpmsg.h
>>> index 0872cbca4593..d24fedb63023 100644
>>> --- a/include/linux/rpmsg/virtio_rpmsg.h
>>> +++ b/include/linux/rpmsg/virtio_rpmsg.h
>>> @@ -23,6 +23,7 @@
>>>    *
>>>    * @version:	version of this structure, currently %RPMSG_VDEV_CONFIG_V1.
>>>    * @size:	size of this structure in bytes.
>>> + * @reserved:	padding, reserved for future usage.
>>>    * @txbuf_size:	Tx buf size from remote's view. For Linux this is rx buf size.
>>>    * @rxbuf_size:	Rx buf size from remote's view. For Linux this is tx buf size.
>>>    *
>>> @@ -33,6 +34,7 @@
>>>   struct virtio_rpmsg_config {
>>>   	u8 version;
>>>   	__virtio16 size;
>>> +	u8 reserved;
>>>   	/* The tx/rx individual buffer size (if VIRTIO_RPMSG_F_BUFSZ) */
>>>   	__virtio32 txbuf_size;
>>>   	__virtio32 rxbuf_size;


What about using a u16 for the version instead?
Even if we never use the MSB of the field, it seems cleaner to me than
adding a reserved field.
Indeed, we can consider the config space header as containing the
version and the size. The rest is version-dependent, including the
reserved part.

Regards,
Arnaud

>>>
>>> ---
>>> base-commit: cbbddb6b08cc9900a87cccaa9b22bbe06aa4f50a
>>> change-id: 20261101-rpmsg-config-size-0dbe9ea63c6d
>>>
>>> Best regards,
>>> --
>>> Francesco Valla <francesco@valla.it>
>>>

