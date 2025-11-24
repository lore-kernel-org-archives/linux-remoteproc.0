Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F012FD7B3
	for <linux-remoteproc@vger.kernel.org>; Mon, 24 Nov 2025 11:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763984919; cv=none; b=c9+aZorVFqal76+ED87QgEVPXTUYnB3zmsnH8kt8+IZfRDYhYVhXyBdlGhRV/oNVe0ITyTPJRQEHBzd2WJ9R5Y9pH/WnhfP8+lxbile379vRjd0fNGS6BhVmdeGQ4Nm/VoAmQioZYR1boNUdciAK5iZzy2aszPi+aDti7z9RQrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763984919; c=relaxed/simple;
	bh=xCpIEaUUUebLZ54UvY/PR5J24udx/D64eE0a2sJwNzw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rHzy4n+h5ZtRqcyYye33o4ii3BU1ifM3iaQ0pETKzzLk7V82bnnjC6ph8J+sUn+TK+ItLmcfa8ZStqVzayvmM4u7NPntnxCBThCTgqTdw+yFoi4SF0Kf8fXRAiQO9mBAPUZGWAASiCeEDIZLMJJWJfzLtoqfw/IrPAXyoy42crQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kBqYCFt6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ak+hl4Ml; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kBqYCFt6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ak+hl4Ml"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AO8TuXb1808600
	for <linux-remoteproc@vger.kernel.org>; Mon, 24 Nov 2025 11:48:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QqpOOmIPoE9AXPWnFwyZS9585pTzN05bqtdJ1HhYXzA=; b=kBqYCFt6SC+/idJf
	fGddZQ3tlGgYZUMenfGwibKFNWhguHz1SDAjnvqUrQh7dzfESooTYMLGjIDTf/qs
	7P+HvStRhUb0rSfsy5inQJ09n5E/Deapmir13KEUWGw5BppytNwTXAC9AYW7tY5N
	ieRkav0Nx24q7h86LVqq3wciU821cD5hgVkxzsGDAkJyFOSgE2pmDrjwCDunhTla
	OmiIDL+fSszCw5HI+SW1oiQT6XqkZs6ks1GicIyfxkll94MlJVDQW0bKtoJ7GTsC
	8L6JbxNgvd+Jh6Cs0Xke4k3jzHlI3rrVebdrT3cU7sbupJ3Qb3Vb8pBsfWZzTUBp
	GecqQg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ama099una-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 24 Nov 2025 11:48:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee409f1880so9488781cf.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 24 Nov 2025 03:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763984915; x=1764589715; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QqpOOmIPoE9AXPWnFwyZS9585pTzN05bqtdJ1HhYXzA=;
        b=ak+hl4Ml9ta4eoJxsnO31bNQK6rQocdettdo09Zu/z/CfjDBl1Q10nCjNdsB3EKoJW
         0gYmRWcHB3FUEfmErhvlh4UeokfyXmNHDJ3INQ1t5agtA69ZGZpREr0QSL1QBAObjDas
         +rWLppZPLhzEtre/auu/TXS4YbSHuqe65Ly7Tqk2139UIbbBs0RcxVtnzearLh8BG3i1
         Oj3FHRiGsqlvBnBW/xIpyzUbngl8ADj6I/tho5siohWTyvNgt/cQXmeWCv5ePaq6wA34
         z3KbOqPkHpcws/POvEPicLNWT2CamZVwY908fKPVP6DxJXK3CPWXQ/fnfmKIaP8mzTGw
         U34Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763984915; x=1764589715;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QqpOOmIPoE9AXPWnFwyZS9585pTzN05bqtdJ1HhYXzA=;
        b=vJeNN/klF3EsUQuT2PwcyppYWaLm7mHDBYzhbu1dmB2yzMQYpBMFLi2yutnewFltyI
         nD3r8mrZcXtruH06UdxEw9Ud7+pbmlPxtjjW2uhuf5Erbi2/WERz1QrFlTeMb01q5CJO
         S6gCW0EF15fkdfETmAMwQ4dH/yzxDNpXdnYY5R06rTtQ4ToKHVD6hpsKlwPEN5sA+rj5
         r0mC74ZkcCd4LEgm6nMI9nAO8xfu26XsDoThrET5HGBkcUmjcgyIcHKNVFTyQnBoZ1Qz
         1iO5O6UPyiHwS7AdtbHNRbleYwrlekgmYaT8xz7aodycPr3eKxwaICsDo822u0qcN/Dc
         xPMA==
X-Forwarded-Encrypted: i=1; AJvYcCUEymGqxjCDGi3hoOo3U8KLy15Vt97XyhnPqHNq3WAFb75ykRyRIWajU04jzPEMKyQDojvqN1RZveV+bRXPRea3@vger.kernel.org
X-Gm-Message-State: AOJu0YxgfYave/1BOXYzTfmcg7s7SNINAQ6b6L4y5jJeWX8l+Uk9DY6q
	eZY39Ey3Tlqjm2YaythITqOuP4Kt0DGjY7IdL4IWD2M3obPB8cRaQTioGmfGMwHynQD3cdZ2/lb
	Q7YzQF4BeIpXY8kqaLDHKE4HVPoa3LXAMqPlQ1myujnLerP80sCNog8PJyqkfFynHR4Fb5v0m
