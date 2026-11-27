Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772953;
	b=N0ViVwMOGDYf+LyP93mZW/P4y07MrsgRVmeTUUZ+V8L0qx1rYe6i/U3QmoO6ZnPfulx9
	 7vZHs7m++/NXIp7hsC7973bgt59j/ZiD/pA/kn0ckVCP4ZyBqQP5P4iibqZAZ1OBH1Pvq
	 uw6Sn/UEMHELMFa1PbA4ZC+Q4sJIDXrvYveCkdlr5n/XsHibzfJnn9bM9ZZ10OaGAzmAJ
	 jmj/HuyfyA6pndOXNUvdTv3mwo/vl6HJFNUxZQhDIyNf1WXwXBJiFKwQs3Gn2zbxM9zEl
	 G/AfqgK3U10Bmi+4CoMd94PchaQRP3aKmPh7jOunfuLURDSiQNa/9RNGb/kpR8mns1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772953;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wVlqWYb0itOLHGsCT6XgTueNQgxMfN9z0WOmdqIPsIE=;
	b=i7hpjd3Rj64AHg4fZwzT/gXJyB9X2jCIcMMRmabIO+ldVVLFXPqEq4FVmaryROFHslPo
	 YnhZMGzR8VGth15X2/yHFkCVR+QDhsDRQHEH765PShgYuHIKyg1x3oJbAlUTkVMaE4fhK
	 glUVoB1DuS3bVYkegbuX0ommmBihH8zUyAZof3fw/AtDe5e1KU/oDK37a84E44uyP1/oq
	 02QFWldLsZjW/T4Um0BP6Ep1d0yoe2JXi6rmPI7J6RnM8lqWrvDYeP8c78iTXHxS9lVQp
	 rRR0EmF30o+E+L6MMd+BNCKPYSMBBA6HITOuFuYBryIZ8ySiWZuScEXTTRQzfyiMezQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pS8KIHNO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NcO6QXhP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99296606A321
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2026 09:49:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99296606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pS8KIHNO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NcO6QXhP
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GQLu2187994
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2026 09:49:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wVlqWYb0itOLHGsCT6XgTueNQgxMfN9z0WOmdqIPsIE=; b=pS8KIHNOrymvcij6
	7BxHEPv474G6idlFeiJguPzbiWdeWevglg2akgyFgSOgkSnrFU2DV5/9A/9MeyOO
	8aANDwJPHQFxW8NxZYPqT3wxI5JhlUkkln68A4UKvjFRN0LFg1e7nXROcppvpJUi
	+y2/sf1tJM1ZXK6LXlyzSJvb4l7nMF+SJWxidG462XCebgWUMdUiNigPTjJuPs+F
	DYVV/fLqT3OVH6PMuZVSq02o+IXjSsDvWpUN0LS/MdV4c6+fgtUmhrWUOmZK+rP1
	MAOFzZgdvd4KagLPFPuq6KNLHYOfNkUDJBSuD+dbEmvZlyP7OWo3StiqX5ta3YtU
	Xphqnw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74gh8sq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2026 09:49:11 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b49dd1e77cso4507286a91.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2026 01:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795772950; x=1796377750; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wVlqWYb0itOLHGsCT6XgTueNQgxMfN9z0WOmdqIPsIE=;
        b=NcO6QXhPWxpE0zVrUZjLDKBWSKqps7cl050uA/gobhQmzwCoGtzBi3cE9Ty5LG/WFO
         U+x+lDvg2qfjXigUUDpQUg2WTId71LANVhSRnezPS6KmxE0E3PU1P1u7bIrkjlBMzEJq
         Fw4C6U3Uduj0xRiQfGad25WkX1aD0ZV6s6ymqmcaS25Fjh+sbsdWZJa/dVJLMGoZdVyp
         nEQXSGY1Iid3DB2sZHhilQrFwVXsF3qJUV5UpAisvm4liBM11ACH15IlHnuY0sujOtGP
         TTuqmZViUrLPy98eZMZE+Clyt9WO+80w/zXNqvsFrwsdD80x9JpYJRGic+MXNXDKjBKT
         c9VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772950; x=1796377750;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wVlqWYb0itOLHGsCT6XgTueNQgxMfN9z0WOmdqIPsIE=;
        b=rfa3xsx2TXczXiW4DimJOkI4S/hKox6n8ILpdtD92JVzRoFyN/nQhUXksdn6+GpMW8
         zEv9lYpwEJWi5ncDXPmdQs02KXv8CMo67CUfzlLr6z3nR07r1hEusCbB/GPoP9ox980K
         U7/qfsSHWtITQIQpnf0VvB4PItP9CRp6Dqu+EgYZo4/8Fjfu3/bVJDCEvJVbVL0arqLo
         dmxV9Jgj44/+XBLXh2uwPKJlqvGvay8t36PrJtTwaCcPhjPNfqInwXrMk1VEZpDtJZmX
         aA+9Dsi2vvuPjzON+STdHUUGqqMvD8x06yPjkJYV5YG8kLRhItl6CP42VhyBEBWP9uNr
         I8BA==
X-Gm-Message-State: APuU4Z+ViVrQKLpTGiw3UktzjKPS6Ui2gn1ttw2J/fCtRko3qLb2xof2
	l2WzsdKPlIx/yQ7g7WWynVcJumlU1Da3TCVyWokSzaxXEVmatdcjg4myJWIlYmv7p2SycIQRAPT
	X3IQzfhlVkY0Z/dAYF/A8CO6zCivxPapknEQgdDfROFVjlTlS/hEM4JPNdMLVW5NEqFmi8Oka
