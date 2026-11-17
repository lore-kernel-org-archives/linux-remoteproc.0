Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908541;
	b=I/Wq4rGuvPAuhqRNOPmhg9d/3pA7xgl0b+tLLPk0Fov10Dj0GiMXINAlv8uo5pM1+i5n
	 nXTqwgOKh5OtCmty5OHymQyMjnHzVoW1k3kVK0o/ALumfnnjtJo7wQS5+StfrCed8Zfvl
	 JcfBwFMoiffoM2XvKUR5CngCWIw3spSntLxomvjTLwPVOwhPkdpeUqDBglY8YGGGZ6HKl
	 UinyC7JpuKMeIdtrY4Y6ibYdN4BJ6LmZVJEYjRFr23divzjuUOTOMfe4rWdkIPvQazozs
	 hdlRPqf66rOkfmjkGWpk35to1lWQW4Lf9AradimBeYUNeOy31KNVoRO4/+5VKH4hh7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908541;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FR0f5F7yPxxa4E3yXHiVVcQsrkarnwS9sLGa/aVW6YE=;
	b=wTCkOVZcUP0poUDdSx/B9LB6xsCdiP2yBah3xcD0yVW5ykt2pjKVkbYgnraS+h95h2PD
	 OalqCz51+HM4w+uaOYoyAT0I9xJDO8PEoYVErKJVFztmKuXN7y9Up1UmoRcPnCDkSO0nT
	 H0lojCjj/Jd2Kkl2Dwyklg/6nABl9sW+i3YrfMCEM8Ota7Ju3pyxaLkl3H65j4BcgMbZ/
	 5mlxJ8xwrVGYtjJyJ+PELQ1Rij1rD5my4UFMEsti+ZyuhtnBfLbdhuH33ujSsN/hSWjDd
	 Fz2X8UgleJsUO8b2gEtn+VulfvSp8wtEqwlGehTLuyxQ8qJfj3jvwZrDr25RgPGX3wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fOlt6srD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c1XVcWe8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E94606A323
	for <linux-remoteproc@vger.kernel.org>; Tue, 17 Nov 2026 09:42:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25E94606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fOlt6srD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c1XVcWe8
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8peCk3624124
	for <linux-remoteproc@vger.kernel.org>; Tue, 17 Nov 2026 09:42:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FR0f5F7yPxxa4E3yXHiVVcQsrkarnwS9sLGa/aVW6YE=; b=fOlt6srDR6s+9QNV
	raHd50uRti9e2P8itcOQ+YgNPDJz2rh4x2xz4XYA2gDiA1hDj83jTr6FUTO5VEZf
	zC0Xf12Vcx+etOXBOVGhqukUzp/ZxwrXzuYL10ip77mubOq2nUBLYMfYWmGJFvcm
	m/AQhCua9zSdriOfR0OVsjm4Yl17KO6Vzdmq2hJCpXPXs2wdjKIoaV8vlTLpiXa+
	DGsIXq4ogr807/F6WshzoZ51dFEWNnFQzWfNkQ6ugE6BBQwQGqWZW2YrJpKbqYAC
	Wi/PCT9s5dghS8xq7eRKo1TUVtJgkZjND5etQRQDc3FNzwHmYL2etL7FTLXFpVL8
	fP7vtA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j07rejwyw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 17 Nov 2026 09:42:20 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdb8b260bb4so2321734a12.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 17 Nov 2026 01:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794908540; x=1795513340; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FR0f5F7yPxxa4E3yXHiVVcQsrkarnwS9sLGa/aVW6YE=;
        b=c1XVcWe8ts58GvviucNhJs5LqeOWAihVIIParR7/Y4Q+lc96mY6FE+aC+gChl8IGuM
         DYcYIqm3ZhSeMFLEyHLh48TU0Ey19+YpkBlCjP95/CAQD9e+h++xbXxnHOWmTqGsPaQp
         ZQ6GEqsP5gwqclpZGvG7uGsXRCX4nW9ZgQyOUSPPxogzZGevHJGQ+JQqwhrZO+CSQOI+
         CAwOZHn1lHVyj8qP5LUNzfNG4JhpJzqDdPNh/mGa4PPtzSXYX/bxsJZp4esYADeWX7D3
         vvCOmcz45jDUqj9zrsIwmcKHWS+Ompoyj6kuc85xexQHeIplmCQH/JnjpObPdzHfeYh+
         h1Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794908540; x=1795513340;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FR0f5F7yPxxa4E3yXHiVVcQsrkarnwS9sLGa/aVW6YE=;
        b=Uak0p0/tFh1AxtiTGIc8TTJk2gconZacyeMTsJBRU1YNp7EfRNSOWZH2MZmr6M5eIO
         ab7PVwqO3ZAvVQfo4RfBrIZCbTi74MMwt82ZH5bQs3xRGE0myHNrxJ/qUhxBUkMmqKj2
         bJZpyegPES8LaxLDyRpC33KrN+aQaPCGvGiVWAxEChe1U7OtfOesWwU5nx7FPkWp59Lt
         +mO+abqLuJuB9ArSSYZK6kTMXbeMfEUplxJmKU9mt3wdG2b7pwl9Xdi4u4XssCz8CiLn
         tVSXXbv4a8NpkNp0zd7YJbvA223bSOw0D7NHw5k1416WTyiy6zOTQxWy4LEi/e1L3DbY
         XngA==
