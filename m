Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AC746D0A0
	for <linux-remoteproc@vger.kernel.org>; Mon,  5 Oct 2026 09:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791193838; cv=none; b=Wlrljw0AqCXWdOWtBbHX+7NMRKoubwmiZ0zNFnU1QuWQQ/cgnOZpoQxo93GTeALzQX0RuL0/mckCYfwp56MS50ru5Ne2sVb3qkFbBS3WsdKkRIgzAjZT/HsaX0RyH5V+e84L78H7jQgLVjDtW04ADvRfCeS4u+7TZfNtIOEMChM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791193838; c=relaxed/simple;
	bh=JbK2XciOCAGYGhh2WwFKNXGA0zTsF0JZw6rU+WHZCk8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uTiFF2IKyqxsriIAxkOFnjLazInzwL/sH2m4jiX1ph0M9uAVLXNZ2QKjcxr7X0/TJOOlFdXurSrPtTDj97g1Vsd/MjfI1Vccmi03lHmPvIzCmZ6jQ0FRIQcnnkznZOJtdGkpH9G6Gcc/pGQOR19v3zWKvlJqtSGrjVRmSfYyDTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m3iitKEd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AzSgbiGu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m3iitKEd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AzSgbiGu"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6958xQnU493619
	for <linux-remoteproc@vger.kernel.org>; Mon, 5 Oct 2026 09:50:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9yVrXwIWJyocR1tAJIhOeeUu2pEhXOkwQN59FJ7DNeY=; b=m3iitKEdTX/pVTGo
	uUcpOEJe3bY/VPfBt3uSLAm6zg1kRHO0AHLTCTXe8J8r73ynnZBJtzJrM6E0JgsP
	495uwzdnV4ycOpbJ3hVKWubpo2IT5/VTtTWPJEiKVOSg5wvm1AZQLYIFu3DI3l4F
	PngAUyq1zI9G3o2TLAMj7f2BOPfsPcLUDI3fbjTwO7EAHnG0vK0KNTOXPRLYteQX
	4pVIRx48Xco+TxfpBkYtPpBh+tMcAAr1vBkl2h2H928ukwMv3HwTnpoRABxyuE53
	ALN7AvhW+pGP72JhAWi63OueSIAWGwb5o5dqiCrb+c0N6ctL0jCaI+K24aqaBwhA
	uSknxw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3chfk7ab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 05 Oct 2026 09:50:33 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39de4a68f7cso1270411a91.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 05 Oct 2026 02:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791193832; x=1791798632; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9yVrXwIWJyocR1tAJIhOeeUu2pEhXOkwQN59FJ7DNeY=;
        b=AzSgbiGukSsAgKxhD4Y1q1+pxxDxBQIucb0IAKIFQYQilJt8CpSZGxnFP4F8TuGp6j
         yFAtOGJHKbsGqlpj5fi1gtweb9QuA5YIzxGEkDxSAJFw7+sV7rChvqoh8rOSh832TE9+
         Y1t9r6nnbgab9avCUV/pe7iTXqeDXbxbkD5uOss6Vc8uPqTi7xzyfx4vKmxEyVsgwPDG
         kmXbXYFvS1uJtw4xzKVQ86JdN6eSSb9D0yEAVg1kUqtLbYRVcKDb5Vi64LCS4mJ69QAA
         cS9GJsij1xvT15qPJL3J3QDqTfTk3QTT9M0e6RWO4FuVR5bVmgdFXirlErSTufY+xXns
         JBGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791193832; x=1791798632;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9yVrXwIWJyocR1tAJIhOeeUu2pEhXOkwQN59FJ7DNeY=;
        b=UpP6zl6FPMMa9/J8245enJfylyLG2UHO9U0oVar4G9iWFdPeYbmNlHZtTq+k0VeDJg
         /KerpSGxUzjALJ7hrYo6n7k8SkJWbzO1kxrw8w22ipZp+C7oZqDodT+2KhmJO3Cx5KYb
         N9rMbFTEpQwyRCmj26gtLoxWXlbg5luMm9vfwNIj2YhcRBmItPonub2zSlXXRF8VC0/a
         67/piWnAXBSmwurUovK0GVo2rT8/9MHVUtAr/x24IffyMkbY5D07Sv3YuFtwA0rsqU3W
         HlqG9ljILGCEq1aIOCALFkv6u/2GbhsPtYTqW8sEhrdARnyfYfs8Lq1iBz/83GZHY2Xp
         Fv5A==
X-Forwarded-Encrypted: i=1; AKwUvBzR322iFrW026NyonToq/KaKZIKForVKuJR7de71sPWNbvTewizqmgyuKjAwglPaTyPKClPLIsFT7Ez0+Ww7Q9e@vger.kernel.org
X-Gm-Message-State: AFq9FYKNlCkOFHHTnZpex+enFSa/Zn0Ri/USFPLqWJQelpXWfBeU67mh
	qqkLe2h14/m70N3nVhu6309as+8yaH6+lZr3zeO1hCOs1Bv+aYc4/aWKnD+2UZCEmMpr7SHZTGs
	PnIL2nj+r6x01XN7wjiwumJD05+b42V3VN4l7L021qGt5P2JjIuroO64dsuJXWS6UoF0xpeZS
