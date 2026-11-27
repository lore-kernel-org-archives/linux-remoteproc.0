Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795773062;
	b=lTgald90VeR7Hc7m12bLs7PR2T8ldONiWH2l29aZ9DTxpGtk8od8+U8rMP0k4yg09qgE
	 cQYAjViwmmg4uJC1xtFnLklyglmhupMSrdU4iAMZSHsPwP0V8/lBEHHi+u6jEV6y2IABY
	 toMgdR1tYUxPerLZ4rcGGzl6ZzY5FCVh61NJpb6oHPPKpLVlxMZ/vJKIsU11HPvNP0fTQ
	 2e0DcN4QVLejEbdFRf4sVWk069i9Czccx+uF5nkSLqlZdjlOcaA+O8sBDYdDq4bd5gCr5
	 PxwiasC47Fc7FJlNS2bMFrAVaqj49jhpKwTtBhJdY2H+0mt1RIMrNds9G3VzWxh1ebA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795773062;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=A81/evmtXSXLzvLuiLw8StiMfkySlbyx4fD1Kh2PSYI=;
	b=QuL6qux46v/zVJZb+ewHLlI2zySZGy0trHElMsRO9dAjSYHpEXob9hXejJw8hNcjpu80
	 B22NtxAEtxgG5I2iO7vB95U7SvhPvCdurkSz6M6Lez7ePbmQwMdLMPCVq8Qc4gIvnJnU/
	 EQHaXh5fGegefrK21yw3nydhNeO1He4qAZxTwDz9CHgmjkHeuSxjDSzMB2qI8L9RJSDyr
	 XoA7u/jXaE5/nY/lHo0r6d/LIdWUhelTR2Cu3o6JjuZRWuy6B+bZ+GcCeN73s1dGnhKk6
	 Snchkkly/fVzRVJjVEfphuINlflnyX6QRw514qu3MrJfKwaZFr/F3jNzWNor3G80dvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ae64XGVr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jpXlsv+v;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665B6606A31C
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2026 09:51:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 665B6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ae64XGVr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jpXlsv+v
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GbSc3983840
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2026 09:50:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A81/evmtXSXLzvLuiLw8StiMfkySlbyx4fD1Kh2PSYI=; b=ae64XGVrDFdsC2dL
	t1qoaEHuj4sOmQrjztuSDgEtSAmiED4B/yJbpt4LmD/I2QKxe3JCAwjsBAbPQxgF
	BDFSjsmgcY1Js8BISsFGMrJ+WoMCFF0eN7a6ib28gMNobVKVse9odgvqrDPhu2KJ
	MmdeOcCS4TGPOj/dDhUUtLvFFt07ZwwUgjtvTA+xle+97EQ8TMed4z3nXgsePb6I
	XAXsIsW9YVokD/lg3Qcw3abpRLZCo84j20aEoF6dtMQHT7qBwu7B7alZ7e1YUieH
	GYq4Yb//Crc9urwpT0nIjHWPBwR7V/MUOn2tpKjI2UsH8xiUJC+C1KThXb73oD1i
	fFIy+A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u49acty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2026 09:50:59 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2f08196b148so51791655ad.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2026 01:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795773059; x=1796377859; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A81/evmtXSXLzvLuiLw8StiMfkySlbyx4fD1Kh2PSYI=;
        b=jpXlsv+vMpOTJEguY99AhFXxNHoJ83C6PYEobd0QjtKeZIPZmYRVNE4v8EBZvRbUB5
         ckATbqDwUDiM9JuE7PR0kRPPgZHU+jY3PwGASJq8wEwm0vxOSvAlwdQI7VdTc2zOuDTP
         cHRXVG38YDBruA9S/8Q6+kw/lbCZEkILBtTCkhEhY4YS72CKjeCi15hB6SKXnjpuXE3E
         Epo8iznUpdDEtmMlrZEQBAcqYADVkHOpdQCBY53mJYnSGOqrnGBu7D55yhuQ9OEOt2vN
         x6Lb/uCu9gn6GFdimJ1cOHgvfpqNSRPWf0VAEA2GjOnuGw7cFyOfhKX3s8tk2v6URm+v
         5DGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795773059; x=1796377859;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A81/evmtXSXLzvLuiLw8StiMfkySlbyx4fD1Kh2PSYI=;
        b=Jznzc3bqdfGpyviqXlORL++MckpSTduN0rZbIJ9co8jqFpjKH+yM7PGYopFB2Ny8CB
         sAdK8eByj2VijAqhBI/nioIG8hR0M4olKK1anblERGgRhcUwXSZVQACVIlOx7Op6YTuE
         SHr1cJLQngFPvntSW+zt7tCQ0sv487e8mWKmPnQIuF4nQAm1Po0CHPY1GjR/mh86Eseo
         3KMWfoeisOoz65Lm1gXLIvi2GZJPMDnuLdTRUZkxw7HZOqXH5IPtg1LbgbCQ6UtKSr7i
         xfMh0yQ2xEzLGD1V09rKU5TPme99Yb21vB49tcpzTCkepSHxam+5OyL2MXWhY1EJGPoe
         IJLw==
X-Gm-Message-State: APuU4Z99mJMX7ek/9rk592a+h7JIp9VTiQygGlv7F7B9oKL0ZuJ0paHm
	pz3U4V+Hv8PMQNF74kM0Bqjw5Dc2Ar1zZGDM5VXhDkIqBBX9oVCsdN+8BE7YUvhAWfb1aVMH+Xo
	6yfbid5qD1mdNMIIHF1tEyqHYdNy2nlf4AEEJpQmGttAQJeEcc4Rss9X7xkGeEov0aob99rvO