X-Forwarded-Encrypted: i=1; AL+hErHWJgfj82Ny9l+YPQtDz39sgZ4/J5M50O5udHmaQs+I+SlbviPYcKKcTj9TSBPeIPuYvKlAbTkWoxdN36/HZo64@vger.kernel.org
X-Gm-Message-State: APuU4Z+u1s1y3OSvwdVesW2eXLIB8Bu6tItWXEw2/hrzcoRJACGJlFbw
	yGQ11iRONmZO4+PcJxpHIC7iZxlvb776uWN0x/BKG4j2EzsZHw7foS6afJYmMUVTVQ8B7HCpqJh
	MFlRiJPdJLpsGOFDhgPrDZCx+/7woSkYKGtErz+19Wy8G4qCpZy4Vg7fnFMIJdAAcAvWwkEba
X-Gm-Gg: AZFdTZf+3TgNXo7QgngwpEYuZSPNKL23qs/Rj6bGoj5j5SzFev+RrRQm73oaPrMbTe2
	umQrwzGjbVIpqoD46BgVqch2+Av1uKdAwHyiPZg1SjQ2OocfKwphTGJfCOl0M7O0gAqWrJILRTI
	+9YSOsRGcGG8+eFCkWxxrJptqgZIA+uix3gdba/jpe91tER2bqXTEAmFG33GeNCzfUaUzL0myem
	BAuwZOiCrCFQW5fJaC+BRG7tVwd2kD8akBEX7LYfUxtZBXe88LxbhhJW7mJKln1w5UxUcVw3QU1
	tn6PTZueZkeoGEJOlUKut717CZfbPy/f8HAjfJaFsAhHvp0YnbEr1VWN6VRi4wzrtJNCMBpw1nT
	Rerxnb9+EM/eB363/zqXSofFMOU5YbquP+j52iNC3kmuVhJsffxdKtE+mrlE2NV/5it53UUExmQ
	6JaacJOy0tvQ7yFcYN6azXLNkVEc5OL0Dda5qDro3/zOP2ljv63LZQRCDMHG3/
X-Received: by 2002:a17:90b:4c10:b0:3a4:6e84:e7f6 with SMTP id 98e67ed59e1d1-3b1b07ff57fmr13204637a91.5.1794908539575;
        Tue, 17 Nov 2026 01:42:19 -0800 (PST)
X-Received: by 2002:a17:90b:4c10:b0:3a4:6e84:e7f6 with SMTP id 98e67ed59e1d1-3b1b07ff57fmr13204605a91.5.1794908539106;
        Tue, 17 Nov 2026 01:42:19 -0800 (PST)
Received: from [10.79.117.97] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b245f0c3sm10640263a91.0.2026.11.17.01.42.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 01:42:18 -0800 (PST)
Message-ID: <2634a358-59a0-45e2-b2bd-2c404db3389c@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 15:12:13 +0530
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
Subject: Re: [PATCH v2 4/4] remoteproc: qcom: pas: Add Glymur OOBMSS PAS
 parameters
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
References: <20261015-oob-support-glymur-v2-0-715435f52dd7@oss.qualcomm.com>
 <20261015-oob-support-glymur-v2-4-715435f52dd7@oss.qualcomm.com>
 <20261116184727.oscwnaurivcxrg5b@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <20261116184727.oscwnaurivcxrg5b@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzOCBTYWx0ZWRfX3HFvD1rgt+GE
 LCEt6Rlrqk2sYMq5AeygsLBj59En4xKbspXojj9boLGEteu8Ca/lX9L8NNPOFMnAJECDd5Y71x8
 FVKj1XV3qR4XanzKvU+hx6wFWx7CmTo=
