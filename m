Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E30C313E21
	for <linux-remoteproc@vger.kernel.org>; Fri,  5 Dec 2025 13:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764940512; cv=none; b=fvimOgAsMfbzeQ/HGUI6ZkdW7zkGpdBg5kQFEkOJGpHA+mZKGaGVdeLBExJ4Xe681qvjiKFSMwblY9icN5UrK3rVaD3aOre10KTwp4G0ptmAhdi5cYXJnAHIYY/0YTEhgpCqFIq7nogAEh79Rhxi6tloG2QhKdO8an+mC1abo6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764940512; c=relaxed/simple;
	bh=P6Iaz2aOtsMqfxcuXLgTn3iU7uCLpjdRc+QxEx17bSI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nzwvnduJqGy2PPz4FdHKdLa0J3NgPHNxJZ06y6JWYwPvB+Uwk2cndPAHydbyC45Zv5MbughlftlyBLaPOu5U6KrlQmsVxQxm6qygeRAMe3sSob3pOgXvnhp/nbLpIZGdvPgbdCaasMcERMn418COAnfKueuhKLSHdw3HSEiGyuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k7eMSDE8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VynPNdAc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k7eMSDE8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VynPNdAc"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B553nwr3522548
	for <linux-remoteproc@vger.kernel.org>; Fri, 5 Dec 2025 13:15:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m+ywHSJnRc2OkdOLEW3U9rDhFUvuD0Iwme0Y53Q+L8E=; b=k7eMSDE8MZgapD6Z
	VdgNvR5eU7siZfXYfjk5wsrVWBkhlvNIk+yisPPfWuNwGTT03/qdcKhVuz+BZa5U
	Z9YHWS9oJYvSyT7L3ypD161KPrYPc51WjE1tVXlz4CRmpLQIVkTRmFIm33xk3Xbj
	4JYjybAnPiK1VTLsBuvkxtrb5o4gnG2tiH2p7FJFno+cM11BAHisEV/6DT+77sVv
	0WaOUtT9uzNG/likjcy6YDs6AXGhMIg3Kz0MA43FGwAHjm64Anl5E8THc+iCsUeS
	aCB0vxzK8qMWE6c+rji+kuhsW1ckG5G6gbJAhBec182U9cxxrAKYC71b3mYediAA
	LdPRpg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aurwvh9hu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 05 Dec 2025 13:15:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b10c2ea0b5so66698085a.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 05 Dec 2025 05:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764940505; x=1765545305; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m+ywHSJnRc2OkdOLEW3U9rDhFUvuD0Iwme0Y53Q+L8E=;
        b=VynPNdAcCBADCCJmSHBWNxxPEq48VMhGQM7iovNmO0QyC/ymZU9O1eDlI6X5rJe7t0
         ttqTPCz3Zs37/iKJUP3DM9Pk0Ax2jMTRiGsE4yrbgvpMW1x1YbD1/RAUkEVmxrE1jZuD
         rTISpVkCo61Ba3EjbX96kTuxC3fmGbSRAem5wZMfjgksVps5Yghi7az43trsXOBOeewr
         x0uyZtO7XmlJVOp/S+nH6y3ojPlWpUjPXhsD5F3OcOO7z8Z0hFeQ6nli365bnO6Eb9qe
         /VF+qG7uSi91BFyx0d+PA86e1ZFwKnB6JN+siJ3VGAe3Q3c42mdzFQ9nCZZNRagLAMm2
         GVjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764940505; x=1765545305;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m+ywHSJnRc2OkdOLEW3U9rDhFUvuD0Iwme0Y53Q+L8E=;
        b=fWulCsZlLK304NW7IlCjVLQAmZCHXJPzWZpZCu8CDjTOWPcCbkQvla4MFSbHV16Vg+
         th5pwTaY+2dtj7sHjzz+1OfA47NGGDYquFk91itr+XOhfSJTEHDxKVPcOj6kdIrMqXEW
         B6+eh1O2iQqbYCZA3IRo+1JcdkHjkAPKbeBcJW52dZZGsJP+XRiMTIH8zv9qaYl0SmIS
         1658ILVkm/bzKrz5FGshggo8zhR/CyKYGsMuIqiVSgM6wHIW2tzVayOUTiZVz4Ozj2zB
         hg5WLo0Z/nKmFPUTtlMtL/XE1xMQvybE7hxylRwH6gzc0rv/aoxnyyLQ8WgDn/gaGxIJ
         1gVw==
X-Forwarded-Encrypted: i=1; AJvYcCW1ejo8WAtbi+0BYSpiQ5e6KZpGmnw3DKrHvkCgWhV8+wtDsL/oz1Jdt9ZHos6+gP/mxZWZS9x1U0TThvr9m2Sc@vger.kernel.org
X-Gm-Message-State: AOJu0YzkI5vBKshDqZGVb45/02ukiRRcI9C5maIbqAr/dC5iD+pp0CnW
	HfjrLe/zJXlRb1sKEo+iqbplu42zYCwQSnfLaMPRlO4P6SnWSwFdJ+gI4y5nz7ir9xeSxFbSMn3
	WzHCHcK348wQUc0UvwsaviHhSmgwQ5YrxFqjRKL9pDfDTYAtZFf7w//s+Jqm2qO8ZMLxd1B1b
