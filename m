Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8949C40DFD5
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 13:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773149028; cv=none; b=bMUrKPKDQoB0s/puzCsaWnzm0h2cVGwJ9aPm0VX2qYKJZx3PiTDPiMXkbTloIH26Jt//g9onfRnMZrrZQ5vY/ALAN1RM7fvX5ViL2nvCyC4Uu5nVhejjc/2o8cl+8m+HpsquBvpzkafFmZfxehKuXyrni9FR5Jo+oYvsbX1hNDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773149028; c=relaxed/simple;
	bh=YD2z3hHvCix7UCDpbM2li1t6vWmITYSKd1Ek8SNEmIM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hrvLWFYnQ4qaDIk4h/538dLCzsIcb1XWBJcsShk2eiqwGn7zjW8zMXpaJMcYMLCa2/mwGMEQe6jllxyQOXgK7Nr4meQ/8QDwUExSy4xHomLgDFzK2AD/wERQBezNolxpjKMP5jPqfZe8ziYkOB8IBmR2zqeFl+dEsp/GtffTF4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pVrXf5o/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LEc46TCx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pVrXf5o/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LEc46TCx"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACaXSv1647128
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 13:23:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	orEohHfy7GJzc6faGQD96uNhCW1mOo5TuHLKgf3TG6c=; b=pVrXf5o/EVBmE+wg
	BT73Rsn6SpKJ5wq+G76Ylf7BWahcXxLYD+eUmWPFXcaWhkwUpobx5lK3xRmxITXS
	bC+3ReO12w5lG0ypF9by+SDzV7dKvczmi4V1ObY+HulYNow/9x+coIgQOc0FDR5z
	tqh/NwxX4y8wUkQqnAe2Ol0tx6qnoYrTNmZo3PQbWnPYlAZ96o/M5CShmfzCT3Q4
	AKPsiGpksVlygVdcqY4yPVfjY54SOoGDSeJUIxOABYkWnjdZlzq8wUrR88zzeQ8x
	0ey8qW+7bpHy0Tuk5wPV+wlDXL8O9vInB7v/+JNZUUTfdiow3BeHh16CYZpK3pDP
	/hjuyw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct8802neb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 13:23:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd98d96382so39524385a.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 06:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773149026; x=1773753826; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=orEohHfy7GJzc6faGQD96uNhCW1mOo5TuHLKgf3TG6c=;
        b=LEc46TCxHWP02IkGnKUfFjjsd3LWiuI7cwJOJE1Cjc7fsm8mX+tVjXPdPrZ424LFbD
         0uRLbPS9smhYv+TD8Di4cDW8D5fbXWgXA+kRcz511RNvFqb1kKtYSHEHvi090jgBoaYN
         xrS4eWwHuW1NzuqWGFRkDfyNJHH5uutGpgEEpDKOJiMoF1M5xEc7vkkWwKGV0nUETXEg
         PJET3n3+lZlXUbSA6AAeLNIfwd/MTKqMUvlhiQRI7tyv4R4iPvSu5BN1xGbNckeVcTne
         pJVtw1A1XByclnfqgEzakklx2pBZPuffNDFLxCaUJ7il6lKXgSYL9HhVVn7GPslfr9Qe
         /ZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773149026; x=1773753826;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=orEohHfy7GJzc6faGQD96uNhCW1mOo5TuHLKgf3TG6c=;
        b=d6e1xwEUQptycO3LADy0oK3mldhmxPAMl78LJ9mlR5xD5+rduHDCAPSTH+9IFju5dp
         55GVgTnIEb3sFvPgD0HcvrS8trg6qsL7rpKurV9nwEMV9wGOH+TDigE49V4/7I17WaqT
         hkr09ddjByl0GVaQqTi1i4668L8rn8g1lWf/FA2GorVcydjWC1ZamZX3ikHv2jtTX9Os
         aaRcC2tSdGuenLc1/ZjfZfQc2sMRzNtOpH7s426GMP3V3bN+iqpv+6sa7lPiIefHa4ND
         xy4pd6iiCWLK0MMJUwJaFtaL4STEnRkzLWvFBrtug0b2+5oaGEg3MvX/qz6bPCDC9iwl
         6uWw==
X-Forwarded-Encrypted: i=1; AJvYcCU/7gCe2yxw8c7cRP4L5O1ciKo0/X57yzujxU2/yv+e5CmnHfkxHbjFEF48lk/bXCouVMCJHCKoo4yRIjcjyc/1@vger.kernel.org
X-Gm-Message-State: AOJu0YwdGbAOX+/QGxkiaRCEi5lN2ACNosjVTNAkT+GDPBnMkKo6SbVJ
	pP9PlWktZHEwyDAfY6ath7ORnfFmnKaGDLeE+I4Oi8HEHO5E2ay1P5pGTMg73AFLy9e5qkyfBiu
	ZqDKKgOpU22t4mn7RFidY83DL98pU5PrlRsg5VkSxGNpCa4/NnOz7TehWz3xjZUVmHApnodi9
