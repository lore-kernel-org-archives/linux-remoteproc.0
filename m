Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFCE1D5CD6
	for <linux-remoteproc@vger.kernel.org>; Thu, 17 Oct 2024 21:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729200313; cv=none; b=mdr3/xDFjmCZAZTPyoIKKBm9VGlekUTS0/cq0iaoJL6vE13Pl5t/r6z9jjw8dECe96mWjsdQ8FJv++CNX1hDaxhJ4f8MihqnCCidZ55C2Kxz642B65VJRKxsrlvrotl8qsuehDenjVQJzjvoXinsAAnSfg2ifGyl+r1Y9H7CAS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729200313; c=relaxed/simple;
	bh=f3XSZjpMW+4pSNSq+5t+nHginY6jLJSrXAO6nlE9cZs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t4ovgeBZ5bCMl5Cp69vEVrU8eOJ3MEKUvfP2nTcR3S+zojWAJj5O5cGz1nWagiLV2rMr6UJ9ggZ023G7EEb8fLC/glh4rj3KryddlLN23bq9bVz8eCYuiwGDCjLOHo//tn4yuH4K+jtE7GhXtI0wWPEFovxMStNKHtE91XFuNSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KhRHIMdN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KhRHIMdN"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49HHLht1002346
	for <linux-remoteproc@vger.kernel.org>; Thu, 17 Oct 2024 21:25:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6V0PA1pbHT6De/zvPtGOGGXjIB2qbOpp2xwkNgIwcO4=; b=KhRHIMdNcsvOhkPe
	uItromkmi1BWhuNFe7ea7rs0UcJV5hPGHqI45i3gDdwAEuyrdpOANU9Ui4pCxzAw
	Pzu8DgEYp66uiyGoCEqAGfSmMbwr1FyGFXW2hiSeVjoyVcaC/46c7HvcP1PlalZa
	XbNr+kvKEpVUXQjx2uSv1EDMkOTmSFLOuAlZD8DZKPkB2n9Fyj7X7IR2OmwEid/7
	dWLJiuFuMONCZ6boU98S7zGV3OtaU1q9Qy7jUsul4FSmfHHZuMumYkGiw3bYaQCe
	hradrwluD4PgswzGuBn01zFYHFnX/VKc9D4wFy0h8OGvVpF8FujOHAq7yQc78zhG
	0trcHw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42a5xypg8v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 17 Oct 2024 21:25:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7b1441d231bso35491285a.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 17 Oct 2024 14:25:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729200305; x=1729805105;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6V0PA1pbHT6De/zvPtGOGGXjIB2qbOpp2xwkNgIwcO4=;
        b=f1712J73tF+KoeurenhwLezO7Y17Sls6dk2RJG++IrurGukwu55aqzD5g5BQ+Wq0QQ
         0I1yVGT/34+qVMCb5INclYno1hvRzXlqe3v2SttrFSD/P3NQNVFhylhSptFX0ko6FD9m
         R7L+RAEKWIpcEzB6jWH32Vveifpbm/vfFJhY72sFnCRhqfmoy4A3zEZxGCMMTDVzJ0E0
         pvpN00CGNcEW59Y3tbo7VOzeHhSD9qdDXzvhhnnaJ01r/fKZa/SfWGzr163gmnHzQ9/L
         PQntwzJO01XvkeO7hxzOT8ssLK6+uxP3v5yYGBDThdhu2BWGJFc5F1PgvL5GwEa3souW
         kqDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNhNeI0FbAnONwb4EhwCZ1p9s1ZFNsRW4x0nFLbAJjUhzTco3tZuzHvwerTFR2p135IJ6ohTVzqJ2nYYXZSVDh@vger.kernel.org
X-Gm-Message-State: AOJu0YwSJvqHMD5dF+CbRzsfjSz+vKq0ekBANLaZxkPRIuKS5hkq6/0h
	I3rlCxuXkelxpBhpqsfeaMYIx3kVshpgZG2GBTmD8mr8JmC+QTw+332dJmHMKIWGBg9BOGss3kX
	shhWj4udtTsoGrfv0CGEUTAH/+LkPMiJvtVab/jh5b1YSu+SPj+Kc8M5p4qdkTCpEVOy+
X-Received: by 2002:a05:622a:1790:b0:460:a584:7b14 with SMTP id d75a77b69052e-460aece96b6mr1406011cf.1.1729200305450;
        Thu, 17 Oct 2024 14:25:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGk/ZQpFtr4eYXVelF1QQ9saPRD8rq5WepP31nYkQliEgOxyubghQM68LJwB+eWOr/Ye4wNA==
X-Received: by 2002:a05:622a:1790:b0:460:a584:7b14 with SMTP id d75a77b69052e-460aece96b6mr1405691cf.1.1729200305035;
        Thu, 17 Oct 2024 14:25:05 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ca0b08bc27sm24203a12.45.2024.10.17.14.25.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2024 14:25:03 -0700 (PDT)
Message-ID: <6787fffa-642a-4099-ba00-445dd2b865ef@oss.qualcomm.com>
Date: Thu, 17 Oct 2024 23:25:00 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] remoteproc: qcom: Add helper function to support
 IOMMU devmem translation
To: neil.armstrong@linaro.org, Mukesh Ojha <quic_mojha@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shiraz Hashim <quic_shashim@quicinc.com>
References: <20241004212359.2263502-1-quic_mojha@quicinc.com>
 <20241004212359.2263502-4-quic_mojha@quicinc.com>
 <83e23090-0390-4c2e-91e3-e222baaa889a@linaro.org>
 <ZwPyE/rQOH181rqz@hu-mojha-hyd.qualcomm.com>
 <5fc9d581-14a6-45e8-8eda-4df49b81f15d@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5fc9d581-14a6-45e8-8eda-4df49b81f15d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: LdzxyRSSDUwMfKMXuFA0r0FYbQ9Devps
X-Proofpoint-ORIG-GUID: LdzxyRSSDUwMfKMXuFA0r0FYbQ9Devps
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=748 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 phishscore=0 clxscore=1011 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410170144

On 10.10.2024 8:59 AM, neil.armstrong@linaro.org wrote:
> Hi,
> 
> On 07/10/2024 16:37, Mukesh Ojha wrote:
>> On Mon, Oct 07, 2024 at 10:08:16AM +0200, neil.armstrong@linaro.org wrote:
>>> On 04/10/2024 23:23, Mukesh Ojha wrote:
>>>> From: Shiraz Hashim <quic_shashim@quicinc.com>
>>>>
>>>> Qualcomm SoCs runnning with Qualcomm EL2 hypervisor(QHEE), IOMMU
>>>> translation set up for remote processors is managed by QHEE itself
>>>> however, for a case when these remote processors has to run under KVM
>>>
>>> This is not true, KVM is a Linux hypervisor, remote processors have
>>> nothing to do with KVM, please rephrase.
>>
>> Thanks, perhaps something like this,
>>
>> "However, when same SoC runs with KVM configuration, remoteproc IOMMU
>> translation needs to be set from Linux host running remoteproc PAS
>> driver"
> 
> Thanks but I still don't see what KVM has to do here, KVM is an an optional
> Linux kernel feature, Linux can be configured without KVM and still perfectly
> startup those remoteprocs.

Mukesh, KVM is a very specific use case. What you're referring to is
really "no QHEE / Gunyah". We can do s/KVM/Hyper-V (or almost any
other software running at EL2) and your claims still hold.

Konrad
