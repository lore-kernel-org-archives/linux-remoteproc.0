Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319828494
	for <linux-remoteproc@vger.kernel.org>; Mon,  7 Apr 2025 05:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744002060; cv=none; b=e7LbHTwTQUYevnUDAkcsuTQ/+VLcgBCNk6MN+fvRP9LW1uoxIhFPwkO8PjvnF3D3xJXaiFekA6fHx+TPRlYU96LvKQ+9fqOWrIJK9JNJmIC6iyIC/W8e/EXFX1qDAofN/pIgvZ/zPTHo66UyY3FiP5Js+fBaurhbu/NQqVbCDt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744002060; c=relaxed/simple;
	bh=f9FLUr9JHh4KPmF0pAf5Tib5RtqWE3Aqplq2M7SyWs8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=azVBCBsw/8KpF8gkEn6saIUDIeimFpR7CmaooL7yuVYGelru9fMU0YjmNnUppMN1uYlXw/ZoK3lc2XPnLmkS9qjJLPMaYXV8OyWSnX6fAsAcTY4o4ah99G8wAeH2ZPEmCvZqzALIIzzyQWpee1zx9XwSiNZvoDMuJah3YAahRbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RzT4Nn9e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RzT4Nn9e"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 536NRYXs031582
	for <linux-remoteproc@vger.kernel.org>; Mon, 7 Apr 2025 05:00:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XPG+KNjvl2uOoYVxg7pkjx2MUlutCIk4Vr5rHK6eEBM=; b=RzT4Nn9eAzD9HHMa
	HSrT9GJ0IcJcX2aOpC4kuRb/Jd6fS61GH9pY69Ldb00MRUU1TEvD0aoEa4+wy0V2
	XiFv+0zL3WiTlyihFY5mbXOIuGzMi3aEslN9NhReBzkDHUre1VGzlkeq/40n8CFm
	ubeN/s5oFjq/Jii2UfTpzNDiny3CeZ/u8+pmhqVyL7Yhg1H7UWeesJWRfO25jk5O
	7a1NWQxWLOHCcKUsvUaRkmJLP7K6VsMGvV0ldZ/jNS5KALSftxZL26tkPxRHz/mT
	puqu5jqEoIfZgkclLIC+G+/kQcvhOELJmJfkxn/y7BnMvEap1JzO9qK3YuH1E86F
	5i7W2w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twg3ay1f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 07 Apr 2025 05:00:57 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-af5329791f1so2976754a12.0
        for <linux-remoteproc@vger.kernel.org>; Sun, 06 Apr 2025 22:00:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744002041; x=1744606841;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XPG+KNjvl2uOoYVxg7pkjx2MUlutCIk4Vr5rHK6eEBM=;
        b=Q8Y/8szZ0R/tn+X1/XhL/cuP431/ZHZTAE6S2jOe8SObV9JUOvs6MafwmpSxuql3/k
         th9006Jq2c9j4GtcGT74frPAiGpieQfYUDPHDRUBcwlTmAwSZR6G7RXP6Qx7Y4jJI4wr
         osP1whMzTBSSURk8zb7zdaeOwgrD4HVHhTpVKMWqlIta788X0fnSPHILVt41tv4mz8FT
         DglH6n5ZVPiv28b3PvxVOaFN6C31pfH+Jnc26IjapSNohnTEyNyCjcVzEtnH/VUW6Mmr
         eHZO5wpIsf0c/mUcZwyQMk1e9EO5lCHPPLswDY8W3fjmiESdSE3wjx90vlgVrOAT9og5
         jFwA==
X-Forwarded-Encrypted: i=1; AJvYcCUg74OB9qKyZmCApYlbk/QV+uj5aFuHU1sD7uGFp0ZKkEzaPx+NxaLQWQMDtBs7w+8y31XIxw+yJ/ZwxK82xCSl@vger.kernel.org
X-Gm-Message-State: AOJu0YyG6fPq52vaVmpdqeQNSBEUX6ncMRFn1xH9S2YFHyKiY8WyTu1Q
	QMXdY8zbU/Tpbwf1HXDWfwop5W61MaGb1VGwxez6RWI4UdwrFHFz4aA/HfQeQdW+dJq7XrxjARn
	2AEANxsf1DjLhrdUBbZQRWuVXe7MS1hX5RoDXS4YzlrIiOGIxx3MG1gKKQaZsNRTxMGip