X-Gm-Gg: ATEYQzwbtCMoC+tD+XX6/YFXgTkR0gIDd9z4VuuTwQDGska0AShddAgBVvSAb6OjqFO
	b1dekEJ4mhIa5tF8+wStXP0L0m5uuPZSypNy/csUwsIQ0wDTzjF/2Po+NTpFMoDC6CIKfA+/KPu
	BHk/1HPvceZKuhSqjoy/1wKZWw04SHVO29/27vr3VBjt6IbT5zr+JtUtJZ0CQJPzCXQmu+dN3Xj
	lkTncZ4r2IEpdhxom9iwP22CfjRmK/aRMr2bx90tD5RDYF3fagY1ZhHN23QIP3C7+1aSytzK1OK
	8jJrjtKO739AH5x4zIrnJzDTyDjRepXUWiL3eFMn6i+f1woAWYwPOPfwO7erpiRIril5a/5ELG7
	EFCwL0ObbUnuaDKDdNC5Jj6FtBFxluWww/yDHzjH7xPZP6uamhU1kCuqopZAkUbn0gXE5XfNooW
	kID9RO3E+X
X-Received: by 2002:a05:620a:4507:b0:8cd:9938:9809 with SMTP id af79cd13be357-8cd99389e77mr147056485a.26.1773149025738;
        Tue, 10 Mar 2026 06:23:45 -0700 (PDT)
X-Received: by 2002:a05:620a:4507:b0:8cd:9938:9809 with SMTP id af79cd13be357-8cd99389e77mr147048985a.26.1773149025121;
        Tue, 10 Mar 2026 06:23:45 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8da01sm37186097f8f.1.2026.03.10.06.23.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 06:23:44 -0700 (PDT)
Message-ID: <8ad5ecc5-ddd9-4d79-acca-41b3797f0f3c@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 14:23:43 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/8] soc: qcom: qmi: Enumerate the service IDs of QMI
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, konradybcio@kernel.org,
        andersson@kernel.org
Cc: linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
 <20260309230346.3584252-2-daniel.lezcano@oss.qualcomm.com>
 <7d036c96-e257-460c-a91b-deee0b9c348b@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <7d036c96-e257-460c-a91b-deee0b9c348b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDExNyBTYWx0ZWRfXynmQAFUw6ZN8
 izDg2zrwUZGF+4xSiuM59qwJPSviZs5EO72srPZhef+NEKgnFXyX2LScKEd7Qf9+xa9eC7qsHmr
 BrM82tIjzFqwiVS3Oj5nEjitkqUv8+UL8WlXhYm8oLlgj3iXopc/x5vXLLxYcN/WDznAWwugSfT
 jPcXsiSC+4QLEFlJrP7YXc4xk1p/mpSaA/vu1Ti9/HPCyJgaiLcxGY4xrQtToR/ywCwQg7yH3ff
 H5WSlRUo9Xj/C1ui3mh7iFvUM7pRYvpiZsyZsEloaJxjJzpHvgaZbdtWlGrtVb/0unnty2Lh7jw
 7s9vuWoug+Q3+Oyp0LUeavtRIt2GjjbRkahdzjKXJSUgyiwCem1JlUCrtHQ3prcaED6dB37vORW
 HTOxm9WqJ2CGIYDGHUEOm2+5IHwcZhbGyKsitYC1feRXutiTxghg3YyqpHKJP7FqBBNG8tjJ+nU
 XeXgcGmLlI6s5RYTPXg==
X-Proofpoint-GUID: qE1QbdfqPLXJPeF2kRYpvjov6ZiuMU9X
X-Authority-Analysis: v=2.4 cv=Jtf8bc4C c=1 sm=1 tr=0 ts=69b01b62 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=M45qCTXPNjoLw3xkhRYA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: qE1QbdfqPLXJPeF2kRYpvjov6ZiuMU9X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100117

On 3/10/26 10:57, Konrad Dybcio wrote:
> On 3/10/26 12:03 AM, Daniel Lezcano wrote:
>> The QMI framework proposes a set of services which are defined by an
>> integer identifier. The different QMI client lookup for the services
>> via this identifier. Moreover, the function qmi_add_lookup() and
>> qmi_add_server() must match the service ID but the code in different
>> places set the same value but with a different macro name. These
>> macros are spreaded across the different subsystems implementing the
>> protocols associated with a service. It would make more sense to
>> define them in the QMI header for the sake of consistency and clarity.
>>
>> This change use an unified naming for the services and enumerate the
>> ones implemented in the Linux kernel. More services can come later and
>> put the service ID in this same header.
>>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
>> ---
>>   include/linux/soc/qcom/qmi.h | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/include/linux/soc/qcom/qmi.h b/include/linux/soc/qcom/qmi.h
>> index 291cdc7ef49c..b8d07f2c07e7 100644
>> --- a/include/linux/soc/qcom/qmi.h
>> +++ b/include/linux/soc/qcom/qmi.h
>> @@ -92,6 +92,18 @@ struct qmi_elem_info {
>>   #define QMI_ERR_INCOMPATIBLE_STATE_V01		90
>>   #define QMI_ERR_NOT_SUPPORTED_V01		94
>>   
>> +/*
>> + * Enumerate the IDs of the QMI services

I've the same number of patches fixing the copyright for each patch 
touched in this series. Shall I post the series separately and fold them 
with the corresponding patch ? (IMO the former is cleaner)
