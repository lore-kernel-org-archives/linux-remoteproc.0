Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AF8253957
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Sep 2025 06:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759127282; cv=none; b=jYBITXjdeOtDfGxNvPlV18BvxB/8ngDtJr6SPU6/4nVa1Pzq7zNlFhjXov40K0XCE3uI2ugTqmnI78MOdh2Lfvodh0Wnbx5GgSLvKBm4hNL8ivGFDIuAYPT7AHqdc/LZnQ2GuBE86hlgkuyUEX2arUyaaMwd4OWMlt3wglPT46g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759127282; c=relaxed/simple;
	bh=7MONXp2kxgmvXUrMFPJPcWOY5YJ/mSytwCSndhWpUr0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hFrW9zTuJ/D4CuI7SZMTkXdvMLU/3xDdLmoqWezxkB3PGIkUtaPFgGKdMkc4z4qGOT2ZcXwqcwRsIGhYxoIeKiQyG2gAvrO1Ye36Ba4UpB7BjNRteIfq1L1anXTibrPob5bEKh5YXJWhm1eBR0r2TDtdUKllsnu+azTIE1vPnc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BTzPoKIT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BTzPoKIT"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58SNO9Bp022448
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Sep 2025 06:28:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aoiySB9U8Vv6U6hO1VDsQsux8dNMt7jx6n76caS6mIU=; b=BTzPoKITsjHcE/Ig
	+gEuoJQqZWQkBnXTNjXpQkAuxDJy7kI0tKw+W2EUdfdtYH3188g0KQANVZ7EfnVd
	gEGwbi4qQDZXg+NFwqB2iWj4DMNQUV/HvIRuTmZF4ZHrFoFIF4Qmp8f9tZAh09i2
	Fil7I7ajvt2czV86ezHNTTCZMwI0xMNnxMFMGFwz0W6AmsQuz7GjDv4vqws3JRc/
	A6AaGsnAkFZ9/2Tjn+uZhZgf/Y7lBLhOmkBtlp91+86228Kl8YlQNcDGeJtlHaba
	y5hpQV0KjClPvzyGYpKY7DmYag84CJ4zark0O1ew7c9EELGMhBm099B3l7gteAsw
	pbA3Pw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e7gxm34x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Sep 2025 06:28:00 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b5535902495so3138737a12.0
        for <linux-remoteproc@vger.kernel.org>; Sun, 28 Sep 2025 23:28:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759127279; x=1759732079;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aoiySB9U8Vv6U6hO1VDsQsux8dNMt7jx6n76caS6mIU=;
        b=CloFu/kpvg1A4+vyBzzhCuUS9RJ4kXbe3TIZDDYO9w5eG2X84vUEPfyA8tOpADUYpZ
         WcTzI4PEiiJSYvNXZ9Foy15DmCJOMMrO/eum6XmcxEiDnpRHb+32orGScsNGzs61LliM
         Ouxb3kaP/czrl8Axm5hngI8V/0qTRvSOXdtYv0Qoy+BhrCcLIL3dZnoDOzmAmwaI/9O4
         0z2o9AfnPRBuqCFBDTIsOzlmQ7xgaa1pO36F6TdjqtPmw8oQN/KDwcSMHcL6vR4pbGr3
         CrAsnof+AwSgaacb7E/vg4ZLNew9/rQGsBgsKz2A3gsXvDB/SD48ylVlVevy7QwidKvN
         GaBA==
X-Forwarded-Encrypted: i=1; AJvYcCVzbwyrzdtSPGzz0YWz2roNgAByDrvU2/O2RtRcXUcEwlupsAyuuGxubn0FSKioQa78boIjmBye6nyectMMfS09@vger.kernel.org
X-Gm-Message-State: AOJu0YwhPuvV1TaU0UTZocFBkdNUHdNdhRpEQ+FEFDQW6MhEpZq4HWpF
	7eeTVVvWKojlJLDzT/RbG1kdie43d8mB/l6lRZ8BPYXi8nYAyAgT72HIltV7/Cjqt3vBy3qln7M
	5BYXbRu7jVv5EsC1jrm4qOdLomAe9MqAbPte3FkrNR56c38WUOKVpoKsalftMdDXr70yDPtyP
