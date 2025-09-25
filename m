Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E922FB995
	for <linux-remoteproc@vger.kernel.org>; Thu, 25 Sep 2025 11:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758800579; cv=none; b=gMuxhLPv3oeBVMZFLGdxZNg5KmNMStqMo1gm/OmtdhBYOfawafWYk2+7jc4mWgykMeq80onjmfZhKKzWc9sR3lTVIEDuYZpCTcaYdtbzTClX36CiXWvTBsiWxGSfQmhsUiEJ7YBkfQVJku9lXFQE8gVMSRDyjsWsjIV7fG7N8uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758800579; c=relaxed/simple;
	bh=VlRsKP0AlZXEr4syIqGk997jZca3LzoEn8FL2OlekIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=icNCo6xnotQMevep3dOPw4YX8chgOX42n9lqxGzlIYNi5aEzaMB1An5xaaUJtYttjZ3UWet/RPK8REPtb8uqTiFiNCeB7uR9OOcUC86a60T2kOAywkmNdrziZ1KG7ITklIttduZ47kwD1YutdRfTVeEUpK0LldT4P3lvnSWosa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aVYNYtTB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aVYNYtTB"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PA8J38024516
	for <linux-remoteproc@vger.kernel.org>; Thu, 25 Sep 2025 11:42:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hyoJlzEOQKYfqNHKoaUcAIRDzSzD2tltxogjlfJtGns=; b=aVYNYtTBYXtSmk58
	7CiczI7tYSwmHc0oxDkTipdO7KsqVRp/KCJNqg+kMobplAwxgpQrD+AVtN2hDZPL
	6Z3dWy7TRVwReegLkdjj/IVuRoQpGWafl2NNnBNifJsyG3T2HW3Qcp3It5ICaw93
	HyrZEJ/vmgaFBTklkFKdHtxSJQTpiogzkmtGOm7QlE+OWY7Ih2AcP85nska6ekuF
	zA+m4WnxwcUu21Hj0d3a+o7Irhzj+gMCOX3ecyf+ytac5b3PgMNPvaXJIaPcOcfW
	SGqy8ZORPEGQNq/OsrUzWHEF0pUVmyrSZPm4LY1/+lTbzTa0MzjdB7w0+m3dKich
	E6uzng==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bwp0ey5d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 25 Sep 2025 11:42:57 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b3ca5e94d3so1159101cf.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 25 Sep 2025 04:42:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758800576; x=1759405376;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hyoJlzEOQKYfqNHKoaUcAIRDzSzD2tltxogjlfJtGns=;
        b=ekcHQraphqLqAMo3Xa2sPWWSu1egTbCRNXYTMi8xvxSbt3bQKewxr7G3SaOoDsvP5s
         n/7R/sXGDTMf/EsLQNvWrOwYK4UVN3RWgKNmU2luexuk0yAjXOPqEJdNILORiunvirct
         ZAY7ACDH9K0h3qGwmFRrPcRSjFcYIx0tR/g0xpiZI4+uc8vyhuB5033NJx/Y+5o0azZH
         pBnfqROhWc+KOzvEVumzmPiLJcNeC1G6lETaivKl7ddWGvTShXhJ9GVcbkGSOsZmgcbx
         BMN3G87F+FfTLlIUEcTAu35yDrsE1x5go7umanZTguqytV7mF1LUoXiaG4bqvgfRR+oj
         JZ8A==
X-Forwarded-Encrypted: i=1; AJvYcCUGnMOWSRHVGBo1Dod4r5ievm2murf890hGeJorFefSF3hxpY89AvhbwVdvocX0UeN/UOKOU1Ypn4NMFux6Sqx4@vger.kernel.org
X-Gm-Message-State: AOJu0YyaPPgxD31IzZgdbApZ3TIP8Sg86UCwOKGR8ht8NOxXfURhaSza
	Q0K52Z1QjRhPqtQoY/A/mRtmP38TovI7j4AH/pWKXxkMvpCoMYB7vpozox3L6wH5jWwlOXh77w5
	ncb8y+yHGLryvdmwPcN4EfRhxmh813LXekiiArIby7RhO/Hum7EJaQbpNWI48goqNndCJn3NP
