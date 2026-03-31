Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A8C3B635C
	for <linux-remoteproc@vger.kernel.org>; Tue, 31 Mar 2026 11:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774956124; cv=none; b=Vq0d3q8jXFhbreaJdAPdMARsmtOCpNnXvpq7CdqOnvwtCIzXOIdMluojzbI4XBRQ5znTh9lZmJaT/vnanE0fWGB5degOqk5t+JBvtUv1yvcSUonZoV9HS8vWvcXdSrejy6A9BsXYy16LzlucOAzmTbCHu8Ej7CWsj91X7D+P0RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774956124; c=relaxed/simple;
	bh=9P/usWztxWWHG+07j6bm6BpWeT7+v5FTANhElbZehpc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZecneLqOGpGXQK3pHrTZkwG/uz0VLWa4KOYl3bETRmhS0CraLnEikudPgCD2oQqXqDFQqx52iYSKiQmi8fYVBiKlMKrcqdTbCULhNB9UrUIU2AE+7nzkc6DdlfRI3ZgcOdrpDPnnMWooigjvmLE9UCaXEKp/ngjTNODR/qUEEaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LlYLGFFd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xl7+X6K/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LlYLGFFd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xl7+X6K/"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VB1P7v1841971
	for <linux-remoteproc@vger.kernel.org>; Tue, 31 Mar 2026 11:21:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bRj9HWhptdTu03knw6N59eAK
	dBJYVTdEtizj9gAPARk=; b=LlYLGFFd+54tR63WAyA1eLPR7moFRD6ye4qSyBaV
	JF4BQvmM2GE/l9DECqK7EYxEsTJaL4uruWLrEa3rJkRzrWPQyo+VqMGABerKfRk8
	8OjotDCsebY6CRd/VDgZimK31iUwEHduy9L7tW5UX5SC8ijUdAuWyTokiCkY/SOl
	Ks3oNCK4SC4TQviF11S+zGNZNLQ8ojYrSU/UJKx7wzprcn8AsML0Z/ZhzGqYvxNE
	HXoSTWhf1oYf9StJuW8ZS2mQQ49eoBpHiEPqGBrxNPvQ3HonZ8zw8DxRJB8bJqpn
	rwr1DswNg/22NOjn3UzHnEQ1dalYKqb5yDNawvfXxMoG8A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d80rsjsrm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 31 Mar 2026 11:21:56 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2c8ac8e422dso259036eec.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 31 Mar 2026 04:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774956115; x=1775560915; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bRj9HWhptdTu03knw6N59eAKdBJYVTdEtizj9gAPARk=;
        b=Xl7+X6K/4vdmgKVt+KliCjEib/hqcfApY6st/Bltbw0kDY/MsyN4eHNgXWjS7TVrdc
         IvXfGn6j4+1TmSTk9eHon/jspkiNZKQQ3bKMtjAEAlL3eImM59c+a8bQZqvpmj+1z1PE
         iZuntutIGN0ib2tGHF8FJ0zIB0LT5SBNyS3jkbw481ZxzlHyQasAlqWS/IkJXmCf14wx
         UvbGPgsMbLcokAupX+WDFxucc4w28X4AX36eRGIvjF5sioWY7vgLRQkUUFqZlSLuqi+U
         q5LHflp6yp3/TFrrw4RtIlZS4gMbkeaOGxpM2hVK6WzxPyIV1FJnkdW80CbogcCqCPTp
         7frQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774956115; x=1775560915;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bRj9HWhptdTu03knw6N59eAKdBJYVTdEtizj9gAPARk=;
        b=BbCQX9bFte+Cx9R7mVd2Utt1W2ZGbuSzDQ/nWW20N3SZezSexQ0uzj9JxgHkxlHGSZ
         LE+dI8Ib5WoSXrT838hbJnWEb0XDPvFHICfrnmNy7wnP8IpGzLkpFmZKYGX13bvzquMj
         uh6+w0HgGfsfcLo8tMfLvTEhXgIz61+ZgBIf/AJUPw5qHDIQXwEMh3pPjyWM0mf9SWUB
         OqRAbhwiNH0JWmMrjuo9Gu15fdArxUJ/FqAViqJW+h9tmbxeyrfhl5QGFrhnvjwbHiyA
         7POQ2gmjSjrZN+cXJH53XolRR0DxUoj3bqRfVPnHdXJC6iOHN89VOxoc93hgoMT1U5BQ
         Dxow==