X-Gm-Gg: AZFdTZeGcbB0Tz199RO4oumi5J/hMxrmlneFvX/TPbbUTrSSUqOcHNH2JgWnWEBle22
	A3Mt77xDgDbkHg3QU8yF73DvHH94wjRSrVc/lFtAbXOuKouQNE31d5QtiDUP3HPBohb6wMGTFQV
	UrieHfRVCGzqy5pf5qIOoAtPu0FKyJ0WI29VZG8Tf1Nb2XjmUfZHAdKaQ7nxj8GgSdIElQ3ayD+
	RBpk7aDLBvmZwzLQ+ILIdJI3yoRZssyDW443jtHxQvbzbda2wusu9izBVohWeAwe96timMPj2rJ
	8VMGc1ByuZ23jrXikW6JG1gGhx4u8f+njmXw4e+JvEaLIQPXDFnBgsyRhjLfZWUh1X9Jaz0fEp1
	WJTA5clgw+686zJc6u/WXAgg/hlYplVHFJWONmVU/RJWzQ8i7pB+zCKpn9DTI6AG1HiNTKFwn35
	dqeNy0heltD+4zuexv0iVN/T/gM7Mj7Pc4KzO1G6+myDclqsladw7dqngBMlw9SZUyDzwqFBd+X
	MXR
X-Received: by 2002:a05:6a20:b40a:b0:3e3:37ff:3797 with SMTP id adf61e73a8af0-4014bc4bcddmr22367458637.45.1795773058830;
        Fri, 27 Nov 2026 01:50:58 -0800 (PST)
X-Received: by 2002:a05:6a20:b40a:b0:3e3:37ff:3797 with SMTP id adf61e73a8af0-4014bc4bcddmr22367439637.45.1795773058397;
        Fri, 27 Nov 2026 01:50:58 -0800 (PST)
Received: from [10.149.108.218] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c908a56acfsm11467784b3a.23.2026.11.27.01.50.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:50:58 -0800 (PST)
Message-ID: <920b2c6b-53c4-46d8-b949-9c50795ca15e@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 15:20:53 +0530
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
Subject: Re: [PATCH 4/4] remoteproc: qcom: Fix bounds check in
 wcnss_da_to_va()
To: Atul Akella <atul.akella@gmail.com>, andersson@kernel.org,
        mathieu.poirier@linaro.org, sibi.sankar@oss.qualcomm.com,
        quic_srichara@quicinc.com
Cc: linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261106184312.100-1-atul.akella@gmail.com>
 <20261106184312.100-5-atul.akella@gmail.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <20261106184312.100-5-atul.akella@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zBPHyt06zGxMUupTtoSnhN6l089LNmYT
X-Proofpoint-ORIG-GUID: zBPHyt06zGxMUupTtoSnhN6l089LNmYT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzOSBTYWx0ZWRfX+6XS0ri+uJw1
 DWKHsPox4THi1HDrIw/4vTmmlpS4dF49Zz0+mgRs/p8fznSZh0VTQQF94E4oTadWbxJ4Dj/c7vQ
 S6Z4Xx4MOBtpi0OJhbLsKJgdyZgzr3c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzOSBTYWx0ZWRfX9/nKJOZWBPHs
 dgob6PwGtJb/O5HdR4Rz+PJ4eM+zGgjYTjIohEyTe5kN9JyMPh6EQU15TfhgB7ppAccU8Ov5Pts
 19qyVVxxPVaClU4ZX4Lh4qqXjp9Xd4avZYRnoNbZIpp3stDdIIqZotq4eZvhPbKTCmj4Rp1K2A6
 BQpmgksrvU3YBfin9wZpbsJDIL36Z/9UQAzIqldNkTuVbMRRW11XMvuraaL0U7e4+snVP+rS3Xn
 2ON+iq0yvk6reTycTOkeAB/hwNqIoP9pBS4B5Lv0LCfN7vJDYfTnMzqAlpV8+pf3x6BTMDusH0s
 VEXoBe4eMzdGW1MfEWNLy7EAS30NI+fOZRuUNy+4JO//5pl8GIU1ELCliRmhKwxiXLRrkK9NXLf
 M6AZ/vK8f30PPp8K5J3mr74j9GFgoWb/2xrxHIHws4RFFXHQUtKt4g8QJP2peOL+0rSg3e+qlH5
 joBeA28ziKQ31hZT8kQ==
X-Authority-Analysis: v=2.4 cv=A875rKWG c=1 sm=1 tr=0 ts=6b095283 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=E4ycadI1TCjYcBWHacUA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270039



On 11/7/2026 12:13 AM, Atul Akella wrote:
> offset is calculated as da - wcnss->mem_reloc and stored in a
> 32 bit signed int, while da and wcnss->mem_reloc are both u64.
> For a sufficiently small da, the 64bit difference is truncated
> into the 32 bit int, bypassing the offset < 0 underflow check
> with a small positive value. Additionally, offset + len >
> wcnss->mem_size can itself overflow when offset and len are both
> large, providing a second bypass.
> 
> da and len come from firmware's ELF program headers via
> rproc_da_to_va(), and the result is used by the ELF loader
> to write firmware segments, so a malformed firmware image can
> cause writes outside the carveout.
> 
> Rewrite the bounds check entirely in u64 arithmetic. Reject
> underflow before computing offset (da < wcnss->mem_reloc).
> Replace the addition based overflow check with a
> subtraction based one (len > wcnss->mem_size - offset) so no
> intermediate sum can wrap.
> 
> Fixes: aed361adca9f ("remoteproc: qcom: Introduce WCNSS peripheral image loader")
> Cc: stable@vger.kernel.org
> Signed-off-by: Atul Akella <atul.akella@gmail.com>
> ---

Reviewed-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

Thanks,
Gopikrishna
