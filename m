Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938473CC9EA
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Jun 2026 10:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692129; cv=none; b=ENKgp3PbHEKP6sRqb3XWFZhhV2pNKiDpA1PAUdE/h4FJpNux+oJxMfj9cUlvTgpqpA3h5f4eyneCq07IVsFaNxSd+ist26lU2t+NdM5H2iGbMWoT/HVp+gSqYB1xt+abqW4HHcViwsvzdvSfcUCgyOf3TPT1EjU4cRwQyiG/34o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692129; c=relaxed/simple;
	bh=vykhn2iUP9xzlyVXNGgjtbmpfhnAgLGYRybi/3hncsM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sK8cPUzjIyqw1VtrfrP+9pF5tgXsHg6rcdOjk85OZqvjD6eaLYEFKhX0RupctqIB8wMWG3jKgpEJV9G2ScIvXEGCiaZtFwk5h1jWdhBq/UKehn+MqGlBqxvatqfAbK0vKrtQK8pe8MNQIysnFa2QdatbNtnGBe1ndgB28BeI+Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pwRwjOqW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BZY4hc8j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pwRwjOqW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BZY4hc8j"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8UKeQ239728
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Jun 2026 10:28:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZhZEMTvXJ4lvU6WeVqcP5knOXjwk4Tb18lBp//QSNo4=; b=pwRwjOqWrbf5FSGY
	5VmV/wfzVI0mVxz5HCTrZ62nmhQysC1pbwHvsS+/0/sbO53J/A52uynb0LOktg7Q
	MkIHasSuTR6CKFtT8ho/AlUbT7+KRXS8PKnxXCmw+RAk29/eAqbL09E1VTyctQjC
	3993GtdeijB/bnrg2HDpuiOMAl7Pu6S/nuotSnHx1Ar3bFNOb19BtV0vw+4weIze
	xScr5Uz19E25MGymxM1we2u+A4tOET1O8158sqUWsMW4GOm8fIt8ah1roRb1fd9e
	0pzJB+tzJo1u18MNYQNt2CLKyBuJ/5vX2l6Wa0YnOblF0VqVzafDgXYpec/Q9fzV
	FesO6Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueepjjsv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Jun 2026 10:28:47 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d982d932aso7207924a91.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Jun 2026 03:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781692127; x=1782296927; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZhZEMTvXJ4lvU6WeVqcP5knOXjwk4Tb18lBp//QSNo4=;
        b=BZY4hc8jUWOmaF1kQRy4EGEejBKRsI+0BHQHu9JDAZz1MYNt10V3mcsGMlnMByf1Dl
         dx83NHbb/TCqWVmxw44hRoU3pkdcI9xl7YuNeCSRnanDFZ0Kfp20YlS7XU1jPmIiS08F
         QLFt0p3BP9ZnsGrH9k6NvbGe1BdsoxAyyiOYy7tgDu9P9pRjUcfAOPdLnBd0DPkF9n7d
         fyW22I8fv5Eo/9mEgZTgKP9L5Fbr+rBQdxEc5yFRJ/bwlu0+1dJmulZIJ9erY2jNXbbI
         u8oZdNaR0wWvyw81R7NORCURhCPgg2ub5KzaMI/0qsyxxockO9tqS0+LTu7NCMIS6YzA
         PLcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692127; x=1782296927;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZhZEMTvXJ4lvU6WeVqcP5knOXjwk4Tb18lBp//QSNo4=;
        b=FE9YM0HzhZIT8g8WAxwVqZCDQKu8mAmE9MqCes3sXA7JJj/UfW+6gbVREMRnCmKVQv
         p+wQwEFgijCtfva3piTS36fJRFPBqxR2i/6qHa57RKjLC+eExBHeMvWKv4nr6qNrr6SK
         YwjZyxMAIHAzdjCnCIe+jpd0066yvfemanO8WCjeT6HKZmO+VBa2H3daiHTeuG8BJyvC
         7mmyOS7kS9nr0T8UFMgb9x8d9eHic7/aRuw5tODrJBxd/xo+YWXx6mDynqGkxPXw01+b
         7DJu6YrmpV+iB9LkpO5rSU2F+Nf7xSXdIlc9GgOdz5YwtxOhdpJsEbC1Vh564AM3VuoS
         bR+Q==