X-Forwarded-Encrypted: i=1; AJvYcCUweAzizjo2dif/eeBvDwQFLUa3pCNQbmfiyYu7W9wPR5F3la+9yhIqqcMnZO6u1f5x73LbeUODd+Lz+hUwhL4k@vger.kernel.org
X-Gm-Message-State: AOJu0Yw01spLJutY6rNcGg7xEqMt6w6GM8h2+PN6DLBQDIgOgSwgihtc
	in/iDylNMlWr4PONc/veosLxGZtRm3A66J0EFG4mIkdnX7VxrmhheAwO5ESVkgLb+X4Cf3kxyik
	0JdOjLO4jksO6tR6kUJGOARULaKUfBfmq31zLfy6Ov/ShR1L5N+YObCXcWa5WcLN5oZo8vKa8
X-Gm-Gg: ATEYQzyu/v/avmG3EUwUrARGRBRh9HxEFjLd5ccznAYBVadKqiWHctefB5epyoTVuWT
	1uJCsUe2hsq0q668gTrRf7vF/IQwLqo9fUUJufaEg6qDovnytm3G7NxZPL6gOkVvQ2esZQH+Cum
	C9VZTEcFrQwV1Xj0/bxtW8gqexDBylmtFhED/DTCMpPUNHbj1maNK9UWmBEwXaQHVPZ52P31lPY
	foOSrAZS3O6B6lbdINWqH4zb3QyDGuyRQjn1EmRzNGtWTleonMHdCRiwbow4dB3PbAi2a8Fbo9Q
	TFMLshIy9ZySOV0KK4DPi624Z+kjBh2glmAQKGD7o6wbEtmVcNNqeBjPnwRrZUOmuvXJbb9VgOQ
	9xn2fJN+dAR73RfaXjIbhYOSaqpBztXR1DxuY1QXCT+YAfrpWEXuy4MSX3+uDZqwy
X-Received: by 2002:a05:7300:d512:b0:2c0:d46d:cfc2 with SMTP id 5a478bee46e88-2c185e365b2mr8275324eec.23.1774956115059;
        Tue, 31 Mar 2026 04:21:55 -0700 (PDT)
X-Received: by 2002:a05:7300:d512:b0:2c0:d46d:cfc2 with SMTP id 5a478bee46e88-2c185e365b2mr8275305eec.23.1774956114515;
        Tue, 31 Mar 2026 04:21:54 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c68b399bsm9547037eec.17.2026.03.31.04.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 04:21:54 -0700 (PDT)
Date: Tue, 31 Mar 2026 19:21:49 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom: Add missing space before closing
 bracket
Message-ID: <acuuTRgZ4T7b1xGE@QCOM-aGQu4IUr3Y>
References: <20260306145607.1394878-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306145607.1394878-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-GUID: ORFYI0OEmrCFdLeOku7p9mT6bBPIn_ol
X-Authority-Analysis: v=2.4 cv=VInQXtPX c=1 sm=1 tr=0 ts=69cbae54 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VxBamrIxFdMkSKUz2D4A:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: ORFYI0OEmrCFdLeOku7p9mT6bBPIn_ol
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDExMCBTYWx0ZWRfX2dYefDwM+5N8
 tibBMroSxb84+Yx9MYL/IiHvrATStDcVXL7SSohX5SLGqj5IdKMxsr/x/RPSn2+aE5ZpfZ6VtBX
 l3vQzU1tt0SkQ2bP5Gbg1n+JNsGRd2McbIhCXJd9yy5Ybns7LGzyrxRQAXeiNaeFkERCjoe13fr
 1TDSBoHoJgoLxr37EuHL6waRaJcqXSbQCa9d8WfGuS5bKjTS//JeQYW4q6rnd6PwwP8GM+dK649
 cCrKeHsNBga66+LVUZkJgyug5LyN1KI+gngYH5zelx1gFe0uzMMpee6XhNx2neJrKXi+4pobAbP
 3w+PBx66R58NtKr58pzdtzBGTpxjwYIOWc/O0obamVFABLM9HtqvDplrrRtd7t3GB2fvljxLnJT
 oY7rCjiMbmp3oia27pTZoZSFPzvVa5fVq9WrLj0KHjJKFRfTDpd4Bxx2oAoc9IbkB4l1SxfesUE
 nKypJ/R5yRawx+pAKDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310110

On Fri, Mar 06, 2026 at 10:56:07PM +0800, Shawn Guo wrote:
> Add missing space before closing curly bracket for qcom_q6v5_mss and
> qcom_q6v5_pas driver of_match[] lines, so that all qcom remoteproc
> drivers are consistent on the common coding style.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_mss.c |  26 +++---
>  drivers/remoteproc/qcom_q6v5_pas.c | 138 ++++++++++++++---------------
>  2 files changed, 82 insertions(+), 82 deletions(-)

Hi Bjorn,

I have to admit that I'm a bit paranoid on these minor coding style
things.  Let me know if you think such cosmetic changes are unnecessary
churn.

Shawn
