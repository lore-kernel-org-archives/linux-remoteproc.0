Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E3030B51C
	for <linux-remoteproc@vger.kernel.org>; Tue, 14 Oct 2025 04:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760416151; cv=none; b=YNsBylPuG5XIk18c6i41w0hHc/A+gOZaK7o6HSLA+GjBGi5GrampUVDMGle1qMC1hlMwoRTy6QtRuz0pqkAaVTjYUDXGWaLEqUawNFUYJonj8kcSuYIc3rmpEpSVVErCEIxypT6TK4TnldQYCT3Nd/Q0zk8ht0QXrkQivgS0DEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760416151; c=relaxed/simple;
	bh=9sCf1XLCcsUswVl3Rkx1h9I82mM+ztc4hZsli0CE2lY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VvZkjtyOkgHVFx49ZmRC+1WxY/ButdohjSqVL6F826TD7lA1d3RD+AlfMCa3oKsVg8V5IchH+HHimC/+9r4028b2ik1izDkuXbiAJsWMlIwrAsMTesSakmFNLsDlBTRM44oBSBoAMbe++0TPxhM8gi6pDQCkkAPHl0DN+DcC8CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kMdmEn00; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kMdmEn00"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DHD9Js008100
	for <linux-remoteproc@vger.kernel.org>; Tue, 14 Oct 2025 04:29:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	76Uf+fwA3Xpg7xvSPdyXGE020wdT1FMcByxhgc0urqI=; b=kMdmEn00yS6M83CC
	4k6Kg8VTjQHYM0O3XuRJPOO1RMFCDqxguOz7bNKnmjiD7/mb79wWj4NRk9Mpfx7L
	VAtH1BPjRCgErvv5EkAAYoQbl3OZQz2N0byqnUS1qQOpzEXGqgEfjFFbND/ziTzP
	qDzpqrDf/6yBxFtHiNitsof8mqQXnca7FOw8UuuGyFiDvv3b0cZZj6Q5u9F8x8EZ
	vEb9yt2MmQukxdq2EENiz8D0wBB+cRSdwTMpT+KVdv5Qp/kTSlKKflh8Si+zvkq7
	4JduH/WlJ3tPVPdescQriRWUXs4e0Y/MYDUK3/i2cjkqYwjxYoK4SIKT6R3/OJV+
	PgyVGQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rtrt3w3b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 14 Oct 2025 04:29:09 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-269939bfccbso107802975ad.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Oct 2025 21:29:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760416147; x=1761020947;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=76Uf+fwA3Xpg7xvSPdyXGE020wdT1FMcByxhgc0urqI=;
        b=BTp1h/o12qeDFbpO2lbPOpMnwhtmUW7kGPW+Xh3XOMW0MluXObqvDUqW/YkjzFH9u1
         xveuUcbME3YAcVVEGjmbxo8IRWsJn9d7rWK5HSbwncIc52eWaFRNkShlnFkc9zMK8ho6
         tviOY6gSOE4cBq9HLLgSzL36cHTnP14y2bXfT6SsUfZ9qoVzO9T+60mQa9yOqHAen2vB
         ynha887TYN5QiorvZoFNy0kUGXYy0AcRgFsVsxXa9FzCFT36BY1bWDMAVbuL4s2EOP0s
         +Gn2xkD0WpSnQOkpWNDTnAW9zmN/o7FYogli1QqNz00FF7rd3yndcGHT2x+TgzV36//K
         eL+A==
X-Forwarded-Encrypted: i=1; AJvYcCVpaV2GPJtBUhPmI+uN83jugyOi32NSwRfG4mql66ry9JzcdPTNxmnbBXExhk8Qee/CDwlZXaVoeKkdrQ/n0i6r@vger.kernel.org
X-Gm-Message-State: AOJu0YzIOOzn/umQb4O3yiJt868yyRDQVCL2B5CTxmtY4qxzikQm5Crz
	aLDuOz+6iXwFFoyFzWzQZxnMly+7qnMSgcbPmowz4x7Z9yg1v11rPTCDIcO2nT26LvPmcsHDI5q
	LLL2EjrZS7z0tx7ZKth69vLLBrzs7KyXnHgkSQtVuziYTiefbFS2CBYOkFh8tpIT4r95zniBb7Z
	6pIk40jEk=
