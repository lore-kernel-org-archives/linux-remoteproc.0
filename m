Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11991433BC8
	for <linux-remoteproc@vger.kernel.org>; Mon,  6 Jul 2026 18:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783361611; cv=none; b=juwNT8LHtK8OaVAoS3kflSLbDWAFyr+XS6NIZs9r7JiAwcrJORqWWoaKuRWQEbDtuiZ3MSeiPzyqNLmd7pvwbzGb+4jzAnrSiJuxXM/PNdC4l0ZrM7nnzSlN3wGbuoOXaA4X4b0NfyDAX5oAP1/aZFKdo1FDFKK00FTVZ9RsTE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783361611; c=relaxed/simple;
	bh=4DZvEIZA2+sxTIunlpdVHrdORDcA2xWTHPtkc8lVWfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TUi5t39gE9F2q1JfBuIkRETV25ZMNHhdsvvBCg12fT9c2vtSvf9/UDKQMpuRpOEvPnz/roKHAtH1VDMAzy00b5zylF7j+Kli1ZXLq9ufLnftjvTq+8qD6oIwKtwxViAW+6dWbcZylS7Qt1+JXJ7vqJXyqeWlCeHlN+LvYdwfwKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yl9AUP47; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xa3Pca1O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yl9AUP47";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xa3Pca1O"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFKbe901129
	for <linux-remoteproc@vger.kernel.org>; Mon, 6 Jul 2026 18:13:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EkRx4lIqqRFJsnIqB0R6EPjWgTCRZYycUonsPfbypHk=; b=Yl9AUP47ngtT8HJE
	nvn48dUHlDIYAmSOgNxuCIfMt1ncVyh7hYv15bjZA2hq+uUqxyzUCWqV/W+9lA0Y
	Z5rKRO2VlND09ii8caWAv8cPmp2KUbc/LYsKeaIkFf5CcSdRdOEXrgwdtvau5XR7
	p67CaW/e++4OM5YBmOV/V76L/W4qXA5wUDxNsGh4v7UJ1kxRGVnX+c1dcOreF76n
	OU8rjJS7YpVqNo9HxftGbohBZlY3S1MIhwwFk2S1F+EhT5JJ7HQVyXRavey9pOjf
	BTQ6j/++ySt9aMhmBk2N2hJX4PzxmKHh+tHp2hbtCj6i16oa8T4p53Smugx1Y1Yd
	IrQ8bw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87q7jwvh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 06 Jul 2026 18:13:27 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-969289fca9dso730591241.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 06 Jul 2026 11:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783361607; x=1783966407; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EkRx4lIqqRFJsnIqB0R6EPjWgTCRZYycUonsPfbypHk=;
        b=Xa3Pca1Oku4h+Ci2qTofQQWfWfkOkf+58jl9X7erCU02c1+uLcbmuBzjxntwtttRIe
         Ls3cJDHBrTMm5EjAZUGqqOFU3UX56QdEtnveGaOMS2clkILJclSXpO+/n+JvMpJa6ka4
         +9rqQU5IiXp4qjul7weJli/gbc8ahqW6zDd6gBuZv9ONGcPwHVrCdpbmKwvlsL9WNnAZ
         s82t5926tFJHbpZnEzPqgOVAkifjq17irf3XmR062FE698z+Cugz5KKh9UXcfFtUZNsf
         AvAeixunwz5s6CGCWVwK//r7dtTakmBXq6cFmDKYL5orv7nF0vuA2LsBlvsGBVqp50Gp
         EMfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783361607; x=1783966407;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EkRx4lIqqRFJsnIqB0R6EPjWgTCRZYycUonsPfbypHk=;
        b=jr6Rf6SmBvi6pXS3oCNI4Z75P9ZY8pm6aEZIM3MvCK+Tza/ZOiWwdQFn5UBOMLzaYI
         K5rnNGGaO/6rk4cukGXVX8RMDHe8ykttLKnf3IcxfNaN/pVmLw1BXUHSx6biFTrF72Ke
         uQEywCVPC9nH5iJqBo9FLmNXeTIEutE67sGybj71vWXYizuix9Rk1y8ysk4jLg8F4o43
         TlLgmI23KoK/wFbNTuKyLPC+gRXYgQBgP2LlmtFhoIiw1FM1LoOVQU3l9gn4w89jZiGU
         Om2uh3EOv3NJd/fq3fk1jKKBy+psB4qrfXr63RLjyOHPjwmMIgl+PBfHFUE5nMBz1nNp
         X7qA==
X-Forwarded-Encrypted: i=1; AHgh+Rp+DcJ/7PiGQrg6fUIJqJK/gPzIq/4oVAsNfjLC22so0107pQGnzICA4nKv3bIeXTsFIGdoE1rvpMqM3fRSSEUl@vger.kernel.org
X-Gm-Message-State: AOJu0Yyeq3xfub9wVVwl8mXFiw7m2qExJ+UPd0W3AUZRUFRTMx9WAogL
	Bvt/DmuGitzokUezg8QVYfFUKxSfCVfytnOws0wgfrfDKkPbgjFoETsoEz4GgcnNousGKFgLH5W
	arrteCRhH55AgTOmOnGoJrcHPRfM7tD4IhE3ZLQ22VVd3GulHkWy4FpZfZX0pnZaHvgpHIcU4jF
	Oe9PQE