X-Gm-Gg: ASbGnctYVu1Kyp3nzf35wYYg6XRlBgoiSfmYgWdQtg/WgnJEfnNB7yOG8LoIFEogWLX
	MlueJpDFS4HVq4g/hG2/mxqZKJqTY93GeGNp2TFJYOt7q+kxby3nP5DnETBroJY2zzJbHRsbbnX
	0VXnHSt+Hg91Y3o4gI4k5LJS0Smsds0jPsFCkppYrXsPUjARSieAkmZpRLttLMTOjDvRvn5KYu5
	HsF8qk649CTa/mA8P7WG/NuSp1PBOLklAiQAlUEhP8ZqygK6xIQtw8uT4hhxSQ+5EHZK8bXifmM
	4oV1NiAAC12rTO8GQY7loGvNoS0e0QnLHmtfVnHpBjM1FCOZCwkbeVt+Dd/xBcnuXDebXcd9sQe
	N96vZhwvsRoNNj69DXpOXaqi8hy6WzprKKfk=
X-Received: by 2002:a05:6a20:e212:b0:2d9:c2:5ce4 with SMTP id adf61e73a8af0-2e7be066b1fmr17865331637.7.1759127279065;
        Sun, 28 Sep 2025 23:27:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0+hgjwMD2S0KLIaHpLLLlNzETvpPU2QOEdVqYskNhuhBWrT5uV/PegOpSnXKtl0Mat/ebyA==
X-Received: by 2002:a05:6a20:e212:b0:2d9:c2:5ce4 with SMTP id adf61e73a8af0-2e7be066b1fmr17865313637.7.1759127278653;
        Sun, 28 Sep 2025 23:27:58 -0700 (PDT)
Received: from [10.133.33.234] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c55be5b9sm10167314a12.52.2025.09.28.23.27.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Sep 2025 23:27:58 -0700 (PDT)
Message-ID: <464b38f8-f91b-44f2-8028-aa0a17ca3e68@oss.qualcomm.com>
Date: Mon, 29 Sep 2025 14:27:53 +0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] remoteproc: qcom_q6v5_pas: Add SoCCP node on
 Kaanapali
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <b7855860-410b-4d32-afd4-84d61cac4a79@oss.qualcomm.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <b7855860-410b-4d32-afd4-84d61cac4a79@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: iBJiu-Ttf4KEaI4M4S_-DLk_17cUPZkK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyNSBTYWx0ZWRfX5sCr1hsaLZSI
 GuES+Mg1t5wryJG5TTFYxyx+CCp+O9iULJ+Iu7GcMQm/P80t07LDirGddl+QUkBZc8l48SI29dd
 6M1/QD/wRWEiF/Od4dVwl35feL/wieRimK3c+0u7thy6bgT3BNWCCWC/NaSUsfhiyw6qiB20dWC
 vK/OX17a76efUH+xF5sdxr8ftiayfhMqHmlHix0L7ECDeukBK4wD+HE3RUC1G58lq5vFzbrsQuL
 3LLpOI8RTnXnAfzCclIi3NGwwsUK65+++Fp2mk/9q3tfXNlPXjyBZpxwJabkUb3v4X/Ls6d1y2G
 gvSM207A+2nwQWA0XVHIFGGQGfzjxPRwarwL0B+PAbiQVsEA1ZqcLjBI58r9l6fTIs9aQQ3fV9H
 odGlwlDRSOoM2j9WVmii5vXTMc0mFQ==
X-Proofpoint-GUID: iBJiu-Ttf4KEaI4M4S_-DLk_17cUPZkK
X-Authority-Analysis: v=2.4 cv=dP6rWeZb c=1 sm=1 tr=0 ts=68da26f0 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=bJu89BRhDEOEog6wxuYA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_02,2025-09-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270025



On 9/25/2025 7:42 PM, Konrad Dybcio wrote:
> On 9/25/25 1:37 AM, Jingyi Wang wrote:
>> The SoC Control Processor (SoCCP) is small RISC-V MCU that controls
>> USB Type-C, battery charging and various other functions on Qualcomm SoCs.
>> It provides a solution for control-plane processing, reducing per-subsystem
>> microcontroller reinvention. Add support for SoCCP PAS loader on Kaanapali
>> platform.
>>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>  drivers/remoteproc/qcom_q6v5_pas.c | 18 ++++++++++++++++++
>>  1 file changed, 18 insertions(+)
>>
>> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
>> index 99163e48a76a..5007e1706699 100644
>> --- a/drivers/remoteproc/qcom_q6v5_pas.c
>> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
>> @@ -1487,7 +1487,25 @@ static const struct qcom_pas_data sm8750_mpss_resource = {
>>  	.region_assign_vmid = QCOM_SCM_VMID_MSS_MSA,
>>  };
>>  
>> +static const struct qcom_pas_data kaanapali_soccp_resource = {
>> +	.crash_reason_smem = 656,
>> +	.firmware_name = "soccp.mdt",
>> +	.dtb_firmware_name = "soccp_dtb.mdt",
> 
> .mbn?
> 
> Konrad

Will fix.

Thanks,
Jingyi