X-Gm-Gg: ASbGncuEG/f+31Jl4sEDGI3EK+Oy8BN9yud/taEi8YY4qhMEPsdAKNqF4oJfxS2uvL6
	8ikbnvurjeicYBuDhEgYpUXFYGL7wtKsP9xWnLqShkTW/cKDNIlBX62oe30cZNfnQqP7MeymUxB
	sL/HgNLG4Lqy35WsIa50yyRdSm5FqsK7ikSjjJYjt46JMd2hw3KGvSKgRznCg29HeUVLwcPSDmI
	zWM3J+NjI+LKJN12cNjDsdt5gLAm7aa5XhoHd8skmgOGbz85b/DxNz5ToXMBPd4Pkp6G8eJ0Hcy
	HtVanmYTEU9yQcWoE2kk7ghsNzNAZGJxsClfn6E8HzdS
X-Received: by 2002:a17:903:1b0e:b0:224:3d:2ffd with SMTP id d9443c01a7336-2297660f59bmr209706165ad.17.1744002041051;
        Sun, 06 Apr 2025 22:00:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHG3Z9u/HwCpfZAjz4oPU4NfpleqOHBQXXQAU5P8eH/nEpn2HytVe4I1iGQdqVu2jL4z81qtw==
X-Received: by 2002:a17:903:1b0e:b0:224:3d:2ffd with SMTP id d9443c01a7336-2297660f59bmr209705925ad.17.1744002040666;
        Sun, 06 Apr 2025 22:00:40 -0700 (PDT)
Received: from [10.152.201.37] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739da0b45b4sm7517729b3a.151.2025.04.06.22.00.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Apr 2025 22:00:40 -0700 (PDT)
Message-ID: <1869a579-40aa-4b73-a503-a1e781a0537a@oss.qualcomm.com>
Date: Mon, 7 Apr 2025 10:30:35 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 4/8] soc: qcom: smem: introduce qcom_smem_get_machid()
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        mathieu.poirier@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, quic_mmanikan@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: quic_srichara@quicinc.com, vignesh.viswanathan@oss.qualcomm.com
References: <20250403120304.2345677-1-gokul.sriram.p@oss.qualcomm.com>
 <20250403120304.2345677-5-gokul.sriram.p@oss.qualcomm.com>
 <63831566-2975-4ef8-9057-239e0603adee@oss.qualcomm.com>
Content-Language: en-US
From: Gokul Sriram P <gokul.sriram.p@oss.qualcomm.com>
In-Reply-To: <63831566-2975-4ef8-9057-239e0603adee@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: f-gBaYmPkZbFbIdvvo5Tg7nUX6-4fooi
X-Proofpoint-ORIG-GUID: f-gBaYmPkZbFbIdvvo5Tg7nUX6-4fooi
X-Authority-Analysis: v=2.4 cv=I/9lRMgg c=1 sm=1 tr=0 ts=67f35c09 cx=c_pps a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=GGSKKsJ9ZFKbGOncAKIA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_01,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=948 lowpriorityscore=0 spamscore=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070034


On 4/5/2025 4:15 AM, Konrad Dybcio wrote:
> On 4/3/25 2:03 PM, Gokul Sriram Palanisamy wrote:
>> Introduce a helper to return the machid which is used to identify the
>> specific board variant derived from the same SoC.
>>
>> Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
>> ---
>>  drivers/soc/qcom/smem.c       | 26 ++++++++++++++++++++++++++
>>  include/linux/soc/qcom/smem.h |  1 +
>>  2 files changed, 27 insertions(+)
>>
>> diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
>> index 592819701809..327f7358191d 100644
>> --- a/drivers/soc/qcom/smem.c
>> +++ b/drivers/soc/qcom/smem.c
>> @@ -827,6 +827,32 @@ int qcom_smem_get_soc_id(u32 *id)
>>  }
>>  EXPORT_SYMBOL_GPL(qcom_smem_get_soc_id);
>>  
>> +/**
>> + * qcom_smem_get_machid() - return the machid
>> + * @id:	On success, we return the machid here.
>> + *
>> + * generate machid from HW/SW build ID and return it.
>> + *
>> + * Return: 0 on success, negative errno on failure.
>> + */
>> +
>> +int qcom_smem_get_machid(u32 *id)
>> +{
>> +	struct socinfo *info;
>> +
>> +	info = qcom_smem_get(QCOM_SMEM_HOST_ANY, SMEM_HW_SW_BUILD_ID, NULL);
>> +	if (IS_ERR(info))
>> +		return PTR_ERR(info);
>> +
>> +	*id = ((info->hw_plat << 24) |
>> +	      (((info->plat_ver & 0xffff0000) >> 16) << 16) |
>> +	      ((info->plat_ver & 0x0000ffff) << 8) |
>> +	      (info->hw_plat_subtype));
> FIELD_PREP + GENMASK, not raw bit ops, please
>
> Is this format specific to this usecase, or is it used more widely?
> If the former, it may be better to export these variables separately
> and combine them into this specific combination of fields in the
> consumer
>
This is specific to this usecase. Will use FIELD_PREP and GENMASK.

Regards,
Gokul