X-Gm-Gg: AfdE7cmtfO3Dg6kNN6EQsi1OUIDWvSn6qL8o+wY52oNN4hqsJYJcYSmhsyxiGMW/da7
	LfpmbCTGZS7D2ME1PNR7mkLUsa5pyEI0s+JhMahGI5l60yYYUEyBFjJlriJ6qaYK2jEhrKwoyyq
	K06Qzc+EL1smzveHquPzoIpvjeE0RZIl0xhakxJ1ciWrNUIeA9PPprl7+Ke8EJ5wv/dASnQCon4
	Z2wiOD8TSD6hBXKNpwttgH0yPEgIhMpwDRbCr7oH+WEzuI+iDedt505Be9sZy2JUpVE9Msdc8w+
	zuvn7UaYzQZkW8RRtSOCIQW9gNKBhUf9zxADXlxwE3g+KBaA1YvQfYp/d93XbcP2caB3UlhOi04
	g/6Sc8P8t7v7ZSVJnFZFPYZm4cVn4Uq146ZXPg7yEWabrtKKiwsB1mfMtp7FGPIGCOOCtQ7f2fZ
	VJtgqjZmW7EDFQLEn15sQoN2iT
X-Received: by 2002:a05:6122:4f82:b0:5a0:afff:78a6 with SMTP id 71dfb90a1353d-5be908f759amr847828e0c.14.1783361606534;
        Mon, 06 Jul 2026 11:13:26 -0700 (PDT)
X-Received: by 2002:a05:6122:4f82:b0:5a0:afff:78a6 with SMTP id 71dfb90a1353d-5be908f759amr847809e0c.14.1783361605969;
        Mon, 06 Jul 2026 11:13:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bbbd1sm3012662e87.44.2026.07.06.11.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 11:13:24 -0700 (PDT)
Date: Mon, 6 Jul 2026 21:13:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v4 6/6] firmware: qcom: scm: introduce keep_mdt_buf flag
 in PAS context
Message-ID: <yg75raxv5nlbcg4jwytba2ijqe4qsrutw3i4xtc6sxenbnaxqk@fnutisnlywf6>
References: <20260430191253.4052025-1-mukesh.ojha@oss.qualcomm.com>
 <20260430191253.4052025-7-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260430191253.4052025-7-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE4NCBTYWx0ZWRfXxXLHht+PsF2Z
 evtq/+srsmwxWC+GCOfrR6fiEVLJA8abcclwaAzIm2048KxtYRZBuw/KAVIZK6mWawQJH4+jFrt
 D9hRIwpv9NwHyc0rbSKgxUxBqW4g58H7jNSPuXQajTWchJInmNdKS97x18MGOfvs93wH3guXFgW
 6xKhLPqfqRk16RDyrFcCT58vgoLNXeh4hHRlHEN+ka2ZHATm/tfF06gKIk3LjuG0bwiKfgojeNo
 Wz1sNrIkblSXgXHZrr0ixuh8Dy9FUh79DxA93s3tDvwg1udPZ8lJ83l9oRSUy3HpnfrvatQyERD
 qOWT3iCJcW3kwy7MUB1Xf2iXRu4+a1sCwP4dvhB7vAlBEuqTY08o8sIZgYNJ3yEmIN5BOq70yJ0
 67ZzF0Y8O7gT8pfi5NSYafNvWtaQVKkfGlmm+e425DYDcIsXb02rv16ADbyCnMllQpgVr2nUUMu
 v6ImIWku5tIipTg7dJQ==
X-Proofpoint-ORIG-GUID: XG7H52i0IKSANWg0Yqemc5I1sdC0C3x_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE4NCBTYWx0ZWRfX7kGLCVHBpYZi
 +xOjLPGkFQB2JXPZGVza/M1dnV+hwjmPND6ZiKeFR0DmdfeLztAoikv25CTG5MGtWOZnuDui1vC
 cQfAS4MttVyfGJ93RWMhOfmePSYWSgs=
X-Proofpoint-GUID: XG7H52i0IKSANWg0Yqemc5I1sdC0C3x_
X-Authority-Analysis: v=2.4 cv=f9N4wuyM c=1 sm=1 tr=0 ts=6a4bf047 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=JcZP6P7CLaFpWR7VDUwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060184

On Fri, May 01, 2026 at 12:42:53AM +0530, Mukesh Ojha wrote:
> The PAS image initialization path always retains the metadata buffer
> when a valid qcom_scm_pas_context is provided, even if the caller does
> not require it. This implicit behavior leads to unclear buffer ownership
> and forces new users of qcom_mdt_pas_load() to manually release
> metadata, which is error‑ prone and incorrect.
> 
> Add a keep_mdt_buf flag to struct qcom_scm_pas_context to make metadata
> retention explicit.  Metadata buffers are now freed by default and are
> only preserved when this flag is set. qcom_q6v5_pas enables this during
> probe for contexts that require retained metadata for subsequent PAS
> operations, while existing callers continue to work unchanged.

Would it make sense to make new API backwards-compatible, so that we
dont' need to touch other drivers at the same time? It probably means
adding ->free_mdt_buf flag rather than keep_mdt_buf.

> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c       | 21 ++++++++++++++++++---
>  drivers/remoteproc/qcom_q6v5_pas.c     |  2 ++
>  include/linux/firmware/qcom/qcom_scm.h |  1 +
>  3 files changed, 21 insertions(+), 3 deletions(-)
> 

-- 
With best wishes
Dmitry
