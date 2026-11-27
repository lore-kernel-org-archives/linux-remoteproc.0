Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772998;
	b=xmvxpBc9Fa7W+ImorNnxSE7D/89qOM6PlRmIzYJi889FlcyjyxrJ3eeJAvMs4C+gPfLp
	 byTkwtqJ8bYkC3qMpmRKH1xqmYhUpdPxsWGJXii+qWPCHZ7aRw7F6oS+Yaa6cjhZCGqZW
	 /wHmoJpy7OqyMVDebIfUZoibG0k4ZNjRrjcWv5n2DOJdGysYbgObUtyMNZBi9NIci1O4z
	 3gNe23FsDXBQjDp1d5Fd2Y8jYAJdJOn0J7SzAwXDQ6HSOzpg3f8H759+aFaj0loPx3VDt
	 uvL+oyzp5kDxwSycIe3BFA2xBd/flGJ1fhiW/LozGfdyUjgcdNk34FoFd1qy8m248jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772998;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=c0Dnai2mS0jKW2gFMXtdOeHQc3Vgz+AH8UmEJxjmLmI=;
	b=epO+2al71yJuIbm9XsM40l0K9kkurziuDcQ4Sovveb+EXxYTEQOA2jgWHiiiU9mARDKQ
	 mXiD0cs/ijKqxbf4rKXeYws2buPkFxj62LOXW16Debwu4KpN1OZU4hd/9RHJwBqdXMyZ6
	 e0aVCR4aOmhbUHtPlu2fWNzFutcgc3Mtirs/B12x83hcZVMedJ3DNx6qrQ5dEoT5m3AF6
	 hltZMH7DVSvKeScjaIDWH61Ysn4bYLzvkONr25Rb/rcnKTIoLHXMWk73POgJuU9bufoaF
	 aJLfZcSfzN5vkRUE6vW+aFFtJgipmt0q4lz10dm0STyBWd0w71h+hy1EdGsQ6SAPFYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=obfICoDJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f9giYd5x;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8EB7606A6A1
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2026 09:49:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8EB7606A6A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=obfICoDJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f9giYd5x
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GnJc1565493
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2026 09:49:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c0Dnai2mS0jKW2gFMXtdOeHQc3Vgz+AH8UmEJxjmLmI=; b=obfICoDJxgCSIHVq
	1H2m4OsJZmwrrNOkmSyZ5PCFuHLydF4UHCKinlEo20WiN62lEXqg8fCrjE/BVyRL
	T+SLXWOy8Z0j18JjAfAvm27SoQTXYpUSbb8bmYvHjSRTDL9E/zGTDF7lO79S7N6t
	P4H1x1ULr5XGWIdnr6qI8v5aALiTNCgFnldXX4WlH/lEkCLQidFYyBtMZhIIbpIq
	yPxi1NMbVXXIILZs4rEbm0Yj3P2OwMYwpOesSv8+UCA7W1sDdaD+/rhtQJaF2LXl
	BWjRYP8hQFzHaHoTOySn1+/zh1AGahS5F9wMKKynuLSQImyYJzqgIq/E1kwnJCRD
	soScFQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74gartyf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2026 09:49:56 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f0291cc0f2so97351915ad.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2026 01:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795772996; x=1796377796; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c0Dnai2mS0jKW2gFMXtdOeHQc3Vgz+AH8UmEJxjmLmI=;
        b=f9giYd5xDCxK4f1w5/qTkfCdb4CeHpi8ruUnxzcVpY5nNmQRBB6EC8meML+tuGAirQ
         Lj3TpIFKOmdGGMSUKr8gspT45PCKPxYAtJ/k6Exei5moJDAZPY8QCzjDF7rSDsij4dt3
         RkOyi8XyModNrMyHl4NB5qnfjdSATuJmwRdnYSyHtoSINhVFESguw/5KqRobLSA+b8IC
         krzJU0g6n3n5Z1bXoRm/jRlJn8GjjOXP4Co6JxoZpOeyvs9Mp25pMV9WfSnwD9FulIwE
         v/hD3ZxPZQkR5yAzP0dYYfhJFEZZoP6hiKFpchX6DTRpjsn7mWvs5IO7128d8ulTP+Tb
         a3Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772996; x=1796377796;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c0Dnai2mS0jKW2gFMXtdOeHQc3Vgz+AH8UmEJxjmLmI=;
        b=hM+aR7/4orA029ImAA4ewt7QK9h3zsD2P0UrzUFEQccLgV6hN78wMosmfByX2uzWjg
         cSCcqIsSeZ2iZ5d1Yqonsd0DZu5J7uwe9UXFt9FvmCNt5Qw1Ak4nkOUyE7/zM/XH6dgd
         0HUJTeYb7I6I4uq9wlzw5v8AMzBxWOYGPJreZ3sQ1Yptpry8WRMWBQIpJKY0in6Ob3ti
         bq97fMm864F9Bzwof/868UlXEds//2DxKUzvWrMgxmzFpdFeA7+l8bEPBpZor4P25zZ6
         +fXIcTQJ1Ey52hypvGoyBOiIhyo2cTkhcdxxGE400y9eAKuUamCTgH6goC0y1qn1yxCd
         zrhQ==
X-Gm-Message-State: APuU4Z/azx+R3xbdRFNdAP5RQHrvwq6fLSEr53hrQDXLvYjuASk2r0AS
	NyXpNTNZ+dWrMs7hKf4tFEAvEHm02YfoDTmu0J51g6c/kwbFsFgDiczKUvePTFhDa8R/Ovj9n/Y
	OjXiIVA1VTCtgfIgxrO78Abz3Gt4vRCJKiDotDM+6n6Uxj7n6nMGK7Ysnrz0+oRRQElOkPkLW