X-Forwarded-Encrypted: i=1; AFNElJ8AzxnTJl/i58f9KnR7VS4Yc2l63+9nqtYc46i+3Xz/Rcevf/1F3xAHIkm7k0OcovKJu6eKrXMLvG7zWXjQWDlt@vger.kernel.org
X-Gm-Message-State: AOJu0YzfBA4pVKl7rthKLIfUeGjSIdWICxl53rUjiBu3KAM7mtTlJbaW
	oERY/GKc4P7opAeP1K+VmNEUV8kUcpqp8vQM7EJ1fxvxRiR7GlT3kEAUebK3Iv3dCd/+M3n16Ia
	OEZfYPz5ayINWtxKC/h76vavDeM5bjmZZtGswLXoiDyC0IHlt+NeBfQC4xGbHbBf+RoqIcqpj
X-Gm-Gg: AfdE7cnkYmlIlUGtAPqTS0hsQ5TMOItYkdSs/16fd5YSo49q5n6hu4yfAy3xOcpqqaZ
	KqWFkCldNVCQehECsrKfJbAUlF4rGVWtiYGUGEhImXfm4uVFvuNLBmcs19TA3dY+RllnLUV62aV
	2xZeiUsF+zSHiguNtw0WHbZEaFwzHjWGEp53rKwi31wyMd5yNK1VqE1yokA6yIZ8ydiA2niLkau
	NrY004zpuU9HK/4/aJgRvOomP/nqs8altwR1+fP0hglQINUkwDj3HxuSj7epqYhFeVJ9etduCEt
	t5bUfrx73rOmlFLDsLDdwh/x2qC5iEe/aEfIlDDOVHSujPA693EXlUV8xCRm0oZW/R99ZhupQID
	qXlmxCCoE92uGveZkwS4l84jTL2H7shYN3Tos7gFbWUYwmEIKnA/j3P9Qbvf0cpC5VFmy9bezQX
	7D8KXFpQ==
X-Received: by 2002:a17:90b:2547:b0:36d:6315:1de4 with SMTP id 98e67ed59e1d1-37c9ebdd527mr2741512a91.17.1781692127171;
        Wed, 17 Jun 2026 03:28:47 -0700 (PDT)
X-Received: by 2002:a17:90b:2547:b0:36d:6315:1de4 with SMTP id 98e67ed59e1d1-37c9ebdd527mr2741498a91.17.1781692126736;
        Wed, 17 Jun 2026 03:28:46 -0700 (PDT)
Received: from [10.133.33.84] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37ca1dab259sm1520012a91.2.2026.06.17.03.28.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 03:28:46 -0700 (PDT)
Message-ID: <b6d3fcc9-92d5-44b5-a7ba-39768f6beff3@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 18:28:42 +0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] rpmsg: glink: smem: Use modulo for FIFO tail
 wrap-around in rx_advance
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, tony.truong@oss.qualcomm.com,
        chris.lew@oss.qualcomm.com
References: <20260603-rpmsg-improvements-v1-0-dcfc22ed69f7@oss.qualcomm.com>
 <20260603-rpmsg-improvements-v1-3-dcfc22ed69f7@oss.qualcomm.com>
 <frnasys4zgfbdmwd26m3fcfskopugye3s4zii6q2uk2w4in4da@kkrj4ffsgfyn>
