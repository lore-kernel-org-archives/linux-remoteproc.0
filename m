Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.56
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795421442;
	b=GAOfTKc/4vUP3wxtSP3YJAHBqJXPeKKiLCEVHO8IbYlRPsuEbJjYGYJpUE9zuqj/HL9k
	 OlbNE4IBofHWmwrnQSWaPl77aGJXyWN9ya02Xp3qfotjgOmnaRvpwhuQ6cZ994x8QSy/d
	 u1tnDC0VBvo3bZEa7Bv9dHpV8pnfc/aGB5EX90S1UwCV7rLDzN8z5OwOfDB1SbPsRI+dC
	 wqlyF4v97R8YLbPFluxzmNFHz3TQAwvMJaye1qfcuTHQrbPvWLbhJrZEDj3MrM56aC7sk
	 cCCMDMKKaGWCTxVZgpBq4c+gxLqvmGdloRRB/t26JQhx0jn5c93qJwiXSVWSbpDFmhg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795421442;
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
	bh=dLjLFV4EG1RhcznyhC9UPDQ+cHq3oel+3eQNzopaQBA=;
	b=zJ7gynk9krZf9xn7g5aIgiI6QYCEj9BJKZQp6GBLqKaI9etaiN+B8uRVXiAHdI6tdSP5
	 ZrdBRHVFiq+60zWde+AbrJuHOIB3T/QI2sD4SkXoi9NhGJZEs2c/aOMdX78hc0cvm3iZn
	 2zw3k5L8UyT8T+Snxoqmsc71f6GIQHg9J2wG9zkUB9lPVd6uYxYvDe4JEv4epywQiSYR4
	 zwLfAKzrs2tVBA1r4rk1IcjX30F/+fTHy/obF/JToCUQcDxn3mk5QIBMy0xK3ADwza7w8
	 tXVwfanPmjp8iHxkgME1CBS53YIC5RDsVsRDGGoWZ/k5P4X0r94oougYBTZRP1bLmdA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=LKozKBeU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.56
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010056.outbound.protection.outlook.com [52.101.69.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93490606AE4C;
	Mon, 23 Nov 2026 08:10:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93490606AE4C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=LKozKBeU
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i4BzR5GqVAAiEeKcP3qOjXUV12S9ahUwEhsx4x25nZ0rzCsaR/QqnhiRNOfyLRLCVIXwzupo0Q/ukH6OFhiEwocYbYEnOYqHX1Ry99jUOjIBSMxjJICzfJIgDdS24W0JiBTy3dwepozMUpavojyclD1q/XEAbQjuHTvHbT6tQECgYwXiEthgog9MIyHNrL2d76cP7n7xiBhYLYC+IM0qpEM0rR46VtiB9tdqV1Fgliznkk30J2jLQEikaOTvtRL4vBzMl3QQqnN+VR11NM7Ybfum55ywvfGpKd8UhMcyUBZJ+s2vTECtbZ3mP+Ig9cMfOWgZ1HKwPVF26CdxCYHAGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dLjLFV4EG1RhcznyhC9UPDQ+cHq3oel+3eQNzopaQBA=;
 b=iQSAGS/bqMYNXAGMzmCz0Le77EGPxbvg3UNk7rYm5t3TA2XBoOXKk+n0pLxqYSiHEtBiLmVdw8s1MgL0Z4wHRY2X9H7LUiiAblgIUbIn1dTPi3gaDSzafybFcG6z2kNg6vXdbfWRAbuzrXGCGw9EZIG7gYc7uwzDZ/0yo/tKJtv/jyzGaWdZ2oakrIP9rrcjOJYUzbUy3O9RYYUga4ZYYrWY70UfbavNlSQWmyyFVNHvvBNQvsRAv0xEoz5VACM5TqW2d9DBi0o8hTDvMaBqmNb+RIXSGq75F54JVLS+1293URBGHyE23NUnmZLxLtGEklqf2dbSs4QzRDzD+CLL3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=valla.it smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dLjLFV4EG1RhcznyhC9UPDQ+cHq3oel+3eQNzopaQBA=;
 b=LKozKBeUn+EcbJ+C1YDSGfXT5NdjJBrjwPJzpambB9uRZJuXVmwnklG5f8GyTGtzCmR+avJqvngXdEpd0yxMDnQfmkoAgdBhRFm700h9BrjWUODHP+BpypJlimntxHr3JX4tOTPBn1WWuPC3yFZ8hShvzWhOj6rYzjNxNvdPBQL796dAfj3z8hdohYYiF0y3P2M6GCTXiawRQ3NNWXUhhz9Wnbsuti9axX4I0wKKnFyz9gGuCYdQTSBL4KP/gZNcp+bt23vmSaHgmsq16w0hy32OdDiZshIRqkEvKGF5aRvr+bmrQWIQNcyRjbsnB16U82RKHZIu++VerAx6ZI0Zmg==
Received: from MR1P264CA0201.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:57::15)
 by AS2PR10MB6376.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:557::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.3; Mon, 23 Nov
 2026 08:10:35 +0000