X-Gm-Gg: AZFdTZdobmnz09SCexZzeUYaBQZkEC6zOIr4BCWHovQHlHpPsF6ktR7dLTTAKniHdih
	4fe3Nh2nKKaCJesBVZCP7gtynE1w5kfWajLFrPE1WrYwPi2jdiwaIaGX74E4XkO2yoEBHzyta+M
	VVlqNrlVAd9fj89+AAdn0xKbLckpeJdmQqdwkNnJ6iTPg1zt/9FVKQhdEirMGI+/Q/HJPJmOyjP
	2cA1ojwd6XdhfLIzzpnx8e+9p/pgqrLn8NHfZ5k2auiS1UQjXrhe6nX3Py/evdFGXWb0P5epmsp
	IY2Ehlb96CBpz7KbnHgpw3Me0KkAhX0Opea/qBzQe07GLwZypNkAJh150neq6jlnAYjC2c4LXCR
	XxBw03A6YMoSc4V4miRq4x2pCVhNHdpXQN7rVAXf5/xCI2hV/y6iPanYmK9C3OMay3wWjRTZxs7
	6YNmmU+y1pUs1smtH/gcvV0iMSbyc/pAEXkhZJjyVBWUf+Him29ShcZg1BWupmZ+VlH+AEsXyV6
	TmU
X-Received: by 2002:a17:903:41cd:b0:2ef:efae:e8e7 with SMTP id d9443c01a7336-2f03eded341mr252338235ad.0.1795772995850;
        Fri, 27 Nov 2026 01:49:55 -0800 (PST)
X-Received: by 2002:a17:903:41cd:b0:2ef:efae:e8e7 with SMTP id d9443c01a7336-2f03eded341mr252338105ad.0.1795772995384;
        Fri, 27 Nov 2026 01:49:55 -0800 (PST)
Received: from [10.149.108.218] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f147a9esm115916895ad.72.2026.11.27.01.49.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:49:55 -0800 (PST)
Message-ID: <917776ae-ab75-4f81-93c3-7e359641cb1e@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 15:19:50 +0530
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
Subject: Re: [PATCH 3/4] remoteproc: qcom: Fix bounds check in
 q6v5_wcss_da_to_va()
To: Atul Akella <atul.akella@gmail.com>, andersson@kernel.org,
        mathieu.poirier@linaro.org, sibi.sankar@oss.qualcomm.com,
        quic_srichara@quicinc.com
Cc: linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261106184312.100-1-atul.akella@gmail.com>
 <20261106184312.100-4-atul.akella@gmail.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <20261106184312.100-4-atul.akella@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: c0rHUPPvwBc-1RJDhIiUlPQIn-HiF2W_
X-Proofpoint-GUID: c0rHUPPvwBc-1RJDhIiUlPQIn-HiF2W_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzOCBTYWx0ZWRfXyw5lTGy6d0D4
 71VOijhnjOVfivmgqYC46PU28WrWNWibej/JgPO2nkfhT03vzJeHJx6k9a98U5sox7+DDjB0pvY
 sCKGGzmuvpYXn54psmW1UzlHbxxGKhpXpIlmJLWL3WfByaX3C3NIfHEencemtVhZzvcajR7MlCQ
 tEe03KY/lXtiDtpp2HHX9DVDVgF5bLWztEzz3Alshkb38kDp/KPk/3R+3QdFOxT73MvuXgiAQBX
 TKBCuIp8nb16Qm8LK3gWnUMY6v9eG7uOThTJicZcCuXesPfvte+ATUMG2nF6Zrq1jpZo+mDQ3xB
 U84lPUroWTEHdsFrhSfFVDa/BY2T0yPiKbCYVkntTwwf8elnfwPUu1wVNluN5lrLBJzWnaiHZU2
 ReG8Jf+Tk5jcoUlZSAYPE9Pp7wwJMry1lN1P6oFurXoatDt2HvaO39NzQ2puoxexR1K3KUD+HTM
 yuHY1ua1xnWSAXxeC6w==
X-Authority-Analysis: v=2.4 cv=I5bw19gg c=1 sm=1 tr=0 ts=6b095244 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=E4ycadI1TCjYcBWHacUA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzOCBTYWx0ZWRfX5c7tTFtRkgow
 A0tesYAkQLHLg37/GOtcDeTov9zh+xmfgC8nmk0k3+DPi0j4kVzfj1EpnAdStLHwPQNE46wXJ5q
 +aUHJ6C+/jrkAqs8PlqL8sfrPEFaHtg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270038



On 11/7/2026 12:13 AM, Atul Akella wrote:
> offset is calculated as da - wcss->mem_reloc and stored in a
> 32 bit signed int, while da and wcss->mem_reloc are both u64.
> For a sufficiently small da, the 64bit difference is truncated
> into the 32 bit int, bypassing the offset < 0 underflow check
> with a small positive value. Additionally, offset + len >
> wcss->mem_size can itself overflow when offset and len are both
> large, providing a second bypass.
> 
> da and len come from firmware's ELF program headers via
> rproc_da_to_va(), and the result is used by the ELF loader
> to write firmware segments, so a malformed firmware image can
> cause writes outside the carveout.
> 
> Rewrite the bounds check entirely in u64 arithmetic. Reject
> underflow before computing offset (da < wcss->mem_reloc).
> Replace the addition based overflow check with a
> subtraction based one (len > wcss->mem_size - offset) so no
> intermediate sum can wrap.
> 
> Fixes: 3a3d4163e0bf ("remoteproc: qcom: Introduce Hexagon V5 based WCSS driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Atul Akella <atul.akella@gmail.com>
> ---
Reviewed-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

Thanks,
Gopikrishna
