Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468F9247291
	for <linux-remoteproc@vger.kernel.org>; Fri, 25 Apr 2025 11:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745581654; cv=none; b=smMKiQKuJUz8qOFvKJoUch8rvyZnr6kk4hHAVVKljqgwjbZg35jO8E9LiI4+uOoJjI6McEjLyAIKX17aw51lyMlucqh5D8HMzrpE/F+9t5LRMpD6MdGeOhUQdjsClEWx/MMnfD7Seolgo8kpsULZllPeoFnF7eenFYICMeUT/n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745581654; c=relaxed/simple;
	bh=XO7eXHdqI8BqtXpaSUZZG5qhD1KGohbFDHON/kPDFUs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=STsD9qKKMnoNwC8O4R8mj+3XYIXRx+rO9ElFDFsDB1jWMQcU2c8QGmXPAMk+TVOyCt4STOCQJXDgviBYrtQlkC6Dr4tvmwHgpDIjracdXHuU5P1MZr8O8ptajrO+O2f4sub+0SJD9gWr6eDrVHNSAYWTql+yjpqbuqPF11A49EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d0L+Fz1B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d0L+Fz1B"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8TDV2023075
	for <linux-remoteproc@vger.kernel.org>; Fri, 25 Apr 2025 11:47:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4EeiwX9qep+py+Z9/Et50dh896Nhy1ey1iEAX/LwG30=; b=d0L+Fz1BdCbFVdX5
	3srrdgjirGruOnQOUxnqWFPGG2PH47ZwvaMXZFeu21j1TiVv6qeCzVf5U/2DJZ6s
	CwyaNVYkKTW8lxu269mtw8grSneTkGNpd+hVqcXNxVGtgeiG1W5kZMPdGfk1q6gE
	Z8ifz/6s1kY30y+gDIp7U2D/ebdbNpENS7oa/RxWg8SW69TtI8xfj/myzL03lCKQ
	v1etWNx++/SZqy7s+VqVOJWYxMRDP+GahcQJ6fL2UlxWGlEO2MeMhCo9xWSbVjtJ
	ZdBfm/WQeymlQQR52Fo/Zjnc+mVqxn9KLcYz8iogGmcXgL175qCObJ6rDqk+XLlU
	ZO7h7Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0gyy4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 25 Apr 2025 11:47:30 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e8fb83e15fso5476966d6.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Apr 2025 04:47:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745581649; x=1746186449;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4EeiwX9qep+py+Z9/Et50dh896Nhy1ey1iEAX/LwG30=;
        b=bL3Oi45sAzWhi1hi2A5uJzkPxyC24m6vd+K60jlKJa9HdAYdm+tiooWourS5ANjnnw
         eO4qRYSoGDbXknJIekPHm0fLl04AHRGLBl5seFGbsPsAGJTssss5S6b3G70j4Z5ZcPk4
         Zvx5LAkF91bctZKqYuKGvI1mplA93XS6as+3MClb35iJKDWsfrjp29IXIKvAlxA8TITv
         8Nqdaj3+S555lzBekTpLJ5M61cw6zGSwcw1dwpuygDgAlFTwC2T8t5gtATQWu8cr1ueB
         gwc3XD/qnlHyh1PBlGJVIvGm7zY7CFsfmMkNCmXJSmDc0fHlf0+H3CgecZvQeCTSv26F
         6VPA==
X-Forwarded-Encrypted: i=1; AJvYcCXmbF1hJ3OwEEk8fU1EdQ1/UnK9LNx2tZKK1TrwlLvQWoH+f3+WGw5BFq3Nxnmg2PgnlFjMDFbj7axo32MHrpxE@vger.kernel.org
X-Gm-Message-State: AOJu0YwhO/RXNTaaxWwDQQ/eqPJeRZhzAEC5YVpQyLOL3iKNhQDuiMok
	xS4a/Ty91C55UBS3XYKhimUHY8EtXgW2A4yOmf1knuAgJIjxXQqzY/MGFPljuYGPdrxKePiadFy
	XlG2q0cqGCqx2BcvKlrKOs0r8HIH5Ne2fOq08J6ftOm6/eHjSvBMFGZHn972nJraSmHnt
X-Gm-Gg: ASbGncu1/SU42ZCB4oLFgcpN5uGlgAdF+VZS+UEv95Gxx2cCvPIKmH7o60sdC0UBpwq
	Xy52e4tt/riVPXr52Ztoc7CQIH6H14bcizy2FfeFU5vxEob2bk2ik3t7ps4lnVFg8HipM8HJfZN
	6/rL7BWCW0mLbZNWVaRQkbTKq+NfV3SvHDsU9xYLcq1Pf0YLo1DwceImdakeNRaty88Z50uXYnD
	H87TG7S6M6NEy2Lf+DxMJuqPazSX/s0uTrpwflYKixAoq00IuBQgddIL/syVPzYWkF5OrseOWgU
	x11SZkkZn8ClwnKLxsxDeF3ZDN5IMl44G99Q2r/ailVYRWUwkMjiAh958474GiUH
X-Received: by 2002:a05:620a:254e:b0:7c5:606d:dccd with SMTP id af79cd13be357-7c9606a36b8mr125288885a.1.1745581649014;
        Fri, 25 Apr 2025 04:47:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMoKRaTeGlfhGtgePJI4DvsKPnQLdcM67oaFtMLoRU5+ujh2fa+ywF19BWSakcsqA6J27vZA==
X-Received: by 2002:a05:620a:254e:b0:7c5:606d:dccd with SMTP id af79cd13be357-7c9606a36b8mr125286785a.1.1745581648458;
        Fri, 25 Apr 2025 04:47:28 -0700 (PDT)
