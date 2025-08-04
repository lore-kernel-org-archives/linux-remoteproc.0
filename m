Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81AC515746F
	for <linux-remoteproc@vger.kernel.org>; Mon,  4 Aug 2025 13:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754313402; cv=none; b=skxdYyIpRg3LuqPhwwNU+L7n5pGZQ7Dp5Q3pw8Ny2tNqxJ93JhkW6Kb+1HSLpCESHh75c0e23A0f+D0JDkH0nV1jiI/B4FWMp6yVulK9hHuoDl86+STOsn5YrFR05Vls1FhZXOA3NLN9/ncveAxwPQsnA/lUOVLMr1rRkG+LlUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754313402; c=relaxed/simple;
	bh=LGF57M35rgadv8iq9N20lyYQI6dPzqa4pdKZimyhlbs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iEyfoxuPg4SUX8s7jeqtuuWXvU26cKLhTCCaDDdZj7PUXK0i7YjWRE1zG2ZzjB4BET0gNn4lkef6TnM5eP11HqPG0CG0WGdoXgak8BARqvbDSrgpfRSd4G8dc0Subd82JxDhj75TWTP+rCKTDoJAoFGO9b/1uWDj88aLGBVzwHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bFFm/K5l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bFFm/K5l"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5748qYDQ012085
	for <linux-remoteproc@vger.kernel.org>; Mon, 4 Aug 2025 13:16:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wgXRWKdb8/uIkJlxKRlTEuKqEVXG1EaXlBO5d+CRj9c=; b=bFFm/K5lguhDneyS
	WrB0qC9uZnJMCyoyyTzA6D60uGTmBFWV6+ajaDsBYc1M+qeI0hVynRSaVyh8d0HP
	vwUnwNppc377sTEXgSpfUHt03B8qogqY6JbmEouNYZ7fHWrEBd0/gfNw8xSD/prH
	fWYh3kkIGXJxh4p0najhgLrQ/FqojwQwsRctULet+Dj22D296Hxn2OC3IurXQxWr
	yJL/48cqWZoEUdKxG93HmQv9sUkTj8/LIA9wJqBtIHt6TYLpEiZYUT1oNkGz8Zgq
	5IiC9Po82NlTrbgZdOvfdi1ahcQYSoQC0njdkx/BQgF3u/mzPzx22uEuXmiJYxSq
	pgMJMA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4899pad4nh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 04 Aug 2025 13:16:40 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ab3ab7f74bso11062361cf.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 04 Aug 2025 06:16:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754313399; x=1754918199;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wgXRWKdb8/uIkJlxKRlTEuKqEVXG1EaXlBO5d+CRj9c=;
        b=baPzE+deEgJl8iihIuzyW5snD1Hj0JaRLG0XeaTZvtTQyh0e2K9ICpDg6MCURPDtBN
         qsJFj51e6ugGSutyMeUWRWAv9UVHNVlDaeIOQ+SxxdVlAQjs4z8Hz9HiL1M/W9USEHGl
         RppNLlHKlKpepQoqnJLpFZLSuJFVwjuxJmreFKh43Y6pzprG082R0GoZ8azw1ixwGjdN
         yRZUCOewk4AVsWg+W/d94QIN8GnFqOSD0Ifl5Hnl0dR7IyANX9Pz4aGk3+RTOXehC2rh
         TFny5Nue2Pk+z6g1fU6jMchnQrKlxENeK5qMy7Q2pD4kOpZ9cMZQ8JrzZUvi8B80EFUM
         eY7A==
X-Forwarded-Encrypted: i=1; AJvYcCUHcpnXcOWjGRcXtdY8ykBH63Aik9HHAdFewkwZ0YvmIRJATGDgHe16w82Ph2y/xXd3unP0V/Jd9C0cVxh6Mwb9@vger.kernel.org
X-Gm-Message-State: AOJu0YyB1z+bo0XCsDrGekmFhfIGdvQNO7McCLUhKalCj7d2cRvU333d
	7NNjVFgHRhm3FrPmCuDtlx3qz4R4+nLK3fqYfexznGwVXolWiDPspQ+z0MQqgw7Z21GX4KnFkB6
	UE4hd+/RwNwoXlaXoeHcXqkKaBh5AMXRJ57Xqj28na7BChStyyP+lXq6b3CBgbIz2g9LpjcYa