X-Gm-Gg: ASbGncuYGRytJzmA+3KoG084COCjIIlURENZuTSPkSifyo+HewfHLwfEet753A8yXpl
	EqF27Gc/EZR/4lxrsB8LhZ8gGeEhI6jDmEhNx7ZieB9dyJMuV+GOSzZCErmI4c0mTTcwbQuNToc
	eVk3+FCU33QkW6aFlMwWzwZ2uuoe9PVAdixPCZjzHxWkoEHdZRiIdsyIkSmAge/mz9QdW8x1h7C
	Lt2jL/fv11Fqy/krPyKfHyS6ovAxxApdRbaiGpVl9DRqbZaCXvDKm0eJhNWTLJ8L5mbeV/nb0N2
	gtJUCi8vjtacxbDsgdWwn7+3+H1en3GyzZvIITFazJ37p+VTQVvRWT3CdtFTbFLkXDMiSRK6bW5
	AP2BQIc+oKlVVduPq1Oox1w==
X-Received: by 2002:a05:622a:1905:b0:4d5:eedd:6893 with SMTP id d75a77b69052e-4da4b806fefmr26721961cf.10.1758800576274;
        Thu, 25 Sep 2025 04:42:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWGRWLaOiykmDKGvjnmGh5TU7kHhYj22O4CIawL/S0c53YrQcQatBuiNwrwRSEZhIS+hFkJA==
X-Received: by 2002:a05:622a:1905:b0:4d5:eedd:6893 with SMTP id d75a77b69052e-4da4b806fefmr26721661cf.10.1758800575833;
        Thu, 25 Sep 2025 04:42:55 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3629886sm1091846a12.2.2025.09.25.04.42.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 04:42:55 -0700 (PDT)
Message-ID: <b7855860-410b-4d32-afd4-84d61cac4a79@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 13:42:52 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] remoteproc: qcom_q6v5_pas: Add SoCCP node on
 Kaanapali
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com
References: <20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com>
 <20250924-knp-remoteproc-v1-6-611bf7be8329@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250924-knp-remoteproc-v1-6-611bf7be8329@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KNxaDEFo c=1 sm=1 tr=0 ts=68d52ac1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=pQmoqa-UAMS7fspmYOgA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: HNgE3KgQPxnc-QHDqt_9guiwqJGl4vK7
X-Proofpoint-ORIG-GUID: HNgE3KgQPxnc-QHDqt_9guiwqJGl4vK7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDEzOCBTYWx0ZWRfXzkJFDjQpQMyK
 7F4ZFO2NqxP1Y30aJQTs9MIjxGiB1o6UQS9Pxq8qXfUW9lUOo1XcjN1UI5fxNijszR9DiBEW6g/
 9CQ0f5IxkgQd+QgtHvAen2gSh6nLYLulKhVSCOF1mmAJjBvx2+cTRqNo3xmDAlXJKYB716jIXqh
 ZJ2yAFjGlBiTGBZLtHPZKnIpYIZe6Oimqaz7ylfU3RHr+QFP2pQ4UwmcG/NWE86Uiv100j3YTj6
 yyvfEMd0ik6T1r4AzqtqlKVOqoaGxlU3zcNpFRDNV7AvSt07/EiZS/zrfaO/0m0W9UwGy+sdjzu
 gRH5o9YDhYcpjUaaGJUzMWo1rPGgjKtrBLv2cILj857XTfqJHUAeOSOaiIyPYfqfYwXrborEUwm
 Wgt1x1Cm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230138

On 9/25/25 1:37 AM, Jingyi Wang wrote:
> The SoC Control Processor (SoCCP) is small RISC-V MCU that controls
> USB Type-C, battery charging and various other functions on Qualcomm SoCs.
> It provides a solution for control-plane processing, reducing per-subsystem
> microcontroller reinvention. Add support for SoCCP PAS loader on Kaanapali
> platform.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 99163e48a76a..5007e1706699 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -1487,7 +1487,25 @@ static const struct qcom_pas_data sm8750_mpss_resource = {
>  	.region_assign_vmid = QCOM_SCM_VMID_MSS_MSA,
>  };
>  
> +static const struct qcom_pas_data kaanapali_soccp_resource = {
> +	.crash_reason_smem = 656,
> +	.firmware_name = "soccp.mdt",
> +	.dtb_firmware_name = "soccp_dtb.mdt",

.mbn?

Konrad