X-Gm-Gg: ASbGncvewf+po7ddmk/OkvBLkV5N2mygSaD8zh4hhzl0L4mHKN/hYkdSu1S7yTLSKkb
	Z9LkWQUP0UWMfAqdLnseu011rgoMeZwxCPsSb5xTTtHi95aIcn8eiPk38JS9ahyTl/hKE3RB6ez
	1SLwwzj05rFeB7mUegXifS3coWyPdC5z8kU1vgqkbyOBn2gfrM0WWaCNuCaQOkULq1w5mbImamr
	/R3mVVWnThpinUfI7FYUW8cq7NsazhhP8Mjx+Zansv8CPPFpcXhhKCDex8gxULNFXRLL0qXf+N2
	XoAODKQ1XsrgkG0mIZ5oZdWXNZ+H7+X6woenAtCnIPcXWjXTF0Hy1ElEXjUfKLfLwPrQGep9dVB
	/0MSMzl9xmuxatjFqvP8/dhkTshDSor4qrMPJl5vLzDANo+xBJ37SQ6KHRUm1fgEWIA==
X-Received: by 2002:a05:620a:370f:b0:8b2:ef78:9c1a with SMTP id af79cd13be357-8b5e74503e4mr1049114485a.11.1764940504872;
        Fri, 05 Dec 2025 05:15:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF2TOA/4tlgmqI9XOixGEr3Bq9/K70FoiPYeFtX6Dtk8hwTUbfPmshanH19pRHfCVGeP5SSpw==
X-Received: by 2002:a05:620a:370f:b0:8b2:ef78:9c1a with SMTP id af79cd13be357-8b5e74503e4mr1049110385a.11.1764940504363;
        Fri, 05 Dec 2025 05:15:04 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f44d3d9esm355075666b.30.2025.12.05.05.15.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 05:15:03 -0800 (PST)
Message-ID: <e78feaff-0b48-42b6-a824-0f102a6ac9cc@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 14:15:00 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 11/14] firmware: qcom_scm: Add
 qcom_scm_pas_get_rsc_table() to get resource table
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
 <20251121-kvm_rproc_v8-v8-11-8e8e9fb0eca0@oss.qualcomm.com>
 <86f3cb9f-e42d-40f9-9103-1a4953c66c71@oss.qualcomm.com>
 <20251124152538.wt3kzztqmpr76hsx@hu-mojha-hyd.qualcomm.com>
 <4376b7cf-7088-412b-8596-bdec5bdc273d@oss.qualcomm.com>
 <20251204122806.s7lnqffgcrd7usem@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251204122806.s7lnqffgcrd7usem@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA5NCBTYWx0ZWRfX2Xc0h5N9l5uf
 A3dsDezoHxtv/bDy2/rwdEPs3NPsqMvwTJRNVDIZs2DTDL2hW62/QI4BBzPZXVDJEwLUgNWAcBk
 NjHGmCicCqv4hhUR+myHKVrm+BRVLHJxR0B51WG/+PbwQeBsemmjjPxDu2+XBrBwh5Ln0+FsknD
 nDaZp4e3n2OihB7ydCqVdiQG2hcOyxOodeSJOlgBL3bg8nFee4ic7CNLNQLVhjcuhq+zTuX4Gdv
 ySOJOzOZU2bP3R5BMriUVz9YJBzhEp1DLh5ibVP8V3ZjXvYIm5EWGHMVxBGgXr2C2/hkiVR9nc6
 lVprOQGtxyeH6YQ9x2lbn5F9kdft2RNAjUgT440pwD6ZyVq79a0MMPFRaHlC7qmsLPGI2jWm41S
 MwdK/M7Ow+oWfC1+/thUzptzAgFNjQ==
X-Authority-Analysis: v=2.4 cv=Yd2wJgRf c=1 sm=1 tr=0 ts=6932dad9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=-GPZpz3KrsHxiqAZZ8kA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: EzvkIvvn1MwG7stncRuxWQNTMVKjC97n
X-Proofpoint-ORIG-GUID: EzvkIvvn1MwG7stncRuxWQNTMVKjC97n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_04,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050094

On 12/4/25 1:28 PM, Mukesh Ojha wrote:
> On Wed, Dec 03, 2025 at 01:36:32PM +0100, Konrad Dybcio wrote:
>> On 11/24/25 4:25 PM, Mukesh Ojha wrote:
>>> On Mon, Nov 24, 2025 at 12:48:31PM +0100, Konrad Dybcio wrote:
>>>> On 11/21/25 12:01 PM, Mukesh Ojha wrote:
>>>>> Qualcomm remote processor may rely on Static and Dynamic resources for
>>>>> it to be functional. Static resources are fixed like for example,
>>>>> memory-mapped addresses required by the subsystem and dynamic
>>>>> resources, such as shared memory in DDR etc., are determined at
>>>>> runtime during the boot process.
>>>>>
>>>>> For most of the Qualcomm SoCs, when run with Gunyah or older QHEE
>>>>> hypervisor, all the resources whether it is static or dynamic, is
>>>>> managed by the hypervisor. Dynamic resources if it is present for a
>>>>> remote processor will always be coming from secure world via SMC call
>>>>> while static resources may be present in remote processor firmware
>>>>> binary or it may be coming qcom_scm_pas_get_rsc_table() SMC call along
>>>>> with dynamic resources.

[...]

> Just to avoid iteration, are you suggesting that we can keep this
> guesswork as part of __qcom_scm_pas_get_rsc_table() and start with
> something smaller than SZ_16K?
> 
> I kind of agree with the first part, but SZ_16K was the recommended size
> from the firmware for Lemans to start with, in order to pass the SMC
> successfully on the first try. However, the same size was failing for
> Glymur, and it required a second attempt with the correct size.

It depends on the payload, which you're probably much more familiar with.
If 95% of them will be closer to e.g. 1K in size, it perhaps makes sense
to use up the additional few dozen cycles on our amazingly fast CPUs and
retry as necessary, instead of blindly reserving a whole bunch of memory.

Konrad