Received: from [192.168.65.5] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed729e5sm123047566b.151.2025.04.25.04.47.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 04:47:27 -0700 (PDT)
Message-ID: <72f0d4f7-8d8a-4fc5-bac2-8094e971a0e3@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 13:47:25 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 3/6] remoteproc: qcom: add hexagon based WCSS secure
 PIL driver
To: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Cc: quic_srichara@quicinc.com, vignesh.viswanathan@oss.qualcomm.com
References: <20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com>
 <20250417061245.497803-4-gokul.sriram.p@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250417061245.497803-4-gokul.sriram.p@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dcWfZOSlONtneho1rEd3IOBsWdOoPwrd
X-Proofpoint-ORIG-GUID: dcWfZOSlONtneho1rEd3IOBsWdOoPwrd
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=680b7652 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=vBGl1dCRJspItBWZnfAA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA4NSBTYWx0ZWRfXyssOX20GwXCF euiaXZkNcujLvDO5ekAEzRRQiu1SV1Y4yQJygCnZKUXLO9ehW+rdZsV6nOGCBfT3KdMMN/XIeDw so8/esH8lkDP83ZPFyBdvdpE/QKJTRklPclwIz6HkYMjgP4cbLL/lvPV4fa8imtxBBrQTT7Grwk
 t15bha/KpRIN4ZqJ3T2RYzAiSXWqhP9xuShqyNfvqGsMsRyS0Yqhk4+c5gyoT6zrOGjBhUfHayS zfb3FSia/8sT0BxlAWZQ4stPBAGf/t0DH1sSp9+mJmHP4RoRgNungoEobuX3cOw7lj3KAMK8Add BngK0cQygghPwbNXECU5utJB9DP3W0mXIByS/KMFiGI+QlqSH9HgM5MXwnQmGNQ3yJAp/Q68CVk
 G3oCyeFNZtHYYnapn9LRhVSBRk3lLP1eFgC0L5MJFkZFGii2GsZDgka+09lm37QhH+7bwBy4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=661 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250085

On 4/17/25 8:12 AM, Gokul Sriram Palanisamy wrote:
> From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
> 
> Add support to bring up hexagon based WCSS using secure PIL. All IPQxxxx
> SoCs support secure Peripheral Image Loading (PIL).
> 
> Secure PIL image is signed firmware image which only trusted software such
> as TrustZone (TZ) can authenticate and load. Linux kernel will send a
> Peripheral Authentication Service (PAS) request to TZ to authenticate and
> load the PIL images. This change also introduces secure firmware
> authentication using Trusted Management Engine-Lite (TME-L) which is
> supported on IPQ5424 SoC. This driver uses mailbox based PAS request to
> TME-L for image authentication if supported, else it will fallback to use
> SCM call based PAS request to TZ.
> 
> In order to avoid overloading the existing WCSS driver or PAS driver, we
> came up with this new PAS based IPQ WCSS driver.
> 
> Signed-off-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
> ---

[...]

> +static int wcss_sec_start(struct rproc *rproc)
> +{
> +	struct wcss_sec *wcss = rproc->priv;
> +	struct device *dev = wcss->dev;
> +	int ret;
> +
> +	ret = qcom_q6v5_prepare(&wcss->q6);
> +	if (ret)
> +		return ret;
> +
> +	if (!IS_ERR_OR_NULL(wcss->mbox_chan)) {

You abort probe if wcss->mbox_chan returns an errno, please rework
this to use if (use_tmelcom) or something

[...]

> +static void wcss_sec_copy_segment(struct rproc *rproc,
> +				  struct rproc_dump_segment *segment,
> +				  void *dest, size_t offset, size_t size)
> +{
> +	struct wcss_sec *wcss = rproc->priv;
> +	struct device *dev = wcss->dev;
> +
> +	if (!segment->io_ptr)
> +		segment->io_ptr = ioremap_wc(segment->da, segment->size);
> +
> +	if (!segment->io_ptr) {
> +		dev_err(dev, "Failed to ioremap segment %pad size 0x%zx\n",
> +			&segment->da, segment->size);
> +		return;
> +	}
> +
> +	if (offset + size <= segment->size) {

I believe this allows an off-by-one (remove '=')

[...]

> +		memcpy(dest, segment->io_ptr + offset, size);
> +	} else {
> +		iounmap(segment->io_ptr);
> +		segment->io_ptr = NULL;
> +	}
> +}
> +
> +static int wcss_sec_dump_segments(struct rproc *rproc,
> +				  const struct firmware *fw)
> +{
> +	struct device *dev = rproc->dev.parent;
> +	struct reserved_mem *rmem = NULL;
> +	struct device_node *node;
> +	int num_segs, index;
> +	int ret;
> +
> +	/*
> +	 * Parse through additional reserved memory regions for the rproc
> +	 * and add them to the coredump segments
> +	 */
> +	num_segs = of_count_phandle_with_args(dev->of_node,
> +					      "memory-region", NULL);
> +	for (index = 0; index < num_segs; index++) {
> +		node = of_parse_phandle(dev->of_node,
> +					"memory-region", index);

https://lore.kernel.org/linux-arm-msm/20250423-dt-memory-region-v2-v2-0-2fbd6ebd3c88@kernel.org/

[...]

> +static const struct wcss_data wcss_sec_ipq5424_res_init = {
> +	.pasid = MPD_WCSS_PAS_ID,
> +	.ss_name = "q6wcss",
> +	.tmelcom = true,

"bool tmelcom" is very non-descriptive.. call it something like
use_tmelcom, or maybe flip the condition and call it e.g.
tz_managed

Konrad
