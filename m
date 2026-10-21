Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792587414;
	b=q0b94n038tZtfh1vh/8vnMOiA7evDwERe7q2E9Opb3j2ybWomErowmV6iSlbP8gaWy/C
	 TsQPu1xpqSRfjiWB+pO55PdfroRp8g6MhiB8wotWrnAe2Rz0V8AoYKOD15WDcnnwzI3kh
	 79o1iIUwgZ2zp+wVtI/CYW85+Nbm3Dt1INeqWOcNRkk0Q4jJMHCFafNixdZ9dVZUGHbja
	 sKxHVKWgryKxi2aSE/LepXzch6vOohNjerx4hKTCgqK8Vx9EJf8j00grGelh8LqbtxA9E
	 3Pnsw/kOvXOmvjof113ip2W2Ey2cPXUiAt7vuCcC0/+s6qb/AdCJDOWwC58CTEvrpag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792587414;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8N2TaHMWI8j5xcPeZMdsXt0buMI8vI6KwHU5sNRNuKI=;
	b=qOeQKeMGBqzgEdrD3JP6EvBhHkCaTpW1HlkxPta86u6wR6lakrlZYtON6I7OQhsdjvg3
	 YnnRnXB8F3dolWMI2FgSgSL5cCeACrQORLF+HIg7ygKyL9us0rg2THqayuRGPP9FmZMyR
	 mdpXfnh3seTpGn9ccG80sO6pqQ+eICkkiJP7BM2uSkGsmRpGINcoXxPXgDaMib6KddASn
	 1/us978jj8tLBwzkaupKBvs87UYML0dxEqM60plT+cs8yCZYa0qWcrO/d+ZHn+yChwa+B
	 wCkVzK6bA6A3D0t7inNQ9DuyqR9/9mChoPAJtpEaEY4p2y5uLE7Y2GE3reuqYruY4/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CFnH0X1v;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IGBV3yWY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817AD606A32F
	for <linux-remoteproc@vger.kernel.org>; Wed, 21 Oct 2026 12:56:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 817AD606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CFnH0X1v;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IGBV3yWY
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBg3KO3830124
	for <linux-remoteproc@vger.kernel.org>; Wed, 21 Oct 2026 12:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8N2TaHMWI8j5xcPeZMdsXt0buMI8vI6KwHU5sNRNuKI=; b=CFnH0X1vYTNqj+Dr
	tnTyG31yDCu5C2kNe8tE3NzeAcDgYOHqtYGUh+P5odDF+jUSuP2IYlcfYQvpCmJD
	Pazu1aTtkDWG+1z9JdTWaiNI0S8sodgXqoq4fbNpcyVy62LJPWB/MZTJctCWBoWi
	M7cj5PFPS0xXqpAVT+pI6EYr7huerP4XY5yq+71EA6Tv8I2zXUdhlbibPZ+DatQe
	si8+lgieUNfr725H54kh7LV3GwxZz0B9seWVYhftGLGA1LNsO7rMgg/1bKR+UZRo
	J0KC7cv2YLEiJY0c504iMSd0oATmOTeZJmBKZizsxqR57QBp1mkdeAnIPWSAeom+
	tWnvWw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hebyd4c24-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 21 Oct 2026 12:56:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934a8cd3a8bso8304885a.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 21 Oct 2026 05:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792587413; x=1793192213; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8N2TaHMWI8j5xcPeZMdsXt0buMI8vI6KwHU5sNRNuKI=;
        b=IGBV3yWYxhD7x1joM1YjcQ35jowFUYHaSvYwb1ex0tg2s5cY5hdfsRpTVhb2RLL4S7
         ZqkMtx9sz9ctlqK7WbxmtTwwc+ZDaUAwK2ohCWYrqVzzQiwNcXc1y0+HbeWgOzKnQS16
         UU7QrggfdV77guqdJ0vGKGOBH81D5hWG2j59t5o5/Hy14m3oKff2DwQ79tbCR7O0Qnvf
         CKs6KKiM24lcXEVH7qJvJEkGlx91VZLohB2wsKfZBjxhqtZ1g1P99IbgvsVanLRaYq2A
         K1VqJ69if/9eMVZJGUc9rJo/76XqhGjd2ZYOPLP9j3H2yZ8ACHutXWP8nVKR3ybPL2lB
         PilQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792587413; x=1793192213;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8N2TaHMWI8j5xcPeZMdsXt0buMI8vI6KwHU5sNRNuKI=;
        b=n2j7+p8xk0zPk/IDdhPOyUYCfpcqX+Win8VdhVKcXpSydoEWEAuM50fy12y8prV367
         eI9f9s6xsPnj2lyYpSLw6Zzn99UAduMrRzGmjGL5ghaVx9n/7mzRBgHLy4yMCLqnMBh7
         FZRMCFTuMdf6rD5j+gJRa9tLz2VBQ6x283wjZ0IuM5jyUDnxBrNFw66sxy9SaIyyjnKY
         lIi44LMnSPwoNrZcPmRhcVfv3G5WJC58rk15fRK2HO9RIX70lBXk0a80Q3PlSrntwGGR
         WyyDdR/CVonJVZf93ad10eWcQ0LZcxZR7ZfHygU2HhTwDK1Ju9I7sSS5IizEj8Lk0HOI
         0I/Q==