Content-Language: en-US
From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
In-Reply-To: <frnasys4zgfbdmwd26m3fcfskopugye3s4zii6q2uk2w4in4da@kkrj4ffsgfyn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AY+B2XXG c=1 sm=1 tr=0 ts=6a3276df cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=HCCoXu3ZlwqH8F1Mh14A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: bRveE8_-edasJ5bXXxEwBcAUd1wm6QcO
X-Proofpoint-ORIG-GUID: bRveE8_-edasJ5bXXxEwBcAUd1wm6QcO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA5OSBTYWx0ZWRfX189zmbvgqfuR
 X8C1HG9QWyTcXHGN0c6/uHxVcfI7erTRX2LR5o5xuCclIhZiKkCOFc/B5IhqsJrM/UKjV0r7NX+
 9nSVJhuqHJUhxIlSokQ9aAGfnJu+MTPbIV9yhoSpJOiLFH6eBs7UZtA4Ry04ngKBKuAylnt6Wm3
 iGSQesDGyRYNn96eyp/1KiQcvh/UPUoT3RxuVHBp4Zh6lg0wE+U6fjJ0fHuc94Z/pLrgbw9XeqM
 mIC6mHM6jRoK8ZjN2rFZn7PcMVRLpB9KY/3EZzQj48iZ/fP2ayVrQGrCn8iUzAI00XOICoAVGFN
 QWCH9exeA5lkBwbN7NQXtJRZJjB82nDXYPKz5HMGUvkhdaTIZO6t/hJD1ccGp0iYmIi4rgbuiM7
 Y8Hm+4oBU2uehWNF8UTEF6/Re/EazluHkn2KD28CdNuD1a9eX8/GnbYAlsBK4Z2UKe3Bbb1oJb7
 b5IRHa7ymYIG7E4RZNg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA5OSBTYWx0ZWRfXyb5amEljB1+E
 idl5lY2DtP5WX39NoVsU1tqwZeedZ/ydLQ4FJItWXdKZKXjGSLg85diEb9xlVKNEoP2/UzYsiPM
 WuRmn+SiSI6+Llz1h8zYq+IQPo/zYYA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170099

On 6/3/2026 8:01 PM, Dmitry Baryshkov wrote:

> On Wed, Jun 03, 2026 at 06:14:30PM +0800, Chunkai Deng wrote:
>> glink_smem_rx_advance() wraps the tail index with a single subtraction,
>> which only corrects for one full wrap. The advance count is derived from
>> remote-supplied packet fields (up to sizeof(glink_msg) + 0xffff bytes);
>> if such a count reaches or exceeds pipe->native.length, the tail remains
> Would not such a packet already cause issues as it will overflow the
> FIFO?

Yes -- looking at qcom_glink_rx_data() again, the existing avail check
("avail < sizeof(hdr) + chunk_size") makes the scenario I described in
the commit message effectively unreachable in practice: if a remote
ever supplied a chunk_size such that the advance count would exceed
pipe->native.length, that check would never pass and we would return
-EAGAIN indefinitely without ever reaching rx_advance.  So the
out-of-bounds offset I described would only arise from a malformed
remote, and at that point modulo does not make anything more
trustworthy.

As mentioned in my reply to Bjorn, I’ll split this patch out and
discuss its optimization separately.

Thanks,
Chunkai

>> outside [0, length) after the subtraction and the next FIFO access uses
>> an out-of-bounds offset.
>>
>> Use modulo so the tail is always normalised back into [0, length),
>> keeping it consistent with the index bounds enforced by the WARN_ON_ONCE
>> checks added to the FIFO helpers.
>>
>> Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
>> ---
>>  drivers/rpmsg/qcom_glink_smem.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/rpmsg/qcom_glink_smem.c b/drivers/rpmsg/qcom_glink_smem.c
>> index 42ad315d7910..4f143921b719 100644
>> --- a/drivers/rpmsg/qcom_glink_smem.c
>> +++ b/drivers/rpmsg/qcom_glink_smem.c
>> @@ -129,7 +129,7 @@ static void glink_smem_rx_advance(struct qcom_glink_pipe *np,
>>  
>>  	tail += count;
>>  	if (tail >= pipe->native.length)
>> -		tail -= pipe->native.length;
>> +		tail %= pipe->native.length;
>>  
>>  	*pipe->tail = cpu_to_le32(tail);
>>  }
>>
>> -- 
>> 2.34.1
>>