X-Gm-Gg: AYBFou0kYroOr7c/1c0ZiD2pnDS/WpuP3r2OYgGzElVXKziZDKCa2kUuq8SRq3eZGGL
	Roty7L7dnQvgAO3Sx4f6tK/KoOWMMqMV+g3RtkPpEg0tFQkicGkAkS1aRIFws1dbh6csDJR8ZN2
	Js0o0guW8hM5yjI8TbcgKG/eOPKdI2JpI6dyw6M9fZNUyPGRuuRE2PM9//QI2hTyRMuVwj/HdMY
	AEYIxXAVebWHwcJcMhaId+YVw9+9izVXJvjGSNYHfNS0o5XJre15hbETvaMyBZBWOijFvcSJjUq
	LxulvehferW5hIg4ebhvNUSWv9PNI4A1ksNu3HS8eTCUOED8GbuuIo+YzuoYE0EidVvaJQr/NYe
	MhyXjWlRKmOliXBIncZkPrIHDC7Q=
X-Received: by 2002:a17:90b:1346:b0:3a0:ace4:d2b4 with SMTP id 98e67ed59e1d1-3a6ceaf84a3mr3933993a91.23.1791193832041;
        Mon, 05 Oct 2026 02:50:32 -0700 (PDT)
X-Received: by 2002:a17:90b:1346:b0:3a0:ace4:d2b4 with SMTP id 98e67ed59e1d1-3a6ceaf84a3mr3933979a91.23.1791193831490;
        Mon, 05 Oct 2026 02:50:31 -0700 (PDT)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e4a1bfesm11565317a91.12.2026.10.05.02.50.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 02:50:31 -0700 (PDT)
Message-ID: <9f049a54-96cc-485d-85c1-58ee3c1cbd2a@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 15:20:24 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: qcom: Relax PAS iommus
 item limit
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
References: <20260930-shikra-el2-v2-0-f0822be5aaee@oss.qualcomm.com>
 <20260930-shikra-el2-v2-1-f0822be5aaee@oss.qualcomm.com>
 <20261001-ordinary-cheerful-velociraptor-80c793@quoll>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20261001-ordinary-cheerful-velociraptor-80c793@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: V7xIwgjONyDp7CaqKtVHazjbWY9fO9IZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAzOSBTYWx0ZWRfX8N8ixM0j0+mQ
 E3TcNVQum70bCudRQf7Y2KBR0bSVK/yIJOR8NcSABAYRNySKaJRH8KRKCHhkpjlbJ1+gPbfnuQ6
 a2AWmz94bDr+JSVA9UVnMGyaTeZjisw=
X-Authority-Analysis: v=2.4 cv=eZSo7LEH c=1 sm=1 tr=0 ts=6ac372e9 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=CHHwcf0ky9qZlHHGEQsA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: V7xIwgjONyDp7CaqKtVHazjbWY9fO9IZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAzOSBTYWx0ZWRfX0avvJSnGyZoR
 tZM5SiRSggjbWWPENRAxNFEZ5u1NdX/1ppSAcRv/dItrqHfgMWeYyulhG+40u0dfndeulUHl8T4
 0laQogWTEIQAeM0iyT53IW6onlrepkm7CUBB1mdZPn/AwVx6L5sYkWskIVyynv9lNGejvaQ3LLD
 LqMGPWP3aiaTA2CpYyGJYF2sc9SteB7TODUh/w5C1ul4iZW7BQBdwuFfY7t3uZyTVklfa3N3XR/
 uKZiStDD414xfv9koqHUGl4IS43AlWaPkoNPxvwF6hDMylWM0lk+CvURZ7MK+DUl8eKXOqM+kl7
 MMUMMQDEeAHFzUuWvaF10RDpDjs1f+wK7fD0AdIgMF/3iV0ogRrf4CkpGKovM2Rs+qqMvu31hPo
 3P/JgUnciuZDu9zDBLrXREPn0KfYQsRMDNi0aCFQSQyd8oDCBc7zv1juGjxS1dSmh2EZ1rc5EbS
 0cB+4zHrqAh3QnUXXJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610050039

On 10/1/2026 2:03 PM, Krzysztof Kozlowski wrote:
> On Wed, Sep 30, 2026 at 05:19:03PM +0530, Komal Bajaj wrote:
>> Some PAS users require more than one IOMMU mapping. Update
>> qcom,pas-common.yaml to allow up to three iommus entries so
>> PAS bindings can represent multi-stream mappings used by
>> platform device trees and avoid dt-schema array length failures.
> This is incomplete. You just added two more iommus to all devices. You
> need constraints and proper user of this.

I see your point. This change relaxes constraint for all targets, which 
is broader than intended.
I will rework this and add required Shikra specific constraints in next 
revision.

Thanks
Komal

>
> Best regards,
> Krzysztof
>