X-Forwarded-Encrypted: i=1; AKwUvByoVdiwIxSQRtNQ6fB3eyyD2G5jweUy2NFeur/fFzGqoQYZtJWLIWUtgjY1DK8EP9h1K2U/t+q3VwL/Fvk/9ZF2@vger.kernel.org
X-Gm-Message-State: AFq9FYKatnxJ0z+n+g3qbnfjABh6+B0bJDUqlhERtmWUMbVFRjgjhOQY
	o6l1T/FkScly0f3kdu9dQ7uXPixsTYgIy8yKjsNUcW63A3qqOWZjs+hRbw8VPamKw0iclDHSX6P
	l3+YX5z+hQA3EA3wlPvASZhnQvjG9fzwxz1/4984ZNNwZSOIAJtmpvnjdtqPQ6ENQZoaDz+MU
X-Gm-Gg: AYBFou1enEJF9GkhaQFa6wgMwJrtwBpvKYv3Cmysxzn2Jmch3ZRsmzeQ+TkH9Wk9qRd
	5UC8AzVe05mKwKWbgY3zZI01uh4dTm1hcbfKuQBzHJAQp//N7tQwXWNKakN1squcA1b8kPN2jRU
	quMQ9ElzVzsssMfH0pVQwzMxkgBA04Z0MFSFOHDS5I8Jk0IEAkzTNkBvKqgFipfYu8hK1BQXrkW
	4jvWJBcXhELR8T4TqwutSxAJMKRU3ssF+TLEcrUVpiuC0HGPf/XJWlKm/k+CAZdUNrufg5EOGUq
	PPKuK/4ET1ZAxAoY4woK/jbzB1uO9IFfwSTSo76aUnM04jpWIbgiPI3qb+qgEYCBvslFN539f7g
	nkxaJpVBZB++BCi17m4iM4g==
X-Received: by 2002:a05:620a:6087:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93f57d6eb34mr480105585a.0.1792587412645;
        Wed, 21 Oct 2026 05:56:52 -0700 (PDT)
X-Received: by 2002:a05:620a:6087:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93f57d6eb34mr480100485a.0.1792587412035;
        Wed, 21 Oct 2026 05:56:52 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678fe6f4asm75163166b.65.2026.10.21.05.56.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 05:56:51 -0700 (PDT)
Message-ID: <9e902800-8c51-44bd-bec8-5cfbcceae64b@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 14:56:49 +0200
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
Subject: Re: [PATCH v8] firmware: qcom: pas: Make MDT buffer retention
 explicit
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20260925165231.10722-1-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260925165231.10722-1-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1MSBTYWx0ZWRfX7Wm3INzfW/xw
 VtaujPkc/9O1Y8FCK+zuAp1Zg7osqhTZ6E5WhDYW9UAEhnEAXTDGa/ObNP9K5QFmuXkZ9RWk4mH
 U2ix6p0g+SvNQ+iPJ7+erfXgqsNgBFq90oSwNXwNqmF69tKJRrB2aFRjBtqitGpJtA7nVDiClI6
 FRKEGF9YDwiFgl6LLIZVJtq0EsCre4SJUJr0XAQnoTCkflQ2WMr/AGCZbKRgPGy0t+mWfCmBZY2
 h0CChh6nl5b4QuIopUjRY+sJfDgDE1MpV92dTqMZiUhcrBgPmt+mDCDLsUModwvmmE6RZPkn/RT
 aPF+VZYF3jgYPKwLh5qXgY+9rAi0S5+fl1AOb3bYzgMPRrBc2me46psHoyHj1pcvLEa8ELtLW5e
 B7AlO+p0b5BvD9PZd0RMbAb0qdqBY/2HIOSJJxa/Rw7IUJj63BdaGdhvosdrs6MGlMHEPMWnist
 LWXajlPe2m1Uv0DEgdg==
X-Authority-Analysis: v=2.4 cv=TdsDJhQh c=1 sm=1 tr=0 ts=6ad8b695 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=oFv1cWL6vE1NE88U30gA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: HiemUJ13_HK9SSQmLmGFfFbLUn-67EPI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1MSBTYWx0ZWRfXxDeFmN2cwJBS
 ZwNrJRsspuGokeJ+n51dPzmZW8lAoxL+fxnbmMfZQz7V1ENHDG7/FAS1O+rgizsnSEWlblc8cg+
 RAbPbnY5XzDeMOr7Xq6xdj1QqukuI8Q=
X-Proofpoint-GUID: HiemUJ13_HK9SSQmLmGFfFbLUn-67EPI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210051

On 9/25/26 6:52 PM, Mukesh Ojha wrote:
> The PAS image initialization path retains metadata whenever a valid
> qcom_pas_context is supplied, although callers may not need the metadata
> after initialization. This leaves ownership implicit and causes unused
> metadata buffers to remain allocated.
> 
> Add keep_mdt_buf to struct qcom_pas_context and have the generic PAS
> wrapper release metadata unless the caller requests retention. This applies
> uniformly to SCM and OP-TEE backends, while qcom_q6v5_pas keeps metadata
> for subsequent PAS operations.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