X-Gm-Gg: ASbGncvEbCGsGFcTp5kLxaeTSyg3EWqafChZSt8/sSH9hLBuyQboVZUaBtXyRqECT5H
	yV73WN4iBdZJfv99mbgQtTAJgN3p+ADcwCILu5wd9sFQN+qjC/MUGI9S1yQjoZBGlY6oeQZP4ZO
	TdAOYkCwUkIieildk2AWredu9OsnEyc1L8t0wluPPZEfXKTLvSbiYDIc3hlvQfArj8OaUpw4pSV
	B0qlHIh7p+zCWA7eOasMfW/zFXJezK1nSXiJgO/KYMbmWAYRrFkd5+rZNDikWQMjEkfCtLLzsOK
	92rX6DoWAij35c6s3JPxPmOCybymjc+Wix6kUieKLBrTG9Ykw9MF7sCCX8A7V+2+7yoC6zynjXO
	9Qo+i3/dMJKFDNaJI+FmMzLQ8u0xuTbKxZuQ=
X-Received: by 2002:a17:903:2f0e:b0:272:a900:c42b with SMTP id d9443c01a7336-290273ef03dmr293435195ad.31.1760416147278;
        Mon, 13 Oct 2025 21:29:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGo56hdv0/dwNtL5Wxo+sarDBi14f7clvza/iuR1VsNREYq6JiByn196MwLZ/ftVk8FAoGsTQ==
X-Received: by 2002:a17:903:2f0e:b0:272:a900:c42b with SMTP id d9443c01a7336-290273ef03dmr293434895ad.31.1760416146825;
        Mon, 13 Oct 2025 21:29:06 -0700 (PDT)
Received: from [10.133.33.138] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f56c04sm149462735ad.110.2025.10.13.21.29.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 21:29:06 -0700 (PDT)
Message-ID: <e9813a47-c40b-475a-8faf-de0811c9066e@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 12:28:58 +0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] dt-bindings: remoteproc: qcom,pas: Document pas for
 Kaanapali SoCCP
To: Krzysztof Kozlowski <krzk@kernel.org>,
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
 <20250924-knp-remoteproc-v1-4-611bf7be8329@oss.qualcomm.com>
 <a8796335-bec3-4c1f-afea-b5b7909d8ba3@kernel.org>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <a8796335-bec3-4c1f-afea-b5b7909d8ba3@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mCbX69FXNfHZNGCqBKZN2kx2e4e0nV1I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAyMiBTYWx0ZWRfX/2p4GYWXw6py
 hVNwfJGMqDos/DqZqSSqZg+xghYuvUFQArBaYC9jVKkB7sMHkBvK0gGabu3hU3QINe8B9p5eBqk
 +X2q+zDFqt4iH81qXkiFRmKGLv3gjeO0uYdlPnv8ByZheF12BwBDKFS9QIMPMTGnry0JYmtS409
 SSf2v/tWhXnXOeKpDXOWwxl2I9l16Ce45EmmOcNO7Kn4zyQ472T6uDQm8VaX0u9zXaY5F48hdS/
 tVPDweIOjRG5fUDSRry95InoH9NpkwI9o2DehQN2LL//5JXQ64JAdP+yAc8QbkcoYTCBHku9ZWL
 vwoztTZcpv+roz77WRFMqjtQDq0DySPEcGt6n3mC9JaMZih3EZMVbPaBULzxSAM5Szjvq7/QAnl
 H1Ybw9NN6uJMz1XMCr58fY8wDIj9fA==
X-Authority-Analysis: v=2.4 cv=SfD6t/Ru c=1 sm=1 tr=0 ts=68edd195 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yaF9TFSo-8KvDqLiQccA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: mCbX69FXNfHZNGCqBKZN2kx2e4e0nV1I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_09,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130022



On 10/9/2025 6:27 PM, Krzysztof Kozlowski wrote:
> On 25/09/2025 08:37, Jingyi Wang wrote:
>> +
>> +  glink-edge:
>> +    $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
>> +    unevaluatedProperties: false
>> +    description: |
> 
> Drop |
> 
> 

Will fix

>> +      Qualcomm G-Link subnode which represents communication edge, channels
>> +      and devices related to the Remoteproc.
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - memory-region
>> +  - clocks
>> +  - clock-names
>> +  - interrupts
>> +  - interrupt-names
>> +  - qcom,smem-states
>> +  - qcom,smem-state-names
>> +
>> +unevaluatedProperties: false
> 
> That's wrong in this context. But if you add missing (and corrected
> pas-common) then it would make sense.
> 

Sorry I didn't get this point, could you make it more clear?

The property for Kaanapali SoCCP doesn't follow qcom,pas-common.yaml
(the interrupts are different) so it was not included here, like
"qcom,qcs404-cdsp-pil.yaml"

So I think just adding the missing "power-domains","power-domain-names"
under "required" will be okay?

Thanks,
Jingyi

> 
> Best regards,
> Krzysztof