X-Proofpoint-ORIG-GUID: dXM4F29rzBzUgYR6-1e2kkDbMASsehru
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzOCBTYWx0ZWRfX4fe1lFfAnCUf
 FM30jDoEBnPcS7IdBJKJBvro4LpPjTyojMFf53kQGaHM/nCarteD9nmof/pW7tz0aQozPqjGN9U
 97v9mFGGJr+e0YqQrx/t0d1b6WhXtQvA7XInyPTXF1Ip5jJt0en9/dltOMnzhDEtPeqkBoCaQdr
 jCokEwJetu182J/yM6ROQNsKilGhoq/vqreFeF5y/DedJjCpQYZY8K5l9Jl2q7PhmZx0qs5Ft1x
 jn64LWNt5aS3187HzpgV2mY4WximWVxZoRSm1BW1u+t/yRhLhamZWnYUyON81DrsB2VOKFgGsit
 /eefPU3611D85FrRywgwxjWb+S8IihpSKIti5oG+7J0Ddle+HDa6hDtIoTMiyDhus5azZDY80F7
 OahS5obF0t1GUYQ1xWKMAf/T6lFdlQdiyIZuFgFj6iXi0XbjuM4g+A9bpbvf0EiE0/G9W2bkSDn
 KIhfU349AbpJ+VuiBAA==
X-Proofpoint-GUID: dXM4F29rzBzUgYR6-1e2kkDbMASsehru
X-Authority-Analysis: v=2.4 cv=R9uWitRX c=1 sm=1 tr=0 ts=6afc217c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=P_9HZXhiIeUehgLQJ04A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170038



On 11/17/2026 12:17 AM, Mukesh Ojha wrote:
> On Thu, Oct 15, 2026 at 11:25:52AM +0530, Anvesh Jain P wrote:
>> The OOBMSS consists of separate OOB-TEE and OOB-NS Zephyr subsystems,
>> each with its own firmware, DTB, and dedicated PAS ID. Add support for
>> the OOBMSS PAS loader on Glymur platforms.
>>
>> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> ---
>>  drivers/remoteproc/qcom_q6v5_pas.c | 25 +++++++++++++++++++++++++
>>  1 file changed, 25 insertions(+)
>>
>> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
>> index 374cafd04b62..ecefc6a72fd2 100644
>> --- a/drivers/remoteproc/qcom_q6v5_pas.c
>> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
>> @@ -2080,6 +2080,30 @@ static const struct qcom_pas_data glymur_soccp_resource = {
>>  	.needs_tzmem = true,
>>  };
>>  
>> +static const struct qcom_pas_data glymur_oobmss_resource = {
>> +	.crash_reason_smem = 669,
>> +	.firmware_name = "oobmss_tee.mbn",
>> +	.dtb_firmware_name = "oobmss_qc_dtb.mbn",
>> +	.secondary_firmware_name = "oobmss_ns.mbn",
>> +	.secondary_dtb_firmware_name = "oobmss_oem_dtb.mbn",
>> +	.pas_id = 0x42,
>> +	.dtb_pas_id = 0x43,
>> +	.secondary_pas_id = 0x44,
>> +	.secondary_dtb_pas_id = 0x45,
>> +	.proxy_pd_names = (char *[]){
>> +		"cx",
>> +		"mx",
>> +		NULL
>> +	},
>> +	.ssr_name = "oobmss",
>> +	.sysmon_name = "oobmss",
>> +	.ssctl_id = 0x21,
>> +	.auto_boot = true,
>> +	.early_boot = true,
>> +	.needs_tzmem = true,
>> +	.decrypt_shutdown = true,
>> +};
> 
> You can move this alphatically before glymur soccp .

Ack, I will reorder this alphabetically.

> 
> With that change
> 
> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 

-- 
Best Regards,
Anvesh