Received: from MAD0EPF000008A8.eurprd04.prod.outlook.com
 (2603:10a6:501:57:cafe::88) by MR1P264CA0201.outlook.office365.com
 (2603:10a6:501:57::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Mon,
 23 Nov 2026 08:10:35 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MAD0EPF000008A8.mail.protection.outlook.com (10.167.241.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 23 Nov 2026 08:10:34 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 23 Nov
 2026 09:11:27 +0100
Received: from [10.48.87.127] (10.48.87.127) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 23 Nov
 2026 09:10:23 +0100
Message-ID: <1ad4d213-9494-4a46-8f4e-39efe8c8fa6c@foss.st.com>
Date: Mon, 23 Nov 2026 09:10:21 +0100
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
To: Francesco Valla <francesco@valla.it>
CC: Mathieu Poirier <mathieu.poirier@linaro.org>,
	<openamp-rp@lists.openampproject.org>, Bjorn Andersson
	<andersson@kernel.org>, Tanmay Shah <tanmay.shah@amd.com>,
	<linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20261101-rpmsg-config-size-v1-1-65686b445b22@valla.it>
 <au4QVFyk7Zzc6y2u@p14s> <av8V18TntRP2U6hQ@p14s>
 <4c542301-a80d-4f14-8651-1307ac783794@foss.st.com> <awDI4B8yYDB6h3H9@bywater>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <awDI4B8yYDB6h3H9@bywater>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008A8:EE_|AS2PR10MB6376:EE_
X-MS-Office365-Filtering-Correlation-Id: 85a345fa-d9f1-4387-0c7f-08df49394021
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|1800799024|376014|261028144727099003|261026140227099003|261026121527099003|261102123227099003|261022105027099003|261022075727099003|261021121427099003|11063799006|4143699003|56012099006|10067099003|18002099003|22082099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	dSmTzTBbv7qkfhIK92x57ve/HE6dU20Tof/gQo2Jz8WT9++SPZc0BNnB0ra1Rou9LbvpnomeUbEvIAC4GcvxHtaf3yumMPOO5kZzWfI3mSzbUlT9Iy2k8GMJ8igIV8sw0tilGNm1LU7DGfEBUfpMEYg8w7QXYo7wobNtGQzyCHw9qN7p0t9qRDdTdPtgz2J/vYgwPZlxXjOf3xbLSPyYgm/0cKMDwM48OKSer5yGRelxUaLdmhiLTfaZFWbpleVPP8F+Gnfg3I9JYj1JIB6hFgNOw9Fk1yLGRFcg3wjZdKC7fXSK2V9kMXHvb8mDUz+VyDIad0IEG+/I6AmyNBmIpsL3xnkQ8KNPAb1Qc0q9tK982qZByopcDonHYhFRX9+QQxO1crkY+xILEGEbSXKOouHNaQDmQy92u2h2sjQW58LGzC/4b3PL7PmZr1bSWh585D9WmnndgmsUVCxyBqlaEP5rP1w0s48Ga4voVSFOlMkgSTKB3fqdqbmINlEiuDYX909eq8+s+lvdCAdaLRjmOp4xJO7pqNL8au9as+inpEOKN40padc71KWzz0fwYO7JyqmfcC+FLaf6JuX56gGD7LI+2YKeJ9Y5MF8gw7dBSiZ4xONaouMO4CelI5HHa1cvFR3j1rHqqVAfqEerw+AwFnmQwu/An3dE8nQIPZMI7wo=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(376014)(261028144727099003)(261026140227099003)(261026121527099003)(261102123227099003)(261022105027099003)(261022075727099003)(261021121427099003)(11063799006)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5mX8S0zmyeRGTWYJYiuf40lvZTwqn0BTaMURBfDcn3s+WJi+t0VdWIr3gBccIRfyuePKm/zKUhUdfWkPe7rYedBwMXWwmqtzPZP1F/Nnr9O2Fat3E4CuedCYFuELzfWgiWpwrikI26FJpnGAx/y1QgIpyxiiObA03IXvtOIFuIUz1snV6cIAfnLOUtAaGI3zFu+w/8KtV+sokrbNOoJRo2PlnExRxNdYJholkbxMeUR44zEQwI8qhizZxQkIBoY/WFYm24IgIK0x3iEd6wzhgyz7z8wreKMlgOFcrBge0el6vmQoj98hQuzG+lw6YKOlz1eO/5+a5NFUvOA5rX+GbdZ287Ve3oO8lpt1AsImxsEdXfpb8tgnPMnOas25Dtgztn68KPU7eKAPt2SH+Ibea9zYO3TdU3Q4EottYXxsN8rAO6GJ6Oec2pYKtmkhXj66
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 08:10:34.6613
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85a345fa-d9f1-4387-0c7f-08df49394021
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008A8.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6376

Hello Francesco,

On 11/20/26 23:29, Francesco Valla wrote:
> Hello Arnaud,
> 
> On Fri, Nov 20, 2026 at 06:50:47PM +0100, Arnaud POULIQUEN wrote:
>> Hello,
>>
>> Sorry it goes out of my radar.
>>
>> On 11/19/26 16:29, Mathieu Poirier wrote:
>>> [Adding openAMP mailing list]
>>>
>>> Heads up OpenAMP people, I will merge this patch in a week.
>>>
>>> Thanks,
>>> Mathieu
>>>
>>> On Fri, Nov 06, 2026 at 11:37:24AM -0600, Mathieu Poirier wrote:
>>>> On Sun, Nov 01, 2026 at 02:54:03PM +0100, Francesco Valla wrote:
>>>>> The comment for virtio_rpmsg_config says that this structure is
>>>>> naturally aligned to 32 bits, and this is desirable by some
>>>>> architectures that don't get along with unaligned accesses.
>>>>> The content of the structure itself however isn't aligned, and the
>>>>> __packed attribute prevent the compiler to add this alignment.
>>>>>
>>>>> Fix this by adding a padding byte.
>>>>>
>>>>> Fixes: ca96ea25e51a ("rpmsg: virtio_rpmsg_bus: Get buffer size from config space")
>>>>> Signed-off-by: Francesco Valla <francesco@valla.it>
>>>>> ---
>>>>> Hello,
>>>>>
>>>>> unfortunately I missed this when the original patch set was sent, but I
>>>>> think it's worth fixing (or at least discussing) this now before it
>>>>> enters a stable kernel.
>>>>>
>>>>> The same support in open-amp has already been merged [1], but maybe it
>>>>> can be fixed before the next release there too?
>>>>>
>>>>> Another, lower-impact solution would be to fix the comment, but that can
>>>>> then led to issues on architectures that does not support unaligned
>>>>> accesses (e.g.: AMR Cortex-M0).
>>>>>
>>>>
>>>> Thanks for bringing this to my attention.  I agree with this patch.  I will give
>>>> Arnaud a couple of weeks to reply to this email though.
>>>>> Thank you
>>>>>
>>>>> Francesco
>>>>>
>>>>> [1] https://github.com/OpenAMP/open-amp/commit/744376f566c3ec7e06a7d093d785295b78aa486f
>>>>> ---
>>>>>    include/linux/rpmsg/virtio_rpmsg.h | 2 ++
>>>>>    1 file changed, 2 insertions(+)
>>>>>
>>>>> diff --git a/include/linux/rpmsg/virtio_rpmsg.h b/include/linux/rpmsg/virtio_rpmsg.h
>>>>> index 0872cbca4593..d24fedb63023 100644
>>>>> --- a/include/linux/rpmsg/virtio_rpmsg.h
>>>>> +++ b/include/linux/rpmsg/virtio_rpmsg.h
>>>>> @@ -23,6 +23,7 @@
>>>>>     *
>>>>>     * @version:	version of this structure, currently %RPMSG_VDEV_CONFIG_V1.
>>>>>     * @size:	size of this structure in bytes.
>>>>> + * @reserved:	padding, reserved for future usage.
>>>>>     * @txbuf_size:	Tx buf size from remote's view. For Linux this is rx buf size.
>>>>>     * @rxbuf_size:	Rx buf size from remote's view. For Linux this is tx buf size.
>>>>>     *
>>>>> @@ -33,6 +34,7 @@
>>>>>    struct virtio_rpmsg_config {
>>>>>    	u8 version;
>>>>>    	__virtio16 size;
>>>>> +	u8 reserved;
>>>>>    	/* The tx/rx individual buffer size (if VIRTIO_RPMSG_F_BUFSZ) */
>>>>>    	__virtio32 txbuf_size;
>>>>>    	__virtio32 rxbuf_size;
>>
>>
>> What about using a u16 for the version instead?
>> Even if we never use the MSB of the field, it seems cleaner to me than
>> adding a reserved field.
>> Indeed, we can consider the config space header as containing the
>> version and the size. The rest is version-dependent, including the
>> reserved part.
>>
> 
> Between the two options, I prefer the u16 version, to keep the
> version-dependent "payload" aligned to 32 bits. I'll send a V2 with this
> modification.
> 
> Shall I send also the corresponding modification for open-amp, or you'll
> take care of that?


As you want, I have already sent a fix related to this structure in 
open-amp [1],
so I can also add this update if/when it is applied by Mathieu

[1] https://github.com/OpenAMP/open-amp/pull/714

Thanks,
Arnaud

> 
>> Regards,
>> Arnaud
>>
> 
> Regards,
> Francesco
> 