X-Gm-Gg: ASbGncvrbN4mHTfMx1YpTK1BCiBkHLBJepjVAKldLC+/6MDB7K0E8QnJBpg9zJf3/lq
	pJ/24ln+KiEI41+NBGckvipCgqA37UsFlaE8QuShERsc9+UlevVm2BmURaahuH9PMOEHa/dmy34
	6UJH/S2W7twXCT00XU5Zbqsx8FwVo5sjIHnbYk0qsFsVmHEfOk8sERIxLBFi8Hsa+TInmzeLt8n
	ns/p1rQGzFn29M2Bi0rx59sMKRjU/NSEQ8BoxkNadHiqqJPvF/8V+11Wm7zmpwwgbd4QIC8HJjb
	Ygn6B1cCmesg4Nz2nhfqMLVJaMxTDEMSa4gqcfQujoM4HwsxEAol7i19IyiVjbx1BnmaE22Gpzu
	nBevGuH4fwKeE4zSVvBBXD3dNmX873kZwpJcOcqXLUQOWcbax28V1nV32hFLOgJbRyVw=
X-Received: by 2002:a05:622a:1184:b0:4ed:afb4:5e30 with SMTP id d75a77b69052e-4ee5895624cmr114050571cf.11.1763984915082;
        Mon, 24 Nov 2025 03:48:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHmH2xobwa3CqSnrzYYL4+Ew96m2lPlSKku+Zb7zmyFh5xchEB2/6u6+vwODBiPw2UMecHM9g==
X-Received: by 2002:a05:622a:1184:b0:4ed:afb4:5e30 with SMTP id d75a77b69052e-4ee5895624cmr114050361cf.11.1763984914703;
        Mon, 24 Nov 2025 03:48:34 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654d56a70sm1278664566b.22.2025.11.24.03.48.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 03:48:34 -0800 (PST)
Message-ID: <86f3cb9f-e42d-40f9-9103-1a4953c66c71@oss.qualcomm.com>
Date: Mon, 24 Nov 2025 12:48:31 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 11/14] firmware: qcom_scm: Add
 qcom_scm_pas_get_rsc_table() to get resource table
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
 <20251121-kvm_rproc_v8-v8-11-8e8e9fb0eca0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251121-kvm_rproc_v8-v8-11-8e8e9fb0eca0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: w6xOtTzdgJwFpbtTXdoLYBudU4UIjdyc
X-Authority-Analysis: v=2.4 cv=PdHyRyhd c=1 sm=1 tr=0 ts=69244614 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=XUQfJRfMQn7nGKn5IhUA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDEwNCBTYWx0ZWRfX5KIM4xhR5zSr
 pCMn35HlUcS4xpUnmENGoHQlGWhg3M9l015PEbrCK30xrD9P4b7AZuspU6/wu+Lf3S3qyjwdUNt
 EsxqapAKOS9eeholRO6OJQQtSykHAKco4o49kdLhjiW6fgiowzyDe5Pkod/D8Fu3V5afAM6PYA2
 bVrwZK28+rEyNF28Mh/9WnGWQ822CHKH46LRG16YtH05y3l216LkGG09ImmMFOb/M9xsFbCWjBB
 Yk16dZq0F3p+6cwSI/nKN7wlrr2lyvx2/h0pOXAiyCkkAQTZ/HV8exV7RdfbIZBEpjl2ekrjwca
 mKCKklbI/CrIpKUNNVjQKAtIDLurcAdTU/mNsUtOYHmz3T30BetLFV1NPFqx8sN1IkPbhgQ7OG7
 lfJub4FwhyMMD2Kt0RFEPtu+p58PaA==
X-Proofpoint-GUID: w6xOtTzdgJwFpbtTXdoLYBudU4UIjdyc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_04,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240104

On 11/21/25 12:01 PM, Mukesh Ojha wrote:
> Qualcomm remote processor may rely on Static and Dynamic resources for
> it to be functional. Static resources are fixed like for example,
> memory-mapped addresses required by the subsystem and dynamic
> resources, such as shared memory in DDR etc., are determined at
> runtime during the boot process.
> 
> For most of the Qualcomm SoCs, when run with Gunyah or older QHEE
> hypervisor, all the resources whether it is static or dynamic, is
> managed by the hypervisor. Dynamic resources if it is present for a
> remote processor will always be coming from secure world via SMC call
> while static resources may be present in remote processor firmware
> binary or it may be coming qcom_scm_pas_get_rsc_table() SMC call along
> with dynamic resources.
> 
> Some of the remote processor drivers, such as video, GPU, IPA, etc., do
> not check whether resources are present in their remote processor
> firmware binary. In such cases, the caller of this function should set
> input_rt and input_rt_size as NULL and zero respectively. Remoteproc
> framework has method to check whether firmware binary contain resources
> or not and they should be pass resource table pointer to input_rt and
> resource table size to input_rt_size and this will be forwarded to
> TrustZone for authentication. TrustZone will then append the dynamic
> resources and return the complete resource table in output_rt
> 
> More about documentation on resource table format can be found in
> include/linux/remoteproc.h
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

[...]

> +int qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_context *ctx, void *input_rt,
> +			       size_t input_rt_size, void **output_rt,
> +			       size_t *output_rt_size)
> +{
> +	unsigned int retry_num = 5;
> +	int ret;
> +
> +	do {
> +		*output_rt = kzalloc(*output_rt_size, GFP_KERNEL);
> +		if (!*output_rt)
> +			return -ENOMEM;
> +
> +		ret = __qcom_scm_pas_get_rsc_table(ctx->pas_id, input_rt,
> +						   input_rt_size, output_rt,
> +						   output_rt_size);
> +		if (ret)
> +			kfree(*output_rt);
> +
> +	} while (ret == -EAGAIN && --retry_num);

Will firmware return -EAGAIN as a result, or is this to handle the
"buffer too small case"?

I think the latter should use a different errno (EOVERFLOW?) and print
a message since we decided that it's the caller that suggests a suitable
output buffer size

In case it doesn't make sense for the caller to share their expectations,
the buffer could be allocated (and perhaps resized if necessary) internally
with some validation (i.e. a rsctable likely won't be 5 GiB)

Konrad