X-Gm-Gg: AZFdTZciJvGPF/GUPkgc2LXra43wp79SrJhIyrA6LKNPu/yzNDyQo1pe7f6wg9TnluE
	gxdgYUft607zt3i/h/LZYIeE9x9cwekewDgoHCbXtV0A3eaE/O8OPy0JAxZ4BB2pNCgBxs3BRAO
	rZmmHqB5kvYtUcQ9KQb2buaT5absk1pc4kNUqlfhbja4GgoEYcJWSmNFelvDpolQNRcrRrwbp6C
	CL9U7kxV52kwr93xhELJz8fUCE3D2TslmJUEa4BR0bOzQ4dHL8LsFlKgDMdWa/J/HhEJcHk7jk2
	XI5S0HZN1aeAOdNrtQvfHmccBwJUiemIeuJ7y9F/WUaDX20aRAZoyp4rNQBcDWNshYkRQ81bYwf
	T5+v2DM+JE66Sfm7sqHT27yjtxzD9lJtNiv2heGyvZPXZORK+TvZfARKI7bT3sesDDxo+HZ+UTH
	yibZXv3C7gvorOd5rQ/tNxjDhc/q5p1eZWpQ/jNA6YMISXWf2e2UmnpbRfQCR4zEU4GMF0TwnPA
	zxG
X-Received: by 2002:a17:90a:d885:b0:3b4:6094:2f9e with SMTP id 98e67ed59e1d1-3b4609433d7mr17785370a91.46.1795772950593;
        Fri, 27 Nov 2026 01:49:10 -0800 (PST)
X-Received: by 2002:a17:90a:d885:b0:3b4:6094:2f9e with SMTP id 98e67ed59e1d1-3b4609433d7mr17785348a91.46.1795772950074;
        Fri, 27 Nov 2026 01:49:10 -0800 (PST)
Received: from [10.149.108.218] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad92c07sm37851351a91.13.2026.11.27.01.49.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:49:09 -0800 (PST)
Message-ID: <6172214f-c0aa-4c9a-ade4-83dd663028e5@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 15:19:05 +0530
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
Subject: Re: [PATCH 2/4] remoteproc: qcom: Fix bounds check in
 qcom_pas_da_to_va()
To: Atul Akella <atul.akella@gmail.com>, andersson@kernel.org,
        mathieu.poirier@linaro.org, sibi.sankar@oss.qualcomm.com,
        quic_srichara@quicinc.com
Cc: linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261106184312.100-1-atul.akella@gmail.com>
 <20261106184312.100-3-atul.akella@gmail.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <20261106184312.100-3-atul.akella@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzOCBTYWx0ZWRfX6TCF7aiCnJY2
 tU4DOEsISTG+wvK/8PNxoEJaHyR5uYx9ZKeD5OZ3zde62cpik+VljaAUvS1kIM3SDMSOR66LfGC
 AGc9SY3qpEIKK2erfuzDkiHFgUHLSuY=
X-Proofpoint-GUID: 1R3doc2iDFKjTv2qImDQyWDO0xzCRy3a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzOCBTYWx0ZWRfX8q8mdG/ZXfiH
 v9bByJwk42CFMAOjk1bdfayEhbuD0zzRLp1WqkuVowpPBu1/buVGTkSq7rREpoGikYZ7BdmispT
 9VKSf1TiXBWKZL+lAF4Xgb5fcSd7GovuA+bKKHjRqnOt2l5dP+NLMiL4zFTg0DxSUYcqTGnrZ9b
 coesWabm5SDDO/6vzNzDficFRE4Kuu2v/DbAzOvAAwZC6W5khcmximhEd4XqjlZ4Elm3Voa4v+b
 +oUiFa+cupNgqF0l0X6jK5XlaWSCe/yJ/jWoHshxHpbU2OPV1MTGqePBucpTbGEsjETKYHOhHCP
 y1k40CBDTkoMapyOQLQiPzqKwjeMTv9REaB2dnMldoqSX+tZlslOqN33jq4Y1ClzBmU+zBXAzBi
 pUbP3q8YxqWPequX9Z21vqJdvvjC+AfomfZ+rResmroonhQ542Kh23nkgsfAvqfcm9cVePzqbA/
 k3UwLg8XOlZrYWQJIRg==
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b095217 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=E4ycadI1TCjYcBWHacUA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 1R3doc2iDFKjTv2qImDQyWDO0xzCRy3a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270038



On 11/7/2026 12:13 AM, Atul Akella wrote:
> offset is calculated as da - pas->mem_reloc and stored in a
> 32 bit signed int, while da and pas->mem_reloc are both u64.
> For a sufficiently small da, the 64bit difference is truncated
> into the 32 bit int, bypassing the offset < 0 underflow check
> with a small positive value. Additionally, offset + len >
> pas->mem_size can itself overflow when offset and len are both
> large, providing a second bypass.
> 
> da and len come from firmware's ELF program headers via
> rproc_da_to_va(), and the result is used by the ELF loader
> to write firmware segments, so a malformed firmware image can
> cause writes outside the carveout.
> 
> Rewrite the bounds check entirely in u64 arithmetic. Reject
> underflow before computing offset (da < pas->mem_reloc).
> Replace the addition based overflow check with a
> subtraction based one (len > pas->mem_size - offset) so no
> intermediate sum can wrap.
> 
> Fixes: b9e718e950c3 ("remoteproc: Introduce Qualcomm ADSP PIL")
> Cc: stable@vger.kernel.org
> Signed-off-by: Atul Akella <atul.akella@gmail.com>
> ---
Reviewed-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

Thanks,
Gopikrishna