X-Gm-Gg: ASbGnctc26UcyBAmkz5yaBv8lhl2oOrMoJw+W5UxJFFjgCThRjhUh409KohTyWiK2/f
	URuEAaYc8u0OoELC6stYQF6tAgQfp7kkZle/VGvq96sWJQO7Rowx433ik6DYV5X9Esars2CehVF
	/2fGlA+4X6seOZ6Vp6JkpCkvMxGzVcfer1aiVBVzQJkVILTd6U0yG45ZFBP9m6Al0ojdguZEeIC
	qcOoTO3LmGbdQm+4CA43iAr4yVTftV+bbwBol4dwqxfy+rRh8NXlMYIYFSmZNbqooI3FRh3WXMU
	AF0w3D8UEe3mdsfJpZX5x2AInAJlYOqbRV8S12L72ZuGf7JlUvw20Tc6H2ZFuR1ppOBEh8RTRRZ
	HBjpkrjotD2NWPd3+hw==
X-Received: by 2002:a05:622a:1211:b0:475:1c59:1748 with SMTP id d75a77b69052e-4af10aa56d2mr63735541cf.11.1754313399526;
        Mon, 04 Aug 2025 06:16:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFf7yZ8n4Kn22sR5Uevb5Blz+Ts3PocLhzk4Ya+jFjCOhrB42Tx4xCPXD1tnN8w3MczWz9xng==
X-Received: by 2002:a05:622a:1211:b0:475:1c59:1748 with SMTP id d75a77b69052e-4af10aa56d2mr63734971cf.11.1754313398788;
        Mon, 04 Aug 2025 06:16:38 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8fe82a7sm6859797a12.30.2025.08.04.06.16.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 06:16:38 -0700 (PDT)
Message-ID: <095ab6dd-9b0d-4f58-872a-852c5f19818c@oss.qualcomm.com>
Date: Mon, 4 Aug 2025 15:16:35 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] soc: qcom: mdt_loader: Remove pas id parameter
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
References: <20250804-mdtloader-changes-v1-0-5e74629a2241@oss.qualcomm.com>
 <20250804-mdtloader-changes-v1-2-5e74629a2241@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250804-mdtloader-changes-v1-2-5e74629a2241@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDA3MiBTYWx0ZWRfX5jD4FjkOmvKk
 eKjuGFNWqbugHgnPG3tvr1x49FpUOkrH4txj48mvUe5JAZ1rWjFSwp9zEOFvEO5AEoxSeoxRwMk
 uMFTlPOsYsFYVQQVes4UyND0dNQkAEn+1Ru6n8hZzrDz6T1KfJ/8R/0m/Iqk4A+v9v9DjftOYfN
 URxc/aV5eCmy/NqwohinKI40Q102fsMNgkpHSBdSiOTIr7OJcUzyHnT8m1kQ033t5PaaXOzGNDQ
 YUps9+j56yroZp9duODLKmEOtWvdzHqVluijzLKZkIxUN3RuwRrRg+AdG+GtbDuF9rjbtOI9PjH
 VBUqgPcz7c8w7AmcKClxnYDYSnLyJUfujjmmP4yeP1OTxgg6SJfZ00eUmxHm6FV0/C7AyUN/+AI
 e3lT2Rya0kXv+ZW9SNUriPMY+Pq+Vwoi39kuAXgVzBCWv66nUivPFFnEpyaoCHIFEJbXTd2p
X-Proofpoint-GUID: Zo-3finH76G4l4aME6Nx9_W98Ob7_qPd
X-Authority-Analysis: v=2.4 cv=N88pF39B c=1 sm=1 tr=0 ts=6890b2b8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=IDvrs2r2PCma8_SM7s4A:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: Zo-3finH76G4l4aME6Nx9_W98Ob7_qPd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 mlxlogscore=999 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508040072

On 8/4/25 2:41 PM, Mukesh Ojha wrote:
> pas id is not used in qcom_mdt_load_no_init() and it should not
> be used as it is non-PAS specific function and has no relation
> to PAS specific mechanism.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

[...]

> -static bool qcom_mdt_bins_are_split(const struct firmware *fw, const char *fw_name)
> +static bool qcom_mdt_bins_are_split(const struct firmware *fw)

This seems unrelated (or at least unmentioned)

Konrad
